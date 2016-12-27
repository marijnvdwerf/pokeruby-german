	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_804373C
sub_804373C: @ 8043A60
	movs r0, 0x9
	bx lr
	thumb_func_end sub_804373C

	thumb_func_start sub_8043740
sub_8043740: @ 8043A64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r7, r1, 0
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	movs r3, 0
	movs r2, 0
_08043A80:
	lsls r0, r3, 24
	asrs r0, 24
	mov r3, sp
	adds r1, r3, r0
	strb r2, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08043A80
	movs r3, 0x3
	movs r0, 0x1
	negs r0, r0
	mov r9, r0
	mov r8, sp
_08043AA0:
	lsls r0, r5, 16
	asrs r6, r0, 16
	cmp r6, 0
	ble _08043ACE
	lsls r4, r3, 24
	asrs r4, 24
	mov r1, sp
	adds r5, r1, r4
	adds r0, r6, 0
	movs r1, 0xA
	bl __modsi3
	strb r0, [r5]
	adds r0, r6, 0
	movs r1, 0xA
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	subs r4, 0x1
	lsls r4, 24
	lsrs r3, r4, 24
	b _08043AA0
_08043ACE:
	lsls r1, r3, 24
	asrs r0, r1, 24
	cmp r0, r9
	ble _08043AF2
	movs r4, 0xFF
	movs r3, 0x1
	negs r3, r3
_08043ADC:
	asrs r2, r1, 24
	mov r5, sp
	adds r1, r5, r2
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	subs r2, 0x1
	lsls r1, r2, 24
	asrs r0, r1, 24
	cmp r0, r3
	bgt _08043ADC
_08043AF2:
	mov r1, r8
	ldrb r0, [r1, 0x3]
	cmp r0, 0xFF
	bne _08043AFE
	movs r0, 0
	strb r0, [r1, 0x3]
_08043AFE:
	mov r2, r10
	cmp r2, 0
	bne _08043B8E
	movs r3, 0
	movs r1, 0
	movs r6, 0xFC
	lsls r6, 8
	movs r5, 0x1E
	mov r12, r5
_08043B10:
	lsls r1, 24
	asrs r2, r1, 24
	mov r0, sp
	adds r5, r0, r2
	ldrb r0, [r5]
	mov r8, r1
	cmp r0, 0xFF
	bne _08043B46
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r2, r12
	orrs r0, r2
	strh r0, [r1]
	lsls r3, 24
	asrs r1, r3, 23
	adds r1, r7
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	mov r5, r12
	orrs r0, r5
	strh r0, [r1]
	b _08043B76
_08043B46:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	lsls r4, r3, 24
	asrs r3, r4, 24
	lsls r2, r3, 1
	adds r2, r7
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r6, 0
	ands r1, r0
	mov r5, sp
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
	adds r3, r4, 0
_08043B76:
	movs r0, 0x80
	lsls r0, 17
	add r0, r8
	lsrs r1, r0, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r3, r2
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08043B10
	b _08043BF2
_08043B8E:
	movs r3, 0
	movs r4, 0xFC
	lsls r4, 8
	movs r6, 0x1E
_08043B96:
	lsls r1, r3, 24
	asrs r2, r1, 24
	mov r3, sp
	adds r5, r3, r2
	ldrb r0, [r5]
	adds r3, r1, 0
	cmp r0, 0xFF
	bne _08043BC2
	lsls r1, r2, 1
	adds r1, r7
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	adds r1, 0x40
	ldrh r2, [r1]
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r6
	strh r0, [r1]
	b _08043BE4
_08043BC2:
	lsls r2, 1
	adds r2, r7
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x14
	orrs r1, r0
	strh r1, [r2]
	adds r2, 0x40
	ldrh r0, [r2]
	adds r1, r4, 0
	ands r1, r0
	ldrb r0, [r5]
	adds r0, 0x34
	orrs r1, r0
	strh r1, [r2]
_08043BE4:
	movs r5, 0x80
	lsls r5, 17
	adds r0, r3, r5
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08043B96
_08043BF2:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8043740

	thumb_func_start unref_sub_80438E0
unref_sub_80438E0: @ 8043C04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	movs r1, 0x1E
	strh r1, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	adds r1, r5, 0
	movs r2, 0
	bl sub_8043740
	lsls r4, 16
	asrs r4, 16
	adds r5, 0xA
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_8043740
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80438E0

	thumb_func_start battle_make_oam_normal_battle
battle_make_oam_normal_battle: @ 8043C38
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	movs r0, 0
	str r0, [sp]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08043D4C
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08043CD0
	ldr r4, _08043CC0
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08043CC4
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r3, 0x3F
	adds r0, r3, 0
	ands r0, r2
	strb r0, [r1, 0x1]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r4
	ldrb r0, [r2, 0x1]
	ands r3, r0
	strb r3, [r2, 0x1]
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x40
	ldr r4, _08043CC8
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _08043CCC
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	b _08043D16
	.align 2, 0
_08043CC0: .4byte gSpriteTemplate_820A4EC
_08043CC4: .4byte gSprites
_08043CC8: .4byte 0x000003ff
_08043CCC: .4byte 0xfffffc00
_08043CD0:
	ldr r4, _08043D38
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _08043D3C
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r2, r0
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043D40
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043D44
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	movs r0, 0x2
	str r0, [sp]
_08043D16:
	ldr r2, _08043D3C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r2
	strh r7, [r0, 0x6]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r1, r0, r2
	strh r6, [r1, 0x38]
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _08043D48
	str r1, [r0]
	b _08043E74
	.align 2, 0
_08043D38: .4byte gSpriteTemplate_820A51C
_08043D3C: .4byte gSprites
_08043D40: .4byte 0x000003ff
_08043D44: .4byte 0xfffffc00
_08043D48: .4byte sub_8043D5C
_08043D4C:
	mov r0, r10
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08043DF0
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08043DDC
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08043DE0
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043DE4
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043DE8
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08043DEC
	str r0, [r2]
	movs r0, 0x1
	b _08043E72
	.align 2, 0
_08043DDC: .4byte gSpriteTemplate_820A4EC
_08043DE0: .4byte gSprites
_08043DE4: .4byte 0x000003ff
_08043DE8: .4byte 0xfffffc00
_08043DEC: .4byte sub_8043D5C
_08043DF0:
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r4, _08043F38
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r10
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 25
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r4, _08043F3C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r4
	strh r7, [r0, 0x6]
	lsls r2, r7, 4
	adds r2, r7
	lsls r2, 2
	adds r3, r2, r4
	strh r6, [r3, 0x38]
	ldrh r1, [r3, 0x4]
	mov r8, r1
	mov r5, r8
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r5, _08043F40
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _08043F44
	mov r5, r8
	ands r0, r5
	orrs r0, r1
	strh r0, [r3, 0x4]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _08043F48
	str r0, [r2]
	movs r0, 0x2
_08043E72:
	str r0, [sp]
_08043E74:
	ldr r0, _08043F4C
	add r0, r10
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	ldr r1, _08043F50
	adds r0, r1
	movs r1, 0x8C
	movs r2, 0x3C
	movs r3, 0
	bl CreateSpriteAtEnd
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r1, _08043F3C
	mov r8, r1
	add r4, r8
	mov r0, r10
	bl battle_side_get_owner
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 21
	ldr r0, _08043F54
	adds r1, r0
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r2, r4, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r2, 0x4
	mov r9, r2
	mov r1, r9
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0x1
	bl sub_8043CDC
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08043F58
	adds r1, r2
	ldr r2, _08043F5C
	bl CpuSet
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	strh r5, [r0, 0x38]
	mov r2, r10
	strh r2, [r0, 0x3A]
	adds r0, 0x3E
	ldrb r1, [r0]
	mov r5, r9
	orrs r1, r5
	strb r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	add r0, r8
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	strh r6, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x3A]
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r5
	strb r0, [r4]
	adds r0, r6, 0
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043F38: .4byte gSpriteTemplate_820A51C
_08043F3C: .4byte gSprites
_08043F40: .4byte 0x000003ff
_08043F44: .4byte 0xfffffc00
_08043F48: .4byte sub_8043D5C
_08043F4C: .4byte gUnknown_02024A72
_08043F50: .4byte gSpriteTemplate_820A56C
_08043F54: .4byte gSubspriteTables_820A684
_08043F58: .4byte 0x06010000
_08043F5C: .4byte 0x04000010
	thumb_func_end battle_make_oam_normal_battle

	thumb_func_start battle_make_oam_safari_battle
battle_make_oam_safari_battle: @ 8043F60
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r4, _08043FEC
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r0, r4, 0
	movs r1, 0xF0
	movs r2, 0xA0
	movs r3, 0x1
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08043FF0
	mov r9, r1
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	ldrb r3, [r4, 0x1]
	movs r2, 0x3F
	adds r1, r2, 0
	ands r1, r3
	strb r1, [r4, 0x1]
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	mov r7, r9
	adds r5, r3, r7
	ldrb r1, [r5, 0x1]
	ands r2, r1
	strb r2, [r5, 0x1]
	ldrh r1, [r5, 0x4]
	mov r8, r1
	mov r7, r8
	lsls r2, r7, 22
	lsrs r2, 22
	adds r2, 0x40
	ldr r7, _08043FF4
	adds r1, r7, 0
	ands r2, r1
	ldr r1, _08043FF8
	mov r7, r8
	ands r1, r7
	orrs r1, r2
	strh r1, [r5, 0x4]
	strh r0, [r4, 0x6]
	strh r6, [r5, 0x38]
	movs r0, 0x1C
	add r9, r0
	add r3, r9
	ldr r0, _08043FFC
	str r0, [r3]
	adds r0, r6, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08043FEC: .4byte gSpriteTemplate_820A54C
_08043FF0: .4byte gSprites
_08043FF4: .4byte 0x000003ff
_08043FF8: .4byte 0xfffffc00
_08043FFC: .4byte sub_8043D5C
	thumb_func_end battle_make_oam_safari_battle

	thumb_func_start sub_8043CDC
sub_8043CDC: @ 8044000
	lsls r0, 24
	lsrs r0, 19
	ldr r1, _0804400C
	adds r0, r1
	bx lr
	.align 2, 0
_0804400C: .4byte gUnknown_08D1216C
	thumb_func_end sub_8043CDC

	thumb_func_start sub_8043CEC
sub_8043CEC: @ 8044010
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08044040
	cmp r0, 0x1
	bgt _08044054
	cmp r0, 0
	bne _08044054
	ldr r2, _0804403C
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _08044062
	.align 2, 0
_0804403C: .4byte gSprites
_08044040:
	ldr r2, _08044050
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x10
	b _08044062
	.align 2, 0
_08044050: .4byte gSprites
_08044054:
	ldr r2, _0804407C
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0x8
_08044062:
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r4, 0x22]
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	strh r1, [r4, 0x24]
	ldrh r0, [r0, 0x26]
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804407C: .4byte gSprites
	thumb_func_end sub_8043CEC

	thumb_func_start sub_8043D5C
sub_8043D5C: @ 8044080
	ldrh r1, [r0, 0x38]
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080440A4
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrh r1, [r2, 0x20]
	adds r1, 0x40
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x22]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x24]
	strh r1, [r0, 0x24]
	ldrh r1, [r2, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080440A4: .4byte gSprites
	thumb_func_end sub_8043D5C

	thumb_func_start sub_8043D84
sub_8043D84: @ 80440A8
	push {r4,r5,lr}
	ldr r5, [sp, 0xC]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 2
	ldr r0, _080440CC
	adds r4, r0
	strb r1, [r4]
	str r2, [r4, 0x4]
	str r3, [r4, 0x8]
	str r5, [r4, 0xC]
	ldr r0, _080440D0
	str r0, [r4, 0x10]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080440CC: .4byte 0x02017850
_080440D0: .4byte 0xffff8000
	thumb_func_end sub_8043D84

	thumb_func_start sub_8043DB0
sub_8043DB0: @ 80440D4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0804411C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804411C: .4byte gSprites
	thumb_func_end sub_8043DB0

	thumb_func_start sub_8043DFC
sub_8043DFC: @ 8044120
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08044170
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	adds r4, r2, 0
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r3, 0x5
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x38
	ldrsh r1, [r2, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r4, [r0]
	adds r1, r3, 0
	ands r1, r4
	strb r1, [r0]
	ldrh r1, [r2, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r3, r1
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044170: .4byte gSprites
	thumb_func_end sub_8043DFC

	thumb_func_start sub_8043E50
sub_8043E50: @ 8044174
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08044190
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r3, r4
	strh r1, [r3, 0x20]
	strh r2, [r3, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044190: .4byte gSprites
	thumb_func_end sub_8043E50

	thumb_func_start unref_sub_8043E70
unref_sub_8043E70: @ 8044194
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080441D0
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r5
	ldrh r1, [r4, 0x6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
	adds r0, r4, 0
	bl DestroySprite
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080441D0: .4byte gSprites
	thumb_func_end unref_sub_8043E70

	thumb_func_start nullsub_11
nullsub_11: @ 80441D4
	bx lr
	thumb_func_end nullsub_11

	thumb_func_start sub_8043EB4
sub_8043EB4: @ 80441D8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	ldr r1, _0804425C
	mov r8, r1
	ldrb r2, [r1]
	cmp r6, r2
	bge _08044250
	ldr r1, _08044260
	mov r12, r1
	movs r1, 0x3
	ands r0, r1
	lsls r5, r0, 2
	movs r7, 0xD
	negs r7, r7
	ldr r2, _08044264
	mov r9, r2
_08044202:
	mov r1, r9
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	ldrb r4, [r1, 0x6]
	ldrh r3, [r1, 0x38]
	lsls r3, 24
	lsrs r3, 24
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	add r1, r12
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	adds r6, 0x1
	mov r2, r8
	ldrb r2, [r2]
	cmp r6, r2
	blt _08044202
_08044250:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804425C: .4byte gUnknown_02024A68
_08044260: .4byte gSprites
_08044264: .4byte gUnknown_03004340
	thumb_func_end sub_8043EB4

	thumb_func_start sub_8043F44
sub_8043F44: @ 8044268
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r4, 0
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08044294
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0804428E
	movs r5, 0x2C
	movs r4, 0x1E
	b _080442CC
_0804428E:
	movs r5, 0x9E
	movs r4, 0x58
	b _080442CC
_08044294:
	adds r0, r6, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080442C2
	cmp r0, 0x1
	bgt _080442AC
	cmp r0, 0
	beq _080442B6
	b _080442CC
_080442AC:
	cmp r0, 0x2
	beq _080442BC
	cmp r0, 0x3
	beq _080442C8
	b _080442CC
_080442B6:
	movs r5, 0x9F
	movs r4, 0x4D
	b _080442CC
_080442BC:
	movs r5, 0xAB
	movs r4, 0x66
	b _080442CC
_080442C2:
	movs r5, 0x2C
	movs r4, 0x13
	b _080442CC
_080442C8:
	movs r5, 0x20
	movs r4, 0x2C
_080442CC:
	ldr r0, _080442E0
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8043E50
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080442E0: .4byte gUnknown_03004340
	thumb_func_end sub_8043F44

	thumb_func_start sub_8043FC0
sub_8043FC0: @ 80442E4
	push {r4-r7,lr}
	sub sp, 0x20
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _08044324
	mov r0, sp
	movs r2, 0x1E
	bl memcpy
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08044334
	ldr r1, _08044328
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r7, _0804432C
	cmp r0, 0
	bne _08044352
	ldr r7, _08044330
	b _08044352
	.align 2, 0
_08044324: .4byte gUnknown_0820A81C
_08044328: .4byte gSprites
_0804432C: .4byte gUnknown_0820A80C
_08044330: .4byte gUnknown_0820A804
_08044334:
	ldr r1, _08044364
	lsls r4, r5, 4
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r7, _08044368
	cmp r0, 0
	bne _08044352
	ldr r7, _0804436C
_08044352:
	mov r3, sp
	adds r3, 0x6
	cmp r6, 0x64
	bne _08044370
	adds r0, r3, 0
	movs r1, 0x64
	movs r2, 0
	movs r3, 0x3
	b _080443B0
	.align 2, 0
_08044364: .4byte gSprites
_08044368: .4byte gUnknown_0820A80C
_0804436C: .4byte gUnknown_0820A814
_08044370:
	movs r1, 0xFC
	strb r1, [r3]
	mov r3, sp
	adds r3, 0x7
	movs r0, 0x11
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x1
	strb r0, [r3]
	adds r3, 0x1
	strb r1, [r3]
	adds r3, 0x1
	movs r2, 0x14
	strb r2, [r3]
	adds r3, 0x1
	movs r0, 0x4
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0xAD
	strb r0, [r3]
	adds r3, 0x1
	strb r1, [r3]
	adds r3, 0x1
	strb r2, [r3]
	adds r3, 0x1
	movs r0, 0
	strb r0, [r3]
	adds r3, 0x1
	adds r0, r3, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
_080443B0:
	bl ConvertIntToDecimalStringN
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0x13
	strb r0, [r3]
	adds r3, 0x1
	movs r0, 0xF
	strb r0, [r3]
	movs r0, 0xFF
	strb r0, [r3, 0x1]
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	ldr r1, _08044404
	adds r0, r4, r5
	lsls r0, 2
	adds r6, r0, r1
	ldr r5, _08044408
	movs r4, 0x2
_080443E0:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _0804440C
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080443E0
	add sp, 0x20
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044404: .4byte gSprites
_08044408: .4byte 0x02000020
_0804440C: .4byte 0x04000008
	thumb_func_end sub_8043FC0

	thumb_func_start sub_80440EC
sub_80440EC: @ 8044410
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	ldr r1, _08044468
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _0804446C
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x3A
	ldrsh r5, [r4, r0]
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0804445A
	lsls r0, r5, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08044470
_0804445A:
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r7, 0
	mov r2, r8
	bl sub_8044210
	b _08044514
	.align 2, 0
_08044468: .4byte gUnknown_0820A864
_0804446C: .4byte gSprites
_08044470:
	mov r5, sp
	adds r5, 0x6
	mov r0, r8
	cmp r0, 0
	bne _080444B4
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _080444AC
	cmp r0, 0
	bne _0804448E
	ldr r4, _080444B0
_0804448E:
	movs r0, 0x3
	mov r8, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0x13
	movs r3, 0x1
	bl sub_8003504
	adds r5, r0, 0
	movs r0, 0xBA
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	b _080444DA
	.align 2, 0
_080444AC: .4byte gUnknown_0820A848
_080444B0: .4byte gUnknown_0820A83C
_080444B4:
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r4, _08044520
	cmp r0, 0
	bne _080444C8
	ldr r4, _08044524
_080444C8:
	movs r0, 0x2
	mov r8, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r5, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8003504
_080444DA:
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	mov r0, r8
	cmp r0, 0
	beq _08044514
	ldr r1, _08044528
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	adds r6, r0, r1
	adds r7, r4, 0
	ldr r5, _0804452C
	mov r4, r8
_080444FA:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _08044530
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _080444FA
_08044514:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044520: .4byte gUnknown_0820A85C
_08044524: .4byte gUnknown_0820A854
_08044528: .4byte gSprites
_0804452C: .4byte 0x02000020
_08044530: .4byte 0x04000008
	thumb_func_end sub_80440EC

	thumb_func_start sub_8044210
sub_8044210: @ 8044534
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r6, r1, 16
	mov r9, r6
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _080445A0
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _080445A4
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	mov r8, r0
	movs r1, 0x3A
	ldrsh r4, [r0, r1]
	lsls r0, r4, 2
	ldr r1, _080445A8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08044636
	mov r2, sp
	adds r2, 0x6
	cmp r7, 0
	bne _080445B0
	ldr r7, _080445AC
	movs r0, 0x6
	mov r10, r0
	lsls r1, r6, 16
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0x2B
	movs r3, 0x1
	bl sub_8003504
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	movs r0, 0xFF
	strb r0, [r2, 0x1]
	b _080445F2
	.align 2, 0
_080445A0: .4byte gUnknown_0820A89C
_080445A4: .4byte gSprites
_080445A8: .4byte 0x02017800
_080445AC: .4byte gUnknown_0820A87C
_080445B0:
	ldr r7, _08044648
	movs r1, 0x2
	mov r10, r1
	mov r0, r9
	lsls r1, r0, 16
	asrs r1, 16
	adds r0, r2, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8003504
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080445F2
	movs r0, 0x74
	bl sub_8043CDC
	mov r2, r8
	ldrh r1, [r2, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0xD0
	lsls r2, 3
	adds r1, r2
	ldr r2, _0804464C
	adds r1, r2
	ldr r2, _08044650
	bl CpuSet
_080445F2:
	ldr r6, _08044654
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r6
	movs r1, 0x38
	ldrsh r4, [r0, r1]
	movs r0, 0x80
	lsls r0, 18
	mov r1, sp
	bl sub_80034D4
	mov r2, r10
	cmp r2, 0
	beq _08044636
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r6, r0, r6
	ldr r5, _08044658
	mov r4, r10
_0804461C:
	ldrh r0, [r6, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldm r7!, {r1}
	adds r1, r0
	adds r0, r5, 0
	ldr r2, _08044650
	bl CpuSet
	adds r5, 0x40
	subs r4, 0x1
	cmp r4, 0
	bne _0804461C
_08044636:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044648: .4byte gUnknown_0820A894
_0804464C: .4byte 0x06010000
_08044650: .4byte 0x04000008
_08044654: .4byte gSprites
_08044658: .4byte 0x02000020
	thumb_func_end sub_8044210

	thumb_func_start sub_8044338
sub_8044338: @ 804465C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x14]
	ldr r1, _080446F0
	mov r0, sp
	movs r2, 0x14
	bl memcpy
	ldr r1, _080446F4
	ldr r2, [sp, 0x14]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r3, _080446F8
	adds r6, r1, r3
	movs r0, 0x5
	mov r8, r0
	adds r0, r4, 0
	bl GetNature
	lsls r0, 24
	mov r4, sp
	adds r4, 0x6
	ldr r1, _080446FC
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	adds r0, r6, 0
	mov r1, sp
	bl sub_80034D4
	movs r7, 0x6
	movs r5, 0
	mov r1, sp
	adds r1, 0x9
	str r1, [sp, 0x1C]
_080446CE:
	mov r2, sp
	adds r0, r2, r7
	ldrb r1, [r0]
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _080446EC
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08044700
_080446EC:
	movs r0, 0x2C
	b _0804471E
	.align 2, 0
_080446F0: .4byte gUnknown_0820A864
_080446F4: .4byte gSprites
_080446F8: .4byte 0x02000520
_080446FC: .4byte gNatureNames
_08044700:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _08044718
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0804471C
_08044718:
	movs r0, 0x2D
	b _0804471E
_0804471C:
	movs r0, 0x2B
_0804471E:
	bl sub_8043CDC
	lsls r1, r5, 6
	adds r1, r6, r1
	ldr r2, _0804481C
	bl CpuSet
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x1
	cmp r5, r8
	bcc _080446CE
	movs r7, 0x1
	ldr r3, [sp, 0x14]
	lsls r3, 4
	str r3, [sp, 0x18]
	movs r0, 0x1
	add r0, r8
	mov r9, r0
	cmp r7, r9
	bge _080447AA
	ldr r1, _08044820
	ldr r2, _0804481C
	mov r10, r2
	ldr r2, [sp, 0x14]
	adds r0, r3, r2
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_0804475A:
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _0804476A
	adds r5, r7, 0x7
_0804476A:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08044824
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r3, r8
	ldrh r0, [r3, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08044824
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _0804475A
_080447AA:
	ldr r6, _08044820
	ldr r3, [sp, 0x18]
	ldr r1, [sp, 0x14]
	adds r0, r3, r1
	lsls r0, 2
	adds r0, r6
	ldrh r5, [r0, 0x38]
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _08044828
	ldr r2, _0804482C
	adds r0, r4, r2
	ldrb r1, [r0]
	mov r0, sp
	adds r0, 0x6
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r3, _08044830
	adds r4, r3
	ldrb r1, [r4]
	ldr r0, [sp, 0x1C]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r1, sp
	movs r0, 0
	strb r0, [r1, 0x5]
	movs r0, 0xBA
	strb r0, [r1, 0x8]
	movs r0, 0x80
	lsls r0, 18
	bl sub_80034D4
	movs r7, 0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r5, r0, r6
	ldr r4, _08044834
_080447FE:
	cmp r7, 0x1
	bgt _08044838
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r0, r7, 0x2
	adds r1, r0
	lsls r1, 5
	ldr r0, _08044824
	adds r1, r0
	adds r0, r4, 0
	ldr r2, _0804481C
	bl CpuSet
	b _0804484E
	.align 2, 0
_0804481C: .4byte 0x04000008
_08044820: .4byte gSprites
_08044824: .4byte 0x06010000
_08044828: .4byte 0x02000000
_0804482C: .4byte 0x00016089
_08044830: .4byte 0x00016088
_08044834: .4byte 0x02000020
_08044838:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r7, r1
	lsls r1, 5
	ldr r2, _08044868
	adds r1, r2
	adds r0, r4, 0
	ldr r2, _0804486C
	bl CpuSet
_0804484E:
	adds r4, 0x40
	adds r7, 0x1
	cmp r7, 0x4
	ble _080447FE
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044868: .4byte 0x060100c0
_0804486C: .4byte 0x04000008
	thumb_func_end sub_8044338

	thumb_func_start sub_804454C
sub_804454C: @ 8044870
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r0, _08044990
	ldrb r0, [r0]
	cmp r8, r0
	blt _0804488A
	b _08044B08
_0804488A:
	ldr r1, _08044994
	mov r9, r1
	movs r2, 0x64
	mov r10, r2
	ldr r7, _08044998
_08044894:
	ldr r0, _0804499C
	mov r6, r8
	adds r5, r6, r0
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r1, r9
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _080449A0
	cmp r1, r0
	beq _080448B2
	b _08044AF8
_080448B2:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080448C6
	b _08044AF8
_080448C6:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080448DE
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080448DE
	b _08044AF8
_080448DE:
	mov r0, r8
	lsls r3, r0, 2
	ldr r0, _080449A4
	adds r3, r0
	ldr r0, [r3]
	lsls r0, 27
	lsrs r0, 31
	movs r2, 0x1
	eors r2, r0
	lsls r2, 4
	ldrb r0, [r3]
	movs r6, 0x11
	negs r6, r6
	adds r1, r6, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	ldr r0, [r3]
	lsls r0, 27
	lsrs r6, r0, 31
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08044A00
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0804491E
	b _08044AF8
_0804491E:
	ldr r0, _080449A8
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08044930
	b _08044AF8
_08044930:
	cmp r6, 0x1
	bne _080449B8
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r0, _080449AC
	adds r1, r0
	mov r0, sp
	ldr r2, _080449B0
	bl CpuSet
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _080449B4
	adds r0, r2
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8044210
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r6, r10
	muls r6, r0
	adds r0, r6, 0
	ldr r1, _080449B4
	b _08044A8A
	.align 2, 0
_08044990: .4byte gUnknown_02024A68
_08044994: .4byte gSprites
_08044998: .4byte gUnknown_02024A6A
_0804499C: .4byte gUnknown_03004340
_080449A0: .4byte SpriteCallbackDummy
_080449A4: .4byte 0x02017800
_080449A8: .4byte gUnknown_020239F8
_080449AC: .4byte 0x06010000
_080449B0: .4byte 0x05000040
_080449B4: .4byte gPlayerParty
_080449B8:
	ldrb r0, [r5]
	bl draw_status_ailment_maybe
	ldrb r0, [r5]
	ldrh r1, [r7]
	mov r2, r10
	muls r2, r1
	adds r1, r2, 0
	ldr r6, _080449F4
	adds r1, r6
	movs r2, 0x5
	bl sub_8045A5C
	movs r0, 0x75
	bl sub_8043CDC
	ldrb r2, [r5]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r9
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080449F8
	adds r1, r2
	ldr r2, _080449FC
	bl CpuSet
	b _08044AE2
	.align 2, 0
_080449F4: .4byte gPlayerParty
_080449F8: .4byte 0x06010680
_080449FC: .4byte 0x04000008
_08044A00:
	cmp r6, 0x1
	bne _08044AB0
	ldr r0, _08044A28
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08044A30
	ldrb r0, [r5]
	ldrh r1, [r7]
	mov r6, r10
	muls r6, r1
	adds r1, r6, 0
	ldr r2, _08044A2C
	adds r1, r2
	bl sub_8044338
	b _08044AE2
	.align 2, 0
_08044A28: .4byte gUnknown_020239F8
_08044A2C: .4byte gEnemyParty
_08044A30:
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r1, r0, 24
	str r2, [sp]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r6, _08044AA4
	adds r1, r6
	mov r0, sp
	ldr r2, _08044AA8
	bl CpuSet
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r2, _08044AAC
	adds r0, r2
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_8044210
	ldrb r4, [r5]
	ldrh r0, [r7]
	mov r6, r10
	muls r6, r0
	adds r0, r6, 0
	ldr r1, _08044AAC
_08044A8A:
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8044210
	b _08044AE2
	.align 2, 0
_08044AA4: .4byte 0x06010000
_08044AA8: .4byte 0x05000040
_08044AAC: .4byte gEnemyParty
_08044AB0:
	ldrb r0, [r5]
	bl draw_status_ailment_maybe
	ldrb r0, [r5]
	ldrh r1, [r7]
	movs r6, 0x64
	muls r1, r6
	ldr r4, _08044B18
	adds r1, r4
	movs r2, 0x5
	bl sub_8045A5C
	ldr r0, _08044B1C
	ldrh r1, [r0]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08044AE2
	ldrb r0, [r5]
	ldrh r1, [r7]
	muls r1, r6
	adds r1, r4
	movs r2, 0x4
	bl sub_8045A5C
_08044AE2:
	ldr r0, _08044B20
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	ldrh r1, [r0, 0x3C]
	movs r2, 0x1
	eors r1, r2
	strh r1, [r0, 0x3C]
_08044AF8:
	adds r7, 0x2
	movs r2, 0x1
	add r8, r2
	ldr r0, _08044B24
	ldrb r0, [r0]
	cmp r8, r0
	bge _08044B08
	b _08044894
_08044B08:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044B18: .4byte gEnemyParty
_08044B1C: .4byte gUnknown_020239F8
_08044B20: .4byte gUnknown_03004340
_08044B24: .4byte gUnknown_02024A68
	thumb_func_end sub_804454C

	thumb_func_start sub_8044804
sub_8044804: @ 8044B28
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	str r1, [sp, 0xC]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	adds r4, r2, 0
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	cmp r4, 0
	beq _08044B58
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _08044B9C
_08044B58:
	ldr r0, [sp, 0x8]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08044B78
	movs r7, 0
	movs r1, 0x88
	movs r2, 0x60
	movs r0, 0x64
	mov r8, r0
	ldr r5, _08044B74
	b _08044BA8
	.align 2, 0
_08044B74: .4byte 0x0000fffb
_08044B78:
	movs r7, 0x1
	cmp r4, 0
	beq _08044B88
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _08044B8E
_08044B88:
	movs r1, 0x68
	movs r2, 0x28
	b _08044B92
_08044B8E:
	movs r1, 0x68
	movs r2, 0x10
_08044B92:
	ldr r3, _08044B98
	mov r8, r3
	b _08044BA6
	.align 2, 0
_08044B98: .4byte 0x0000ff9c
_08044B9C:
	movs r7, 0x1
	movs r1, 0x68
	movs r2, 0x28
	ldr r5, _08044C54
	mov r8, r5
_08044BA6:
	movs r5, 0x5
_08044BA8:
	movs r6, 0
	str r6, [sp, 0x14]
	lsls r4, r7, 3
	ldr r0, _08044C58
	mov r10, r0
	lsls r3, r7, 1
	mov r9, r3
	lsls r1, 16
	str r1, [sp, 0x20]
	lsls r2, 16
	str r2, [sp, 0x24]
	ldr r2, _08044C5C
	ldr r1, [sp, 0xC]
	movs r6, 0x5
_08044BC4:
	ldrh r0, [r1]
	cmp r0, r2
	beq _08044BD8
	ldr r3, [sp, 0x14]
	lsls r0, r3, 24
	movs r3, 0x80
	lsls r3, 17
	adds r0, r3
	lsrs r0, 24
	str r0, [sp, 0x14]
_08044BD8:
	adds r1, 0x8
	subs r6, 0x1
	cmp r6, 0
	bge _08044BC4
	mov r6, r10
	adds r0, r4, r6
	bl LoadCompressedObjectPic
	ldr r0, _08044C60
	adds r0, r4, r0
	bl LoadSpriteSheet
	ldr r0, _08044C64
	adds r0, r4, r0
	bl LoadSpritePalette
	ldr r0, _08044C68
	adds r0, r4, r0
	bl LoadSpritePalette
	mov r1, r9
	adds r0, r1, r7
	lsls r0, 3
	ldr r1, _08044C6C
	adds r0, r1
	ldr r2, [sp, 0x20]
	asrs r1, r2, 16
	ldr r3, [sp, 0x24]
	asrs r2, r3, 16
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	lsls r0, 4
	ldr r6, [sp, 0x18]
	adds r0, r6
	lsls r0, 2
	ldr r1, _08044C70
	adds r4, r0, r1
	ldr r1, _08044C74
	adds r0, r4, 0
	bl SetSubspriteTables
	mov r0, r8
	strh r0, [r4, 0x24]
	strh r5, [r4, 0x2E]
	cmp r7, 0
	beq _08044C78
	ldrh r0, [r4, 0x20]
	subs r0, 0x60
	strh r0, [r4, 0x20]
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x3]
	b _08044C7E
	.align 2, 0
_08044C54: .4byte 0x0000ff9c
_08044C58: .4byte gUnknown_0820A754
_08044C5C: .4byte 0x0000ffff
_08044C60: .4byte gUnknown_0820A784
_08044C64: .4byte gUnknown_0820A764
_08044C68: .4byte gUnknown_0820A774
_08044C6C: .4byte gSpriteTemplate_820A7A4
_08044C70: .4byte gSprites
_08044C74: .4byte gSubspriteTables_820A6E4
_08044C78:
	ldrh r0, [r4, 0x20]
	adds r0, 0x60
	strh r0, [r4, 0x20]
_08044C7E:
	movs r6, 0
	ldr r1, _08044D28
	mov r10, r1
	mov r4, sp
	mov r2, r9
	adds r0, r2, r7
	lsls r0, 3
	str r0, [sp, 0x1C]
	movs r3, 0xA
	mov r9, r3
	mov r8, r6
_08044C94:
	ldr r0, _08044D2C
	ldr r5, [sp, 0x24]
	ldr r1, _08044D30
	adds r2, r5, r1
	ldr r3, [sp, 0x1C]
	adds r0, r3, r0
	ldr r5, [sp, 0x20]
	asrs r1, r5, 16
	asrs r2, 16
	movs r3, 0x9
	bl CreateSpriteAtEnd
	strb r0, [r4]
	ldr r0, [sp, 0x10]
	cmp r0, 0
	bne _08044CC4
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _08044D34
	adds r1, r2
	ldr r0, _08044D38
	str r0, [r1]
_08044CC4:
	ldr r5, _08044D28
	cmp r7, 0
	bne _08044CE2
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	strh r7, [r0, 0x26]
_08044CE2:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	mov r3, sp
	ldrh r3, [r3, 0x18]
	strh r3, [r0, 0x2E]
	cmp r7, 0
	bne _08044D3C
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrh r0, [r1, 0x20]
	adds r0, 0x18
	add r0, r8
	strh r0, [r1, 0x20]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x78
	b _08044D7A
	.align 2, 0
_08044D28: .4byte gSprites
_08044D2C: .4byte gSpriteTemplate_820A7D4
_08044D30: .4byte 0xfffc0000
_08044D34: .4byte 0x02020020
_08044D38: .4byte sub_8045180
_08044D3C:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x20]
	subs r3, 0x18
	movs r1, 0x5
	subs r1, r6
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	subs r3, r0
	strh r3, [r2, 0x20]
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	movs r1, 0x6
	subs r1, r6
	lsls r0, r1, 3
	subs r0, r1
	adds r0, 0xA
	strh r0, [r2, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08044DE8
_08044D7A:
	strh r1, [r0, 0x24]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r7, [r0, 0x32]
	adds r4, 0x1
	movs r2, 0x7
	add r9, r2
	movs r3, 0xA
	add r8, r3
	adds r6, 0x1
	cmp r6, 0x5
	bgt _08044D9A
	b _08044C94
_08044D9A:
	ldr r0, [sp, 0x8]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08044E82
	movs r6, 0
	ldr r5, _08044DEC
	mov r10, r5
	ldr r0, _08044DF0
	mov r9, r0
	ldr r7, _08044DF4
	ldr r1, _08044DF8
	mov r12, r1
	ldr r2, _08044DFC
	mov r8, r2
	mov r4, sp
	ldr r5, [sp, 0xC]
_08044DBE:
	mov r3, r10
	ldrh r1, [r3]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044E00
	ldrh r0, [r5]
	cmp r0, r9
	beq _08044E0A
	cmp r0, 0
	bne _08044E52
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044E6A
	.align 2, 0
_08044DE8: .4byte 0x0000ff88
_08044DEC: .4byte gUnknown_020239F8
_08044DF0: .4byte 0x0000ffff
_08044DF4: .4byte gSprites
_08044DF8: .4byte 0x000003ff
_08044DFC: .4byte 0xfffffc00
_08044E00:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08044E38
_08044E0A:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _08044E76
_08044E38:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08044E52
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044E6A
_08044E52:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _08044E76
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08044E6A:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08044E76:
	adds r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044DBE
	b _08044F5C
_08044E82:
	movs r6, 0
	ldr r1, _08044EC8
	mov r10, r1
	ldr r2, _08044ECC
	mov r9, r2
	ldr r7, _08044ED0
	ldr r3, _08044ED4
	mov r12, r3
	ldr r5, _08044ED8
	mov r8, r5
	ldr r5, [sp, 0xC]
	mov r4, sp
	adds r4, 0x5
_08044E9C:
	mov r0, r10
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08044EDC
	ldrh r0, [r5]
	cmp r0, r9
	beq _08044EE6
	cmp r0, 0
	bne _08044F2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044F46
	.align 2, 0
_08044EC8: .4byte gUnknown_020239F8
_08044ECC: .4byte 0x0000ffff
_08044ED0: .4byte gSprites
_08044ED4: .4byte 0x000003ff
_08044ED8: .4byte 0xfffffc00
_08044EDC:
	ldr r1, [sp, 0x14]
	lsls r0, r1, 24
	asrs r0, 24
	cmp r6, r0
	blt _08044F14
_08044EE6:
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x1
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r1, 0x1
	strh r1, [r0, 0x3C]
	b _08044F52
_08044F14:
	ldrh r0, [r5]
	cmp r0, 0
	bne _08044F2E
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x3
	b _08044F46
_08044F2E:
	ldr r0, [r5, 0x4]
	cmp r0, 0
	beq _08044F52
	ldrb r0, [r4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r7
	ldrh r3, [r2, 0x4]
	lsls r1, r3, 22
	lsrs r1, 22
	adds r1, 0x2
_08044F46:
	mov r0, r12
	ands r1, r0
	mov r0, r8
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, 0x4]
_08044F52:
	subs r4, 0x1
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044E9C
_08044F5C:
	ldr r0, _08044FBC
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _08044FC0
	lsls r3, r4, 2
	adds r1, r3, r4
	lsls r1, 3
	adds r0, r1, r2
	mov r5, sp
	ldrh r5, [r5, 0x8]
	strh r5, [r0, 0x8]
	mov r6, sp
	ldrh r6, [r6, 0x18]
	strh r6, [r0, 0xA]
	movs r6, 0
	adds r0, r2, 0
	adds r0, 0xE
	adds r1, r0
_08044F86:
	mov r5, sp
	adds r0, r5, r6
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _08044F86
	adds r0, r3, r4
	lsls r0, 3
	adds r0, r2
	ldrh r6, [r5, 0x10]
	strh r6, [r0, 0x1C]
	movs r0, 0x72
	movs r1, 0
	bl PlaySE12WithPanning
	adds r0, r4, 0
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08044FBC: .4byte TaskDummy
_08044FC0: .4byte gTasks
	thumb_func_end sub_8044804

	thumb_func_start sub_8044CA0
sub_8044CA0: @ 8044FC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _080450D8
	lsls r3, r0, 2
	adds r1, r3, r0
	lsls r1, 3
	adds r0, r1, r2
	ldrb r4, [r0, 0x1C]
	mov r9, r4
	ldrb r4, [r0, 0xA]
	mov r10, r4
	ldrb r0, [r0, 0x8]
	str r0, [sp, 0x8]
	movs r5, 0
	adds r7, r2, 0
	ldr r0, _080450DC
	mov r12, r0
	str r3, [sp, 0xC]
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r1, r0
_08044FFC:
	mov r4, sp
	adds r1, r4, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _08044FFC
	ldr r1, _080450E0
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	movs r1, 0x10
	strh r1, [r0, 0x26]
	movs r5, 0
	mov r4, r10
	lsls r4, 4
	str r4, [sp, 0x10]
	ldr r4, _080450DC
	movs r6, 0xD
	negs r6, r6
	movs r3, 0x4
_08045038:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	adds r5, 0x1
	cmp r5, 0x5
	ble _08045038
	ldr r2, [sp, 0x10]
	add r2, r10
	lsls r2, 2
	add r2, r12
	ldrb r1, [r2, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x1]
	mov r2, r9
	cmp r2, 0
	bne _08045074
	b _08045178
_08045074:
	movs r5, 0
	mov r6, r12
	mov r9, r5
	adds r3, r6, 0
	adds r3, 0x1C
	mov r4, sp
	movs r7, 0
_08045082:
	ldr r0, [sp, 0x8]
	str r3, [sp, 0x14]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, [sp, 0x14]
	cmp r2, 0
	beq _080450E8
	movs r0, 0x5
	subs r0, r5
	mov r1, sp
	adds r2, r1, r0
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x34]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	mov r1, r9
	strh r1, [r0, 0x36]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _080450E4
	str r1, [r0]
	ldr r2, _080450DC
	mov r12, r2
	b _0804511E
	.align 2, 0
_080450D8: .4byte gTasks
_080450DC: .4byte gSprites
_080450E0: .4byte 0x04000050
_080450E4: .4byte sub_8045110
_080450E8:
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r7, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x34]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r2, [r0, 0x36]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldr r1, _08045160
	str r1, [r0]
	ldr r0, _08045164
	mov r12, r0
_0804511E:
	adds r4, 0x1
	adds r7, 0x7
	adds r5, 0x1
	cmp r5, 0x5
	ble _08045082
	ldr r3, [sp, 0x10]
	add r3, r10
	lsls r3, 2
	mov r1, r12
	adds r0, r3, r1
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	mov r1, r12
	adds r1, 0x1C
	adds r3, r1
	ldr r1, _08045168
	str r1, [r3]
	ldr r1, _0804516C
	bl SetSubspriteTables
	ldr r1, _08045170
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _08045174
	b _08045182
	.align 2, 0
_08045160: .4byte sub_8045110
_08045164: .4byte gSprites
_08045168: .4byte sub_8045048
_0804516C: .4byte gSubspriteTables_820A6EC
_08045170: .4byte gTasks
_08045174: .4byte sub_8044E74
_08045178:
	ldr r0, [sp, 0xC]
	add r0, r8
	lsls r0, 3
	adds r0, r7
	ldr r1, _08045194
_08045182:
	str r1, [r0]
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045194: .4byte sub_8044F70
	thumb_func_end sub_8044CA0

	thumb_func_start sub_8044E74
sub_8044E74: @ 8045198
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080451E4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1E]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080451D2
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	cmp r0, 0
	blt _080451DE
	ldr r1, _080451E8
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
_080451D2:
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080451DE
	ldr r0, _080451EC
	str r0, [r3]
_080451DE:
	pop {r0}
	bx r0
	.align 2, 0
_080451E4: .4byte gTasks
_080451E8: .4byte 0x04000052
_080451EC: .4byte sub_8044ECC
	thumb_func_end sub_8044E74

	thumb_func_start sub_8044ECC
sub_8044ECC: @ 80451F0
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r6, _08045268
	lsls r0, r3, 2
	adds r0, r3
	lsls r4, r0, 3
	adds r1, r4, r6
	ldrh r0, [r1, 0x26]
	subs r0, 0x1
	movs r5, 0
	strh r0, [r1, 0x26]
	lsls r0, 16
	asrs r2, r0, 16
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08045270
	ldrb r3, [r1, 0xA]
	adds r0, r6, 0
	adds r0, 0xE
	adds r2, r4, r0
_0804521E:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804521E
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _0804526C
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_0804524E:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _0804524E
	b _08045286
	.align 2, 0
_08045268: .4byte gTasks
_0804526C: .4byte gSprites
_08045270:
	movs r0, 0x3
	negs r0, r0
	cmp r2, r0
	bne _08045286
	ldr r0, _08045290
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r3, 0
	bl DestroyTask
_08045286:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08045290: .4byte 0x04000050
	thumb_func_end sub_8044ECC

	thumb_func_start sub_8044F70
sub_8044F70: @ 8045294
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r7, _080452C8
	lsls r0, r4, 2
	adds r0, r4
	lsls r6, r0, 3
	adds r3, r6, r7
	ldrh r0, [r3, 0x26]
	subs r2, r0, 0x1
	movs r5, 0
	strh r2, [r3, 0x26]
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r1, 0
	blt _080452D0
	ldr r1, _080452CC
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1]
	b _08045346
	.align 2, 0
_080452C8: .4byte gTasks
_080452CC: .4byte 0x04000052
_080452D0:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08045330
	ldrb r3, [r3, 0xA]
	movs r5, 0
	adds r0, r7, 0
	adds r0, 0xE
	adds r2, r6, r0
_080452E2:
	mov r0, sp
	adds r1, r0, r5
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r5, 0x1
	cmp r5, 0x5
	ble _080452E2
	lsls r0, r3, 4
	adds r0, r3
	lsls r0, 2
	ldr r4, _0804532C
	adds r0, r4
	bl DestroySpriteAndFreeResources
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySpriteAndFreeResources
	movs r5, 0x1
_08045312:
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r5, 0x1
	cmp r5, 0x5
	ble _08045312
	b _08045346
	.align 2, 0
_0804532C: .4byte gSprites
_08045330:
	movs r0, 0x3
	negs r0, r0
	cmp r1, r0
	bne _08045346
	ldr r0, _08045350
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, r4, 0
	bl DestroyTask
_08045346:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045350: .4byte 0x04000050
	thumb_func_end sub_8044F70

	thumb_func_start sub_8045030
sub_8045030: @ 8045354
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x24]
	movs r3, 0x24
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _08045368
	ldrh r0, [r1, 0x2E]
	adds r0, r2, r0
	strh r0, [r1, 0x24]
_08045368:
	pop {r0}
	bx r0
	thumb_func_end sub_8045030

	thumb_func_start sub_8045048
sub_8045048: @ 804536C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	adds r1, 0x20
	strh r1, [r2, 0x30]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _0804538A
	lsls r0, r1, 16
	asrs r0, 20
	ldrh r1, [r2, 0x24]
	adds r0, r1
	b _08045392
_0804538A:
	lsls r1, 16
	asrs r1, 20
	ldrh r0, [r2, 0x24]
	subs r0, r1
_08045392:
	strh r0, [r2, 0x24]
	ldrh r1, [r2, 0x30]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r2, 0x30]
	pop {r0}
	bx r0
	thumb_func_end sub_8045048

	thumb_func_start sub_804507C
sub_804507C: @ 80453A0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080453B4
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _0804542A
_080453B4:
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r3, r0, 24
	ldrh r2, [r4, 0x34]
	adds r0, r2, 0
	adds r0, 0x38
	lsls r1, r0, 16
	lsrs r2, r1, 16
	ldr r0, _080453E4
	ands r2, r0
	strh r2, [r4, 0x34]
	cmp r3, 0
	beq _080453E8
	lsrs r0, r1, 20
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080453F8
	movs r0, 0
	strh r0, [r4, 0x24]
	b _080453F8
	.align 2, 0
_080453E4: .4byte 0x0000fff0
_080453E8:
	lsrs r1, 20
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bge _080453F8
	strh r3, [r4, 0x24]
_080453F8:
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0804542A
	movs r1, 0x3F
	cmp r3, 0
	beq _08045408
	movs r1, 0xC0
_08045408:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0804541C
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x74
	bl PlaySE2WithPanning
	b _08045426
_0804541C:
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x73
	bl PlaySE1WithPanning
_08045426:
	ldr r0, _08045430
	str r0, [r4, 0x1C]
_0804542A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08045430: .4byte SpriteCallbackDummy
	thumb_func_end sub_804507C

	thumb_func_start sub_8045110
sub_8045110: @ 8045434
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _08045448
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _08045498
_08045448:
	ldrh r0, [r3, 0x32]
	lsls r0, 24
	ldrh r2, [r3, 0x34]
	adds r1, r2, 0
	adds r1, 0x38
	lsls r4, r1, 16
	lsrs r2, r4, 16
	ldr r1, _08045468
	ands r2, r1
	strh r2, [r3, 0x34]
	cmp r0, 0
	beq _0804546C
	lsrs r0, r4, 20
	ldrh r1, [r3, 0x24]
	adds r0, r1
	b _08045472
	.align 2, 0
_08045468: .4byte 0x0000fff0
_0804546C:
	lsrs r1, r4, 20
	ldrh r0, [r3, 0x24]
	subs r0, r1
_08045472:
	strh r0, [r3, 0x24]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	movs r2, 0x20
	ldrsh r1, [r3, r2]
	adds r0, r1
	adds r0, 0x8
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bls _08045498
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080454A0
	str r0, [r3, 0x1C]
_08045498:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080454A0: .4byte SpriteCallbackDummy
	thumb_func_end sub_8045110

	thumb_func_start sub_8045180
sub_8045180: @ 80454A4
	ldrh r2, [r0, 0x2E]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080454C0
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	strh r2, [r0, 0x24]
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_080454C0: .4byte gSprites
	thumb_func_end sub_8045180

	thumb_func_start sub_80451A0
sub_80451A0: @ 80454C4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r1, 0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _0804555C
	ldr r1, _08045560
	adds r0, r4, 0
	bl StringCopy
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	adds r4, 0x3
	adds r0, r4, 0
	mov r1, sp
	bl StringCopy
	adds r5, r0, 0
	movs r1, 0xFC
	strb r1, [r5]
	movs r0, 0x3
	strb r0, [r5, 0x1]
	movs r0, 0x2
	strb r0, [r5, 0x2]
	strb r1, [r5, 0x3]
	movs r0, 0x1
	strb r0, [r5, 0x4]
	adds r5, 0x5
	adds r0, r7, 0
	bl GetMonGender
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonData
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	mov r1, sp
	bl sub_8040D3C
	cmp r0, 0
	beq _08045546
	movs r6, 0x64
_08045546:
	cmp r6, 0
	beq _08045564
	cmp r6, 0xFE
	beq _0804556C
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	adds r5, 0x1
	b _0804557A
	.align 2, 0
_0804555C: .4byte gUnknown_020238CC
_08045560: .4byte gUnknown_0820A8B0
_08045564:
	movs r0, 0xB
	strb r0, [r5]
	movs r0, 0xB5
	b _08045572
_0804556C:
	movs r0, 0xA
	strb r0, [r5]
	movs r0, 0xB6
_08045572:
	strb r0, [r5, 0x1]
	movs r0, 0xFF
	strb r0, [r5, 0x2]
	adds r5, 0x2
_0804557A:
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x13
	strb r0, [r5, 0x1]
	movs r0, 0x37
	strb r0, [r5, 0x2]
	movs r0, 0xFF
	strb r0, [r5, 0x3]
	ldr r1, _080455FC
	mov r0, r9
	lsls r4, r0, 4
	adds r0, r4, r0
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r2, _08045600
	adds r5, r1, r2
	ldr r0, _08045604
	mov r8, r0
	adds r0, r5, 0
	mov r1, r8
	bl sub_80034D4
	movs r6, 0
	movs r1, 0x7
	mov r10, r1
	adds r0, r7, 0
	movs r1, 0x3
	bl GetMonData
	str r4, [sp, 0xC]
	cmp r0, 0x1
	bne _0804565C
	adds r0, r7, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0804565C
	mov r4, r8
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	beq _0804565C
	adds r7, r5, 0
_080455E6:
	cmp r1, 0xFC
	bne _08045608
	ldrb r0, [r4, 0x1]
	bl GetExtCtrlCodeLength
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	adds r4, r0
	b _08045654
	.align 2, 0
_080455FC: .4byte gSprites
_08045600: .4byte 0x02000520
_08045604: .4byte gUnknown_020238CC
_08045608:
	adds r0, r1, 0
	subs r0, 0x37
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bls _08045620
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08045624
_08045620:
	movs r0, 0x2C
	b _08045642
_08045624:
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _0804563C
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08045640
_0804563C:
	movs r0, 0x2D
	b _08045642
_08045640:
	movs r0, 0x2B
_08045642:
	bl sub_8043CDC
	adds r1, r7, 0
	ldr r2, _080456EC
	bl CpuSet
	adds r7, 0x40
	adds r6, 0x1
	adds r4, 0x1
_08045654:
	ldrb r1, [r4]
	adds r0, r1, 0
	cmp r0, 0xFF
	bne _080455E6
_0804565C:
	cmp r6, r10
	bge _0804567E
	lsls r0, r6, 6
	adds r4, r0, r5
	mov r2, r10
	subs r6, r2, r6
_08045668:
	movs r0, 0x2B
	bl sub_8043CDC
	adds r1, r4, 0
	ldr r2, _080456EC
	bl CpuSet
	adds r4, 0x40
	subs r6, 0x1
	cmp r6, 0
	bne _08045668
_0804567E:
	ldr r1, _080456F0
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r6, r0, r1
	ldrh r0, [r6, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080456F8
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080456F8
	ldr r1, _080456F4
	mov r0, r10
	cmp r0, 0
	beq _0804575C
	mov r8, r6
	mov r9, r1
	ldr r7, _080456EC
	mov r6, r10
_080456B2:
	mov r1, r9
	adds r1, 0x4
	mov r9, r1
	subs r1, 0x4
	ldm r1!, {r4}
	mov r2, r8
	ldrh r0, [r2, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r0, 0x80
	lsls r0, 1
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _080456B2
	b _0804575C
	.align 2, 0
_080456EC: .4byte 0x04000008
_080456F0: .4byte gSprites
_080456F4: .4byte gUnknown_0820A8B4
_080456F8:
	ldr r1, _0804576C
	ldr r0, [sp, 0xC]
	add r0, r9
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _08045770
	cmp r0, 0
	bne _08045716
	ldr r1, _08045774
_08045716:
	mov r2, r10
	cmp r2, 0
	beq _0804575C
	mov r8, r4
	mov r9, r1
	ldr r7, _08045778
	mov r6, r10
_08045724:
	mov r0, r9
	adds r0, 0x4
	mov r9, r0
	subs r0, 0x4
	ldm r0!, {r4}
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 17
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r5, 0x20
	subs r6, 0x1
	cmp r6, 0
	bne _08045724
_0804575C:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804576C: .4byte gSprites
_08045770: .4byte gUnknown_0820A8DC
_08045774: .4byte gUnknown_0820A904
_08045778: .4byte 0x04000008
	thumb_func_end sub_80451A0

	thumb_func_start sub_8045458
sub_8045458: @ 804577C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _08045818
	ldrh r1, [r0]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _08045852
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _08045852
	ldr r6, _0804581C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r6
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08045852
	ldr r1, _08045820
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045824
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _08045852
	ldrh r0, [r5, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _08045830
	movs r0, 0x46
	bl sub_8043CDC
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r6
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2
	ldr r2, _08045828
	adds r1, r2
	ldr r2, _0804582C
	bl CpuSet
	b _08045852
	.align 2, 0
_08045818: .4byte gUnknown_020239F8
_0804581C: .4byte gSprites
_08045820: .4byte gUnknown_02024A6A
_08045824: .4byte gEnemyParty
_08045828: .4byte 0x06010000
_0804582C: .4byte 0x04000008
_08045830:
	str r7, [sp]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 17
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	ldr r0, _0804585C
	adds r1, r0
	ldr r2, _08045860
	mov r0, sp
	bl CpuSet
_08045852:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804585C: .4byte 0x06010000
_08045860: .4byte 0x05000008
	thumb_func_end sub_8045458

	thumb_func_start draw_status_ailment_maybe
draw_status_ailment_maybe: @ 8045864
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080458C8
	mov r2, r9
	lsls r1, r2, 4
	add r1, r9
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x3A]
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r0, [r1, 0x38]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080458D4
	ldr r1, _080458CC
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080458D0
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	bl battle_type_is_double
	lsls r0, 24
	movs r3, 0x12
	mov r8, r3
	cmp r0, 0
	bne _080458F0
	movs r0, 0x1A
	mov r8, r0
	b _080458F0
	.align 2, 0
_080458C8: .4byte gSprites
_080458CC: .4byte gUnknown_02024A6A
_080458D0: .4byte gPlayerParty
_080458D4:
	ldr r1, _08045910
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08045914
	adds r0, r1
	movs r1, 0x37
	bl GetMonData
	adds r4, r0, 0
	movs r1, 0x11
	mov r8, r1
_080458F0:
	movs r0, 0x7
	ands r0, r4
	cmp r0, 0
	beq _08045918
	movs r0, 0x1B
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x2
	b _08045A20
	.align 2, 0
_08045910: .4byte gUnknown_02024A6A
_08045914: .4byte gEnemyParty
_08045918:
	movs r0, 0x88
	ands r0, r4
	cmp r0, 0
	beq _08045936
	movs r0, 0x15
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0
	b _08045A20
_08045936:
	movs r0, 0x10
	ands r0, r4
	cmp r0, 0
	beq _08045954
	movs r0, 0x21
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x4
	b _08045A20
_08045954:
	movs r0, 0x20
	ands r0, r4
	cmp r0, 0
	beq _08045972
	movs r0, 0x1E
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x3
	b _08045A20
_08045972:
	movs r0, 0x40
	ands r0, r4
	cmp r0, 0
	beq _08045990
	movs r0, 0x18
	adds r1, r7, 0
	bl sub_80457E8
	lsls r0, 24
	lsrs r0, 24
	bl sub_8043CDC
	adds r6, r0, 0
	movs r0, 0x1
	b _08045A20
_08045990:
	movs r0, 0x27
	bl sub_8043CDC
	adds r6, r0, 0
	movs r4, 0
	mov r2, r9
	lsls r0, r2, 4
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsls r7, 2
	ldr r1, _08045A0C
	add r0, r9
	lsls r0, 2
	adds r5, r0, r1
_080459AE:
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	mov r2, r8
	asrs r0, r2, 16
	adds r1, r0
	adds r1, r4
	lsls r1, 5
	ldr r3, _08045A10
	adds r1, r3
	adds r0, r6, 0
	ldr r2, _08045A14
	bl CpuSet
	adds r4, 0x1
	cmp r4, 0x2
	ble _080459AE
	ldr r0, _08045A18
	adds r0, r7, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08045A00
	movs r0, 0x1
	bl sub_8043CDC
	ldr r2, _08045A0C
	mov r3, r10
	lsls r1, r3, 4
	add r1, r10
	lsls r1, 2
	adds r1, r2
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _08045A10
	adds r1, r2
	ldr r2, _08045A1C
	bl CpuSet
_08045A00:
	mov r0, r9
	movs r1, 0x1
	bl sub_8045458
	b _08045ADE
	.align 2, 0
_08045A0C: .4byte gSprites
_08045A10: .4byte 0x06010000
_08045A14: .4byte 0x04000008
_08045A18: .4byte 0x02017800
_08045A1C: .4byte 0x04000010
_08045A20:
	mov r1, r9
	lsls r5, r1, 4
	add r5, r9
	lsls r5, 2
	ldr r2, _08045AEC
	adds r5, r2
	ldrb r4, [r5, 0x5]
	lsrs r4, 4
	lsls r4, 4
	adds r4, 0xC
	adds r4, r7
	lsls r0, 1
	ldr r1, _08045AF0
	adds r0, r1
	ldrh r0, [r0]
	movs r3, 0x80
	lsls r3, 1
	adds r1, r4, r3
	movs r2, 0x2
	bl FillPalette
	lsls r4, 1
	ldr r0, _08045AF4
	adds r0, r4, r0
	ldr r1, _08045AF8
	adds r4, r1
	adds r1, r4, 0
	movs r2, 0x1
	bl CpuSet
	ldrh r1, [r5, 0x4]
	lsls r1, 22
	lsrs r1, 22
	add r1, r8
	lsls r1, 5
	ldr r2, _08045AFC
	mov r8, r2
	add r1, r8
	ldr r2, _08045B00
	adds r0, r6, 0
	bl CpuSet
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08045A8E
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08045AD6
_08045A8E:
	lsls r0, r7, 2
	ldr r1, _08045B04
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08045AD6
	movs r0, 0
	bl sub_8043CDC
	mov r3, r10
	lsls r4, r3, 4
	add r4, r10
	lsls r4, 2
	ldr r1, _08045AEC
	adds r4, r1
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	add r1, r8
	ldr r5, _08045B08
	adds r2, r5, 0
	bl CpuSet
	movs r0, 0x41
	bl sub_8043CDC
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 17
	adds r1, 0x20
	add r1, r8
	adds r2, r5, 0
	bl CpuSet
_08045AD6:
	mov r0, r9
	movs r1, 0
	bl sub_8045458
_08045ADE:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045AEC: .4byte gSprites
_08045AF0: .4byte gBattleInterfaceStatusIcons_DynPal
_08045AF4: .4byte 0x0202ecc8
_08045AF8: .4byte 0x05000200
_08045AFC: .4byte 0x06010000
_08045B00: .4byte 0x04000018
_08045B04: .4byte 0x02017800
_08045B08: .4byte 0x04000008
	thumb_func_end draw_status_ailment_maybe

	thumb_func_start sub_80457E8
sub_80457E8: @ 8045B0C
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsrs r2, r0, 24
	adds r0, r2, 0
	subs r0, 0x15
	cmp r0, 0xC
	bhi _08045BCC
	lsls r0, 2
	ldr r1, _08045B28
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08045B28: .4byte _08045B2C
	.align 2, 0
_08045B2C:
	.4byte _08045B60
	.4byte _08045BCC
	.4byte _08045BCC
	.4byte _08045B76
	.4byte _08045BCC
	.4byte _08045BCC
	.4byte _08045B8C
	.4byte _08045BCC
	.4byte _08045BCC
	.4byte _08045BA2
	.4byte _08045BCC
	.4byte _08045BCC
	.4byte _08045BB8
_08045B60:
	movs r2, 0x15
	cmp r3, 0
	beq _08045BCC
	movs r2, 0x47
	cmp r3, 0x1
	beq _08045BCC
	movs r2, 0x65
	cmp r3, 0x2
	bne _08045BCC
	movs r2, 0x56
	b _08045BCC
_08045B76:
	movs r2, 0x18
	cmp r3, 0
	beq _08045BCC
	movs r2, 0x4A
	cmp r3, 0x1
	beq _08045BCC
	movs r2, 0x68
	cmp r3, 0x2
	bne _08045BCC
	movs r2, 0x59
	b _08045BCC
_08045B8C:
	movs r2, 0x1B
	cmp r3, 0
	beq _08045BCC
	movs r2, 0x4D
	cmp r3, 0x1
	beq _08045BCC
	movs r2, 0x6B
	cmp r3, 0x2
	bne _08045BCC
	movs r2, 0x5C
	b _08045BCC
_08045BA2:
	movs r2, 0x1E
	cmp r3, 0
	beq _08045BCC
	movs r2, 0x50
	cmp r3, 0x1
	beq _08045BCC
	movs r2, 0x6E
	cmp r3, 0x2
	bne _08045BCC
	movs r2, 0x5F
	b _08045BCC
_08045BB8:
	movs r2, 0x21
	cmp r3, 0
	beq _08045BCC
	movs r2, 0x53
	cmp r3, 0x1
	beq _08045BCC
	movs r2, 0x71
	cmp r3, 0x2
	bne _08045BCC
	movs r2, 0x62
_08045BCC:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80457E8

	thumb_func_start sub_80458B0
sub_80458B0: @ 8045BD4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08045CA8
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 7
	ldr r0, _08045CAC
	adds r6, r1, r0
	movs r1, 0x7
	mov r8, r1
	ldr r1, _08045CB0
	adds r0, r6, 0
	bl sub_80034D4
	movs r4, 0
_08045C12:
	movs r0, 0x2B
	bl sub_8043CDC
	lsls r1, r4, 6
	adds r1, r6, r1
	ldr r2, _08045CB4
	bl CpuSet
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r8
	bcc _08045C12
	movs r7, 0x3
	movs r2, 0x3
	add r2, r8
	mov r9, r2
	cmp r7, r9
	bge _08045C98
	ldr r1, _08045CA8
	ldr r0, _08045CB4
	mov r10, r0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	mov r8, r0
_08045C48:
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r5, r7, 0
	cmp r7, 0
	bge _08045C58
	adds r5, r7, 0x7
_08045C58:
	asrs r5, 3
	lsls r4, r5, 3
	subs r4, r7, r4
	adds r0, r4
	lsls r5, 6
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045CB8
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	mov r1, r8
	ldrh r0, [r1, 0x4]
	lsls r0, 22
	lsrs r0, 22
	adds r4, 0x8
	adds r0, r4
	adds r0, r5
	lsls r0, 5
	ldr r2, _08045CB8
	adds r1, r0, r2
	adds r0, r6, 0
	mov r2, r10
	bl CpuSet
	adds r6, 0x20
	adds r7, 0x1
	cmp r7, r9
	blt _08045C48
_08045C98:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045CA8: .4byte gSprites
_08045CAC: .4byte 0x02000520
_08045CB0: .4byte gUnknown_08400DD6
_08045CB4: .4byte 0x04000008
_08045CB8: .4byte 0x06010000
	thumb_func_end sub_80458B0

	thumb_func_start sub_8045998
sub_8045998: @ 8045CBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08045D5C
	mov r8, r0
	ldr r1, _08045D60
	bl StringCopy
	adds r7, r0, 0
	ldr r0, _08045D64
	ldrb r1, [r0]
	adds r0, r7, 0
	movs r2, 0xA
	movs r3, 0x1
	bl sub_8003504
	adds r7, r0, 0
	ldr r1, _08045D68
	bl StringAppend
	ldr r0, _08045D6C
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r5, r0
	ldrh r0, [r5, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 1
	adds r4, r0
	lsls r4, 7
	ldr r0, _08045D70
	adds r7, r4, r0
	movs r6, 0x5
	adds r0, r7, 0
	mov r1, r8
	bl sub_80034D4
	ldr r0, _08045D74
	adds r7, r4, r0
	movs r4, 0x6
_08045D1C:
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r2, r0, 22
	adds r0, r4, 0
	cmp r4, 0
	bge _08045D2A
	adds r0, r4, 0x7
_08045D2A:
	asrs r0, 3
	lsls r1, r0, 3
	subs r1, r4, r1
	adds r1, 0x18
	adds r1, r2, r1
	lsls r0, 6
	adds r1, r0
	lsls r1, 5
	ldr r0, _08045D78
	adds r1, r0
	adds r0, r7, 0
	ldr r2, _08045D7C
	bl CpuSet
	adds r7, 0x40
	adds r4, 0x1
	adds r0, r6, 0x6
	cmp r4, r0
	blt _08045D1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045D5C: .4byte gUnknown_020238CC
_08045D60: .4byte gUnknown_08400DE6
_08045D64: .4byte gNumSafariBalls
_08045D68: .4byte gUnknown_08400DF0
_08045D6C: .4byte gSprites
_08045D70: .4byte 0x02000520
_08045D74: .4byte 0x02000540
_08045D78: .4byte 0x06010000
_08045D7C: .4byte 0x04000008
	thumb_func_end sub_8045998

	thumb_func_start sub_8045A5C
sub_8045A5C: @ 8045D80
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r1, _08045F08
	lsls r0, 4
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08045DB6
	b _08045F14
_08045DB6:
	cmp r7, 0x3
	beq _08045DBE
	cmp r7, 0
	bne _08045DD2
_08045DBE:
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045DD2:
	cmp r7, 0x1
	bhi _08045DEC
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0
	bl sub_80440EC
_08045DEC:
	cmp r7, 0x2
	beq _08045DF4
	cmp r7, 0
	bne _08045E0A
_08045DF4:
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, r8
	movs r2, 0x1
	bl sub_80440EC
_08045E0A:
	cmp r7, 0x5
	beq _08045E12
	cmp r7, 0
	bne _08045E46
_08045E12:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045E46:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	cmp r0, 0
	bne _08045ECA
	cmp r7, 0x6
	beq _08045E5C
	cmp r7, 0
	bne _08045ECA
_08045E5C:
	movs r0, 0x3
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0xB
	bl GetMonData
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	movs r1, 0x19
	bl GetMonData
	adds r3, r0, 0
	ldr r6, _08045F0C
	lsls r1, r4, 2
	ldr r2, _08045F10
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r2
	ldrb r2, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	muls r0, r2
	adds r1, r0
	adds r1, r6
	ldr r1, [r1]
	subs r3, r1
	adds r4, 0x1
	lsls r4, 2
	adds r4, r0
	adds r4, r6
	ldr r2, [r4]
	subs r2, r1
	ldr r0, [sp, 0x4]
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0x1
	movs r3, 0
	bl sub_8045C78
_08045ECA:
	cmp r7, 0x4
	beq _08045ED2
	cmp r7, 0
	bne _08045EDA
_08045ED2:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045EDA:
	cmp r7, 0x9
	beq _08045EE2
	cmp r7, 0
	bne _08045EE8
_08045EE2:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045EE8:
	cmp r7, 0xA
	bne _08045EF2
	mov r0, r8
	bl sub_80458B0
_08045EF2:
	adds r0, r7, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _08045F8A
	mov r0, r8
	bl sub_8045998
	b _08045F8A
	.align 2, 0
_08045F08: .4byte gSprites
_08045F0C: .4byte gExperienceTables
_08045F10: .4byte gBaseStats
_08045F14:
	cmp r7, 0x3
	beq _08045F1C
	cmp r7, 0
	bne _08045F30
_08045F1C:
	mov r0, r9
	movs r1, 0x38
	bl GetMonData
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_8043FC0
_08045F30:
	cmp r7, 0x5
	beq _08045F38
	cmp r7, 0
	bne _08045F6C
_08045F38:
	movs r0, 0
	bl load_gfxc_health_bar
	mov r0, r9
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	mov r0, r9
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	movs r0, 0
	str r0, [sp]
	mov r0, r10
	mov r1, r8
	adds r2, r4, 0
	bl sub_8043D84
	mov r0, r10
	mov r1, r8
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
_08045F6C:
	cmp r7, 0x4
	beq _08045F74
	cmp r7, 0
	bne _08045F7C
_08045F74:
	mov r0, r8
	mov r1, r9
	bl sub_80451A0
_08045F7C:
	cmp r7, 0x9
	beq _08045F84
	cmp r7, 0
	bne _08045F8A
_08045F84:
	mov r0, r8
	bl draw_status_ailment_maybe
_08045F8A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8045A5C

	thumb_func_start sub_8045C78
sub_8045C78: @ 8045F9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	cmp r2, 0
	bne _08045FE0
	lsls r5, r7, 2
	adds r3, r5, r7
	lsls r3, 2
	ldr r4, _08045FDC
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	movs r4, 0x6
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_8045F58
	adds r6, r0, 0
	adds r4, r5, 0
	b _0804602E
	.align 2, 0
_08045FDC: .4byte 0x02017850
_08045FE0:
	lsls r4, r7, 2
	adds r0, r4, r7
	lsls r0, 2
	mov r10, r0
	ldr r6, _08046074
	add r6, r10
	ldr r0, [r6, 0x8]
	ldr r1, [r6, 0xC]
	ldr r2, [r6, 0x4]
	movs r3, 0x8
	bl sub_8046188
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08046002
	movs r5, 0x1
_08046002:
	ldr r0, [r6, 0xC]
	mov r8, r0
	adds r1, r5, 0
	bl __divsi3
	cmp r0, 0
	bge _08046012
	negs r0, r0
_08046012:
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, [r6, 0x4]
	ldr r1, [r6, 0x8]
	ldr r3, _08046074
	adds r3, 0x10
	add r3, r10
	movs r2, 0x8
	str r2, [sp]
	str r5, [sp, 0x4]
	mov r2, r8
	bl sub_8045F58
	adds r6, r0, 0
_0804602E:
	mov r0, r9
	cmp r0, 0x1
	beq _08046046
	cmp r0, 0
	bne _0804604E
	ldr r0, _08046078
	adds r0, r4, r0
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0804604E
_08046046:
	adds r0, r7, 0
	mov r1, r9
	bl sub_8045D58
_0804604E:
	movs r0, 0x1
	negs r0, r0
	cmp r6, r0
	bne _08046062
	adds r0, r4, r7
	lsls r0, 2
	ldr r1, _08046074
	adds r0, r1
	movs r1, 0
	str r1, [r0, 0x10]
_08046062:
	adds r0, r6, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08046074: .4byte 0x02017850
_08046078: .4byte 0x02017800
	thumb_func_end sub_8045C78

	thumb_func_start sub_8045D58
sub_8045D58: @ 804607C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0
	beq _08046096
	cmp r1, 0x1
	beq _08046178
	b _08046266
_08046096:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08046124
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	mov r8, r1
	adds r1, r5, 0
	cmp r0, 0x18
	bhi _080460D0
	movs r2, 0x38
	mov r8, r2
	cmp r0, 0x9
	bls _080460D0
	movs r4, 0x2F
	mov r8, r4
_080460D0:
	movs r5, 0
	ldr r7, _08046128
	adds r0, r1, r6
	lsls r6, r0, 2
_080460D8:
	ldr r0, _08046124
	adds r0, r6, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrh r0, [r0, 0x38]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r5, 0x1
	bhi _08046134
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0x2
	adds r1, r2
	lsls r1, 5
	ldr r2, _0804612C
	adds r1, r2
	ldr r2, _08046130
	bl CpuSet
	b _08046162
	.align 2, 0
_08046124: .4byte 0x02017850
_08046128: .4byte gSprites
_0804612C: .4byte 0x06010000
_08046130: .4byte 0x04000008
_08046134:
	mov r0, r8
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r4, _08046170
	adds r1, r4
	ldr r2, _08046174
	bl CpuSet
_08046162:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080460D8
	b _08046266
	.align 2, 0
_08046170: .4byte 0x06010040
_08046174: .4byte 0x04000008
_08046178:
	lsls r5, r6, 2
	adds r3, r5, r6
	lsls r3, 2
	ldr r4, _08046214
	adds r2, r3, r4
	ldr r0, [r2, 0x4]
	ldr r1, [r2, 0x8]
	ldr r2, [r2, 0xC]
	adds r4, 0x10
	adds r3, r4
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x8
	str r4, [sp, 0x4]
	bl sub_804602C
	ldr r1, _08046218
	lsls r0, r6, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0804621C
	adds r0, r1
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	cmp r0, 0x64
	bne _080461CE
	movs r5, 0
	movs r2, 0
_080461BC:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	strb r2, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _080461BC
_080461CE:
	movs r5, 0
	ldr r7, _08046220
	adds r0, r1, r6
	lsls r0, 2
	ldr r1, _08046214
	adds r4, r0, r1
_080461DA:
	cmp r5, 0x3
	bhi _0804622C
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x24
	adds r1, r2
	lsls r1, 5
	ldr r2, _08046224
	adds r1, r2
	ldr r2, _08046228
	bl CpuSet
	b _0804625C
	.align 2, 0
_08046214: .4byte 0x02017850
_08046218: .4byte gUnknown_02024A6A
_0804621C: .4byte gPlayerParty
_08046220: .4byte gSprites
_08046224: .4byte 0x06010000
_08046228: .4byte 0x04000008
_0804622C:
	movs r0, 0xC
	bl sub_8043CDC
	mov r1, sp
	adds r1, r5
	adds r1, 0x8
	ldrb r1, [r1]
	lsls r1, 5
	adds r0, r1
	ldrb r2, [r4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r7
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r1, r5, r1
	lsls r1, 5
	ldr r2, _08046274
	adds r1, r2
	ldr r2, _08046278
	bl CpuSet
_0804625C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _080461DA
_08046266:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046274: .4byte 0x06010b80
_08046278: .4byte 0x04000008
	thumb_func_end sub_8045D58

	thumb_func_start sub_8045F58
sub_8045F58: @ 804627C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	mov r8, r2
	adds r5, r3, 0
	ldr r1, [sp, 0x18]
	ldr r0, [sp, 0x1C]
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 27
	lsrs r2, r1, 24
	ldr r1, [r5]
	ldr r0, _080462A8
	cmp r1, r0
	bne _080462AE
	cmp r7, r2
	bge _080462AC
	lsls r0, r4, 8
	str r0, [r5]
	b _080462AE
	.align 2, 0
_080462A8: .4byte 0xffff8000
_080462AC:
	str r4, [r5]
_080462AE:
	mov r0, r8
	subs r4, r0
	cmp r4, 0
	bge _080462BA
	movs r4, 0
	b _080462C0
_080462BA:
	cmp r4, r7
	ble _080462C0
	adds r4, r7, 0
_080462C0:
	cmp r7, r2
	bge _080462DC
	ldr r0, [r5]
	asrs r1, r0, 8
	adds r6, r0, 0
	cmp r4, r1
	bne _080462E8
	movs r0, 0xFF
	ands r0, r6
	cmp r0, 0
	bne _080462E8
	movs r0, 0x1
	negs r0, r0
	b _08046344
_080462DC:
	ldr r6, [r5]
	cmp r4, r6
	bne _080462E8
	movs r0, 0x1
	negs r0, r0
	b _08046344
_080462E8:
	cmp r7, r2
	bge _08046322
	lsls r0, r7, 8
	adds r1, r2, 0
	bl __divsi3
	mov r1, r8
	cmp r1, 0
	bge _08046306
	adds r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	cmp r2, r4
	blt _08046342
	b _0804631A
_08046306:
	subs r0, r6, r0
	str r0, [r5]
	asrs r2, r0, 8
	movs r1, 0xFF
	ands r0, r1
	cmp r0, 0
	ble _08046316
	adds r2, 0x1
_08046316:
	cmp r2, r4
	bgt _08046342
_0804631A:
	lsls r0, r4, 8
	str r0, [r5]
	adds r2, r4, 0
	b _08046342
_08046322:
	mov r0, r8
	cmp r0, 0
	bge _08046334
	ldr r0, [r5]
	adds r0, r3
	str r0, [r5]
	cmp r0, r4
	ble _08046340
	b _0804633E
_08046334:
	ldr r0, [r5]
	subs r0, r3
	str r0, [r5]
	cmp r0, r4
	bge _08046340
_0804633E:
	str r4, [r5]
_08046340:
	ldr r2, [r5]
_08046342:
	adds r0, r2, 0
_08046344:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8045F58

	thumb_func_start sub_804602C
sub_804602C: @ 8046350
	push {r4-r7,lr}
	adds r4, r0, 0
	mov r12, r3
	ldr r7, [sp, 0x14]
	ldr r0, [sp, 0x18]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r5, r1, r2
	cmp r5, 0
	bge _08046368
	movs r5, 0
	b _0804636E
_08046368:
	cmp r5, r4
	ble _0804636E
	adds r5, r4, 0
_0804636E:
	lsls r0, r6, 27
	lsrs r3, r0, 24
	movs r1, 0
	cmp r1, r6
	bcs _08046388
	movs r2, 0
_0804637A:
	adds r0, r7, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r6
	bcc _0804637A
_08046388:
	cmp r4, r3
	bge _0804639C
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
	asrs r0, 8
	b _080463A8
_0804639C:
	mov r1, r12
	ldr r0, [r1]
	muls r0, r3
	adds r1, r4, 0
	bl __divsi3
_080463A8:
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	cmp r3, 0
	bne _080463BE
	cmp r5, 0
	ble _080463BE
	movs r0, 0x1
	strb r0, [r7]
	movs r3, 0x1
	b _080463E2
_080463BE:
	movs r1, 0
	movs r4, 0x8
_080463C2:
	cmp r1, r6
	bcs _080463E2
	cmp r2, 0x7
	bls _080463DE
	adds r0, r7, r1
	strb r4, [r0]
	adds r0, r2, 0
	subs r0, 0x8
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	b _080463C2
_080463DE:
	adds r0, r7, r1
	strb r2, [r0]
_080463E2:
	adds r0, r3, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804602C

	thumb_func_start sub_80460C8
sub_80460C8: @ 80463EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	movs r3, 0x6
	str r3, [sp]
	movs r3, 0x1
	str r3, [sp, 0x4]
	adds r3, r6, 0
	bl sub_8045F58
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_8046128
	ldr r0, [r5]
	cmp r0, 0x2F
	bgt _0804642C
	ldr r0, [r6]
	lsls r0, 8
	lsrs r1, r0, 16
	b _0804642E
_0804642C:
	ldrh r1, [r6]
_0804642E:
	movs r2, 0
	ldrsh r0, [r5, r2]
	lsls r1, 16
	asrs r1, 16
	mov r2, r8
	bl sub_804373C
	lsls r0, r7, 16
	asrs r0, 16
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80460C8

	thumb_func_start sub_8046128
sub_8046128: @ 804644C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	adds r5, r0, 0
	adds r3, r1, 0
	mov r8, r2
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	ldr r2, [r5, 0x8]
	add r4, sp, 0x8
	str r4, [sp]
	movs r4, 0x6
	str r4, [sp, 0x4]
	bl sub_804602C
	movs r3, 0
	add r7, sp, 0x10
	mov r12, r7
	ldrb r0, [r5, 0xC]
	lsls r6, r0, 27
	ldr r4, [r5, 0x10]
_08046478:
	lsls r2, r3, 1
	add r2, r12
	lsrs r1, r6, 15
	mov r0, sp
	adds r0, r3
	adds r0, 0x8
	ldrb r0, [r0]
	adds r0, r4, r0
	orrs r1, r0
	strh r1, [r2]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	bls _08046478
	adds r0, r7, 0
	mov r1, r8
	movs r2, 0x6
	bl CpuSet
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8046128

	thumb_func_start sub_8046188
sub_8046188: @ 80464AC
	push {r4-r7,lr}
	adds r6, r2, 0
	lsls r3, 27
	lsrs r7, r3, 24
	subs r5, r0, r1
	cmp r5, 0
	bge _080464BE
	movs r5, 0
	b _080464C4
_080464BE:
	cmp r5, r6
	ble _080464C4
	adds r5, r6, 0
_080464C4:
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	muls r0, r7
	adds r1, r6, 0
	bl __divsi3
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	subs r0, r4, r0
	cmp r0, 0
	bge _080464EC
	negs r0, r0
_080464EC:
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8046188

	thumb_func_start GetScaledHPFraction
GetScaledHPFraction: @ 80464F8
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	muls r0, r2
	lsls r1, 16
	asrs r1, 16
	bl __divsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0804651C
	cmp r4, 0
	ble _0804651C
	movs r0, 0x1
_0804651C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetScaledHPFraction

	thumb_func_start GetHPBarLevel
GetHPBarLevel: @ 8046524
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08046536
	movs r0, 0x4
	b _08046552
_08046536:
	movs r2, 0x30
	bl GetScaledHPFraction
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0x3
	cmp r1, 0x18
	bhi _08046552
	movs r0, 0x2
	cmp r1, 0x9
	bhi _08046552
	negs r0, r1
	orrs r0, r1
	lsrs r0, 31
_08046552:
	pop {r1}
	bx r1
	thumb_func_end GetHPBarLevel

	.align 2, 0 @ Don't pad with nop.
