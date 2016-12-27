	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80CA710
sub_80CA710: @ 80CAA4C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CAA80
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080CAA84
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CAA88
	ldrh r0, [r5, 0x8]
	negs r0, r0
	b _080CAA8A
	.align 2, 0
_080CAA80: .4byte gUnknown_03004B00
_080CAA84: .4byte gUnknown_0202F7C8
_080CAA88:
	ldrh r0, [r5, 0x8]
_080CAA8A:
	strh r0, [r4, 0x34]
	ldr r0, _080CAA9C
	ldrh r0, [r0, 0xA]
	strh r0, [r4, 0x36]
	ldr r0, _080CAAA0
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAA9C: .4byte gUnknown_03004B00
_080CAAA0: .4byte sub_80CA768
	thumb_func_end sub_80CA710

	thumb_func_start sub_80CA768
sub_80CA768: @ 80CAAA4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CAAE0
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r1, r0
	strh r1, [r4, 0x32]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CAAE6
_080CAAE0:
	adds r0, r4, 0
	bl move_anim_8072740
_080CAAE6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CA768

	thumb_func_start sub_80CA7B0
sub_80CA7B0: @ 80CAAEC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080CAB2C
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080CAB30
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080CAB34
	str r0, [r4, 0x1C]
	ldr r1, _080CAB38
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAB2C: .4byte gUnknown_03004B00
_080CAB30: .4byte gUnknown_0202F7C8
_080CAB34: .4byte sub_8078B34
_080CAB38: .4byte move_anim_8074EE0
	thumb_func_end sub_80CA7B0

	thumb_func_start sub_80CA800
sub_80CA800: @ 80CAB3C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080CAB84
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r5, _080CAB88
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080CAB8C
	str r0, [r4, 0x1C]
	ldr r1, _080CAB90
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAB84: .4byte gUnknown_03004B00
_080CAB88: .4byte gUnknown_0202F7C9
_080CAB8C: .4byte sub_8078B34
_080CAB90: .4byte move_anim_8072740
	thumb_func_end sub_80CA800

	thumb_func_start sub_80CA858
sub_80CA858: @ 80CAB94
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r6, _080CABE4
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080CABE8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r6, 0x6]
	strh r0, [r4, 0x38]
	ldr r1, _080CABEC
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CABE4: .4byte gUnknown_03004B00
_080CABE8: .4byte gUnknown_0202F7C9
_080CABEC: .4byte sub_80CA8B4
	thumb_func_end sub_80CA858

	thumb_func_start sub_80CA8B4
sub_80CA8B4: @ 80CABF0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080CAC06
	adds r0, r4, 0
	bl DestroySprite
	b _080CAC5A
_080CAC06:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080CAC20
	ldr r0, _080CAC1C
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x1
	b _080CAC2A
	.align 2, 0
_080CAC1C: .4byte gUnknown_0202F7C9
_080CAC20:
	ldr r0, _080CAC60
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x6
_080CAC2A:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0xF
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
_080CAC5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CAC60: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CA8B4

	thumb_func_start sub_80CA928
sub_80CA928: @ 80CAC64
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080CACD4
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	movs r2, 0
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080CACBE
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	movs r0, 0x6
	strh r0, [r5, 0x8]
	ldr r1, _080CACD8
	movs r0, 0xF
	strh r0, [r1]
	strh r2, [r1, 0x2]
	movs r0, 0x50
	strh r0, [r1, 0x4]
	strh r2, [r1, 0x6]
	ldr r4, _080CACDC
	ldr r0, _080CACE0
	ldrb r0, [r0]
	bl sub_8079E90
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl CreateSpriteAndAnimate
_080CACBE:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0xF
	bne _080CACCC
	adds r0, r6, 0
	bl move_anim_task_del
_080CACCC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CACD4: .4byte gTasks
_080CACD8: .4byte gUnknown_03004B00
_080CACDC: .4byte gSpriteTemplate_83D631C
_080CACE0: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CA928

	thumb_func_start sub_80CA9A8
sub_80CA9A8: @ 80CACE4
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r6, _080CAD28
	ldrh r0, [r6, 0x6]
	strh r0, [r4, 0x2E]
	ldr r5, _080CAD2C
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080CAD30
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CAD28: .4byte gUnknown_03004B00
_080CAD2C: .4byte gUnknown_0202F7C8
_080CAD30: .4byte sub_80CA9F8
	thumb_func_end sub_80CA9A8

	thumb_func_start sub_80CA9F8
sub_80CA9F8: @ 80CAD34
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CAD48
	adds r0, r4, 0
	bl move_anim_8072740
_080CAD48:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CA9F8

	thumb_func_start sub_80CAA14
sub_80CAA14: @ 80CAD50
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0x7
	ands r1, r0
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r4, _080CAD98
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CAD9C
	ldrh r0, [r5, 0x20]
	subs r0, 0x14
	b _080CADA0
	.align 2, 0
_080CAD98: .4byte gUnknown_0202F7C8
_080CAD9C:
	ldrh r0, [r5, 0x20]
	adds r0, 0x14
_080CADA0:
	strh r0, [r5, 0x20]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	ands r0, r1
	adds r0, 0x40
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080CAE00
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078D60
	bl Random
	movs r1, 0xFF
	ands r1, r0
	strh r1, [r5, 0x38]
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r0, [r0]
	strh r0, [r5, 0x3A]
	ldr r1, _080CAE04
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAE00: .4byte gUnknown_0202F7C9
_080CAE04: .4byte sub_80CAACC
	thumb_func_end sub_80CAA14

	thumb_func_start sub_80CAACC
sub_80CAACC: @ 80CAE08
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078CE8
	lsls r0, 24
	cmp r0, 0
	beq _080CAE1E
	adds r0, r4, 0
	bl move_anim_8072740
	b _080CAE4E
_080CAE1E:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xC
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7E
	bgt _080CAE3A
	ldrh r0, [r4, 0x3A]
	b _080CAE3E
_080CAE3A:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
_080CAE3E:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	adds r0, 0x18
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
_080CAE4E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CAACC

	thumb_func_start sub_80CAB18
sub_80CAB18: @ 80CAE54
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080CAEB4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CAE74
	ldr r1, _080CAEB8
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080CAE74:
	ldr r4, _080CAEB8
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080CAEBC
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _080CAEC0
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CAEB4: .4byte gUnknown_0202F7C8
_080CAEB8: .4byte gUnknown_03004B00
_080CAEBC: .4byte gUnknown_0202F7C9
_080CAEC0: .4byte sub_80CAB88
	thumb_func_end sub_80CAB18

	thumb_func_start sub_80CAB88
sub_80CAB88: @ 80CAEC4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CAEEE
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	ldr r0, _080CAEF4
	str r0, [r4, 0x1C]
	ldr r1, _080CAEF8
	adds r0, r4, 0
	bl oamt_set_x3A_32
_080CAEEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CAEF4: .4byte sub_80782D8
_080CAEF8: .4byte sub_80CABC0
	thumb_func_end sub_80CAB88

	thumb_func_start sub_80CABC0
sub_80CABC0: @ 80CAEFC
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x3C
	strh r0, [r4, 0x2E]
	ldr r0, _080CAF2C
	str r0, [r4, 0x1C]
	ldr r1, _080CAF30
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CAF2C: .4byte sub_80782D8
_080CAF30: .4byte move_anim_8072740
	thumb_func_end sub_80CABC0

	thumb_func_start sub_80CABF8
sub_80CABF8: @ 80CAF34
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r5, _080CAF78
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080CAF5E
	ldrb r0, [r4, 0x1]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
_080CAF5E:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldr r1, _080CAF7C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CAF78: .4byte gUnknown_03004B00
_080CAF7C: .4byte sub_80CAC44
	thumb_func_end sub_80CABF8

	thumb_func_start sub_80CAC44
sub_80CAC44: @ 80CAF80
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x32]
	adds r1, 0x18
	strh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080CAFD4
	ldr r0, _080CAFD0
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	b _080CAFF8
	.align 2, 0
_080CAFD0: .4byte gUnknown_0202F7C9
_080CAFD4:
	ldr r0, _080CB024
	ldrb r0, [r0]
	bl sub_8079ED4
	adds r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080CAFE8
	movs r2, 0x3
_080CAFE8:
	movs r0, 0x3
	ands r2, r0
	lsls r2, 2
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
_080CAFF8:
	strb r0, [r4, 0x5]
	ldrh r0, [r4, 0x30]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080CB01C
	adds r0, r4, 0
	bl move_anim_8072740
_080CB01C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB024: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CAC44

	thumb_func_start sub_80CACEC
sub_80CACEC: @ 80CB028
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CB042
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080CB04A
_080CB042:
	adds r0, r4, 0
	bl move_anim_task_del
	b _080CB086
_080CB04A:
	ldr r0, _080CB068
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CB070
	ldr r0, _080CB06C
	ldrb r1, [r0]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0]
	b _080CB080
	.align 2, 0
_080CB068: .4byte gUnknown_0202F7C9
_080CB06C: .4byte 0x0400000c
_080CB070:
	ldr r2, _080CB08C
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080CB080:
	adds r0, r4, 0
	bl move_anim_task_del
_080CB086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB08C: .4byte 0x0400000a
	thumb_func_end sub_80CACEC

	thumb_func_start sub_80CAD54
sub_80CAD54: @ 80CB090
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r5, _080CB0D8
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080CB0DC
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x4]
	adds r0, r5
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r4, 0x38]
	ldr r1, _080CB0E0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB0D8: .4byte gUnknown_03004B00
_080CB0DC: .4byte gUnknown_0202F7C8
_080CB0E0: .4byte sub_80CADA8
	thumb_func_end sub_80CAD54

	thumb_func_start sub_80CADA8
sub_80CADA8: @ 80CB0E4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080CB150
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080CB130
	ldr r0, _080CB12C
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	b _080CB13A
	.align 2, 0
_080CB12C: .4byte gUnknown_0202F7C8
_080CB130:
	ldr r0, _080CB14C
	ldrb r0, [r0]
	bl sub_8079E90
	adds r0, 0x1
_080CB13A:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CB156
	.align 2, 0
_080CB14C: .4byte gUnknown_0202F7C8
_080CB150:
	adds r0, r4, 0
	bl move_anim_8072740
_080CB156:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CADA8

	thumb_func_start sub_80CAE20
sub_80CAE20: @ 80CB15C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080CB1A4
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldr r0, _080CB1A8
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x4]
	adds r0, r5
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r4, 0x38]
	ldr r1, _080CB1AC
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB1A4: .4byte gUnknown_03004B00
_080CB1A8: .4byte gUnknown_0202F7C8
_080CB1AC: .4byte sub_80CAE74
	thumb_func_end sub_80CAE20

	thumb_func_start sub_80CAE74
sub_80CAE74: @ 80CB1B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080CB208
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r1, [r4, 0x38]
	adds r0, r1, 0
	subs r0, 0x3B
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _080CB1E8
	adds r0, r1, 0
	subs r0, 0xBB
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _080CB1FC
_080CB1E8:
	ldrb r2, [r4, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	eors r1, r0
	lsls r1, 1
	subs r0, 0x47
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
_080CB1FC:
	ldrh r0, [r4, 0x38]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CB20E
_080CB208:
	adds r0, r4, 0
	bl move_anim_8072740
_080CB20E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CAE74

	thumb_func_start sub_80CAED8
sub_80CAED8: @ 80CB214
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CB250
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _080CB254
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldr r0, _080CB258
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB250: .4byte gUnknown_0202F7C8
_080CB254: .4byte gUnknown_03004B00
_080CB258: .4byte sub_80CAF20
	thumb_func_end sub_80CAED8

	thumb_func_start sub_80CAF20
sub_80CAF20: @ 80CB25C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x32]
	movs r2, 0x32
	ldrsh r3, [r1, r2]
	cmp r3, 0
	bne _080CB290
	ldrh r0, [r1, 0x30]
	movs r2, 0x1
	ands r2, r0
	cmp r2, 0
	beq _080CB27E
	movs r0, 0x80
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
	strh r3, [r1, 0x32]
	b _080CB284
_080CB27E:
	strh r2, [r1, 0x2E]
	strh r2, [r1, 0x30]
	strh r2, [r1, 0x32]
_080CB284:
	ldr r0, _080CB28C
	str r0, [r1, 0x1C]
	b _080CB2A4
	.align 2, 0
_080CB28C: .4byte sub_80CAF6C
_080CB290:
	subs r0, 0x1
	strh r0, [r1, 0x32]
	ldrh r0, [r1, 0x2E]
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x30]
	ldrh r2, [r1, 0x22]
	adds r0, r2
	strh r0, [r1, 0x22]
_080CB2A4:
	pop {r0}
	bx r0
	thumb_func_end sub_80CAF20

	thumb_func_start sub_80CAF6C
sub_80CAF6C: @ 80CB2A8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CB2C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CB2CC
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl Sin
	negs r0, r0
	b _080CB2D6
	.align 2, 0
_080CB2C8: .4byte gUnknown_0202F7C8
_080CB2CC:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x19
	bl Sin
_080CB2D6:
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CB2F6
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
_080CB2F6:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080CB304
	adds r0, r4, 0
	bl move_anim_8072740
_080CB304:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CAF6C

	thumb_func_start sub_80CAFD0
sub_80CAFD0: @ 80CB30C
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080CB360
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CB32C
	ldr r1, _080CB364
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080CB32C:
	ldr r6, _080CB364
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CB36C
	ldr r4, _080CB368
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	b _080CB38C
	.align 2, 0
_080CB360: .4byte gUnknown_0202F7C8
_080CB364: .4byte gUnknown_03004B00
_080CB368: .4byte gUnknown_0202F7C9
_080CB36C:
	ldr r0, _080CB3B8
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
_080CB38C:
	strh r0, [r5, 0x36]
	ldr r0, _080CB3BC
	ldrh r0, [r0, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080CB3C0
	ldrb r0, [r0]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _080CB3B8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080CB3C4
	movs r0, 0x1
	b _080CB3C6
	.align 2, 0
_080CB3B8: .4byte gUnknown_0202F7C9
_080CB3BC: .4byte gUnknown_03004B00
_080CB3C0: .4byte gUnknown_0202F7C8
_080CB3C4:
	movs r0, 0
_080CB3C6:
	strh r0, [r5, 0x2E]
	ldr r0, _080CB3D4
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB3D4: .4byte sub_80CB09C
	thumb_func_end sub_80CAFD0

	thumb_func_start sub_80CB09C
sub_80CB09C: @ 80CB3D8
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r7, 0
	ldrh r5, [r6, 0x2E]
	ldrh r4, [r6, 0x3C]
	movs r0, 0x1
	strh r0, [r6, 0x2E]
	adds r0, r6, 0
	bl sub_8078718
	ldrh r0, [r6, 0x3C]
	strh r5, [r6, 0x2E]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0xC8
	ble _080CB40A
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x37
	bgt _080CB40A
	ldrh r0, [r6, 0x6]
	cmp r0, 0
	bne _080CB410
	adds r0, 0x1
	strh r0, [r6, 0x6]
_080CB40A:
	ldrh r0, [r6, 0x6]
	cmp r0, 0
	beq _080CB442
_080CB410:
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080CB442
	adds r3, r6, 0
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
	ldrh r0, [r6, 0x6]
	adds r0, 0x1
	strh r0, [r6, 0x6]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1E
	bne _080CB442
	movs r7, 0x1
_080CB442:
	movs r2, 0x20
	ldrsh r0, [r6, r2]
	movs r2, 0x24
	ldrsh r1, [r6, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080CB46C
	movs r0, 0x22
	ldrsh r1, [r6, r0]
	movs r2, 0x26
	ldrsh r0, [r6, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080CB46C
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080CB46E
_080CB46C:
	movs r7, 0x1
_080CB46E:
	cmp r7, 0
	beq _080CB478
	adds r0, r6, 0
	bl move_anim_8072740
_080CB478:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB09C

	thumb_func_start sub_80CB144
sub_80CB144: @ 80CB480
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CB4AC
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CB4AC
	ldr r0, _080CB4D4
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
_080CB4AC:
	ldrh r0, [r4, 0x22]
	adds r0, 0x20
	strh r0, [r4, 0x22]
	ldr r1, _080CB4D8
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x36]
	ldr r0, _080CB4DC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB4D4: .4byte gUnknown_0202F7C9
_080CB4D8: .4byte gUnknown_03004B00
_080CB4DC: .4byte sub_80CB1A4
	thumb_func_end sub_80CB144

	thumb_func_start sub_80CB1A4
sub_80CB1A4: @ 80CB4E0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	bne _080CB4F6
	ldrh r0, [r4, 0x22]
	subs r0, 0x2
	strh r0, [r4, 0x22]
	b _080CB504
_080CB4F6:
	cmp r0, 0
	ble _080CB504
	ldrh r0, [r4, 0x22]
	subs r0, 0x2
	strh r0, [r4, 0x22]
	subs r0, r1, 0x2
	strh r0, [r4, 0x30]
_080CB504:
	ldrh r3, [r4, 0x32]
	ldrh r5, [r4, 0x38]
	adds r2, r3, r5
	strh r2, [r4, 0x38]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r5, 0x36
	ldrsh r0, [r4, r5]
	cmp r1, r0
	bge _080CB51C
	adds r0, r2, r3
	strh r0, [r4, 0x38]
_080CB51C:
	ldrh r1, [r4, 0x38]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r5, 0x38
	ldrsh r0, [r4, r5]
	movs r1, 0x5
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _080CB55C
	ldr r0, _080CB558
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	b _080CB56A
	.align 2, 0
_080CB558: .4byte gUnknown_0202F7C9
_080CB55C:
	ldr r0, _080CB594
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
_080CB56A:
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080CB58E
	adds r0, r4, 0
	bl move_anim_8072740
_080CB58E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB594: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80CB1A4

	thumb_func_start sub_80CB25C
sub_80CB25C: @ 80CB598
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8078764
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r4, _080CB5CC
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080CB5D0
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB5CC: .4byte gUnknown_03004B00
_080CB5D0: .4byte sub_80CB298
	thumb_func_end sub_80CB25C

	thumb_func_start sub_80CB298
sub_80CB298: @ 80CB5D4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CB604
	ldrh r1, [r0, 0xE]
	ldr r0, _080CB608
	cmp r1, r0
	bne _080CB5FE
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x2E]
	ldr r0, _080CB60C
	str r0, [r4, 0x1C]
_080CB5FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB604: .4byte gUnknown_03004B00
_080CB608: .4byte 0x0000ffff
_080CB60C: .4byte sub_80CB2D4
	thumb_func_end sub_80CB298

	thumb_func_start sub_80CB2D4
sub_80CB2D4: @ 80CB610
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CB628
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	b _080CB62C
_080CB628:
	ldrh r0, [r4, 0x2E]
	subs r0, 0xB
_080CB62C:
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080CB648
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x32]
_080CB648:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080CB676
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	cmp r0, 0
	ble _080CB670
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	b _080CB676
_080CB670:
	adds r0, r4, 0
	bl move_anim_8072740
_080CB676:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB2D4

	thumb_func_start sub_80CB340
sub_80CB340: @ 80CB67C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080CB6A8
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _080CB6AC
	adds r0, r4, 0
	bl move_anim_task_del
	b _080CB6D2
	.align 2, 0
_080CB6A8: .4byte gSprites
_080CB6AC:
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8078E70
	ldr r1, _080CB6D8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _080CB6DC
	ldrh r1, [r2]
	strh r1, [r0, 0x8]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0xA]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r0, 0x1E]
	ldr r1, _080CB6E0
	str r1, [r0]
_080CB6D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CB6D8: .4byte gTasks
_080CB6DC: .4byte gUnknown_03004B00
_080CB6E0: .4byte sub_80CB3A8
	thumb_func_end sub_80CB340

	thumb_func_start sub_80CB3A8
sub_80CB3A8: @ 80CB6E4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080CB764
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x8]
	ldrh r0, [r4, 0x1C]
	adds r1, r0
	strh r1, [r4, 0x1C]
	ldr r2, _080CB768
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r2
	lsls r1, 16
	asrs r1, 24
	strh r1, [r5, 0x24]
	ldr r0, _080CB76C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CB72E
	ldrh r0, [r5, 0x24]
	negs r0, r0
	strh r0, [r5, 0x24]
_080CB72E:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x10
	strh r0, [r4, 0x1E]
	movs r0, 0x1E
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	adds r0, r6, 0
	bl sub_8079A64
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080CB75C
	strh r0, [r4, 0x8]
	ldr r0, _080CB770
	str r0, [r4]
_080CB75C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB764: .4byte gTasks
_080CB768: .4byte gSprites
_080CB76C: .4byte gUnknown_0202F7C9
_080CB770: .4byte sub_80CB438
	thumb_func_end sub_80CB3A8

	thumb_func_start sub_80CB438
sub_80CB438: @ 80CB774
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080CB7C0
	ldrh r1, [r0, 0xE]
	ldr r0, _080CB7C4
	cmp r1, r0
	bne _080CB7D0
	ldr r0, _080CB7C8
	lsls r2, r3, 2
	adds r1, r2, r3
	lsls r1, 3
	adds r6, r1, r0
	movs r1, 0x8
	ldrsh r5, [r6, r1]
	adds r4, r0, 0
	cmp r5, 0
	bne _080CB7E4
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _080CB7CC
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x24]
	strh r5, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	b _080CB7FE
	.align 2, 0
_080CB7C0: .4byte gUnknown_03004B00
_080CB7C4: .4byte 0x0000ffff
_080CB7C8: .4byte gTasks
_080CB7CC: .4byte gSprites
_080CB7D0:
	ldr r1, _080CB804
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r0, r1
	movs r4, 0x8
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _080CB7FE
_080CB7E4:
	adds r1, r2, r3
	lsls r1, 3
	adds r1, r4
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080CB7FE
	adds r0, r3, 0
	bl move_anim_task_del
_080CB7FE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB804: .4byte gTasks
	thumb_func_end sub_80CB438

	thumb_func_start sub_80CB4CC
sub_80CB4CC: @ 80CB808
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080CB81A
	cmp r0, 0x1
	beq _080CB874
	b _080CB8C6
_080CB81A:
	ldr r6, _080CB86C
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CB832
	ldr r1, _080CB870
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080CB832:
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080CB870
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080CB8C6
	.align 2, 0
_080CB86C: .4byte gUnknown_0202F7C9
_080CB870: .4byte gUnknown_03004B00
_080CB874:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080CB8C6
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
	movs r0, 0x19
	strh r0, [r5, 0x2E]
	ldr r4, _080CB8CC
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080CB8D0
	str r0, [r5, 0x1C]
	ldr r1, _080CB8D4
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080CB8C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CB8CC: .4byte gUnknown_0202F7C8
_080CB8D0: .4byte sub_8078CC0
_080CB8D4: .4byte move_anim_8072740
	thumb_func_end sub_80CB4CC

	thumb_func_start sub_80CB59C
sub_80CB59C: @ 80CB8D8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080CB944
	ldr r4, _080CB950
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _080CB954
	ldrh r0, [r4]
	strh r0, [r5, 0x24]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x26]
	ldrb r0, [r4, 0x4]
	adds r0, 0x1E
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r4, 0x6]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r2, 0x22
	ldrsh r0, [r5, r2]
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	adds r0, r1
	cmp r0, 0x78
	ble _080CB944
	ldrh r0, [r5, 0x22]
	adds r1, r0, 0
	subs r1, 0x78
	ldrh r2, [r5, 0x26]
	adds r0, r2
	adds r1, r0
	strh r1, [r5, 0x22]
_080CB944:
	ldr r0, _080CB958
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CB950: .4byte gUnknown_0202F7C8
_080CB954: .4byte gUnknown_03004B00
_080CB958: .4byte sub_80CB710
	thumb_func_end sub_80CB59C

	thumb_func_start sub_80CB620
sub_80CB620: @ 80CB95C
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	mov r9, r0
	ldr r4, _080CBA38
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r6, _080CBA3C
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	adds r2, r0, 0
	lsls r2, 24
	subs r4, r5
	lsls r4, 16
	lsrs r2, 24
	mov r1, r8
	subs r2, r1
	lsls r2, 16
	lsrs r2, 16
	lsrs r3, r4, 16
	mov r10, r3
	asrs r4, 16
	ldr r6, _080CBA40
	movs r1, 0
	ldrsh r0, [r6, r1]
	muls r0, r4
	movs r1, 0x64
	str r2, [sp]
	bl __divsi3
	adds r5, r0
	mov r3, r9
	strh r5, [r3, 0x20]
	ldr r2, [sp]
	lsls r0, r2, 16
	asrs r0, 16
	movs r3, 0
	ldrsh r1, [r6, r3]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	add r8, r0
	mov r1, r8
	mov r0, r9
	strh r1, [r0, 0x22]
	ldrh r0, [r6, 0x2]
	mov r3, r9
	strh r0, [r3, 0x24]
	ldrh r0, [r6, 0x4]
	strh r0, [r3, 0x26]
	ldrb r0, [r6, 0x6]
	adds r0, 0x1E
	mov r1, r9
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0x8]
	mov r0, r9
	bl StartSpriteAnim
	ldrh r0, [r6, 0xA]
	mov r1, r9
	strh r0, [r1, 0x32]
	ldr r0, _080CBA44
	str r0, [r1, 0x1C]
	ldr r1, _080CBA48
	mov r3, r9
	ldrh r0, [r3, 0x20]
	strh r0, [r1]
	ldrh r0, [r3, 0x22]
	strh r0, [r1, 0x2]
	mov r0, r10
	strh r0, [r1, 0x4]
	ldr r2, [sp]
	strh r2, [r1, 0x6]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBA38: .4byte gUnknown_0202F7C8
_080CBA3C: .4byte gUnknown_0202F7C9
_080CBA40: .4byte gUnknown_03004B00
_080CBA44: .4byte sub_80CB710
_080CBA48: .4byte gUnknown_03000728
	thumb_func_end sub_80CB620

	thumb_func_start sub_80CB710
sub_80CB710: @ 80CBA4C
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	adds r1, 0x1
	strh r1, [r3, 0x2E]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	subs r0, 0xA
	cmp r1, r0
	ble _080CBA8C
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	movs r2, 0x3E
	adds r2, r3
	mov r12, r2
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080CBA8C:
	movs r2, 0x2E
	ldrsh r1, [r3, r2]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r1, r0
	ble _080CBA9E
	adds r0, r3, 0
	bl move_anim_8072740
_080CBA9E:
	pop {r0}
	bx r0
	thumb_func_end sub_80CB710

	thumb_func_start sub_80CB768
sub_80CB768: @ 80CBAA4
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CBAE4
	ldr r5, _080CBB20
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080CBB24
	lsrs r0, 24
	ldrh r2, [r4]
	adds r0, r2
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x30]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x32]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x34]
_080CBAE4:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	strh r0, [r6, 0x2E]
	ldrh r1, [r6, 0x30]
	muls r0, r1
	strh r0, [r6, 0x24]
	movs r2, 0x2E
	ldrsh r1, [r6, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	movs r1, 0xFF
	ands r0, r1
	movs r2, 0x32
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, 0x26]
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	movs r2, 0x34
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080CBB1A
	adds r0, r6, 0
	bl move_anim_8072740
_080CBB1A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBB20: .4byte gUnknown_0202F7C8
_080CBB24: .4byte gUnknown_03004B00
	thumb_func_end sub_80CB768

	thumb_func_start sub_80CB7EC
sub_80CB7EC: @ 80CBB28
	push {r4,r5,lr}
	movs r2, 0x20
	ldrsh r4, [r0, r2]
	lsls r4, 8
	movs r3, 0x22
	ldrsh r2, [r0, r3]
	orrs r4, r2
	movs r5, 0x3A
	ldrsh r2, [r0, r5]
	lsls r2, 8
	movs r5, 0x3C
	ldrsh r3, [r0, r5]
	orrs r2, r3
	lsls r1, 8
	strh r4, [r0, 0x38]
	strh r2, [r0, 0x3A]
	strh r1, [r0, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB7EC

	thumb_func_start sub_80CB814
sub_80CB814: @ 80CBB50
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r8, r0
	ldrh r0, [r0, 0x38]
	lsrs r1, r0, 8
	mov r10, r1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	ldrh r0, [r1, 0x3A]
	lsrs r2, r0, 8
	lsls r0, 24
	lsrs r4, r0, 24
	ldrh r1, [r1, 0x3C]
	lsls r0, r1, 16
	asrs r0, 24
	lsls r0, 16
	lsrs r6, r0, 16
	movs r3, 0xFF
	ands r3, r1
	cmp r2, 0
	bne _080CBB8A
	movs r2, 0x20
	negs r2, r2
	b _080CBB92
_080CBB8A:
	cmp r2, 0xFF
	bne _080CBB92
	movs r2, 0x88
	lsls r2, 1
_080CBB92:
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	mov r1, r10
	subs r0, r2, r1
	lsls r5, r3, 16
	asrs r5, 16
	muls r0, r5
	lsls r1, r6, 16
	asrs r7, r1, 16
	adds r1, r7, 0
	bl __divsi3
	adds r6, r0, 0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	muls r0, r5
	adds r1, r7, 0
	bl __divsi3
	add r6, r10
	mov r1, r8
	strh r6, [r1, 0x20]
	add r0, r9
	strh r0, [r1, 0x22]
	adds r5, 0x1
	lsls r5, 16
	lsrs r3, r5, 16
	asrs r5, 16
	cmp r5, r7
	beq _080CBBE4
	lsls r1, r7, 8
	lsls r0, r3, 16
	asrs r0, 16
	orrs r0, r1
	mov r1, r8
	strh r0, [r1, 0x3C]
	movs r0, 0
	b _080CBBE6
_080CBBE4:
	movs r0, 0x1
_080CBBE6:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80CB814

	thumb_func_start sub_80CB8B8
sub_80CB8B8: @ 80CBBF4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080CBC08
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080CBC08:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	ble _080CBC1C
	adds r0, r4, 0
	bl move_anim_8072740
_080CBC1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB8B8

	thumb_func_start sub_80CB8E8
sub_80CB8E8: @ 80CBC24
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080CBC4E
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080CBC4E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_80CB814
	lsls r0, 24
	cmp r0, 0
	beq _080CBC7E
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	ldr r0, _080CBC84
	str r0, [r4, 0x1C]
_080CBC7E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBC84: .4byte sub_80CB8B8
	thumb_func_end sub_80CB8E8

	thumb_func_start sub_80CB94C
sub_80CB94C: @ 80CBC88
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r4, _080CBCD0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CBCD4
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080CBCD8
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x1
	b _080CBCEA
	.align 2, 0
_080CBCD0: .4byte gUnknown_0202F7C9
_080CBCD4: .4byte gUnknown_0202F7C8
_080CBCD8:
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x3
_080CBCEA:
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CBCFC
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBCFC: .4byte sub_80CB8E8
	thumb_func_end sub_80CB94C

	thumb_func_start sub_80CB9C4
sub_80CB9C4: @ 80CBD00
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080CBD2A
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080CBD2A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	bl sub_80CB814
	lsls r0, 24
	cmp r0, 0
	beq _080CBD5C
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	adds r0, r4, 0
	bl move_anim_8072740
_080CBD5C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CB9C4

	thumb_func_start sub_80CBA28
sub_80CBA28: @ 80CBD64
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080CBDA0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080CBDA8
	strh r0, [r5, 0x3A]
	adds r0, r6, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x28
	bl sub_80CB7EC
	movs r0, 0x3
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CBDA4
	b _080CBDD2
	.align 2, 0
_080CBDA0: .4byte gUnknown_0202F7C9
_080CBDA4: .4byte sub_80CB8E8
_080CBDA8:
	movs r0, 0xFF
	strh r0, [r5, 0x3A]
	adds r0, r6, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CBDC0
	movs r0, 0
	strh r0, [r5, 0x3A]
_080CBDC0:
	adds r0, r5, 0
	movs r1, 0x28
	bl sub_80CB7EC
	movs r0, 0x3
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CBDDC
_080CBDD2:
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBDDC: .4byte sub_80CB9C4
	thumb_func_end sub_80CBA28

	thumb_func_start sub_80CBAA4
sub_80CBAA4: @ 80CBDE0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CBDFA
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	ldr r0, _080CBE20
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x30]
_080CBDFA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	muls r0, r1
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CBE1A
	adds r0, r4, 0
	bl move_anim_8072740
_080CBE1A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBE20: .4byte gUnknown_03004B00
	thumb_func_end sub_80CBAA4

	thumb_func_start sub_80CBAE8
sub_80CBAE8: @ 80CBE24
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_8078764
	ldr r4, _080CBE6C
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CBE70
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080CBE74
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x1
	b _080CBE86
	.align 2, 0
_080CBE6C: .4byte gUnknown_0202F7C8
_080CBE70: .4byte gUnknown_0202F7C9
_080CBE74:
	strh r6, [r5, 0x3A]
	adds r0, r2, 0
	adds r0, 0xA
	strh r0, [r5, 0x3C]
	adds r0, r5, 0
	movs r1, 0x3C
	bl sub_80CB7EC
	movs r0, 0x3
_080CBE86:
	strh r0, [r5, 0x34]
	movs r0, 0x3C
	strh r0, [r5, 0x36]
	ldr r0, _080CBE98
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBE98: .4byte sub_80CBB60
	thumb_func_end sub_80CBAE8

	thumb_func_start sub_80CBB60
sub_80CBB60: @ 80CBE9C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 7
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, 0x2E]
	adds r1, r0
	movs r5, 0
	strh r1, [r4, 0x2E]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	ble _080CBEC6
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x2E]
_080CBEC6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	lsls r2, 3
	movs r1, 0x1E
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	bne _080CBEFA
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
_080CBEFA:
	adds r0, r4, 0
	bl sub_80CB814
	lsls r0, 24
	cmp r0, 0
	beq _080CBF22
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x2E]
	ldr r0, _080CBF28
	str r0, [r4, 0x1C]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x7D
	bl PlaySE12WithPanning
_080CBF22:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CBF28: .4byte sub_80CB8B8
	thumb_func_end sub_80CBB60

	thumb_func_start sub_80CBBF0
sub_80CBBF0: @ 80CBF2C
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CBFC0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CBF54
	ldr r0, _080CBF50
	ldrh r1, [r0, 0x2]
	strh r1, [r4, 0x30]
	movs r1, 0x78
	strh r1, [r4, 0x20]
	adds r5, r0, 0
	b _080CBF76
	.align 2, 0
_080CBF50: .4byte gUnknown_03004B00
_080CBF54:
	ldr r0, _080CBFB0
	movs r1, 0x2
	ldrsh r3, [r0, r1]
	adds r1, r3, 0
	subs r1, 0x20
	adds r2, r1, 0
	adds r5, r0, 0
	cmp r1, 0
	bge _080CBF6A
	adds r2, r3, 0
	adds r2, 0xDF
_080CBF6A:
	asrs r0, r2, 8
	lsls r0, 8
	subs r0, r1, r0
	strh r0, [r4, 0x30]
	movs r0, 0x46
	strh r0, [r4, 0x20]
_080CBF76:
	ldrh r0, [r5]
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x32]
	movs r0, 0x14
	strh r0, [r4, 0x36]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3C
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	ldr r0, _080CBFB4
	str r0, [r4, 0x1C]
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _080CBFB8
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
	b _080CBFBE
	.align 2, 0
_080CBFB0: .4byte gUnknown_03004B00
_080CBFB4: .4byte sub_80CBC8C
_080CBFB8:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
_080CBFBE:
	strb r0, [r1]
_080CBFC0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBBF0

	thumb_func_start sub_80CBC8C
sub_80CBC8C: @ 80CBFC8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080CBFDA
	cmp r0, 0x1
	beq _080CC00A
	b _080CC02A
_080CBFDA:
	ldrh r5, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x4E
	ble _080CBFF2
	movs r0, 0x1
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080CC02A
_080CBFF2:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	adds r0, r5, r0
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x36]
	adds r1, 0x3
	strh r1, [r4, 0x36]
	strh r0, [r4, 0x22]
	b _080CC02A
_080CC00A:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080CC02A
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080CC02A
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldr r0, _080CC030
	str r0, [r4, 0x1C]
_080CC02A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CC030: .4byte sub_80CBCF8
	thumb_func_end sub_80CBC8C

	thumb_func_start sub_80CBCF8
sub_80CBCF8: @ 80CC034
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080CC078
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r3, r0, r1
	adds r0, r5, 0x1
	adds r0, r3, r0
	ldrh r2, [r4, 0x32]
	movs r6, 0x32
	ldrsh r1, [r4, r6]
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r1, r0
	bne _080CC080
	adds r0, r5, 0x2
	adds r0, r3, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x7F
	bne _080CC06C
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080CC07C
	str r0, [r4, 0x1C]
_080CC06C:
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080CC0E6
	.align 2, 0
_080CC078: .4byte gUnknown_083D680C
_080CC07C: .4byte sub_80CBDB0
_080CC080:
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	adds r1, r0, r5
	movs r2, 0
	ldrsb r2, [r1, r2]
	adds r1, r5, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r0, r2
	ldrh r1, [r4, 0x30]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080CC0CE
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xBE
	bhi _080CC0C6
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
	b _080CC0CC
_080CC0C6:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
_080CC0CC:
	strb r0, [r1]
_080CC0CE:
	movs r6, 0x30
	ldrsh r0, [r4, r6]
	movs r1, 0x3C
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
_080CC0E6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBCF8

	thumb_func_start sub_80CBDB0
sub_80CBDB0: @ 80CC0EC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	ble _080CC0FE
	adds r0, r4, 0
	bl move_anim_8072740
_080CC0FE:
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBDB0

	thumb_func_start sub_80CBDF4
sub_80CBDF4: @ 80CC130
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080CC284
	adds r5, r0, r1
	ldr r4, _080CC288
	ldrb r0, [r4]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x1
	strh r0, [r5, 0x10]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_807A100
	strh r0, [r5, 0x1C]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_807A100
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0x1
	bne _080CC198
	movs r1, 0x1
_080CC198:
	strh r1, [r5, 0x12]
	movs r3, 0x12
	ldrsh r0, [r5, r3]
	lsls r0, 6
	movs r1, 0x38
	subs r1, r0
	strh r1, [r5, 0x1A]
	ldrh r0, [r5, 0x16]
	subs r0, r1
	ldrh r1, [r5, 0x14]
	adds r0, r1
	strh r0, [r5, 0x18]
	ldr r0, _080CC28C
	movs r2, 0x18
	ldrsh r1, [r5, r2]
	movs r3, 0x1A
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xC]
	cmp r0, 0x40
	bne _080CC1D0
	adds r0, r6, 0
	bl move_anim_task_del
_080CC1D0:
	ldr r4, _080CC290
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xA
	strh r1, [r0, 0x2E]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x18]
	strh r1, [r0, 0x30]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r5, r3]
	muls r1, r0
	ldrh r0, [r5, 0x14]
	subs r0, r1
	strh r0, [r2, 0x32]
	movs r0, 0xC
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x1A]
	strh r1, [r0, 0x34]
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	lsrs r2, r0, 31
	adds r0, r2
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r2, [r5, r3]
	muls r0, r2
	ldrh r2, [r5, 0x16]
	adds r0, r2
	strh r0, [r1, 0x36]
	movs r3, 0xC
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_80CC338
	movs r1, 0xC
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x38]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl sub_80786EC
	ldr r0, _080CC294
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CC284: .4byte gTasks
_080CC288: .4byte gUnknown_0202F7C9
_080CC28C: .4byte gSpriteTemplate_83D6884
_080CC290: .4byte gSprites
_080CC294: .4byte sub_80CBF5C
	thumb_func_end sub_80CBDF4

	thumb_func_start sub_80CBF5C
sub_80CBF5C: @ 80CC298
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080CC2DC
	adds r6, r0, r1
	movs r0, 0xC
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080CC2E0
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r5, [r6, r1]
	cmp r5, 0x7
	bne _080CC2C0
	b _080CC4F0
_080CC2C0:
	cmp r5, 0x7
	bgt _080CC30E
	cmp r5, 0x3
	bne _080CC2CA
	b _080CC3E2
_080CC2CA:
	cmp r5, 0x3
	bgt _080CC2E4
	cmp r5, 0x1
	beq _080CC374
	cmp r5, 0x1
	bgt _080CC3C4
	cmp r5, 0
	beq _080CC356
	b _080CC66C
	.align 2, 0
_080CC2DC: .4byte gTasks
_080CC2E0: .4byte gSprites
_080CC2E4:
	cmp r5, 0x5
	bne _080CC2EA
	b _080CC458
_080CC2EA:
	cmp r5, 0x5
	ble _080CC2F0
	b _080CC4D2
_080CC2F0:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC306
	b _080CC66C
_080CC306:
	movs r0, 0x5
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC66A
_080CC30E:
	cmp r5, 0xB
	bne _080CC314
	b _080CC5D4
_080CC314:
	cmp r5, 0xB
	bgt _080CC342
	cmp r5, 0x9
	bne _080CC31E
	b _080CC542
_080CC31E:
	cmp r5, 0x9
	ble _080CC324
	b _080CC5B8
_080CC324:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC33A
	b _080CC66C
_080CC33A:
	movs r0, 0x9
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC66A
_080CC342:
	cmp r5, 0xD
	bne _080CC348
	b _080CC646
_080CC348:
	cmp r5, 0xD
	bge _080CC34E
	b _080CC626
_080CC34E:
	cmp r5, 0xFF
	bne _080CC354
	b _080CC656
_080CC354:
	b _080CC66C
_080CC356:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC36C
	b _080CC66C
_080CC36C:
	movs r0, 0x1
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC66A
_080CC374:
	ldrh r2, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r2, r3
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x16]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r0, [r6, 0x10]
	adds r0, 0x2
	strh r0, [r6, 0x10]
	strh r5, [r6, 0xE]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC66A
_080CC3C4:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC3DA
	b _080CC66C
_080CC3DA:
	movs r0, 0x3
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC66A
_080CC3E2:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r1, r0
	ldrh r0, [r6, 0x14]
	subs r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	muls r1, r0
	ldrh r0, [r6, 0x16]
	subs r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	movs r0, 0x2
	strh r0, [r6, 0xE]
	ldrh r0, [r6, 0x10]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC66A
_080CC458:
	ldrh r1, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r1, r3
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r0, r1
	ldrh r1, [r6, 0x14]
	adds r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r2, 0x1E
	ldrsh r0, [r6, r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r0, r1
	ldrh r1, [r6, 0x16]
	adds r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	subs r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x3
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC66A
_080CC4D2:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080CC4E8
	b _080CC66C
_080CC4E8:
	movs r0, 0x7
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC66A
_080CC4F0:
	ldrh r2, [r4, 0x24]
	ldrh r3, [r4, 0x20]
	adds r2, r3
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x14]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x16]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	adds r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x4
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC66A
_080CC542:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	movs r0, 0
	strh r1, [r4, 0x20]
	ldrh r2, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r2, r3
	strh r2, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r3, 0x12
	ldrsh r1, [r6, r3]
	muls r1, r0
	ldrh r0, [r6, 0x14]
	subs r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	movs r1, 0x1E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	adds r0, 0xA
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	muls r0, r1
	ldrh r3, [r6, 0x16]
	adds r0, r3
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	movs r0, 0x5
	strh r0, [r6, 0xE]
	ldrh r0, [r6, 0x10]
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC66A
_080CC5B8:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CC66C
	movs r0, 0xB
	strh r0, [r6, 0x26]
	movs r0, 0xFF
	b _080CC66A
_080CC5D4:
	ldrh r2, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r2, r0
	movs r0, 0
	strh r2, [r4, 0x20]
	ldrh r1, [r4, 0x26]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0xA
	strh r0, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrh r0, [r6, 0x18]
	strh r0, [r4, 0x32]
	strh r1, [r4, 0x34]
	ldrh r0, [r6, 0x1A]
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_80CC338
	strh r0, [r4, 0x38]
	ldrh r1, [r6, 0x10]
	subs r1, 0x2
	strh r1, [r6, 0x10]
	movs r0, 0x6
	strh r0, [r6, 0xE]
	adds r0, r4, 0
	adds r0, 0x43
	strb r1, [r0]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	bl sub_80786EC
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC66A
_080CC626:
	adds r0, r6, 0
	adds r1, r2, 0
	bl sub_80CC358
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080CC66C
	adds r0, r4, 0
	bl DestroySprite
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	b _080CC66A
_080CC646:
	movs r1, 0x20
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CC66C
	adds r0, r2, 0
	bl move_anim_task_del
	b _080CC66C
_080CC656:
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080CC66C
	movs r0, 0
	strh r0, [r6, 0xA]
	ldrh r0, [r6, 0x26]
_080CC66A:
	strh r0, [r6, 0x8]
_080CC66C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CBF5C

	thumb_func_start sub_80CC338
sub_80CC338: @ 80CC674
	push {lr}
	movs r2, 0x8
	movs r3, 0x36
	ldrsh r1, [r0, r3]
	movs r3, 0x22
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _080CC68A
	negs r0, r2
	lsls r0, 16
	lsrs r2, r0, 16
_080CC68A:
	lsls r0, r2, 16
	asrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80CC338

	thumb_func_start sub_80CC358
sub_80CC358: @ 80CC694
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	ldrh r0, [r6, 0x24]
	adds r0, 0x1
	strh r0, [r6, 0x24]
	lsls r0, 16
	cmp r0, 0
	ble _080CC72A
	movs r0, 0
	strh r0, [r6, 0x24]
	ldr r0, _080CC734
	mov r8, r0
	movs r2, 0xC
	ldrsh r1, [r6, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	ldrh r2, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r2, r0
	ldr r0, _080CC738
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	ldrb r3, [r6, 0x10]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080CC72A
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	mov r0, r8
	adds r4, r5, r0
	strh r7, [r4, 0x3A]
	movs r0, 0xC
	strh r0, [r4, 0x3C]
	ldr r0, _080CC73C
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldrh r2, [r6, 0x22]
	movs r0, 0x1
	ands r0, r2
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
	ldrb r1, [r6, 0xE]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r6, 0x10]
	adds r4, 0x43
	strb r0, [r4]
	mov r0, r8
	adds r0, 0x1C
	adds r5, r0
	ldr r0, _080CC740
	str r0, [r5]
_080CC72A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC734: .4byte gSprites
_080CC738: .4byte gSpriteTemplate_83D6884
_080CC73C: .4byte gTasks
_080CC740: .4byte sub_80CC408
	thumb_func_end sub_80CC358

	thumb_func_start sub_80CC408
sub_80CC408: @ 80CC744
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CC7A6
	movs r0, 0
	strh r0, [r4, 0x2E]
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
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CC7A6
	ldr r3, _080CC7AC
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080CC7A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CC7AC: .4byte gTasks
	thumb_func_end sub_80CC408

	thumb_func_start sub_80CC474
sub_80CC474: @ 80CC7B0
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080CC7C4
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CC7CC
	ldr r0, _080CC7C8
	b _080CC7CE
	.align 2, 0
_080CC7C4: .4byte gUnknown_03004B00
_080CC7C8: .4byte gUnknown_0202F7C8
_080CC7CC:
	ldr r0, _080CC7EC
_080CC7CE:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CC7F8
	movs r0, 0
	strh r0, [r4, 0x36]
	ldr r1, _080CC7F0
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080CC7F4
	b _080CC808
	.align 2, 0
_080CC7EC: .4byte gUnknown_0202F7C9
_080CC7F0: .4byte gUnknown_03004B00
_080CC7F4: .4byte 0x0000fff0
_080CC7F8:
	movs r0, 0x1
	strh r0, [r4, 0x36]
	ldr r1, _080CC82C
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r4, 0x32]
	movs r0, 0x80
	lsls r0, 1
_080CC808:
	strh r0, [r4, 0x20]
	adds r7, r1, 0
	adds r5, r7, 0
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x34]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080CC83E
	cmp r0, 0x1
	bgt _080CC830
	cmp r0, 0
	beq _080CC83A
	b _080CC8A8
	.align 2, 0
_080CC82C: .4byte gUnknown_03004B00
_080CC830:
	cmp r0, 0x2
	beq _080CC844
	cmp r0, 0x3
	beq _080CC870
	b _080CC8A8
_080CC83A:
	ldrh r0, [r5]
	b _080CC854
_080CC83E:
	ldrh r0, [r5]
	strh r0, [r4, 0x22]
	b _080CC88A
_080CC844:
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5]
	adds r0, r5
_080CC854:
	strh r0, [r4, 0x22]
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080CC8A8
_080CC870:
	ldr r0, _080CC8B4
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r7, [r7]
	adds r0, r7
	strh r0, [r4, 0x22]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
_080CC88A:
	adds r0, r6, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_080CC8A8:
	ldr r0, _080CC8B8
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC8B4: .4byte gUnknown_0202F7C9
_080CC8B8: .4byte sub_80CC580
	thumb_func_end sub_80CC474

	thumb_func_start sub_80CC580
sub_80CC580: @ 80CC8BC
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x3C
	ldrsh r3, [r4, r0]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x30
	ldrsh r2, [r4, r1]
	ldr r1, _080CC910
	movs r5, 0x2E
	ldrsh r0, [r4, r5]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	muls r0, r2
	asrs r0, 8
	strh r0, [r4, 0x26]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	muls r0, r3
	strh r0, [r4, 0x24]
	movs r5, 0x34
	ldrsh r0, [r4, r5]
	muls r0, r3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CC914
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	movs r5, 0x20
	ldrsh r1, [r4, r5]
	adds r0, r1
	cmp r0, 0xF7
	ble _080CC92C
	b _080CC926
	.align 2, 0
_080CC910: .4byte gSineTable
_080CC914:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bgt _080CC92C
_080CC926:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CC92C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CC580

	thumb_func_start sub_80CC5F8
sub_80CC5F8: @ 80CC934
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080CC954
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080CC958
	cmp r0, 0x1
	beq _080CC98C
	b _080CC9E6
	.align 2, 0
_080CC954: .4byte gTasks
_080CC958:
	ldr r0, _080CC984
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r2, 0x80
	lsls r2, 1
	adds r4, r2, 0
	adds r0, r4
	strh r0, [r5, 0x18]
	ldr r0, _080CC988
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	adds r0, r4
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080CC9E6
	.align 2, 0
_080CC984: .4byte 0x0000274f
_080CC988: .4byte 0x000027b0
_080CC98C:
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x1A]
	lsls r0, 16
	cmp r0, 0
	blt _080CC9E6
	strh r7, [r5, 0x1A]
	ldrh r0, [r5, 0x18]
	ldrb r2, [r5, 0x1C]
	ldr r4, _080CCA00
	movs r3, 0x1E
	ldrsh r1, [r5, r3]
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r5, 0x20]
	ldrb r2, [r5, 0x1C]
	movs r3, 0x1E
	ldrsh r1, [r5, r3]
	lsls r1, 1
	adds r1, r4
	ldrh r3, [r1]
	movs r1, 0x10
	bl BlendPalette
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	bne _080CC9E6
	strh r7, [r5, 0x1C]
	ldrh r0, [r5, 0x1E]
	adds r0, 0x1
	strh r0, [r5, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bne _080CC9E6
	strh r7, [r5, 0x1E]
_080CC9E6:
	ldr r0, _080CCA04
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080CC9FA
	adds r0, r6, 0
	bl move_anim_task_del
_080CC9FA:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCA00: .4byte gUnknown_083D6984
_080CCA04: .4byte gUnknown_03004B00
	thumb_func_end sub_80CC5F8

	thumb_func_start sub_80CC6CC
sub_80CC6CC: @ 80CCA08
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r1, _080CCA20
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080CCA24
	adds r0, r6, 0
	bl move_anim_8072740
	b _080CCAFE
	.align 2, 0
_080CCA20: .4byte gUnknown_03004B00
_080CCA24:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080CCA34
	ldr r4, _080CCA30
	b _080CCA36
	.align 2, 0
_080CCA30: .4byte gUnknown_0202F7C8
_080CCA34:
	ldr r4, _080CCA70
_080CCA36:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080CCA74
	ldrh r1, [r0, 0x8]
	strh r1, [r6, 0x2E]
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	adds r7, r0, 0
	cmp r1, 0
	bne _080CCA78
	ldrh r0, [r7, 0x4]
	adds r0, r5
	strh r0, [r6, 0x20]
	ldrh r0, [r7, 0x6]
	adds r0, r2
	strh r0, [r6, 0x22]
	strh r5, [r6, 0x38]
	strh r2, [r6, 0x3A]
	b _080CCA88
	.align 2, 0
_080CCA70: .4byte gUnknown_0202F7C9
_080CCA74: .4byte gUnknown_03004B00
_080CCA78:
	strh r5, [r6, 0x20]
	strh r2, [r6, 0x22]
	ldrh r0, [r7, 0x4]
	adds r0, r5
	strh r0, [r6, 0x38]
	ldrh r0, [r7, 0x6]
	adds r0, r2
	strh r0, [r6, 0x3A]
_080CCA88:
	ldrh r4, [r6, 0x20]
	lsls r0, r4, 4
	strh r0, [r6, 0x30]
	ldrh r5, [r6, 0x22]
	lsls r0, r5, 4
	strh r0, [r6, 0x32]
	movs r1, 0x38
	ldrsh r0, [r6, r1]
	movs r2, 0x20
	ldrsh r1, [r6, r2]
	subs r0, r1
	lsls r0, 4
	movs r3, 0x8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, 0x34]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x22
	ldrsh r1, [r6, r2]
	subs r0, r1
	lsls r0, 4
	movs r3, 0x8
	ldrsh r1, [r7, r3]
	bl __divsi3
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x38]
	subs r0, r4
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r6, 0x3A]
	subs r1, r5
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CCAEA
	ldr r1, _080CCB08
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080CCAEA:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r6, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldr r0, _080CCB0C
	str r0, [r6, 0x1C]
_080CCAFE:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCB08: .4byte 0xffff8000
_080CCB0C: .4byte sub_80CC7D4
	thumb_func_end sub_80CC6CC

	thumb_func_start sub_80CC7D4
sub_80CC7D4: @ 80CCB10
	push {r4,lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080CCB40
	ldrh r0, [r2, 0x34]
	ldrh r4, [r2, 0x30]
	adds r0, r4
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	ldrh r4, [r2, 0x32]
	adds r1, r4
	strh r1, [r2, 0x32]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r2, 0x22]
	subs r0, r3, 0x1
	strh r0, [r2, 0x2E]
	b _080CCB46
_080CCB40:
	adds r0, r2, 0
	bl move_anim_8074EE0
_080CCB46:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CC7D4

	thumb_func_start sub_80CC810
sub_80CC810: @ 80CCB4C
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CCB62
	adds r0, r2, 0
	bl move_anim_8072740
_080CCB62:
	pop {r0}
	bx r0
	thumb_func_end sub_80CC810

	thumb_func_start sub_80CC82C
sub_80CC82C: @ 80CCB68
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CCB88
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CCB90
	ldr r2, _080CCB8C
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	b _080CCB9C
	.align 2, 0
_080CCB88: .4byte gUnknown_0202F7C8
_080CCB8C: .4byte gUnknown_03004B00
_080CCB90:
	ldr r0, _080CCBB4
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
_080CCB9C:
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080CCBB8
	str r0, [r4, 0x1C]
	ldr r1, _080CCBBC
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCBB4: .4byte gUnknown_03004B00
_080CCBB8: .4byte sub_8078600
_080CCBBC: .4byte move_anim_8072740
	thumb_func_end sub_80CC82C

	thumb_func_start sub_80CC884
sub_80CC884: @ 80CCBC0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080CCBF8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CCBDA
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080CCBDA:
	ldr r0, _080CCBFC
	str r0, [r5, 0x1C]
	ldr r4, _080CCC00
	movs r0, 0
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCBF8: .4byte gUnknown_0202F7C8
_080CCBFC: .4byte sub_80CC810
_080CCC00: .4byte gUnknown_03004B00
	thumb_func_end sub_80CC884

	thumb_func_start sub_80CC8C8
sub_80CC8C8: @ 80CCC04
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080CCC44
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x38]
	ldrb r1, [r1, 0xC]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _080CCC48
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CCC4C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCC44: .4byte gUnknown_03004B00
_080CCC48: .4byte move_anim_8074EE0
_080CCC4C: .4byte sub_8078504
	thumb_func_end sub_80CC8C8

	thumb_func_start sub_80CC914
sub_80CC914: @ 80CCC50
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080CCCA0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CCC84
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
_080CCC84:
	ldr r0, _080CCCA4
	str r0, [r5, 0x1C]
	ldr r0, _080CCCA8
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080CCCAC
	ldrh r0, [r3]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	b _080CCCC0
	.align 2, 0
_080CCCA0: .4byte gUnknown_0202F7C9
_080CCCA4: .4byte sub_80CCB00
_080CCCA8: .4byte gUnknown_03004B00
_080CCCAC:
	ldrh r0, [r5, 0x20]
	ldrh r1, [r3]
	subs r0, r1
	strh r0, [r5, 0x20]
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080CCCC0:
	ldrh r0, [r3, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldr r1, _080CCCF4
	adds r0, r1, 0
	ldrh r2, [r5, 0x30]
	adds r1, r0, r2
	strh r1, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
	ldrh r0, [r3, 0x4]
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CCCEE
	negs r0, r1
	strh r0, [r5, 0x30]
_080CCCEE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCCF4: .4byte 0xfffffc00
	thumb_func_end sub_80CC914

	thumb_func_start sub_80CC9BC
sub_80CC9BC: @ 80CCCF8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r0, _080CCD14
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080CCD18
	cmp r0, 0x1
	ble _080CCD94
	cmp r0, 0x2
	beq _080CCD38
	b _080CCD94
	.align 2, 0
_080CCD14: .4byte gUnknown_03004B00
_080CCD18:
	ldr r5, _080CCD34
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r5]
	eors r4, r0
	adds r0, r4, 0
	b _080CCDA4
	.align 2, 0
_080CCD34: .4byte gUnknown_0202F7C9
_080CCD38:
	ldr r5, _080CCD90
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5]
	movs r2, 0x2
	mov r8, r2
	mov r1, r8
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080CCDAE
	ldrb r0, [r5]
	mov r2, r8
	eors r0, r2
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	lsrs r7, r0, 1
	ldrb r0, [r5]
	mov r1, r8
	eors r0, r1
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	lsrs r4, r0, 1
	b _080CCDAE
	.align 2, 0
_080CCD90: .4byte gUnknown_0202F7C9
_080CCD94:
	ldr r4, _080CCDE0
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r0, [r4]
_080CCDA4:
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r4, r0, 24
_080CCDAE:
	strh r7, [r6, 0x20]
	strh r4, [r6, 0x22]
	ldr r0, _080CCDE0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CCDC6
	ldrh r0, [r6, 0x22]
	adds r0, 0x8
	strh r0, [r6, 0x22]
_080CCDC6:
	ldr r0, _080CCDE4
	str r0, [r6, 0x1C]
	ldr r0, _080CCDE8
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080CCDEC
	ldrh r0, [r3]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	strh r0, [r6, 0x20]
	b _080CCE00
	.align 2, 0
_080CCDE0: .4byte gUnknown_0202F7C9
_080CCDE4: .4byte sub_80CCB00
_080CCDE8: .4byte gUnknown_03004B00
_080CCDEC:
	ldrh r0, [r6, 0x20]
	ldrh r1, [r3]
	subs r0, r1
	strh r0, [r6, 0x20]
	adds r2, r6, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080CCE00:
	ldrh r0, [r3, 0x2]
	ldrh r2, [r6, 0x22]
	adds r0, r2
	strh r0, [r6, 0x22]
	ldr r1, _080CCE38
	adds r0, r1, 0
	ldrh r2, [r6, 0x30]
	adds r1, r0, r2
	strh r1, [r6, 0x30]
	movs r2, 0x80
	lsls r2, 3
	adds r0, r2, 0
	ldrh r2, [r6, 0x32]
	adds r0, r2
	strh r0, [r6, 0x32]
	ldrh r0, [r3, 0x4]
	strh r0, [r6, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CCE2E
	negs r0, r1
	strh r0, [r6, 0x30]
_080CCE2E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CCE38: .4byte 0xfffffc00
	thumb_func_end sub_80CC9BC

	thumb_func_start sub_80CCB00
sub_80CCB00: @ 80CCE3C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r0, r1, r2
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CCE5E
	adds r0, r1, 0
	adds r0, 0x18
	b _080CCE62
_080CCE5E:
	adds r0, r1, 0
	subs r0, 0x18
_080CCE62:
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	subs r0, 0x18
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080CCE98
	ldr r1, _080CCEA0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	ldr r0, _080CCEA4
	str r0, [r4, 0x1C]
_080CCE98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CCEA0: .4byte move_anim_8072740
_080CCEA4: .4byte sub_80782D8
	thumb_func_end sub_80CCB00

	thumb_func_start unref_sub_80CCB6C
unref_sub_80CCB6C: @ 80CCEA8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x32]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	ble _080CCF4C
	ldrh r1, [r5, 0x34]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CCF04
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x5
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r3]
	ldr r4, _080CCF00
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r3, [r0]
	adds r1, r2, 0
	ands r1, r3
	strb r1, [r0]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	b _080CCF3A
	.align 2, 0
_080CCF00: .4byte gSprites
_080CCF04:
	adds r1, r5, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldr r3, _080CCF48
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	orrs r1, r2
	strb r1, [r0]
_080CCF3A:
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	b _080CCF50
	.align 2, 0
_080CCF48: .4byte gSprites
_080CCF4C:
	adds r0, r1, 0x1
	strh r0, [r5, 0x32]
_080CCF50:
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0xA
	bne _080CCF80
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080CCF88
	adds r0, r4
	bl DestroySprite
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	adds r0, r5, 0
	bl move_anim_8072740
_080CCF80:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCF88: .4byte gSprites
	thumb_func_end unref_sub_80CCB6C

	thumb_func_start sub_80CCC50
sub_80CCC50: @ 80CCF8C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080CCFAC
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080CCFB0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CCFB4
	ldrh r0, [r5, 0x20]
	ldrh r1, [r4]
	subs r0, r1
	b _080CCFBA
	.align 2, 0
_080CCFAC: .4byte gUnknown_03004B00
_080CCFB0: .4byte gUnknown_0202F7C8
_080CCFB4:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080CCFBA:
	strh r0, [r5, 0x20]
	ldr r4, _080CCFE8
	ldrb r1, [r4, 0xA]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x6]
	negs r0, r0
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080CCFEC
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CCFE8: .4byte gUnknown_03004B00
_080CCFEC: .4byte sub_80CCCB4
	thumb_func_end sub_80CCC50

	thumb_func_start sub_80CCCB4
sub_80CCCB4: @ 80CCFF0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x64
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0x14
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	bgt _080CD01C
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0
	b _080CD022
_080CD01C:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0xE
_080CD022:
	strb r0, [r1]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x2E]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x82
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080CD058
	adds r0, r4, 0
	bl move_anim_8072740
_080CD058:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CCCB4

	thumb_func_start sub_80CCD24
sub_80CCD24: @ 80CD060
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CD076
	ldr r1, _080CD0D4
	ldrh r0, [r1, 0x2]
	adds r0, 0x8
	strh r0, [r1, 0x2]
_080CD076:
	ldr r6, _080CD0D8
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	ldr r4, _080CD0D4
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CD0B4
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CD0DC
_080CD0B4:
	ldrb r0, [r6]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
	b _080CD0F4
	.align 2, 0
_080CD0D4: .4byte gUnknown_03004B00
_080CD0D8: .4byte gUnknown_0202F7C8
_080CD0DC:
	ldrb r0, [r6]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
_080CD0F4:
	ldr r0, _080CD134
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080CD138
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3
	strh r0, [r5, 0x32]
	movs r2, 0x10
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	ldr r1, _080CD13C
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	ldr r3, _080CD140
	ldrh r1, [r5, 0x3C]
	lsls r0, r1, 8
	subs r2, r1
	orrs r0, r2
	strh r0, [r3]
	ldr r0, _080CD144
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD134: .4byte gUnknown_03004B00
_080CD138: .4byte 0x00002828
_080CD13C: .4byte 0x04000050
_080CD140: .4byte 0x04000052
_080CD144: .4byte sub_80CCE0C
	thumb_func_end sub_80CCD24

	thumb_func_start sub_80CCE0C
sub_80CCE0C: @ 80CD148
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x60
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CD1A6
	movs r0, 0
	strh r0, [r4, 0x30]
	ldr r1, _080CD1EC
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r5, [r0]
	movs r2, 0
	adds r6, r1, 0
	adds r3, r6, 0
_080CD180:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	adds r2, 0x1
	adds r0, r2
	lsls r1, r0, 1
	adds r1, r3
	adds r0, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	cmp r2, 0x5
	ble _080CD180
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	adds r0, 0x7
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_080CD1A6:
	ldrh r2, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	ble _080CD1DA
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _080CD1F4
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CD1DA
	movs r0, 0
	strh r0, [r4, 0x3A]
	subs r2, 0x1
	strh r2, [r4, 0x3C]
	ldr r3, _080CD1F0
	lsls r1, r2, 8
	movs r0, 0x10
	subs r0, r2
	orrs r1, r0
	strh r1, [r3]
_080CD1DA:
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CD1F4
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080CD230
	.align 2, 0
_080CD1EC: .4byte gPlttBufferFaded
_080CD1F0: .4byte 0x04000052
_080CD1F4:
	ldrh r0, [r4, 0x3A]
	adds r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CD230
	movs r0, 0
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r1, 0x1
	strh r1, [r4, 0x3C]
	ldr r3, _080CD238
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080CD230
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080CD23C
	str r0, [r4, 0x1C]
_080CD230:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD238: .4byte 0x04000052
_080CD23C: .4byte sub_807861C
	thumb_func_end sub_80CCE0C

	thumb_func_start sub_80CCF04
sub_80CCF04: @ 80CD240
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080CD298
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080CD29C
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r4, 0x34]
	strh r5, [r4, 0x36]
	strh r5, [r4, 0x3A]
	movs r0, 0x10
	strh r0, [r4, 0x3C]
	ldr r1, _080CD2A0
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080CD2A4
	ldrh r0, [r4, 0x3C]
	lsls r0, 8
	ldrh r1, [r4, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080CD2A8
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD298: .4byte gUnknown_0202F7C9
_080CD29C: .4byte 0x0000ffe8
_080CD2A0: .4byte 0x04000050
_080CD2A4: .4byte 0x04000052
_080CD2A8: .4byte sub_80CCF70
	thumb_func_end sub_80CCF04

	thumb_func_start sub_80CCF70
sub_80CCF70: @ 80CD2AC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080CD2BA
	b _080CD3FC
_080CD2BA:
	lsls r0, 2
	ldr r1, _080CD2C4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CD2C4: .4byte _080CD2C8
	.align 2, 0
_080CD2C8:
	.4byte _080CD2DC
	.4byte _080CD340
	.4byte _080CD35C
	.4byte _080CD3D8
	.4byte _080CD3EC
_080CD2DC:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	cmp r0, 0
	bgt _080CD2EA
	b _080CD3FC
_080CD2EA:
	movs r0, 0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CD30C
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080CD31A
	adds r0, r1, 0x1
	strh r0, [r4, 0x3A]
	b _080CD31A
_080CD30C:
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CD31A
	subs r0, r1, 0x1
	strh r0, [r4, 0x3C]
_080CD31A:
	ldr r2, _080CD33C
	ldrh r0, [r4, 0x3C]
	lsls r0, 8
	ldrh r1, [r4, 0x3A]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080CD3FC
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CD3FC
	strh r0, [r4, 0x30]
	b _080CD3E4
	.align 2, 0
_080CD33C: .4byte 0x04000052
_080CD340:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CD3FC
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080CD3E4
_080CD35C:
	adds r0, r4, 0
	movs r1, 0x10
	movs r2, 0x4
	bl sub_80CD0CC
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080CD37E
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080CD37E:
	ldrh r0, [r4, 0x32]
	adds r1, r0, 0x1
	strh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080CD3FC
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080CD3A4
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080CD3B2
	subs r0, r1, 0x1
	strh r0, [r4, 0x3A]
	b _080CD3B2
_080CD3A4:
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080CD3B2
	adds r0, r1, 0x1
	strh r0, [r4, 0x3C]
_080CD3B2:
	ldr r0, _080CD3D4
	ldrh r1, [r4, 0x3C]
	lsls r1, 8
	ldrh r2, [r4, 0x3A]
	orrs r1, r2
	strh r1, [r0]
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080CD3FC
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bne _080CD3FC
	strh r1, [r4, 0x30]
	strh r1, [r4, 0x32]
	b _080CD3E4
	.align 2, 0
_080CD3D4: .4byte 0x04000052
_080CD3D8:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080CD3E4:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080CD3FC
_080CD3EC:
	ldr r0, _080CD404
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r4, 0
	bl move_anim_8072740
_080CD3FC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD404: .4byte 0x04000050
	thumb_func_end sub_80CCF70

	thumb_func_start sub_80CD0CC
sub_80CD0CC: @ 80CD408
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0xB
	bgt _080CD41A
	ldrh r0, [r4, 0x36]
	adds r0, 0x2
	strh r0, [r4, 0x36]
_080CD41A:
	ldrh r5, [r4, 0x34]
	adds r0, r5, 0
	subs r0, 0x12
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	cmp r0, 0x17
	bhi _080CD430
	ldrh r0, [r4, 0x36]
	subs r0, 0x2
	strh r0, [r4, 0x36]
_080CD430:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _080CD43E
	ldrh r0, [r4, 0x36]
	adds r0, 0x2
	strh r0, [r4, 0x36]
_080CD43E:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0x9
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl __divsi3
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	bge _080CD464
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x26]
_080CD464:
	adds r0, r5, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _080CD474
	movs r0, 0
	strh r0, [r4, 0x34]
_080CD474:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD0CC

	thumb_func_start sub_80CD140
sub_80CD140: @ 80CD47C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CD4C0
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080CD490
	adds r0, r4, 0
	bl sub_8078650
_080CD490:
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x32]
	ldr r1, _080CD4C4
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CD4C8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CD4C0: .4byte gUnknown_03004B00
_080CD4C4: .4byte move_anim_8072740
_080CD4C8: .4byte sub_8078394
	thumb_func_end sub_80CD140

	thumb_func_start sub_80CD190
sub_80CD190: @ 80CD4CC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080CD4E0
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CD4E8
	ldr r0, _080CD4E4
	b _080CD4EA
	.align 2, 0
_080CD4E0: .4byte gUnknown_03004B00
_080CD4E4: .4byte gUnknown_0202F7C8
_080CD4E8:
	ldr r0, _080CD52C
_080CD4EA:
	ldrb r6, [r0]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080CD534
	movs r1, 0x2
	adds r0, r6, 0
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080CD534
	ldr r4, _080CD530
	ldrb r1, [r4, 0xC]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	adds r0, r6, 0
	bl sub_807A3FC
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	b _080CD584
	.align 2, 0
_080CD52C: .4byte gUnknown_0202F7C9
_080CD530: .4byte gUnknown_03004B00
_080CD534:
	ldr r4, _080CD554
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CD558
	adds r0, r6, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	b _080CD56A
	.align 2, 0
_080CD554: .4byte gUnknown_03004B00
_080CD558:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
_080CD56A:
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r5, 0x22]
	ldr r0, _080CD5A4
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r0, r5, 0
	bl sub_807867C
_080CD584:
	ldr r1, _080CD5A4
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x32]
	ldr r1, _080CD5A8
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080CD5AC
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD5A4: .4byte gUnknown_03004B00
_080CD5A8: .4byte move_anim_8072740
_080CD5AC: .4byte sub_8078394
	thumb_func_end sub_80CD190

	thumb_func_start sub_80CD274
sub_80CD274: @ 80CD5B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080CD5DC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CD5E4
	ldr r0, _080CD5E0
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	b _080CD5FE
	.align 2, 0
_080CD5DC: .4byte gUnknown_0202F7C8
_080CD5E0: .4byte gUnknown_03004B00
_080CD5E4:
	ldr r2, _080CD608
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080CD5FE:
	ldr r0, _080CD60C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD608: .4byte gUnknown_03004B00
_080CD60C: .4byte sub_80CD2D4
	thumb_func_end sub_80CD274

	thumb_func_start sub_80CD2D4
sub_80CD2D4: @ 80CD610
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080CD648
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r0, 0x1E
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r4, 0x26]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 18
	asrs r0, 16
	movs r1, 0x3
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080CD648:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CD65C
	adds r0, r4, 0
	bl move_anim_8072740
_080CD65C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD2D4

	thumb_func_start sub_80CD328
sub_80CD328: @ 80CD664
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080CD694
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CD69C
	ldr r1, _080CD698
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x1
	strh r0, [r4, 0x34]
	b _080CD6BA
	.align 2, 0
_080CD694: .4byte gUnknown_0202F7C8
_080CD698: .4byte gUnknown_03004B00
_080CD69C:
	ldr r2, _080CD6C4
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldr r0, _080CD6C8
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080CD6BA:
	ldr r0, _080CD6CC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD6C4: .4byte gUnknown_03004B00
_080CD6C8: .4byte 0x0000ffff
_080CD6CC: .4byte sub_80CD394
	thumb_func_end sub_80CD328

	thumb_func_start sub_80CD394
sub_80CD394: @ 80CD6D0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl __divsi3
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	lsls r0, 1
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080CD714
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CD714:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD394

	thumb_func_start sub_80CD3E0
sub_80CD3E0: @ 80CD71C
	push {lr}
	ldrh r1, [r0, 0x20]
	subs r1, 0x20
	strh r1, [r0, 0x20]
	ldrh r1, [r0, 0x22]
	subs r1, 0x20
	strh r1, [r0, 0x22]
	movs r1, 0x14
	strh r1, [r0, 0x2E]
	ldr r1, _080CD73C
	str r1, [r0, 0x1C]
	ldr r1, _080CD740
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080CD73C: .4byte sub_80782D8
_080CD740: .4byte sub_80CD408
	thumb_func_end sub_80CD3E0

	thumb_func_start sub_80CD408
sub_80CD408: @ 80CD744
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r6, [r5, 0x38]
	movs r1, 0x1
	adds r0, r1, 0
	ands r0, r6
	cmp r0, 0
	beq _080CD75A
	cmp r0, 0x1
	beq _080CD774
	b _080CD7DA
_080CD75A:
	strh r1, [r5, 0x2E]
	ldr r0, _080CD76C
	str r0, [r5, 0x1C]
	ldr r1, _080CD770
	adds r0, r5, 0
	bl oamt_set_x3A_32
	b _080CD7DA
	.align 2, 0
_080CD76C: .4byte sub_80782D8
_080CD770: .4byte sub_80CD408
_080CD774:
	ldrh r3, [r5, 0x24]
	ldrh r0, [r5, 0x20]
	adds r3, r0
	movs r0, 0
	strh r3, [r5, 0x20]
	ldrh r4, [r5, 0x26]
	ldrh r1, [r5, 0x22]
	adds r4, r1
	strh r4, [r5, 0x22]
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	ldr r2, _080CD7E8
	lsls r0, r6, 16
	asrs r0, 24
	lsls r0, 1
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r3, r1
	strh r3, [r5, 0x32]
	adds r2, 0x1
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r4, r0
	strh r4, [r5, 0x36]
	ldr r0, _080CD7EC
	str r0, [r5, 0x1C]
	ldr r1, _080CD7F0
	adds r0, r5, 0
	bl oamt_set_x3A_32
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1, 0
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xD2
	bl PlaySE12WithPanning
_080CD7DA:
	ldrh r0, [r5, 0x38]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x38]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CD7E8: .4byte gUnknown_083D6DDC
_080CD7EC: .4byte sub_8078B34
_080CD7F0: .4byte sub_80CD4B8
	thumb_func_end sub_80CD408

	thumb_func_start sub_80CD4B8
sub_80CD4B8: @ 80CD7F4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x38]
	lsls r0, 16
	asrs r0, 24
	cmp r0, 0x4
	bne _080CD81C
	movs r0, 0xA
	strh r0, [r2, 0x2E]
	ldr r0, _080CD814
	str r0, [r2, 0x1C]
	ldr r1, _080CD818
	adds r0, r2, 0
	bl oamt_set_x3A_32
	b _080CD820
	.align 2, 0
_080CD814: .4byte sub_80782D8
_080CD818: .4byte sub_80CD4EC
_080CD81C:
	ldr r0, _080CD824
	str r0, [r2, 0x1C]
_080CD820:
	pop {r0}
	bx r0
	.align 2, 0
_080CD824: .4byte sub_80CD408
	thumb_func_end sub_80CD4B8

	thumb_func_start sub_80CD4EC
sub_80CD4EC: @ 80CD828
	push {r4-r7,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x6]
	cmp r1, 0
	bne _080CD850
	movs r0, 0x3
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	strh r1, [r5, 0x32]
	ldr r0, _080CD848
	str r0, [r5, 0x1C]
	ldr r1, _080CD84C
	adds r0, r5, 0
	bl oamt_set_x3A_32
	b _080CD8D0
	.align 2, 0
_080CD848: .4byte sub_80782D8
_080CD84C: .4byte sub_80CD5A8
_080CD850:
	ldrh r0, [r5, 0x6]
	cmp r0, 0x2
	beq _080CD870
	cmp r0, 0x2
	bgt _080CD860
	cmp r0, 0x1
	beq _080CD866
	b _080CD884
_080CD860:
	cmp r0, 0x3
	beq _080CD878
	b _080CD884
_080CD866:
	ldr r6, _080CD86C
	adds r7, r6, 0
	b _080CD888
	.align 2, 0
_080CD86C: .4byte 0x0000fff8
_080CD870:
	ldr r7, _080CD874
	b _080CD886
	.align 2, 0
_080CD874: .4byte 0x0000fff8
_080CD878:
	movs r7, 0x8
	ldr r6, _080CD880
	b _080CD888
	.align 2, 0
_080CD880: .4byte 0x0000fff8
_080CD884:
	movs r7, 0x8
_080CD886:
	movs r6, 0x8
_080CD888:
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080CD8D8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080CD8DC
	str r0, [r5, 0x1C]
	ldr r1, _080CD8E0
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080CD8D0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CD8D8: .4byte gUnknown_0202F7C9
_080CD8DC: .4byte sub_8078B34
_080CD8E0: .4byte sub_80CD654
	thumb_func_end sub_80CD4EC

	thumb_func_start sub_80CD5A8
sub_80CD5A8: @ 80CD8E4
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CD904
	ldrh r0, [r4, 0x30]
	adds r0, 0x3
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080CD914
	movs r0, 0x10
	b _080CD912
_080CD904:
	ldrh r0, [r4, 0x30]
	subs r0, 0x3
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080CD914
	movs r0, 0
_080CD912:
	strh r0, [r4, 0x30]
_080CD914:
	movs r0, 0x1
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80791A8
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080CD970
	bl BlendPalettes
	movs r3, 0x30
	ldrsh r0, [r4, r3]
	cmp r0, 0x10
	bne _080CD97C
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrb r1, [r4, 0x5]
	lsrs r1, 4
	lsls r0, r1, 5
	ldr r2, _080CD974
	adds r0, r2
	lsls r1, 4
	ldr r3, _080CD978
	adds r2, r3, 0
	orrs r1, r2
	movs r2, 0x4
	bl LoadPalette
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC0
	bl PlaySE12WithPanning
	b _080CD984
	.align 2, 0
_080CD970: .4byte 0x00007fff
_080CD974: .4byte 0x0202ecd8
_080CD978: .4byte 0x00000101
_080CD97C:
	cmp r0, 0
	bne _080CD984
	ldr r0, _080CD98C
	str r0, [r4, 0x1C]
_080CD984:
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CD98C: .4byte sub_80CD654
	thumb_func_end sub_80CD5A8

	thumb_func_start sub_80CD654
sub_80CD654: @ 80CD990
	push {lr}
	adds r2, r0, 0
	ldr r0, _080CD9AC
	ldrh r1, [r0, 0xE]
	ldr r0, _080CD9B0
	cmp r1, r0
	bne _080CD9A8
	movs r0, 0
	strh r0, [r2, 0x30]
	strh r0, [r2, 0x2E]
	ldr r0, _080CD9B4
	str r0, [r2, 0x1C]
_080CD9A8:
	pop {r0}
	bx r0
	.align 2, 0
_080CD9AC: .4byte gUnknown_03004B00
_080CD9B0: .4byte 0x0000ffff
_080CD9B4: .4byte sub_80CD67C
	thumb_func_end sub_80CD654

	thumb_func_start sub_80CD67C
sub_80CD67C: @ 80CD9B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080CD9EC
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
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
_080CD9EC:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _080CDA00
	adds r0, r4, 0
	bl move_anim_8072740
_080CDA00:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD67C

	thumb_func_start sub_80CD6CC
sub_80CD6CC: @ 80CDA08
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, _080CDA28
	ldrh r0, [r0]
	strh r0, [r3, 0x6]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CDA2C
	ldrh r0, [r3, 0x20]
	subs r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	subs r0, 0x18
	strh r0, [r3, 0x22]
	b _080CDA7E
	.align 2, 0
_080CDA28: .4byte gUnknown_03004B00
_080CDA2C:
	cmp r0, 0x2
	bne _080CDA48
	ldrh r0, [r3, 0x20]
	subs r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	adds r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x20
	b _080CDA7A
_080CDA48:
	cmp r0, 0x3
	bne _080CDA64
	ldrh r0, [r3, 0x20]
	adds r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	subs r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	b _080CDA7A
_080CDA64:
	ldrh r0, [r3, 0x20]
	adds r0, 0x18
	strh r0, [r3, 0x20]
	ldrh r0, [r3, 0x22]
	adds r0, 0x18
	strh r0, [r3, 0x22]
	ldrb r1, [r3, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x30
_080CDA7A:
	orrs r0, r1
	strb r0, [r3, 0x3]
_080CDA7E:
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r4, _080CDAA4
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080CDAA8
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldr r1, _080CDAAC
	str r1, [r3, 0x1C]
	adds r0, r3, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CDAA4: .4byte 0x000003ff
_080CDAA8: .4byte 0xfffffc00
_080CDAAC: .4byte sub_80CD3E0
	thumb_func_end sub_80CD6CC

	thumb_func_start sub_80CD774
sub_80CD774: @ 80CDAB0
	push {lr}
	adds r3, r0, 0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	strh r0, [r3, 0x2E]
	ldr r0, _080CDAD8
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080CDAEC
	cmp r0, 0x1
	bgt _080CDADC
	cmp r0, 0
	beq _080CDAE2
	b _080CDAFC
	.align 2, 0
_080CDAD8: .4byte gUnknown_03004B00
_080CDADC:
	cmp r0, 0x2
	beq _080CDAF4
	b _080CDAFC
_080CDAE2:
	ldr r0, _080CDAE8
	b _080CDAFE
	.align 2, 0
_080CDAE8: .4byte sub_80CD7CC
_080CDAEC:
	ldr r0, _080CDAF0
	b _080CDAFE
	.align 2, 0
_080CDAF0: .4byte sub_80CD8A8
_080CDAF4:
	ldr r0, _080CDAF8
	b _080CDAFE
	.align 2, 0
_080CDAF8: .4byte sub_80CD8F8
_080CDAFC:
	ldr r0, _080CDB04
_080CDAFE:
	str r0, [r3, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_080CDB04: .4byte sub_80CD9B8
	thumb_func_end sub_80CD774

	thumb_func_start sub_80CD7CC
sub_80CD7CC: @ 80CDB08
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x6
	strh r0, [r4, 0x2E]
	ldr r5, _080CDB48
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	beq _080CDB26
	movs r1, 0x2
_080CDB26:
	strh r1, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080CDB4C
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	ldr r1, _080CDB50
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CDB54
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDB48: .4byte gUnknown_0202F7C8
_080CDB4C: .4byte gUnknown_02024BE0
_080CDB50: .4byte sub_80CD81C
_080CDB54: .4byte sub_8078458
	thumb_func_end sub_80CD7CC

	thumb_func_start sub_80CD81C
sub_80CD81C: @ 80CDB58
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r6, [r5, r0]
	cmp r6, 0
	bne _080CDB94
	ldr r1, _080CDBD4
	ldr r4, _080CDBD8
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5, 0x34]
	movs r1, 0
	bl sub_8078E70
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	ldr r2, _080CDBDC
	adds r1, r2, 0
	cmp r0, 0
	beq _080CDB90
	movs r0, 0xC0
	lsls r0, 2
	adds r1, r0, 0
_080CDB90:
	strh r1, [r5, 0x36]
	strh r6, [r5, 0x38]
_080CDB94:
	ldrh r0, [r5, 0x36]
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r5, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CDBCE
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080CDBE0
	str r0, [r5, 0x1C]
_080CDBCE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDBD4: .4byte gUnknown_02024BE0
_080CDBD8: .4byte gUnknown_0202F7C8
_080CDBDC: .4byte 0xfffffd00
_080CDBE0: .4byte sub_80CD9B8
	thumb_func_end sub_80CD81C

	thumb_func_start sub_80CD8A8
sub_80CD8A8: @ 80CDBE4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	ldr r5, _080CDC24
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x3
	cmp r0, 0
	beq _080CDC02
	movs r0, 0x3
	negs r0, r0
	adds r1, r0, 0
_080CDC02:
	strh r1, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080CDC28
	ldrb r0, [r5]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x34]
	ldr r1, _080CDC2C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CDC30
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDC24: .4byte gUnknown_0202F7C8
_080CDC28: .4byte gUnknown_02024BE0
_080CDC2C: .4byte sub_80CD9B8
_080CDC30: .4byte sub_8078458
	thumb_func_end sub_80CD8A8

	thumb_func_start sub_80CD8F8
sub_80CD8F8: @ 80CDC34
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CDC4E
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080CDC54
	str r0, [r1, 0x1C]
_080CDC4E:
	pop {r0}
	bx r0
	.align 2, 0
_080CDC54: .4byte sub_80CD91C
	thumb_func_end sub_80CD8F8

	thumb_func_start sub_80CD91C
sub_80CD91C: @ 80CDC58
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080CDCA8
	ldr r1, _080CDC94
	ldr r4, _080CDC98
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CDC9C
	movs r0, 0xFC
	lsls r0, 8
	strh r0, [r5, 0x36]
	movs r0, 0xC0
	lsls r0, 4
	b _080CDCA6
	.align 2, 0
_080CDC94: .4byte gUnknown_02024BE0
_080CDC98: .4byte gUnknown_0202F7C8
_080CDC9C:
	movs r0, 0x80
	lsls r0, 3
	strh r0, [r5, 0x36]
	movs r0, 0xF4
	lsls r0, 8
_080CDCA6:
	strh r0, [r5, 0x38]
_080CDCA8:
	ldrh r0, [r5, 0x36]
	ldrh r1, [r5, 0x38]
	adds r0, r1
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r5, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080CDCE8
	ldrh r0, [r5, 0x34]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	ldr r0, _080CDCF0
	str r0, [r5, 0x1C]
_080CDCE8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CDCF0: .4byte sub_80CD9B8
	thumb_func_end sub_80CD91C

	thumb_func_start sub_80CD9B8
sub_80CD9B8: @ 80CDCF4
	push {lr}
	bl move_anim_8072740
	pop {r0}
	bx r0
	thumb_func_end sub_80CD9B8

	thumb_func_start sub_80CD9C4
sub_80CD9C4: @ 80CDD00
	movs r1, 0
	strh r1, [r0, 0x2E]
	ldr r1, _080CDD0C
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080CDD0C: .4byte sub_80CD9D4
	thumb_func_end sub_80CD9C4

	thumb_func_start sub_80CD9D4
sub_80CD9D4: @ 80CDD10
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080CDD6A
	cmp r5, 0x1
	bgt _080CDD26
	cmp r5, 0
	beq _080CDD2C
	b _080CDDFE
_080CDD26:
	cmp r5, 0x2
	beq _080CDDBC
	b _080CDDFE
_080CDD2C:
	strh r5, [r4, 0x30]
	ldr r1, _080CDDB0
	ldr r2, _080CDDB4
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r4, 0x32]
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldr r2, _080CDDB8
	adds r1, r2, 0
	cmp r0, 0
	beq _080CDD54
	movs r0, 0x80
	lsls r0, 2
	adds r1, r0, 0
_080CDD54:
	strh r1, [r4, 0x36]
	strh r5, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080CDD6A:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CDDFE
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080CDDFE
	.align 2, 0
_080CDDB0: .4byte gUnknown_02024BE0
_080CDDB4: .4byte gUnknown_0202F7C8
_080CDDB8: .4byte 0xfffffe00
_080CDDBC:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x38]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F9C
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CDDFE
	ldrh r0, [r4, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	adds r0, r4, 0
	bl move_anim_8072740
_080CDDFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CD9D4

	thumb_func_start sub_80CDAC8
sub_80CDAC8: @ 80CDE04
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080CDE48
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldr r1, _080CDE4C
	ldr r2, _080CDE50
	ldrb r0, [r2]
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0
	strh r0, [r5, 0x8]
	ldrb r0, [r2]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r2, r0, 24
	strh r2, [r5, 0xA]
	strh r4, [r5, 0xC]
	ldr r0, _080CDE54
	movs r3, 0
	ldrsh r1, [r0, r3]
	cmp r1, 0
	beq _080CDE58
	cmp r1, 0x1
	beq _080CDE74
	adds r0, r6, 0
	bl move_anim_task_del
	b _080CDE92
	.align 2, 0
_080CDE48: .4byte gTasks
_080CDE4C: .4byte gUnknown_02024BE0
_080CDE50: .4byte gUnknown_0202F7C8
_080CDE54: .4byte gUnknown_03004B00
_080CDE58:
	strh r1, [r5, 0xC]
	movs r0, 0x8
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	movs r0, 0x3
	strh r0, [r5, 0x12]
	cmp r2, 0
	bne _080CDE6C
	negs r0, r0
	strh r0, [r5, 0x12]
_080CDE6C:
	ldr r0, _080CDE70
	b _080CDE90
	.align 2, 0
_080CDE70: .4byte sub_80CDB60
_080CDE74:
	movs r0, 0x8
	strh r0, [r5, 0xE]
	movs r0, 0xC0
	lsls r0, 3
	strh r0, [r5, 0x10]
	movs r1, 0xC0
	strh r1, [r5, 0x12]
	cmp r2, 0
	bne _080CDE8E
	negs r0, r0
	strh r0, [r5, 0x10]
	negs r0, r1
	strh r0, [r5, 0x12]
_080CDE8E:
	ldr r0, _080CDE98
_080CDE90:
	str r0, [r5]
_080CDE92:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CDE98: .4byte sub_80CDD20
	thumb_func_end sub_80CDAC8

	thumb_func_start sub_80CDB60
sub_80CDB60: @ 80CDE9C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080CDEC0
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080CDEB6
	b _080CE056
_080CDEB6:
	lsls r0, 2
	ldr r1, _080CDEC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CDEC0: .4byte gTasks
_080CDEC4: .4byte _080CDEC8
	.align 2, 0
_080CDEC8:
	.4byte _080CDEDC
	.4byte _080CDF0E
	.4byte _080CDF68
	.4byte _080CDFE0
	.4byte _080CE024
_080CDEDC:
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _080CDEEC
	ldrh r2, [r4, 0x12]
	ldrh r3, [r4, 0x10]
	adds r2, r3
	b _080CE032
_080CDEEC:
	movs r0, 0x8
	strh r0, [r4, 0xE]
	strh r1, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0xC0
	cmp r0, 0
	bne _080CDF02
	movs r2, 0xC0
	negs r2, r2
	adds r1, r2, 0
_080CDF02:
	strh r1, [r4, 0x12]
	ldrb r0, [r4, 0x8]
	movs r1, 0
	bl sub_8078E70
	b _080CE018
_080CDF0E:
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CDF34
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x10]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8078F9C
	b _080CE044
_080CDF34:
	movs r0, 0x8
	strh r0, [r4, 0xE]
	ldr r2, _080CDF64
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080CDF5A
	movs r1, 0x2
_080CDF5A:
	strh r1, [r4, 0x12]
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080CE018
	.align 2, 0
_080CDF64: .4byte gSprites
_080CDF68:
	ldrh r2, [r4, 0xE]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CDFC4
	ldrh r1, [r4, 0x14]
	movs r3, 0x14
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CDF82
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	b _080CE056
_080CDF82:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _080CDFA4
	ldr r2, _080CDFA0
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x12]
	ldrh r2, [r4, 0x10]
	adds r1, r2
	b _080CDFB8
	.align 2, 0
_080CDFA0: .4byte gSprites
_080CDFA4:
	ldr r2, _080CDFC0
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	ldrh r2, [r4, 0x12]
	subs r1, r2
_080CDFB8:
	strh r1, [r0, 0x24]
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _080CE044
	.align 2, 0
_080CDFC0: .4byte gSprites
_080CDFC4:
	ldr r2, _080CDFDC
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	strh r1, [r0, 0x24]
	movs r0, 0xC
	strh r0, [r4, 0xE]
	b _080CE018
	.align 2, 0
_080CDFDC: .4byte gSprites
_080CDFE0:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080CDFF0
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080CE056
_080CDFF0:
	movs r0, 0x3
	strh r0, [r4, 0xE]
	ldr r2, _080CE020
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x24]
	strh r0, [r4, 0x10]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x8
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080CE016
	movs r1, 0x8
_080CE016:
	strh r1, [r4, 0x12]
_080CE018:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _080CE056
	.align 2, 0
_080CE020: .4byte gSprites
_080CE024:
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080CE050
	ldrh r2, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r2, r0
_080CE032:
	strh r2, [r4, 0x10]
	ldr r3, _080CE04C
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x24]
_080CE044:
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080CE056
	.align 2, 0
_080CE04C: .4byte gSprites
_080CE050:
	adds r0, r2, 0
	bl move_anim_task_del
_080CE056:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CDB60

	thumb_func_start sub_80CDD20
sub_80CDD20: @ 80CE05C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080CE098
	adds r4, r0, r1
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080CE09C
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r2, 0x80
	lsls r2, 1
	ldrh r3, [r4, 0x10]
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8078F9C
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080CE0A8
	.align 2, 0
_080CE098: .4byte gTasks
_080CE09C:
	ldrb r0, [r4, 0x8]
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
_080CE0A8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80CDD20

	thumb_func_start sub_80CDD74
sub_80CDD74: @ 80CE0B0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080CE0C4
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CE0CC
	ldr r4, _080CE0C8
	b _080CE0CE
	.align 2, 0
_080CE0C4: .4byte gUnknown_03004B00
_080CE0C8: .4byte gUnknown_0202F7C8
_080CE0CC:
	ldr r4, _080CE10C
_080CE0CE:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	movs r0, 0
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	ldr r1, _080CE110
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080CE114
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE10C: .4byte gUnknown_0202F7C9
_080CE110: .4byte sub_80CDEC0
_080CE114: .4byte sub_8078600
	thumb_func_end sub_80CDD74

	thumb_func_start sub_80CDDDC
sub_80CDDDC: @ 80CE118
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080CE150
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080CE154
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r1, _080CE158
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CE15C
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE150: .4byte gUnknown_0202F7C9
_080CE154: .4byte 0x0000ffd0
_080CE158: .4byte sub_80CDE78
_080CE15C: .4byte sub_8078600
	thumb_func_end sub_80CDDDC

	thumb_func_start sub_80CDE24
sub_80CDE24: @ 80CE160
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _080CE1A4
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080CE1A8
	ldr r2, _080CE1AC
	adds r0, r2
	ldrh r1, [r1]
	adds r0, r1
	movs r6, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	strh r6, [r4, 0x2E]
	strh r6, [r4, 0x30]
	ldr r0, _080CE1B0
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE1A4: .4byte gUnknown_0202F7C9
_080CE1A8: .4byte gUnknown_03004B00
_080CE1AC: .4byte 0x0000ffd0
_080CE1B0: .4byte sub_80CDEC0
	thumb_func_end sub_80CDE24

	thumb_func_start sub_80CDE78
sub_80CDE78: @ 80CE1B4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CE1DE
	movs r0, 0xC
	strh r0, [r4, 0x2E]
	movs r0, 0x8
	strh r0, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	ldr r1, _080CE1E4
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CE1E8
	str r0, [r4, 0x1C]
_080CE1DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE1E4: .4byte sub_80CDEB0
_080CE1E8: .4byte sub_8078364
	thumb_func_end sub_80CDE78

	thumb_func_start sub_80CDEB0
sub_80CDEB0: @ 80CE1EC
	movs r1, 0
	strh r1, [r0, 0x2E]
	strh r1, [r0, 0x30]
	ldr r1, _080CE1F8
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080CE1F8: .4byte sub_80CDEC0
	thumb_func_end sub_80CDEB0

	thumb_func_start sub_80CDEC0
sub_80CDEC0: @ 80CE1FC
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CE244
	movs r0, 0
	strh r0, [r3, 0x2E]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080CE244
	adds r0, r3, 0
	bl move_anim_8072740
_080CE244:
	pop {r0}
	bx r0
	thumb_func_end sub_80CDEC0

	thumb_func_start sub_80CDF0C
sub_80CDF0C: @ 80CE248
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080CE25C
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CE264
	ldr r4, _080CE260
	b _080CE266
	.align 2, 0
_080CE25C: .4byte gUnknown_03004B00
_080CE260: .4byte gUnknown_0202F7C8
_080CE264:
	ldr r4, _080CE2A0
_080CE266:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x2]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x4]
	adds r0, r6
	strh r0, [r5, 0x22]
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080CE2A4
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x30]
	ldr r0, _080CE2A8
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE2A0: .4byte gUnknown_0202F7C9
_080CE2A4: .4byte gUnknown_03004B00
_080CE2A8: .4byte sub_80CDF70
	thumb_func_end sub_80CDF0C

	thumb_func_start sub_80CDF70
sub_80CDF70: @ 80CE2AC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x30
	ldrsh r1, [r2, r3]
	cmp r0, r1
	ble _080CE2CC
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x22]
	subs r0, 0x1
	strh r0, [r2, 0x22]
_080CE2CC:
	ldrh r0, [r2, 0x22]
	ldrh r1, [r2, 0x2E]
	subs r0, r1
	strh r0, [r2, 0x22]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CE2E8
	adds r0, r2, 0
	bl move_anim_8072740
_080CE2E8:
	pop {r0}
	bx r0
	thumb_func_end sub_80CDF70

	thumb_func_start sub_80CDFB0
sub_80CDFB0: @ 80CE2EC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080CE334
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0xC
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	movs r0, 0x2
	strh r0, [r4, 0x30]
	strh r5, [r4, 0x32]
	strh r5, [r4, 0x34]
	strh r5, [r4, 0x36]
	subs r0, 0x42
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x38]
	ldr r0, _080CE338
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE334: .4byte gUnknown_0202F7C8
_080CE338: .4byte sub_80CE000
	thumb_func_end sub_80CDFB0

	thumb_func_start sub_80CE000
sub_80CE000: @ 80CE33C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080CE3A8
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080CE38E
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080CE38E
	ldrh r1, [r4, 0x38]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xC2
	bl PlaySE12WithPanning
_080CE38E:
	movs r1, 0
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CE3A8
	strh r1, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_080CE3A8:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080CE3D2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	ble _080CE3D2
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080CE3D2
	adds r0, r4, 0
	bl move_anim_8072740
_080CE3D2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CE000

	thumb_func_start sub_80CE09C
sub_80CE09C: @ 80CE3D8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080CE422
	ldr r4, _080CE438
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r5, _080CE43C
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x2]
	adds r0, r5
	strh r0, [r6, 0x22]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CE41C
	ldrh r0, [r6, 0x22]
	adds r0, 0xA
	strh r0, [r6, 0x22]
_080CE41C:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	strh r0, [r6, 0x2E]
_080CE422:
	ldr r0, _080CE43C
	ldrh r1, [r0, 0xE]
	ldr r0, _080CE440
	cmp r1, r0
	bne _080CE432
	adds r0, r6, 0
	bl move_anim_8072740
_080CE432:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CE438: .4byte gUnknown_0202F7C8
_080CE43C: .4byte gUnknown_03004B00
_080CE440: .4byte 0x0000ffff
	thumb_func_end sub_80CE09C

	thumb_func_start sub_80CE108
sub_80CE108: @ 80CE444
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080CE464
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080CE470
	ldr r1, _080CE468
	ldr r0, _080CE46C
	strh r0, [r1, 0xE]
	b _080CE4A8
	.align 2, 0
_080CE464: .4byte gTasks
_080CE468: .4byte gUnknown_03004B00
_080CE46C: .4byte 0x0000ffff
_080CE470:
	cmp r0, 0x2
	bne _080CE47C
	adds r0, r2, 0
	bl move_anim_task_del
	b _080CE4AE
_080CE47C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080CE4AE
	movs r0, 0
	strh r0, [r4, 0x8]
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	ldr r3, _080CE4B4
	lsls r2, r1, 8
	movs r0, 0x10
	subs r0, r1
	orrs r2, r0
	strh r2, [r3]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x10
	bne _080CE4AE
_080CE4A8:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_080CE4AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE4B4: .4byte 0x04000052
	thumb_func_end sub_80CE108

	thumb_func_start sub_80CE17C
sub_80CE17C: @ 80CE4B8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8078764
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080CE4E0
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080CE4E4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE4E0: .4byte gUnknown_03004B00
_080CE4E4: .4byte sub_80CE1AC
	thumb_func_end sub_80CE17C

	thumb_func_start sub_80CE1AC
sub_80CE1AC: @ 80CE4E8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080CE4FC
	subs r0, r1, 0x1
	strh r0, [r5, 0x2E]
	b _080CE538
_080CE4FC:
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1E
	strh r0, [r5, 0x2E]
	ldr r4, _080CE540
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080CE544
	str r0, [r5, 0x1C]
	ldr r1, _080CE548
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080CE538:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE540: .4byte gUnknown_0202F7C8
_080CE544: .4byte sub_8078B34
_080CE548: .4byte move_anim_8072740
	thumb_func_end sub_80CE1AC

	thumb_func_start sub_80CE210
sub_80CE210: @ 80CE54C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080CE594
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080CE58E
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r1, [r3, 0xA]
	adds r1, 0x1
	strh r1, [r3, 0xA]
	ldr r2, _080CE598
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0x10
	bne _080CE58E
	adds r0, r4, 0
	bl move_anim_task_del
_080CE58E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE594: .4byte gTasks
_080CE598: .4byte 0x04000052
	thumb_func_end sub_80CE210

	thumb_func_start unref_sub_80CE260
unref_sub_80CE260: @ 80CE59C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	ldr r0, _080CE604
	ldrb r0, [r0]
	cmp r4, r0
	bcs _080CE5F8
	ldr r6, _080CE608
	ldr r5, _080CE60C
_080CE5B0:
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _080CE5CC
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CE5CC
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_8043DB0
_080CE5CC:
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bne _080CE5EA
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CE5EA
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_8043DB0
_080CE5EA:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080CE604
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080CE5B0
_080CE5F8:
	adds r0, r7, 0
	bl move_anim_task_del
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE604: .4byte gUnknown_02024A68
_080CE608: .4byte gUnknown_03004B00
_080CE60C: .4byte gUnknown_03004340
	thumb_func_end unref_sub_80CE260

	thumb_func_start unref_sub_80CE2D4
unref_sub_80CE2D4: @ 80CE610
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _080CE62A
_080CE61A:
	ldr r0, _080CE640
	adds r0, r4, r0
	ldrb r0, [r0]
	bl sub_8043DFC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080CE62A:
	ldr r0, _080CE644
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080CE61A
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CE640: .4byte gUnknown_03004340
_080CE644: .4byte gUnknown_02024A68
	thumb_func_end unref_sub_80CE2D4

	thumb_func_start sub_80CE30C
sub_80CE30C: @ 80CE648
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CE65E
	movs r0, 0x30
	strh r0, [r4, 0x20]
	movs r0, 0x28
	b _080CE666
_080CE65E:
	ldr r0, _080CE688
	ldrh r1, [r0]
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
_080CE666:
	strh r0, [r4, 0x22]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _080CE68C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE688: .4byte gUnknown_03004B00
_080CE68C: .4byte sub_80CE354
	thumb_func_end sub_80CE30C

	thumb_func_start sub_80CE354
sub_80CE354: @ 80CE690
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080CE6A2
	adds r0, r1, 0
	bl move_anim_8072740
_080CE6A2:
	pop {r0}
	bx r0
	thumb_func_end sub_80CE354

	thumb_func_start sub_80CE36C
sub_80CE36C: @ 80CE6A8
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CE6E0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r2, _080CE6E4
	lsrs r0, 24
	ldrh r1, [r2]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x30]
	strh r1, [r4, 0x32]
	strh r1, [r4, 0x34]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	ldr r0, _080CE6E8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CE6E0: .4byte gUnknown_0202F7C8
_080CE6E4: .4byte gUnknown_03004B00
_080CE6E8: .4byte sub_80CE3B0
	thumb_func_end sub_80CE36C

	thumb_func_start sub_80CE3B0
sub_80CE3B0: @ 80CE6EC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CE716
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r2, [r1, 0x32]
	movs r3, 0x32
	ldrsh r0, [r1, r3]
	cmp r0, 0x77
	bgt _080CE716
	ldrh r0, [r1, 0x22]
	adds r0, 0x1
	strh r0, [r1, 0x22]
	adds r0, r2, 0x1
	strh r0, [r1, 0x32]
_080CE716:
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080CE724
	adds r0, r1, 0
	bl move_anim_8072740
_080CE724:
	pop {r0}
	bx r0
	thumb_func_end sub_80CE3B0

	thumb_func_start sub_80CE3EC
sub_80CE3EC: @ 80CE728
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	mov r8, r0
	ldr r0, _080CE7F8
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r0, _080CE7FC
	mov r9, r0
	lsls r5, r7, 2
	adds r5, r7
	lsls r5, 3
	adds r6, r5, r0
	strh r4, [r6, 0x8]
	strh r4, [r6, 0xA]
	strh r4, [r6, 0xC]
	strh r1, [r6, 0xE]
	strh r4, [r6, 0x10]
	strh r4, [r6, 0x12]
	strh r4, [r6, 0x14]
	movs r0, 0xD
	strh r0, [r6, 0x16]
	movs r0, 0xE
	strh r0, [r6, 0x18]
	movs r0, 0xF
	strh r0, [r6, 0x1A]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80792C0
	mov r10, r0
	mov r1, r8
	orrs r1, r0
	mov r8, r1
	movs r0, 0x8
	add r9, r0
	add r5, r9
	adds r0, r5, 0
	adds r0, 0x1C
	adds r5, 0x1E
	adds r1, r5, 0
	mov r2, r8
	bl sub_8079BF4
	ldr r0, _080CE800
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x80
	lsls r4, 9
	adds r1, r4, 0
	lsls r1, r0
	mov r0, r10
	orrs r0, r1
	mov r10, r0
	ldr r0, _080CE804
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0
	mov r1, r10
	orrs r4, r1
	ldr r0, _080CE808
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080CE80C
	str r1, [r6]
	adds r0, r7, 0
	bl _call_via_r1
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE7F8: .4byte 0x0000ffff
_080CE7FC: .4byte gTasks
_080CE800: .4byte 0x000027d2
_080CE804: .4byte 0x000027d3
_080CE808: .4byte 0x00007fbb
_080CE80C: .4byte sub_80CE4D4
	thumb_func_end sub_80CE3EC

	thumb_func_start sub_80CE4D4
sub_80CE4D4: @ 80CE810
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080CE838
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080CE8FC
	cmp r1, 0x1
	bgt _080CE83C
	cmp r1, 0
	beq _080CE84A
	b _080CE99A
	.align 2, 0
_080CE838: .4byte gTasks
_080CE83C:
	cmp r1, 0x2
	bne _080CE842
	b _080CE954
_080CE842:
	cmp r1, 0x3
	bne _080CE848
	b _080CE988
_080CE848:
	b _080CE99A
_080CE84A:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bgt _080CE858
	b _080CE99A
_080CE858:
	strh r1, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080CE8A4
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	ldrh r2, [r4, 0x18]
	ldrh r3, [r4, 0x12]
	adds r2, r3
	strh r2, [r4, 0x12]
	ldrh r1, [r4, 0x1A]
	ldrh r5, [r4, 0x14]
	adds r1, r5
	strh r1, [r4, 0x14]
	lsls r0, 16
	asrs r0, 19
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	asrs r2, 19
	lsls r2, 16
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r2, 11
	orrs r0, r2
	lsrs r1, 6
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r12, r0
	b _080CE8AE
_080CE8A4:
	ldr r7, _080CE8F4
	mov r12, r7
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080CE8AE:
	movs r2, 0x1
	movs r3, 0
	movs r1, 0
_080CE8B4:
	movs r5, 0xE
	ldrsh r0, [r4, r5]
	ands r0, r2
	lsls r5, r2, 17
	adds r6, r3, 0
	adds r6, 0x10
	adds r1, 0x1
	mov r8, r1
	cmp r0, 0
	beq _080CE8E0
	movs r1, 0x1
	ldr r2, _080CE8F8
_080CE8CC:
	adds r0, r3, r1
	lsls r0, 1
	adds r0, r2
	mov r7, r12
	strh r7, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _080CE8CC
_080CE8E0:
	lsrs r2, r5, 16
	lsls r0, r6, 16
	lsrs r3, r0, 16
	mov r1, r8
	lsls r0, r1, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _080CE8B4
	b _080CE99A
	.align 2, 0
_080CE8F4: .4byte 0x00007fbb
_080CE8F8: .4byte gPlttBufferFaded
_080CE8FC:
	ldr r0, _080CE944
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CE99A
	movs r2, 0
	ldr r3, _080CE948
	movs r5, 0x14
	adds r5, r3
	mov r12, r5
	ldr r7, _080CE94C
	mov r8, r7
	ldr r6, _080CE950
	movs r5, 0x1
_080CE91A:
	lsls r0, r2, 4
	adds r0, r2
	lsls r1, r0, 2
	mov r7, r12
	adds r0, r1, r7
	ldr r0, [r0]
	cmp r0, r8
	beq _080CE92E
	cmp r0, r6
	bne _080CE932
_080CE92E:
	adds r0, r1, r3
	strh r5, [r0, 0x2E]
_080CE932:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _080CE91A
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080CE97C
	.align 2, 0
_080CE944: .4byte gPaletteFade
_080CE948: .4byte gSprites
_080CE94C: .4byte gBattleAnimSpriteTemplate_83D6FC8
_080CE950: .4byte gBattleAnimSpriteTemplate_83D6FF8
_080CE954:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080CE99A
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	bl sub_8079BFC
	ldr r1, _080CE984
	str r1, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_080CE97C:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080CE99A
	.align 2, 0
_080CE984: .4byte 0x00007fbb
_080CE988:
	ldr r0, _080CE9A8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080CE99A
	adds r0, r2, 0
	bl move_anim_task_del
_080CE99A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CE9A8: .4byte gPaletteFade
	thumb_func_end sub_80CE4D4

	thumb_func_start sub_80CE670
sub_80CE670: @ 80CE9AC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080CEA30
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	bgt _080CE9BE
	movs r0, 0x2
	strh r0, [r6, 0x4]
_080CE9BE:
	movs r1, 0x4
	ldrsh r0, [r6, r1]
	cmp r0, 0x7F
	ble _080CE9CA
	movs r0, 0x7F
	strh r0, [r6, 0x4]
_080CE9CA:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x30]
	ldr r4, _080CEA34
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6]
	adds r0, r1
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x2]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldrh r1, [r5, 0x20]
	strh r1, [r5, 0x3A]
	strh r0, [r5, 0x3C]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CEA3C
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	adds r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080CEA38
	b _080CEA62
	.align 2, 0
_080CEA30: .4byte gUnknown_03004B00
_080CEA34: .4byte gUnknown_0202F7C9
_080CEA38: .4byte 0xffffec00
_080CEA3C:
	ldr r0, _080CEA7C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CEA84
	ldrh r0, [r5, 0x20]
	subs r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	adds r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0xA0
	lsls r0, 5
_080CEA62:
	bl __divsi3
	strh r0, [r5, 0x34]
	lsls r4, 7
	strh r4, [r5, 0x36]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080CEA80
	bl __divsi3
	strh r0, [r5, 0x38]
	b _080CEAC0
	.align 2, 0
_080CEA7C: .4byte gUnknown_0202F7C8
_080CEA80: .4byte 0xfffff600
_080CEA84:
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r4, [r5, 0x22]
	subs r4, 0x14
	strh r4, [r5, 0x22]
	lsls r0, 7
	strh r0, [r5, 0x32]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	ldr r0, _080CEACC
	bl __divsi3
	strh r0, [r5, 0x34]
	lsls r4, 7
	strh r4, [r5, 0x36]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	movs r0, 0xA0
	lsls r0, 4
	bl __divsi3
	strh r0, [r5, 0x38]
	ldrb r1, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x30
	orrs r0, r1
	strb r0, [r5, 0x3]
_080CEAC0:
	ldr r0, _080CEAD0
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CEACC: .4byte 0xffffec00
_080CEAD0: .4byte sub_80CE798
	thumb_func_end sub_80CE670

	thumb_func_start sub_80CE798
sub_80CE798: @ 80CEAD4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 23
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080CEB0A
	ldrh r0, [r2, 0x3A]
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x3C]
	strh r0, [r2, 0x22]
_080CEB0A:
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080CEB18
	adds r0, r2, 0
	bl move_anim_8072740
_080CEB18:
	pop {r0}
	bx r0
	thumb_func_end sub_80CE798

	thumb_func_start sub_80CE7E0
sub_80CE7E0: @ 80CEB1C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	ldr r1, _080CEBAC
	adds r6, r0, r1
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x8]
	ldr r0, _080CEBB0
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0xA]
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	lsls r0, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	ldr r2, _080CEBB4
	movs r0, 0x8
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r4, r0, 4
	movs r5, 0x1
	ldr r2, _080CEBB8
_080CEB74:
	adds r1, r3, r5
	lsls r1, 1
	adds r1, r2
	adds r0, r4, r5
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080CEB74
	adds r0, r3, 0
	movs r1, 0x10
	movs r2, 0xB
	movs r3, 0
	bl BlendPalette
	movs r0, 0
	strh r0, [r6, 0xE]
	movs r5, 0
	ldr r7, _080CEBB4
	movs r1, 0x1C
	adds r1, r7
	mov r9, r1
	b _080CEBF0
	.align 2, 0
_080CEBAC: .4byte gTasks
_080CEBB0: .4byte 0x00002771
_080CEBB4: .4byte gSprites
_080CEBB8: .4byte gPlttBufferUnfaded
_080CEBBC:
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r4, r2, r7
	ldrb r1, [r6, 0xA]
	lsls r1, 4
	ldrb r3, [r4, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0
	strh r0, [r4, 0x2E]
	lsls r0, r5, 7
	strh r0, [r4, 0x30]
	mov r0, r8
	strh r0, [r4, 0x32]
	add r2, r9
	ldr r0, _080CEC20
	str r0, [r2]
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080CEBF0:
	cmp r5, 0x1
	bhi _080CEC02
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080CEBBC
_080CEC02:
	ldr r0, _080CEC24
	str r0, [r6]
	ldr r0, _080CEC28
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CEC30
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080CEC2C
	b _080CEC38
	.align 2, 0
_080CEC20: .4byte sub_80CE974
_080CEC24: .4byte sub_80CE910
_080CEC28: .4byte gUnknown_0202F7C8
_080CEC2C: .4byte 0x0000fdff
_080CEC30:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080CEC48
_080CEC38:
	ands r0, r1
	strh r0, [r2]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CEC48: .4byte 0x0000fbff
	thumb_func_end sub_80CE7E0

	thumb_func_start sub_80CE910
sub_80CE910: @ 80CEC4C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080CEC80
	adds r0, r1
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CECA4
	ldr r0, _080CEC84
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CEC88
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 2
	b _080CEC92
	.align 2, 0
_080CEC80: .4byte gTasks
_080CEC84: .4byte gUnknown_0202F7C8
_080CEC88:
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
_080CEC92:
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _080CECAC
	bl FreeSpritePaletteByTag
	adds r0, r4, 0
	bl move_anim_task_del
_080CECA4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CECAC: .4byte 0x00002771
	thumb_func_end sub_80CE910

	thumb_func_start sub_80CE974
sub_80CE974: @ 80CECB0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080CECCC
	movs r0, 0
	strh r0, [r5, 0x34]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_080CECCC:
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x40
	ble _080CECF4
	ldr r2, _080CECF0
	movs r0, 0x32
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xE]
	subs r1, 0x1
	strh r1, [r0, 0xE]
	adds r0, r5, 0
	bl obj_delete_but_dont_free_vram
	b _080CED36
	.align 2, 0
_080CECF0: .4byte gTasks
_080CECF4:
	ldr r4, _080CED3C
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x6
	bl __divsi3
	strh r0, [r5, 0x36]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r0, r4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0xD
	bl __divsi3
	strh r0, [r5, 0x38]
	ldrh r1, [r5, 0x30]
	adds r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x30]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
_080CED36:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CED3C: .4byte gSineTable
	thumb_func_end sub_80CE974

	thumb_func_start sub_80CEA04
sub_80CEA04: @ 80CED40
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080CED54
	bl oamt_set_x3A_32
	ldr r0, _080CED58
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CED54: .4byte move_anim_8072740
_080CED58: .4byte sub_8078600
	thumb_func_end sub_80CEA04

	thumb_func_start sub_80CEA20
sub_80CEA20: @ 80CED5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _080CEE0C
	ldrh r0, [r4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	beq _080CEDA0
	lsls r0, r3, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	movs r2, 0x1
	ldr r5, _080CEE10
_080CED88:
	adds r1, r3, r2
	lsls r1, 1
	adds r1, r5
	lsls r0, r2, 1
	adds r0, r4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080CED88
_080CEDA0:
	movs r4, 0x1
	ldr r0, _080CEE0C
	mov r8, r0
_080CEDA6:
	lsls r0, r4, 1
	adds r0, r4
	lsls r5, r0, 2
	mov r1, r8
	adds r0, r5, r1
	ldrh r0, [r0]
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, 0x1
	mov r12, r4
	cmp r3, 0xFF
	beq _080CEDEE
	lsls r0, r3, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r3, r0, 16
	movs r2, 0x1
	ldr r7, _080CEE10
	ldr r6, _080CEE0C
	adds r4, r5, 0
_080CEDD4:
	adds r1, r3, r2
	lsls r1, 1
	adds r1, r7
	lsls r0, r2, 1
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080CEDD4
_080CEDEE:
	mov r1, r12
	lsls r0, r1, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080CEDA6
	mov r0, r9
	bl move_anim_task_del
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CEE0C: .4byte gUnknown_083D712C
_080CEE10: .4byte gPlttBufferFaded
	thumb_func_end sub_80CEA20

	thumb_func_start sub_80CEAD8
sub_80CEAD8: @ 80CEE14
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0x1
	ldr r6, _080CEE44
_080CEE1E:
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	adds r0, r6
	ldrh r0, [r0]
	bl FreeSpritePaletteByTag
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080CEE1E
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CEE44: .4byte gUnknown_083D712C
	thumb_func_end sub_80CEAD8

	thumb_func_start sub_80CEB0C
sub_80CEB0C: @ 80CEE48
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_8078650
	ldr r4, _080CEEA0
	ldrb r1, [r4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r2, _080CEEA4
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080CEE84
	lsls r2, r0, 4
	ldrb r1, [r5, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, 0x5]
_080CEE84:
	ldrh r0, [r4, 0x2]
	movs r1, 0
	strh r0, [r5, 0x30]
	strh r1, [r5, 0x32]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x34]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CEEA8
	movs r6, 0x30
	movs r3, 0x28
	b _080CEEC2
	.align 2, 0
_080CEEA0: .4byte gUnknown_03004B00
_080CEEA4: .4byte gUnknown_083D712C
_080CEEA8:
	ldr r4, _080CEEF8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r3, r0, 24
_080CEEC2:
	ldrh r0, [r5, 0x20]
	lsls r1, r0, 4
	strh r1, [r5, 0x36]
	ldrh r1, [r5, 0x22]
	lsls r2, r1, 4
	strh r2, [r5, 0x38]
	subs r0, r6, r0
	lsls r0, 16
	asrs r0, 16
	subs r1, r3, r1
	lsls r1, 16
	asrs r1, 16
	adds r2, r5, 0
	adds r2, 0x3A
	adds r3, r5, 0
	adds r3, 0x3C
	movs r4, 0x28
	str r4, [sp]
	bl sub_80CEBC4
	ldr r0, _080CEEFC
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CEEF8: .4byte gUnknown_0202F7C9
_080CEEFC: .4byte sub_80CEC1C
	thumb_func_end sub_80CEB0C

	thumb_func_start sub_80CEBC4
sub_80CEBC4: @ 80CEF00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r2, 0
	mov r8, r3
	ldr r2, [sp, 0x18]
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r1, r2, 24
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bge _080CEF22
	lsls r0, r1, 24
	negs r0, r0
	lsrs r1, r0, 24
_080CEF22:
	lsls r5, r2, 8
	lsls r1, 24
	asrs r1, 24
	adds r0, r5, 0
	bl __divsi3
	adds r4, r0, 0
	cmp r4, 0
	bne _080CEF36
	movs r4, 0x1
_080CEF36:
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	strh r0, [r7]
	lsls r0, r6, 16
	asrs r0, 8
	adds r1, r4, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80CEBC4

	thumb_func_start sub_80CEC1C
sub_80CEC1C: @ 80CEF58
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0x2E]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r1, r0, r1
	adds r0, r1, 0
	cmp r1, 0
	bge _080CEF74
	adds r0, 0xFF
_080CEF74:
	asrs r0, 8
	lsls r0, 8
	subs r0, r1, r0
	ldrh r1, [r4, 0x3A]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	ldrh r2, [r4, 0x3C]
	ldrh r3, [r4, 0x38]
	adds r2, r3
	strh r2, [r4, 0x38]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x20]
	lsls r2, 16
	asrs r2, 20
	strh r2, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xF
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	ldrh r0, [r4, 0x20]
	adds r0, 0x10
	lsls r0, 16
	movs r1, 0x88
	lsls r1, 17
	cmp r0, r1
	bhi _080CEFC2
	lsls r0, r2, 16
	asrs r1, r0, 16
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	blt _080CEFC2
	cmp r1, 0x80
	ble _080CEFCA
_080CEFC2:
	adds r0, r4, 0
	bl move_anim_8074EE0
	b _080CF01A
_080CEFCA:
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _080CF01A
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, r1
	ble _080CF01A
	strh r5, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080CEFF2
	strh r5, [r4, 0x30]
_080CEFF2:
	ldr r2, _080CF020
	movs r3, 0x30
	ldrsh r1, [r4, r3]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080CF01A
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
_080CF01A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF020: .4byte gUnknown_083D712C
	thumb_func_end sub_80CEC1C

	thumb_func_start sub_80CECE8
sub_80CECE8: @ 80CF024
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r7, _080CF0A8
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080CF042
	ldr r1, _080CF0AC
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080CF042:
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080CF0AC
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r7]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r6, 0x22]
	ldrb r1, [r4]
	adds r0, r6, 0
	bl StartSpriteAnim
	strh r5, [r6, 0x32]
	strh r5, [r6, 0x34]
	ldrh r0, [r6, 0x20]
	lsls r0, 4
	strh r0, [r6, 0x36]
	ldrh r0, [r6, 0x22]
	lsls r0, 4
	strh r0, [r6, 0x38]
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	lsls r0, 4
	movs r1, 0x5
	bl __divsi3
	strh r0, [r6, 0x3A]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	lsls r0, 7
	movs r1, 0x5
	bl __divsi3
	strh r0, [r6, 0x3C]
	ldr r0, _080CF0B0
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CF0A8: .4byte gUnknown_0202F7C8
_080CF0AC: .4byte gUnknown_03004B00
_080CF0B0: .4byte sub_80CED78
	thumb_func_end sub_80CECE8

	thumb_func_start sub_80CED78
sub_80CED78: @ 80CF0B4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldrh r1, [r4, 0x3C]
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r4, 0x22]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	ble _080CF112
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080CF112
	ldrh r0, [r4, 0x32]
	adds r0, 0x10
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0x12
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r1, 0x12
	bl Sin
	strh r0, [r4, 0x26]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080CF112
	movs r0, 0x1
	strh r0, [r4, 0x34]
_080CF112:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	bne _080CF126
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CF126:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CED78

	thumb_func_start sub_80CEDF0
sub_80CEDF0: @ 80CF12C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080CF14C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080CF150
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
	movs r6, 0x10
	b _080CF152
	.align 2, 0
_080CF14C: .4byte gUnknown_03004B00
_080CF150:
	ldr r6, _080CF18C
_080CF152:
	ldr r4, _080CF190
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x8
	strh r0, [r5, 0x22]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	ldr r0, _080CF194
	str r0, [r5, 0x1C]
	ldr r1, _080CF198
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF18C: .4byte 0x0000fff0
_080CF190: .4byte gUnknown_0202F7C8
_080CF194: .4byte sub_80782D8
_080CF198: .4byte move_anim_8072740
	thumb_func_end sub_80CEDF0

	thumb_func_start sub_80CEE60
sub_80CEE60: @ 80CF19C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldrh r0, [r4, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldr r5, _080CF214
	ldrb r1, [r5, 0x2]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r2, _080CF218
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080CF1DC
	lsls r2, r0, 4
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x5]
_080CF1DC:
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	cmp r0, 0
	bne _080CF1E8
	ldr r2, _080CF21C
_080CF1E8:
	movs r0, 0x28
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x20]
	strh r1, [r4, 0x30]
	lsls r0, r2, 16
	asrs r0, 16
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	subs r0, 0x28
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x38]
	ldr r0, _080CF220
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF214: .4byte gUnknown_03004B00
_080CF218: .4byte gUnknown_083D712C
_080CF21C: .4byte 0x0000ffe0
_080CF220: .4byte sub_80CEEE8
	thumb_func_end sub_80CEE60

	thumb_func_start sub_80CEEE8
sub_80CEEE8: @ 80CF224
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080CF274
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r2, [r4, 0x24]
	movs r3, 0x24
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _080CF250
	lsls r0, r1, 16
	negs r0, r0
	lsrs r1, r0, 16
_080CF250:
	lsls r0, r1, 16
	asrs r0, 16
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	ldrh r3, [r4, 0x26]
	adds r0, r3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080CF27A
_080CF274:
	adds r0, r4, 0
	bl move_anim_8072740
_080CF27A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80CEEE8

	thumb_func_start sub_80CEF44
sub_80CEF44: @ 80CF280
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CF2A0
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	adds r0, 0x8
	b _080CF2AA
_080CF2A0:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	subs r0, 0x8
_080CF2AA:
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0
	bl sub_807A100
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080CF2CC
	adds r0, 0x3
_080CF2CC:
	asrs r0, 2
	subs r0, r4, r0
	strh r0, [r6, 0x22]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CEF44

	thumb_func_start sub_80CEF9C
sub_80CEF9C: @ 80CF2D8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080CF2EC
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF2F4
	ldr r0, _080CF2F0
	b _080CF2F6
	.align 2, 0
_080CF2EC: .4byte gUnknown_03004B00
_080CF2F0: .4byte gUnknown_0202F7C8
_080CF2F4:
	ldr r0, _080CF334
_080CF2F6:
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80CEF44
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r1, 31
	ldr r0, _080CF338
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0x2E]
	adds r0, r1, 0x2
	strh r0, [r5, 0x30]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r1, _080CF33C
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF340
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF334: .4byte gUnknown_0202F7C9
_080CF338: .4byte gUnknown_03004B00
_080CF33C: .4byte sub_80CF008
_080CF340: .4byte sub_8078600
	thumb_func_end sub_80CEF9C

	thumb_func_start sub_80CF008
sub_80CF008: @ 80CF344
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080CF36C
	ldr r1, _080CF374
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldrh r1, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080CF378
	str r0, [r4, 0x1C]
_080CF36C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF374: .4byte move_anim_8072740
_080CF378: .4byte sub_8078600
	thumb_func_end sub_80CF008

	thumb_func_start sub_80CF040
sub_80CF040: @ 80CF37C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CF390
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF398
	ldr r0, _080CF394
	b _080CF39A
	.align 2, 0
_080CF390: .4byte gUnknown_03004B00
_080CF394: .4byte gUnknown_0202F7C8
_080CF398:
	ldr r0, _080CF3B8
_080CF39A:
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80CEF44
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r1, _080CF3BC
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF3C0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF3B8: .4byte gUnknown_0202F7C9
_080CF3BC: .4byte sub_80CF088
_080CF3C0: .4byte sub_80785E4
	thumb_func_end sub_80CF040

	thumb_func_start sub_80CF088
sub_80CF088: @ 80CF3C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080CF3EA
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080CF3F0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF3F4
	str r0, [r4, 0x1C]
_080CF3EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF3F0: .4byte move_anim_8074EE0
_080CF3F4: .4byte sub_80785E4
	thumb_func_end sub_80CF088

	thumb_func_start sub_80CF0BC
sub_80CF0BC: @ 80CF3F8
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r0, _080CF40C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF414
	ldr r0, _080CF410
	b _080CF416
	.align 2, 0
_080CF40C: .4byte gUnknown_03004B00
_080CF410: .4byte gUnknown_0202F7C8
_080CF414:
	ldr r0, _080CF468
_080CF416:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	strh r0, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bgt _080CF43E
	movs r0, 0xA
	strh r0, [r4, 0x22]
_080CF43E:
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	strh r6, [r4, 0x30]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	strh r0, [r4, 0x32]
	ldrb r0, [r1]
	adds r0, 0x4
	strh r0, [r4, 0x34]
	strh r6, [r4, 0x36]
	ldr r1, _080CF46C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF470
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF468: .4byte gUnknown_0202F7C9
_080CF46C: .4byte sub_80CF138
_080CF470: .4byte sub_80785E4
	thumb_func_end sub_80CF0BC

	thumb_func_start sub_80CF138
sub_80CF138: @ 80CF474
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x36]
	adds r0, 0x1
	strh r0, [r1, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080CF48A
	ldr r0, _080CF490
	str r0, [r1, 0x1C]
_080CF48A:
	pop {r0}
	bx r0
	.align 2, 0
_080CF490: .4byte sub_80CF158
	thumb_func_end sub_80CF138

	thumb_func_start sub_80CF158
sub_80CF158: @ 80CF494
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x4
	strh r1, [r2, 0x30]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFE
	ble _080CF4C6
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080CF4C0
	strh r0, [r2, 0x24]
	ldr r0, _080CF4BC
	str r0, [r2, 0x1C]
	b _080CF4FC
	.align 2, 0
_080CF4BC: .4byte sub_80CF088
_080CF4C0:
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r2, 0x30]
_080CF4C6:
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0x4F
	ble _080CF4D6
	ldrh r0, [r2, 0x34]
	adds r1, r2, 0
	adds r1, 0x43
	strb r0, [r1]
_080CF4D6:
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r0, 0x9F
	ble _080CF4E6
	ldrh r0, [r2, 0x32]
	adds r1, r2, 0
	adds r1, 0x43
	strb r0, [r1]
_080CF4E6:
	ldr r1, _080CF500
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 19
	asrs r1, r0, 1
	adds r0, r1
	strh r0, [r2, 0x24]
_080CF4FC:
	pop {r0}
	bx r0
	.align 2, 0
_080CF500: .4byte gSineTable
	thumb_func_end sub_80CF158

	thumb_func_start sub_80CF1C8
sub_80CF1C8: @ 80CF504
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080CF518
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF520
	ldr r0, _080CF51C
	b _080CF522
	.align 2, 0
_080CF518: .4byte gUnknown_03004B00
_080CF51C: .4byte gUnknown_0202F7C8
_080CF520:
	ldr r0, _080CF544
_080CF522:
	ldrb r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80CEF44
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CF548
	adds r0, r5, 0
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0x2
	b _080CF552
	.align 2, 0
_080CF544: .4byte gUnknown_0202F7C9
_080CF548:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x3
_080CF552:
	strh r0, [r5, 0x2E]
	ldr r0, _080CF560
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF560: .4byte sub_80CF228
	thumb_func_end sub_80CF1C8

	thumb_func_start sub_80CF228
sub_80CF228: @ 80CF564
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080CF592
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r1, _080CF598
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080CF59C
	str r0, [r4, 0x1C]
_080CF592:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF598: .4byte sub_80CF264
_080CF59C: .4byte sub_8078600
	thumb_func_end sub_80CF228

	thumb_func_start sub_80CF264
sub_80CF264: @ 80CF5A0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080CF5B8
	adds r0, r1, 0
	bl move_anim_8072740
_080CF5B8:
	pop {r0}
	bx r0
	thumb_func_end sub_80CF264

	thumb_func_start sub_80CF280
sub_80CF280: @ 80CF5BC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r5, _080CF600
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x34]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x36]
	ldr r1, _080CF604
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _080CF608
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF600: .4byte gUnknown_03004B00
_080CF604: .4byte move_anim_8074EE0
_080CF608: .4byte sub_8078278
	thumb_func_end sub_80CF280

	thumb_func_start sub_80CF2D0
sub_80CF2D0: @ 80CF60C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080CF620
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CF628
	ldr r0, _080CF624
	b _080CF62A
	.align 2, 0
_080CF620: .4byte gUnknown_03004B00
_080CF624: .4byte gUnknown_0202F7C8
_080CF628:
	ldr r0, _080CF644
_080CF62A:
	ldrb r0, [r0]
	adds r1, r4, 0
	bl sub_80CEF44
	movs r0, 0
	strh r0, [r4, 0x2E]
	strh r0, [r4, 0x30]
	ldr r0, _080CF648
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF644: .4byte gUnknown_0202F7C9
_080CF648: .4byte sub_80CF310
	thumb_func_end sub_80CF2D0

	thumb_func_start sub_80CF310
sub_80CF310: @ 80CF64C
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080CF67E
	cmp r0, 0x1
	bgt _080CF662
	cmp r0, 0
	beq _080CF668
	b _080CF6AC
_080CF662:
	cmp r0, 0x2
	beq _080CF698
	b _080CF6AC
_080CF668:
	ldrh r0, [r1, 0x26]
	subs r0, 0x3
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080CF6AC
	b _080CF690
_080CF67E:
	ldrh r0, [r1, 0x26]
	adds r0, 0x3
	strh r0, [r1, 0x26]
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080CF6AC
_080CF690:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _080CF6AC
_080CF698:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	bne _080CF6AC
	adds r0, r1, 0
	bl move_anim_8072740
_080CF6AC:
	pop {r0}
	bx r0
	thumb_func_end sub_80CF310

	thumb_func_start sub_80CF374
sub_80CF374: @ 80CF6B0
	push {r4,lr}
	adds r4, r0, 0
	ldr r3, _080CF6FC
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r4, 0x30]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	cmp r2, 0
	bne _080CF6EE
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x24]
	adds r0, r4, 0
	bl move_anim_8074EE0
_080CF6EE:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF6FC: .4byte gSprites
	thumb_func_end sub_80CF374

	thumb_func_start sub_80CF3C4
sub_80CF3C4: @ 80CF700
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080CF748
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080CF74C
	ldr r0, _080CF750
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CF758
	ldr r0, _080CF754
	ldrh r1, [r5, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r5, 0x20]
	adds r1, r0, 0
	b _080CF762
	.align 2, 0
_080CF748: .4byte gUnknown_0202F7C8
_080CF74C: .4byte gUnknown_02024BE0
_080CF750: .4byte gUnknown_0202F7C9
_080CF754: .4byte gUnknown_03004B00
_080CF758:
	ldr r1, _080CF78C
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
_080CF762:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	strh r6, [r5, 0x32]
	ldr r0, _080CF790
	str r0, [r5, 0x1C]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF78C: .4byte gUnknown_03004B00
_080CF790: .4byte sub_80CF374
	thumb_func_end sub_80CF3C4

	thumb_func_start sub_80CF458
sub_80CF458: @ 80CF794
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080CF7C0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x38]
	ldr r0, _080CF7C4
	str r0, [r4, 0x1C]
	ldr r1, _080CF7C8
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF7C0: .4byte gUnknown_03004B00
_080CF7C4: .4byte sub_80782D8
_080CF7C8: .4byte sub_80CF490
	thumb_func_end sub_80CF458

	thumb_func_start sub_80CF490
sub_80CF490: @ 80CF7CC
	push {lr}
	ldrh r1, [r0, 0x30]
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	adds r1, 0xF
	strh r1, [r0, 0x36]
	ldr r1, _080CF7EC
	str r1, [r0, 0x1C]
	ldr r1, _080CF7F0
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080CF7EC: .4byte sub_8078B34
_080CF7F0: .4byte sub_80CF4B8
	thumb_func_end sub_80CF490

	thumb_func_start sub_80CF4B8
sub_80CF4B8: @ 80CF7F4
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x38]
	movs r3, 0x38
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080CF80A
	adds r0, r1, 0
	bl move_anim_8072740
	b _080CF80E
_080CF80A:
	subs r0, r2, 0x1
	strh r0, [r1, 0x38]
_080CF80E:
	pop {r0}
	bx r0
	thumb_func_end sub_80CF4B8

	thumb_func_start sub_80CF4D8
sub_80CF4D8: @ 80CF814
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080CF840
	ldr r0, _080CF844
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8078E70
	ldr r1, _080CF848
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080CF84C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF840: .4byte gUnknown_02024BE0
_080CF844: .4byte gUnknown_0202F7C8
_080CF848: .4byte gTasks
_080CF84C: .4byte sub_80CF514
	thumb_func_end sub_80CF4D8

	thumb_func_start sub_80CF514
sub_80CF514: @ 80CF850
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080CF880
	ldr r0, _080CF884
	ldrb r0, [r0]
	adds r1, r0, r1
	ldrb r4, [r1]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080CF88C
	ldr r1, _080CF888
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	negs r0, r0
	lsls r0, 16
	lsrs r3, r0, 16
	adds r6, r2, 0
	b _080CF89A
	.align 2, 0
_080CF880: .4byte gUnknown_02024BE0
_080CF884: .4byte gUnknown_0202F7C8
_080CF888: .4byte gTasks
_080CF88C:
	ldr r2, _080CF8CC
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	ldrh r3, [r0, 0x8]
	adds r6, r1, 0
_080CF89A:
	movs r2, 0x80
	lsls r2, 1
	adds r0, r4, 0
	adds r1, r2, 0
	bl obj_id_set_rotscale
	ldr r1, _080CF8CC
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080CF8D4
	ldrh r0, [r1, 0x8]
	adds r0, 0xB0
	strh r0, [r1, 0x8]
	ldr r1, _080CF8D0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	adds r1, 0x1
	b _080CF8FE
	.align 2, 0
_080CF8CC: .4byte gTasks
_080CF8D0: .4byte gSprites
_080CF8D4:
	cmp r0, 0x1
	bne _080CF8EA
	ldrh r0, [r1, 0xE]
	adds r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	bne _080CF944
	movs r0, 0x2
	b _080CF942
_080CF8EA:
	ldrh r0, [r1, 0x8]
	subs r0, 0xB0
	strh r0, [r1, 0x8]
	ldr r1, _080CF938
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r0, 0x26]
	subs r1, 0x1
_080CF8FE:
	strh r1, [r0, 0x26]
	adds r0, r4, 0
	bl sub_8078F9C
	ldr r0, _080CF93C
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r2, [r1, r3]
	movs r0, 0xF2
	lsls r0, 4
	cmp r2, r0
	beq _080CF91E
	cmp r2, 0
	bne _080CF944
_080CF91E:
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bne _080CF940
	adds r0, r4, 0
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
	b _080CF944
	.align 2, 0
_080CF938: .4byte gSprites
_080CF93C: .4byte gTasks
_080CF940:
	adds r0, r2, 0x1
_080CF942:
	strh r0, [r1, 0xA]
_080CF944:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80CF514

	thumb_func_start sub_80CF610
sub_80CF610: @ 80CF94C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r5, _080CF994
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080CF998
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CF99C
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r1, r0
	strb r1, [r2]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _080CF9B0
	movs r0, 0x2
	orrs r1, r0
	strb r1, [r2]
	b _080CF9B0
	.align 2, 0
_080CF994: .4byte gUnknown_03004B00
_080CF998: .4byte gUnknown_0202F7C8
_080CF99C:
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080CF9B0
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
_080CF9B0:
	ldr r0, _080CF9C4
	str r0, [r4, 0x1C]
	ldr r1, _080CF9C8
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CF9C4: .4byte sub_8078600
_080CF9C8: .4byte move_anim_8072740
	thumb_func_end sub_80CF610

	thumb_func_start sub_80CF690
sub_80CF690: @ 80CF9CC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r0, _080CF9E8
	str r0, [r4, 0x1C]
	ldr r1, _080CF9EC
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CF9E8: .4byte sub_80785E4
_080CF9EC: .4byte sub_80CF6B4
	thumb_func_end sub_80CF690

	thumb_func_start sub_80CF6B4
sub_80CF6B4: @ 80CF9F0
	push {lr}
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	ldrh r1, [r0, 0x20]
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	subs r1, 0x20
	strh r1, [r0, 0x36]
	ldr r1, _080CFA10
	str r1, [r0, 0x1C]
	ldr r1, _080CFA14
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080CFA10: .4byte sub_8078B34
_080CFA14: .4byte move_anim_8072740
	thumb_func_end sub_80CF6B4

	thumb_func_start sub_80CF6DC
sub_80CF6DC: @ 80CFA18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CFA3C
	ldr r1, _080CFA38
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080CFA5E
	.align 2, 0
_080CFA38: .4byte gUnknown_03004B00
_080CFA3C:
	ldr r0, _080CFB04
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080CFA5E
	ldr r1, _080CFB08
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080CFA5E:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r4, _080CFB0C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r6, _080CFB08
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x6]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	adds r7, r0, 0
	ldrh r1, [r5, 0x20]
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xF0
	lsls r1, 24
	adds r0, r1
	lsrs r4, r0, 16
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080CFAD0
	ldr r2, _080CFB10
	adds r0, r4, r2
	lsls r0, 16
	lsrs r4, r0, 16
_080CFAD0:
	movs r3, 0x80
	lsls r3, 1
	str r4, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	mov r0, r8
	strh r0, [r5, 0x32]
	strh r7, [r5, 0x36]
	ldr r0, _080CFB14
	str r0, [r5, 0x1C]
	ldr r1, _080CFB18
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFB04: .4byte gUnknown_0202F7C8
_080CFB08: .4byte gUnknown_03004B00
_080CFB0C: .4byte gUnknown_0202F7C9
_080CFB10: .4byte 0xffffa000
_080CFB14: .4byte sub_8078B34
_080CFB18: .4byte move_anim_8072740
	thumb_func_end sub_80CF6DC

	thumb_func_start sub_80CF7E0
sub_80CF7E0: @ 80CFB1C
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080CFB46
	ldr r2, _080CFB4C
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	adds r0, r3, 0
	bl DestroySprite
_080CFB46:
	pop {r0}
	bx r0
	.align 2, 0
_080CFB4C: .4byte gTasks
	thumb_func_end sub_80CF7E0

	thumb_func_start sub_80CF814
sub_80CF814: @ 80CFB50
	push {r4,lr}
	adds r2, r0, 0
	movs r0, 0x3C
	ldrsh r1, [r2, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080CFB80
	adds r4, r0, r1
	movs r3, 0x2E
	ldrsh r1, [r2, r3]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _080CFB84
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x38]
	adds r0, r1
	strh r0, [r2, 0x38]
	ldrh r0, [r2, 0x36]
	ldrh r3, [r2, 0x3A]
	adds r0, r3
	b _080CFB92
	.align 2, 0
_080CFB80: .4byte gTasks
_080CFB84:
	ldrh r0, [r2, 0x38]
	ldrh r1, [r2, 0x34]
	subs r0, r1
	strh r0, [r2, 0x38]
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	subs r0, r1
_080CFB92:
	strh r0, [r2, 0x3A]
	ldrh r0, [r2, 0x38]
	ldrh r1, [r2, 0x30]
	adds r3, r0, r1
	strh r3, [r2, 0x30]
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r4, 0x16]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CFBB6
	lsls r0, r3, 16
	lsrs r0, 24
	negs r0, r0
	b _080CFBBA
_080CFBB6:
	lsls r0, r3, 16
	lsrs r0, 24
_080CFBBA:
	strh r0, [r2, 0x24]
	ldrh r1, [r4, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CFBCE
	ldrh r0, [r2, 0x32]
	lsrs r0, 8
	negs r0, r0
	b _080CFBD2
_080CFBCE:
	ldrh r0, [r2, 0x32]
	lsrs r0, 8
_080CFBD2:
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r2, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080CFBE8
	movs r0, 0x1E
	strh r0, [r2, 0x2E]
	ldr r0, _080CFBF0
	str r0, [r2, 0x1C]
_080CFBE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CFBF0: .4byte sub_80CF7E0
	thumb_func_end sub_80CF814

	thumb_func_start sub_80CF8B8
sub_80CF8B8: @ 80CFBF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r0, 0x3C
	ldrsh r1, [r7, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080CFC38
	adds r6, r0, r1
	ldrh r2, [r6, 0x16]
	movs r1, 0x2
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	ldrh r3, [r7, 0x30]
	adds r2, r0, r3
	strh r2, [r7, 0x30]
	ldrh r0, [r6, 0x18]
	ands r1, r0
	ldrh r0, [r7, 0x32]
	adds r1, r0
	strh r1, [r7, 0x32]
	ldrh r1, [r6, 0x16]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CFC3C
	lsls r0, r2, 16
	lsrs r0, 24
	negs r0, r0
	b _080CFC40
	.align 2, 0
_080CFC38: .4byte gTasks
_080CFC3C:
	lsls r0, r2, 16
	lsrs r0, 24
_080CFC40:
	strh r0, [r7, 0x24]
	ldrh r1, [r6, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CFC54
	ldrh r0, [r7, 0x32]
	lsrs r0, 8
	negs r0, r0
	b _080CFC58
_080CFC54:
	ldrh r0, [r7, 0x32]
	lsrs r0, 8
_080CFC58:
	strh r0, [r7, 0x26]
	ldrh r0, [r7, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r7, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080CFD24
	movs r4, 0
	movs r0, 0x8
	strh r0, [r7, 0x2E]
	movs r0, 0x4
	strh r0, [r6, 0x12]
	movs r0, 0x80
	lsls r0, 5
	bl sub_81174E0
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r7, 0x24]
	ldrh r1, [r7, 0x20]
	adds r2, r0, r1
	strh r2, [r7, 0x20]
	ldrh r0, [r7, 0x26]
	ldrh r3, [r7, 0x22]
	adds r0, r3
	strh r0, [r7, 0x22]
	strh r4, [r7, 0x26]
	strh r4, [r7, 0x24]
	ldrh r3, [r6, 0x1E]
	movs r0, 0x1E
	ldrsh r1, [r6, r0]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r1, r0
	blt _080CFCA2
	subs r0, r3, r2
	b _080CFCA4
_080CFCA2:
	subs r0, r2, r3
_080CFCA4:
	lsls r0, 24
	lsrs r4, r0, 16
	ldrh r3, [r6, 0x20]
	movs r0, 0x20
	ldrsh r1, [r6, r0]
	ldrh r2, [r7, 0x22]
	movs r6, 0x22
	ldrsh r0, [r7, r6]
	cmp r1, r0
	blt _080CFCBC
	subs r0, r3, r2
	b _080CFCBE
_080CFCBC:
	subs r0, r2, r3
_080CFCBE:
	lsls r0, 24
	lsrs r0, 16
	mov r8, r0
	movs r0, 0
	strh r0, [r7, 0x32]
	strh r0, [r7, 0x30]
	strh r0, [r7, 0x3A]
	strh r0, [r7, 0x38]
	lsls r0, r4, 16
	asrs r0, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r5, 0
	bl sub_81174C4
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	movs r6, 0xE0
	lsls r6, 1
	adds r0, r6, 0
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	strh r0, [r7, 0x34]
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r5, 0
	bl sub_81174C4
	adds r4, r0, 0
	lsls r4, 16
	asrs r4, 16
	adds r0, r6, 0
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	strh r0, [r7, 0x36]
	ldr r0, _080CFD30
	str r0, [r7, 0x1C]
_080CFD24:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFD30: .4byte sub_80CF814
	thumb_func_end sub_80CF8B8

	thumb_func_start sub_80CF9F8
sub_80CF9F8: @ 80CFD34
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080CFD58
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080CFD52
	adds r0, r2, 0
	bl move_anim_task_del
_080CFD52:
	pop {r0}
	bx r0
	.align 2, 0
_080CFD58: .4byte gTasks
	thumb_func_end sub_80CF9F8

	thumb_func_start sub_80CFA20
sub_80CFA20: @ 80CFD5C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080CFDB0
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	subs r1, r0, 0x1
	strh r1, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bgt _080CFE30
	ldr r0, _080CFDB4
	movs r2, 0x1A
	ldrsh r1, [r5, r2]
	movs r3, 0x1C
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, 0xC]
	ldrb r4, [r5, 0xA]
	subs r3, r4
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r0, 4
	add r0, r12
	lsls r0, 2
	ldr r1, _080CFDB8
	adds r6, r0, r1
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080CFDBC
	cmp r0, 0x2
	beq _080CFDD2
	b _080CFDE0
	.align 2, 0
_080CFDB0: .4byte gTasks
_080CFDB4: .4byte gSpriteTemplate_83D74BC
_080CFDB8: .4byte gSprites
_080CFDBC:
	ldrb r2, [r6, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x18
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x57
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x3]
	b _080CFDE0
_080CFDD2:
	ldrb r0, [r6, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r6, 0x3]
_080CFDE0:
	ldr r3, _080CFE38
	lsls r2, r7, 2
	adds r2, r7
	lsls r2, 3
	adds r4, r2, r3
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x14]
	subs r0, r1
	strh r0, [r6, 0x2E]
	strh r7, [r6, 0x3C]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r0, 0xD
	lsls r0, 1
	adds r0, r2
	adds r3, 0x8
	adds r0, r3
	mov r2, r12
	strh r2, [r0]
	ldrh r0, [r4, 0xE]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r0, 0x3F
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x9A
	bl PlaySE12WithPanning
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0x2
	ble _080CFE30
	ldr r0, _080CFE3C
	str r0, [r4]
_080CFE30:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CFE38: .4byte gTasks
_080CFE3C: .4byte sub_80CF9F8
	thumb_func_end sub_80CFA20

	thumb_func_start sub_80CFB04
sub_80CFB04: @ 80CFE40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0
	mov r9, r0
	movs r5, 0
	mov r0, sp
	mov r1, r9
	strh r1, [r0]
	mov r4, sp
	adds r4, 0x2
	strh r1, [r4]
	bl sub_8076BE0
	lsls r0, 24
	mov r10, r4
	cmp r0, 0
	beq _080CFEAC
	ldr r1, _080CFE9C
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x10]
	ldr r3, _080CFEA0
	ldrh r0, [r3]
	negs r0, r0
	strh r0, [r3]
	ldrh r1, [r3, 0x4]
	movs r0, 0x1
	ands r0, r1
	mov r8, r2
	cmp r0, 0
	beq _080CFEA4
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strh r0, [r3, 0x4]
	b _080CFF06
	.align 2, 0
_080CFE9C: .4byte gTasks
_080CFEA0: .4byte gUnknown_03004B00
_080CFEA4:
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r3, 0x4]
	b _080CFF06
_080CFEAC:
	ldr r1, _080CFEF0
	ldr r0, _080CFEF4
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	lsls r2, r7, 2
	mov r8, r2
	cmp r0, 0
	bne _080CFF06
	ldr r1, _080CFEF8
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x10]
	ldr r2, _080CFEFC
	ldrh r0, [r2]
	negs r0, r0
	strh r0, [r2]
	ldrh r0, [r2, 0x2]
	negs r0, r0
	strh r0, [r2, 0x2]
	ldrh r1, [r2, 0x4]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080CFF00
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	b _080CFF04
	.align 2, 0
_080CFEF0: .4byte gUnknown_02024A72
_080CFEF4: .4byte gUnknown_0202F7C9
_080CFEF8: .4byte gTasks
_080CFEFC: .4byte gUnknown_03004B00
_080CFF00:
	movs r0, 0x1
	orrs r0, r1
_080CFF04:
	strh r0, [r2, 0x4]
_080CFF06:
	ldr r5, _080CFF60
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	ldr r1, _080CFF64
	mov r3, r8
	adds r4, r3, r7
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	adds r6, r0, 0
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	mov r9, r0
	ldr r0, _080CFF68
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080CFF70
	ldr r4, _080CFF6C
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080CFF70
	ldrb r0, [r4]
	movs r1, 0
	mov r2, sp
	mov r3, r10
	bl sub_807A3FC
	b _080CFF92
	.align 2, 0
_080CFF60: .4byte gUnknown_0202F7C8
_080CFF64: .4byte gTasks
_080CFF68: .4byte gUnknown_020239F8
_080CFF6C: .4byte gUnknown_0202F7C9
_080CFF70:
	mov r5, sp
	ldr r4, _080CFFCC
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r1, r10
	strh r0, [r1]
_080CFF92:
	mov r4, sp
	ldr r0, _080CFFD0
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	mov r2, sp
	ldr r3, _080CFFD4
	ldrh r0, [r3]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r1, 0x1E]
	strh r0, [r4]
	ldrh r0, [r3, 0x2]
	mov r3, r10
	ldrh r3, [r3]
	adds r0, r3
	strh r0, [r1, 0x20]
	mov r1, r10
	strh r0, [r1]
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	adds r1, r6, 0
	cmp r0, r1
	blt _080CFFD8
	subs r0, r2, r1
	b _080CFFDA
	.align 2, 0
_080CFFCC: .4byte gUnknown_0202F7C9
_080CFFD0: .4byte gTasks
_080CFFD4: .4byte gUnknown_03004B00
_080CFFD8:
	subs r0, r1, r2
_080CFFDA:
	lsls r0, 16
	lsrs r0, 16
	lsls r4, r0, 16
	asrs r4, 16
	ldr r5, _080D0050
	ldrh r1, [r5, 0x4]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	lsls r0, 16
	asrs r0, 16
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	ldr r2, _080D0054
	mov r3, r8
	adds r1, r3, r7
	lsls r1, 3
	adds r6, r1, r2
	strh r0, [r6, 0x12]
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	movs r1, 0x80
	bl sub_81174C4
	strh r0, [r6, 0x14]
	ldrh r0, [r5, 0x4]
	strh r0, [r6, 0x16]
	mov r2, r10
	ldrh r1, [r2]
	movs r3, 0
	ldrsh r0, [r2, r3]
	mov r4, r9
	cmp r0, r4
	blt _080D0058
	subs r4, r1, r4
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	movs r1, 0x2
	negs r1, r1
	ands r1, r0
	strh r1, [r6, 0x18]
	b _080D0078
	.align 2, 0
_080D0050: .4byte gUnknown_03004B00
_080D0054: .4byte gTasks
_080D0058:
	subs r4, r1
	lsls r4, 16
	asrs r4, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	bl sub_81174E0
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_81174C4
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r6, 0x18]
_080D0078:
	ldr r1, _080D00B8
	mov r3, r8
	adds r0, r3, r7
	lsls r0, 3
	adds r5, r0, r1
	ldr r4, _080D00BC
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0xE]
	ldrh r1, [r4, 0x8]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080D00C8
	movs r0, 0x80
	eors r0, r1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080D00F0
	ldr r0, _080D00C0
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D00C4
	adds r1, r2, 0
	ldrh r4, [r4, 0x8]
	adds r1, r4
	adds r0, r1
	b _080D0100
	.align 2, 0
_080D00B8: .4byte gTasks
_080D00BC: .4byte gUnknown_03004B00
_080D00C0: .4byte gUnknown_0202F7C9
_080D00C4: .4byte 0x0000ffc0
_080D00C8:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x3F
	ble _080D00F0
	ldr r0, _080D00E8
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080D00EC
	adds r1, r3, 0
	ldrh r4, [r4, 0x8]
	adds r1, r4
	adds r0, r1
	b _080D0100
	.align 2, 0
_080D00E8: .4byte gUnknown_0202F7C9
_080D00EC: .4byte 0x0000ffc0
_080D00F0:
	ldr r0, _080D012C
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x8]
	subs r0, r1
_080D0100:
	strh r0, [r5, 0xC]
	ldr r0, _080D0130
	mov r2, r8
	adds r1, r2, r7
	lsls r1, 3
	adds r1, r0
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x2
	bgt _080D0118
	movs r0, 0x3
	strh r0, [r1, 0xC]
_080D0118:
	ldr r0, _080D0134
	str r0, [r1]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D012C: .4byte gUnknown_0202F7C9
_080D0130: .4byte gTasks
_080D0134: .4byte sub_80CFA20
	thumb_func_end sub_80CFB04

	thumb_func_start sub_80CFDFC
sub_80CFDFC: @ 80D0138
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r0, _080D0160
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0x2E]
	ldr r0, _080D0164
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0160: .4byte gSpriteTemplate_83D75AC
_080D0164: .4byte sub_80CFE2C
	thumb_func_end sub_80CFDFC

	thumb_func_start sub_80CFE2C
sub_80CFE2C: @ 80D0168
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080D01CC
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r5, [r4, 0x2E]
	ldr r1, _080D01D4
	adds r0, r5, 0
	adds r0, 0x8
	lsls r0, 1
	adds r0, r1
	ldrh r7, [r0]
	adds r6, r1, 0
	adds r1, r5, 0
	adds r1, 0x9
	lsls r0, r5, 1
	adds r0, r6
	adds r2, r0, 0
	adds r2, 0x10
	movs r3, 0x7
	lsls r1, 1
	adds r1, r6
_080D01A0:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080D01A0
	adds r0, r5, 0
	adds r0, 0xF
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	bne _080D01CC
	adds r0, r4, 0
	bl move_anim_8072740
_080D01CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D01D4: .4byte gPlttBufferFaded
	thumb_func_end sub_80CFE2C

	thumb_func_start sub_80CFE9C
sub_80CFE9C: @ 80D01D8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r4, _080D0278
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D027C
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r0, _080D0280
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D021C
	ldrh r0, [r4, 0x4]
	negs r0, r0
	strh r0, [r4, 0x4]
_080D021C:
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r1, [r4, 0x4]
	adds r0, r1
	lsls r0, 16
	ldrh r1, [r5, 0x20]
	lsrs r6, r0, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	strh r6, [r5, 0x32]
	strh r7, [r5, 0x36]
	ldr r0, _080D0284
	str r0, [r5, 0x1C]
	ldr r1, _080D0288
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0278: .4byte gUnknown_0202F7C9
_080D027C: .4byte gUnknown_03004B00
_080D0280: .4byte gUnknown_0202F7C8
_080D0284: .4byte sub_8078C00
_080D0288: .4byte move_anim_8072740
	thumb_func_end sub_80CFE9C

	thumb_func_start sub_80CFF50
sub_80CFF50: @ 80D028C
	ldr r1, _080D029C
	strh r1, [r0, 0x32]
	ldrh r1, [r0, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	ldr r1, _080D02A0
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D029C: .4byte 0x0000fff0
_080D02A0: .4byte sub_80CFF68
	thumb_func_end sub_80CFF50

	thumb_func_start sub_80CFF68
sub_80CFF68: @ 80D02A4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x80
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldr r0, _080D0310
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D02C8
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
_080D02C8:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x5
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7E
	ble _080D0308
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080D0308
	adds r0, r4, 0
	bl move_anim_8072740
_080D0308:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0310: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80CFF68

	thumb_func_start sub_80CFFD8
sub_80CFFD8: @ 80D0314
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080D0360
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080D0364
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080D0368
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0360: .4byte gUnknown_0202F7C9
_080D0364: .4byte sub_8078B34
_080D0368: .4byte sub_80D0030
	thumb_func_end sub_80CFFD8

	thumb_func_start sub_80D0030
sub_80D0030: @ 80D036C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3F
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xA6
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	movs r2, 0
	movs r1, 0x7
	adds r0, r4, 0
	adds r0, 0x3C
_080D03A0:
	strh r2, [r0]
	subs r0, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080D03A0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	ands r0, r1
	ldr r2, _080D03E8
	adds r1, r2, 0
	subs r1, r0
	strh r1, [r4, 0x3A]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA0
	bl __umodsi3
	adds r0, 0xA0
	strh r0, [r4, 0x3C]
	ldr r0, _080D03EC
	str r0, [r4, 0x1C]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D03E8: .4byte 0x0000fff4
_080D03EC: .4byte sub_80D00B4
	thumb_func_end sub_80D0030

	thumb_func_start sub_80D00B4
sub_80D00B4: @ 80D03F0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	ldrh r2, [r4, 0x2E]
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r2, r0, 24
	strh r2, [r4, 0x24]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D040E
	negs r0, r2
	strh r0, [r4, 0x24]
_080D040E:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7E
	ble _080D044E
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D044E
	adds r0, r4, 0
	bl move_anim_8072740
_080D044E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D00B4

	thumb_func_start sub_80D0118
sub_80D0118: @ 80D0454
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r0, _080D04A4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D0472
	ldrh r0, [r4, 0x22]
	adds r0, 0x10
	strh r0, [r4, 0x22]
_080D0472:
	ldr r1, _080D04A8
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0xC]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldr r0, _080D04AC
	str r0, [r4, 0x1C]
	ldr r1, _080D04B0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D04A4: .4byte gUnknown_0202F7C8
_080D04A8: .4byte gUnknown_03004B00
_080D04AC: .4byte sub_8078114
_080D04B0: .4byte move_anim_8072740
	thumb_func_end sub_80D0118

	thumb_func_start sub_80D0178
sub_80D0178: @ 80D04B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r7, 0x20
	ldr r4, _080D0530
	movs r0, 0x10
	mov r8, r0
	ldr r6, _080D0534
	ldr r0, _080D0538
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080D04E0
	adds r7, r4, 0
	movs r4, 0x20
	mov r8, r6
	movs r6, 0x10
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080D04E0:
	lsls r0, r7, 16
	asrs r0, 16
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080D053C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	add r0, r8
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _080D0540
	str r0, [r5, 0x1C]
	ldr r1, _080D0544
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0530: .4byte 0x0000ffe0
_080D0534: .4byte 0x0000fff0
_080D0538: .4byte gUnknown_03004B00
_080D053C: .4byte gUnknown_0202F7C9
_080D0540: .4byte sub_8078B34
_080D0544: .4byte sub_80D020C
	thumb_func_end sub_80D0178

	thumb_func_start sub_80D020C
sub_80D020C: @ 80D0548
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D055E
	adds r0, r2, 0
	bl move_anim_8072740
_080D055E:
	pop {r0}
	bx r0
	thumb_func_end sub_80D020C

	thumb_func_start sub_80D0228
sub_80D0228: @ 80D0564
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r0, 0x20
	mov r8, r0
	ldr r4, _080D05F8
	movs r2, 0x10
	mov r9, r2
	ldr r6, _080D05FC
	ldr r7, _080D0600
	ldrh r1, [r7]
	movs r2, 0
	ldrsh r0, [r7, r2]
	cmp r0, 0
	beq _080D0598
	mov r8, r4
	movs r4, 0x20
	mov r9, r6
	movs r6, 0x10
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_080D0598:
	mov r0, r8
	lsls r1, r0, 16
	asrs r1, 16
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080D0604
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	add r0, r9
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r7]
	strh r0, [r5, 0x38]
	ldrh r0, [r5, 0x2E]
	strh r0, [r5, 0x3A]
	ldr r0, _080D0608
	str r0, [r5, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D05F8: .4byte 0x0000ffe0
_080D05FC: .4byte 0x0000fff0
_080D0600: .4byte gUnknown_03004B00
_080D0604: .4byte gUnknown_0202F7C9
_080D0608: .4byte sub_80D02D0
	thumb_func_end sub_80D0228

	thumb_func_start sub_80D02D0
sub_80D02D0: @ 80D060C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D0670
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D0670
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0x2
	strh r0, [r4, 0x24]
	ldr r0, _080D0678
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	eors r0, r1
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x36]
	strh r2, [r4, 0x34]
	ldr r0, _080D067C
	str r0, [r4, 0x1C]
_080D0670:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0678: .4byte 0x0000fffe
_080D067C: .4byte sub_80D0344
	thumb_func_end sub_80D02D0

	thumb_func_start sub_80D0344
sub_80D0344: @ 80D0680
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D0698
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	negs r0, r0
	strh r0, [r4, 0x26]
_080D0698:
	ldrh r0, [r4, 0x34]
	movs r1, 0x1
	eors r0, r1
	movs r1, 0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080D06DA
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x36]
	strh r1, [r4, 0x34]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x38]
	movs r1, 0x1
	eors r1, r0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080D06E0
	str r0, [r4, 0x1C]
_080D06DA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D06E0: .4byte sub_80D03A8
	thumb_func_end sub_80D0344

	thumb_func_start sub_80D03A8
sub_80D03A8: @ 80D06E4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D06F8
	adds r0, r4, 0
	bl move_anim_8072740
_080D06F8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D03A8

	thumb_func_start sub_80D03C4
sub_80D03C4: @ 80D0700
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078E70
	adds r0, r4, 0
	movs r1, 0xD0
	movs r2, 0xD0
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _080D0758
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0
	bl sub_8079108
	ldr r1, _080D075C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x50
	strh r1, [r0, 0x8]
	ldr r1, _080D0760
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0758: .4byte gSprites
_080D075C: .4byte gTasks
_080D0760: .4byte sub_80D0428
	thumb_func_end sub_80D03C4

	thumb_func_start sub_80D0428
sub_80D0428: @ 80D0764
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D07BC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080D07B4
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8078F40
	ldr r1, _080D07C0
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0x1
	bl sub_8079108
	adds r0, r5, 0
	bl move_anim_task_del
_080D07B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D07BC: .4byte gTasks
_080D07C0: .4byte gSprites
	thumb_func_end sub_80D0428

	thumb_func_start sub_80D0488
sub_80D0488: @ 80D07C4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D0810
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x8]
	movs r1, 0
	bl sub_8078E70
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0x10]
	strh r5, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldr r0, _080D0814
	ldrb r0, [r0]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x16]
	ldr r0, _080D0818
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0810: .4byte gTasks
_080D0814: .4byte gUnknown_0202F7C8
_080D0818: .4byte sub_80D04E0
	thumb_func_end sub_80D0488

	thumb_func_start sub_80D04E0
sub_80D04E0: @ 80D081C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080D0840
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080D0836
	b _080D0946
_080D0836:
	lsls r0, 2
	ldr r1, _080D0844
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D0840: .4byte gTasks
_080D0844: .4byte _080D0848
	.align 2, 0
_080D0848:
	.4byte _080D0860
	.4byte _080D08A8
	.4byte _080D08DE
	.4byte _080D08E4
	.4byte _080D08F4
	.4byte _080D0928
_080D0860:
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080D0870
	cmp r0, 0x3
	beq _080D0870
	cmp r0, 0x6
	bne _080D0878
_080D0870:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80D0614
_080D0878:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	adds r0, 0x28
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r1, 0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8079A64
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x20
	bne _080D0946
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	b _080D0920
_080D08A8:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D0946
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r1, 0x3
	bne _080D08BE
	strh r0, [r4, 0xC]
	strh r1, [r4, 0xA]
	b _080D0946
_080D08BE:
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r2, 0x80
	lsls r2, 1
	strh r2, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8079A64
	movs r0, 0x2
	strh r0, [r4, 0xA]
	b _080D0946
_080D08DE:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D0946
_080D08E4:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _080D0946
	b _080D091C
_080D08F4:
	ldrh r0, [r4, 0xC]
	adds r0, 0x2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	subs r0, 0x50
	strh r0, [r4, 0x10]
	ldrb r0, [r4, 0x8]
	movs r1, 0x10
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x8]
	bl sub_8079A64
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x20
	bne _080D0946
_080D091C:
	movs r0, 0
	strh r0, [r4, 0xC]
_080D0920:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080D0946
_080D0928:
	ldrb r0, [r4, 0x8]
	bl sub_8078F40
	ldr r2, _080D094C
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x26]
	adds r0, r5, 0
	bl move_anim_task_del
_080D0946:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D094C: .4byte gSprites
	thumb_func_end sub_80D04E0

	thumb_func_start sub_80D0614
sub_80D0614: @ 80D0950
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r0, 16
	asrs r4, r0, 16
	cmp r4, 0
	blt _080D0A2A
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xFF
	bne _080D0994
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _080D0990
	adds r0, r1
	bl obj_delete_but_dont_free_vram
	b _080D0A2A
	.align 2, 0
_080D0990: .4byte gSprites
_080D0994:
	ldr r5, _080D0A38
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r4, r3, r5
	ldrb r1, [r4, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrb r0, [r7, 0x16]
	ldrb r1, [r7, 0xE]
	subs r0, r1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldrh r0, [r7, 0xE]
	adds r0, 0x1
	strh r0, [r7, 0xE]
	ldrh r0, [r7, 0x14]
	adds r0, 0x1
	strh r0, [r7, 0x14]
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	movs r0, 0x6
	strh r0, [r4, 0x32]
	adds r5, 0x1C
	adds r3, r5
	ldr r0, _080D0A3C
	str r0, [r3]
	mov r1, r8
	lsls r0, r1, 24
	lsrs r0, 24
	movs r1, 0x10
	ldrsh r2, [r7, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r0, [r4, 0x1]
	movs r3, 0x4
	negs r3, r3
	ands r3, r0
	movs r0, 0x1
	orrs r3, r0
	strb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
_080D0A2A:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0A38: .4byte gSprites
_080D0A3C: .4byte sub_80D0704
	thumb_func_end sub_80D0614

	thumb_func_start sub_80D0704
sub_80D0704: @ 80D0A40
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080D0A7E
	ldr r3, _080D0A84
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl obj_delete_but_dont_free_vram
_080D0A7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0A84: .4byte gTasks
	thumb_func_end sub_80D0704

	thumb_func_start sub_80D074C
sub_80D074C: @ 80D0A88
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D0AAC
	adds r4, r0, r1
	ldr r5, _080D0AB0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D0AB4
	adds r0, r2, 0
	bl move_anim_task_del
	b _080D0ADA
	.align 2, 0
_080D0AAC: .4byte gTasks
_080D0AB0: .4byte gUnknown_03004B00
_080D0AB4:
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r4, 0x8]
	strh r2, [r4, 0xA]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xC]
	strh r2, [r4, 0xE]
	strh r2, [r4, 0x10]
	ldr r2, _080D0AE0
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D0AE4
	str r0, [r4]
_080D0ADA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0AE0: .4byte gUnknown_083D76F4
_080D0AE4: .4byte sub_80D07AC
	thumb_func_end sub_80D074C

	thumb_func_start sub_80D07AC
sub_80D07AC: @ 80D0AE8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D0B0C
	adds r4, r0, r1
	movs r0, 0xA
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080D0B50
	cmp r5, 0x1
	bgt _080D0B10
	cmp r5, 0
	beq _080D0B1A
	b _080D0BF8
	.align 2, 0
_080D0B0C: .4byte gTasks
_080D0B10:
	cmp r5, 0x2
	beq _080D0B84
	cmp r5, 0x3
	beq _080D0BB4
	b _080D0BF8
_080D0B1A:
	adds r0, r4, 0
	bl sub_807992C
	ldrh r2, [r4, 0x10]
	adds r2, 0x3
	strh r2, [r4, 0x10]
	ldr r3, _080D0B4C
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D0BF8
	strh r5, [r4, 0xE]
	b _080D0BAC
	.align 2, 0
_080D0B4C: .4byte gSprites
_080D0B50:
	adds r0, r4, 0
	bl sub_807992C
	ldr r2, _080D0B80
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	ldrh r2, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D0BF8
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080D0BAC
	.align 2, 0
_080D0B80: .4byte gSprites
_080D0B84:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D0BAC
	ldr r2, _080D0BA8
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x2
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0x10]
	subs r0, 0x2
	strh r0, [r4, 0x10]
	b _080D0BF8
	.align 2, 0
_080D0BA8: .4byte gSprites
_080D0BAC:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080D0BF8
_080D0BB4:
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080D0BF8
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080D0BEC
	ldr r2, _080D0BE8
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
	b _080D0BF8
	.align 2, 0
_080D0BE8: .4byte gSprites
_080D0BEC:
	ldrb r1, [r4, 0x8]
	ldr r2, _080D0C00
	adds r0, r4, 0
	bl sub_80798F4
	strh r5, [r4, 0xA]
_080D0BF8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D0C00: .4byte gUnknown_083D76F4
	thumb_func_end sub_80D07AC

	thumb_func_start sub_80D08C8
sub_80D08C8: @ 80D0C04
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D0C34
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080D0C38
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D0C3C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0C34: .4byte gTasks
_080D0C38: .4byte gUnknown_083D7714
_080D0C3C: .4byte sub_80D0904
	thumb_func_end sub_80D08C8

	thumb_func_start sub_80D0904
sub_80D0904: @ 80D0C40
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D0C68
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080D0C60
	adds r0, r4, 0
	bl move_anim_task_del
_080D0C60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0C68: .4byte gTasks
	thumb_func_end sub_80D0904

	thumb_func_start sub_80D0930
sub_80D0930: @ 80D0C6C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D0C9C
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D0CA0
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r4, 0x20]
	movs r0, 0x40
	b _080D0CBA
	.align 2, 0
_080D0C9C: .4byte gUnknown_0202F7C8
_080D0CA0:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x20
	strh r0, [r4, 0x20]
	ldr r0, _080D0CEC
_080D0CBA:
	strh r0, [r4, 0x30]
	ldr r0, _080D0CF0
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r4, 0x22]
	movs r0, 0x34
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x32]
	strh r1, [r4, 0x34]
	strh r1, [r4, 0x36]
	ldr r1, _080D0CF4
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080D0CF8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D0CEC: .4byte 0x0000ffc0
_080D0CF0: .4byte gUnknown_0202F7C8
_080D0CF4: .4byte move_anim_8072740
_080D0CF8: .4byte sub_8078394
	thumb_func_end sub_80D0930

	thumb_func_start sub_80D09C0
sub_80D09C0: @ 80D0CFC
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080D0D10
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D0D18
	ldr r0, _080D0D14
	b _080D0D1A
	.align 2, 0
_080D0D10: .4byte gUnknown_03004B00
_080D0D14: .4byte gUnknown_0202F7C8
_080D0D18:
	ldr r0, _080D0D78
_080D0D1A:
	ldrb r5, [r0]
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D0D34
	ldr r1, _080D0D7C
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080D0D34:
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D0D7C
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x4]
	adds r0, r4
	strh r0, [r6, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bgt _080D0D66
	movs r0, 0x8
	strh r0, [r6, 0x22]
_080D0D66:
	ldr r1, _080D0D80
	adds r0, r6, 0
	bl oamt_set_x3A_32
	ldr r0, _080D0D84
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D0D78: .4byte gUnknown_0202F7C9
_080D0D7C: .4byte gUnknown_03004B00
_080D0D80: .4byte move_anim_8074EE0
_080D0D84: .4byte sub_80785E4
	thumb_func_end sub_80D09C0

	thumb_func_start sub_80D0A4C
sub_80D0A4C: @ 80D0D88
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D0DBC
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	strh r1, [r4, 0x8]
	strh r0, [r4, 0xA]
	ldr r2, _080D0DC0
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D0DC4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0DBC: .4byte gTasks
_080D0DC0: .4byte gUnknown_083D77B0
_080D0DC4: .4byte sub_80D0A8C
	thumb_func_end sub_80D0A4C

	thumb_func_start sub_80D0A8C
sub_80D0A8C: @ 80D0DC8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D0DF0
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080D0DE8
	adds r0, r4, 0
	bl move_anim_task_del
_080D0DE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0DF0: .4byte gTasks
	thumb_func_end sub_80D0A8C

	thumb_func_start sub_80D0AB8
sub_80D0AB8: @ 80D0DF4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D0E68
	adds r4, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	strh r0, [r4, 0x8]
	strh r2, [r4, 0xA]
	movs r0, 0x4
	strh r0, [r4, 0xC]
	movs r0, 0x7
	strh r0, [r4, 0xE]
	movs r0, 0x3
	strh r0, [r4, 0x10]
	ldr r3, _080D0E6C
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x20]
	strh r0, [r4, 0x12]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x14]
	strh r2, [r4, 0x16]
	strh r2, [r4, 0x18]
	movs r0, 0x2
	strh r0, [r4, 0x1A]
	ldr r0, _080D0E70
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D0E5E
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4, 0xC]
_080D0E5E:
	ldr r0, _080D0E74
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0E68: .4byte gTasks
_080D0E6C: .4byte gSprites
_080D0E70: .4byte gUnknown_0202F7C8
_080D0E74: .4byte sub_80D0B3C
	thumb_func_end sub_80D0AB8

	thumb_func_start sub_80D0B3C
sub_80D0B3C: @ 80D0E78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D0EC0
	adds r3, r0, r1
	ldrh r0, [r3, 0x16]
	adds r0, 0x1
	strh r0, [r3, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D0EDE
	movs r0, 0
	strh r0, [r3, 0x16]
	ldrh r0, [r3, 0x18]
	adds r0, 0x1
	strh r0, [r3, 0x18]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D0EC8
	ldr r2, _080D0EC4
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x1A]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	b _080D0EDC
	.align 2, 0
_080D0EC0: .4byte gTasks
_080D0EC4: .4byte gSprites
_080D0EC8:
	ldr r2, _080D0EF0
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	ldrh r2, [r3, 0x1A]
	subs r1, r2
_080D0EDC:
	strh r1, [r0, 0x22]
_080D0EDE:
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _080D0F2C
	cmp r0, 0x1
	bgt _080D0EF4
	cmp r0, 0
	beq _080D0EFA
	b _080D0FBC
	.align 2, 0
_080D0EF0: .4byte gSprites
_080D0EF4:
	cmp r0, 0x2
	beq _080D0F5C
	b _080D0FBC
_080D0EFA:
	ldr r2, _080D0F28
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0xC]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	strh r1, [r0, 0x20]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080D0FBC
	movs r0, 0xE
	strh r0, [r3, 0xE]
	movs r0, 0x1
	strh r0, [r3, 0xA]
	b _080D0FBC
	.align 2, 0
_080D0F28: .4byte gSprites
_080D0F2C:
	ldr r2, _080D0F58
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x20]
	ldrh r2, [r3, 0xC]
	subs r1, r2
	strh r1, [r0, 0x20]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _080D0FBC
	movs r0, 0x7
	strh r0, [r3, 0xE]
	movs r0, 0x2
	strh r0, [r3, 0xA]
	b _080D0FBC
	.align 2, 0
_080D0F58: .4byte gSprites
_080D0F5C:
	ldr r2, _080D0F94
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0xC]
	ldrh r5, [r0, 0x20]
	adds r1, r5
	strh r1, [r0, 0x20]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	bne _080D0FBC
	ldrh r0, [r3, 0x10]
	subs r0, 0x1
	strh r0, [r3, 0x10]
	lsls r0, 16
	cmp r0, 0
	beq _080D0F98
	movs r0, 0x7
	strh r0, [r3, 0xE]
	strh r1, [r3, 0xA]
	b _080D0FBC
	.align 2, 0
_080D0F94: .4byte gSprites
_080D0F98:
	ldrh r1, [r3, 0x18]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D0FB6
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	ldrh r2, [r3, 0x1A]
	subs r1, r2
	strh r1, [r0, 0x22]
_080D0FB6:
	adds r0, r4, 0
	bl move_anim_task_del
_080D0FBC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D0B3C

	thumb_func_start sub_80D0C88
sub_80D0C88: @ 80D0FC4
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D1014
	adds r5, r1, r0
	ldr r4, _080D1018
	ldrb r0, [r4]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	movs r1, 0
	strh r0, [r5, 0x8]
	movs r0, 0x4
	strh r0, [r5, 0xA]
	strh r1, [r5, 0xC]
	strh r1, [r5, 0xE]
	strh r1, [r5, 0x10]
	strh r1, [r5, 0x12]
	ldrb r0, [r4]
	bl sub_807A100
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D1024
	ldr r0, _080D101C
	ldrh r0, [r0]
	strh r0, [r5, 0x14]
	ldr r0, _080D1020
	b _080D102C
	.align 2, 0
_080D1014: .4byte gTasks
_080D1018: .4byte gUnknown_0202F7C9
_080D101C: .4byte gUnknown_030042C0
_080D1020: .4byte 0x04000014
_080D1024:
	ldr r0, _080D1090
	ldrh r0, [r0]
	strh r0, [r5, 0x14]
	ldr r0, _080D1094
_080D102C:
	str r0, [sp]
	ldrh r0, [r5, 0x8]
	adds r1, r0, 0
	subs r1, 0x40
	lsls r2, r1, 16
	lsls r0, 16
	cmp r2, r0
	bgt _080D106A
	ldr r4, _080D1098
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r4, r0
_080D1044:
	asrs r3, r2, 16
	cmp r3, 0
	blt _080D105C
	lsls r1, r3, 1
	adds r2, r1, r4
	ldrh r0, [r5, 0x14]
	adds r0, 0xF0
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r5, 0x14]
	adds r0, 0xF0
	strh r0, [r1]
_080D105C:
	adds r0, r3, 0x1
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	cmp r1, r0
	ble _080D1044
_080D106A:
	ldr r0, _080D109C
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _080D10A0
	str r0, [r5]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1090: .4byte gUnknown_03004288
_080D1094: .4byte 0x04000018
_080D1098: .4byte gUnknown_03004DE0
_080D109C: .4byte 0xa2600001
_080D10A0: .4byte sub_80D0D68
	thumb_func_end sub_80D0C88

	thumb_func_start sub_80D0D68
sub_80D0D68: @ 80D10A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D10C4
	adds r3, r0, r1
	movs r1, 0x10
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080D10C8
	cmp r0, 0x1
	beq _080D10DE
	b _080D115E
	.align 2, 0
_080D10C4: .4byte gTasks
_080D10C8:
	ldrh r0, [r3, 0x12]
	adds r0, 0x1
	strh r0, [r3, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080D115E
	ldrh r0, [r3, 0x10]
	adds r0, 0x1
	strh r0, [r3, 0x10]
	b _080D115E
_080D10DE:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080D115E
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r1, [r3, 0xE]
	movs r0, 0x3
	ands r0, r1
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	subs r0, r1
	strh r0, [r3, 0x12]
	movs r2, 0xC
	ldrsh r1, [r3, r2]
	cmp r1, 0x1
	beq _080D1114
	cmp r1, 0x1
	ble _080D111C
	cmp r1, 0x2
	beq _080D1118
	cmp r1, 0x3
	beq _080D1118
	b _080D111C
_080D1114:
	subs r0, 0x2
	b _080D111A
_080D1118:
	adds r0, 0x1
_080D111A:
	strh r0, [r3, 0x12]
_080D111C:
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	cmp r0, 0
	blt _080D1140
	ldr r2, _080D1164
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r3, 0x14]
	strh r1, [r0]
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	lsls r0, 1
	movs r1, 0xF0
	lsls r1, 3
	adds r2, r1
	adds r0, r2
	ldrh r1, [r3, 0x14]
	strh r1, [r0]
_080D1140:
	ldrh r0, [r3, 0xE]
	adds r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x26
	ldrsh r1, [r3, r2]
	cmp r0, r1
	blt _080D115E
	ldr r1, _080D1168
	movs r0, 0x3
	strb r0, [r1, 0x15]
	adds r0, r4, 0
	bl move_anim_task_del
_080D115E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1164: .4byte gUnknown_03004DE0
_080D1168: .4byte gUnknown_03004DC0
	thumb_func_end sub_80D0D68

	thumb_func_start sub_80D0E30
sub_80D0E30: @ 80D116C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080D11C0
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x10
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrb r0, [r6]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x2E]
	strh r5, [r4, 0x30]
	strh r5, [r4, 0x32]
	movs r0, 0x10
	strh r0, [r4, 0x34]
	strh r5, [r4, 0x36]
	ldrb r0, [r6]
	movs r1, 0
	bl sub_807A100
	adds r0, 0x2
	strh r0, [r4, 0x38]
	movs r0, 0x3F
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x3A]
	ldr r0, _080D11C4
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D11C0: .4byte gUnknown_0202F7C9
_080D11C4: .4byte sub_80D0E8C
	thumb_func_end sub_80D0E30

	thumb_func_start sub_80D0E8C
sub_80D0E8C: @ 80D11C8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080D122C
	cmp r1, 0x1
	bgt _080D11DE
	cmp r1, 0
	beq _080D11E4
	b _080D130C
_080D11DE:
	cmp r1, 0x2
	beq _080D12BE
	b _080D130C
_080D11E4:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D120E
	strh r1, [r4, 0x32]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D120E:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D130C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	b _080D12B6
_080D122C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080D1272
	ldrh r2, [r4, 0x32]
	movs r3, 0x32
	ldrsh r1, [r4, r3]
	movs r3, 0x38
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D1272
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	subs r0, 0x1
	strh r0, [r4, 0x22]
	adds r0, r2, 0x1
	strh r0, [r4, 0x32]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080D1272
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCD
	bl PlaySE12WithPanning
_080D1272:
	ldrh r0, [r4, 0x34]
	ldrh r2, [r4, 0x36]
	adds r1, r0, r2
	strh r1, [r4, 0x36]
	lsls r0, r1, 16
	asrs r2, r0, 16
	cmp r2, 0x1F
	ble _080D1286
	movs r0, 0x40
	b _080D1294
_080D1286:
	movs r0, 0x20
	negs r0, r0
	cmp r2, r0
	bgt _080D12A0
	movs r2, 0x40
	negs r2, r2
	adds r0, r2, 0
_080D1294:
	subs r0, r1
	strh r0, [r4, 0x36]
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	negs r0, r0
	strh r0, [r4, 0x34]
_080D12A0:
	ldrh r0, [r4, 0x36]
	movs r2, 0
	strh r0, [r4, 0x24]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080D130C
	strh r2, [r4, 0x30]
	strh r2, [r4, 0x32]
_080D12B6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D130C
_080D12BE:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D12EA
	movs r0, 0
	strh r0, [r4, 0x32]
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsrs r1, r2, 2
	movs r0, 0x1
	eors r1, r0
	ands r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D12EA:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D130C
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	bl move_anim_8072740
_080D130C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D0E8C

	thumb_func_start sub_80D0FD8
sub_80D0FD8: @ 80D1314
	push {r4-r7,lr}
	sub sp, 0x4
	adds r6, r0, 0
	movs r5, 0
	mov r0, sp
	strh r5, [r0]
	mov r1, sp
	adds r1, 0x2
	strh r5, [r1]
	ldr r0, _080D1338
	movs r3, 0x4
	ldrsh r2, [r0, r3]
	adds r7, r1, 0
	adds r1, r0, 0
	cmp r2, 0
	bne _080D1340
	ldr r0, _080D133C
	b _080D1342
	.align 2, 0
_080D1338: .4byte gUnknown_03004B00
_080D133C: .4byte gUnknown_0202F7C8
_080D1340:
	ldr r0, _080D137C
_080D1342:
	ldrb r5, [r0]
	ldrb r1, [r1, 0x6]
	movs r0, 0x1
	adds r4, r0, 0
	eors r4, r1
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080D13BA
	movs r1, 0x2
	adds r0, r5, 0
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080D13BA
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, sp
	adds r3, r7, 0
	bl sub_807A3FC
	cmp r4, 0
	bne _080D1380
	adds r0, r5, 0
	movs r1, 0
	b _080D1384
	.align 2, 0
_080D137C: .4byte gUnknown_0202F7C9
_080D1380:
	adds r0, r5, 0
	movs r1, 0x2
_080D1384:
	bl sub_8077ABC
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D13B0
	ldr r2, _080D13AC
	mov r0, sp
	ldrh r1, [r0]
	subs r1, r4
	ldrh r0, [r2]
	subs r1, r0
	subs r0, r1
	strh r0, [r2]
	b _080D13BA
	.align 2, 0
_080D13AC: .4byte gUnknown_03004B00
_080D13B0:
	ldr r1, _080D13CC
	mov r0, sp
	ldrh r0, [r0]
	subs r0, r4
	strh r0, [r1]
_080D13BA:
	ldr r1, _080D13D0
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D13CC: .4byte gUnknown_03004B00
_080D13D0: .4byte sub_80793C4
	thumb_func_end sub_80D0FD8

	thumb_func_start sub_80D1098
sub_80D1098: @ 80D13D4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D13EE
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl move_anim_8072740
_080D13EE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D1098

	thumb_func_start sub_80D10B8
sub_80D10B8: @ 80D13F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	movs r6, 0
	mov r0, sp
	strh r6, [r0]
	mov r1, sp
	adds r1, 0x2
	strh r6, [r1]
	ldr r0, _080D1420
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080D142C
	ldr r0, _080D1424
	ldrb r7, [r0]
	ldr r0, _080D1428
	b _080D1432
	.align 2, 0
_080D1420: .4byte gUnknown_03004B00
_080D1424: .4byte gUnknown_0202F7C8
_080D1428: .4byte gUnknown_0202F7C9
_080D142C:
	ldr r0, _080D144C
	ldrb r7, [r0]
	ldr r0, _080D1450
_080D1432:
	ldrb r0, [r0]
	mov r8, r0
	ldr r0, _080D1454
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080D1458
	movs r0, 0
	mov r10, r0
	movs r1, 0x1
	str r1, [sp, 0x4]
	b _080D1460
	.align 2, 0
_080D144C: .4byte gUnknown_0202F7C9
_080D1450: .4byte gUnknown_0202F7C8
_080D1454: .4byte gUnknown_03004B00
_080D1458:
	movs r2, 0x2
	mov r10, r2
	movs r3, 0x3
	str r3, [sp, 0x4]
_080D1460:
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D14BC
	adds r0, r7, 0
	mov r1, r10
	bl sub_8077ABC
	lsls r0, 24
	ldr r1, _080D14A0
	lsrs r0, 24
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	movs r0, 0x2
	mov r4, r8
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080D14AC
	ldr r2, _080D14A4
	ldr r0, _080D14A8
	adds r0, r4, r0
	b _080D1546
	.align 2, 0
_080D14A0: .4byte gUnknown_03004B00
_080D14A4: .4byte gSprites
_080D14A8: .4byte gUnknown_02024BE0
_080D14AC:
	ldr r2, _080D14B4
	ldr r0, _080D14B8
	add r0, r8
	b _080D1546
	.align 2, 0
_080D14B4: .4byte gSprites
_080D14B8: .4byte gUnknown_02024BE0
_080D14BC:
	adds r0, r7, 0
	mov r1, r10
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080D1528
	ldrh r1, [r1]
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r0, _080D152C
	ldr r1, _080D1530
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D1540
	adds r4, r7, 0
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080D1540
	ldr r3, _080D1534
	ldr r2, _080D1538
	adds r0, r7, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r6, r0, r3
	adds r2, r4, r2
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r3
	movs r3, 0x20
	ldrsh r1, [r6, r3]
	movs r3, 0x20
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080D153C
	adds r0, r2, 0
	adds r0, 0x43
	ldrb r0, [r0]
	adds r0, 0x1
	b _080D1556
	.align 2, 0
_080D1528: .4byte gUnknown_03004B00
_080D152C: .4byte gMain
_080D1530: .4byte 0x0000043d
_080D1534: .4byte gSprites
_080D1538: .4byte gUnknown_02024BE0
_080D153C:
	adds r0, r6, 0
	b _080D1550
_080D1540:
	ldr r2, _080D15A4
	ldr r0, _080D15A8
	adds r0, r7, r0
_080D1546:
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
_080D1550:
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
_080D1556:
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
	adds r0, r7, 0
	ldr r1, [sp, 0x4]
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D15AC
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r0, _080D15B0
	ldr r2, _080D15B4
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D15B8
	mov r0, r8
	movs r1, 0x2
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080D15B8
	ldrb r1, [r4, 0xC]
	mov r0, r8
	mov r2, sp
	mov r3, sp
	adds r3, 0x2
	bl sub_807A3FC
	b _080D15D8
	.align 2, 0
_080D15A4: .4byte gSprites
_080D15A8: .4byte gUnknown_02024BE0
_080D15AC: .4byte gUnknown_03004B00
_080D15B0: .4byte gMain
_080D15B4: .4byte 0x0000043d
_080D15B8:
	mov r4, sp
	mov r0, r8
	mov r1, r10
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	mov r0, r8
	ldr r1, [sp, 0x4]
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r3, sp
	strh r0, [r3, 0x2]
_080D15D8:
	mov r0, r8
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D15FC
	mov r3, sp
	mov r2, sp
	ldr r1, _080D15F8
	ldrh r0, [r1, 0x6]
	ldrh r2, [r2]
	adds r0, r2
	strh r0, [r3]
	adds r2, r1, 0
	b _080D160A
	.align 2, 0
_080D15F8: .4byte gUnknown_03004B00
_080D15FC:
	mov r3, sp
	mov r0, sp
	ldr r2, _080D164C
	ldrh r0, [r0]
	ldrh r1, [r2, 0x6]
	subs r0, r1
	strh r0, [r3]
_080D160A:
	ldrh r1, [r2, 0x8]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	adds r1, r0
	mov r3, sp
	strh r1, [r3, 0x2]
	mov r0, r9
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x20]
	strh r6, [r5, 0x34]
	strh r6, [r5, 0x22]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x32]
	strh r1, [r5, 0x36]
	ldrh r0, [r2]
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D1650
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D164C: .4byte gUnknown_03004B00
_080D1650: .4byte sub_80D1098
	thumb_func_end sub_80D10B8

	thumb_func_start sub_80D1318
sub_80D1318: @ 80D1654
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D1694
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080D167A
	lsls r0, 20
	ldr r1, _080D1698
	adds r0, r1
	lsrs r0, 16
	ldr r1, _080D169C
	ldrb r2, [r1, 0xA]
	ldrh r3, [r1, 0x8]
	movs r1, 0xF
	bl BlendPalette
_080D167A:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080D16A0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1694: .4byte 0x000027db
_080D1698: .4byte 0x01010000
_080D169C: .4byte gUnknown_03004B00
_080D16A0: .4byte sub_80793C4
	thumb_func_end sub_80D1318

	thumb_func_start sub_80D1368
sub_80D1368: @ 80D16A4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r0, _080D16D8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0xA0
	cmp r0, 0
	beq _080D16C0
	ldr r1, _080D16DC
_080D16C0:
	movs r0, 0xE0
	lsls r0, 2
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	ldr r0, _080D16E0
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x3C]
	ldr r0, _080D16E4
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D16D8: .4byte gUnknown_0202F7C8
_080D16DC: .4byte 0x0000ff60
_080D16E0: .4byte gUnknown_03004B00
_080D16E4: .4byte sub_80D13AC
	thumb_func_end sub_80D1368

	thumb_func_start sub_80D13AC
sub_80D13AC: @ 80D16E8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x2E]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	subs r1, r0
	movs r5, 0
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	subs r2, 0x20
	strh r2, [r4, 0x2E]
	ldr r0, _080D1754
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0xA0
	cmp r0, 0
	beq _080D1718
	ldr r1, _080D1758
_080D1718:
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x26]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080D174C
	ldrh r2, [r4, 0x22]
	adds r0, r1, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x24]
	strh r5, [r4, 0x2E]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _080D175C
	str r0, [r4, 0x1C]
_080D174C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1754: .4byte gUnknown_0202F7C8
_080D1758: .4byte 0x0000ff60
_080D175C: .4byte sub_80D1424
	thumb_func_end sub_80D13AC

	thumb_func_start sub_80D1424
sub_80D1424: @ 80D1760
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080D177E
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080D1784
	str r0, [r4, 0x1C]
_080D177E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1784: .4byte sub_80D144C
	thumb_func_end sub_80D1424

	thumb_func_start sub_80D144C
sub_80D144C: @ 80D1788
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D17EE
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0
	strh r0, [r4, 0x2E]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D17D4
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x10
	ldr r3, _080D17C8
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D17CC
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r0, _080D17D0
	b _080D17EC
	.align 2, 0
_080D17C8: .4byte 0x000003ff
_080D17CC: .4byte 0xfffffc00
_080D17D0: .4byte sub_80D14C4
_080D17D4:
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x20
	ldr r3, _080D17F4
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D17F8
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r0, _080D17FC
_080D17EC:
	str r0, [r4, 0x1C]
_080D17EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D17F4: .4byte 0x000003ff
_080D17F8: .4byte 0xfffffc00
_080D17FC: .4byte sub_80D154C
	thumb_func_end sub_80D144C

	thumb_func_start sub_80D14C4
sub_80D14C4: @ 80D1800
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x26]
	subs r0, 0x2
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	bne _080D1834
	movs r0, 0x10
	strh r0, [r2, 0x2E]
	movs r0, 0
	strh r0, [r2, 0x30]
	ldr r1, _080D1838
	movs r3, 0xFD
	lsls r3, 6
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x2E]
	strh r0, [r1]
	ldr r0, _080D183C
	str r0, [r2, 0x1C]
_080D1834:
	pop {r0}
	bx r0
	.align 2, 0
_080D1838: .4byte 0x04000050
_080D183C: .4byte sub_80D1504
	thumb_func_end sub_80D14C4

	thumb_func_start sub_80D1504
sub_80D1504: @ 80D1840
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080D1878
	ldrh r1, [r4, 0x2E]
	subs r1, 0x1
	strh r1, [r4, 0x2E]
	ldr r2, _080D1880
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D1878
	ldr r0, _080D1884
	str r0, [r4, 0x1C]
_080D1878:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1880: .4byte 0x04000052
_080D1884: .4byte sub_80D154C
	thumb_func_end sub_80D1504

	thumb_func_start sub_80D154C
sub_80D154C: @ 80D1888
	push {lr}
	adds r3, r0, 0
	ldr r0, _080D18B0
	ldrh r1, [r0, 0xE]
	ldr r0, _080D18B4
	cmp r1, r0
	bne _080D18C0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080D18BC
	ldr r0, _080D18B8
	b _080D18BE
	.align 2, 0
_080D18B0: .4byte gUnknown_03004B00
_080D18B4: .4byte 0x0000ffff
_080D18B8: .4byte sub_80D158C
_080D18BC:
	ldr r0, _080D18C4
_080D18BE:
	str r0, [r3, 0x1C]
_080D18C0:
	pop {r0}
	bx r0
	.align 2, 0
_080D18C4: .4byte move_anim_8072740
	thumb_func_end sub_80D154C

	thumb_func_start sub_80D158C
sub_80D158C: @ 80D18C8
	push {lr}
	ldr r1, _080D18DC
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_080D18DC: .4byte 0x04000050
	thumb_func_end sub_80D158C

	thumb_func_start sub_80D15A4
sub_80D15A4: @ 80D18E0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D1910
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x8]
	ldr r2, _080D1914
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D1918
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1910: .4byte gTasks
_080D1914: .4byte gUnknown_083D79BC
_080D1918: .4byte sub_80D15E0
	thumb_func_end sub_80D15A4

	thumb_func_start sub_80D15E0
sub_80D15E0: @ 80D191C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080D196C
	adds r4, r0, r1
	adds r0, r4, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _080D1966
	ldr r2, _080D1970
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, 0
	bl move_anim_task_del
_080D1966:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D196C: .4byte gTasks
_080D1970: .4byte gSprites
	thumb_func_end sub_80D15E0

	thumb_func_start sub_80D1638
sub_80D1638: @ 80D1974
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D19A8
	adds r4, r1, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r0, 0x3
	strh r0, [r4, 0x20]
	ldr r0, _080D19AC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D19B4
	ldr r0, _080D19B0
	strh r0, [r4, 0x22]
	movs r0, 0x8
	b _080D19BA
	.align 2, 0
_080D19A8: .4byte gTasks
_080D19AC: .4byte gUnknown_0202F7C9
_080D19B0: .4byte 0x0000ffff
_080D19B4:
	movs r0, 0x1
	strh r0, [r4, 0x22]
	ldr r0, _080D19D4
_080D19BA:
	strh r0, [r4, 0x24]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080D19D8
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D19D4: .4byte 0x0000fff8
_080D19D8: .4byte sub_80D16A0
	thumb_func_end sub_80D1638

	thumb_func_start sub_80D16A0
sub_80D16A0: @ 80D19DC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080D1A00
	adds r3, r0, r1
	movs r0, 0x8
	ldrsh r4, [r3, r0]
	cmp r4, 0x1
	beq _080D1A30
	cmp r4, 0x1
	bgt _080D1A04
	cmp r4, 0
	beq _080D1A0E
	b _080D1AF6
	.align 2, 0
_080D1A00: .4byte gTasks
_080D1A04:
	cmp r4, 0x2
	beq _080D1AAC
	cmp r4, 0x3
	beq _080D1AC6
	b _080D1AF6
_080D1A0E:
	ldr r2, _080D1A2C
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x24]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	strh r4, [r3, 0xA]
	strh r4, [r3, 0xC]
	strh r4, [r3, 0xE]
	b _080D1ABE
	.align 2, 0
_080D1A2C: .4byte gSprites
_080D1A30:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D1AF6
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	ands r0, r4
	lsls r0, 16
	cmp r0, 0
	beq _080D1A68
	ldr r2, _080D1A64
	movs r4, 0x26
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	adds r1, 0x6
	b _080D1A7A
	.align 2, 0
_080D1A64: .4byte gSprites
_080D1A68:
	ldr r2, _080D1AA8
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	subs r1, 0x6
_080D1A7A:
	strh r1, [r0, 0x24]
	ldrh r0, [r3, 0xE]
	adds r0, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D1AF6
	ldrh r1, [r3, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D1ABE
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x24]
	subs r0, 0x6
	strh r0, [r1, 0x24]
	b _080D1ABE
	.align 2, 0
_080D1AA8: .4byte gSprites
_080D1AAC:
	ldrh r0, [r3, 0x20]
	subs r0, 0x1
	strh r0, [r3, 0x20]
	lsls r0, 16
	cmp r0, 0
	beq _080D1ABE
	movs r0, 0
	strh r0, [r3, 0x8]
	b _080D1AF6
_080D1ABE:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080D1AF6
_080D1AC6:
	ldr r2, _080D1AFC
	movs r4, 0x26
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x22]
	ldrh r4, [r0, 0x24]
	adds r1, r4
	strh r1, [r0, 0x24]
	movs r0, 0x26
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x24
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D1AF6
	adds r0, r5, 0
	bl move_anim_task_del
_080D1AF6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1AFC: .4byte gSprites
	thumb_func_end sub_80D16A0

	thumb_func_start sub_80D17C4
sub_80D17C4: @ 80D1B00
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D1B3C
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	movs r0, 0x1
	strh r0, [r4, 0x10]
	movs r0, 0xE
	strh r0, [r4, 0x22]
	movs r0, 0x2
	strh r0, [r4, 0x24]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080D1B40
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1B3C: .4byte gTasks
_080D1B40: .4byte sub_80D1808
	thumb_func_end sub_80D17C4

	thumb_func_start sub_80D1808
sub_80D1808: @ 80D1B44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080D1B98
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0
	bne _080D1C0A
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x10
	ldrsh r1, [r4, r3]
	cmp r0, r1
	ble _080D1C0A
	strh r2, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D1BA0
	ldr r3, _080D1B9C
	movs r6, 0x26
	ldrsh r1, [r4, r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	b _080D1BB6
	.align 2, 0
_080D1B98: .4byte gTasks
_080D1B9C: .4byte gSprites
_080D1BA0:
	ldr r3, _080D1BE8
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_080D1BB6:
	strb r1, [r0]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r6, 0x22
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080D1C0A
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	movs r6, 0x24
	ldrsh r1, [r4, r6]
	cmp r0, r1
	bge _080D1BEC
	strh r2, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r2, [r4, 0xE]
	b _080D1C0A
	.align 2, 0
_080D1BE8: .4byte gSprites
_080D1BEC:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
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
	adds r0, r5, 0
	bl move_anim_task_del
_080D1C0A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D1808

	thumb_func_start sub_80D18D4
sub_80D18D4: @ 80D1C10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D1C60
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x8]
	movs r1, 0x4
	strh r1, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	strh r0, [r4, 0x12]
	strh r0, [r4, 0x14]
	strh r0, [r4, 0x16]
	strh r0, [r4, 0x18]
	strh r0, [r4, 0x22]
	ldr r5, _080D1C64
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080D1C68
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1C60: .4byte gTasks
_080D1C64: .4byte gUnknown_0202F7C8
_080D1C68: .4byte sub_80D1930
	thumb_func_end sub_80D18D4

	thumb_func_start sub_80D1930
sub_80D1930: @ 80D1C6C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D1C90
	adds r4, r0, r1
	movs r0, 0x18
	ldrsh r2, [r4, r0]
	cmp r2, 0x1
	beq _080D1CD8
	cmp r2, 0x1
	bgt _080D1C94
	cmp r2, 0
	beq _080D1C9A
	b _080D1CF4
	.align 2, 0
_080D1C90: .4byte gTasks
_080D1C94:
	cmp r2, 0x2
	beq _080D1CF0
	b _080D1CF4
_080D1C9A:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D1CF4
	strh r2, [r4, 0x10]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080D1CF4
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D1CD2
	strh r2, [r4, 0x14]
	movs r0, 0x1
	strh r0, [r4, 0x18]
	b _080D1CF4
_080D1CD2:
	movs r0, 0x2
	strh r0, [r4, 0x18]
	b _080D1CF4
_080D1CD8:
	movs r1, 0
	strh r1, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080D1CF4
	strh r2, [r4, 0x16]
	strh r1, [r4, 0x18]
	b _080D1CF4
_080D1CF0:
	movs r0, 0x1
	strh r0, [r4, 0x12]
_080D1CF4:
	movs r2, 0x8
	ldrsh r5, [r4, r2]
	cmp r5, 0
	beq _080D1D02
	cmp r5, 0x1
	beq _080D1D98
	b _080D1DA6
_080D1D02:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D1DA6
	strh r5, [r4, 0xA]
	ldr r0, _080D1D8C
	movs r3, 0x24
	ldrsh r1, [r4, r3]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D1DA6
	ldr r0, _080D1D90
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	strh r6, [r1, 0x2E]
	movs r0, 0xD
	strh r0, [r1, 0x30]
	ldr r2, _080D1D94
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0x24]
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 1
	adds r2, 0x1
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080D1DA6
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080D1DA6
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D1DA6
	.align 2, 0
_080D1D8C: .4byte gSpriteTemplate_83D79E8
_080D1D90: .4byte gSprites
_080D1D94: .4byte gUnknown_083D7A00
_080D1D98:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D1DA6
	adds r0, r6, 0
	bl move_anim_task_del
_080D1DA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D1930

	thumb_func_start sub_80D1A70
sub_80D1A70: @ 80D1DAC
	push {r4,lr}
	adds r3, r0, 0
	ldr r4, _080D1E14
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	movs r2, 0x1
	ldrb r1, [r0, 0x12]
	ands r1, r2
	lsls r1, 2
	mov r0, r12
	ldrb r2, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D1E0E
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r1, 1
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x8
	adds r1, r0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r3, 0
	bl DestroySprite
_080D1E0E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D1E14: .4byte gTasks
	thumb_func_end sub_80D1A70

	thumb_func_start sub_80D1ADC
sub_80D1ADC: @ 80D1E18
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080D1E70
	bl IndexOfSpritePaletteTag
	mov r1, sp
	strb r0, [r1]
	movs r5, 0x1
	ldr r0, _080D1E74
	adds r4, r0, 0
_080D1E30:
	subs r0, r4, r5
	lsls r0, 16
	lsrs r0, 16
	bl AllocSpritePalette
	mov r2, sp
	adds r1, r2, r5
	strb r0, [r1]
	adds r5, 0x1
	cmp r5, 0x4
	ble _080D1E30
	ldr r4, _080D1E78
	bl sub_8076BE0
	lsls r0, 24
	ldr r1, _080D1E7C
	cmp r0, 0
	beq _080D1E58
	ldr r0, _080D1E80
	adds r1, r0
_080D1E58:
	adds r0, r4, 0
	bl sub_800D238
	movs r5, 0
_080D1E60:
	lsls r4, r5, 5
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D1E88
	ldr r0, _080D1E84
	b _080D1E8A
	.align 2, 0
_080D1E70: .4byte 0x000027de
_080D1E74: .4byte 0x00002710
_080D1E78: .4byte gBattleAnimSpritePalette_206
_080D1E7C: .4byte 0x02018000
_080D1E80: .4byte 0xffffc800
_080D1E84: .4byte 0x02014800
_080D1E88:
	ldr r0, _080D1EB8
_080D1E8A:
	adds r2, r4, r0
	mov r1, sp
	adds r0, r1, r5
	ldrb r1, [r0]
	lsls r1, 20
	movs r0, 0x80
	lsls r0, 17
	adds r1, r0
	lsrs r1, 16
	adds r0, r2, 0
	movs r2, 0x20
	bl LoadPalette
	adds r5, 0x1
	cmp r5, 0x4
	ble _080D1E60
	adds r0, r6, 0
	bl move_anim_task_del
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1EB8: .4byte 0x02018000
	thumb_func_end sub_80D1ADC

	thumb_func_start sub_80D1B80
sub_80D1B80: @ 80D1EBC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _080D1EE0
	movs r4, 0x4
_080D1EC6:
	ldrh r0, [r5]
	bl FreeSpritePaletteByTag
	adds r5, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D1EC6
	adds r0, r6, 0
	bl move_anim_task_del
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1EE0: .4byte gUnknown_083D7A5C
	thumb_func_end sub_80D1B80

	thumb_func_start sub_80D1BA8
sub_80D1BA8: @ 80D1EE4
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsls r2, 24
	lsrs r3, r2, 24
	movs r0, 0x1
	ands r3, r0
	negs r0, r3
	orrs r0, r3
	asrs r0, 31
	movs r3, 0x20
	ands r0, r3
	ldrh r4, [r5, 0x4]
	lsls r3, r4, 22
	lsrs r3, 22
	lsrs r1, 22
	adds r0, r1
	adds r3, r0
	ldr r1, _080D1F38
	adds r0, r1, 0
	ands r3, r0
	ldr r0, _080D1F3C
	ands r0, r4
	orrs r0, r3
	strh r0, [r5, 0x4]
	ldr r0, _080D1F40
	lsrs r2, 25
	lsls r2, 1
	adds r2, r0
	ldrh r0, [r2]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	ldrb r2, [r5, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D1F38: .4byte 0x000003ff
_080D1F3C: .4byte 0xfffffc00
_080D1F40: .4byte gUnknown_083D7A5C
	thumb_func_end sub_80D1BA8

	thumb_func_start sub_80D1C08
sub_80D1C08: @ 80D1F44
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0
	bl sub_80787B0
	ldr r6, _080D1FAC
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D1F64
	ldr r1, _080D1FB0
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080D1F64:
	ldr r4, _080D1FB0
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldr r0, _080D1FB4
	str r0, [r5, 0x1C]
	ldr r1, _080D1FB8
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldrb r1, [r4, 0xA]
	ldrb r2, [r4, 0xC]
	adds r0, r5, 0
	bl sub_80D1BA8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D1FAC: .4byte gUnknown_0202F7C8
_080D1FB0: .4byte gUnknown_03004B00
_080D1FB4: .4byte sub_8078B34
_080D1FB8: .4byte move_anim_8072740
	thumb_func_end sub_80D1C08

	thumb_func_start sub_80D1C80
sub_80D1C80: @ 80D1FBC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D1FD6
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
_080D1FD6:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x32]
	lsls r0, r2, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x7
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	subs r2, 0x80
	strh r2, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x3C
	bne _080D2006
	adds r0, r4, 0
	bl move_anim_8072740
_080D2006:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D1C80

	thumb_func_start sub_80D1CD0
sub_80D1CD0: @ 80D200C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	movs r2, 0xF0
	cmp r0, 0
	beq _080D2020
	movs r2, 0x98
_080D2020:
	movs r3, 0
	ldr r0, _080D2068
	strh r2, [r0]
	ldr r0, _080D206C
	movs r1, 0xA0
	strh r1, [r0]
	ldr r0, _080D2070
	strh r2, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r1, _080D2074
	ldr r5, _080D2078
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	adds r5, 0x20
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xC8
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	ldr r1, _080D207C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	strh r3, [r0, 0x8]
	strh r2, [r0, 0xA]
	ldr r1, _080D2080
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2068: .4byte gUnknown_030042C4
_080D206C: .4byte gUnknown_03004240
_080D2070: .4byte 0x04000040
_080D2074: .4byte 0x04000048
_080D2078: .4byte 0x00003f1f
_080D207C: .4byte gTasks
_080D2080: .4byte sub_80D1D48
	thumb_func_end sub_80D1CD0

	thumb_func_start sub_80D1D48
sub_80D1D48: @ 80D2084
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D20B8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x8]
	adds r4, r0, 0
	adds r4, 0xD
	strh r4, [r3, 0x8]
	ldrh r0, [r3, 0xA]
	adds r2, r0, 0
	subs r2, 0xD
	strh r2, [r3, 0xA]
	lsls r1, r4, 16
	lsls r0, r2, 16
	cmp r1, r0
	blt _080D20C4
	ldr r0, _080D20BC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D20C0
	str r0, [r3]
	b _080D20CC
	.align 2, 0
_080D20B8: .4byte gTasks
_080D20BC: .4byte gUnknown_030042C4
_080D20C0: .4byte sub_80D1D9C
_080D20C4:
	ldr r1, _080D20D4
	lsls r0, r4, 8
	orrs r2, r0
	strh r2, [r1]
_080D20CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D20D4: .4byte gUnknown_030042C4
	thumb_func_end sub_80D1D48

	thumb_func_start sub_80D1D9C
sub_80D1D9C: @ 80D20D8
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	ldr r5, _080D2128
	lsls r0, r2, 2
	adds r0, r2
	lsls r3, r0, 3
	adds r1, r3, r5
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r1, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080D2134
	movs r0, 0x88
	strh r0, [r1, 0x1E]
	adds r0, r5, r3
	adds r0, 0x1E
	ldr r1, _080D212C
	movs r2, 0x2
	bl RequestSpriteCopy
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	ldr r2, _080D2130
	movs r1, 0x10
	bl BlendPalettes
	b _080D215A
	.align 2, 0
_080D2128: .4byte gTasks
_080D212C: .4byte 0x04000050
_080D2130: .4byte 0x00007fff
_080D2134:
	cmp r0, 0x4
	ble _080D215A
	ldr r0, _080D2164
	strh r4, [r0]
	ldr r0, _080D2168
	strh r4, [r0]
	ldr r0, _080D216C
	ldr r3, _080D2170
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	adds r0, r2, 0
	bl move_anim_task_del
_080D215A:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2164: .4byte gUnknown_030042C4
_080D2168: .4byte gUnknown_03004240
_080D216C: .4byte 0x04000048
_080D2170: .4byte 0x00003f3f
	thumb_func_end sub_80D1D9C

	thumb_func_start sub_80D1E38
sub_80D1E38: @ 80D2174
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080D21C4
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D21D0
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080D21C8
	adds r0, r5, 0
	bl sub_80798F4
	ldr r1, _080D21CC
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x24]
	b _080D21F8
	.align 2, 0
_080D21C4: .4byte gTasks
_080D21C8: .4byte gUnknown_083D7A98
_080D21CC: .4byte gSprites
_080D21D0:
	ldr r1, _080D2200
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r5, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080D21F8
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
_080D21F8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D2200: .4byte gSprites
	thumb_func_end sub_80D1E38

	thumb_func_start sub_80D1EC8
sub_80D1EC8: @ 80D2204
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080D2254
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D2260
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080D2258
	adds r0, r5, 0
	bl sub_80798F4
	ldr r1, _080D225C
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	movs r1, 0x4
	strh r1, [r0, 0x24]
	b _080D2288
	.align 2, 0
_080D2254: .4byte gTasks
_080D2258: .4byte gUnknown_083D7A98
_080D225C: .4byte gSprites
_080D2260:
	ldr r1, _080D2290
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r5, 0
	bl sub_807992C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080D2288
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r6, 0
	bl move_anim_task_del
_080D2288:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D2290: .4byte gSprites
	thumb_func_end sub_80D1EC8

	thumb_func_start sub_80D1F58
sub_80D1F58: @ 80D2294
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	movs r0, 0x5F
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080D22D8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D22DC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D22D8: .4byte gUnknown_0202F7C9
_080D22DC: .4byte sub_80D1FA4
	thumb_func_end sub_80D1F58

	thumb_func_start sub_80D1FA4
sub_80D1FA4: @ 80D22E0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D230A
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xE
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080D2310
_080D230A:
	adds r0, r4, 0
	bl move_anim_8072740
_080D2310:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D1FA4

	thumb_func_start sub_80D1FDC
sub_80D1FDC: @ 80D2318
	push {r4,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D233C
	ldr r1, _080D2338
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	adds r0, r2, 0x1
	strh r0, [r4, 0x2E]
	b _080D2398
	.align 2, 0
_080D2338: .4byte gUnknown_03004B00
_080D233C:
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	cmp r0, 0x64
	ble _080D238A
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D238A:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _080D2398
	adds r0, r4, 0
	bl move_anim_8072740
_080D2398:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D1FDC

	thumb_func_start sub_80D2064
sub_80D2064: @ 80D23A0
	push {lr}
	ldr r2, _080D23C4
	ldrh r1, [r2]
	strh r1, [r0, 0x20]
	movs r1, 0xA0
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x2E]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x30]
	ldr r1, _080D23C8
	str r1, [r0, 0x1C]
	ldr r1, _080D23CC
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080D23C4: .4byte gUnknown_03004B00
_080D23C8: .4byte sub_80782D8
_080D23CC: .4byte sub_80D2094
	thumb_func_end sub_80D2064

	thumb_func_start sub_80D2094
sub_80D2094: @ 80D23D0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	lsls r0, 16
	lsrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	lsls r0, 16
	asrs r5, r0, 16
	cmp r5, 0x48
	bgt _080D2436
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	cmp r5, 0x40
	bgt _080D2436
	adds r0, r4, 0
	bl move_anim_8072740
_080D2436:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2094

	thumb_func_start sub_80D2100
sub_80D2100: @ 80D243C
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D24F8
	ldr r2, _080D24FC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080D2500
	ldrb r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D2480
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080D2480:
	ldr r0, _080D2504
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D2508
	strh r1, [r0]
	ldr r0, _080D250C
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _080D2510
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080D2514
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080D2518
	bl LZDecompressVram
	ldr r0, _080D251C
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080D2520
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D24E0
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080D24E0:
	ldr r0, _080D2524
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080D2528
	str r0, [r1]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D24F8: .4byte 0x04000050
_080D24FC: .4byte 0x00003f42
_080D2500: .4byte 0x0400000a
_080D2504: .4byte gUnknown_030042C0
_080D2508: .4byte gUnknown_030041B4
_080D250C: .4byte 0x04000014
_080D2510: .4byte 0x040000d4
_080D2514: .4byte 0x85000400
_080D2518: .4byte gAttractTilemap
_080D251C: .4byte gAttractGfx
_080D2520: .4byte gAttractPal
_080D2524: .4byte gTasks
_080D2528: .4byte sub_80D21F0
	thumb_func_end sub_80D2100

	thumb_func_start sub_80D21F0
sub_80D21F0: @ 80D252C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D255C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080D2552
	b _080D26C8
_080D2552:
	lsls r0, 2
	ldr r1, _080D2560
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D255C: .4byte gTasks
_080D2560: .4byte _080D2564
	.align 2, 0
_080D2564:
	.4byte _080D2578
	.4byte _080D25C0
	.4byte _080D25E2
	.4byte _080D2624
	.4byte _080D26A8
_080D2578:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080D2592
	b _080D26C8
_080D2592:
	strh r4, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	adds r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080D25BC
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0x10
	beq _080D25B0
	b _080D26C8
_080D25B0:
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r4, [r3, 0x1E]
	b _080D26C8
	.align 2, 0
_080D25BC: .4byte 0x04000052
_080D25C0:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8D
	bne _080D26C8
	movs r0, 0x10
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080D26C8
_080D25E2:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080D26C8
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	subs r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080D2620
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r1, [r3, r2]
	cmp r1, 0
	bne _080D26C8
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r1, [r3, 0x1E]
	b _080D26C8
	.align 2, 0
_080D2620: .4byte 0x04000052
_080D2624:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	lsls r0, r5, 2
	mov r10, r0
	add r6, sp, 0xC
	movs r7, 0
	ldr r1, _080D26D8
	movs r4, 0x80
	lsls r4, 5
	mov r8, r6
	ldr r0, _080D26DC
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D264A:
	str r7, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D264A
	str r7, [sp, 0xC]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D26D8
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D26E0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D2698
	ldr r2, _080D26E4
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D2698:
	ldr r0, _080D26E8
	mov r2, r10
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
_080D26A8:
	ldr r0, _080D26EC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080D26E4
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl move_anim_task_del
_080D26C8:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D26D8: .4byte 0x040000d4
_080D26DC: .4byte 0x85000400
_080D26E0: .4byte 0x85000200
_080D26E4: .4byte 0x0400000a
_080D26E8: .4byte gTasks
_080D26EC: .4byte 0x04000050
	thumb_func_end sub_80D21F0

	thumb_func_start sub_80D23B4
sub_80D23B4: @ 80D26F0
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D2774
	ldr r2, _080D2778
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080D277C
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D273A
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080D273A:
	ldr r0, _080D2780
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D2784
	strh r1, [r0]
	ldr r0, _080D2788
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r1, _080D278C
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080D2790
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D2798
	ldr r0, _080D2794
	b _080D27AA
	.align 2, 0
_080D2774: .4byte 0x04000050
_080D2778: .4byte 0x00003f42
_080D277C: .4byte 0x0400000a
_080D2780: .4byte gUnknown_030042C0
_080D2784: .4byte gUnknown_030041B4
_080D2788: .4byte 0x04000014
_080D278C: .4byte 0x040000d4
_080D2790: .4byte 0x85000400
_080D2794: .4byte gBattleAnimBackgroundTilemap_ScaryFaceContest
_080D2798:
	ldr r0, _080D27B4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D27BC
	ldr r0, _080D27B8
_080D27AA:
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	b _080D27C4
	.align 2, 0
_080D27B4: .4byte gUnknown_0202F7C9
_080D27B8: .4byte gBattleAnimBackgroundTilemap_ScaryFacePlayer
_080D27BC:
	ldr r0, _080D2808
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
_080D27C4:
	ldr r0, _080D280C
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080D2810
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D27F2
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080D27F2:
	ldr r0, _080D2814
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080D2818
	str r0, [r1]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2808: .4byte gBattleAnimBackgroundTilemap_ScaryFaceOpponent
_080D280C: .4byte gBattleAnimBackgroundImage_ScaryFace
_080D2810: .4byte gBattleAnimBackgroundPalette_ScaryFace
_080D2814: .4byte gTasks
_080D2818: .4byte sub_80D24E0
	thumb_func_end sub_80D23B4

	thumb_func_start sub_80D24E0
sub_80D24E0: @ 80D281C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D284C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0x20
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080D2842
	b _080D29B8
_080D2842:
	lsls r0, 2
	ldr r1, _080D2850
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D284C: .4byte gTasks
_080D2850: .4byte _080D2854
	.align 2, 0
_080D2854:
	.4byte _080D2868
	.4byte _080D28B0
	.4byte _080D28D2
	.4byte _080D2914
	.4byte _080D2998
_080D2868:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	beq _080D2882
	b _080D29B8
_080D2882:
	strh r4, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	adds r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080D28AC
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0xE
	beq _080D28A0
	b _080D29B8
_080D28A0:
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r4, [r3, 0x1E]
	b _080D29B8
	.align 2, 0
_080D28AC: .4byte 0x04000052
_080D28B0:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080D29B8
	movs r0, 0xE
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080D29B8
_080D28D2:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080D29B8
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	subs r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080D2910
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r1, [r3, r2]
	cmp r1, 0
	bne _080D29B8
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r1, [r3, 0x1E]
	b _080D29B8
	.align 2, 0
_080D2910: .4byte 0x04000052
_080D2914:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	lsls r0, r5, 2
	mov r10, r0
	add r6, sp, 0xC
	movs r7, 0
	ldr r1, _080D29C8
	movs r4, 0x80
	lsls r4, 5
	mov r8, r6
	ldr r0, _080D29CC
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D293A:
	str r7, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D293A
	str r7, [sp, 0xC]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D29C8
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D29D0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D2988
	ldr r2, _080D29D4
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D2988:
	ldr r0, _080D29D8
	mov r2, r10
	adds r1, r2, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
_080D2998:
	ldr r0, _080D29DC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080D29D4
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, 0
	bl move_anim_task_del
_080D29B8:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D29C8: .4byte 0x040000d4
_080D29CC: .4byte 0x85000400
_080D29D0: .4byte 0x85000200
_080D29D4: .4byte 0x0400000a
_080D29D8: .4byte gTasks
_080D29DC: .4byte 0x04000050
	thumb_func_end sub_80D24E0

	thumb_func_start sub_80D26A4
sub_80D26A4: @ 80D29E0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D2A34
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080D2A38
	ldrh r0, [r1]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	ldrb r0, [r5]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x3C]
	ldr r1, _080D2A3C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2A34: .4byte gUnknown_0202F7C8
_080D2A38: .4byte gUnknown_03004B00
_080D2A3C: .4byte sub_80D2704
	thumb_func_end sub_80D26A4

	thumb_func_start sub_80D2704
sub_80D2704: @ 80D2A40
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080D2A56
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	b _080D2A5A
_080D2A56:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
_080D2A5A:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	ldrh r1, [r4, 0x34]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r3, 0x38
	ldrsh r2, [r4, r3]
	cmp r2, 0
	beq _080D2ACC
	cmp r2, 0x1
	bne _080D2AFC
	ldr r1, _080D2AC4
	adds r0, r1, 0
	ldrh r2, [r4, 0x32]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldr r3, _080D2AC8
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080D2AFC
	movs r0, 0x2
	strh r0, [r4, 0x38]
	b _080D2B0C
	.align 2, 0
_080D2AC4: .4byte 0xfffffc00
_080D2AC8: .4byte 0xffffff00
_080D2ACC:
	movs r3, 0x80
	lsls r3, 3
	adds r0, r3, 0
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	movs r3, 0x80
	lsls r3, 1
	adds r0, r3, 0
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080D2AFC
	strh r2, [r4, 0x36]
	movs r0, 0x1
	strh r0, [r4, 0x38]
_080D2AFC:
	ldr r0, _080D2B14
	ldrh r1, [r0, 0xE]
	ldr r0, _080D2B18
	cmp r1, r0
	bne _080D2B0C
	adds r0, r4, 0
	bl move_anim_8072740
_080D2B0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2B14: .4byte gUnknown_03004B00
_080D2B18: .4byte 0x0000ffff
	thumb_func_end sub_80D2704

	thumb_func_start sub_80D27E0
sub_80D27E0: @ 80D2B1C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D2B64
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _080D2B68
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	strh r0, [r5, 0x2E]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x7
	bl Cos
	strh r0, [r5, 0x30]
	ldr r0, _080D2B6C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2B64: .4byte gUnknown_0202F7C8
_080D2B68: .4byte gUnknown_03004B00
_080D2B6C: .4byte sub_80D2834
	thumb_func_end sub_80D27E0

	thumb_func_start sub_80D2834
sub_80D2834: @ 80D2B70
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r3, 0x24
	ldrsh r1, [r2, r3]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080D2BAE
	movs r0, 0x22
	ldrsh r1, [r2, r0]
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080D2BAE
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D2BB4
_080D2BAE:
	adds r0, r2, 0
	bl move_anim_8072740
_080D2BB4:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2834

	thumb_func_start sub_80D287C
sub_80D287C: @ 80D2BB8
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x30]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r1, r0, 0x1
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _080D2BE4
	adds r0, r2, 0
	bl move_anim_8072740
_080D2BE4:
	pop {r0}
	bx r0
	thumb_func_end sub_80D287C

	thumb_func_start sub_80D28AC
sub_80D28AC: @ 80D2BE8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D2C34
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _080D2C38
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	strh r0, [r5, 0x2E]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x7
	bl Cos
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x32]
	ldr r0, _080D2C3C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2C34: .4byte gUnknown_0202F7C8
_080D2C38: .4byte gUnknown_03004B00
_080D2C3C: .4byte sub_80D287C
	thumb_func_end sub_80D28AC

	thumb_func_start sub_80D2904
sub_80D2904: @ 80D2C40
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D2C56
	adds r0, r2, 0
	bl move_anim_8072740
_080D2C56:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2904

	thumb_func_start sub_80D2920
sub_80D2920: @ 80D2C5C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D2C70
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D2C70: .4byte sub_80D2904
	thumb_func_end sub_80D2920

	thumb_func_start sub_80D2938
sub_80D2938: @ 80D2C74
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2C92
	ldr r0, _080D2D04
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080D2C92:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r5, r0, 1
	movs r0, 0xFF
	ands r5, r0
	adds r0, r5, 0
	movs r1, 0x50
	bl Sin
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x4F
	bgt _080D2CD6
	adds r0, r5, 0
	movs r1, 0x50
	bl Cos
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	lsls r0, 16
	asrs r0, 24
	adds r1, r0
	strh r1, [r4, 0x26]
_080D2CD6:
	movs r0, 0x2E
	ldrsh r2, [r4, r0]
	cmp r2, 0x5A
	ble _080D2CF4
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r0, [r4, 0x24]
	subs r0, r1
	strh r0, [r4, 0x24]
_080D2CF4:
	cmp r2, 0x64
	ble _080D2CFE
	adds r0, r4, 0
	bl move_anim_8072740
_080D2CFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2D04: .4byte gUnknown_03004B00
	thumb_func_end sub_80D2938

	thumb_func_start sub_80D29CC
sub_80D29CC: @ 80D2D08
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x5
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x14
	ble _080D2D5E
	adds r1, r0, 0
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D2D5E:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x1E
	ble _080D2D6C
	adds r0, r4, 0
	bl move_anim_8072740
_080D2D6C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D29CC

	thumb_func_start sub_80D2A38
sub_80D2A38: @ 80D2D74
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2D98
	ldr r1, _080D2D94
	ldrh r0, [r1]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x32]
	adds r0, r2, 0x1
	strh r0, [r4, 0x2E]
	b _080D2DEC
	.align 2, 0
_080D2D94: .4byte gUnknown_03004B00
_080D2D98:
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	movs r5, 0
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	adds r2, r0, 0
	strh r2, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	cmp r0, 0x46
	ble _080D2DEC
	ldr r0, _080D2DF4
	str r0, [r4, 0x1C]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r0, r2, r1
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x24]
	strh r5, [r4, 0x26]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB4
	bl __umodsi3
	strh r0, [r4, 0x34]
_080D2DEC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2DF4: .4byte sub_80D29CC
	thumb_func_end sub_80D2A38

	thumb_func_start sub_80D2ABC
sub_80D2ABC: @ 80D2DF8
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2E32
	ldr r1, _080D2EF4
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
	ldr r0, _080D2EF8
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080D2E32:
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r0, r2
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r1, r0, 2
	adds r0, r1, 0
	cmp r1, 0
	bge _080D2E48
	adds r0, 0xFF
_080D2E48:
	asrs r0, 8
	lsls r0, 8
	subs r0, r1, r0
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _080D2E5A
	movs r0, 0
	strh r0, [r4, 0x30]
_080D2E5A:
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080D2E68
	adds r0, 0x3
_080D2E68:
	asrs r0, 2
	movs r1, 0x1E
	subs r1, r0
	adds r0, r2, 0
	bl Cos
	strh r0, [r4, 0x24]
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080D2E84
	adds r0, 0x7
_080D2E84:
	asrs r0, 3
	movs r1, 0xA
	subs r1, r0
	adds r0, r2, 0
	bl Sin
	strh r0, [r4, 0x26]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	ble _080D2EA8
	ldrh r1, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080D2EA8
	ldr r0, _080D2EFC
	strh r0, [r4, 0x32]
_080D2EA8:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2EBC
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080D2EBC
	movs r0, 0x1
	strh r0, [r4, 0x32]
_080D2EBC:
	ldrh r0, [r4, 0x34]
	adds r1, r0, 0x1
	strh r1, [r4, 0x34]
	subs r0, 0x9
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x46
	bls _080D2F00
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _080D2F0E
	.align 2, 0
_080D2EF4: .4byte gUnknown_03004B00
_080D2EF8: .4byte gUnknown_0202F7C9
_080D2EFC: .4byte 0x0000ffff
_080D2F00:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D2F0E:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x5A
	ble _080D2F1C
	adds r0, r4, 0
	bl move_anim_8072740
_080D2F1C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2ABC

	thumb_func_start sub_80D2BE8
sub_80D2BE8: @ 80D2F24
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D2F58
	ldr r1, _080D2F54
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrb r1, [r1, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D2F6C
	.align 2, 0
_080D2F54: .4byte gUnknown_03004B00
_080D2F58:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D2F6C
	adds r0, r4, 0
	bl move_anim_8072740
_080D2F6C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2BE8

	thumb_func_start sub_80D2C38
sub_80D2C38: @ 80D2F74
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r1, _080D2F8C
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D2F90
	adds r0, r5, 0
	bl move_anim_8072740
	b _080D2FF4
	.align 2, 0
_080D2F8C: .4byte gUnknown_03004B00
_080D2F90:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D2FA0
	ldr r4, _080D2F9C
	b _080D2FA2
	.align 2, 0
_080D2F9C: .4byte gUnknown_0202F7C8
_080D2FA0:
	ldr r4, _080D2FD0
_080D2FA2:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D2FD4
	movs r2, 0x2
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0
	bne _080D2FD8
	ldrh r0, [r5, 0x20]
	adds r0, 0x20
	b _080D2FDC
	.align 2, 0
_080D2FD0: .4byte gUnknown_0202F7C9
_080D2FD4: .4byte gUnknown_03004B00
_080D2FD8:
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
_080D2FDC:
	strh r0, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r1, [r2, 0x2]
	strh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	ldr r0, _080D2FFC
	str r0, [r5, 0x1C]
_080D2FF4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D2FFC: .4byte sub_80D2CC4
	thumb_func_end sub_80D2C38

	thumb_func_start sub_80D2CC4
sub_80D2CC4: @ 80D3000
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D3030
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	cmp r0, 0
	beq _080D302A
	ldrh r1, [r2, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r2, 0
	bl StartSpriteAnim
	b _080D3030
_080D302A:
	adds r0, r2, 0
	bl move_anim_8072740
_080D3030:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2CC4

	thumb_func_start sub_80D2CF8
sub_80D2CF8: @ 80D3034
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080D3068
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080D306C
	adds r4, r0
	ldr r2, _080D3070
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080D3074
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3068: .4byte gUnknown_03004B00
_080D306C: .4byte gTasks
_080D3070: .4byte gUnknown_083D7CA8
_080D3074: .4byte sub_80D2D3C
	thumb_func_end sub_80D2CF8

	thumb_func_start sub_80D2D3C
sub_80D2D3C: @ 80D3078
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D30A0
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080D3098
	adds r0, r4, 0
	bl move_anim_task_del
_080D3098:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D30A0: .4byte gTasks
	thumb_func_end sub_80D2D3C

	thumb_func_start sub_80D2D68
sub_80D2D68: @ 80D30A4
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080D30B8
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D30C0
	ldr r0, _080D30BC
	b _080D30C2
	.align 2, 0
_080D30B8: .4byte gUnknown_03004B00
_080D30BC: .4byte gUnknown_0202F7C8
_080D30C0:
	ldr r0, _080D3158
_080D30C2:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D30DC
	ldr r1, _080D315C
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080D30DC:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r7, _080D315C
	lsrs r0, 24
	ldrh r3, [r7, 0x2]
	adds r0, r3
	movs r4, 0
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r7, 0x4]
	adds r0, r1
	strh r0, [r5, 0x22]
	strh r4, [r5, 0x2E]
	ldrh r1, [r5, 0x20]
	lsls r1, 3
	strh r1, [r5, 0x30]
	lsls r0, 3
	strh r0, [r5, 0x32]
	movs r2, 0x2
	ldrsh r0, [r7, r2]
	lsls r0, 3
	cmp r0, 0
	bge _080D311C
	adds r0, 0x7
_080D311C:
	asrs r0, 3
	strh r0, [r5, 0x34]
	movs r3, 0x4
	ldrsh r0, [r7, r3]
	lsls r0, 3
	cmp r0, 0
	bge _080D312C
	adds r0, 0x7
_080D312C:
	asrs r0, 3
	strh r0, [r5, 0x36]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	lsls r0, 4
	adds r1, r0
	ldr r3, _080D3160
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D3164
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r0, _080D3168
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3158: .4byte gUnknown_0202F7C9
_080D315C: .4byte gUnknown_03004B00
_080D3160: .4byte 0x000003ff
_080D3164: .4byte 0xfffffc00
_080D3168: .4byte sub_80D2E30
	thumb_func_end sub_80D2D68

	thumb_func_start sub_80D2E30
sub_80D2E30: @ 80D316C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x34]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x36]
	ldrh r3, [r2, 0x32]
	adds r1, r3
	strh r1, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 19
	strh r1, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D31A0
	adds r0, r2, 0
	bl move_anim_8072740
_080D31A0:
	pop {r0}
	bx r0
	thumb_func_end sub_80D2E30

	thumb_func_start sub_80D2E68
sub_80D2E68: @ 80D31A4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D31C6
	ldr r0, _080D3200
	ldrh r1, [r0]
	movs r0, 0x78
	subs r0, r1
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080D31C6:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080D31E4
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	movs r1, 0
	bl sub_8079108
_080D31E4:
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	adds r0, 0x50
	cmp r1, r0
	bne _080D31F8
	adds r0, r4, 0
	bl move_anim_8072740
_080D31F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3200: .4byte gUnknown_03004B00
	thumb_func_end sub_80D2E68

	thumb_func_start sub_80D2EC8
sub_80D2EC8: @ 80D3204
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D3232
	movs r5, 0x78
	strh r5, [r6, 0x20]
	ldr r4, _080D32B4
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	subs r0, 0xF
	strh r0, [r6, 0x22]
	ldrb r1, [r4, 0x2]
	adds r0, r6, 0
	bl StartSpriteAnim
	strh r5, [r6, 0x38]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x34]
_080D3232:
	ldrh r0, [r6, 0x2E]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r6, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r6, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r6, 0x30]
	movs r2, 0x2E
	ldrsh r0, [r6, r2]
	lsls r4, r0, 1
	adds r4, r0
	ldrh r0, [r6, 0x34]
	adds r4, r0
	movs r2, 0xFF
	ldrh r0, [r6, 0x3A]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0x3A]
	ands r4, r2
	adds r0, r4, 0
	movs r1, 0x64
	bl Cos
	strh r0, [r6, 0x24]
	adds r0, r4, 0
	movs r1, 0xA
	bl Sin
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r1, 0x4
	bl Cos
	ldrh r2, [r6, 0x30]
	adds r4, r2
	adds r0, r4
	strh r0, [r6, 0x26]
	movs r0, 0x2E
	ldrsh r1, [r6, r0]
	movs r2, 0x38
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080D32AE
	ldr r0, _080D32B8
	str r0, [r6, 0x1C]
	strh r5, [r6, 0x2E]
	adds r0, r6, 0
	bl oamt_add_pos2_onto_pos1
	movs r0, 0x5
	strh r0, [r6, 0x32]
	strh r5, [r6, 0x36]
	strh r5, [r6, 0x34]
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080D32AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D32B4: .4byte gUnknown_03004B00
_080D32B8: .4byte sub_80D2F80
	thumb_func_end sub_80D2EC8

	thumb_func_start sub_80D2F80
sub_80D2F80: @ 80D32BC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	ble _080D32D6
	movs r0, 0
	strh r0, [r1, 0x2E]
	ldr r0, _080D32DC
	str r0, [r1, 0x1C]
_080D32D6:
	pop {r0}
	bx r0
	.align 2, 0
_080D32DC: .4byte sub_80D2FA4
	thumb_func_end sub_80D2F80

	thumb_func_start sub_80D2FA4
sub_80D2FA4: @ 80D32E0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x34]
	adds r0, r1, r2
	strh r0, [r4, 0x34]
	strh r0, [r4, 0x26]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x30
	ble _080D330A
	lsls r0, r1, 16
	cmp r0, 0
	ble _080D330A
	ldrh r0, [r4, 0x36]
	subs r1, r0, 0x5
	strh r1, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x36]
_080D330A:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _080D333C
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0
	bl move_anim_8072740
_080D333C:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bne _080D334A
	adds r0, r4, 0
	bl move_anim_8072740
_080D334A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D2FA4

	thumb_func_start sub_80D3014
sub_80D3014: @ 80D3350
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D3394
	ldrh r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D339C
	ldr r4, _080D3398
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080D339C
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldrh r0, [r5, 0x22]
	adds r0, 0x28
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080D33BC
	.align 2, 0
_080D3394: .4byte gUnknown_020239F8
_080D3398: .4byte gUnknown_0202F7C8
_080D339C:
	ldr r4, _080D33DC
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
	strh r0, [r5, 0x22]
_080D33BC:
	movs r0, 0xD
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	subs r0, 0x48
	strh r0, [r5, 0x36]
	ldr r0, _080D33E0
	str r0, [r5, 0x1C]
	ldr r1, _080D33E4
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D33DC: .4byte gUnknown_0202F7C8
_080D33E0: .4byte sub_8078B34
_080D33E4: .4byte move_anim_8072740
	thumb_func_end sub_80D3014

	thumb_func_start sub_80D30AC
sub_80D30AC: @ 80D33E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080D3404
	ldr r1, _080D3408
	ldr r1, [r1]
	ldrb r2, [r1, 0x10]
	movs r1, 0x1
	ands r1, r2
	strh r1, [r3, 0xE]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080D3404: .4byte gUnknown_03004B00
_080D3408: .4byte gUnknown_0202F7B4
	thumb_func_end sub_80D30AC

	thumb_func_start update_fury_cutter_counter_copy
update_fury_cutter_counter_copy: @ 80D340C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D3424
	ldr r1, _080D3428
	ldr r1, [r1]
	ldrb r1, [r1, 0x10]
	strh r1, [r2, 0xE]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080D3424: .4byte gUnknown_03004B00
_080D3428: .4byte gUnknown_0202F7B4
	thumb_func_end update_fury_cutter_counter_copy

	thumb_func_start sub_80D30F0
sub_80D30F0: @ 80D342C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080D34B4
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D3454
	ldr r1, _080D34B8
	ldrh r0, [r1]
	strh r0, [r5, 0xA]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0xC]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0xE]
_080D3454:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r2, 0x8
	ldrsh r0, [r5, r2]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl __modsi3
	cmp r0, 0x1
	bne _080D349C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xF0
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x50
	bl __umodsi3
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _080D34BC
	adds r1, r4, 0
	movs r3, 0x4
	bl CreateSprite
_080D349C:
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _080D34AE
	adds r0, r6, 0
	bl move_anim_task_del
_080D34AE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D34B4: .4byte gTasks
_080D34B8: .4byte gUnknown_03004B00
_080D34BC: .4byte gSpriteTemplate_83D9130
	thumb_func_end sub_80D30F0

	thumb_func_start sub_80D3184
sub_80D3184: @ 80D34C0
	ldr r1, _080D34C8
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D34C8: .4byte sub_80D3190
	thumb_func_end sub_80D3184

	thumb_func_start sub_80D3190
sub_80D3190: @ 80D34CC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080D34EA
	ldrh r0, [r2, 0x24]
	adds r0, 0x1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x26]
	adds r0, 0x4
	strh r0, [r2, 0x26]
_080D34EA:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D34FE
	adds r0, r2, 0
	bl DestroySprite
_080D34FE:
	pop {r0}
	bx r0
	thumb_func_end sub_80D3190

	thumb_func_start sub_80D31C8
sub_80D31C8: @ 80D3504
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080D352C
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D3534
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080D3530
	ldrh r1, [r4]
	subs r0, r1
	b _080D3546
	.align 2, 0
_080D352C: .4byte gUnknown_0202F7C8
_080D3530: .4byte gUnknown_03004B00
_080D3534:
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D360C
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
_080D3546:
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
	strh r0, [r6, 0x22]
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D3610
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D357C
	ldr r1, _080D360C
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080D357C:
	ldr r5, _080D360C
	ldrh r0, [r5, 0xC]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r4, _080D3614
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D3618
	bl object_new_hidden_with_callback
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	strh r4, [r6, 0x38]
	ldrb r0, [r5, 0x8]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Sin
	ldrh r1, [r6, 0x20]
	subs r1, r0
	strh r1, [r6, 0x20]
	ldrb r0, [r5, 0x8]
	movs r2, 0x6
	ldrsh r1, [r5, r2]
	bl Cos
	ldrh r1, [r6, 0x22]
	subs r1, r0
	strh r1, [r6, 0x22]
	ldr r0, _080D361C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r5, 0x4]
	strh r0, [r1, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r1, 0x30]
	ldrh r0, [r5, 0xA]
	strh r0, [r1, 0x32]
	ldrb r0, [r5, 0x8]
	lsls r0, 8
	strh r0, [r1, 0x34]
	ldrh r0, [r5, 0xC]
	strh r0, [r1, 0x36]
	ldr r1, _080D3620
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D360C: .4byte gUnknown_03004B00
_080D3610: .4byte gUnknown_0202F7C8
_080D3614: .4byte gUnknown_0202F7C9
_080D3618: .4byte SpriteCallbackDummy
_080D361C: .4byte gSprites
_080D3620: .4byte sub_80D32E8
	thumb_func_end sub_80D31C8

	thumb_func_start sub_80D32E8
sub_80D32E8: @ 80D3624
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r1, [r5, 0x38]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080D368C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r7, r0, r2
	ldrh r4, [r7, 0x36]
	lsls r4, 24
	lsrs r4, 24
	ldrh r0, [r7, 0x34]
	mov r8, r0
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078B5C
	mov r1, r8
	lsrs r6, r1, 8
	movs r0, 0x2E
	ldrsh r1, [r7, r0]
	adds r0, r6, 0
	bl Sin
	ldrh r1, [r5, 0x24]
	adds r0, r1
	strh r0, [r5, 0x24]
	movs r0, 0x30
	ldrsh r1, [r7, r0]
	adds r0, r6, 0
	bl Cos
	ldrh r1, [r5, 0x26]
	adds r0, r1
	strh r0, [r5, 0x26]
	ldrh r0, [r7, 0x32]
	mov r1, r8
	adds r1, r0
	strh r1, [r7, 0x34]
	subs r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	cmp r4, 0
	beq _080D3690
	strh r4, [r7, 0x36]
	b _080D369A
	.align 2, 0
_080D368C: .4byte gSprites
_080D3690:
	ldr r0, _080D36A8
	str r0, [r5, 0x1C]
	adds r0, r7, 0
	bl DestroySprite
_080D369A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D36A8: .4byte sub_80D3370
	thumb_func_end sub_80D32E8

	thumb_func_start sub_80D3370
sub_80D3370: @ 80D36AC
	push {lr}
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	strb r1, [r3]
	ldr r1, _080D36CC
	str r1, [r0, 0x1C]
	ldr r1, _080D36D0
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080D36CC: .4byte sub_8078600
_080D36D0: .4byte sub_80D3398
	thumb_func_end sub_80D3370

	thumb_func_start sub_80D3398
sub_80D3398: @ 80D36D4
	push {lr}
	movs r1, 0xA
	strh r1, [r0, 0x2E]
	ldr r1, _080D36E8
	str r1, [r0, 0x1C]
	ldr r1, _080D36EC
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080D36E8: .4byte sub_80782D8
_080D36EC: .4byte move_anim_8074EE0
	thumb_func_end sub_80D3398

	thumb_func_start sub_80D33B4
sub_80D33B4: @ 80D36F0
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D3718
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D3720
	ldr r1, _080D371C
	ldrh r0, [r1, 0x4]
	negs r0, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r7, r1, 0
	b _080D3726
	.align 2, 0
_080D3718: .4byte gUnknown_0202F7C8
_080D371C: .4byte gUnknown_03004B00
_080D3720:
	ldr r0, _080D377C
	ldrh r6, [r0, 0x4]
	adds r7, r0, 0
_080D3726:
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080D3780
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r7, [r7, 0x6]
	adds r0, r7
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D3784
	str r0, [r5, 0x1C]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D377C: .4byte gUnknown_03004B00
_080D3780: .4byte gUnknown_0202F7C9
_080D3784: .4byte sub_80D344C
	thumb_func_end sub_80D33B4

	thumb_func_start sub_80D344C
sub_80D344C: @ 80D3788
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D37C4
	ldrh r1, [r0, 0xE]
	ldr r0, _080D37C8
	cmp r1, r0
	bne _080D37AA
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
_080D37AA:
	adds r0, r4, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D37BC
	adds r0, r4, 0
	bl move_anim_8072740
_080D37BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D37C4: .4byte gUnknown_03004B00
_080D37C8: .4byte 0x0000ffff
	thumb_func_end sub_80D344C

	thumb_func_start sub_80D3490
sub_80D3490: @ 80D37CC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080D3800
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r0, _080D3804
	ldrh r0, [r0]
	strh r0, [r4, 0x8]
	ldr r0, _080D3808
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r4, 0xC]
	ldr r0, _080D380C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3800: .4byte gTasks
_080D3804: .4byte gUnknown_03004B00
_080D3808: .4byte 0x0000279c
_080D380C: .4byte sub_80D34D4
	thumb_func_end sub_80D3490

	thumb_func_start sub_80D34D4
sub_80D34D4: @ 80D3810
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080D3888
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	lsls r0, 16
	asrs r0, 16
	mov r12, r1
	cmp r0, 0x3
	bne _080D3862
	movs r0, 0
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080D388C
	lsls r0, r5, 1
	adds r0, r1
	ldrh r6, [r0]
	adds r7, r1, 0
	adds r3, r0, 0x2
	movs r1, 0x6
	adds r2, r0, 0
_080D384C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080D384C
	adds r0, r5, 0x7
	lsls r0, 1
	adds r0, r7
	strh r6, [r0]
_080D3862:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r12
	ldrh r1, [r0, 0x1E]
	adds r1, 0x1
	strh r1, [r0, 0x1E]
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _080D3882
	adds r0, r4, 0
	bl move_anim_task_del
_080D3882:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3888: .4byte gTasks
_080D388C: .4byte gPlttBufferFaded
	thumb_func_end sub_80D34D4

	thumb_func_start sub_80D3554
sub_80D3554: @ 80D3890
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	movs r0, 0x1E
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080D38F8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	movs r0, 0xD2
	lsls r0, 8
	bl __divsi3
	strh r0, [r5, 0x38]
	ldr r0, _080D38FC
	ldrh r2, [r0, 0x6]
	strh r2, [r5, 0x3C]
	ldrh r1, [r0, 0xE]
	movs r3, 0xE
	ldrsh r0, [r0, r3]
	cmp r0, 0x7F
	ble _080D3900
	adds r0, r1, 0
	subs r0, 0x7F
	lsls r0, 8
	strh r0, [r5, 0x3A]
	negs r0, r2
	strh r0, [r5, 0x3C]
	b _080D3904
	.align 2, 0
_080D38F8: .4byte gUnknown_0202F7C9
_080D38FC: .4byte gUnknown_03004B00
_080D3900:
	lsls r0, r1, 8
	strh r0, [r5, 0x3A]
_080D3904:
	ldr r1, _080D3914
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D3914: .4byte sub_80D35DC
	thumb_func_end sub_80D3554

	thumb_func_start sub_80D35DC
sub_80D35DC: @ 80D3918
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D392C
	adds r0, r4, 0
	bl move_anim_8072740
_080D392C:
	ldrh r0, [r4, 0x3A]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	adds r0, r1
	asrs r0, 8
	cmp r0, 0x7F
	ble _080D395C
	movs r0, 0
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3C]
	negs r0, r0
	strh r0, [r4, 0x3C]
	b _080D3964
_080D395C:
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x3A]
	adds r0, r1
	strh r0, [r4, 0x3A]
_080D3964:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D35DC

	thumb_func_start sub_80D3630
sub_80D3630: @ 80D396C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D398C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r3, _080D3990
	ldrh r0, [r3]
	movs r2, 0
	strh r0, [r1, 0x8]
	strh r2, [r3, 0xE]
	ldr r0, _080D3994
	str r0, [r1]
	bx lr
	.align 2, 0
_080D398C: .4byte gTasks
_080D3990: .4byte gUnknown_03004B00
_080D3994: .4byte sub_80D365C
	thumb_func_end sub_80D3630

	thumb_func_start sub_80D365C
sub_80D365C: @ 80D3998
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080D39CC
	ldrh r0, [r2, 0xE]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0xE]
	ldr r1, _080D39D0
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bne _080D39C6
	adds r0, r3, 0
	bl move_anim_task_del
_080D39C6:
	pop {r0}
	bx r0
	.align 2, 0
_080D39CC: .4byte gUnknown_03004B00
_080D39D0: .4byte gTasks
	thumb_func_end sub_80D365C

	thumb_func_start sub_80D3698
sub_80D3698: @ 80D39D4
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r7, _080D3A20
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r7]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r6, _080D3A24
	strh r6, [r4, 0x26]
	ldrb r0, [r7]
	bl sub_8079E90
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D3A2E
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D3A28
	movs r0, 0xA
	strh r0, [r4, 0x24]
	b _080D3A30
	.align 2, 0
_080D3A20: .4byte gUnknown_0202F7C8
_080D3A24: .4byte 0x0000fff6
_080D3A28:
	strh r6, [r4, 0x24]
	subs r0, r5, 0x2
	b _080D3A32
_080D3A2E:
	strh r6, [r4, 0x24]
_080D3A30:
	adds r0, r5, 0x2
_080D3A32:
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	ldr r0, _080D3A44
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3A44: .4byte sub_80D370C
	thumb_func_end sub_80D3698

	thumb_func_start sub_80D370C
sub_80D370C: @ 80D3A48
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D3A5E
	adds r0, r2, 0
	bl move_anim_8072740
_080D3A5E:
	pop {r0}
	bx r0
	thumb_func_end sub_80D370C

	thumb_func_start sub_80D3728
sub_80D3728: @ 80D3A64
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r5, _080D3B24
	ldrb r0, [r5]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _080D3B28
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080D3AAE
	ldr r4, _080D3B2C
	movs r1, 0
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4]
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	beq _080D3AA6
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D3AAE
_080D3AA6:
	movs r1, 0
	ldrsh r0, [r4, r1]
	negs r0, r0
	strh r0, [r4]
_080D3AAE:
	ldr r5, _080D3B2C
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0
	cmp r0, 0
	bne _080D3AC2
	movs r1, 0x1
_080D3AC2:
	ldrb r0, [r5, 0xA]
	movs r7, 0x1
	cmp r0, 0
	bne _080D3ACC
	movs r7, 0x3
_080D3ACC:
	adds r0, r6, 0
	bl sub_80787B0
	ldr r0, _080D3B24
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D3AE6
	ldrh r0, [r5, 0x4]
	negs r0, r0
	strh r0, [r5, 0x4]
_080D3AE6:
	ldrh r0, [r5, 0x8]
	strh r0, [r6, 0x2E]
	ldr r4, _080D3B28
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r6, 0x36]
	ldr r0, _080D3B30
	str r0, [r6, 0x1C]
	ldr r1, _080D3B34
	adds r0, r6, 0
	bl oamt_set_x3A_32
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3B24: .4byte gUnknown_0202F7C8
_080D3B28: .4byte gUnknown_0202F7C9
_080D3B2C: .4byte gUnknown_03004B00
_080D3B30: .4byte sub_8078B34
_080D3B34: .4byte move_anim_8072740
	thumb_func_end sub_80D3728

	thumb_func_start sub_80D37FC
sub_80D37FC: @ 80D3B38
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080D3B68
	ldrh r1, [r0, 0x8]
	strh r1, [r4, 0x2E]
	ldrh r0, [r0, 0x4]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	strh r1, [r4, 0x36]
	ldr r0, _080D3B6C
	str r0, [r4, 0x1C]
	ldr r1, _080D3B70
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3B68: .4byte gUnknown_03004B00
_080D3B6C: .4byte sub_8078B34
_080D3B70: .4byte move_anim_8072740
	thumb_func_end sub_80D37FC

	thumb_func_start sub_80D3838
sub_80D3838: @ 80D3B74
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D3B8C
	movs r1, 0x6
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080D3B90
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	b _080D3B98
	.align 2, 0
_080D3B8C: .4byte gUnknown_03004B00
_080D3B90:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
_080D3B98:
	ldr r0, _080D3BA8
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x3C]
	ldr r0, _080D3BAC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D3BA8: .4byte gUnknown_03004B00
_080D3BAC: .4byte sub_80D3874
	thumb_func_end sub_80D3838

	thumb_func_start sub_80D3874
sub_80D3874: @ 80D3BB0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x30
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D3BF0
	adds r0, r4, 0
	bl move_anim_8072740
_080D3BF0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D3874

	thumb_func_start sub_80D38BC
sub_80D38BC: @ 80D3BF8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r1, _080D3CC8
	ldr r2, _080D3CCC
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r2, _080D3CD0
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2, 0x1]
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x10
	add r0, sp, 0xC
	mov r12, r0
	movs r5, 0
	ldr r1, _080D3CD4
	movs r4, 0x80
	lsls r4, 5
	mov r8, r6
	ldr r7, _080D3CD8
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D3C5C:
	str r5, [sp, 0x10]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D3C5C
	str r5, [sp, 0x10]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	mov r3, r12
	strb r0, [r3]
	strb r0, [r3]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x10]
	ldr r0, _080D3CD4
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D3CD8
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D3CF4
	ldr r2, _080D3CD0
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D3CDC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D3CE4
	ldr r0, _080D3CE0
	b _080D3CE6
	.align 2, 0
_080D3CC8: .4byte 0x04000050
_080D3CCC: .4byte 0x00003f42
_080D3CD0: .4byte 0x0400000a
_080D3CD4: .4byte 0x040000d4
_080D3CD8: .4byte 0x85000400
_080D3CDC: .4byte gUnknown_0202F7C8
_080D3CE0: .4byte gUnknown_08E70968
_080D3CE4:
	ldr r0, _080D3CF0
_080D3CE6:
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	b _080D3D0A
	.align 2, 0
_080D3CF0: .4byte gUnknown_08E70C38
_080D3CF4:
	ldr r0, _080D3D2C
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0x1
	bl sub_80763FC
_080D3D0A:
	ldr r0, _080D3D30
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080D3D34
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D3D3C
	ldr r0, _080D3D38
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080D3D4A
	.align 2, 0
_080D3D2C: .4byte gUnknown_08E70F0C
_080D3D30: .4byte gBattleAnimBackgroundImage_Surf
_080D3D34: .4byte gUnknown_03004B00
_080D3D38: .4byte gBattleAnimBackgroundPalette_Surf
_080D3D3C:
	ldr r0, _080D3DB4
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080D3D4A:
	ldr r0, _080D3DB8
	ldr r4, _080D3DBC
	mov r2, r10
	lsls r5, r2, 2
	adds r1, r5, r2
	lsls r1, 3
	adds r6, r1, r4
	ldrb r1, [r6, 0x7]
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r3, 0
	mov r9, r3
	mov r0, r8
	strh r0, [r6, 0x26]
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	adds r7, r0, r4
	mov r2, r9
	strh r2, [r7, 0x8]
	movs r0, 0x80
	lsls r0, 5
	strh r0, [r7, 0xA]
	strh r0, [r7, 0xC]
	bl sub_8076BE0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080D3DD0
	ldr r3, _080D3DC0
	adds r0, r3, 0
	ldr r1, _080D3DC4
	strh r0, [r1]
	ldr r2, _080D3DC8
	adds r0, r2, 0
	ldr r3, _080D3DCC
	strh r0, [r3]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	mov r0, r9
	strh r0, [r7, 0xE]
	b _080D3E2A
	.align 2, 0
_080D3DB4: .4byte gBattleAnimBackgroundImageMuddyWater_Pal
_080D3DB8: .4byte sub_80D3D68
_080D3DBC: .4byte gTasks
_080D3DC0: .4byte 0x0000ffb0
_080D3DC4: .4byte gUnknown_030042C0
_080D3DC8: .4byte 0x0000ffd0
_080D3DCC: .4byte gUnknown_030041B4
_080D3DD0:
	ldr r0, _080D3E00
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080D3E14
	ldr r2, _080D3E04
	adds r0, r2, 0
	ldr r3, _080D3E08
	strh r0, [r3]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldr r3, _080D3E0C
	strh r0, [r3]
	movs r0, 0x2
	strh r0, [r6, 0x8]
	ldr r0, _080D3E10
	strh r0, [r6, 0xA]
	strh r1, [r7, 0xE]
	b _080D3E2A
	.align 2, 0
_080D3E00: .4byte gUnknown_0202F7C8
_080D3E04: .4byte 0x0000ff20
_080D3E08: .4byte gUnknown_030042C0
_080D3E0C: .4byte gUnknown_030041B4
_080D3E10: .4byte 0x0000ffff
_080D3E14:
	ldr r0, _080D3E58
	strh r4, [r0]
	ldr r1, _080D3E5C
	adds r0, r1, 0
	ldr r2, _080D3E60
	strh r0, [r2]
	ldr r0, _080D3E64
	strh r0, [r6, 0x8]
	movs r0, 0x1
	strh r0, [r6, 0xA]
	strh r4, [r7, 0xE]
_080D3E2A:
	ldr r1, _080D3E68
	ldr r3, _080D3E58
	ldrh r0, [r3]
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080D3E60
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _080D3E6C
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080D3E70
	movs r0, 0x30
	strh r0, [r2, 0x10]
	movs r0, 0x70
	b _080D3E74
	.align 2, 0
_080D3E58: .4byte gUnknown_030042C0
_080D3E5C: .4byte 0x0000ffd0
_080D3E60: .4byte gUnknown_030041B4
_080D3E64: .4byte 0x0000fffe
_080D3E68: .4byte 0x04000014
_080D3E6C: .4byte gTasks
_080D3E70:
	movs r0, 0
	strh r0, [r2, 0x10]
_080D3E74:
	strh r0, [r2, 0x12]
	mov r2, r10
	adds r0, r5, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0x14]
	ldr r1, _080D3E98
	str r1, [r0]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3E98: .4byte sub_80D3B60
	thumb_func_end sub_80D38BC

	thumb_func_start sub_80D3B60
sub_80D3B60: @ 80D3E9C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080D4080
	lsls r4, r7, 2
	adds r4, r7
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r4, 0x8]
	ldr r1, _080D4084
	ldrh r1, [r1]
	adds r0, r1
	ldr r2, _080D4084
	strh r0, [r2]
	ldrh r0, [r4, 0xA]
	ldr r3, _080D4088
	ldrh r3, [r3]
	adds r0, r3
	ldr r1, _080D4088
	strh r0, [r1]
	add r5, sp, 0x4
	adds r0, r5, 0
	bl sub_8078914
	ldrh r0, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	adds r0, r2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	mov r10, r5
	cmp r0, 0x4
	bne _080D3F3E
	ldr r1, _080D408C
	ldrb r0, [r5, 0x8]
	lsls r0, 4
	adds r0, 0x7
	lsls r0, 1
	adds r0, r1
	ldrh r6, [r0]
	movs r2, 0x6
	adds r5, r1, 0
	adds r3, r5, 0
	mov r4, r10
_080D3F04:
	ldrb r0, [r4, 0x8]
	lsls r0, 4
	adds r1, r2, 0x1
	adds r0, r1
	lsls r1, r0, 1
	adds r1, r3
	subs r0, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080D3F04
	mov r3, r10
	ldrb r0, [r3, 0x8]
	lsls r0, 4
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	strh r6, [r0]
	ldr r1, _080D4080
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	strh r2, [r0, 0x12]
_080D3F3E:
	ldr r1, _080D4080
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0x14]
	adds r0, 0x1
	strh r0, [r3, 0x14]
	lsls r0, 16
	asrs r0, 16
	adds r4, r1, 0
	str r2, [sp, 0x14]
	cmp r0, 0x1
	ble _080D3FAC
	movs r0, 0
	strh r0, [r3, 0x14]
	ldrh r0, [r3, 0xE]
	adds r2, r0, 0x1
	strh r2, [r3, 0xE]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xD
	bgt _080D3F88
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
	ldrh r0, [r3, 0x10]
	adds r0, 0x1
	strh r0, [r3, 0x10]
_080D3F88:
	movs r2, 0xE
	ldrsh r0, [r3, r2]
	cmp r0, 0x36
	ble _080D3FAC
	ldrh r2, [r3, 0x10]
	subs r2, 0x1
	strh r2, [r3, 0x10]
	movs r1, 0x26
	ldrsh r0, [r3, r1]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	movs r0, 0x10
	subs r0, r2
	lsls r0, 8
	orrs r2, r0
	strh r2, [r1, 0xA]
_080D3FAC:
	ldr r2, [sp, 0x14]
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r4
	movs r3, 0x26
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldrh r1, [r0, 0xA]
	movs r0, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080D406E
	ldr r2, [sp, 0x4]
	movs r3, 0x80
	lsls r3, 6
	add r6, sp, 0x10
	movs r5, 0
	ldr r1, _080D4090
	movs r4, 0x80
	lsls r4, 5
	mov r8, r6
	ldr r0, _080D4094
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D3FE6:
	str r5, [sp, 0x10]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D3FE6
	str r5, [sp, 0x10]
	str r6, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	movs r1, 0
	strb r1, [r0]
	strb r1, [r0]
	mov r3, r10
	ldr r1, [r3, 0x4]
	movs r4, 0
	str r4, [sp, 0x10]
	ldr r0, _080D4090
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D4094
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D403E
	ldr r2, _080D4098
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D403E:
	ldr r0, _080D4084
	strh r4, [r0]
	ldr r1, _080D4088
	strh r4, [r1]
	ldr r0, _080D409C
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r2, _080D4080
	ldr r3, [sp, 0x14]
	adds r0, r3, r7
	lsls r0, 3
	adds r0, r2
	movs r3, 0x26
	ldrsh r1, [r0, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080D40A0
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	bl move_anim_task_del
_080D406E:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4080: .4byte gTasks
_080D4084: .4byte gUnknown_030042C0
_080D4088: .4byte gUnknown_030041B4
_080D408C: .4byte gPlttBufferFaded
_080D4090: .4byte 0x040000d4
_080D4094: .4byte 0x85000400
_080D4098: .4byte 0x0400000a
_080D409C: .4byte 0x04000050
_080D40A0: .4byte 0x0000ffff
	thumb_func_end sub_80D3B60

	thumb_func_start sub_80D3D68
sub_80D3D68: @ 80D40A4
	push {r4-r7,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080D40CC
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080D40C0
	b _080D41F8
_080D40C0:
	cmp r0, 0x1
	bgt _080D40D0
	cmp r0, 0
	beq _080D40D8
	b _080D436E
	.align 2, 0
_080D40CC: .4byte gTasks
_080D40D0:
	cmp r0, 0x2
	bne _080D40D6
	b _080D42C4
_080D40D6:
	b _080D436E
_080D40D8:
	movs r3, 0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	ldr r1, _080D41A8
	mov r12, r1
	cmp r3, r0
	bge _080D4116
	mov r7, r12
	movs r5, 0xF0
	lsls r5, 3
	add r5, r12
	ldr r6, _080D41AC
_080D40F0:
	lsls r2, r3, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r7
	adds r1, r5
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r6, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	asrs r2, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080D40F0
_080D4116:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D4150
	ldr r5, _080D41A8
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080D41AC
_080D412E:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r1]
	ldrh r1, [r4, 0xA]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D412E
_080D4150:
	ldrh r3, [r4, 0x12]
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	bgt _080D4186
	ldr r5, _080D41A8
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
	ldr r7, _080D41AC
_080D4164:
	asrs r2, 16
	lsls r1, r2, 1
	adds r3, r1, r5
	adds r1, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	ldrh r1, [r4, 0xC]
	adds r0, r7, 0
	ands r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	lsls r2, r3, 16
	asrs r0, r2, 16
	cmp r0, 0x9F
	ble _080D4164
_080D4186:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D41B0
	lsls r0, r3, 16
	asrs r0, 15
	mov r3, r12
	adds r2, r0, r3
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xA]
	strh r1, [r0]
	ldrh r0, [r4, 0xA]
	b _080D41C6
	.align 2, 0
_080D41A8: .4byte gUnknown_03004DE0
_080D41AC: .4byte 0x0000ffff
_080D41B0:
	lsls r0, r3, 16
	asrs r0, 15
	mov r1, r12
	adds r2, r0, r1
	movs r1, 0xF0
	lsls r1, 3
	add r1, r12
	adds r0, r1
	ldrh r1, [r4, 0xC]
	strh r1, [r0]
	ldrh r0, [r4, 0xC]
_080D41C6:
	strh r0, [r2]
	ldr r0, _080D41F0
	str r0, [sp]
	ldr r0, _080D41F4
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D436E
	.align 2, 0
_080D41F0: .4byte 0x04000052
_080D41F4: .4byte 0xa2600001
_080D41F8:
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _080D4210
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bgt _080D4224
	strh r1, [r4, 0x10]
	b _080D421E
_080D4210:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _080D4224
_080D421E:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D4224:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080D4258
	ldr r6, _080D42BC
	ldr r5, _080D42C0
_080D4232:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D4232
_080D4258:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D428C
	ldr r6, _080D42BC
	ldr r5, _080D42C0
_080D426A:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D426A
_080D428C:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080D436E
	ldr r6, _080D42BC
	ldr r5, _080D42C0
_080D429A:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080D429A
	b _080D436E
	.align 2, 0
_080D42BC: .4byte gUnknown_03004DE0
_080D42C0: .4byte gUnknown_03004DC0
_080D42C4:
	movs r3, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _080D42F8
	ldr r6, _080D4378
	ldr r5, _080D437C
_080D42D2:
	lsls r1, r3, 16
	asrs r1, 16
	lsls r3, r1, 1
	ldrb r2, [r5, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	adds r3, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r3]
	adds r1, 0x1
	lsls r1, 16
	lsrs r3, r1, 16
	asrs r1, 16
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D42D2
_080D42F8:
	ldrh r3, [r4, 0x10]
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D432C
	ldr r6, _080D4378
	ldr r5, _080D437C
_080D430A:
	asrs r3, r2, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	adds r3, 0x1
	lsls r2, r3, 16
	asrs r1, r2, 16
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _080D430A
_080D432C:
	ldrh r3, [r4, 0x12]
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080D4358
	ldr r6, _080D4378
	ldr r5, _080D437C
_080D433A:
	asrs r3, r1, 16
	lsls r2, r3, 1
	ldrb r1, [r5, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	lsls r1, r3, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080D433A
_080D4358:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080D436E
	bl remove_some_task
	adds r0, r7, 0
	bl DestroyTask
_080D436E:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D4378: .4byte gUnknown_03004DE0
_080D437C: .4byte gUnknown_03004DC0
	thumb_func_end sub_80D3D68

	thumb_func_start sub_80D4044
sub_80D4044: @ 80D4380
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r3, _080D43D4
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D43D8
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	bl Random
	movs r5, 0xFF
	ands r5, r0
	movs r0, 0x80
	lsls r0, 1
	adds r6, r0, 0
	orrs r5, r6
	bl Random
	ldr r1, _080D43DC
	ands r1, r0
	adds r0, r1, 0
	cmp r0, 0xFF
	ble _080D43C6
	subs r0, r6, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080D43C6:
	strh r5, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldr r0, _080D43E0
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D43D4: .4byte 0x000003ff
_080D43D8: .4byte 0xfffffc00
_080D43DC: .4byte 0x000001ff
_080D43E0: .4byte sub_80D40A8
	thumb_func_end sub_80D4044

	thumb_func_start sub_80D40A8
sub_80D40A8: @ 80D43E4
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r3, r0, r1
	strh r3, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r1, r4
	strh r1, [r2, 0x36]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080D4408
	lsls r0, r3, 16
	asrs r0, 24
	negs r0, r0
	b _080D440C
_080D4408:
	lsls r0, r3, 16
	asrs r0, 24
_080D440C:
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080D442A
	adds r0, r2, 0
	bl move_anim_8072740
_080D442A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D40A8

	thumb_func_start sub_80D40F4
sub_80D40F4: @ 80D4430
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D4480
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r2, _080D4484
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x12]
	bl sub_80D4394
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldr r0, _080D4488
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4480: .4byte gTasks
_080D4484: .4byte gSprites
_080D4488: .4byte sub_80D4150
	thumb_func_end sub_80D40F4

	thumb_func_start sub_80D4150
sub_80D4150: @ 80D448C
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D44B4
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bls _080D44A8
	b _080D46C6
_080D44A8:
	lsls r0, 2
	ldr r1, _080D44B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D44B4: .4byte gTasks
_080D44B8: .4byte _080D44BC
	.align 2, 0
_080D44BC:
	.4byte _080D44DC
	.4byte _080D4502
	.4byte _080D4594
	.4byte _080D45CA
	.4byte _080D45DE
	.4byte _080D45EC
	.4byte _080D466C
	.4byte _080D46B8
_080D44DC:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0xE0
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 2
	str r0, [sp, 0x4]
	movs r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r2, r3, 0
	bl sub_8079C08
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D4502:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D455E
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D454C
	ldr r2, _080D4548
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	strh r1, [r0, 0x24]
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
	b _080D455E
	.align 2, 0
_080D4548: .4byte gSprites
_080D454C:
	ldr r2, _080D458C
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080D4590
	strh r1, [r0, 0x24]
_080D455E:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080D456E
	b _080D46C6
_080D456E:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldr r2, _080D458C
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xE]
	b _080D46A8
	.align 2, 0
_080D458C: .4byte gSprites
_080D4590: .4byte 0x0000fffd
_080D4594:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080D45A4
	b _080D46C6
_080D45A4:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xE0
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_8079C08
	movs r0, 0
	strh r0, [r4, 0xE]
	b _080D46AA
_080D45CA:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080D46C6
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080D46AA
_080D45DE:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80D4418
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D45EC:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D46C6
	movs r0, 0
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D4624
	ldr r2, _080D4620
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x2
	b _080D4636
	.align 2, 0
_080D4620: .4byte gSprites
_080D4624:
	ldr r2, _080D4668
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x2
_080D4636:
	strh r1, [r0, 0x26]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _080D46C6
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xE0
	bl sub_8079C08
	movs r0, 0
	strh r0, [r4, 0xE]
	strh r0, [r4, 0x10]
	b _080D46AA
	.align 2, 0
_080D4668: .4byte gSprites
_080D466C:
	ldr r6, _080D46B4
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080D46C6
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0x12]
	strh r1, [r0, 0x22]
_080D46A8:
	strh r5, [r4, 0x10]
_080D46AA:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D46C6
	.align 2, 0
_080D46B4: .4byte gSprites
_080D46B8:
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D46C6
	adds r0, r2, 0
	bl move_anim_task_del
_080D46C6:
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4150

	thumb_func_start sub_80D4394
sub_80D4394: @ 80D46D0
	push {r4,r5,lr}
	ldr r4, _080D46F4
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D4704
	ldr r1, _080D46F8
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080D46FC
	b _080D4714
	.align 2, 0
_080D46F4: .4byte gUnknown_0202F7C8
_080D46F8: .4byte gUnknown_02024A6A
_080D46FC: .4byte gPlayerParty
_080D4700:
	adds r0, r2, 0
	b _080D4746
_080D4704:
	ldr r1, _080D474C
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _080D4750
_080D4714:
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0x3A
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	adds r0, r5, 0
	movs r1, 0x39
	bl GetMonData
	lsls r0, 16
	lsrs r3, r0, 16
	lsrs r4, 18
	movs r2, 0
_080D4732:
	adds r1, r2, 0x1
	adds r0, r4, 0
	muls r0, r1
	cmp r3, r0
	blt _080D4700
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x2
	bls _080D4732
	movs r0, 0x3
_080D4746:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080D474C: .4byte gUnknown_02024A6A
_080D4750: .4byte gEnemyParty
	thumb_func_end sub_80D4394

	thumb_func_start sub_80D4418
sub_80D4418: @ 80D4754
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	ldr r4, _080D485C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0xAC
	ldrb r0, [r4]
	bl sub_8079E90
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x8]
	ldrh r1, [r7, 0xA]
	movs r0, 0x4
	subs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bgt _080D47A4
	movs r1, 0x1
_080D47A4:
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r0, r1, 16
	mov r10, r8
	mov r9, r6
	mov r1, r10
	lsls r1, 4
	str r1, [sp, 0xC]
	mov r1, r9
	lsls r1, 4
	str r1, [sp, 0x10]
	asrs r0, 16
	mov r8, r0
_080D47BE:
	ldr r0, _080D4860
	mov r1, r10
	mov r2, r9
	ldr r3, [sp, 0x8]
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r6, r5, 16
	cmp r2, 0x40
	beq _080D4826
	ldr r1, _080D4864
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x30]
	mov r1, sp
	ldrh r1, [r1, 0xC]
	strh r1, [r5, 0x32]
	mov r0, sp
	ldrh r0, [r0, 0x10]
	strh r0, [r5, 0x34]
	asrs r4, r6, 16
	adds r0, r4, 0
	movs r1, 0x40
	bl Cos
	strh r0, [r5, 0x36]
	adds r0, r4, 0
	movs r1, 0x40
	bl Sin
	strh r0, [r5, 0x38]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r5, 0x3A]
	movs r0, 0x2
	strh r0, [r5, 0x3C]
	ldrh r1, [r7, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D4820
	adds r0, r5, 0
	bl sub_80D452C
_080D4820:
	ldrh r0, [r7, 0xC]
	adds r0, 0x1
	strh r0, [r7, 0xC]
_080D4826:
	mov r1, r8
	lsls r0, r1, 1
	asrs r1, r6, 16
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r5, r0, 16
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r0, 16
	add r0, r8
	lsls r0, 16
	lsrs r1, r0, 16
	str r1, [sp, 0x4]
	asrs r0, 16
	cmp r0, 0x13
	ble _080D47BE
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D485C: .4byte gUnknown_0202F7C8
_080D4860: .4byte gSpriteTemplate_83D9378
_080D4864: .4byte gSprites
	thumb_func_end sub_80D4418

	thumb_func_start sub_80D452C
sub_80D452C: @ 80D4868
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D487A
	cmp r0, 0x1
	beq _080D48B0
	b _080D490A
_080D487A:
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r0, [r4, 0x36]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 1
	adds r1, r0
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_080D48B0:
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r4, 0x20]
	lsls r1, 16
	asrs r2, r1, 20
	strh r2, [r4, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D48E6
	adds r1, r2, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D48E6
	cmp r1, 0x78
	ble _080D490A
_080D48E6:
	ldr r3, _080D4910
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080D490A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4910: .4byte gTasks
	thumb_func_end sub_80D452C

	thumb_func_start sub_80D45D8
sub_80D45D8: @ 80D4914
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D4944
	adds r4, r1, r0
	bl sub_80D4394
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xA]
	ldr r0, _080D4948
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D494C
	movs r0, 0x88
	strh r0, [r4, 0x10]
	movs r0, 0x28
	b _080D4952
	.align 2, 0
_080D4944: .4byte gTasks
_080D4948: .4byte gUnknown_0202F7C8
_080D494C:
	movs r0, 0x10
	strh r0, [r4, 0x10]
	movs r0, 0x50
_080D4952:
	strh r0, [r4, 0x14]
	movs r0, 0x62
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x10]
	adds r0, 0x31
	strh r0, [r4, 0x16]
	movs r0, 0xA
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x5
	strh r0, [r4, 0x20]
	ldr r0, _080D4974
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4974: .4byte sub_80D463C
	thumb_func_end sub_80D45D8

	thumb_func_start sub_80D463C
sub_80D463C: @ 80D4978
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r7, _080D499C
	adds r4, r0, r7
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _080D49A0
	cmp r2, 0x1
	beq _080D4A50
	b _080D4A5E
	.align 2, 0
_080D499C: .4byte gTasks
_080D49A0:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D49B6
	strh r2, [r4, 0xC]
	adds r0, r4, 0
	bl sub_80D472C
_080D49B6:
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D4A30
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D4A30
	ldr r5, _080D4A44
	movs r1, 0x1
	mov r8, r1
	mov r2, r8
	strh r2, [r5]
	strh r0, [r5, 0x2]
	movs r0, 0xC
	strh r0, [r5, 0x4]
	ldr r6, _080D4A48
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080D4A00
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080D4A4C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080D4A00:
	movs r0, 0x3
	strh r0, [r5]
	adds r0, r6, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080D4A2C
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r7
	ldr r1, [r0]
	adds r0, r2, 0
	bl _call_via_r1
	ldr r1, _080D4A4C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080D4A2C:
	mov r0, r8
	strh r0, [r4, 0x22]
_080D4A30:
	movs r2, 0x1E
	ldrsh r1, [r4, r2]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _080D4A5E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4A5E
	.align 2, 0
_080D4A44: .4byte gUnknown_03004B00
_080D4A48: .4byte sub_80E1864
_080D4A4C: .4byte gUnknown_0202F7B2
_080D4A50:
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D4A5E
	adds r0, r1, 0
	bl move_anim_task_del
_080D4A5E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D463C

	thumb_func_start sub_80D472C
sub_80D472C: @ 80D4A68
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	ldr r1, _080D4AF4
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x3
	asrs r0, 4
	ldrh r2, [r4, 0x14]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080D4AF8
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080D4AC2
	ldr r3, _080D4AFC
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080D4B00
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x38]
	strh r6, [r0, 0x3A]
	movs r1, 0x9
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
_080D4AC2:
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x18]
	adds r0, 0x27
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x18]
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	ldr r0, _080D4B04
	muls r0, r1
	ldr r1, _080D4B08
	adds r0, r1
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r4, 0x10]
	adds r1, r0
	strh r1, [r4, 0x16]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4AF4: .4byte gSineTable
_080D4AF8: .4byte gSpriteTemplate_83D9378
_080D4AFC: .4byte gSprites
_080D4B00: .4byte sub_80D47D0
_080D4B04: .4byte 0x41c64e6d
_080D4B08: .4byte 0x00003039
	thumb_func_end sub_80D472C

	thumb_func_start sub_80D47D0
sub_80D47D0: @ 80D4B0C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D4BA2
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x38
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080D4BA2
	ldr r2, _080D4BA8
	movs r3, 0x3A
	ldrsh r1, [r5, r3]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x1
	strh r1, [r0, 0x1C]
	ldr r0, _080D4BAC
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	cmp r0, 0x40
	beq _080D4B9C
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D4BB0
	adds r0, r4
	movs r1, 0x3
	bl StartSpriteAffineAnim
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3A]
	strh r1, [r0, 0x3A]
	movs r3, 0x30
	ldrsh r1, [r5, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r5, 0x3C]
	strh r1, [r0, 0x3C]
	movs r0, 0x30
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080D4BB4
	str r1, [r0]
_080D4B9C:
	adds r0, r5, 0
	bl DestroySprite
_080D4BA2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D4BA8: .4byte gTasks
_080D4BAC: .4byte gBattleAnimSpriteTemplate_83DB4D8
_080D4BB0: .4byte gSprites
_080D4BB4: .4byte sub_80D487C
	thumb_func_end sub_80D47D0

	thumb_func_start sub_80D487C
sub_80D487C: @ 80D4BB8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D4C24
	movs r0, 0
	strh r0, [r4, 0x30]
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
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080D4C24
	ldr r3, _080D4C2C
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D4C24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D4C2C: .4byte gTasks
	thumb_func_end sub_80D487C

	thumb_func_start sub_80D48F4
sub_80D48F4: @ 80D4C30
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D4CB4
	adds r5, r1, r0
	ldr r4, _080D4CB8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D4C74
	movs r1, 0x1
_080D4C74:
	strh r1, [r5, 0x16]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D4C88
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x16]
_080D4C88:
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	lsls r0, 3
	ldrh r1, [r5, 0xE]
	adds r0, r1
	strh r0, [r5, 0x12]
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	lsls r1, 3
	ldrh r0, [r5, 0x10]
	subs r0, r1
	strh r0, [r5, 0x14]
	ldr r0, _080D4CBC
	strh r0, [r5, 0x1A]
	strh r6, [r5, 0xA]
	strh r6, [r5, 0x8]
	ldr r0, _080D4CC0
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4CB4: .4byte gTasks
_080D4CB8: .4byte gUnknown_0202F7C8
_080D4CBC: .4byte 0x0000ffe0
_080D4CC0: .4byte sub_80D4988
	thumb_func_end sub_80D48F4

	thumb_func_start sub_80D4988
sub_80D4988: @ 80D4CC4
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D4CE8
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080D4CDE
	b _080D4DFE
_080D4CDE:
	lsls r0, 2
	ldr r1, _080D4CEC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D4CE8: .4byte gTasks
_080D4CEC: .4byte _080D4CF0
	.align 2, 0
_080D4CF0:
	.4byte _080D4D0C
	.4byte _080D4D1C
	.4byte _080D4D36
	.4byte _080D4D78
	.4byte _080D4D9A
	.4byte _080D4DC8
	.4byte _080D4DEE
_080D4D0C:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D4E04
	b _080D4DF6
_080D4D1C:
	adds r0, r4, 0
	bl sub_80D4AD0
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D4E04
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D4DF6
_080D4D36:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	adds r1, r0
	movs r2, 0
	strh r1, [r4, 0x12]
	adds r1, 0x10
	lsls r1, 16
	movs r0, 0x88
	lsls r0, 17
	cmp r1, r0
	bls _080D4E04
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D4D74
	movs r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x6
	strh r0, [r4, 0x8]
	strh r2, [r4, 0xA]
	b _080D4E04
_080D4D74:
	strh r2, [r4, 0xA]
	b _080D4DF6
_080D4D78:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D4E04
	b _080D4DF6
_080D4D9A:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	ldrh r0, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x12]
	adds r0, 0x10
	lsls r0, 16
	movs r1, 0x88
	lsls r1, 17
	cmp r0, r1
	bls _080D4E04
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D4DF6
_080D4DC8:
	adds r0, r4, 0
	bl sub_80D4AD0
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	lsls r1, 1
	ldrh r0, [r4, 0x14]
	subs r0, r1
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080D4E04
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080D4E04
_080D4DEE:
	movs r1, 0x18
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D4E04
_080D4DF6:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D4E04
_080D4DFE:
	adds r0, r2, 0
	bl move_anim_task_del
_080D4E04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4988

	thumb_func_start sub_80D4AD0
sub_80D4AD0: @ 80D4E0C
	push {r4-r6,lr}
	adds r6, r0, 0
	ldrh r0, [r6, 0xC]
	adds r0, 0x1
	strh r0, [r6, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D4E66
	movs r0, 0
	strh r0, [r6, 0xC]
	ldr r0, _080D4E6C
	movs r2, 0xE
	ldrsh r1, [r6, r2]
	movs r3, 0x10
	ldrsh r2, [r6, r3]
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080D4E66
	ldr r5, _080D4E70
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	ldrh r1, [r6, 0x12]
	strh r1, [r0, 0x32]
	ldrh r1, [r6, 0x14]
	strh r1, [r0, 0x36]
	ldrh r1, [r6, 0x1A]
	strh r1, [r0, 0x38]
	bl sub_80786EC
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _080D4E74
	str r0, [r4]
	ldrh r0, [r6, 0x18]
	adds r0, 0x1
	strh r0, [r6, 0x18]
_080D4E66:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4E6C: .4byte gSpriteTemplate_83D9378
_080D4E70: .4byte gSprites
_080D4E74: .4byte sub_80D4B3C
	thumb_func_end sub_80D4AD0

	thumb_func_start sub_80D4B3C
sub_80D4B3C: @ 80D4E78
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D4ED2
	ldrh r0, [r6, 0x24]
	ldrh r1, [r6, 0x20]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrh r0, [r6, 0x26]
	ldrh r1, [r6, 0x22]
	adds r0, r1
	strh r0, [r6, 0x22]
	movs r0, 0x6
	strh r0, [r6, 0x2E]
	bl Random
	movs r4, 0x1F
	adds r1, r4, 0
	ands r1, r0
	ldr r5, _080D4ED8
	adds r1, r5
	ldrh r0, [r6, 0x20]
	adds r1, r0
	strh r1, [r6, 0x32]
	bl Random
	ands r4, r0
	adds r4, r5
	ldrh r1, [r6, 0x22]
	adds r4, r1
	strh r4, [r6, 0x36]
	bl Random
	movs r1, 0x7
	ands r1, r0
	mvns r1, r1
	strh r1, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _080D4EDC
	str r0, [r6, 0x1C]
_080D4ED2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4ED8: .4byte 0x0000fff0
_080D4EDC: .4byte sub_80D4BA4
	thumb_func_end sub_80D4B3C

	thumb_func_start sub_80D4BA4
sub_80D4BA4: @ 80D4EE0
	push {r4-r6,lr}
	adds r5, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D4F1C
	movs r4, 0
	ldr r6, _080D4F24
_080D4EF2:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r6
	ldr r1, [r2]
	ldr r0, _080D4F28
	cmp r1, r0
	bne _080D4F12
	movs r0, 0x1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0x18]
	subs r0, 0x1
	strh r0, [r2, 0x18]
	adds r0, r5, 0
	bl DestroySprite
_080D4F12:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xF
	bls _080D4EF2
_080D4F1C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D4F24: .4byte gTasks
_080D4F28: .4byte sub_80D4988
	thumb_func_end sub_80D4BA4

	thumb_func_start sub_80D4BF0
sub_80D4BF0: @ 80D4F2C
	ldr r2, _080D4F4C
	ldrh r1, [r2]
	strh r1, [r0, 0x20]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x22]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0x2E]
	ldrh r1, [r2, 0x6]
	strh r1, [r0, 0x30]
	ldrh r1, [r2, 0x8]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0xA]
	strh r1, [r0, 0x34]
	ldr r1, _080D4F50
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D4F4C: .4byte gUnknown_03004B00
_080D4F50: .4byte sub_80D4C18
	thumb_func_end sub_80D4BF0

	thumb_func_start sub_80D4C18
sub_80D4C18: @ 80D4F54
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x36]
	ldrh r1, [r4, 0x2E]
	subs r0, r1
	strh r0, [r4, 0x36]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080D4F98
	adds r0, r4, 0
	bl move_anim_8072740
_080D4F98:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4C18

	thumb_func_start sub_80D4C64
sub_80D4C64: @ 80D4FA0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 23
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 23
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080D4FD8
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D4FD8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4C64

	thumb_func_start sub_80D4CA4
sub_80D4CA4: @ 80D4FE0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080D501C
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r1, _080D5020
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldr r0, _080D5024
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D501C: .4byte gUnknown_0202F7C9
_080D5020: .4byte gUnknown_03004B00
_080D5024: .4byte sub_80D4CEC
	thumb_func_end sub_80D4CA4

	thumb_func_start sub_80D4CEC
sub_80D4CEC: @ 80D5028
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	subs r6, r1, r0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	subs r5, r1, r0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r6
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	muls r0, r5
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080D5080
	movs r0, 0
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80D4D64
_080D5080:
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080D5092
	adds r0, r4, 0
	bl move_anim_8072740
_080D5092:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4CEC

	thumb_func_start sub_80D4D64
sub_80D4D64: @ 80D50A0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	adds r4, r1, 0
	adds r5, r2, 0
	movs r2, 0x2E
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	lsls r1, 15
	lsrs r1, 16
	str r1, [sp]
	ldrh r1, [r0, 0x24]
	ldrh r3, [r0, 0x20]
	adds r1, r3
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r0, r5, r0
	subs r0, 0x5
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	bl Random
	negs r4, r4
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r4, r0
	subs r4, 0x5
	lsls r4, 16
	lsrs r7, r4, 16
	movs r6, 0
	mov r0, r8
	lsls r0, 16
	mov r8, r0
	mov r1, r10
	lsls r1, 16
	str r1, [sp, 0xC]
	ldr r2, [sp]
	lsls r2, 16
	str r2, [sp, 0x10]
	asrs r1, 16
	lsls r0, r7, 16
	asrs r5, r0, 16
	str r0, [sp, 0x14]
	negs r3, r5
	str r3, [sp, 0x4]
	asrs r0, r2, 16
	adds r1, r0
	lsls r1, 16
	mov r10, r1
_080D512E:
	ldr r0, _080D5170
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080D5174
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080D5178
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	bge _080D517C
	mov r1, sp
	ldrh r1, [r1, 0x4]
	strh r1, [r4, 0x32]
	b _080D517E
	.align 2, 0
_080D5170: .4byte gSpriteTemplate_83D9420
_080D5174: .4byte gSprites
_080D5178: .4byte gUnknown_0202F7C8
_080D517C:
	strh r7, [r4, 0x32]
_080D517E:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080D512E
	movs r6, 0
	ldr r3, [sp, 0xC]
	asrs r1, r3, 16
	ldr r0, [sp, 0x14]
	asrs r5, r0, 16
	negs r2, r5
	str r2, [sp, 0x8]
	ldr r3, [sp, 0x10]
	asrs r0, r3, 16
	subs r1, r0
	lsls r1, 16
	mov r10, r1
_080D51A4:
	ldr r0, _080D51E8
	mov r2, r8
	asrs r1, r2, 16
	mov r3, r10
	asrs r2, r3, 16
	movs r3, 0x82
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080D51EC
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	mov r0, r9
	strh r0, [r4, 0x30]
	ldr r0, _080D51F0
	ldrb r0, [r0]
	bl sub_8079E90
	subs r0, 0x1
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	cmp r5, 0
	ble _080D51F4
	mov r1, sp
	ldrh r1, [r1, 0x8]
	strh r1, [r4, 0x32]
	b _080D51F6
	.align 2, 0
_080D51E8: .4byte gSpriteTemplate_83D9420
_080D51EC: .4byte gSprites
_080D51F0: .4byte gUnknown_0202F7C8
_080D51F4:
	strh r7, [r4, 0x32]
_080D51F6:
	lsls r0, r6, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r6, r0, 16
	cmp r0, 0
	ble _080D51A4
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D4D64

	thumb_func_start sub_80D4ED8
sub_80D4ED8: @ 80D5214
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D5248
	ldrh r0, [r0]
	strh r0, [r4, 0x2E]
	movs r0, 0x3C
	strh r0, [r4, 0x30]
	movs r0, 0x9
	strh r0, [r4, 0x32]
	movs r0, 0x1E
	strh r0, [r4, 0x34]
	movs r0, 0xFE
	lsls r0, 8
	strh r0, [r4, 0x36]
	ldr r1, _080D524C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _080D5250
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5248: .4byte gUnknown_03004B00
_080D524C: .4byte move_anim_8072740
_080D5250: .4byte sub_8078174
	thumb_func_end sub_80D4ED8

	thumb_func_start sub_80D4F18
sub_80D4F18: @ 80D5254
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D528C
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x32]
	ldr r0, _080D5290
	str r0, [r4, 0x1C]
	ldr r1, _080D5294
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D528C: .4byte gUnknown_03004B00
_080D5290: .4byte sub_8078394
_080D5294: .4byte move_anim_8072740
	thumb_func_end sub_80D4F18

	thumb_func_start sub_80D4F5C
sub_80D4F5C: @ 80D5298
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080D52CC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D52D4
	ldr r2, _080D52D0
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080D52EA
	.align 2, 0
_080D52CC: .4byte gUnknown_0202F7C8
_080D52D0: .4byte gUnknown_03004B00
_080D52D4:
	ldr r1, _080D5300
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
_080D52EA:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080D5304
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5300: .4byte gUnknown_03004B00
_080D5304: .4byte sub_80D5038
	thumb_func_end sub_80D4F5C

	thumb_func_start sub_80D4FCC
sub_80D4FCC: @ 80D5308
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D5334
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D533C
	ldr r2, _080D5338
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	adds r1, r2, 0
	b _080D5354
	.align 2, 0
_080D5334: .4byte gUnknown_0202F7C8
_080D5338: .4byte gUnknown_03004B00
_080D533C:
	ldr r1, _080D536C
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x8]
	negs r0, r0
	strh r0, [r4, 0x32]
_080D5354:
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080D5370
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D536C: .4byte gUnknown_03004B00
_080D5370: .4byte sub_80D5038
	thumb_func_end sub_80D4FCC

	thumb_func_start sub_80D5038
sub_80D5038: @ 80D5374
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x36
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _080D539A
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x34]
	ldrh r3, [r2, 0x26]
	adds r0, r3
	strh r0, [r2, 0x26]
_080D539A:
	movs r0, 0x2E
	ldrsh r1, [r2, r0]
	movs r3, 0x30
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080D53AC
	adds r0, r2, 0
	bl move_anim_8074EE0
_080D53AC:
	pop {r0}
	bx r0
	thumb_func_end sub_80D5038

	thumb_func_start sub_80D5074
sub_80D5074: @ 80D53B0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _080D53D4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D53DC
	ldr r0, _080D53D8
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080D53EE
	.align 2, 0
_080D53D4: .4byte gUnknown_0202F7C8
_080D53D8: .4byte gUnknown_03004B00
_080D53DC:
	ldr r0, _080D541C
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	adds r2, r4, 0
	adds r2, 0x43
	movs r1, 0x8
	strb r1, [r2]
_080D53EE:
	adds r2, r0, 0
	ldrh r0, [r2, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x22]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r2, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r2, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r2, 0xA]
	strh r0, [r4, 0x34]
	ldrh r0, [r2, 0xC]
	strh r0, [r4, 0x36]
	strh r1, [r4, 0x38]
	ldr r0, _080D5420
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D541C: .4byte gUnknown_03004B00
_080D5420: .4byte sub_80D50E8
	thumb_func_end sub_80D5074

	thumb_func_start sub_80D50E8
sub_80D50E8: @ 80D5424
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D54AC
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	ldr r0, _080D5490
	cmp r1, r0
	ble _080D5442
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
_080D5442:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x38]
	lsls r1, 16
	asrs r1, 24
	ldrh r2, [r4, 0x30]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080D5498
	ldr r2, _080D5494
	b _080D54A0
	.align 2, 0
_080D5490: .4byte 0x00002710
_080D5494: .4byte 0xffffff00
_080D5498:
	cmp r0, 0
	bge _080D54A4
	movs r2, 0x80
	lsls r2, 1
_080D54A0:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_080D54A4:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080D54B2
_080D54AC:
	adds r0, r4, 0
	bl move_anim_8074EE0
_080D54B2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D50E8

	thumb_func_start sub_80D517C
sub_80D517C: @ 80D54B8
	push {lr}
	movs r1, 0
	strh r1, [r0, 0x20]
	strh r1, [r0, 0x22]
	movs r1, 0x3C
	strh r1, [r0, 0x2E]
	movs r1, 0x8C
	strh r1, [r0, 0x32]
	movs r1, 0x50
	strh r1, [r0, 0x36]
	ldr r1, _080D54DC
	str r1, [r0, 0x1C]
	ldr r1, _080D54E0
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080D54DC: .4byte sub_8078B34
_080D54E0: .4byte move_anim_8072740
	thumb_func_end sub_80D517C

	thumb_func_start sub_80D51A8
sub_80D51A8: @ 80D54E4
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r5, _080D553C
	ldrb r0, [r5]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _080D5540
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080D552A
	movs r0, 0x2
	bl battle_get_side_with_given_state
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	beq _080D5522
	movs r0, 0x3
	bl battle_get_side_with_given_state
	ldrb r1, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _080D552A
_080D5522:
	ldr r1, _080D5544
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080D552A:
	ldr r1, _080D5548
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D553C: .4byte gUnknown_0202F7C8
_080D5540: .4byte gUnknown_0202F7C9
_080D5544: .4byte gUnknown_03004B00
_080D5548: .4byte sub_8079534
	thumb_func_end sub_80D51A8

	thumb_func_start sub_80D5210
sub_80D5210: @ 80D554C
	ldr r2, _080D5560
	ldrh r1, [r2]
	negs r1, r1
	strh r1, [r2]
	ldrh r1, [r2, 0x4]
	negs r1, r1
	strh r1, [r2, 0x4]
	ldr r1, _080D5564
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080D5560: .4byte gUnknown_03004B00
_080D5564: .4byte sub_8079534
	thumb_func_end sub_80D5210

	thumb_func_start sub_80D522C
sub_80D522C: @ 80D5568
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D5588
	ldrh r0, [r0, 0x4]
	movs r1, 0
	strh r0, [r4, 0x3C]
	strh r1, [r4, 0x2E]
	ldr r0, _080D558C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5588: .4byte gUnknown_03004B00
_080D558C: .4byte sub_80D5254
	thumb_func_end sub_80D522C

	thumb_func_start sub_80D5254
sub_80D5254: @ 80D5590
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_80D5348
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x12
	bne _080D55DA
	movs r0, 0x19
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080D55E0
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D55E4
	str r0, [r5, 0x1C]
_080D55DA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D55E0: .4byte gUnknown_0202F7C9
_080D55E4: .4byte sub_80D52AC
	thumb_func_end sub_80D5254

	thumb_func_start sub_80D52AC
sub_80D52AC: @ 80D55E8
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D5630
	movs r4, 0
	strh r4, [r6, 0x2E]
	ldr r5, _080D5628
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r4, [r6, 0x26]
	strh r4, [r6, 0x24]
	ldr r1, _080D562C
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	b _080D565A
	.align 2, 0
_080D5628: .4byte gUnknown_0202F7C9
_080D562C: .4byte sub_80D5324
_080D5630:
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Sin
	ldrh r1, [r6, 0x24]
	adds r0, r1
	strh r0, [r6, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r6, r1]
	movs r1, 0x1C
	bl Cos
	ldrh r1, [r6, 0x26]
	adds r0, r1
	strh r0, [r6, 0x26]
	ldrh r0, [r6, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r6, 0x3C]
_080D565A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D52AC

	thumb_func_start sub_80D5324
sub_80D5324: @ 80D5660
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D5348
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080D567C
	adds r0, r4, 0
	bl move_anim_8072740
_080D567C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5324

	thumb_func_start sub_80D5348
sub_80D5348: @ 80D5684
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x1C
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x14
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5348

	thumb_func_start sub_80D5374
sub_80D5374: @ 80D56B0
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080D56E4
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
	ldr r1, _080D56E8
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080D56EC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D56E4: .4byte gUnknown_03004B00
_080D56E8: .4byte move_anim_8072740
_080D56EC: .4byte sub_8078364
	thumb_func_end sub_80D5374

	thumb_func_start sub_80D53B4
sub_80D53B4: @ 80D56F0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080D5724
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080D5728
	str r0, [r4, 0x1C]
	ldr r1, _080D572C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5724: .4byte gUnknown_03004B00
_080D5728: .4byte sub_80782D8
_080D572C: .4byte sub_80D53F4
	thumb_func_end sub_80D53B4

	thumb_func_start sub_80D53F4
sub_80D53F4: @ 80D5730
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r3]
	ldrh r1, [r0, 0x30]
	movs r2, 0
	strh r1, [r0, 0x2E]
	strh r2, [r0, 0x30]
	ldr r1, _080D5754
	str r1, [r0, 0x1C]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080D5754: .4byte sub_80D541C
	thumb_func_end sub_80D53F4

	thumb_func_start sub_80D541C
sub_80D541C: @ 80D5758
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0xA
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	adds r0, 0xD0
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D57A4
	adds r0, r4, 0
	bl move_anim_8072740
_080D57A4:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D541C

	thumb_func_start sub_80D5470
sub_80D5470: @ 80D57AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080D580C
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	ldr r2, _080D5810
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x22]
	strh r0, [r4, 0x10]
	ldr r0, _080D5814
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	strh r5, [r4, 0x14]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_8078E70
	ldr r0, _080D5818
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D580C: .4byte gTasks
_080D5810: .4byte gSprites
_080D5814: .4byte gUnknown_0202F7C8
_080D5818: .4byte sub_80D54E0
	thumb_func_end sub_80D5470

	thumb_func_start sub_80D54E0
sub_80D54E0: @ 80D581C
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080D5844
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bls _080D5838
	b _080D5AF6
_080D5838:
	lsls r0, 2
	ldr r1, _080D5848
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D5844: .4byte gTasks
_080D5848: .4byte _080D584C
	.align 2, 0
_080D584C:
	.4byte _080D5868
	.4byte _080D588E
	.4byte _080D5940
	.4byte _080D59A0
	.4byte _080D59BE
	.4byte _080D5A94
	.4byte _080D5AE8
_080D5868:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0xE0
	str r0, [sp]
	movs r0, 0x80
	lsls r0, 2
	str r0, [sp, 0x4]
	movs r0, 0x20
	str r0, [sp, 0x8]
	adds r0, r4, 0
	adds r2, r3, 0
	bl sub_8079C08
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080D588E:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D58D6
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D58C4
	ldr r2, _080D58C0
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3
	b _080D58D4
	.align 2, 0
_080D58C0: .4byte gSprites
_080D58C4:
	ldr r2, _080D5938
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _080D593C
_080D58D4:
	strh r1, [r0, 0x24]
_080D58D6:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D5904
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D5904
	movs r0, 0
	strh r0, [r4, 0xE]
	ldr r2, _080D5938
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x1
	strh r1, [r0, 0x22]
_080D5904:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	beq _080D5914
	b _080D5AF6
_080D5914:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldr r2, _080D5938
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r5, [r0, 0x24]
	strh r5, [r4, 0xA]
	strh r5, [r4, 0xC]
	strh r5, [r4, 0xE]
	b _080D5ADC
	.align 2, 0
_080D5938: .4byte gSprites
_080D593C: .4byte 0x0000fffd
_080D5940:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bgt _080D5950
	b _080D5AF6
_080D5950:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D597A
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xF0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_8079C08
	b _080D599A
_080D597A:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0x80
	lsls r3, 2
	movs r0, 0xC0
	lsls r0, 1
	str r0, [sp]
	movs r0, 0xC0
	str r0, [sp, 0x4]
	movs r0, 0x6
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r2, 0xE0
	bl sub_8079C08
_080D599A:
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080D5ADC
_080D59A0:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	cmp r0, 0
	beq _080D59AE
	b _080D5AF6
_080D59AE:
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r5, 0
	movs r2, 0x6
	bl sub_80D57C4
	b _080D5ADC
_080D59BE:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D5A0C
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D59F8
	ldr r2, _080D59F4
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	adds r1, 0x3
	b _080D5A0A
	.align 2, 0
_080D59F4: .4byte gSprites
_080D59F8:
	ldr r2, _080D5A44
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
_080D5A0A:
	strh r1, [r0, 0x26]
_080D5A0C:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _080D5AF6
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D5A48
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xF0
	bl sub_8079C08
	b _080D5A66
	.align 2, 0
_080D5A44: .4byte gSprites
_080D5A48:
	ldrh r1, [r4, 0x26]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0xC0
	lsls r2, 1
	movs r0, 0x80
	lsls r0, 1
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x8
	str r0, [sp, 0x8]
	adds r0, r4, 0
	movs r3, 0xC0
	bl sub_8079C08
_080D5A66:
	ldrh r1, [r4, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5A84
	ldr r2, _080D5A90
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x3
	strh r1, [r0, 0x26]
_080D5A84:
	movs r0, 0
	strh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
	strh r0, [r4, 0xE]
	b _080D5ADC
	.align 2, 0
_080D5A90: .4byte gSprites
_080D5A94:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D5AB0
	ldr r2, _080D5AE4
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x1
	strh r1, [r0, 0x22]
_080D5AB0:
	adds r0, r4, 0
	bl sub_8079C74
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080D5AF6
	ldr r2, _080D5AE4
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x10]
	strh r1, [r0, 0x22]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	strh r5, [r4, 0xC]
_080D5ADC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D5AF6
	.align 2, 0
_080D5AE4: .4byte gSprites
_080D5AE8:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D5AF6
	adds r0, r5, 0
	bl move_anim_task_del
_080D5AF6:
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D54E0

	thumb_func_start sub_80D57C4
sub_80D57C4: @ 80D5B00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r4, 0
	bl sub_80D5940
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldr r1, _080D5B50
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrh r4, [r0, 0x20]
	ldr r0, _080D5B54
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D5B58
	adds r0, r4, 0
	subs r0, 0xC
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x1
	b _080D5B62
	.align 2, 0
_080D5B50: .4byte gSprites
_080D5B54: .4byte gUnknown_0202F7C8
_080D5B58:
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xFF
_080D5B62:
	movs r6, 0
	movs r5, 0
	lsls r4, 16
	str r4, [sp, 0x8]
	mov r1, r9
	lsls r1, 16
	str r1, [sp, 0x4]
	ldr r2, _080D5C1C
	mov r9, r2
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r3, r8
	lsls r3, 1
	mov r10, r3
_080D5B80:
	ldr r0, _080D5C20
	ldr r2, [sp, 0x8]
	asrs r1, r2, 16
	ldr r3, [sp, 0x4]
	asrs r2, r3, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D5C02
	ldr r1, _080D5C24
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r1
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	lsls r0, r5, 2
	adds r0, 0x40
	adds r1, r0
	ldr r3, _080D5C28
	adds r0, r3, 0
	ands r1, r0
	ldr r3, _080D5C2C
	adds r0, r3, 0
	ands r2, r0
	orrs r2, r1
	strh r2, [r4, 0x4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x4
	bls _080D5BCA
	movs r5, 0
_080D5BCA:
	lsls r2, r6, 2
	mov r1, r9
	adds r0, r2, r1
	ldrh r0, [r0]
	ldr r3, [sp]
	adds r1, r0, 0
	muls r1, r3
	lsls r1, 16
	asrs r1, 16
	ldr r0, _080D5C30
	adds r2, r0
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r0, r4, 0
	bl sub_80D5994
	strh r7, [r4, 0x3A]
	mov r0, r8
	strh r0, [r4, 0x3C]
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	add r0, r10
	ldr r1, _080D5C34
	adds r0, r1
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
_080D5C02:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x6
	bls _080D5B80
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D5C1C: .4byte gUnknown_083D96DC
_080D5C20: .4byte gSpriteTemplate_83D96C4
_080D5C24: .4byte gSprites
_080D5C28: .4byte 0x000003ff
_080D5C2C: .4byte 0xfffffc00
_080D5C30: .4byte 0x083e56e2
_080D5C34: .4byte 0x03004b38
	thumb_func_end sub_80D57C4

	thumb_func_start sub_80D58FC
sub_80D58FC: @ 80D5C38
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80D59B0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080D5C72
	ldr r3, _080D5C78
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080D5C72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D5C78: .4byte gTasks
	thumb_func_end sub_80D58FC

	thumb_func_start sub_80D5940
sub_80D5940: @ 80D5C7C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080D5CB4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x26]
	ldrh r0, [r1, 0x22]
	adds r2, r0
	adds r1, 0x29
	movs r0, 0
	ldrsb r0, [r1, r0]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080D5CB8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D5CBC
	lsls r0, r4, 16
	movs r1, 0x94
	lsls r1, 15
	b _080D5CC2
	.align 2, 0
_080D5CB4: .4byte gSprites
_080D5CB8: .4byte gUnknown_0202F7C8
_080D5CBC:
	lsls r0, r4, 16
	movs r1, 0xB0
	lsls r1, 14
_080D5CC2:
	adds r0, r1
	lsrs r4, r0, 16
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80D5940

	thumb_func_start sub_80D5994
sub_80D5994: @ 80D5CD0
	movs r3, 0
	strh r3, [r0, 0x2E]
	strh r3, [r0, 0x30]
	ldrh r3, [r0, 0x20]
	lsls r3, 3
	strh r3, [r0, 0x32]
	ldrh r3, [r0, 0x22]
	lsls r3, 3
	strh r3, [r0, 0x34]
	lsls r1, 3
	strh r1, [r0, 0x36]
	lsls r2, 3
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_80D5994

	thumb_func_start sub_80D59B0
sub_80D59B0: @ 80D5CEC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D5D16
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r3, [r2, 0x34]
	adds r0, r3
	strh r0, [r2, 0x34]
_080D5D16:
	ldrh r0, [r2, 0x36]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r1, 16
	asrs r3, r1, 19
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D5D4C
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D5D4C
	cmp r1, 0x78
	ble _080D5D58
_080D5D4C:
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080D5D58:
	pop {r0}
	bx r0
	thumb_func_end sub_80D59B0

	thumb_func_start sub_80D5A20
sub_80D5A20: @ 80D5D5C
	push {r4,r5,lr}
	ldr r3, _080D5DA0
	ldrh r1, [r3]
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r3, 0x2]
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x2E]
	strh r2, [r0, 0x30]
	strh r2, [r0, 0x32]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0x3A]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x3C]
	ldrh r4, [r0, 0x4]
	lsls r2, r4, 22
	lsrs r2, 22
	movs r5, 0x8
	ldrsh r1, [r3, r5]
	lsls r1, 4
	adds r2, r1
	ldr r3, _080D5DA4
	adds r1, r3, 0
	ands r2, r1
	ldr r1, _080D5DA8
	ands r1, r4
	orrs r1, r2
	strh r1, [r0, 0x4]
	ldr r1, _080D5DAC
	str r1, [r0, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5DA0: .4byte gUnknown_03004B00
_080D5DA4: .4byte 0x000003ff
_080D5DA8: .4byte 0xfffffc00
_080D5DAC: .4byte sub_80D5A74
	thumb_func_end sub_80D5A20

	thumb_func_start sub_80D5A74
sub_80D5A74: @ 80D5DB0
	push {r4,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080D5DE2
	cmp r0, 0x1
	bgt _080D5DC6
	cmp r0, 0
	beq _080D5DCC
	b _080D5E40
_080D5DC6:
	cmp r0, 0x2
	beq _080D5E00
	b _080D5E40
_080D5DCC:
	ldrh r1, [r2, 0x3A]
	movs r3, 0x3A
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080D5DDC
	subs r0, r1, 0x1
	strh r0, [r2, 0x3A]
	b _080D5E40
_080D5DDC:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_080D5DE2:
	ldrh r0, [r2, 0x22]
	adds r0, 0x8
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	ldrh r3, [r2, 0x3C]
	movs r4, 0x3C
	ldrsh r1, [r2, r4]
	cmp r0, r1
	blt _080D5E40
	strh r3, [r2, 0x22]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _080D5E40
_080D5E00:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D5E2C
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x32]
	adds r0, 0x1
	strh r0, [r2, 0x32]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D5E28
	ldr r0, _080D5E24
	b _080D5E2A
	.align 2, 0
_080D5E24: .4byte 0x0000fffd
_080D5E28:
	movs r0, 0x3
_080D5E2A:
	strh r0, [r2, 0x26]
_080D5E2C:
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _080D5E40
	adds r0, r2, 0
	bl move_anim_8072740
_080D5E40:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5A74

	thumb_func_start sub_80D5B0C
sub_80D5B0C: @ 80D5E48
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D5EBC
	cmp r0, 0x1
	bgt _080D5E5E
	cmp r0, 0
	beq _080D5E64
	b _080D5F8A
_080D5E5E:
	cmp r0, 0x2
	beq _080D5F1A
	b _080D5F8A
_080D5E64:
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
	ldr r4, _080D5E8C
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x3C]
	ldr r0, _080D5E90
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D5E94
	movs r0, 0x4
	b _080D5E96
	.align 2, 0
_080D5E8C: .4byte gUnknown_03004B00
_080D5E90: .4byte gUnknown_0202F7C8
_080D5E94:
	ldr r0, _080D5EB4
_080D5E96:
	strh r0, [r5, 0x36]
	ldr r0, _080D5EB8
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080D5F12
	.align 2, 0
_080D5EB4: .4byte 0x0000fffc
_080D5EB8: .4byte gUnknown_0202F7C9
_080D5EBC:
	ldrh r0, [r5, 0x30]
	adds r0, 0xC0
	strh r0, [r5, 0x30]
	ldr r0, _080D5EDC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D5EE0
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	b _080D5EE6
	.align 2, 0
_080D5EDC: .4byte gUnknown_0202F7C8
_080D5EE0:
	ldrh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 24
_080D5EE6:
	strh r0, [r5, 0x26]
	movs r2, 0x32
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080D5F8A
	movs r0, 0
	strh r0, [r5, 0x34]
_080D5F12:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080D5F8A
_080D5F1A:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	bl Sin
	adds r2, r0, 0
	movs r3, 0
	strh r2, [r5, 0x24]
	ldrh r0, [r5, 0x32]
	adds r0, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x34]
	adds r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080D5F8A
	ldrh r0, [r5, 0x20]
	adds r1, r2, r0
	strh r1, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r3, [r5, 0x26]
	strh r3, [r5, 0x24]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0x2E]
	strh r1, [r5, 0x30]
	ldr r4, _080D5F90
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078BD4
	ldr r0, _080D5F94
	str r0, [r5, 0x1C]
_080D5F8A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D5F90: .4byte gUnknown_0202F7C9
_080D5F94: .4byte sub_80D5C5C
	thumb_func_end sub_80D5B0C

	thumb_func_start sub_80D5C5C
sub_80D5C5C: @ 80D5F98
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D5FF0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x4
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080D5FCE
	cmp r2, 0xC4
	ble _080D5FF6
_080D5FCE:
	lsls r0, 16
	cmp r0, 0
	ble _080D5FF6
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D5FF6
	ldr r0, _080D5FEC
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x90
	bl PlaySE12WithPanning
	b _080D5FF6
	.align 2, 0
_080D5FEC: .4byte gUnknown_0202F7D2
_080D5FF0:
	adds r0, r4, 0
	bl move_anim_8072740
_080D5FF6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5C5C

	thumb_func_start sub_80D5CC0
sub_80D5CC0: @ 80D5FFC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080D6014
	ldr r0, _080D6088
	ldrh r0, [r0]
	strh r0, [r4, 0x30]
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
_080D6014:
	movs r0, 0xC0
	lsls r0, 1
	adds r1, r0, 0
	ldrh r2, [r4, 0x34]
	adds r1, r2
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x36]
	adds r0, 0xA0
	strh r0, [r4, 0x36]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 24
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, 0x36]
	lsls r1, 16
	asrs r1, 24
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r2, r0, 0x7
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r4, 0x30]
	ldr r0, _080D608C
	ldr r1, _080D6090
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D60C0
	adds r0, r2, 0
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080D6098
	ldr r0, _080D6094
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080D60DC
	.align 2, 0
_080D6088: .4byte gUnknown_03004B00
_080D608C: .4byte gMain
_080D6090: .4byte 0x0000043d
_080D6094: .4byte gUnknown_0202F7C9
_080D6098:
	ldr r0, _080D60BC
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080D60DC
	.align 2, 0
_080D60BC: .4byte gUnknown_0202F7C9
_080D60C0:
	adds r0, r2, 0
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x83
	bls _080D60D4
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1D
	b _080D60DA
_080D60D4:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1F
_080D60DA:
	strb r0, [r1]
_080D60DC:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080D6104
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
_080D6104:
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r0, 0x1E
	bne _080D6112
	adds r0, r4, 0
	bl move_anim_8072740
_080D6112:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D5CC0

	thumb_func_start sub_80D5DDC
sub_80D5DDC: @ 80D6118
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D6178
	adds r4, r1, r0
	ldr r0, _080D617C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D613E
	movs r1, 0x1
_080D613E:
	strh r1, [r4, 0x20]
	ldr r0, _080D6180
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	strh r0, [r4, 0x22]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r0, 0x3
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x26]
	ldr r0, _080D6184
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D6178: .4byte gTasks
_080D617C: .4byte gUnknown_0202F7C8
_080D6180: .4byte gUnknown_0202F7C9
_080D6184: .4byte sub_80D5E4C
	thumb_func_end sub_80D5DDC

	thumb_func_start sub_80D5E4C
sub_80D5E4C: @ 80D6188
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D61AC
	adds r2, r0, r1
	movs r0, 0x8
	ldrsh r3, [r2, r0]
	cmp r3, 0x1
	beq _080D6250
	cmp r3, 0x1
	bgt _080D61B0
	cmp r3, 0
	beq _080D61BE
	b _080D63B0
	.align 2, 0
_080D61AC: .4byte gTasks
_080D61B0:
	cmp r3, 0x2
	bne _080D61B6
	b _080D62D8
_080D61B6:
	cmp r3, 0x3
	bne _080D61BC
	b _080D636C
_080D61BC:
	b _080D63B0
_080D61BE:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	lsls r0, 1
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D61F0
	strh r3, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D61EC
	movs r0, 0x2
	b _080D61EE
_080D61EC:
	ldr r0, _080D6248
_080D61EE:
	strh r0, [r2, 0x1E]
_080D61F0:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080D6232
	ldr r4, _080D624C
	adds r3, r2, 0
	adds r3, 0x8
_080D6202:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080D6202
_080D6232:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080D6242
	b _080D63B0
_080D6242:
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080D635C
	.align 2, 0
_080D6248: .4byte 0x0000fffe
_080D624C: .4byte gSprites
_080D6250:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D6278
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	ands r0, r3
	lsls r0, 16
	cmp r0, 0
	beq _080D6274
	movs r0, 0x2
	b _080D6276
_080D6274:
	ldr r0, _080D62D0
_080D6276:
	strh r0, [r2, 0x1E]
_080D6278:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r7, 0x22
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080D62BA
	ldr r4, _080D62D4
	adds r3, r2, 0
	adds r3, 0x8
_080D628A:
	movs r1, 0xE
	ldrsh r0, [r2, r1]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r5, 0
	ldrsh r0, [r0, r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r7, [r2, 0x1C]
	adds r0, r7
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r5, 0x22
	ldrsh r1, [r2, r5]
	cmp r0, r1
	blt _080D628A
_080D62BA:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x60
	bne _080D63B0
	movs r0, 0
	strh r0, [r2, 0x1A]
	b _080D635C
	.align 2, 0
_080D62D0: .4byte 0x0000fffe
_080D62D4: .4byte gSprites
_080D62D8:
	movs r7, 0x20
	ldrsh r1, [r2, r7]
	lsls r1, 1
	ldrh r0, [r2, 0x1C]
	subs r0, r1
	strh r0, [r2, 0x1C]
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D630C
	movs r0, 0
	strh r0, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D6308
	strh r3, [r2, 0x1E]
	b _080D630C
_080D6308:
	ldr r0, _080D6364
	strh r0, [r2, 0x1E]
_080D630C:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080D634E
	ldr r4, _080D6368
	adds r3, r2, 0
	adds r3, 0x8
_080D631E:
	movs r5, 0xE
	ldrsh r0, [r2, r5]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r0, [r0, r7]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r0, [r2, 0x1E]
	ldrh r5, [r2, 0x1C]
	adds r0, r5
	strh r0, [r1, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080D631E
_080D634E:
	ldrh r0, [r2, 0x1A]
	adds r0, 0x1
	strh r0, [r2, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080D63B0
_080D635C:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080D63B0
	.align 2, 0
_080D6364: .4byte 0x0000fffe
_080D6368: .4byte gSprites
_080D636C:
	movs r1, 0
	strh r1, [r2, 0xE]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bge _080D63AA
	ldr r6, _080D63B8
	adds r3, r2, 0
	adds r3, 0x8
	movs r5, 0
_080D6380:
	movs r7, 0xE
	ldrsh r0, [r2, r7]
	adds r0, 0xE
	lsls r0, 1
	adds r0, r3, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x24]
	ldrh r0, [r2, 0xE]
	adds r0, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	asrs r0, 16
	movs r7, 0x22
	ldrsh r1, [r2, r7]
	cmp r0, r1
	blt _080D6380
_080D63AA:
	adds r0, r4, 0
	bl move_anim_task_del
_080D63B0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D63B8: .4byte gSprites
	thumb_func_end sub_80D5E4C

	thumb_func_start sub_80D6080
sub_80D6080: @ 80D63BC
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r0, sp
	bl sub_8078914
	mov r0, sp
	ldrb r0, [r0, 0x8]
	lsls r0, 4
	ldr r1, _080D63EC
	ldrb r2, [r1]
	ldrh r3, [r1, 0x2]
	movs r1, 0x10
	bl BlendPalette
	adds r0, r4, 0
	bl move_anim_task_del
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D63EC: .4byte gUnknown_03004B00
	thumb_func_end sub_80D6080

	thumb_func_start sub_80D60B4
sub_80D60B4: @ 80D63F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080D6448
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x8
	ldrsh r0, [r2, r3]
	mov r9, r1
	ldr r4, _080D644C
	mov r8, r4
	cmp r0, 0
	bne _080D6426
	ldrh r0, [r4]
	strh r0, [r2, 0xA]
	ldrh r0, [r4, 0x2]
	strh r0, [r2, 0xC]
	ldrh r0, [r4, 0x4]
	strh r0, [r2, 0xE]
	ldrh r0, [r4, 0x6]
	strh r0, [r2, 0x10]
_080D6426:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _080D6450
	ldr r0, _080D6454
	ldrb r0, [r0]
	adds r0, r1
	ldrb r6, [r0]
	movs r5, 0x10
	ldrsh r0, [r2, r5]
	cmp r0, 0
	bne _080D645C
	ldr r4, _080D6458
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	b _080D6462
	.align 2, 0
_080D6448: .4byte gTasks
_080D644C: .4byte gUnknown_03004B00
_080D6450: .4byte gUnknown_02024BE0
_080D6454: .4byte gUnknown_0202F7C9
_080D6458: .4byte gUnknown_083D9794
_080D645C:
	ldr r4, _080D64A8
	movs r3, 0x8
	ldrsh r0, [r2, r3]
_080D6462:
	movs r1, 0xA
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	adds r0, r4
	ldrb r5, [r0]
	lsls r0, r7, 2
	adds r1, r0, r7
	lsls r1, 3
	add r1, r9
	movs r4, 0xE
	ldrsh r1, [r1, r4]
	mov r12, r0
	cmp r1, 0x1
	bne _080D64B0
	ldr r2, _080D64AC
	lsls r3, r6, 4
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	mov r10, r0
	mov r0, r8
	movs r4, 0x2
	ldrsh r1, [r0, r4]
	lsls r0, r5, 24
	asrs r0, 24
	muls r0, r1
	cmp r0, 0
	bge _080D64A0
	negs r0, r0
_080D64A0:
	mov r5, r10
	strh r0, [r5, 0x26]
	b _080D64CA
	.align 2, 0
_080D64A8: .4byte gUnknown_083D97A4
_080D64AC: .4byte gSprites
_080D64B0:
	ldr r3, _080D6500
	lsls r4, r6, 4
	adds r2, r4, r6
	lsls r2, 2
	adds r2, r3
	lsls r0, r5, 24
	asrs r0, 24
	mov r5, r8
	ldrh r1, [r5, 0x2]
	muls r0, r1
	strh r0, [r2, 0x24]
	adds r2, r3, 0
	adds r3, r4, 0
_080D64CA:
	mov r1, r12
	adds r0, r1, r7
	lsls r0, 3
	add r0, r9
	movs r4, 0x8
	ldrsh r1, [r0, r4]
	movs r5, 0xA
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _080D64F0
	adds r0, r3, r6
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r7, 0
	bl move_anim_task_del
_080D64F0:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6500: .4byte gSprites
	thumb_func_end sub_80D60B4

	thumb_func_start sub_80D61C8
sub_80D61C8: @ 80D6504
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D6524
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D652C
	ldr r0, _080D6528
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080D6538
	.align 2, 0
_080D6524: .4byte gUnknown_0202F7C8
_080D6528: .4byte gUnknown_03004B00
_080D652C:
	ldr r1, _080D654C
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080D6538:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080D6550
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D654C: .4byte gUnknown_03004B00
_080D6550: .4byte sub_80D6218
	thumb_func_end sub_80D61C8

	thumb_func_start sub_80D6218
sub_80D6218: @ 80D6554
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D656A
	adds r0, r2, 0
	bl move_anim_8072740
_080D656A:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6218

	thumb_func_start sub_80D6234
sub_80D6234: @ 80D6570
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D6590
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D6598
	ldr r0, _080D6594
	ldrh r1, [r4, 0x20]
	ldrh r0, [r0]
	subs r1, r0
	strh r1, [r4, 0x20]
	b _080D65A2
	.align 2, 0
_080D6590: .4byte gUnknown_0202F7C8
_080D6594: .4byte gUnknown_03004B00
_080D6598:
	ldr r0, _080D65AC
	ldrh r0, [r0]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_080D65A2:
	ldr r0, _080D65B0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D65AC: .4byte gUnknown_03004B00
_080D65B0: .4byte sub_80D6278
	thumb_func_end sub_80D6234

	thumb_func_start sub_80D6278
sub_80D6278: @ 80D65B4
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D65CA
	adds r0, r2, 0
	bl move_anim_8074EE0
_080D65CA:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6278

	thumb_func_start sub_80D6294
sub_80D6294: @ 80D65D0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D6614
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D6618
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D6620
	ldr r2, _080D661C
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x22]
	b _080D6634
	.align 2, 0
_080D6614: .4byte gUnknown_0202F7C9
_080D6618: .4byte gUnknown_0202F7C8
_080D661C: .4byte gUnknown_03004B00
_080D6620:
	ldr r0, _080D6658
	ldrh r1, [r0]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r2, [r5, 0x22]
	adds r1, r2
	strh r1, [r5, 0x22]
	adds r2, r0, 0
_080D6634:
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x30]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x34]
	ldr r1, _080D665C
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080D6660
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6658: .4byte gUnknown_03004B00
_080D665C: .4byte move_anim_8074EE0
_080D6660: .4byte sub_8078114
	thumb_func_end sub_80D6294

	thumb_func_start sub_80D6328
sub_80D6328: @ 80D6664
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080D667C
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	beq _080D66DC
	cmp r0, 0x1
	bgt _080D6680
	cmp r0, 0
	beq _080D668A
	b _080D66DC
	.align 2, 0
_080D667C: .4byte gUnknown_03004B00
_080D6680:
	cmp r0, 0x2
	beq _080D6694
	cmp r0, 0x3
	beq _080D66B8
	b _080D66DC
_080D668A:
	ldr r0, _080D6690
	b _080D66DE
	.align 2, 0
_080D6690: .4byte gUnknown_0202F7C8
_080D6694:
	ldr r4, _080D66AC
	ldrb r0, [r4]
	movs r6, 0x2
	eors r0, r6
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080D66B0
	ldrb r4, [r4]
	b _080D66E0
	.align 2, 0
_080D66AC: .4byte gUnknown_0202F7C8
_080D66B0:
	ldrb r0, [r4]
	adds r4, r6, 0
	eors r4, r0
	b _080D66E0
_080D66B8:
	ldr r0, _080D66D4
	ldrb r0, [r0]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080D66DC
	ldr r0, _080D66D8
	ldrb r0, [r0]
	eors r4, r0
	b _080D66E0
	.align 2, 0
_080D66D4: .4byte gUnknown_0202F7C8
_080D66D8: .4byte gUnknown_0202F7C9
_080D66DC:
	ldr r0, _080D6700
_080D66DE:
	ldrb r4, [r0]
_080D66E0:
	ldr r0, _080D6704
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080D6708
	adds r0, r4, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x1
	b _080D671A
	.align 2, 0
_080D6700: .4byte gUnknown_0202F7C9
_080D6704: .4byte gUnknown_03004B00
_080D6708:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	movs r1, 0x3
_080D671A:
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r7, _080D67B8
	ldr r6, _080D67BC
	movs r1, 0
	ldrsh r0, [r6, r1]
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r7
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r2, 0x2
	ldrsh r0, [r6, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x26]
	ldrh r1, [r6, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D677E
	adds r0, r4, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x5]
_080D677E:
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r0, 0x4
	ldrsh r1, [r6, r0]
	lsls r0, r1, 1
	adds r0, r7
	ldrh r0, [r0]
	ldr r3, _080D67C0
	lsls r2, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r7
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldrh r0, [r6, 0x6]
	strh r0, [r5, 0x2E]
	ldr r0, _080D67C4
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D67B8: .4byte gSineTable
_080D67BC: .4byte gUnknown_03004B00
_080D67C0: .4byte gOamMatrices
_080D67C4: .4byte sub_80DA48C
	thumb_func_end sub_80D6328

	thumb_func_start sub_80D648C
sub_80D648C: @ 80D67C8
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080D683C
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r6, _080D6840
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x38]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x3A]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x3C]
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D6844
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D6848
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	ldr r1, _080D684C
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D683C: .4byte gUnknown_03004B00
_080D6840: .4byte gUnknown_0202F7C9
_080D6844: .4byte 0x000003ff
_080D6848: .4byte 0xfffffc00
_080D684C: .4byte sub_80D6514
	thumb_func_end sub_80D648C

	thumb_func_start sub_80D6514
sub_80D6514: @ 80D6850
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D68BA
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _080D68C0
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
	b _080D68C0
_080D68BA:
	adds r0, r4, 0
	bl move_anim_8072740
_080D68C0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D6514

	thumb_func_start sub_80D658C
sub_80D658C: @ 80D68C8
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x38]
	subs r0, 0x1
	strh r0, [r3, 0x38]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D6900
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x36]
	strh r0, [r3, 0x38]
_080D6900:
	ldrh r0, [r3, 0x34]
	subs r1, r0, 0x1
	strh r1, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080D6912
	adds r0, r3, 0
	bl move_anim_8072740
_080D6912:
	pop {r0}
	bx r0
	thumb_func_end sub_80D658C

	thumb_func_start sub_80D65DC
sub_80D65DC: @ 80D6918
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080D6980
	ldr r1, _080D6984
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D693A
	ldr r0, _080D6988
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D6942
_080D693A:
	ldr r1, _080D698C
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080D6942:
	ldr r5, _080D6988
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D698C
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4]
	strh r0, [r6, 0x34]
	ldrh r0, [r4, 0x6]
	strh r0, [r6, 0x36]
	strh r0, [r6, 0x38]
	ldr r0, _080D6990
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6980: .4byte gMain
_080D6984: .4byte 0x0000043d
_080D6988: .4byte gUnknown_0202F7C9
_080D698C: .4byte gUnknown_03004B00
_080D6990: .4byte sub_80D658C
	thumb_func_end sub_80D65DC

	thumb_func_start sub_80D6658
sub_80D6658: @ 80D6994
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r1, _080D69B0
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080D69B8
	ldr r0, _080D69B4
	b _080D69BA
	.align 2, 0
_080D69B0: .4byte gUnknown_03004B00
_080D69B4: .4byte gUnknown_0202F7C9
_080D69B8:
	ldr r0, _080D6A48
_080D69BA:
	ldrb r6, [r0]
	ldr r0, _080D6A4C
	ldr r3, _080D6A50
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D69D8
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D69E0
_080D69D8:
	ldr r1, _080D6A54
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080D69E0:
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080D6A54
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r5, 0x20]
	adds r0, r6, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x2]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r1, [r4, 0xE]
	ldr r0, _080D6A58
	ands r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x3C]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D6A5C
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D6A60
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r1, _080D6A64
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6A48: .4byte gUnknown_0202F7C8
_080D6A4C: .4byte gMain
_080D6A50: .4byte 0x0000043d
_080D6A54: .4byte gUnknown_03004B00
_080D6A58: .4byte 0x00007fff
_080D6A5C: .4byte 0x000003ff
_080D6A60: .4byte 0xfffffc00
_080D6A64: .4byte sub_80D672C
	thumb_func_end sub_80D6658

	thumb_func_start sub_80D672C
sub_80D672C: @ 80D6A68
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _080D6ABE
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
_080D6ABE:
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080D6AD0
	adds r0, r4, 0
	bl move_anim_8072740
_080D6AD0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D672C

	thumb_func_start sub_80D679C
sub_80D679C: @ 80D6AD8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8078764
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080D6B14
	movs r5, 0x6
	ldrsh r0, [r3, r5]
	lsls r0, 2
	adds r1, r0
	ldr r5, _080D6B18
	adds r0, r5, 0
	ands r1, r0
	ldr r0, _080D6B1C
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x6
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	bne _080D6B20
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	b _080D6B2E
	.align 2, 0
_080D6B14: .4byte gUnknown_03004B00
_080D6B18: .4byte 0x000003ff
_080D6B1C: .4byte 0xfffffc00
_080D6B20:
	cmp r0, 0x2
	bne _080D6B32
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x20
_080D6B2E:
	orrs r1, r0
	strb r1, [r4, 0x3]
_080D6B32:
	ldr r0, _080D6B4C
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080D6B50
	str r0, [r4, 0x1C]
	ldr r1, _080D6B54
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6B4C: .4byte gUnknown_03004B00
_080D6B50: .4byte sub_80782D8
_080D6B54: .4byte move_anim_8072740
	thumb_func_end sub_80D679C

	thumb_func_start sub_80D681C
sub_80D681C: @ 80D6B58
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _080D6BA0
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	ldr r1, _080D6BA4
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r1
	lsls r0, 24
	ldr r5, _080D6BA8
	lsrs r0, 24
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x8]
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldr r0, _080D6BAC
	str r0, [r4]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D6BA0: .4byte gUnknown_0202F7C9
_080D6BA4: .4byte gTasks
_080D6BA8: .4byte gUnknown_03004B00
_080D6BAC: .4byte sub_80D6874
	thumb_func_end sub_80D681C

	thumb_func_start sub_80D6874
sub_80D6874: @ 80D6BB0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r5, 0
	movs r7, 0
	ldr r1, _080D6BF0
	lsls r0, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldrb r2, [r0, 0xC]
	str r2, [sp]
	ldrh r4, [r0, 0x8]
	ldrh r6, [r0, 0xA]
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0
	bne _080D6BF4
	movs r0, 0
	mov r8, r0
	movs r2, 0x1
	movs r1, 0x10
	mov r12, r1
	b _080D6BFE
	.align 2, 0
_080D6BF0: .4byte gTasks
_080D6BF4:
	movs r2, 0x10
	mov r12, r2
	movs r3, 0x8
	mov r8, r3
	movs r2, 0x4
_080D6BFE:
	mov r0, r9
	lsls r1, r0, 2
	adds r0, r1, r0
	lsls r0, 3
	add r0, r10
	movs r3, 0x1C
	ldrsh r0, [r0, r3]
	mov r10, r1
	cmp r0, 0xA
	bhi _080D6CF4
	lsls r0, 2
	ldr r1, _080D6C1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D6C1C: .4byte _080D6C20
	.align 2, 0
_080D6C20:
	.4byte _080D6C4C
	.4byte _080D6CF4
	.4byte _080D6C60
	.4byte _080D6CF4
	.4byte _080D6C80
	.4byte _080D6CF4
	.4byte _080D6C96
	.4byte _080D6CF4
	.4byte _080D6CB8
	.4byte _080D6CF4
	.4byte _080D6CEC
_080D6C4C:
	ldr r0, _080D6C5C
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	mov r4, r12
	lsls r3, r4, 16
	b _080D6CCE
	.align 2, 0
_080D6C5C: .4byte gSpriteTemplate_83D9938
_080D6C60:
	mov r0, r12
	lsls r3, r0, 17
	mov r1, r8
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080D6C7C
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080D6CCE
	.align 2, 0
_080D6C7C: .4byte gSpriteTemplate_83D9938
_080D6C80:
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	lsls r3, r0, 1
	adds r3, r0
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	b _080D6CC2
_080D6C96:
	mov r0, r12
	lsls r3, r0, 18
	lsls r0, r2, 1
	adds r0, r2
	add r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _080D6CB4
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	b _080D6CCE
	.align 2, 0
_080D6CB4: .4byte gSpriteTemplate_83D9938
_080D6CB8:
	mov r1, r12
	lsls r0, r1, 16
	asrs r0, 16
	lsls r3, r0, 2
	adds r3, r0
_080D6CC2:
	ldr r0, _080D6CE8
	lsls r1, r4, 16
	asrs r1, 16
	lsls r2, r6, 16
	asrs r2, 16
	lsls r3, 16
_080D6CCE:
	asrs r3, 16
	adds r2, r3
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	b _080D6CF4
	.align 2, 0
_080D6CE8: .4byte gSpriteTemplate_83D9938
_080D6CEC:
	mov r0, r9
	bl move_anim_task_del
	b _080D6D38
_080D6CF4:
	cmp r7, 0
	beq _080D6D28
	ldr r4, _080D6D48
	lsls r3, r5, 4
	adds r3, r5
	lsls r3, 2
	adds r0, r3, r4
	ldrh r5, [r0, 0x4]
	lsls r2, r5, 22
	lsrs r2, 22
	add r2, r8
	ldr r6, _080D6D4C
	adds r1, r6, 0
	ands r2, r1
	ldr r1, _080D6D50
	ands r1, r5
	orrs r1, r2
	strh r1, [r0, 0x4]
	mov r1, sp
	ldrh r1, [r1]
	strh r1, [r0, 0x2E]
	adds r4, 0x1C
	adds r3, r4
	ldr r1, [r3]
	bl _call_via_r1
_080D6D28:
	ldr r0, _080D6D54
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
_080D6D38:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6D48: .4byte gSprites
_080D6D4C: .4byte 0x000003ff
_080D6D50: .4byte 0xfffffc00
_080D6D54: .4byte gTasks
	thumb_func_end sub_80D6874

	thumb_func_start sub_80D6A1C
sub_80D6A1C: @ 80D6D58
	push {lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080D6D7A
	ldrb r1, [r3, 0x1]
	movs r2, 0x3F
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r2, r0
	strb r2, [r3, 0x3]
	b _080D6D8E
_080D6D7A:
	ldrb r2, [r3, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3, 0x1]
	ldrb r0, [r3, 0x3]
	ands r1, r0
	movs r0, 0x40
	orrs r1, r0
	strb r1, [r3, 0x3]
_080D6D8E:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bne _080D6DA2
	adds r0, r3, 0
	bl DestroySprite
_080D6DA2:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6A1C

	thumb_func_start sub_80D6A6C
sub_80D6A6C: @ 80D6DA8
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080D6E10
	ldrh r1, [r0]
	ldrh r2, [r4, 0x20]
	adds r1, r2
	strh r1, [r4, 0x20]
	ldrh r0, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	ldr r0, _080D6E14
	adds r1, 0x20
	lsls r1, 16
	asrs r1, 16
	movs r7, 0x22
	ldrsh r2, [r4, r7]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080D6E18
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r6, r2, r3
	ldrh r5, [r6, 0x4]
	lsls r1, r5, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r7, _080D6E1C
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080D6E20
	ands r0, r5
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080D6E24
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r3, 0x1C
	adds r2, r3
	ldr r0, _080D6E28
	str r0, [r2]
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D6E10: .4byte gUnknown_03004B00
_080D6E14: .4byte gBattleAnimSpriteTemplate_83D9950
_080D6E18: .4byte gSprites
_080D6E1C: .4byte 0x000003ff
_080D6E20: .4byte 0xfffffc00
_080D6E24: .4byte gUnknown_0202F7B2
_080D6E28: .4byte sub_80D6AF0
	thumb_func_end sub_80D6A6C

	thumb_func_start sub_80D6AF0
sub_80D6AF0: @ 80D6E2C
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080D6E60
	movs r0, 0
	strh r0, [r3, 0x2E]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080D6E60:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080D6E74
	adds r0, r3, 0
	bl move_anim_8072740
_080D6E74:
	pop {r0}
	bx r0
	thumb_func_end sub_80D6AF0

	thumb_func_start sub_80D6B3C
sub_80D6B3C: @ 80D6E78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D6E98
	adds r5, r1, r0
	ldr r0, _080D6E9C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D6EA4
	ldr r4, _080D6EA0
	b _080D6EA6
	.align 2, 0
_080D6E98: .4byte gTasks
_080D6E9C: .4byte gUnknown_03004B00
_080D6EA0: .4byte gUnknown_0202F7C8
_080D6EA4:
	ldr r4, _080D6EE8
_080D6EA6:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x26]
	ldr r2, _080D6EEC
	ldrh r0, [r2, 0x2]
	movs r1, 0
	strh r0, [r5, 0x14]
	strh r1, [r5, 0x16]
	strh r1, [r5, 0x18]
	strh r1, [r5, 0x1A]
	strh r1, [r5, 0x1C]
	ldrh r0, [r2, 0x6]
	strh r0, [r5, 0x1E]
	strh r1, [r5, 0x20]
	ldrh r0, [r2, 0x4]
	strh r0, [r5, 0x22]
	ldr r0, _080D6EF0
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D6EE8: .4byte gUnknown_0202F7C9
_080D6EEC: .4byte gUnknown_03004B00
_080D6EF0: .4byte sub_80D6BB8
	thumb_func_end sub_80D6B3C

	thumb_func_start sub_80D6BB8
sub_80D6BB8: @ 80D6EF4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r2, r6, 0
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D6FDC
	adds r5, r0, r1
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D6FF4
	ldrh r0, [r5, 0x20]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r5, 0x20]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	cmp r0, r1
	ble _080D7002
	strh r7, [r5, 0x20]
	ldr r0, _080D6FE0
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	movs r3, 0x26
	ldrsh r2, [r5, r3]
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080D7002
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080D6FE4
	adds r4, r0
	ldr r1, _080D6FE8
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r0, r1
	movs r3, 0
	ldrsb r3, [r0, r3]
	ldrh r0, [r4, 0x20]
	adds r3, r0
	strh r3, [r4, 0x20]
	movs r2, 0x1A
	ldrsh r0, [r5, r2]
	lsls r0, 1
	adds r1, 0x1
	adds r0, r1
	movs r2, 0
	ldrsb r2, [r0, r2]
	ldrh r0, [r4, 0x22]
	adds r2, r0
	strh r2, [r4, 0x22]
	movs r1, 0x18
	ldrsh r0, [r5, r1]
	lsls r1, r0, 2
	adds r1, r0
	movs r0, 0x28
	subs r0, r1
	strh r0, [r4, 0x2E]
	strh r3, [r4, 0x30]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x32]
	strh r2, [r4, 0x34]
	ldrh r0, [r5, 0x26]
	strh r0, [r4, 0x36]
	strh r6, [r4, 0x38]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D6FEC
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080D6FF0
	str r0, [r4, 0x1C]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x1
	strh r0, [r5, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080D6FAC
	strh r7, [r5, 0x1A]
_080D6FAC:
	ldrh r0, [r5, 0x1C]
	adds r0, 0x1
	strh r0, [r5, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	cmp r0, r1
	blt _080D6FCE
	strh r7, [r5, 0x1C]
	ldrh r1, [r5, 0x18]
	movs r3, 0x18
	ldrsh r0, [r5, r3]
	cmp r0, 0x5
	bgt _080D6FCE
	adds r0, r1, 0x1
	strh r0, [r5, 0x18]
_080D6FCE:
	ldrh r0, [r5, 0x16]
	adds r0, 0x1
	strh r0, [r5, 0x16]
	ldrh r0, [r5, 0x14]
	subs r0, 0x1
	strh r0, [r5, 0x14]
	b _080D7002
	.align 2, 0
_080D6FDC: .4byte gTasks
_080D6FE0: .4byte gSpriteTemplate_83D99B8
_080D6FE4: .4byte gSprites
_080D6FE8: .4byte gUnknown_083D9968
_080D6FEC: .4byte sub_80D6D00
_080D6FF0: .4byte sub_8078600
_080D6FF4:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D7002
	adds r0, r2, 0
	bl move_anim_task_del
_080D7002:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80D6BB8

	thumb_func_start sub_80D6CCC
sub_80D6CCC: @ 80D7008
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D7030
	ldr r2, _080D7038
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x16]
	subs r1, 0x1
	strh r1, [r0, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080D7030:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7038: .4byte gTasks
	thumb_func_end sub_80D6CCC

	thumb_func_start sub_80D6D00
sub_80D6D00: @ 80D703C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080D7050
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7050: .4byte sub_80D6CCC
	thumb_func_end sub_80D6D00

	thumb_func_start sub_80D6D18
sub_80D6D18: @ 80D7054
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D7068
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D7070
	ldr r4, _080D706C
	b _080D7072
	.align 2, 0
_080D7068: .4byte gUnknown_03004B00
_080D706C: .4byte gUnknown_0202F7C8
_080D7070:
	ldr r4, _080D70A0
_080D7072:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D70A4
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080D70A8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D70A0: .4byte gUnknown_0202F7C9
_080D70A4: .4byte move_anim_8074EE0
_080D70A8: .4byte sub_80785E4
	thumb_func_end sub_80D6D18

	thumb_func_start sub_80D6D70
sub_80D6D70: @ 80D70AC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D70C0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D70C8
	ldr r4, _080D70C4
	b _080D70CA
	.align 2, 0
_080D70C0: .4byte gUnknown_03004B00
_080D70C4: .4byte gUnknown_0202F7C8
_080D70C8:
	ldr r4, _080D7104
_080D70CA:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D7108
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x24]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x26]
	ldr r1, _080D710C
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080D7110
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7104: .4byte gUnknown_0202F7C9
_080D7108: .4byte gUnknown_03004B00
_080D710C: .4byte move_anim_8072740
_080D7110: .4byte sub_8078600
	thumb_func_end sub_80D6D70

	thumb_func_start sub_80D6DD8
sub_80D6DD8: @ 80D7114
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r4, _080D716C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3A]
	movs r0, 0x10
	strh r0, [r5, 0x3C]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080D7162
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	negs r0, r0
	strh r0, [r5, 0x3C]
_080D7162:
	ldr r0, _080D7170
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D716C: .4byte gUnknown_0202F7C8
_080D7170: .4byte sub_80D6E38
	thumb_func_end sub_80D6DD8

	thumb_func_start sub_80D6E38
sub_80D6E38: @ 80D7174
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D7186
	cmp r0, 0x1
	beq _080D719C
	b _080D71CC
_080D7186:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080D71CC
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D71CC
_080D719C:
	ldrh r2, [r4, 0x3C]
	ldrh r1, [r4, 0x20]
	adds r0, r2, r1
	strh r0, [r4, 0x20]
	ldr r3, _080D71D4
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	adds r2, r1
	strh r2, [r0, 0x24]
	ldrh r0, [r4, 0x20]
	adds r0, 0x50
	lsls r0, 16
	movs r1, 0xC8
	lsls r1, 17
	cmp r0, r1
	bls _080D71CC
	adds r0, r4, 0
	bl move_anim_8074EE0
_080D71CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D71D4: .4byte gSprites
	thumb_func_end sub_80D6E38

	thumb_func_start sub_80D6E9C
sub_80D6E9C: @ 80D71D8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080D71FC
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D726C
	cmp r0, 0x1
	bgt _080D7200
	cmp r0, 0
	beq _080D720C
	b _080D733C
	.align 2, 0
_080D71FC: .4byte gTasks
_080D7200:
	cmp r0, 0x2
	beq _080D72C8
	cmp r0, 0x3
	bne _080D720A
	b _080D731C
_080D720A:
	b _080D733C
_080D720C:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x26]
	ldr r4, _080D7240
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D7248
	ldr r0, _080D7244
	strh r0, [r5, 0x24]
	movs r0, 0x2
	b _080D724E
	.align 2, 0
_080D7240: .4byte gUnknown_0202F7C8
_080D7244: .4byte 0x0000ffe0
_080D7248:
	movs r0, 0x20
	strh r0, [r5, 0x24]
	ldr r0, _080D7264
_080D724E:
	strh r0, [r5, 0x22]
	ldr r2, _080D7268
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r5, 0x24]
	strh r1, [r0, 0x24]
	b _080D730E
	.align 2, 0
_080D7264: .4byte 0x0000fffe
_080D7268: .4byte gSprites
_080D726C:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D733C
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r4, _080D72C4
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r5, 0x24]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D730E
	ldrh r2, [r5, 0x22]
	adds r2, r1, r2
	strh r2, [r5, 0x24]
	movs r0, 0x26
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x24]
	b _080D733C
	.align 2, 0
_080D72C4: .4byte gSprites
_080D72C8:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D733C
	movs r0, 0
	strh r0, [r5, 0xA]
	ldr r1, _080D7318
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	adds r2, 0x3E
	ldrb r3, [r2]
	lsls r0, r3, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _080D733C
_080D730E:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D733C
	.align 2, 0
_080D7318: .4byte gSprites
_080D731C:
	ldr r2, _080D7344
	movs r0, 0x26
	ldrsh r1, [r5, r0]
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
	adds r0, r3, 0
	bl move_anim_task_del
_080D733C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D7344: .4byte gSprites
	thumb_func_end sub_80D6E9C

	thumb_func_start sub_80D700C
sub_80D700C: @ 80D7348
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080D736C
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080D7362
	b _080D7488
_080D7362:
	cmp r0, 0x1
	bgt _080D7370
	cmp r0, 0
	beq _080D7378
	b _080D74CA
	.align 2, 0
_080D736C: .4byte gTasks
_080D7370:
	cmp r0, 0x2
	bne _080D7376
	b _080D74BC
_080D7376:
	b _080D74CA
_080D7378:
	ldr r4, _080D73B8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	bne _080D738E
	movs r1, 0x1
_080D738E:
	movs r6, 0
	strh r1, [r5, 0xA]
	ldr r0, _080D73BC
	movs r1, 0
	ldrsh r2, [r0, r1]
	adds r3, r0, 0
	cmp r2, 0
	beq _080D73C4
	cmp r2, 0x4
	beq _080D73EC
	ldrh r1, [r3]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D7424
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r5, 0xE]
	ldr r0, _080D73C0
	b _080D742C
	.align 2, 0
_080D73B8: .4byte gUnknown_0202F7C8
_080D73BC: .4byte gUnknown_03004B00
_080D73C0: .4byte 0x0000fff0
_080D73C4:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	movs r2, 0xA
	ldrsh r0, [r5, r2]
	lsls r0, 7
	adds r0, 0x78
	strh r0, [r5, 0x10]
	b _080D7462
_080D73EC:
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	lsls r1, 7
	movs r0, 0x78
	subs r0, r1
	strh r0, [r5, 0xE]
	ldr r4, _080D7420
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x12]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	lsls r1, 5
	subs r0, r1
	strh r0, [r5, 0x10]
	b _080D7462
	.align 2, 0
_080D7420: .4byte gUnknown_0202F7C9
_080D7424:
	ldr r0, _080D7448
	strh r0, [r5, 0xE]
	movs r0, 0x80
	lsls r0, 1
_080D742C:
	strh r0, [r5, 0x10]
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080D744C
	movs r2, 0
	ldrsh r0, [r3, r2]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	movs r0, 0x50
	subs r0, r1
	strh r0, [r5, 0x12]
	b _080D7462
	.align 2, 0
_080D7448: .4byte 0x0000fff0
_080D744C:
	movs r0, 0
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r0, 0x28
	strh r0, [r5, 0x12]
	ldrh r1, [r5, 0xE]
	ldrh r0, [r5, 0x10]
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
_080D7462:
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bge _080D7478
	movs r1, 0
	movs r0, 0x1
	strh r0, [r5, 0xA]
	strh r1, [r5, 0x14]
	b _080D74B4
_080D7478:
	ldr r0, _080D7484
	strh r0, [r5, 0xA]
	movs r0, 0x3
	strh r0, [r5, 0x14]
	b _080D74B4
	.align 2, 0
_080D7484: .4byte 0x0000ffff
_080D7488:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	ble _080D74CA
	movs r0, 0
	strh r0, [r5, 0xC]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80D7194
	lsls r0, 24
	cmp r0, 0
	bne _080D74B4
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80D7194
	lsls r0, 24
	cmp r0, 0
	beq _080D74CA
_080D74B4:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D74CA
_080D74BC:
	movs r1, 0x16
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D74CA
	adds r0, r4, 0
	bl move_anim_task_del
_080D74CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80D700C

	thumb_func_start sub_80D7194
sub_80D7194: @ 80D74D0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D755C
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r3, 0x12
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D7506
	ldr r1, _080D7560
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	strh r5, [r0, 0x3A]
	movs r1, 0x7
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080D7506:
	ldrh r1, [r4, 0xA]
	ldrh r5, [r4, 0x14]
	adds r0, r1, r5
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bge _080D7518
	movs r0, 0x3
	strh r0, [r4, 0x14]
_080D7518:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080D7524
	movs r0, 0
	strh r0, [r4, 0x14]
_080D7524:
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	lsls r0, 4
	ldrh r5, [r4, 0xE]
	adds r2, r0, r5
	strh r2, [r4, 0xE]
	lsls r0, r1, 16
	asrs r3, r0, 16
	cmp r3, 0x1
	bne _080D7544
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x10
	ldrsh r1, [r4, r5]
	cmp r0, r1
	bge _080D7558
_080D7544:
	movs r0, 0x1
	negs r0, r0
	cmp r3, r0
	bne _080D7564
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bgt _080D7564
_080D7558:
	movs r0, 0x1
	b _080D7566
	.align 2, 0
_080D755C: .4byte gSpriteTemplate_83D9B10
_080D7560: .4byte gSprites
_080D7564:
	movs r0, 0
_080D7566:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7194

	thumb_func_start sub_80D7230
sub_80D7230: @ 80D756C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080D75AC
	ldr r3, _080D75B4
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D75AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D75B4: .4byte gTasks
	thumb_func_end sub_80D7230

	thumb_func_start sub_80D727C
sub_80D727C: @ 80D75B8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D75CA
	cmp r0, 0x1
	beq _080D75FC
	b _080D7610
_080D75CA:
	ldr r4, _080D75F8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080D7610
	.align 2, 0
_080D75F8: .4byte gUnknown_0202F7C8
_080D75FC:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D7610
	adds r0, r5, 0
	bl move_anim_8074EE0
_080D7610:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D727C

	thumb_func_start sub_80D72DC
sub_80D72DC: @ 80D7618
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D763C
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080D7632
	b _080D77A4
_080D7632:
	lsls r0, 2
	ldr r1, _080D7640
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D763C: .4byte gTasks
_080D7640: .4byte _080D7644
	.align 2, 0
_080D7644:
	.4byte _080D7658
	.4byte _080D76E8
	.4byte _080D7724
	.4byte _080D7780
	.4byte _080D7790
_080D7658:
	ldr r4, _080D76DC
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	ldr r0, _080D76E0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r5, r2]
	movs r2, 0x14
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x5
	bl __divsi3
	strh r0, [r5, 0x1A]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080D76E4
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	subs r0, 0x4C
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x20]
	movs r0, 0x3F
	bl sub_8076F98
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x22]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x24]
	movs r1, 0x22
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	movs r1, 0x3
	bl __divsi3
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	b _080D77A2
	.align 2, 0
_080D76DC: .4byte gUnknown_0202F7C8
_080D76E0: .4byte gUnknown_0202F7C9
_080D76E4: .4byte 0x0000ffff
_080D76E8:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	cmp r0, 0
	ble _080D7718
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80D7470
	lsls r0, 24
	cmp r0, 0
	beq _080D7718
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bne _080D7712
	movs r0, 0x3
	b _080D7716
_080D7712:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
_080D7716:
	strh r0, [r5, 0x8]
_080D7718:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D77A4
	b _080D779A
_080D7724:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D7732
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
_080D7732:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	movs r3, 0
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080D77A4
	strh r3, [r5, 0xA]
	ldrh r1, [r5, 0xC]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	beq _080D775E
	movs r0, 0x4
	strh r0, [r5, 0x16]
	movs r0, 0x44
	strh r0, [r5, 0x18]
	strh r3, [r5, 0x10]
	strh r2, [r5, 0x12]
	b _080D776E
_080D775E:
	movs r0, 0x44
	strh r0, [r5, 0x16]
	movs r0, 0x4
	strh r0, [r5, 0x18]
	movs r0, 0x7
	strh r0, [r5, 0x10]
	ldr r0, _080D777C
	strh r0, [r5, 0x12]
_080D776E:
	movs r1, 0x1E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080D77A0
	movs r0, 0x4
	b _080D77A2
	.align 2, 0
_080D777C: .4byte 0x0000ffff
_080D7780:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D77A4
	adds r0, r2, 0
	bl move_anim_task_del
	b _080D77A4
_080D7790:
	ldrh r1, [r5, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080D77A0
_080D779A:
	subs r0, r1, 0x1
	strh r0, [r5, 0x1E]
	b _080D77A4
_080D77A0:
	movs r0, 0x1
_080D77A2:
	strh r0, [r5, 0x8]
_080D77A4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D72DC

	thumb_func_start sub_80D7470
sub_80D7470: @ 80D77AC
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D7874
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r3, 0x16
	ldrsh r2, [r4, r3]
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080D7818
	ldr r1, _080D7878
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldrh r6, [r4, 0x10]
	adds r1, r6
	ldr r6, _080D787C
	adds r0, r6, 0
	ands r1, r0
	ldr r0, _080D7880
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _080D7800
	movs r0, 0x7
	strh r0, [r4, 0x10]
_080D7800:
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x7
	ble _080D780C
	movs r0, 0
	strh r0, [r4, 0x10]
_080D780C:
	strh r5, [r3, 0x3A]
	movs r0, 0x3
	strh r0, [r3, 0x3C]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080D7818:
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080D783A
	movs r5, 0x12
	ldrsh r0, [r4, r5]
	cmp r0, 0
	ble _080D783A
	ldrh r1, [r4, 0x26]
	ldrh r6, [r4, 0x24]
	adds r1, r6
	strh r1, [r4, 0x24]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x76
	bl PlaySE12WithPanning
_080D783A:
	movs r0, 0x12
	ldrsh r3, [r4, r0]
	ldrh r2, [r4, 0x16]
	cmp r3, 0
	bge _080D7850
	lsls r0, r2, 16
	asrs r0, 16
	movs r5, 0x18
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080D7860
_080D7850:
	cmp r3, 0
	ble _080D7884
	lsls r0, r2, 16
	asrs r0, 16
	movs r6, 0x18
	ldrsh r1, [r4, r6]
	cmp r0, r1
	blt _080D7884
_080D7860:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x1A]
	ldrh r1, [r4, 0x14]
	adds r0, r1
	strh r0, [r4, 0x14]
	movs r0, 0x1
	b _080D7890
	.align 2, 0
_080D7874: .4byte gSpriteTemplate_83D9B40
_080D7878: .4byte gSprites
_080D787C: .4byte 0x000003ff
_080D7880: .4byte 0xfffffc00
_080D7884:
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r0, r2, r0
	strh r0, [r4, 0x16]
	movs r0, 0
_080D7890:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7470

	thumb_func_start sub_80D755C
sub_80D755C: @ 80D7898
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080D78CE
	ldr r3, _080D78D4
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080D78CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D78D4: .4byte gTasks
	thumb_func_end sub_80D755C

	thumb_func_start sub_80D759C
sub_80D759C: @ 80D78D8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D78FC
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080D7954
	cmp r0, 0x1
	bgt _080D7900
	cmp r0, 0
	beq _080D7906
	b _080D798A
	.align 2, 0
_080D78FC: .4byte gTasks
_080D7900:
	cmp r0, 0x2
	beq _080D797C
	b _080D798A
_080D7906:
	ldr r0, _080D7950
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x26]
	strh r0, [r5, 0x24]
	cmp r0, 0x10
	ble _080D7930
	adds r2, r0, 0
_080D7920:
	adds r1, r2, 0
	subs r1, 0x20
	adds r2, r1, 0
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0x10
	bgt _080D7920
	strh r1, [r5, 0x24]
_080D7930:
	ldr r4, _080D7950
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r5, 0x20]
	b _080D7974
	.align 2, 0
_080D7950: .4byte gUnknown_0202F7C9
_080D7954:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D798A
	movs r0, 0
	strh r0, [r5, 0xA]
	adds r0, r5, 0
	adds r1, r2, 0
	bl sub_80D7654
	lsls r0, 24
	cmp r0, 0
	beq _080D798A
_080D7974:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080D798A
_080D797C:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D798A
	adds r0, r2, 0
	bl move_anim_task_del
_080D798A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D759C

	thumb_func_start sub_80D7654
sub_80D7654: @ 80D7990
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080D79EC
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080D79D4
	ldr r3, _080D79F0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x1C
	adds r1, r0, r1
	ldr r2, _080D79F4
	str r2, [r1]
	adds r0, r3
	strh r5, [r0, 0x3A]
	movs r1, 0xA
	strh r1, [r0, 0x3C]
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
_080D79D4:
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _080D79F8
	adds r0, r2, 0
	adds r0, 0x20
	strh r0, [r4, 0x24]
	movs r0, 0
	b _080D79FA
	.align 2, 0
_080D79EC: .4byte gBattleAnimSpriteTemplate_83D97D0
_080D79F0: .4byte gSprites
_080D79F4: .4byte sub_80D76C4
_080D79F8:
	movs r0, 0x1
_080D79FA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80D7654

	thumb_func_start sub_80D76C4
sub_80D76C4: @ 80D7A00
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D7A34
	ldr r3, _080D7A3C
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_080D7A34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7A3C: .4byte gTasks
	thumb_func_end sub_80D76C4

	thumb_func_start sub_80D7704
sub_80D7704: @ 80D7A40
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x7
	ldr r3, _080D7B48
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D7B4C
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r4, _080D7B50
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r4, _080D7B54
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r4]
	movs r1, 0x3
	str r3, [sp]
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080D7B58
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1]
	ldr r3, [sp]
	adds r0, r3
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x4]
	mov r4, r9
	adds r0, r4, r0
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x2]
	adds r0, r6
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0x6]
	mov r7, r8
	adds r0, r7, r0
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078314
	adds r4, 0x20
	movs r0, 0x98
	lsls r0, 1
	mov r12, r0
	ldr r3, [sp]
	cmp r4, r12
	bhi _080D7B1A
	adds r0, r7, 0
	adds r0, 0x20
	ldrh r1, [r5, 0x30]
	ldrh r2, [r5, 0x32]
	cmp r0, 0xE0
	bhi _080D7B1A
	adds r4, r1, 0
	mov r10, r12
_080D7AE6:
	mov r7, r9
	lsls r1, r7, 16
	asrs r1, 16
	adds r1, r4
	lsls r1, 16
	mov r7, r8
	lsls r0, r7, 16
	asrs r0, 16
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r0, r1, 16
	mov r9, r0
	movs r7, 0x80
	lsls r7, 14
	adds r1, r7
	lsrs r1, 16
	cmp r1, r10
	bhi _080D7B1A
	mov r1, r8
	lsls r0, r1, 16
	adds r0, r7
	lsrs r0, 16
	cmp r0, 0xE0
	bls _080D7AE6
_080D7B1A:
	ldrh r0, [r5, 0x30]
	negs r7, r0
	strh r7, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	negs r4, r0
	strh r4, [r5, 0x32]
	lsls r0, r3, 16
	movs r1, 0x80
	lsls r1, 14
	adds r0, r1
	lsrs r0, 16
	movs r2, 0x98
	lsls r2, 1
	mov r12, r2
	ldr r1, _080D7B58
	mov r10, r1
	cmp r0, r12
	bhi _080D7B86
	lsls r1, r6, 16
	movs r2, 0x80
	lsls r2, 14
	adds r0, r1, r2
	b _080D7B7E
	.align 2, 0
_080D7B48: .4byte 0x000003ff
_080D7B4C: .4byte 0xfffffc00
_080D7B50: .4byte gUnknown_0202F7C9
_080D7B54: .4byte gUnknown_0202F7C8
_080D7B58: .4byte gUnknown_03004B00
_080D7B5C:
	lsls r1, r3, 16
	asrs r1, 16
	adds r1, r7
	lsls r1, 16
	asrs r0, r2, 16
	adds r0, r4
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r3, r1, 16
	movs r0, 0x80
	lsls r0, 14
	adds r1, r0
	lsrs r1, 16
	cmp r1, r12
	bhi _080D7B86
	lsls r1, r6, 16
	adds r0, r1, r0
_080D7B7E:
	lsrs r0, 16
	adds r2, r1, 0
	cmp r0, 0xE0
	bls _080D7B5C
_080D7B86:
	strh r3, [r5, 0x20]
	strh r6, [r5, 0x22]
	mov r1, r10
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	strh r3, [r5, 0x30]
	mov r2, r9
	strh r2, [r5, 0x32]
	strh r6, [r5, 0x34]
	mov r3, r8
	strh r3, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078314
	mov r7, r10
	ldrh r0, [r7, 0xA]
	strh r0, [r5, 0x34]
	ldrh r0, [r7, 0xC]
	strh r0, [r5, 0x36]
	ldr r0, _080D7BC0
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D7BC0: .4byte sub_80D7888
	thumb_func_end sub_80D7704

	thumb_func_start sub_80D7888
sub_80D7888: @ 80D7BC4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D7C1C
	ldrh r1, [r4, 0x30]
	ldrh r2, [r4, 0x38]
	adds r1, r2
	strh r1, [r4, 0x38]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	strh r1, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D7C22
_080D7C1C:
	adds r0, r4, 0
	bl move_anim_8072740
_080D7C22:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7888

	thumb_func_start sub_80D78EC
sub_80D78EC: @ 80D7C28
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D7C5C
	ldrh r0, [r0]
	strh r0, [r4, 0x2E]
	movs r0, 0x3C
	strh r0, [r4, 0x30]
	movs r0, 0x9
	strh r0, [r4, 0x32]
	movs r0, 0x1E
	strh r0, [r4, 0x34]
	movs r0, 0xFE
	lsls r0, 8
	strh r0, [r4, 0x36]
	ldr r1, _080D7C60
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _080D7C64
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7C5C: .4byte gUnknown_03004B00
_080D7C60: .4byte move_anim_8072740
_080D7C64: .4byte sub_8078174
	thumb_func_end sub_80D78EC

	thumb_func_start sub_80D792C
sub_80D792C: @ 80D7C68
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080D7C9C
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldr r0, _080D7CA0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D7CA8
	ldr r0, _080D7CA4
	ldrh r1, [r4, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r4, 0x32]
	b _080D7CB2
	.align 2, 0
_080D7C9C: .4byte gUnknown_0202F7C9
_080D7CA0: .4byte gUnknown_0202F7C8
_080D7CA4: .4byte gUnknown_03004B00
_080D7CA8:
	ldr r0, _080D7CE0
	ldrh r0, [r0, 0x4]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
_080D7CB2:
	ldr r0, _080D7CE4
	ldrb r0, [r0]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	ldr r1, _080D7CE0
	lsrs r0, 24
	ldrh r2, [r1, 0x6]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x2E]
	ldr r1, _080D7CE8
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080D7CEC
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7CE0: .4byte gUnknown_03004B00
_080D7CE4: .4byte gUnknown_0202F7C9
_080D7CE8: .4byte move_anim_8072740
_080D7CEC: .4byte sub_8078B34
	thumb_func_end sub_80D792C

	thumb_func_start sub_80D79B4
sub_80D79B4: @ 80D7CF0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D7D08
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D7D0C
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	b _080D7D42
	.align 2, 0
_080D7D08: .4byte gUnknown_03004B00
_080D7D0C:
	ldr r0, _080D7D54
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080D7D58
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D7D32
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080D7D32:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080D7D42:
	ldr r1, _080D7D5C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080D7D60
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7D54: .4byte gUnknown_0202F7C9
_080D7D58: .4byte gUnknown_0202F7C8
_080D7D5C: .4byte sub_80D7A28
_080D7D60: .4byte sub_80785E4
	thumb_func_end sub_80D79B4

	thumb_func_start sub_80D7A28
sub_80D7A28: @ 80D7D64
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080D7D9A
	adds r0, r3, 0
	bl move_anim_8074EE0
_080D7D9A:
	pop {r0}
	bx r0
	thumb_func_end sub_80D7A28

	thumb_func_start sub_80D7A64
sub_80D7A64: @ 80D7DA0
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r6, _080D7DE8
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D7DF0
	ldr r4, _080D7DEC
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	b _080D7E02
	.align 2, 0
_080D7DE8: .4byte gUnknown_03004B00
_080D7DEC: .4byte gUnknown_0202F7C9
_080D7DF0:
	ldr r0, _080D7E1C
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080D7E02:
	ldr r0, _080D7E20
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D7E28
	ldr r0, _080D7E24
	ldrh r1, [r5, 0x32]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r5, 0x32]
	b _080D7E32
	.align 2, 0
_080D7E1C: .4byte gUnknown_0202F7C9
_080D7E20: .4byte gUnknown_0202F7C8
_080D7E24: .4byte gUnknown_03004B00
_080D7E28:
	ldr r0, _080D7ED0
	ldrh r0, [r0, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
_080D7E32:
	adds r7, r5, 0
	adds r7, 0x2E
	adds r2, r7, 0
	mov r1, sp
	movs r4, 0x7
_080D7E3C:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D7E3C
	adds r0, r5, 0
	bl sub_8078D60
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	eors r0, r1
	strh r0, [r5, 0x32]
_080D7E5E:
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078CE8
	movs r0, 0x20
	ldrsh r1, [r5, r0]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	adds r1, r0
	adds r1, 0x10
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	bhi _080D7E92
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080D7E92
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D7E5E
_080D7E92:
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldr r6, _080D7ED4
	ldr r1, _080D7ED8
	mov r3, sp
	adds r2, r7, 0
	movs r4, 0x7
_080D7EB2:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D7EB2
	str r6, [r5, 0x1C]
	adds r0, r5, 0
	bl oamt_set_x3A_32
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D7ED0: .4byte gUnknown_03004B00
_080D7ED4: .4byte sub_8078D8C
_080D7ED8: .4byte sub_80D7BA0
	thumb_func_end sub_80D7A64

	thumb_func_start sub_80D7BA0
sub_80D7BA0: @ 80D7EDC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	movs r5, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r5, [r4, 0x26]
	strh r5, [r4, 0x24]
	movs r0, 0x80
	strh r0, [r4, 0x2E]
	ldr r0, _080D7F38
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _080D7F3C
	cmp r0, 0
	beq _080D7F0C
	movs r1, 0x14
_080D7F0C:
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 16
	bl Sin
	strh r0, [r4, 0x34]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	strh r0, [r4, 0x36]
	strh r5, [r4, 0x38]
	ldr r1, _080D7F40
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D7F38: .4byte gUnknown_0202F7C8
_080D7F3C: .4byte 0x0000ffec
_080D7F40: .4byte sub_80D7C08
	thumb_func_end sub_80D7BA0

	thumb_func_start sub_80D7C08
sub_80D7C08: @ 80D7F44
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D7F98
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	ldr r1, _080D7F9C
	cmp r0, 0
	beq _080D7F5A
	movs r1, 0x14
_080D7F5A:
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0x1F
	bgt _080D7FA0
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r1, 16
	asrs r1, 16
	bl Sin
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x36]
	subs r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x10
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	b _080D7FBE
	.align 2, 0
_080D7F98: .4byte gUnknown_0202F7C8
_080D7F9C: .4byte 0x0000ffec
_080D7FA0:
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r1, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	strh r1, [r4, 0x36]
	strh r1, [r4, 0x34]
	ldr r0, _080D7FC4
	str r0, [r4, 0x1C]
_080D7FBE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D7FC4: .4byte sub_80D7C8C
	thumb_func_end sub_80D7C08

	thumb_func_start sub_80D7C8C
sub_80D7C8C: @ 80D7FC8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078CE8
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080D8004
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r1, r0, r1
	movs r0, 0x80
	lsls r0, 1
	cmp r1, r0
	bgt _080D8004
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D800A
_080D8004:
	adds r0, r4, 0
	bl move_anim_8072740
_080D800A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7C8C

	thumb_func_start sub_80D7CD4
sub_80D7CD4: @ 80D8010
	push {r4-r7,lr}
	sub sp, 0x10
	adds r5, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080D8054
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D805C
	ldr r4, _080D8058
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080D806E
	.align 2, 0
_080D8054: .4byte gUnknown_03004B00
_080D8058: .4byte gUnknown_0202F7C9
_080D805C:
	ldr r0, _080D808C
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080D806E:
	ldr r0, _080D8090
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D8098
	ldr r0, _080D8094
	ldrh r1, [r5, 0x32]
	ldrh r2, [r0, 0x4]
	subs r1, r2
	strh r1, [r5, 0x32]
	adds r1, r0, 0
	b _080D80A2
	.align 2, 0
_080D808C: .4byte gUnknown_0202F7C9
_080D8090: .4byte gUnknown_0202F7C8
_080D8094: .4byte gUnknown_03004B00
_080D8098:
	ldr r1, _080D814C
	ldrh r0, [r1, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
_080D80A2:
	ldrh r0, [r1, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078D60
	adds r7, r5, 0
	adds r7, 0x2E
	adds r2, r7, 0
	mov r1, sp
	movs r4, 0x7
_080D80BA:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D80BA
	ldrh r0, [r5, 0x30]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	eors r0, r1
	strh r0, [r5, 0x32]
_080D80D6:
	movs r0, 0x1
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	bl sub_8078CE8
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r2, 0x24
	ldrsh r0, [r5, r2]
	adds r1, r0
	adds r1, 0x10
	movs r0, 0x88
	lsls r0, 1
	cmp r1, r0
	bhi _080D810A
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080D810A
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D80D6
_080D810A:
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	ldr r1, _080D814C
	ldr r6, _080D8150
	mov r3, sp
	adds r2, r7, 0
	movs r4, 0x7
_080D812A:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _080D812A
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x38]
	ldrh r0, [r1, 0xC]
	strh r0, [r5, 0x3A]
	str r6, [r5, 0x1C]
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D814C: .4byte gUnknown_03004B00
_080D8150: .4byte sub_80D7E18
	thumb_func_end sub_80D7CD4

	thumb_func_start sub_80D7E18
sub_80D7E18: @ 80D8154
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078CE8
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D8168
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_080D8168:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080D81BE
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x10
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	bhi _080D81B8
	movs r0, 0x22
	ldrsh r1, [r4, r0]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	adds r1, r0
	cmp r1, 0xA0
	bgt _080D81B8
	movs r0, 0x10
	negs r0, r0
	cmp r1, r0
	bge _080D81BE
_080D81B8:
	adds r0, r4, 0
	bl move_anim_8072740
_080D81BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7E18

	thumb_func_start sub_80D7E88
sub_80D7E88: @ 80D81C4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D8230
	ldr r5, _080D81E4
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080D81E8
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
	b _080D821E
	.align 2, 0
_080D81E4: .4byte gUnknown_03004B00
_080D81E8:
	ldr r0, _080D8228
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldr r0, _080D822C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D820E
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080D820E:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080D821E:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D8244
	.align 2, 0
_080D8228: .4byte gUnknown_0202F7C9
_080D822C: .4byte gUnknown_0202F7C8
_080D8230:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080D8244
	adds r0, r4, 0
	bl move_anim_8072740
_080D8244:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D7E88

	thumb_func_start sub_80D7F10
sub_80D7F10: @ 80D824C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080D826C
	movs r1, 0x8
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D82BC
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D8270
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
	b _080D82AE
	.align 2, 0
_080D826C: .4byte gUnknown_03004B00
_080D8270:
	ldr r4, _080D8298
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D829C
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080D82A2
	.align 2, 0
_080D8298: .4byte gUnknown_0202F7C8
_080D829C:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080D82A2:
	strh r0, [r5, 0x20]
	ldr r0, _080D82B4
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080D82AE:
	ldr r0, _080D82B8
	b _080D830C
	.align 2, 0
_080D82B4: .4byte gUnknown_03004B00
_080D82B8: .4byte gUnknown_0202F7C8
_080D82BC:
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D82CE
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078764
	b _080D830A
_080D82CE:
	ldr r4, _080D82F4
	ldrb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D82F8
	ldrh r0, [r5, 0x20]
	ldrh r1, [r6]
	subs r0, r1
	b _080D82FE
	.align 2, 0
_080D82F4: .4byte gUnknown_0202F7C9
_080D82F8:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080D82FE:
	strh r0, [r5, 0x20]
	ldr r0, _080D8328
	ldrh r0, [r0, 0x2]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
_080D830A:
	ldr r0, _080D832C
_080D830C:
	ldrb r0, [r0]
	strh r0, [r5, 0x3C]
	ldr r0, _080D8328
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080D8324
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _080D8330
_080D8324:
	movs r0, 0x20
	b _080D8332
	.align 2, 0
_080D8328: .4byte gUnknown_03004B00
_080D832C: .4byte gUnknown_0202F7C9
_080D8330:
	movs r0, 0x40
_080D8332:
	strh r0, [r5, 0x3A]
	ldr r0, _080D8378
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D8348
	ldrh r0, [r5, 0x22]
	adds r0, 0x8
	strh r0, [r5, 0x22]
_080D8348:
	ldr r1, _080D837C
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrh r1, [r1, 0x4]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x40
	strh r0, [r5, 0x38]
	ldr r1, _080D8380
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D8378: .4byte gUnknown_0202F7C9
_080D837C: .4byte gUnknown_03004B00
_080D8380: .4byte sub_80D8048
	thumb_func_end sub_80D7F10

	thumb_func_start sub_80D8048
sub_80D8048: @ 80D8384
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D840E
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r1, 0x6
	negs r1, r1
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080D83E0
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080D8402
_080D83E0:
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
_080D8402:
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	b _080D8414
_080D840E:
	adds r0, r4, 0
	bl move_anim_8072740
_080D8414:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D8048

	thumb_func_start sub_80D80E0
sub_80D80E0: @ 80D841C
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D84E4
	ldr r2, _080D84E8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080D84EC
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D8466
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080D8466:
	ldr r0, _080D84F0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D84F4
	strh r1, [r0]
	ldr r0, _080D84F8
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D84FC
	add r2, sp, 0xC
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r2, _080D8500
	str r2, [r0, 0x8]
	ldr r2, [r0, 0x8]
	ldr r2, _080D8504
	ldr r3, [sp]
	str r2, [r0]
	str r3, [r0, 0x4]
	ldr r2, _080D8508
	str r2, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080D850C
	bl LZDecompressVram
	ldr r0, _080D8510
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D84CC
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080D84CC:
	ldr r0, _080D8514
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080D8518
	str r0, [r1]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D84E4: .4byte 0x04000050
_080D84E8: .4byte 0x00003f42
_080D84EC: .4byte 0x0400000a
_080D84F0: .4byte gUnknown_030042C0
_080D84F4: .4byte gUnknown_030041B4
_080D84F8: .4byte 0x04000014
_080D84FC: .4byte 0x040000d4
_080D8500: .4byte 0x85000400
_080D8504: .4byte gWeatherFog1Tiles
_080D8508: .4byte 0x80000400
_080D850C: .4byte gWeatherFog1Tilemap
_080D8510: .4byte gUnknown_083970E8
_080D8514: .4byte gTasks
_080D8518: .4byte sub_80D81E0
	thumb_func_end sub_80D80E0

	thumb_func_start sub_80D81E0
sub_80D81E0: @ 80D851C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080D855C
	ldr r1, _080D8560
	adds r0, r1, 0
	ldrh r4, [r2]
	adds r0, r4
	strh r0, [r2]
	ldr r1, _080D8564
	ldr r3, _080D8568
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r3
	movs r4, 0x20
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0x4
	bls _080D8550
	b _080D86EC
_080D8550:
	lsls r0, 2
	ldr r1, _080D856C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D855C: .4byte gUnknown_030042C0
_080D8560: .4byte 0x0000ffff
_080D8564: .4byte gUnknown_030041B4
_080D8568: .4byte gTasks
_080D856C: .4byte _080D8570
	.align 2, 0
_080D8570:
	.4byte _080D8584
	.4byte _080D85DC
	.4byte _080D85FE
	.4byte _080D8640
	.4byte _080D86C8
_080D8584:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080D859E
	b _080D86EC
_080D859E:
	strh r4, [r3, 0x1C]
	ldrh r0, [r3, 0x1A]
	adds r0, 0x1
	strh r0, [r3, 0x1A]
	ldr r1, _080D85D4
	movs r2, 0x1A
	ldrsh r0, [r3, r2]
	adds r0, r1
	ldrb r1, [r0]
	strh r1, [r3, 0x1E]
	ldr r2, _080D85D8
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0x9
	beq _080D85C8
	b _080D86EC
_080D85C8:
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r4, [r3, 0x1E]
	b _080D86EC
	.align 2, 0
_080D85D4: .4byte gUnknown_083D9D6C
_080D85D8: .4byte 0x04000052
_080D85DC:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1E]
	adds r0, 0x1
	strh r0, [r3, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _080D86EC
	movs r0, 0x9
	strh r0, [r3, 0x1E]
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	b _080D86EC
_080D85FE:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080D86EC
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	subs r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080D863C
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r1, [r3, r2]
	cmp r1, 0
	bne _080D86EC
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r1, [r3, 0x1E]
	b _080D86EC
	.align 2, 0
_080D863C: .4byte 0x04000052
_080D8640:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	lsls r4, r6, 2
	mov r10, r4
	add r5, sp, 0xC
	movs r7, 0
	ldr r1, _080D86FC
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r0, _080D8700
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D8666:
	str r7, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D8666
	str r7, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D86FC
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D8704
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D86B4
	ldr r2, _080D8708
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D86B4:
	ldr r0, _080D870C
	mov r4, r10
	adds r1, r4, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldr r2, _080D8710
	ldr r4, _080D8714
_080D86C8:
	movs r1, 0
	strh r1, [r2]
	strh r1, [r4]
	ldr r0, _080D8718
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080D8708
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, 0
	bl move_anim_task_del
_080D86EC:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D86FC: .4byte 0x040000d4
_080D8700: .4byte 0x85000400
_080D8704: .4byte 0x85000200
_080D8708: .4byte 0x0400000a
_080D870C: .4byte gTasks
_080D8710: .4byte gUnknown_030042C0
_080D8714: .4byte gUnknown_030041B4
_080D8718: .4byte 0x04000050
	thumb_func_end sub_80D81E0

	thumb_func_start sub_80D83E0
sub_80D83E0: @ 80D871C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D8748
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080D874C
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D8748: .4byte gUnknown_0202F7C8
_080D874C: .4byte sub_807941C
	thumb_func_end sub_80D83E0

	thumb_func_start sub_80D8414
sub_80D8414: @ 80D8750
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080D881C
	ldr r2, _080D8820
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080D8824
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D879A
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080D879A:
	ldr r0, _080D8828
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080D882C
	strh r1, [r0]
	ldr r0, _080D8830
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D8834
	add r2, sp, 0xC
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r2, _080D8838
	str r2, [r0, 0x8]
	ldr r2, [r0, 0x8]
	ldr r2, _080D883C
	ldr r3, [sp]
	str r2, [r0]
	str r3, [r0, 0x4]
	ldr r2, _080D8840
	str r2, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080D8844
	bl LZDecompressVram
	ldr r0, _080D8848
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D8800
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080D8800:
	ldr r1, _080D884C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080D8850
	strh r1, [r0, 0x26]
	ldr r1, _080D8854
	str r1, [r0]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D881C: .4byte 0x04000050
_080D8820: .4byte 0x00003f42
_080D8824: .4byte 0x0400000a
_080D8828: .4byte gUnknown_030042C0
_080D882C: .4byte gUnknown_030041B4
_080D8830: .4byte 0x04000014
_080D8834: .4byte 0x040000d4
_080D8838: .4byte 0x85000400
_080D883C: .4byte gWeatherFog1Tiles
_080D8840: .4byte 0x80000400
_080D8844: .4byte gWeatherFog1Tilemap
_080D8848: .4byte gUnknown_083970E8
_080D884C: .4byte gTasks
_080D8850: .4byte 0x0000ffff
_080D8854: .4byte sub_80D851C
	thumb_func_end sub_80D8414

	thumb_func_start sub_80D851C
sub_80D851C: @ 80D8858
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r3, _080D8894
	ldr r4, _080D8898
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r4
	ldrh r0, [r1, 0x26]
	ldrh r2, [r3]
	adds r0, r2
	strh r0, [r3]
	ldr r2, _080D889C
	movs r5, 0x20
	ldrsh r0, [r1, r5]
	cmp r0, 0x4
	bls _080D8888
	b _080D8A0C
_080D8888:
	lsls r0, 2
	ldr r1, _080D88A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D8894: .4byte gUnknown_030042C0
_080D8898: .4byte gTasks
_080D889C: .4byte gUnknown_030041B4
_080D88A0: .4byte _080D88A4
	.align 2, 0
_080D88A4:
	.4byte _080D88B8
	.4byte _080D88FC
	.4byte _080D891E
	.4byte _080D8960
	.4byte _080D89E8
_080D88B8:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	ldr r1, _080D88F4
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	adds r0, r1
	ldrb r1, [r0]
	strh r1, [r4, 0x1E]
	ldr r2, _080D88F8
	movs r0, 0x11
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r5, 0x1E
	ldrsh r0, [r4, r5]
	cmp r0, 0x5
	beq _080D88E8
	b _080D8A0C
_080D88E8:
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x1E]
	b _080D8A0C
	.align 2, 0
_080D88F4: .4byte gUnknown_083D9D98
_080D88F8: .4byte 0x04000052
_080D88FC:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r1, r0, r4
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _080D8A0C
	movs r0, 0x5
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080D8A0C
_080D891E:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r4
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080D8A0C
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r1, [r4, 0x1E]
	subs r1, 0x1
	strh r1, [r4, 0x1E]
	ldr r2, _080D895C
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r0, 0x1E
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _080D8A0C
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	strh r1, [r4, 0x1E]
	b _080D8A0C
	.align 2, 0
_080D895C: .4byte 0x04000052
_080D8960:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	lsls r1, r6, 2
	mov r10, r1
	add r5, sp, 0xC
	movs r7, 0
	ldr r1, _080D8A1C
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r0, _080D8A20
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080D8986:
	str r7, [sp, 0xC]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080D8986
	str r7, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080D8A1C
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080D8A24
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080D89D4
	ldr r2, _080D8A28
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080D89D4:
	ldr r0, _080D8A2C
	mov r5, r10
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldr r3, _080D8A30
	ldr r2, _080D8A34
_080D89E8:
	movs r1, 0
	strh r1, [r3]
	strh r1, [r2]
	ldr r0, _080D8A38
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080D8A28
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, 0
	bl move_anim_task_del
_080D8A0C:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D8A1C: .4byte 0x040000d4
_080D8A20: .4byte 0x85000400
_080D8A24: .4byte 0x85000200
_080D8A28: .4byte 0x0400000a
_080D8A2C: .4byte gTasks
_080D8A30: .4byte gUnknown_030042C0
_080D8A34: .4byte gUnknown_030041B4
_080D8A38: .4byte 0x04000050
	thumb_func_end sub_80D851C

	thumb_func_start sub_80D8700
sub_80D8700: @ 80D8A3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldr r6, _080D8B24
	ldrh r0, [r6]
	strh r0, [r5, 0x2E]
	ldr r0, _080D8B28
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	ldr r7, _080D8B2C
	ldrb r0, [r7]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bcs _080D8A70
	movs r0, 0x80
	lsls r0, 8
	strh r0, [r5, 0x3C]
_080D8A70:
	ldr r3, _080D8B30
	ldrb r0, [r7]
	adds r0, r3
	ldrb r1, [r0]
	movs r2, 0x1
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080D8AD0
	ldrh r0, [r6, 0x2]
	negs r0, r0
	strh r0, [r6, 0x2]
	ldrh r0, [r6, 0x6]
	negs r0, r0
	strh r0, [r6, 0x6]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080D8ACC
	mov r1, r8
	ldrb r0, [r1]
	adds r0, r3
	ldrb r1, [r0]
	adds r0, r2, 0
	ands r0, r1
	cmp r0, 0
	bne _080D8ACC
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	ldr r2, _080D8B34
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	adds r1, r5, 0
	adds r1, 0x43
	strb r0, [r1]
_080D8ACC:
	movs r0, 0x1
	strh r0, [r5, 0x3A]
_080D8AD0:
	ldr r4, _080D8B28
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r6, _080D8B24
	movs r1, 0xE
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080D8B38
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080D8B2C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	b _080D8B60
	.align 2, 0
_080D8B24: .4byte gUnknown_03004B00
_080D8B28: .4byte gUnknown_0202F7C8
_080D8B2C: .4byte gUnknown_0202F7C9
_080D8B30: .4byte gUnknown_02024A72
_080D8B34: .4byte gSprites
_080D8B38:
	ldrh r0, [r6, 0x2]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	strh r0, [r5, 0x30]
	ldr r4, _080D8BA8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r6, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x1
_080D8B60:
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x8]
	adds r0, r6
	strh r0, [r5, 0x36]
	ldrb r0, [r4]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 16
	ldrh r1, [r5, 0x3C]
	orrs r0, r1
	strh r0, [r5, 0x3C]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D8B94
	movs r0, 0x1
	strh r0, [r5, 0x3A]
	adds r1, r5, 0
	adds r1, 0x43
	movs r0, 0x80
	strb r0, [r1]
_080D8B94:
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080D8BAC
	str r0, [r5, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D8BA8: .4byte gUnknown_0202F7C9
_080D8BAC: .4byte sub_80D8874
	thumb_func_end sub_80D8700

	thumb_func_start sub_80D8874
sub_80D8874: @ 80D8BB0
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3C]
	movs r5, 0xFF
	movs r1, 0xFF
	ands r1, r0
	cmp r1, 0x1
	beq _080D8CA4
	cmp r1, 0x1
	bgt _080D8BCA
	cmp r1, 0
	beq _080D8BD2
	b _080D8E0C
_080D8BCA:
	cmp r1, 0x2
	bne _080D8BD0
	b _080D8DD0
_080D8BD0:
	b _080D8E0C
_080D8BD2:
	adds r0, r4, 0
	bl sub_8078B5C
	ldr r1, _080D8BFC
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r0, 4
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080D8C00
	ldrh r0, [r4, 0x38]
	subs r0, 0x8
	b _080D8C04
	.align 2, 0
_080D8BFC: .4byte gSineTable
_080D8C00:
	ldrh r0, [r4, 0x38]
	adds r0, 0x8
_080D8C04:
	ands r0, r5
	strh r0, [r4, 0x38]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080D8C12
	b _080D8E0C
_080D8C12:
	movs r5, 0x50
	strh r5, [r4, 0x2E]
	ldr r6, _080D8C64
	ldrb r0, [r6]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, 0x1D
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	ldr r0, _080D8C68
	ldr r2, _080D8C6C
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D8C74
	ldr r1, _080D8C70
	ldrb r0, [r6]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D8C74
	movs r0, 0xCC
	strh r0, [r4, 0x38]
	b _080D8C76
	.align 2, 0
_080D8C64: .4byte gUnknown_0202F7C9
_080D8C68: .4byte gMain
_080D8C6C: .4byte 0x0000043d
_080D8C70: .4byte gUnknown_02024A72
_080D8C74:
	strh r5, [r4, 0x38]
_080D8C76:
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080D8CA0
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r0, 3
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	adds r0, 0x2
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	b _080D8E0C
	.align 2, 0
_080D8CA0: .4byte gSineTable
_080D8CA4:
	adds r0, r4, 0
	bl sub_8078B5C
	ldr r1, _080D8D04
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	ldrsh r0, [r0, r2]
	asrs r0, 3
	ldrh r2, [r4, 0x24]
	adds r0, r2
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	lsls r0, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	negs r0, r0
	asrs r0, 8
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldr r0, _080D8D08
	ldr r2, _080D8D0C
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D8D2E
	ldrh r1, [r4, 0x38]
	adds r0, r1, 0
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	adds r3, r1, 0
	cmp r0, 0x7F
	bhi _080D8D10
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 24
	b _080D8D18
	.align 2, 0
_080D8D04: .4byte gSineTable
_080D8D08: .4byte gMain
_080D8D0C: .4byte 0x0000043d
_080D8D10:
	ldrh r1, [r4, 0x3C]
	lsls r1, 16
	asrs r1, 24
	adds r1, 0x1
_080D8D18:
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r3, 0x4
	b _080D8D4E
_080D8D2E:
	ldrh r0, [r4, 0x38]
	subs r0, 0x40
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7F
	bhi _080D8D42
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x80
	b _080D8D48
_080D8D42:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x8C
_080D8D48:
	strb r0, [r1]
	ldrh r0, [r4, 0x38]
	subs r0, 0x4
_080D8D4E:
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _080D8E0C
	movs r2, 0
	movs r0, 0xC0
	lsls r0, 2
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, 0x4
	strh r0, [r4, 0x36]
	ldr r0, _080D8DA4
	ldr r1, _080D8DA8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080D8DB4
	ldr r1, _080D8DAC
	ldr r0, _080D8DB0
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D8DB4
	movs r0, 0x80
	lsls r0, 1
	b _080D8DB6
	.align 2, 0
_080D8DA4: .4byte gMain
_080D8DA8: .4byte 0x0000043d
_080D8DAC: .4byte gUnknown_02024A72
_080D8DB0: .4byte gUnknown_0202F7C9
_080D8DB4:
	ldr r0, _080D8DCC
_080D8DB6:
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x3C]
	strh r1, [r4, 0x26]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl sub_8078BD4
	b _080D8E0C
	.align 2, 0
_080D8DCC: .4byte 0x0000fff0
_080D8DD0:
	adds r0, r4, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080D8E0C
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080D8DFE
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080D8DFE:
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _080D8E14
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080D8E0C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D8E14: .4byte gUnknown_0202F7B2
	thumb_func_end sub_80D8874

	thumb_func_start sub_80D8ADC
sub_80D8ADC: @ 80D8E18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080D8E2C
	adds r1, r0
	ldr r0, _080D8E30
	str r0, [r1]
	bx lr
	.align 2, 0
_080D8E2C: .4byte gTasks
_080D8E30: .4byte sub_80D8AF8
	thumb_func_end sub_80D8ADC

	thumb_func_start sub_80D8AF8
sub_80D8AF8: @ 80D8E34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080D8E58
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080D8E78
	cmp r5, 0x1
	bgt _080D8E5C
	cmp r5, 0
	beq _080D8E62
	b _080D8EDC
	.align 2, 0
_080D8E58: .4byte gTasks
_080D8E5C:
	cmp r5, 0x2
	beq _080D8ECE
	b _080D8EDC
_080D8E62:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080D8EDC
	strh r5, [r4, 0x10]
	strh r5, [r4, 0x12]
	strh r5, [r4, 0xC]
	b _080D8EB4
_080D8E78:
	ldrh r1, [r4, 0x12]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080D8EC8
	ldrb r0, [r4, 0xE]
	ldrb r1, [r4, 0xC]
	movs r3, 0x1
	bl sub_80D8BA8
	lsls r0, 24
	cmp r0, 0
	beq _080D8E98
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
_080D8E98:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080D8EC4
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080D8EBC
_080D8EB4:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080D8EDC
_080D8EBC:
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	b _080D8EDC
_080D8EC4:
	strh r5, [r4, 0x12]
	b _080D8EDC
_080D8EC8:
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
	b _080D8EDC
_080D8ECE:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D8EDC
	adds r0, r2, 0
	bl move_anim_task_del
_080D8EDC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D8AF8

	thumb_func_start sub_80D8BA8
sub_80D8BA8: @ 80D8EE4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	movs r1, 0
	str r1, [sp, 0x4]
	ldr r1, _080D8F5C
	lsrs r0, 22
	adds r4, r0, r1
	ldrb r0, [r4, 0x3]
	lsls r0, 24
	asrs r0, 28
	mov r8, r0
	cmp r0, 0x2
	beq _080D8FD0
	ldrh r0, [r4, 0x2]
	lsls r0, 20
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080D8FD0
	movs r0, 0x1
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, r8
	cmp r1, 0
	beq _080D8F60
	cmp r1, 0x1
	beq _080D8F96
	b _080D8FE2
	.align 2, 0
_080D8F5C: .4byte gUnknown_083D9DC4
_080D8F60:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r5, 0
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r6, 16
	asrs r1, 16
	subs r1, r0
	b _080D8FCA
_080D8F96:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r7, 16
	asrs r1, 16
	adds r1, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r5, 0
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x6
	bl __divsi3
	lsls r1, r6, 16
	asrs r1, 16
	adds r1, r0
_080D8FCA:
	lsls r1, 16
	lsrs r6, r1, 16
	b _080D8FE2
_080D8FD0:
	ldrh r0, [r4]
	lsls r0, 22
	asrs r0, 6
	lsrs r7, r0, 16
	ldr r0, [r4]
	lsls r0, 12
	asrs r0, 22
	lsls r0, 16
	lsrs r6, r0, 16
_080D8FE2:
	lsls r0, r6, 16
	asrs r0, 16
	adds r0, 0x8
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	lsls r1, r7, 16
	asrs r1, 16
	subs r1, r0
	ldr r0, _080D903C
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x8
	negs r2, r2
	movs r3, 0x12
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _080D9044
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _080D9040
	adds r4, r0
	adds r0, r4, 0
	mov r1, r9
	bl StartSpriteAffineAnim
	mov r0, sp
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	strh r7, [r4, 0x34]
	strh r6, [r4, 0x36]
	mov r1, r9
	strh r1, [r4, 0x38]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x3A]
	mov r1, r10
	strh r1, [r4, 0x3C]
	movs r0, 0x1
	b _080D9046
	.align 2, 0
_080D903C: .4byte gSpriteTemplate_83D9E3C
_080D9040: .4byte gSprites
_080D9044:
	movs r0, 0
_080D9046:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80D8BA8

	thumb_func_start sub_80D8D1C
sub_80D8D1C: @ 80D9058
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r2, r1, 0
	adds r2, 0x8
	strh r2, [r4, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x34
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bge _080D9082
	lsls r0, r2, 16
	asrs r0, 16
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080D9132
_080D9082:
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080D9104
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D9104
	ldr r0, _080D90F8
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	movs r3, 0x36
	ldrsh r2, [r4, r3]
	adds r3, r4, 0
	adds r3, 0x43
	ldrb r3, [r3]
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2E]
	cmp r0, 0x40
	beq _080D90E6
	ldr r2, _080D90FC
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080D9100
	str r1, [r0]
	movs r3, 0x2E
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x3A]
	strh r1, [r0, 0x3A]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0x3C]
	strh r1, [r0, 0x3C]
_080D90E6:
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	b _080D9132
	.align 2, 0
_080D90F8: .4byte gBattleAnimSpriteTemplate_83D9C78
_080D90FC: .4byte gSprites
_080D9100: .4byte sub_80D8E00
_080D9104:
	ldr r3, _080D9138
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D9132:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9138: .4byte gTasks
	thumb_func_end sub_80D8D1C

	thumb_func_start sub_80D8E00
sub_80D8E00: @ 80D913C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bne _080D917C
	ldr r3, _080D9184
	movs r0, 0x3C
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x3A
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080D917C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9184: .4byte gTasks
	thumb_func_end sub_80D8E00

	thumb_func_start unc_080B06FC
unc_080B06FC: @ 80D9188
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080D9208
	ldr r0, [r0]
	ldrb r1, [r0, 0x11]
	lsrs r0, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r0, r1
	subs r0, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x4
	bls _080D91A6
	movs r1, 0x4
_080D91A6:
	adds r0, r5, 0
	bl StartSpriteAffineAnim
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r6, _080D920C
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080D9210
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D91CE
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_080D91CE:
	ldr r4, _080D9214
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0xA]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080D9218
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9208: .4byte gUnknown_0202F7B4
_080D920C: .4byte gUnknown_03004B00
_080D9210: .4byte gUnknown_0202F7C8
_080D9214: .4byte gUnknown_0202F7C9
_080D9218: .4byte sub_80D8EE0
	thumb_func_end unc_080B06FC

	thumb_func_start sub_80D8EE0
sub_80D8EE0: @ 80D921C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080D923E
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _080D9244
	str r0, [r4, 0x1C]
	ldr r1, _080D9248
	adds r0, r4, 0
	bl oamt_set_x3A_32
_080D923E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9244: .4byte sub_8078600
_080D9248: .4byte move_anim_8072740
	thumb_func_end sub_80D8EE0

	thumb_func_start sub_80D8F10
sub_80D8F10: @ 80D924C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r3, _080D92A0
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D92A4
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	bl Random
	movs r5, 0xFF
	ands r5, r0
	movs r0, 0x80
	lsls r0, 1
	adds r6, r0, 0
	orrs r5, r6
	bl Random
	ldr r1, _080D92A8
	ands r1, r0
	adds r0, r1, 0
	cmp r0, 0xFF
	ble _080D9292
	subs r0, r6, r0
	lsls r0, 16
	lsrs r1, r0, 16
_080D9292:
	strh r5, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldr r0, _080D92AC
	str r0, [r4, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D92A0: .4byte 0x000003ff
_080D92A4: .4byte 0xfffffc00
_080D92A8: .4byte 0x000001ff
_080D92AC: .4byte sub_80D8F74
	thumb_func_end sub_80D8F10

	thumb_func_start sub_80D8F74
sub_80D8F74: @ 80D92B0
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r3, r0, r1
	strh r3, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r4, [r2, 0x36]
	adds r1, r4
	strh r1, [r2, 0x36]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080D92D4
	lsls r0, r3, 16
	asrs r0, 24
	negs r0, r0
	b _080D92D8
_080D92D4:
	lsls r0, r3, 16
	asrs r0, 24
_080D92D8:
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x15
	bne _080D92F6
	adds r0, r2, 0
	bl move_anim_8072740
_080D92F6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D8F74

	thumb_func_start sub_80D8FC0
sub_80D8FC0: @ 80D92FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080D9324
	ldrb r3, [r1]
	lsls r3, 1
	adds r3, r1
	ldr r1, _080D9328
	ldr r1, [r1]
	ldrb r1, [r1, 0x11]
	lsrs r2, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r2, r1
	subs r2, 0x1
	strh r2, [r3]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080D9324: .4byte gUnknown_03004B00
_080D9328: .4byte gUnknown_0202F7B4
	thumb_func_end sub_80D8FC0

	thumb_func_start unc_080B08A0
unc_080B08A0: @ 80D932C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080D935C
	movs r0, 0
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl sub_807867C
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	movs r0, 0xF
	strh r0, [r4, 0x2E]
	ldr r0, _080D9360
	str r0, [r4, 0x1C]
	ldr r1, _080D9364
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D935C: .4byte gUnknown_03004B00
_080D9360: .4byte sub_80782D8
_080D9364: .4byte move_anim_8072740
	thumb_func_end unc_080B08A0

	thumb_func_start sub_80D902C
sub_80D902C: @ 80D9368
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D93AC
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080D9390
	ldr r0, _080D93B0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D9390
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x6]
	negs r0, r0
	strh r0, [r4, 0x6]
_080D9390:
	ldr r4, _080D93AC
	ldrb r1, [r4, 0xC]
	adds r0, r5, 0
	bl StartSpriteAnim
	movs r0, 0
	strh r0, [r4, 0xC]
	adds r0, r5, 0
	bl sub_8079534
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D93AC: .4byte gUnknown_03004B00
_080D93B0: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80D902C

	thumb_func_start sub_80D9078
sub_80D9078: @ 80D93B4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D93D0
	ldr r0, _080D93DC
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0x6]
	negs r1, r1
	strh r1, [r0, 0x6]
_080D93D0:
	adds r0, r4, 0
	bl sub_80D902C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D93DC: .4byte gUnknown_03004B00
	thumb_func_end sub_80D9078

	thumb_func_start sub_80D90A4
sub_80D90A4: @ 80D93E0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D9400
	ldrb r1, [r4, 0x8]
	bl StartSpriteAnim
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D9404
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080D940C
	.align 2, 0
_080D9400: .4byte gUnknown_03004B00
_080D9404:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080D940C:
	ldr r0, _080D9424
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0x2E]
	ldr r0, _080D9428
	str r0, [r5, 0x1C]
	ldr r1, _080D942C
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9424: .4byte gUnknown_03004B00
_080D9428: .4byte sub_80782D8
_080D942C: .4byte move_anim_8072740
	thumb_func_end sub_80D90A4

	thumb_func_start sub_80D90F4
sub_80D90F4: @ 80D9430
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	ldr r0, _080D944C
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r9, r0
	cmp r1, 0
	bne _080D9454
	ldr r0, _080D9450
	b _080D9456
	.align 2, 0
_080D944C: .4byte gUnknown_03004B00
_080D9450: .4byte gUnknown_0202F7C8
_080D9454:
	ldr r0, _080D959C
_080D9456:
	ldrb r0, [r0]
	mov r8, r0
	mov r4, r9
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _080D9474
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	bl __umodsi3
	strh r0, [r4, 0x4]
_080D9474:
	ldrb r1, [r4, 0x4]
	adds r0, r5, 0
	bl StartSpriteAnim
	mov r0, r8
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	mov r0, r8
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	lsls r1, 15
	lsrs r6, r1, 16
	mov r0, r8
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080D94BE
	adds r0, 0x3
_080D94BE:
	lsls r4, r0, 14
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r6, 16
	asrs r1, 16
	bl __modsi3
	lsls r0, 16
	lsrs r6, r0, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _080D9500
	lsls r0, r6, 16
	negs r0, r0
	lsrs r6, r0, 16
_080D9500:
	bl Random
	adds r1, r7, 0
	ands r1, r0
	cmp r1, 0
	beq _080D9512
	lsls r0, r4, 16
	negs r0, r0
	lsrs r4, r0, 16
_080D9512:
	ldr r0, _080D95A0
	add r0, r8
	ldrb r1, [r0]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _080D9528
	lsls r0, r4, 16
	ldr r1, _080D95A4
	adds r0, r1
	lsrs r4, r0, 16
_080D9528:
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	ldrh r3, [r5, 0x22]
	adds r0, r3
	strh r0, [r5, 0x22]
	mov r1, r9
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x2E]
	ldr r0, _080D95A8
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	movs r3, 0x22
	ldrsh r2, [r5, r3]
	adds r3, r5, 0
	adds r3, 0x43
	ldrb r3, [r3]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x3C]
	cmp r0, 0x40
	beq _080D958C
	movs r0, 0x3C
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080D95AC
	adds r0, r4
	movs r1, 0
	bl StartSpriteAffineAnim
	movs r2, 0x3C
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080D95B0
	str r1, [r0]
_080D958C:
	ldr r0, _080D95B4
	str r0, [r5, 0x1C]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D959C: .4byte gUnknown_0202F7C9
_080D95A0: .4byte gUnknown_02024A72
_080D95A4: .4byte 0xfff00000
_080D95A8: .4byte gBattleAnimSpriteTemplate_83DB4A8
_080D95AC: .4byte gSprites
_080D95B0: .4byte SpriteCallbackDummy
_080D95B4: .4byte sub_80D927C
	thumb_func_end sub_80D90F4

	thumb_func_start sub_80D927C
sub_80D927C: @ 80D95B8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080D9600
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0x40
	beq _080D95F4
	ldr r4, _080D95FC
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	movs r0, 0x3C
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
_080D95F4:
	adds r0, r5, 0
	bl move_anim_8072740
	b _080D9604
	.align 2, 0
_080D95FC: .4byte gSprites
_080D9600:
	subs r0, r1, 0x1
	strh r0, [r5, 0x2E]
_080D9604:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80D927C

	thumb_func_start sub_80D92D0
sub_80D92D0: @ 80D960C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	movs r0, 0x1E
	strh r0, [r4, 0x2E]
	ldr r0, _080D962C
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9630
	ldrh r0, [r4, 0x20]
	subs r0, 0x14
	strh r0, [r4, 0x32]
	b _080D9642
	.align 2, 0
_080D962C: .4byte gUnknown_03004B00
_080D9630:
	ldrh r0, [r4, 0x20]
	adds r0, 0x14
	strh r0, [r4, 0x32]
	adds r2, r4, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
_080D9642:
	ldrh r0, [r4, 0x22]
	subs r0, 0x14
	strh r0, [r4, 0x36]
	ldr r0, _080D965C
	str r0, [r4, 0x1C]
	ldr r1, _080D9660
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D965C: .4byte sub_8078B34
_080D9660: .4byte sub_80D9328
	thumb_func_end sub_80D92D0

	thumb_func_start sub_80D9328
sub_80D9328: @ 80D9664
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x38]
	adds r0, 0x1
	movs r6, 0
	strh r0, [r5, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	bne _080D96A4
	ldrh r2, [r5, 0x20]
	ldrh r4, [r5, 0x24]
	subs r0, r2, r4
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x22]
	ldrh r3, [r5, 0x26]
	subs r0, r1, r3
	strh r0, [r5, 0x36]
	movs r0, 0x8
	strh r0, [r5, 0x2E]
	adds r2, r4
	strh r2, [r5, 0x20]
	adds r1, r3
	strh r1, [r5, 0x22]
	strh r6, [r5, 0x26]
	strh r6, [r5, 0x24]
	ldr r0, _080D96AC
	str r0, [r5, 0x1C]
	ldr r1, _080D96B0
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080D96A4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D96AC: .4byte sub_8078B34
_080D96B0: .4byte move_anim_8072740
	thumb_func_end sub_80D9328

	thumb_func_start sub_80D9378
sub_80D9378: @ 80D96B4
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080D9730
	ldrb r1, [r0]
	movs r0, 0x2
	ldr r2, _080D9734
	eors r0, r1
	ldrb r1, [r2]
	cmp r0, r1
	bne _080D96E0
	ldrb r0, [r2]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080D96E0
	ldr r1, _080D9738
	movs r2, 0
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1]
_080D96E0:
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080D9730
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D96FE
	ldr r1, _080D9738
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080D96FE:
	ldr r4, _080D9738
	ldrh r0, [r4, 0x6]
	movs r5, 0
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x3A]
	strh r5, [r6, 0x3C]
	ldr r0, _080D973C
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9730: .4byte gUnknown_0202F7C8
_080D9734: .4byte gUnknown_0202F7C9
_080D9738: .4byte gUnknown_03004B00
_080D973C: .4byte sub_80D9404
	thumb_func_end sub_80D9378

	thumb_func_start sub_80D9404
sub_80D9404: @ 80D9740
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _080D976C
	ldrh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x3C]
	adds r0, r2
	strh r0, [r4, 0x3C]
	b _080D9772
_080D976C:
	adds r0, r4, 0
	bl move_anim_8072740
_080D9772:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9404

	thumb_func_start sub_80D943C
sub_80D943C: @ 80D9778
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r5, _080D97A4
	ldrb r1, [r5, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldr r0, _080D97A8
	str r0, [r4, 0x1C]
	ldr r1, _080D97AC
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D97A4: .4byte gUnknown_03004B00
_080D97A8: .4byte sub_80782D8
_080D97AC: .4byte sub_80D9474
	thumb_func_end sub_80D943C

	thumb_func_start sub_80D9474
sub_80D9474: @ 80D97B0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r0, _080D97DC
	str r0, [r4, 0x1C]
	ldr r1, _080D97E0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D97DC: .4byte sub_80782D8
_080D97E0: .4byte move_anim_8072740
	thumb_func_end sub_80D9474

	thumb_func_start sub_80D94A8
sub_80D94A8: @ 80D97E4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080D9800
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080D9804
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9800: .4byte gUnknown_03004B00
_080D9804: .4byte sub_80D94CC
	thumb_func_end sub_80D94A8

	thumb_func_start sub_80D94CC
sub_80D94CC: @ 80D9808
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x1
	strh r0, [r5, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080D984C
	movs r0, 0x6
	strh r0, [r5, 0x2E]
	ldr r4, _080D9854
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080D9858
	str r0, [r5, 0x1C]
	ldr r1, _080D985C
	adds r0, r5, 0
	bl oamt_set_x3A_32
_080D984C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9854: .4byte gUnknown_0202F7C9
_080D9858: .4byte sub_8078B34
_080D985C: .4byte sub_80D9524
	thumb_func_end sub_80D94CC

	thumb_func_start sub_80D9524
sub_80D9524: @ 80D9860
	push {lr}
	movs r1, 0xF
	strh r1, [r0, 0x2E]
	ldr r1, _080D9874
	str r1, [r0, 0x1C]
	ldr r1, _080D9878
	bl oamt_set_x3A_32
	pop {r0}
	bx r0
	.align 2, 0
_080D9874: .4byte sub_80782D8
_080D9878: .4byte move_anim_8072740
	thumb_func_end sub_80D9524

	thumb_func_start sub_80D9540
sub_80D9540: @ 80D987C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080D98A8
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r1, _080D98A4
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080D9904
	.align 2, 0
_080D98A4: .4byte gUnknown_03004B00
_080D98A8:
	ldrh r0, [r4, 0x30]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r2, 0x32
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
	cmp r0, 0x64
	ble _080D98F6
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	lsrs r0, r1, 31
	adds r0, r1, r0
	asrs r0, 1
	lsls r0, 1
	subs r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080D98F6:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x78
	ble _080D9904
	adds r0, r4, 0
	bl move_anim_8072740
_080D9904:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9540

	thumb_func_start sub_80D95D0
sub_80D95D0: @ 80D990C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D9920
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9928
	ldr r4, _080D9924
	b _080D992A
	.align 2, 0
_080D9920: .4byte gUnknown_03004B00
_080D9924: .4byte gUnknown_0202F7C8
_080D9928:
	ldr r4, _080D9970
_080D992A:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D9974
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r1, 0x4]
	ldrh r3, [r5, 0x22]
	adds r0, r3
	strh r0, [r5, 0x22]
	strh r2, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x32]
	strh r2, [r5, 0x34]
	ldr r0, _080D9978
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9970: .4byte gUnknown_0202F7C9
_080D9974: .4byte gUnknown_03004B00
_080D9978: .4byte sub_80D9640
	thumb_func_end sub_80D95D0

	thumb_func_start sub_80D9640
sub_80D9640: @ 80D997C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	cmp r2, 0
	beq _080D998E
	cmp r2, 0x1
	beq _080D99B2
	b _080D99EC
_080D998E:
	ldrh r0, [r1, 0x30]
	subs r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080D99EC
	movs r2, 0x32
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080D99AA
	adds r0, r1, 0
	bl move_anim_8072740
	b _080D99EC
_080D99AA:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _080D99EC
_080D99B2:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080D99DA
	movs r0, 0
	strh r0, [r1, 0x30]
	ldrh r0, [r1, 0x34]
	adds r0, 0x1
	strh r0, [r1, 0x34]
	ands r0, r2
	lsls r0, 16
	cmp r0, 0
	beq _080D99D6
	movs r0, 0x2
	b _080D99D8
_080D99D6:
	ldr r0, _080D99F0
_080D99D8:
	strh r0, [r1, 0x24]
_080D99DA:
	ldrh r0, [r1, 0x32]
	subs r0, 0x1
	strh r0, [r1, 0x32]
	lsls r0, 16
	cmp r0, 0
	bne _080D99EC
	adds r0, r1, 0
	bl move_anim_8072740
_080D99EC:
	pop {r0}
	bx r0
	.align 2, 0
_080D99F0: .4byte 0x0000fffe
	thumb_func_end sub_80D9640

	thumb_func_start sub_80D96B8
sub_80D96B8: @ 80D99F4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080D9A18
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080D9A20
	ldr r4, _080D9A1C
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x4]
	adds r0, r2
	b _080D9A32
	.align 2, 0
_080D9A18: .4byte gUnknown_03004B00
_080D9A1C: .4byte gUnknown_0202F7C8
_080D9A20:
	ldr r4, _080D9A7C
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
_080D9A32:
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x22]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	ldr r3, _080D9A80
	movs r4, 0x2
	ldrsh r0, [r3, r4]
	lsls r0, 4
	adds r1, r0
	ldr r4, _080D9A84
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080D9A88
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r1, 0
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r2, 0x2
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	beq _080D9AA0
	cmp r0, 0x1
	bgt _080D9A8C
	cmp r0, 0
	beq _080D9A96
	b _080D9AC6
	.align 2, 0
_080D9A7C: .4byte gUnknown_0202F7C9
_080D9A80: .4byte gUnknown_03004B00
_080D9A84: .4byte 0x000003ff
_080D9A88: .4byte 0xfffffc00
_080D9A8C:
	cmp r0, 0x2
	beq _080D9AB0
	cmp r0, 0x3
	beq _080D9AC0
	b _080D9AC6
_080D9A96:
	ldr r0, _080D9A9C
	b _080D9AC0
	.align 2, 0
_080D9A9C: .4byte 0x0000fffd
_080D9AA0:
	movs r0, 0x3
	strh r0, [r5, 0x3A]
	ldr r0, _080D9AAC
	strh r0, [r5, 0x3C]
	b _080D9ACE
	.align 2, 0
_080D9AAC: .4byte 0x0000fffd
_080D9AB0:
	ldr r0, _080D9ABC
	strh r0, [r5, 0x3A]
	movs r0, 0x3
	strh r0, [r5, 0x3C]
	b _080D9ACE
	.align 2, 0
_080D9ABC: .4byte 0x0000fffd
_080D9AC0:
	strh r0, [r5, 0x3A]
	strh r0, [r5, 0x3C]
	b _080D9ACE
_080D9AC6:
	adds r0, r5, 0
	bl move_anim_8072740
	b _080D9AD2
_080D9ACE:
	ldr r0, _080D9AD8
	str r0, [r5, 0x1C]
_080D9AD2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9AD8: .4byte sub_80D97A0
	thumb_func_end sub_80D96B8

	thumb_func_start sub_80D97A0
sub_80D97A0: @ 80D9ADC
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x3A]
	ldrh r2, [r1, 0x20]
	adds r0, r2
	strh r0, [r1, 0x20]
	ldrh r0, [r1, 0x3C]
	ldrh r2, [r1, 0x22]
	adds r0, r2
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080D9B04
	adds r0, r1, 0
	bl move_anim_8072740
_080D9B04:
	pop {r0}
	bx r0
	thumb_func_end sub_80D97A0

	thumb_func_start sub_80D97CC
sub_80D97CC: @ 80D9B08
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D9B54
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9B64
	ldr r4, _080D9B58
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D9B5C
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	ldr r0, _080D9B60
	b _080D9B80
	.align 2, 0
_080D9B54: .4byte gUnknown_03004B00
_080D9B58: .4byte gUnknown_02024C07
_080D9B5C: .4byte gUnknown_0202F7C8
_080D9B60: .4byte gUnknown_0202F7C9
_080D9B64:
	ldr r0, _080D9B9C
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	ldr r0, _080D9BA0
_080D9B80:
	ldrb r0, [r0]
	strh r0, [r5, 0x3C]
	movs r0, 0
	strh r0, [r5, 0x2E]
	movs r0, 0xC
	strh r0, [r5, 0x30]
	movs r0, 0x8
	strh r0, [r5, 0x32]
	ldr r0, _080D9BA4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9B9C: .4byte gUnknown_0202F7C9
_080D9BA0: .4byte gUnknown_0202F7C8
_080D9BA4: .4byte sub_80D986C
	thumb_func_end sub_80D97CC

	thumb_func_start sub_80D986C
sub_80D986C: @ 80D9BA8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB4
	bne _080D9C02
	ldr r1, _080D9C08
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D9C0C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080D9C10
	str r0, [r4, 0x1C]
_080D9C02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9C08: .4byte 0x04000050
_080D9C0C: .4byte move_anim_8074EE0
_080D9C10: .4byte sub_8078BB8
	thumb_func_end sub_80D986C

	thumb_func_start sub_80D98D8
sub_80D98D8: @ 80D9C14
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080D9C60
	ldrh r0, [r4]
	strh r0, [r5, 0x20]
	movs r2, 0x78
	strh r2, [r5, 0x22]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x2E]
	adds r0, r5, 0
	adds r0, 0x36
	adds r1, r5, 0
	adds r1, 0x38
	lsls r2, 8
	bl sub_8079BF4
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x3A]
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	lsls r0, 2
	adds r1, r0
	ldr r3, _080D9C64
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080D9C68
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r0, _080D9C6C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9C60: .4byte gUnknown_03004B00
_080D9C64: .4byte 0x000003ff
_080D9C68: .4byte 0xfffffc00
_080D9C6C: .4byte sub_80D9934
	thumb_func_end sub_80D98D8

	thumb_func_start sub_80D9934
sub_80D9934: @ 80D9C70
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r7, r1]
	cmp r0, 0
	beq _080D9CC2
	movs r2, 0x36
	ldrsh r0, [r7, r2]
	movs r2, 0x38
	ldrsh r1, [r7, r2]
	bl sub_8079BFC
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r7, r1]
	subs r4, r0
	adds r0, r7, 0
	adds r0, 0x36
	adds r1, r7, 0
	adds r1, 0x38
	adds r2, r4, 0
	bl sub_8079BF4
	asrs r4, 8
	strh r4, [r7, 0x22]
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x8
	negs r0, r0
	cmp r4, r0
	bge _080D9CBA
	adds r0, r7, 0
	bl move_anim_8072740
	b _080D9D18
_080D9CBA:
	ldrh r0, [r7, 0x2E]
	subs r0, 0x1
	strh r0, [r7, 0x2E]
	b _080D9D18
_080D9CC2:
	ldr r4, _080D9D24
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _080D9D28
	mov r8, r2
	ldrb r0, [r2]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	subs r4, r6
	strh r4, [r7, 0x2E]
	lsrs r0, 24
	subs r0, r5
	strh r0, [r7, 0x30]
	ldrh r0, [r7, 0x20]
	lsls r0, 4
	strh r0, [r7, 0x32]
	ldrh r0, [r7, 0x22]
	lsls r0, 4
	strh r0, [r7, 0x34]
	ldr r0, _080D9D2C
	str r0, [r7, 0x1C]
_080D9D18:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D9D24: .4byte gUnknown_0202F7C8
_080D9D28: .4byte gUnknown_0202F7C9
_080D9D2C: .4byte sub_80D99F4
	thumb_func_end sub_80D9934

	thumb_func_start sub_80D99F4
sub_80D99F4: @ 80D9D30
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x34]
	adds r1, r3
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x8
	lsls r0, 16
	movs r1, 0x80
	lsls r1, 17
	cmp r0, r1
	bhi _080D9D6A
	adds r1, r3, 0
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	blt _080D9D6A
	cmp r1, 0x78
	ble _080D9D70
_080D9D6A:
	adds r0, r2, 0
	bl move_anim_8072740
_080D9D70:
	pop {r0}
	bx r0
	thumb_func_end sub_80D99F4

	thumb_func_start sub_80D9A38
sub_80D9A38: @ 80D9D74
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080D9DA8
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9DB8
	ldr r4, _080D9DAC
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r0, _080D9DB0
	ldrb r4, [r0]
	ldr r0, _080D9DB4
	b _080D9DBE
	.align 2, 0
_080D9DA8: .4byte gUnknown_03004B00
_080D9DAC: .4byte gUnknown_02024C07
_080D9DB0: .4byte gUnknown_0202F7C9
_080D9DB4: .4byte gUnknown_0202F7C8
_080D9DB8:
	ldr r0, _080D9DF0
	ldrb r4, [r0]
	ldr r0, _080D9DF4
_080D9DBE:
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D9DF8
	ldrb r2, [r5, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x8
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x47
	b _080D9E12
	.align 2, 0
_080D9DF0: .4byte gUnknown_0202F7C8
_080D9DF4: .4byte gUnknown_0202F7C9
_080D9DF8:
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D9E18
	ldrb r2, [r5, 0x3]
	lsls r1, r2, 26
	lsrs r1, 27
	movs r0, 0x18
	orrs r1, r0
	lsls r1, 1
	subs r0, 0x57
_080D9E12:
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
_080D9E18:
	movs r0, 0x10
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _080D9E58
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080D9E5C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D9E58: .4byte move_anim_8072740
_080D9E5C: .4byte sub_8078BB8
	thumb_func_end sub_80D9A38

	thumb_func_start sub_80D9B24
sub_80D9B24: @ 80D9E60
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080D9E76
	adds r0, r4, 0
	bl move_anim_8072740
_080D9E76:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9B24

	thumb_func_start sub_80D9B48
sub_80D9B48: @ 80D9E84
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _080D9F00
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r1, _080D9F04
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1]
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x2]
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x36]
	ldr r0, _080D9F08
	ldrb r6, [r0]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080D9ECE
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080D9ECE:
	movs r0, 0x1
	ands r6, r0
	cmp r6, 0
	beq _080D9EE2
	ldrh r0, [r5, 0x32]
	negs r0, r0
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
_080D9EE2:
	ldrh r1, [r5, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	ldrh r0, [r5, 0x32]
	strh r0, [r5, 0x24]
	ldrh r0, [r5, 0x34]
	strh r0, [r5, 0x26]
	ldr r0, _080D9F0C
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D9F00: .4byte gUnknown_0202F7C9
_080D9F04: .4byte gUnknown_03004B00
_080D9F08: .4byte gUnknown_0202F7C4
_080D9F0C: .4byte sub_80D9B24
	thumb_func_end sub_80D9B48

	thumb_func_start sub_80D9BD4
sub_80D9BD4: @ 80D9F10
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080D9F28
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080D9F2C
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	b _080D9F34
	.align 2, 0
_080D9F28: .4byte gUnknown_03004B00
_080D9F2C:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080D9F34:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080D9F48
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
	b _080D9F5E
_080D9F48:
	ldr r0, _080D9F70
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080D9F5E
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080D9F5E:
	ldr r0, _080D9F74
	str r0, [r4, 0x1C]
	ldr r1, _080D9F78
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D9F70: .4byte gUnknown_0202F7C8
_080D9F74: .4byte sub_8078600
_080D9F78: .4byte move_anim_8072740
	thumb_func_end sub_80D9BD4

	thumb_func_start sub_80D9C40
sub_80D9C40: @ 80D9F7C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080D9FB6
	ldrh r0, [r4, 0x30]
	adds r0, 0x28
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x28
	ble _080D9FB6
	adds r0, r4, 0
	bl move_anim_8072740
_080D9FB6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9C40

	thumb_func_start sub_80D9C80
sub_80D9C80: @ 80D9FBC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080D9FEC
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080D9FF4
	cmp r0, 0x1
	bgt _080DA00E
	cmp r0, 0
	bne _080DA00E
	movs r0, 0
	bl sub_80789D4
	ldr r0, _080D9FF0
	ldrh r0, [r0]
	strh r0, [r4, 0x18]
	b _080DA006
	.align 2, 0
_080D9FEC: .4byte gTasks
_080D9FF0: .4byte gUnknown_03004B00
_080D9FF4:
	ldrh r0, [r4, 0x18]
	subs r0, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DA01A
_080DA006:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DA01A
_080DA00E:
	movs r2, 0xA0
	lsls r2, 3
	adds r0, r2, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
_080DA01A:
	movs r2, 0xB0
	lsls r2, 4
	adds r0, r2, 0
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	strh r0, [r4, 0x1C]
	ldr r0, _080DA048
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DA050
	ldr r1, _080DA04C
	ldrh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r7, r1, 0
	b _080DA060
	.align 2, 0
_080DA048: .4byte gUnknown_0202F7C9
_080DA04C: .4byte gUnknown_030041B0
_080DA050:
	ldr r2, _080DA0A0
	ldrh r1, [r4, 0x1A]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	adds r7, r2, 0
_080DA060:
	ldr r3, _080DA0A4
	ldrh r2, [r4, 0x1C]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r1, [r3]
	adds r0, r1
	strh r0, [r3]
	movs r0, 0xFF
	ldrb r1, [r4, 0x1A]
	movs r5, 0
	strh r1, [r4, 0x1A]
	ands r0, r2
	strh r0, [r4, 0x1C]
	ldr r0, _080DA0A8
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080DA098
	strh r5, [r7]
	strh r5, [r3]
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r6, 0
	bl move_anim_task_del
_080DA098:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA0A0: .4byte gUnknown_030041B0
_080DA0A4: .4byte gUnknown_030041B8
_080DA0A8: .4byte gUnknown_03004B00
	thumb_func_end sub_80D9C80

	thumb_func_start sub_80D9D70
sub_80D9D70: @ 80DA0AC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DA100
	movs r1, 0x6
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DA0C2
	adds r0, r5, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080DA0C2:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x2E]
	ldr r4, _080DA104
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080DA108
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080DA10C
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA100: .4byte gUnknown_03004B00
_080DA104: .4byte gUnknown_0202F7C9
_080DA108: .4byte 0x0000ffe2
_080DA10C: .4byte sub_80D9DD4
	thumb_func_end sub_80D9D70

	thumb_func_start sub_80D9DD4
sub_80D9DD4: @ 80DA110
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DA124
	adds r0, r4, 0
	bl move_anim_8072740
_080DA124:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9DD4

	thumb_func_start sub_80D9DF0
sub_80D9DF0: @ 80DA12C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r5, _080DA1A0
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DA144
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAnim
_080DA144:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DA1A4
	ldrb r0, [r0]
	mov r6, sp
	adds r6, 0x2
	movs r1, 0x1
	mov r2, sp
	adds r3, r6, 0
	bl sub_807A3FC
	ldr r0, _080DA1A8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DA172
	ldrh r0, [r5, 0x8]
	negs r0, r0
	strh r0, [r5, 0x8]
_080DA172:
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	mov r1, sp
	ldrh r0, [r5, 0x8]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r6, [r6]
	adds r0, r6
	strh r0, [r4, 0x36]
	ldr r0, _080DA1AC
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080DA1B0
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DA1A0: .4byte gUnknown_03004B00
_080DA1A4: .4byte gUnknown_0202F7C9
_080DA1A8: .4byte gUnknown_0202F7C8
_080DA1AC: .4byte 0x0000ffe2
_080DA1B0: .4byte sub_80D9E78
	thumb_func_end sub_80D9DF0

	thumb_func_start sub_80D9E78
sub_80D9E78: @ 80DA1B4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DA1C8
	adds r0, r4, 0
	bl move_anim_8072740
_080DA1C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9E78

	thumb_func_start sub_80D9E94
sub_80D9E94: @ 80DA1D0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DA21C
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r1, [r5]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrh r1, [r5, 0x2]
	adds r0, r1
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_8078A5C
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x38]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r4, 0x3A]
	ldr r0, _080DA220
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA21C: .4byte gUnknown_03004B00
_080DA220: .4byte sub_80D9EE8
	thumb_func_end sub_80D9E94

	thumb_func_start sub_80D9EE8
sub_80D9EE8: @ 80DA224
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078394
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x3A]
	subs r0, r1
	strh r0, [r4, 0x32]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DA24A
	adds r0, r4, 0
	bl move_anim_8072740
_080DA24A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9EE8

	thumb_func_start sub_80D9F14
sub_80D9F14: @ 80DA250
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DA2B0
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080DA2B4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DA27C
	ldr r1, _080DA2B8
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DA27C:
	ldr r0, _080DA2B8
	ldrh r2, [r0]
	ldrh r1, [r4, 0x20]
	adds r2, r1
	strh r2, [r4, 0x20]
	ldrh r1, [r0, 0x2]
	ldrh r3, [r4, 0x22]
	adds r1, r3
	strh r1, [r4, 0x22]
	ldrh r3, [r0, 0x8]
	strh r3, [r4, 0x2E]
	ldrh r0, [r0, 0x4]
	adds r2, r0
	strh r2, [r4, 0x32]
	adds r1, r3
	strh r1, [r4, 0x36]
	ldr r0, _080DA2BC
	str r0, [r4, 0x1C]
	ldr r1, _080DA2C0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA2B0: .4byte gUnknown_0202F7C9
_080DA2B4: .4byte gUnknown_0202F7C8
_080DA2B8: .4byte gUnknown_03004B00
_080DA2BC: .4byte sub_8078B34
_080DA2C0: .4byte move_anim_8072740
	thumb_func_end sub_80D9F14

	thumb_func_start sub_80D9F88
sub_80D9F88: @ 80DA2C4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DA2DC
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DA2E0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
	b _080DA316
	.align 2, 0
_080DA2DC: .4byte gUnknown_03004B00
_080DA2E0:
	ldr r0, _080DA320
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0x1
	bl sub_807A3FC
	ldr r0, _080DA324
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DA306
	ldrh r0, [r5]
	negs r0, r0
	strh r0, [r5]
_080DA306:
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
_080DA316:
	ldr r0, _080DA328
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA320: .4byte gUnknown_0202F7C9
_080DA324: .4byte gUnknown_0202F7C8
_080DA328: .4byte sub_80D9FF0
	thumb_func_end sub_80D9F88

	thumb_func_start sub_80D9FF0
sub_80D9FF0: @ 80DA32C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0xB
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x4
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r0, 0x30
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DA368
	adds r0, r4, 0
	bl move_anim_8072740
_080DA368:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80D9FF0

	thumb_func_start sub_80DA034
sub_80DA034: @ 80DA370
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	bl sub_8078764
	ldrh r0, [r4, 0x22]
	adds r0, 0x14
	strh r0, [r4, 0x22]
	movs r0, 0xBF
	strh r0, [r4, 0x30]
	ldr r1, _080DA394
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA394: .4byte sub_80DA05C
	thumb_func_end sub_80DA034

	thumb_func_start sub_80DA05C
sub_80DA05C: @ 80DA398
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x30]
	adds r0, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x47
	bne _080DA3D2
	adds r0, r4, 0
	bl move_anim_8072740
_080DA3D2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DA05C

	thumb_func_start sub_80DA09C
sub_80DA09C: @ 80DA3D8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080DA408
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r1, _080DA40C
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r1]
	strh r0, [r4, 0xA]
	ldr r0, _080DA410
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldr r0, _080DA414
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA408: .4byte gTasks
_080DA40C: .4byte gUnknown_03004B00
_080DA410: .4byte 0x00002719
_080DA414: .4byte sub_80DA0DC
	thumb_func_end sub_80DA09C

	thumb_func_start sub_80DA0DC
sub_80DA0DC: @ 80DA418
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080DA498
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xA
	ldrsh r1, [r3, r4]
	adds r7, r2, 0
	cmp r0, r1
	bne _080DA476
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrb r0, [r3, 0xC]
	ldr r2, _080DA49C
	lsls r0, 4
	movs r3, 0x84
	lsls r3, 1
	adds r1, r0, r3
	lsls r1, 1
	adds r1, r2
	ldrh r6, [r1]
	movs r4, 0x7
	mov r12, r0
	ldr r0, _080DA4A0
	add r0, r12
	lsls r0, 1
	adds r3, r0, r2
_080DA45E:
	ldrh r0, [r3]
	strh r0, [r1]
	subs r3, 0x2
	subs r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bgt _080DA45E
	ldr r0, _080DA4A4
	add r0, r12
	lsls r0, 1
	adds r0, r2
	strh r6, [r0]
_080DA476:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r7
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bne _080DA490
	adds r0, r5, 0
	bl move_anim_task_del
_080DA490:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DA498: .4byte gTasks
_080DA49C: .4byte gPlttBufferFaded
_080DA4A0: .4byte 0x00000107
_080DA4A4: .4byte 0x00000101
	thumb_func_end sub_80DA0DC

	thumb_func_start sub_80DA16C
sub_80DA16C: @ 80DA4A8
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DA514
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DA4C8
	ldr r1, _080DA518
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080DA4C8:
	ldr r4, _080DA518
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrh r0, [r6, 0x20]
	strh r0, [r6, 0x30]
	ldr r5, _080DA51C
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrh r0, [r6, 0x22]
	strh r0, [r6, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	adds r0, r6, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080DA520
	str r0, [r6, 0x1C]
	ldr r1, _080DA524
	adds r0, r6, 0
	bl oamt_set_x3A_32
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DA514: .4byte gUnknown_0202F7C8
_080DA518: .4byte gUnknown_03004B00
_080DA51C: .4byte gUnknown_0202F7C9
_080DA520: .4byte sub_80785E4
_080DA524: .4byte sub_80DA1EC
	thumb_func_end sub_80DA16C

	thumb_func_start sub_80DA1EC
sub_80DA1EC: @ 80DA528
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080DA53C
	adds r0, r4, 0
	bl move_anim_8072740
_080DA53C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DA1EC

	thumb_func_start sub_80DA208
sub_80DA208: @ 80DA544
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DA5E0
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DA570
	ldr r1, _080DA5E4
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080DA570:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DA588
	ldr r0, _080DA5E4
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0, 0x6]
	negs r1, r1
	strh r1, [r0, 0x6]
_080DA588:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	ldr r2, _080DA5E4
	ldrh r1, [r2]
	ldrh r3, [r5, 0x20]
	adds r1, r3
	strh r1, [r5, 0x20]
	lsrs r0, 24
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r0, [r2, 0x8]
	strh r0, [r5, 0x2E]
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080DA5EC
	ldr r4, _080DA5E8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080DA5FE
	.align 2, 0
_080DA5E0: .4byte gUnknown_0202F7C8
_080DA5E4: .4byte gUnknown_03004B00
_080DA5E8: .4byte gUnknown_0202F7C9
_080DA5EC:
	ldr r0, _080DA62C
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080DA5FE:
	ldr r4, _080DA630
	ldrh r0, [r4, 0x4]
	ldrh r1, [r5, 0x32]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	ldrh r3, [r5, 0x36]
	adds r0, r3
	strh r0, [r5, 0x36]
	ldr r0, _080DA634
	str r0, [r5, 0x1C]
	ldr r1, _080DA638
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldrb r1, [r4, 0xA]
	adds r0, r5, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA62C: .4byte gUnknown_0202F7C9
_080DA630: .4byte gUnknown_03004B00
_080DA634: .4byte sub_8078B34
_080DA638: .4byte move_anim_8072740
	thumb_func_end sub_80DA208

	thumb_func_start sub_80DA300
sub_80DA300: @ 80DA63C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080DA678
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DA67C
	str r0, [r4, 0x1C]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	ldr r2, _080DA680
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA678: .4byte gUnknown_03004B00
_080DA67C: .4byte sub_80DA348
_080DA680: .4byte gSprites
	thumb_func_end sub_80DA300

	thumb_func_start sub_80DA348
sub_80DA348: @ 80DA684
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080DA698
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080DA6AA
_080DA698:
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
_080DA6AA:
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DA6C2
	adds r0, r2, 0
	bl move_anim_8072740
_080DA6C2:
	pop {r0}
	bx r0
	thumb_func_end sub_80DA348

	thumb_func_start sub_80DA38C
sub_80DA38C: @ 80DA6C8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DA6F0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DA6F8
	movs r0, 0x88
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldr r0, _080DA6F4
	strh r0, [r5, 0x22]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	b _080DA6FE
	.align 2, 0
_080DA6F0: .4byte gUnknown_0202F7C8
_080DA6F4: .4byte 0x0000ffe0
_080DA6F8:
	ldr r0, _080DA73C
	strh r0, [r5, 0x20]
	strh r0, [r5, 0x22]
_080DA6FE:
	ldr r0, _080DA740
	ldrh r0, [r0]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldr r4, _080DA744
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r0, _080DA748
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DA73C: .4byte 0x0000ffe0
_080DA740: .4byte gUnknown_03004B00
_080DA744: .4byte gUnknown_0202F7C9
_080DA748: .4byte sub_80DA410
	thumb_func_end sub_80DA38C

	thumb_func_start sub_80DA410
sub_80DA410: @ 80DA74C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078B5C
	ldrh r1, [r4, 0x34]
	lsrs r0, r1, 8
	cmp r0, 0xC8
	bls _080DA774
	ldrh r0, [r4, 0x24]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	movs r0, 0
	strh r0, [r4, 0x24]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x34]
_080DA774:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	adds r0, r1
	adds r0, 0x20
	movs r1, 0x98
	lsls r1, 1
	cmp r0, r1
	bhi _080DA796
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	cmp r0, 0xA0
	ble _080DA7BC
_080DA796:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	ldr r2, _080DA7C4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl move_anim_8072740
_080DA7BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA7C4: .4byte gSprites
	thumb_func_end sub_80DA410

	thumb_func_start sub_80DA48C
sub_80DA48C: @ 80DA7C8
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	subs r1, r0, 0x1
	strh r1, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bgt _080DA808
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DA7FA
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
_080DA7FA:
	adds r0, r4, 0
	bl DestroySprite
	ldr r1, _080DA810
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080DA808:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DA810: .4byte gUnknown_0202F7B2
	thumb_func_end sub_80DA48C

	thumb_func_start sub_80DA4D8
sub_80DA4D8: @ 80DA814
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r5, r7, 0
	adds r5, 0x2E
	ldr r0, _080DA834
	ldrh r1, [r0, 0xE]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080DA83C
	ldr r0, _080DA838
	b _080DA83E
	.align 2, 0
_080DA834: .4byte gUnknown_03004B00
_080DA838: .4byte gUnknown_0202F7C8
_080DA83C:
	ldr r0, _080DA8EC
_080DA83E:
	ldrb r6, [r0]
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DA854
	ldr r1, _080DA8F0
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DA854:
	adds r0, r6, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080DA8F0
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r7, 0x20]
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	ldrh r1, [r4, 0x2]
	lsrs r0, 24
	adds r1, r0, r1
	strh r1, [r7, 0x22]
	lsls r1, 8
	strh r1, [r5, 0x8]
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 1
	ldrh r2, [r5, 0xE]
	movs r1, 0x1
	ands r1, r2
	orrs r1, r0
	strh r1, [r5, 0xE]
	ldrb r0, [r5]
	movs r2, 0x4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	ldrh r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	strh r1, [r5, 0x2]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0xA]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x4]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x6]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0xC]
	subs r1, 0x40
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0x7F
	bhi _080DA954
	ldr r0, _080DA8F4
	ldr r2, _080DA8F8
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DA8FC
	adds r0, r6, 0
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r7, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, 0x5]
	b _080DA914
	.align 2, 0
_080DA8EC: .4byte gUnknown_0202F7C9
_080DA8F0: .4byte gUnknown_03004B00
_080DA8F4: .4byte gMain
_080DA8F8: .4byte 0x0000043d
_080DA8FC:
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
_080DA914:
	ldrb r1, [r5, 0xE]
	movs r4, 0x2
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	strb r0, [r5, 0xE]
	movs r1, 0x4
	ldrsh r0, [r5, r1]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	bne _080DA9B4
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r0, r2, 31
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	adds r0, r4, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	b _080DA9AA
_080DA954:
	adds r0, r6, 0
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	ldrb r0, [r5, 0xE]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0xE]
	movs r2, 0x4
	ldrsh r0, [r5, r2]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080DA9B4
	adds r3, r7, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	ands r1, r4
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r7, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	mov r1, r8
_080DA9AA:
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
_080DA9B4:
	ldrh r1, [r5, 0x2]
	lsrs r1, 6
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r3, _080DAA20
	ldrh r0, [r5, 0x2]
	lsls r0, 1
	adds r0, r3
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldrb r0, [r5, 0xC]
	muls r0, r1
	asrs r0, 8
	strh r0, [r7, 0x24]
	ldrb r2, [r7, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r1, 0x24
	ldrsh r0, [r7, r1]
	negs r0, r0
	asrs r0, 1
	ldrb r5, [r5, 0xA]
	adds r0, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r4, [r1]
	ldr r1, _080DAA24
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r4, [r2, 0x2]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	ldr r0, _080DAA28
	str r0, [r7, 0x1C]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DAA20: .4byte gSineTable
_080DAA24: .4byte gOamMatrices
_080DAA28: .4byte sub_80DA6F0
	thumb_func_end sub_80DA4D8

	thumb_func_start sub_80DA6F0
sub_80DA6F0: @ 80DAA2C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r5, r0, 0
	movs r6, 0
	movs r0, 0x2E
	adds r0, r5
	mov r12, r0
	ldrb r2, [r0]
	movs r7, 0x1
	movs r1, 0x1
	mov r9, r1
	mov r0, r9
	ands r0, r2
	cmp r0, 0
	beq _080DAA6C
	mov r3, r12
	ldrb r0, [r3, 0x1]
	adds r1, r0, 0
	adds r1, 0xFF
	strb r1, [r3, 0x1]
	lsls r0, 24
	cmp r0, 0
	beq _080DAA60
	b _080DB056
_080DAA60:
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DB056
_080DAA6C:
	mov r4, r12
	ldrh r0, [r4, 0x2]
	lsrs r4, r0, 6
	mov r8, r0
	cmp r4, 0x1
	bne _080DAA7A
	b _080DABD2
_080DAA7A:
	cmp r4, 0x1
	bgt _080DAA84
	cmp r4, 0
	beq _080DAA92
	b _080DAF8E
_080DAA84:
	cmp r4, 0x2
	bne _080DAA8A
	b _080DAD04
_080DAA8A:
	cmp r4, 0x3
	bne _080DAA90
	b _080DAE4A
_080DAA90:
	b _080DAF8E
_080DAA92:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080DAAA8
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r1, r12
	strb r0, [r1]
	strb r6, [r1, 0x1]
	b _080DABC6
_080DAAA8:
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080DAACC
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	mov r2, r12
	strb r1, [r2]
	strb r6, [r2, 0x1]
	b _080DABC6
_080DAACC:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DABC6
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r3, r12
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DABB6
	ldr r0, _080DAB48
	ldr r1, _080DAB4C
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DAB6A
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAB50
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DABA4
	.align 2, 0
_080DAB48: .4byte gMain
_080DAB4C: .4byte 0x0000043d
_080DAB50:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DABA2
_080DAB6A:
	mov r0, r12
	ldrb r1, [r0, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAB98
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	mov r1, r12
	ldrb r2, [r1, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DABB6
_080DAB98:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DABA2:
	mov r3, r12
_080DABA4:
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
_080DABB6:
	mov r4, r12
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r0, [r4, 0x2]
	mov r8, r0
_080DABC6:
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0xF
	ands r0, r1
	strb r0, [r2]
	b _080DAF8E
_080DABD2:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080DABE8
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r3, r12
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DACF8
_080DABE8:
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080DABFA
	adds r0, r2, 0
	orrs r0, r7
	mov r4, r12
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080DACF8
_080DABFA:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DACF8
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DACE8
	ldr r0, _080DAC7C
	ldr r1, _080DAC80
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DAC9E
	mov r2, r12
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAC84
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r3, r12
	b _080DACB4
	.align 2, 0
_080DAC7C: .4byte gMain
_080DAC80: .4byte 0x0000043d
_080DAC84:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DACD2
_080DAC9E:
	mov r3, r12
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DACC8
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
_080DACB4:
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
	b _080DACE8
_080DACC8:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DACD2:
	mov r0, r12
	ldrb r2, [r0, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
_080DACE8:
	mov r3, r12
	ldrb r1, [r3]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r4, [r3, 0x2]
	mov r8, r4
_080DACF8:
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x10
	b _080DAF88
_080DAD04:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x3
	bne _080DAD1A
	movs r0, 0x8
	orrs r0, r2
	orrs r0, r7
	mov r3, r12
	strb r0, [r3]
	strb r6, [r3, 0x1]
	b _080DAE3A
_080DAD1A:
	lsrs r0, r1, 28
	cmp r0, 0x1
	bne _080DAD2C
	adds r0, r2, 0
	orrs r0, r7
	mov r4, r12
	strb r0, [r4]
	strb r6, [r4, 0x1]
	b _080DAE3A
_080DAD2C:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	bne _080DAD36
	b _080DAE3A
_080DAD36:
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r6, 0x1
	eors r1, r6
	ands r1, r7
	movs r0, 0x2
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DAE28
	ldr r0, _080DADA8
	ldr r3, _080DADAC
	adds r0, r3
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, 0
	beq _080DADE0
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DADB0
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DAE14
	.align 2, 0
_080DADA8: .4byte gMain
_080DADAC: .4byte 0x0000043d
_080DADB0:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r0, r12
	ldrb r2, [r0, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DAE28
_080DADE0:
	mov r3, r12
	ldrb r1, [r3, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAE0A
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
	b _080DAE28
_080DAE0A:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DAE14:
	mov r4, r12
	ldrb r2, [r4, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r6
	ands r0, r7
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0xE]
_080DAE28:
	mov r0, r12
	ldrb r1, [r0]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r2, [r1, 0x2]
	mov r8, r2
_080DAE3A:
	mov r3, r12
	ldrb r0, [r3]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x20
	orrs r1, r0
	strb r1, [r3]
	b _080DAF8E
_080DAE4A:
	lsls r1, r2, 24
	lsrs r0, r1, 28
	cmp r0, 0x2
	bne _080DAE5C
	movs r0, 0x8
	orrs r0, r2
	mov r4, r12
	strb r0, [r4]
	b _080DAF7E
_080DAE5C:
	lsrs r0, r1, 28
	cmp r0, 0
	bne _080DAE80
	lsls r0, r2, 30
	lsrs r0, 31
	movs r1, 0x1
	eors r0, r1
	ands r0, r7
	lsls r0, 1
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	orrs r1, r7
	mov r0, r12
	strb r1, [r0]
	strb r6, [r0, 0x1]
	b _080DAF7E
_080DAE80:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080DAF7E
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r1, r2, 31
	lsrs r1, 31
	movs r4, 0x1
	eors r1, r4
	ands r1, r7
	movs r6, 0x2
	negs r6, r6
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	lsls r0, 31
	lsrs r0, 31
	adds r1, r5, 0
	adds r1, 0x2A
	strb r0, [r1]
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	mov r2, r12
	ldrb r1, [r2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DAF6E
	ldr r0, _080DAF00
	ldr r3, _080DAF04
	adds r0, r3
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DAF22
	ldrb r1, [r2, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAF08
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	mov r0, r12
	ldrb r2, [r0, 0xE]
	b _080DAF3C
	.align 2, 0
_080DAF00: .4byte gMain
_080DAF04: .4byte 0x0000043d
_080DAF08:
	ldrb r2, [r5, 0x5]
	lsls r1, r2, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	b _080DAF5A
_080DAF22:
	mov r0, r12
	ldrb r1, [r0, 0xE]
	mov r0, r9
	ands r0, r1
	cmp r0, 0
	bne _080DAF50
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	subs r0, 0xC
	strb r0, [r1]
	mov r1, r12
	ldrb r2, [r1, 0xE]
_080DAF3C:
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	mov r2, r12
	strb r1, [r2, 0xE]
	b _080DAF6E
_080DAF50:
	adds r1, r5, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0xC
	strb r0, [r1]
_080DAF5A:
	mov r3, r12
	ldrb r2, [r3, 0xE]
	lsls r0, r2, 31
	lsrs r0, 31
	eors r0, r4
	ands r0, r7
	adds r1, r6, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xE]
_080DAF6E:
	mov r4, r12
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrh r0, [r4, 0x2]
	mov r8, r0
_080DAF7E:
	mov r1, r12
	ldrb r0, [r1]
	movs r1, 0xF
	ands r1, r0
	movs r0, 0x30
_080DAF88:
	orrs r1, r0
	mov r2, r12
	strb r1, [r2]
_080DAF8E:
	mov r3, r12
	ldrb r1, [r3]
	lsls r1, 30
	lsrs r1, 31
	mov r0, r12
	adds r0, 0xC
	adds r0, r1
	ldrb r1, [r0]
	ldr r3, _080DB01C
	mov r4, r8
	lsls r0, r4, 1
	adds r0, r3
	movs r2, 0
	ldrsh r0, [r0, r2]
	muls r0, r1
	asrs r0, 8
	strh r0, [r5, 0x24]
	ldrb r2, [r5, 0x3]
	lsls r2, 26
	lsrs r2, 27
	movs r4, 0x24
	ldrsh r0, [r5, r4]
	negs r0, r0
	asrs r0, 1
	mov r1, r12
	ldrb r1, [r1, 0xA]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r3
	ldrh r6, [r1]
	ldr r1, _080DB020
	lsls r2, 3
	adds r2, r1
	adds r0, 0x40
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r2, 0x6]
	strh r0, [r2]
	strh r6, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	mov r2, r12
	ldrh r0, [r2, 0x6]
	ldrh r3, [r2, 0x8]
	adds r0, r3
	strh r0, [r2, 0x8]
	lsls r0, 16
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r4, 0x4
	ldrsh r0, [r2, r4]
	movs r1, 0x80
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080DB024
	ldrh r0, [r2, 0x4]
	subs r1, 0x1
	ands r1, r0
	ldrh r0, [r2, 0x2]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r2, 0x2]
	b _080DB03A
	.align 2, 0
_080DB01C: .4byte gSineTable
_080DB020: .4byte gOamMatrices
_080DB024:
	mov r1, r12
	ldrh r0, [r1, 0x4]
	ldr r1, _080DB064
	ands r1, r0
	mov r2, r12
	ldrh r2, [r2, 0x2]
	adds r1, r2
	movs r0, 0xFF
	ands r1, r0
	mov r3, r12
	strh r1, [r3, 0x2]
_080DB03A:
	movs r4, 0x22
	ldrsh r1, [r5, r4]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	adds r1, r0
	mov r3, r12
	ldrh r0, [r3, 0xE]
	lsrs r0, 1
	cmp r1, r0
	blt _080DB056
	movs r0, 0
	strh r0, [r5, 0x2E]
	ldr r0, _080DB068
	str r0, [r5, 0x1C]
_080DB056:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB064: .4byte 0x00007fff
_080DB068: .4byte sub_80DA48C
	thumb_func_end sub_80DA6F0

	thumb_func_start sub_80DAD30
sub_80DAD30: @ 80DB06C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _080DB0B4
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldr r5, _080DB0B8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _080DB0BC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB0B4: .4byte gUnknown_0202F7C9
_080DB0B8: .4byte gUnknown_0202F7C8
_080DB0BC: .4byte sub_807941C
	thumb_func_end sub_80DAD30

	thumb_func_start sub_80DAD84
sub_80DAD84: @ 80DB0C0
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r5, _080DB108
	ldrh r0, [r5]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x34]
	ldr r0, _080DB10C
	ldr r1, _080DB110
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080DB180
	ldr r0, _080DB114
	ldr r1, _080DB118
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DB11C
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	b _080DB12A
	.align 2, 0
_080DB108: .4byte gUnknown_03004B00
_080DB10C: .4byte gMain
_080DB110: .4byte 0x0000043d
_080DB114: .4byte gUnknown_02024A72
_080DB118: .4byte gUnknown_0202F7C9
_080DB11C:
	adds r0, r2, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x28
_080DB12A:
	strh r0, [r4, 0x3C]
	ldr r0, _080DB158
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080DB160
	ldr r0, _080DB15C
	ldrb r0, [r0]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 2
	ldrb r2, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080DB194
	.align 2, 0
_080DB158: .4byte gUnknown_03004B00
_080DB15C: .4byte gUnknown_0202F7C9
_080DB160:
	ldr r0, _080DB17C
	ldrb r0, [r0]
	bl sub_8079ED4
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	b _080DB194
	.align 2, 0
_080DB17C: .4byte gUnknown_0202F7C9
_080DB180:
	ldr r0, _080DB238
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r5, [r5, 0x6]
	adds r0, r5
	strh r0, [r4, 0x3C]
_080DB194:
	ldr r5, _080DB23C
	ldrh r3, [r4, 0x30]
	movs r1, 0xFF
	ands r1, r3
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	movs r2, 0
	strh r0, [r4, 0x36]
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x38]
	strh r2, [r4, 0x3A]
	strh r2, [r4, 0x26]
	strh r2, [r4, 0x24]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r6, r0, 27
	lsls r3, 16
	lsrs r3, 24
	strh r3, [r4, 0x30]
	bl Random
	lsls r0, 16
	asrs r7, r0, 16
	movs r0, 0x80
	lsls r0, 8
	ands r0, r7
	cmp r0, 0
	beq _080DB1DE
	ldrh r1, [r4, 0x30]
	movs r0, 0xFF
	subs r0, r1
	strh r0, [r4, 0x30]
_080DB1DE:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	ldr r3, _080DB240
	lsls r2, r6, 3
	adds r2, r3
	adds r1, 0x40
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	strh r1, [r2, 0x6]
	strh r1, [r2]
	strh r0, [r2, 0x2]
	lsls r0, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r2, 0x4]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r3]
	movs r0, 0x1
	ands r0, r7
	cmp r0, 0
	beq _080DB22E
	adds r2, r4, 0
	adds r2, 0x2A
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r2]
	ldrb r0, [r3]
	orrs r0, r1
	strb r0, [r3]
_080DB22E:
	ldr r0, _080DB244
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB238: .4byte gUnknown_0202F7C9
_080DB23C: .4byte gSineTable
_080DB240: .4byte gOamMatrices
_080DB244: .4byte sub_80DAF0C
	thumb_func_end sub_80DAD84

	thumb_func_start sub_80DAF0C
sub_80DAF0C: @ 80DB248
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	adds r5, r4, 0
	adds r5, 0x2E
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	movs r1, 0
	mov r8, r1
	movs r7, 0
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _080DB32C
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r6, r0, 8
	strh r6, [r4, 0x24]
	movs r0, 0x38
	ldrsh r1, [r4, r0]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	muls r0, r1
	asrs r3, r0, 8
	strh r3, [r4, 0x26]
	ldrh r2, [r4, 0x34]
	movs r1, 0xFF
	adds r0, r1, 0
	ands r0, r2
	ldrh r2, [r4, 0x3A]
	adds r0, r2
	strh r0, [r4, 0x3A]
	ldrh r2, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	ands r1, r2
	cmp r0, r1
	blt _080DB32C
	ldrh r0, [r4, 0x20]
	adds r0, r6
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x22]
	adds r0, r3
	strh r0, [r4, 0x22]
	strh r7, [r4, 0x24]
	strh r7, [r4, 0x26]
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x10
	bl memcpy
	adds r0, r5, 0
	movs r1, 0
	movs r2, 0x10
	bl memset
	ldrh r0, [r4, 0x22]
	lsls r0, 8
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0, 0x6]
	lsrs r1, r0, 8
	strh r1, [r5, 0x6]
	strh r7, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0, 0x2]
	strh r0, [r5, 0xA]
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, 0
	beq _080DB2FC
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080DB2F4
	ldr r0, _080DB2F0
	b _080DB30A
	.align 2, 0
_080DB2F0: .4byte 0x00008001
_080DB2F4:
	ldr r0, _080DB2F8
	b _080DB30A
	.align 2, 0
_080DB2F8: .4byte 0x00008002
_080DB2FC:
	movs r0, 0x8
	ands r1, r0
	cmp r1, 0
	beq _080DB308
	movs r0, 0x1
	b _080DB30A
_080DB308:
	movs r0, 0x2
_080DB30A:
	strh r0, [r5, 0x4]
	mov r0, sp
	ldrh r0, [r0, 0x4]
	lsrs r0, 8
	strb r0, [r5, 0xC]
	subs r0, 0x2
	strb r0, [r5, 0xD]
	mov r0, sp
	ldrh r1, [r0, 0xE]
	lsls r1, 1
	ldrh r2, [r5, 0xE]
	movs r0, 0x1
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0xE]
	ldr r0, _080DB338
	str r0, [r4, 0x1C]
_080DB32C:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB338: .4byte sub_80DA6F0
	thumb_func_end sub_80DAF0C

	thumb_func_start sub_80DB000
sub_80DB000: @ 80DB33C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DB354
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DB358
	adds r0, r5, 0
	movs r1, 0
	bl sub_80787B0
	b _080DB360
	.align 2, 0
_080DB354: .4byte gUnknown_03004B00
_080DB358:
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078764
_080DB360:
	ldr r4, _080DB3C8
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DB378
	ldr r0, _080DB3CC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DB38E
_080DB378:
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080DB394
	ldr r0, _080DB3D0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DB394
_080DB38E:
	ldrh r0, [r5, 0x20]
	adds r0, 0x8
	strh r0, [r5, 0x20]
_080DB394:
	ldr r4, _080DB3C8
	ldrb r1, [r4, 0x8]
	adds r0, r5, 0
	bl SeekSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x20
	strh r0, [r5, 0x20]
	ldr r0, _080DB3D4
	strh r0, [r5, 0x30]
	ldrh r1, [r4, 0x8]
	movs r0, 0xC
	adds r2, r0, 0
	muls r2, r1
	adds r0, r2, 0
	ldrh r2, [r5, 0x24]
	adds r0, r2
	strh r0, [r5, 0x24]
	strh r1, [r5, 0x2E]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x3C]
	ldr r0, _080DB3D8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB3C8: .4byte gUnknown_03004B00
_080DB3CC: .4byte gUnknown_0202F7C8
_080DB3D0: .4byte gUnknown_0202F7C9
_080DB3D4: .4byte 0x00000ccc
_080DB3D8: .4byte sub_80DB0A0
	thumb_func_end sub_80DB000

	thumb_func_start sub_80DB0A0
sub_80DB0A0: @ 80DB3DC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	movs r1, 0
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	bne _080DB406
	strh r1, [r4, 0x2E]
	strh r1, [r4, 0x24]
	adds r0, r4, 0
	bl StartSpriteAnim
_080DB406:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DB41E
	adds r0, r4, 0
	bl move_anim_8072740
_080DB41E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB0A0

	thumb_func_start sub_80DB0E8
sub_80DB0E8: @ 80DB424
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	ldr r1, _080DB4BC
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	ldrh r0, [r7, 0x8]
	movs r1, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _080DB49E
	ldr r1, _080DB4C0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	movs r5, 0xD
	negs r5, r5
	adds r1, r5, 0
	bl Sin
	ldr r4, _080DB4C4
	strh r0, [r4]
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	adds r1, r5, 0
	bl Cos
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r4, 0x4]
	movs r0, 0x3
	strh r0, [r4, 0x6]
	ldr r0, _080DB4C8
	mov r8, r0
	ldr r5, _080DB4CC
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
	mov r0, r8
	adds r1, r4, 0
	movs r3, 0x3
	bl CreateSpriteAndAnimate
_080DB49E:
	ldrh r0, [r7, 0x8]
	adds r0, 0x8
	strh r0, [r7, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080DB4B2
	adds r0, r6, 0
	bl move_anim_task_del
_080DB4B2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DB4BC: .4byte gTasks
_080DB4C0: .4byte gUnknown_0202F7B2
_080DB4C4: .4byte gUnknown_03004B00
_080DB4C8: .4byte gBattleAnimSpriteTemplate_83DB538
_080DB4CC: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80DB0E8

	thumb_func_start sub_80DB194
sub_80DB194: @ 80DB4D0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DB4E2
	cmp r0, 0x1
	beq _080DB514
	b _080DB528
_080DB4E2:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	ldr r2, _080DB510
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DB528
	.align 2, 0
_080DB510: .4byte gSprites
_080DB514:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DB528
	adds r0, r4, 0
	bl move_anim_8072740
_080DB528:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB194

	thumb_func_start sub_80DB1F4
sub_80DB1F4: @ 80DB530
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DB568
	cmp r0, 0x1
	bgt _080DB546
	cmp r0, 0
	beq _080DB54C
	b _080DB5BA
_080DB546:
	cmp r0, 0x2
	beq _080DB57C
	b _080DB5BA
_080DB54C:
	ldr r0, _080DB564
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	negs r0, r0
	subs r0, 0x20
	strh r0, [r4, 0x26]
	b _080DB574
	.align 2, 0
_080DB564: .4byte gUnknown_0202F7C9
_080DB568:
	ldrh r0, [r4, 0x26]
	adds r0, 0xA
	strh r0, [r4, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080DB5BA
_080DB574:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DB5BA
_080DB57C:
	ldrh r0, [r4, 0x26]
	subs r0, 0xA
	strh r0, [r4, 0x26]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DB5BA
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	ldr r2, _080DB5C0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0
	bl move_anim_8072740
_080DB5BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB5C0: .4byte gSprites
	thumb_func_end sub_80DB1F4

	thumb_func_start sub_80DB288
sub_80DB288: @ 80DB5C4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080DB600
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DB604
	str r0, [r4, 0x1C]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	ldr r2, _080DB608
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DB600: .4byte gUnknown_03004B00
_080DB604: .4byte sub_80DB2D0
_080DB608: .4byte gSprites
	thumb_func_end sub_80DB288

	thumb_func_start sub_80DB2D0
sub_80DB2D0: @ 80DB60C
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _080DB620
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	b _080DB664
_080DB620:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080DB646
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	subs r1, r0
	strh r1, [r2, 0x26]
	b _080DB664
_080DB646:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x34]
	adds r1, r0, 0x1
	strh r1, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080DB664
	ldr r0, _080DB668
	str r0, [r2, 0x1C]
_080DB664:
	pop {r0}
	bx r0
	.align 2, 0
_080DB668: .4byte sub_80DB330
	thumb_func_end sub_80DB2D0

	thumb_func_start sub_80DB330
sub_80DB330: @ 80DB66C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
	movs r3, 0x22
	ldrsh r0, [r2, r3]
	movs r3, 0x26
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	ble _080DB69C
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
_080DB69C:
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _080DB6AA
	adds r0, r2, 0
	bl move_anim_8072740
_080DB6AA:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB330

	thumb_func_start sub_80DB374
sub_80DB374: @ 80DB6B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080DB6C4
	cmp r0, 0x1
	beq _080DB71C
	b _080DB788
_080DB6C4:
	ldr r0, _080DB6D4
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bne _080DB6DC
	ldr r4, _080DB6D8
	b _080DB6DE
	.align 2, 0
_080DB6D4: .4byte gUnknown_03004B00
_080DB6D8: .4byte gUnknown_0202F7C8
_080DB6DC:
	ldr r4, _080DB718
_080DB6DE:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0
	movs r3, 0x80
	lsls r3, 2
	strh r3, [r5, 0x30]
	movs r2, 0x80
	lsls r2, 1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8078FDC
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DB788
	.align 2, 0
_080DB718: .4byte gUnknown_0202F7C9
_080DB71C:
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0xB
	bgt _080DB72A
	ldrh r0, [r5, 0x30]
	subs r0, 0x28
	b _080DB72E
_080DB72A:
	ldrh r0, [r5, 0x30]
	adds r0, 0x28
_080DB72E:
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x32]
	movs r2, 0x80
	lsls r2, 1
	movs r0, 0x30
	ldrsh r3, [r5, r0]
	str r1, [sp]
	adds r0, r5, 0
	bl sub_8078FDC
	ldrb r1, [r5, 0x3]
	lsls r1, 26
	lsrs r1, 27
	movs r0, 0xF4
	lsls r0, 6
	ldr r2, _080DB790
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	adds r1, r0, 0x1
	cmp r1, 0x80
	ble _080DB768
	movs r1, 0x80
_080DB768:
	movs r0, 0x40
	subs r0, r1
	lsrs r1, r0, 31
	adds r0, r1
	asrs r1, r0, 1
	strh r1, [r5, 0x26]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	cmp r0, 0x18
	bne _080DB788
	adds r0, r5, 0
	bl sub_8079098
	adds r0, r5, 0
	bl move_anim_8072740
_080DB788:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB790: .4byte gOamMatrices
	thumb_func_end sub_80DB374

	thumb_func_start sub_80DB458
sub_80DB458: @ 80DB794
	push {r4,r5,lr}
	adds r5, r0, 0
	bl Random
	ldr r4, _080DB7B8
	ands r4, r0
	bl Random
	movs r1, 0x7F
	ands r1, r0
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080DB7BC
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r4, r2
	b _080DB7C4
	.align 2, 0
_080DB7B8: .4byte 0x000001ff
_080DB7BC:
	movs r2, 0xB8
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r4
_080DB7C4:
	strh r0, [r5, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DB7D8
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	adds r0, r1, r0
	b _080DB7E0
_080DB7D8:
	movs r2, 0xE0
	lsls r2, 2
	adds r0, r2, 0
	subs r0, r1
_080DB7E0:
	strh r0, [r5, 0x30]
	ldr r2, _080DB808
	ldrh r0, [r2]
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	beq _080DB7FC
	ldrb r0, [r5, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r5, 0x3]
_080DB7FC:
	movs r1, 0x2
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080DB810
	ldr r4, _080DB80C
	b _080DB812
	.align 2, 0
_080DB808: .4byte gUnknown_03004B00
_080DB80C: .4byte gUnknown_0202F7C8
_080DB810:
	ldr r4, _080DB83C
_080DB812:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r5, 0x22]
	ldr r0, _080DB840
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DB83C: .4byte gUnknown_0202F7C9
_080DB840: .4byte sub_80DB508
	thumb_func_end sub_80DB458

	thumb_func_start sub_80DB508
sub_80DB508: @ 80DB844
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DB85C
	ldrh r3, [r4, 0x2E]
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r1, [r4, 0x24]
	adds r0, r1
	b _080DB866
_080DB85C:
	ldrh r3, [r4, 0x2E]
	lsls r1, r3, 16
	asrs r1, 24
	ldrh r0, [r4, 0x24]
	subs r0, r1
_080DB866:
	strh r0, [r4, 0x24]
	ldrh r2, [r4, 0x30]
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r4, 0x26]
	subs r0, r1
	strh r0, [r4, 0x26]
	strh r3, [r4, 0x2E]
	adds r0, r2, 0
	subs r0, 0x20
	strh r0, [r4, 0x30]
	lsls r0, r3, 16
	cmp r0, 0
	bge _080DB886
	movs r0, 0
	strh r0, [r4, 0x2E]
_080DB886:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080DB89A
	adds r0, r4, 0
	bl move_anim_8072740
_080DB89A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DB508

	thumb_func_start sub_80DB564
sub_80DB564: @ 80DB8A0
	movs r1, 0
	strh r1, [r0, 0x3A]
	movs r1, 0x40
	strh r1, [r0, 0x3C]
	ldr r1, _080DB8B0
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080DB8B0: .4byte sub_80DB578
	thumb_func_end sub_80DB564

	thumb_func_start sub_80DB578
sub_80DB578: @ 80DB8B4
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080DB8C6
	cmp r1, 0x1
	beq _080DB914
	b _080DB91A
_080DB8C6:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080DB91A
	strh r1, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080DB91A
	ldrb r1, [r1]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080DB91A
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080DB91A
_080DB914:
	adds r0, r3, 0
	bl move_anim_8072740
_080DB91A:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB578

	thumb_func_start sub_80DB5E4
sub_80DB5E4: @ 80DB920
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	ldrh r4, [r0, 0x20]
	ldrh r5, [r0, 0x22]
	ldr r6, _080DB9D4
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r1, r8
	strh r0, [r1, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r2, r8
	strh r6, [r2, 0x22]
	ldrh r0, [r2, 0x20]
	mov r9, r0
	mov r1, r9
	lsls r0, r1, 4
	strh r0, [r2, 0x36]
	lsls r0, r6, 4
	strh r0, [r2, 0x38]
	lsls r4, 16
	asrs r4, 16
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	subs r0, r4, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3A]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	subs r0, r5, r0
	lsls r0, 4
	movs r1, 0xC
	bl __divsi3
	mov r2, r8
	strh r0, [r2, 0x3C]
	mov r0, r9
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	subs r5, r6
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	mov r0, r8
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8078FDC
	ldr r0, _080DB9D8
	mov r2, r8
	str r0, [r2, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DB9D4: .4byte gUnknown_0202F7C8
_080DB9D8: .4byte sub_80DB6A0
	thumb_func_end sub_80DB5E4

	thumb_func_start sub_80DB6A0
sub_80DB6A0: @ 80DB9DC
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x3A]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x3C]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r3, r1, 20
	strh r3, [r2, 0x22]
	adds r0, 0x2D
	lsls r0, 16
	movs r1, 0xA5
	lsls r1, 17
	cmp r0, r1
	bhi _080DBA16
	adds r1, r3, 0
	cmp r1, 0x9D
	bgt _080DBA16
	movs r0, 0x2D
	negs r0, r0
	cmp r1, r0
	bge _080DBA1C
_080DBA16:
	adds r0, r2, 0
	bl move_anim_8074EE0
_080DBA1C:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB6A0

	thumb_func_start unref_sub_80DB6E4
unref_sub_80DB6E4: @ 80DBA20
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DBA50
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DBA58
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DBA54
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	b _080DBA76
	.align 2, 0
_080DBA50: .4byte gUnknown_03004B00
_080DBA54: .4byte gSprites
_080DBA58:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DBA84
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
_080DBA76:
	strb r0, [r1]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBA84: .4byte gSprites
	thumb_func_end unref_sub_80DB6E4

	thumb_func_start sub_80DB74C
sub_80DB74C: @ 80DBA88
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, _080DBB40
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DBAA4
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DBABA
_080DBAA4:
	ldrb r1, [r6, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r6, 0x5]
	adds r1, r6, 0
	adds r1, 0x43
	movs r0, 0xC8
	strb r0, [r1]
_080DBABA:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DBB16
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	adds r0, r4, 0
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080DBAF8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8076034
_080DBAF8:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r7
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080DBB16
	movs r0, 0x1
	eors r5, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8076034
_080DBB16:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DBB4C
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080DBB4C
	ldr r0, _080DBB40
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DBB44
	movs r0, 0x48
	strh r0, [r6, 0x20]
	movs r0, 0x50
	b _080DBB86
	.align 2, 0
_080DBB40: .4byte gUnknown_0202F7C8
_080DBB44:
	movs r0, 0xB0
	strh r0, [r6, 0x20]
	movs r0, 0x28
	b _080DBB86
_080DBB4C:
	ldr r5, _080DBBBC
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DBB62
	ldr r1, _080DBBC0
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DBB62:
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	ldr r4, _080DBBC0
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4
_080DBB86:
	strh r0, [r6, 0x22]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DBB98
	ldrh r0, [r6, 0x22]
	adds r0, 0x9
	strh r0, [r6, 0x22]
_080DBB98:
	ldr r0, _080DBBC0
	ldrh r0, [r0, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r6, 0x2E]
	ldr r1, _080DBBC4
	str r1, [r6, 0x1C]
	adds r0, r6, 0
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBBBC: .4byte gUnknown_0202F7C8
_080DBBC0: .4byte gUnknown_03004B00
_080DBBC4: .4byte sub_80DB88C
	thumb_func_end sub_80DB74C

	thumb_func_start sub_80DB88C
sub_80DB88C: @ 80DBBC8
	push {lr}
	adds r3, r0, 0
	ldr r2, _080DBBEC
	ldrh r1, [r3, 0x34]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0xD
	bne _080DBBF4
	ldr r0, _080DBBF0
	str r0, [r3, 0x1C]
	b _080DBBF8
	.align 2, 0
_080DBBEC: .4byte 0x04000052
_080DBBF0: .4byte sub_80DB8C0
_080DBBF4:
	adds r0, r1, 0x1
	strh r0, [r3, 0x34]
_080DBBF8:
	pop {r0}
	bx r0
	thumb_func_end sub_80DB88C

	thumb_func_start sub_80DB8C0
sub_80DB8C0: @ 80DBBFC
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080DBC5A
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r4, [r3, 0x2E]
	ldr r1, _080DBC60
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 1
	adds r0, r1
	ldrh r7, [r0]
	movs r5, 0x8
	adds r6, r1, 0
	adds r1, r4, 0x7
	lsls r0, r4, 1
	adds r0, r6
	adds r2, r0, 0
	adds r2, 0x10
	lsls r1, 1
	adds r1, r6
_080DBC32:
	ldrh r0, [r1]
	strh r0, [r2]
	subs r1, 0x2
	subs r2, 0x2
	subs r5, 0x1
	cmp r5, 0
	bgt _080DBC32
	adds r0, r4, 0x1
	lsls r0, 1
	adds r0, r6
	strh r7, [r0]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	bne _080DBC5A
	ldr r0, _080DBC64
	str r0, [r3, 0x1C]
_080DBC5A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBC60: .4byte gPlttBufferFaded
_080DBC64: .4byte sub_80DB92C
	thumb_func_end sub_80DB8C0

	thumb_func_start sub_80DB92C
sub_80DB92C: @ 80DBC68
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r2, _080DBD10
	ldrh r1, [r5, 0x34]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DBD08
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DBCF8
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080DBCCA
	ldr r2, _080DBD14
	ldr r0, _080DBD18
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
_080DBCCA:
	movs r0, 0x2
	adds r4, r0, 0
	eors r4, r6
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080DBCF8
	ldr r2, _080DBD14
	ldr r0, _080DBD18
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
_080DBCF8:
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DBD1C
	str r0, [r5, 0x1C]
_080DBD08:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DBD10: .4byte 0x04000052
_080DBD14: .4byte gSprites
_080DBD18: .4byte gUnknown_02024BE0
_080DBD1C: .4byte sub_80DB9E4
	thumb_func_end sub_80DB92C

	thumb_func_start sub_80DB9E4
sub_80DB9E4: @ 80DBD20
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DBD78
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080DBD5E
	adds r0, r5, 0
	bl sub_8076464
_080DBD5E:
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080DBD78
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_080DBD78:
	ldr r0, _080DBD84
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DBD84: .4byte move_anim_8072740
	thumb_func_end sub_80DB9E4

	thumb_func_start sub_80DBA4C
sub_80DBA4C: @ 80DBD88
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DBE14
	ldr r5, _080DBDD4
	movs r1, 0x6
	ldrsh r0, [r5, r1]
	movs r6, 0
	cmp r0, 0
	bne _080DBDA2
	movs r6, 0x1
_080DBDA2:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DBDEA
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080DBDEA
	ldr r0, _080DBDD8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DBDDC
	ldrh r0, [r5]
	movs r1, 0x48
	subs r1, r0
	strh r1, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x50
	strh r0, [r4, 0x22]
	b _080DBE0C
	.align 2, 0
_080DBDD4: .4byte gUnknown_03004B00
_080DBDD8: .4byte gUnknown_0202F7C8
_080DBDDC:
	ldrh r0, [r5]
	adds r0, 0xB0
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	adds r0, 0x28
	strh r0, [r4, 0x22]
	b _080DBE0C
_080DBDEA:
	ldr r0, _080DBE00
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DBE04
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_80787B0
	b _080DBE0C
	.align 2, 0
_080DBE00: .4byte gUnknown_03004B00
_080DBE04:
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8078764
_080DBE0C:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DBE28
_080DBE14:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _080DBE28
	adds r0, r4, 0
	bl move_anim_8074EE0
_080DBE28:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DBA4C

	thumb_func_start sub_80DBAF4
sub_80DBAF4: @ 80DBE30
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DBE78
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DBE80
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldrh r0, [r5, 0x20]
	subs r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xA
	strh r0, [r5, 0x22]
	ldr r0, _080DBE7C
	b _080DBE8E
	.align 2, 0
_080DBE78: .4byte gUnknown_0202F7C8
_080DBE7C: .4byte 0x0000ffff
_080DBE80:
	ldrh r0, [r5, 0x20]
	adds r0, 0x28
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	subs r0, 0xA
	strh r0, [r5, 0x22]
	movs r0, 0x1
_080DBE8E:
	strh r0, [r5, 0x30]
	ldr r1, _080DBEA4
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080DBEA8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DBEA4: .4byte move_anim_8072740
_080DBEA8: .4byte sub_8078600
	thumb_func_end sub_80DBAF4

	thumb_func_start sub_80DBB70
sub_80DBB70: @ 80DBEAC
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _080DBF30
	ldrb r0, [r6]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	lsls r1, 15
	lsrs r4, r1, 16
	ldrb r0, [r6]
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	negs r1, r1
	lsls r1, 16
	lsrs r7, r1, 16
	ldrb r0, [r6]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DBEF2
	lsls r0, r4, 16
	negs r0, r0
	lsrs r4, r0, 16
_080DBEF2:
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	strh r0, [r5, 0x20]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r7
	strh r0, [r5, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	bgt _080DBF1E
	movs r0, 0x10
	strh r0, [r5, 0x22]
_080DBF1E:
	ldr r1, _080DBF34
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080DBF38
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DBF30: .4byte gUnknown_0202F7C8
_080DBF34: .4byte sub_80DBC00
_080DBF38: .4byte sub_8078600
	thumb_func_end sub_80DBB70

	thumb_func_start sub_80DBC00
sub_80DBC00: @ 80DBF3C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080DBF68
	str r0, [r4, 0x10]
	movs r0, 0
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldr r0, _080DBF6C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DBF68: .4byte gUnknown_083DA888
_080DBF6C: .4byte sub_80DBC34
	thumb_func_end sub_80DBC00

	thumb_func_start sub_80DBC34
sub_80DBC34: @ 80DBF70
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DBF82
	cmp r0, 0x1
	beq _080DBFB0
	b _080DBFC8
_080DBF82:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DBFC8
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x12
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DBFC8
_080DBFB0:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DBFC8
	adds r0, r4, 0
	bl move_anim_8072740
_080DBFC8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DBC34

	thumb_func_start sub_80DBC94
sub_80DBC94: @ 80DBFD0
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080DC000
	adds r4, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	strh r1, [r4, 0x8]
	ldr r2, _080DC004
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080DC008
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DC000: .4byte gTasks
_080DC004: .4byte gUnknown_083DA8A4
_080DC008: .4byte sub_80DBCD0
	thumb_func_end sub_80DBC94

	thumb_func_start sub_80DBCD0
sub_80DBCD0: @ 80DC00C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DC034
	adds r0, r1
	bl sub_807992C
	lsls r0, 24
	cmp r0, 0
	bne _080DC02C
	adds r0, r4, 0
	bl move_anim_task_del
_080DC02C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DC034: .4byte gTasks
	thumb_func_end sub_80DBCD0

	thumb_func_start sub_80DBCFC
sub_80DBCFC: @ 80DC038
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC084
	adds r4, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	ldr r0, _080DC088
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _080DC06C
	movs r1, 0x4
_080DC06C:
	strh r1, [r4, 0xE]
	ldrb r1, [r4, 0x8]
	ldr r2, _080DC08C
	adds r0, r4, 0
	bl sub_80798F4
	ldr r0, _080DC090
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DC084: .4byte gTasks
_080DC088: .4byte gUnknown_0202F7C8
_080DC08C: .4byte gUnknown_083DA8C4
_080DC090: .4byte sub_80DBD58
	thumb_func_end sub_80DBCFC

	thumb_func_start sub_80DBD58
sub_80DBD58: @ 80DC094
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DC0B4
	adds r4, r0, r1
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DC0B8
	cmp r0, 0x1
	beq _080DC0D4
	b _080DC132
	.align 2, 0
_080DC0B4: .4byte gTasks
_080DC0B8:
	adds r0, r4, 0
	bl sub_807992C
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080DC132
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	b _080DC132
_080DC0D4:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DC0FC
	ldr r2, _080DC0F8
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080DC132
	.align 2, 0
_080DC0F8: .4byte gSprites
_080DC0FC:
	ldr r3, _080DC138
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0x88
	lsls r1, 1
	strh r1, [r0, 0x20]
	ldrb r0, [r4, 0x8]
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
_080DC132:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC138: .4byte gSprites
	thumb_func_end sub_80DBD58

	thumb_func_start sub_80DBE00
sub_80DBE00: @ 80DC13C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC1C0
	adds r5, r1, r0
	movs r0, 0
	movs r7, 0x10
	strh r7, [r5, 0xE]
	strh r0, [r5, 0x10]
	ldr r4, _080DC1C4
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x24]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r4]
	movs r1, 0
	bl sub_807A100
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x3
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, r6
	bcs _080DC1A6
	adds r1, r6, 0
_080DC1A6:
	strh r1, [r5, 0x20]
	ldr r1, _080DC1C8
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080DC1CC
	strh r7, [r0]
	ldr r0, _080DC1D0
	str r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DC1C0: .4byte gTasks
_080DC1C4: .4byte gUnknown_0202F7C8
_080DC1C8: .4byte 0x04000050
_080DC1CC: .4byte 0x04000052
_080DC1D0: .4byte sub_80DBE98
	thumb_func_end sub_80DBE00

	thumb_func_start sub_80DBE98
sub_80DBE98: @ 80DC1D4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC1F8
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080DC2D4
	cmp r1, 0x1
	bgt _080DC1FC
	cmp r1, 0
	beq _080DC20A
	b _080DC350
	.align 2, 0
_080DC1F8: .4byte gTasks
_080DC1FC:
	cmp r1, 0x2
	bne _080DC202
	b _080DC330
_080DC202:
	cmp r1, 0x3
	bne _080DC208
	b _080DC340
_080DC208:
	b _080DC350
_080DC20A:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bgt _080DC21A
	b _080DC350
_080DC21A:
	strh r1, [r4, 0xA]
	ldr r0, _080DC258
	movs r2, 0x22
	ldrsh r1, [r4, r2]
	movs r3, 0x24
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	adds r1, 0x8
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	strh r2, [r0]
	cmp r2, 0x40
	beq _080DC2BE
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DC278
	cmp r0, 0x1
	bgt _080DC25C
	cmp r0, 0
	beq _080DC266
	b _080DC2BE
	.align 2, 0
_080DC258: .4byte gSpriteTemplate_83DA8DC
_080DC25C:
	cmp r0, 0x2
	beq _080DC290
	cmp r0, 0x3
	beq _080DC2A8
	b _080DC2BE
_080DC266:
	ldr r0, _080DC274
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	b _080DC2B6
	.align 2, 0
_080DC274: .4byte gSprites
_080DC278:
	ldr r0, _080DC28C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	b _080DC2BC
	.align 2, 0
_080DC28C: .4byte gSprites
_080DC290:
	ldr r1, _080DC2A4
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0x20]
	strh r1, [r0, 0x26]
	b _080DC2BE
	.align 2, 0
_080DC2A4: .4byte gSprites
_080DC2A8:
	ldr r0, _080DC2D0
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080DC2B6:
	strh r0, [r1, 0x24]
	ldrh r0, [r4, 0x20]
	negs r0, r0
_080DC2BC:
	strh r0, [r1, 0x26]
_080DC2BE:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080DC350
	b _080DC330
	.align 2, 0
_080DC2D0: .4byte gSprites
_080DC2D4:
	ldrh r0, [r4, 0xA]
	ands r1, r0
	cmp r1, 0
	beq _080DC2E4
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	b _080DC2EA
_080DC2E4:
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
_080DC2EA:
	ldr r2, _080DC338
	ldrh r0, [r4, 0x10]
	lsls r0, 8
	ldrh r1, [r4, 0xE]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	bne _080DC350
	movs r5, 0x8
	adds r6, r4, 0
	adds r6, 0x8
_080DC30A:
	lsls r0, r5, 1
	adds r1, r6, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x40
	beq _080DC326
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DC33C
	adds r0, r1
	bl DestroySprite
_080DC326:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xC
	bls _080DC30A
_080DC330:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DC350
	.align 2, 0
_080DC338: .4byte 0x04000052
_080DC33C: .4byte gSprites
_080DC340:
	ldr r0, _080DC358
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	bl move_anim_task_del
_080DC350:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC358: .4byte 0x04000052
	thumb_func_end sub_80DBE98

	thumb_func_start sub_80DC020
sub_80DC020: @ 80DC35C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	subs r0, 0xA
	cmp r1, r0
	ble _080DC386
	ldrh r0, [r4, 0x30]
	movs r1, 0x1
	ands r1, r0
	adds r3, r4, 0
	adds r3, 0x3E
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080DC386:
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080DC398
	adds r0, r4, 0
	bl move_anim_8072740
_080DC398:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC020

	thumb_func_start sub_80DC068
sub_80DC068: @ 80DC3A4
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DC3E0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080DC3D0
	ldr r4, _080DC3E4
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080DC3D0:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x2E]
	ldr r0, _080DC3E8
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC3E0: .4byte gUnknown_03004B00
_080DC3E4: .4byte gUnknown_0202F7C8
_080DC3E8: .4byte sub_80DC020
	thumb_func_end sub_80DC068

	thumb_func_start sub_80DC0B0
sub_80DC0B0: @ 80DC3EC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC448
	adds r5, r1, r0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DC490
	ldr r0, _080DC44C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080DC45C
	ldr r0, _080DC450
	strh r0, [r5, 0x1C]
	ldr r4, _080DC454
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC458
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080DC51A
	.align 2, 0
_080DC448: .4byte gTasks
_080DC44C: .4byte gUnknown_03004B00
_080DC450: .4byte 0x0000fff6
_080DC454: .4byte gUnknown_0202F7C9
_080DC458: .4byte gUnknown_0202F7C8
_080DC45C:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080DC488
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC48C
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	b _080DC50E
	.align 2, 0
_080DC488: .4byte gUnknown_0202F7C8
_080DC48C: .4byte gUnknown_0202F7C9
_080DC490:
	ldr r0, _080DC4D4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x1
	bne _080DC4E4
	ldr r0, _080DC4D8
	strh r0, [r5, 0x1C]
	ldr r4, _080DC4DC
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC4E0
	ldrb r0, [r4]
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080DC51A
	.align 2, 0
_080DC4D4: .4byte gUnknown_03004B00
_080DC4D8: .4byte 0x0000fff6
_080DC4DC: .4byte gUnknown_0202F7C9
_080DC4E0: .4byte gUnknown_0202F7C8
_080DC4E4:
	movs r0, 0xA
	strh r0, [r5, 0x1C]
	ldr r4, _080DC52C
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x1E]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r5, 0x20]
	ldr r4, _080DC530
	ldrb r0, [r4]
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
_080DC50E:
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	subs r0, 0x8
_080DC51A:
	strh r0, [r5, 0x24]
	movs r0, 0x6
	strh r0, [r5, 0xA]
	ldr r0, _080DC534
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DC52C: .4byte gUnknown_0202F7C8
_080DC530: .4byte gUnknown_0202F7C9
_080DC534: .4byte sub_80DC1FC
	thumb_func_end sub_80DC0B0

	thumb_func_start sub_80DC1FC
sub_80DC1FC: @ 80DC538
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC558
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0
	beq _080DC55C
	cmp r1, 0x1
	beq _080DC5D0
	b _080DC5E4
	.align 2, 0
_080DC558: .4byte gTasks
_080DC55C:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080DC5E4
	strh r1, [r5, 0xA]
	ldr r0, _080DC5C8
	movs r2, 0x1E
	ldrsh r1, [r5, r2]
	movs r3, 0x20
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x40
	beq _080DC5B0
	ldr r0, _080DC5CC
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	adds r4, r0
	movs r0, 0x10
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x22]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x24]
	strh r0, [r4, 0x36]
	ldrh r0, [r5, 0x1C]
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldrb r0, [r5, 0xC]
	movs r1, 0x3
	ands r1, r0
	adds r0, r4, 0
	bl StartSpriteAffineAnim
_080DC5B0:
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	bne _080DC5E4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DC5E4
	.align 2, 0
_080DC5C8: .4byte gSpriteTemplate_83DA9AC
_080DC5CC: .4byte gSprites
_080DC5D0:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _080DC5E4
	adds r0, r2, 0
	bl move_anim_task_del
_080DC5E4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC1FC

	thumb_func_start sub_80DC2B0
sub_80DC2B0: @ 80DC5EC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DC60A
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
_080DC60A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC2B0

	thumb_func_start sub_80DC2D4
sub_80DC2D4: @ 80DC610
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DC648
	adds r4, r1, r0
	ldr r0, _080DC64C
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r1, r0, 24
	adds r0, r1, 0
	subs r0, 0x20
	strh r0, [r4, 0x24]
	ldr r0, _080DC650
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x1
	beq _080DC666
	cmp r0, 0x1
	bgt _080DC654
	cmp r0, 0
	beq _080DC65A
	b _080DC682
	.align 2, 0
_080DC648: .4byte gTasks
_080DC64C: .4byte gUnknown_0202F7C9
_080DC650: .4byte gUnknown_03004B00
_080DC654:
	cmp r0, 0x2
	beq _080DC672
	b _080DC682
_080DC65A:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0x40
	b _080DC67A
_080DC666:
	movs r0, 0x2
	strh r0, [r4, 0x1E]
	movs r0, 0x5
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	b _080DC67A
_080DC672:
	movs r0, 0x4
	strh r0, [r4, 0x1E]
	strh r0, [r4, 0x20]
	movs r0, 0
_080DC67A:
	strh r0, [r4, 0x22]
	adds r0, r1, 0
	adds r0, 0x20
	strh r0, [r4, 0x26]
_080DC682:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080DC68E
	movs r0, 0
	strh r0, [r4, 0x24]
_080DC68E:
	ldr r0, _080DC6A8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DC6B4
	ldr r0, _080DC6AC
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080DC6B0
	b _080DC6BC
	.align 2, 0
_080DC6A8: .4byte gUnknown_0202F7C9
_080DC6AC: .4byte gUnknown_030042C0
_080DC6B0: .4byte 0x04000014
_080DC6B4:
	ldr r0, _080DC71C
	ldrh r0, [r0]
	strh r0, [r4, 0x1C]
	ldr r0, _080DC720
_080DC6BC:
	str r0, [sp]
	ldrh r1, [r4, 0x24]
	lsls r3, r1, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	bgt _080DC6F6
	ldr r5, _080DC724
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080DC6D6:
	asrs r3, 16
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0x1C]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0x1C]
	strh r0, [r1]
	adds r3, 0x1
	lsls r3, 16
	asrs r1, r3, 16
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	adds r0, 0x40
	cmp r1, r0
	ble _080DC6D6
_080DC6F6:
	ldr r0, _080DC728
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _080DC72C
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DC71C: .4byte gUnknown_03004288
_080DC720: .4byte 0x04000018
_080DC724: .4byte gUnknown_03004DE0
_080DC728: .4byte 0xa2600001
_080DC72C: .4byte sub_80DC3F4
	thumb_func_end sub_80DC2D4

	thumb_func_start sub_80DC3F4
sub_80DC3F4: @ 80DC730
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DC758
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DC80A
	cmp r0, 0x1
	bgt _080DC75C
	cmp r0, 0
	beq _080DC762
	b _080DC822
	.align 2, 0
_080DC758: .4byte gTasks
_080DC75C:
	cmp r0, 0x2
	beq _080DC81C
	b _080DC822
_080DC762:
	ldrh r3, [r5, 0x22]
	ldrh r4, [r5, 0x24]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	movs r2, 0x26
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bgt _080DC7FA
	ldr r0, _080DC7AC
	mov r9, r0
	movs r7, 0x3
	ldr r1, _080DC7B0
	mov r12, r1
	movs r2, 0xF0
	lsls r2, 3
	add r2, r12
	mov r8, r2
_080DC784:
	lsls r2, r3, 16
	asrs r0, r2, 15
	add r0, r9
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r3, 0x20
	ldrsh r1, [r5, r3]
	asrs r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r3, r0, 16
	adds r6, r2, 0
	cmp r3, 0
	ble _080DC7B4
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	adds r0, r3, r0
	b _080DC7C0
	.align 2, 0
_080DC7AC: .4byte gSineTable
_080DC7B0: .4byte gUnknown_03004DE0
_080DC7B4:
	cmp r3, 0
	bge _080DC7C4
	ldrh r1, [r5, 0xA]
	adds r0, r7, 0
	ands r0, r1
	subs r0, r3, r0
_080DC7C0:
	lsls r0, 16
	lsrs r1, r0, 16
_080DC7C4:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	mov r0, r12
	adds r4, r3, r0
	ldrh r0, [r5, 0x1C]
	lsls r1, 16
	asrs r1, 16
	adds r0, r1, r0
	strh r0, [r4]
	add r3, r8
	ldrh r0, [r5, 0x1C]
	adds r1, r0
	strh r1, [r3]
	asrs r0, r6, 16
	ldrh r1, [r5, 0x1E]
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r2, r0
	ble _080DC784
_080DC7FA:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _080DC822
	b _080DC810
_080DC80A:
	ldr r1, _080DC818
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080DC810:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080DC822
	.align 2, 0
_080DC818: .4byte gUnknown_03004DC0
_080DC81C:
	adds r0, r2, 0
	bl move_anim_task_del
_080DC822:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC3F4

	thumb_func_start sub_80DC4F4
sub_80DC4F4: @ 80DC830
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r4, r0, 24
	mov r8, r4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DC864
	adds r7, r0, r1
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r5, r0, 24
	mov r10, r5
	adds r6, r5, 0
	cmp r6, 0xFF
	bne _080DC868
	adds r0, r4, 0
	bl move_anim_task_del
	b _080DC912
	.align 2, 0
_080DC864: .4byte gTasks
_080DC868:
	ldr r1, _080DC88C
	ldrb r0, [r1]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r1, r0, 16
	mov r9, r1
	asrs r0, 16
	cmp r0, 0
	bge _080DC890
	adds r0, r5, 0
	bl FreeOamMatrix
	mov r0, r8
	bl move_anim_task_del
	b _080DC912
	.align 2, 0
_080DC88C: .4byte gUnknown_03004B00
_080DC890:
	ldr r2, _080DC920
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r2, 0
	adds r0, 0x1C
	adds r0, r4, r0
	ldr r1, _080DC924
	str r1, [r0]
	adds r4, r2
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1F
	ands r6, r0
	lsls r2, r6, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, 0
	adds r1, 0x43
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	ldr r1, _080DC928
	ldrb r0, [r1]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r7, 0x22]
	mov r0, r10
	strh r0, [r7, 0x24]
	mov r1, r9
	strh r1, [r7, 0x26]
	ldr r0, _080DC92C
	str r0, [r7]
_080DC912:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DC920: .4byte gSprites
_080DC924: .4byte SpriteCallbackDummy
_080DC928: .4byte gUnknown_03004B00
_080DC92C: .4byte sub_80DC5F4
	thumb_func_end sub_80DC4F4

	thumb_func_start sub_80DC5F4
sub_80DC5F4: @ 80DC930
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DC954
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DC9B4
	cmp r0, 0x1
	bgt _080DC958
	cmp r0, 0
	beq _080DC962
	b _080DCA34
	.align 2, 0
_080DC954: .4byte gTasks
_080DC958:
	cmp r0, 0x2
	beq _080DCA04
	cmp r0, 0x3
	beq _080DCA24
	b _080DCA34
_080DC962:
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DC9B0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x30
	bne _080DCA34
	b _080DCA16
	.align 2, 0
_080DC9B0: .4byte gSineTable
_080DC9B4:
	ldrh r0, [r4, 0xA]
	subs r0, 0x4
	strh r0, [r4, 0xA]
	ldr r1, _080DCA00
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	lsls r1, 16
	asrs r1, 17
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	lsrs r1, 24
	bl sub_8079AB8
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DCA34
	b _080DCA16
	.align 2, 0
_080DCA00: .4byte gSineTable
_080DCA04:
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DCA20
	adds r0, r1
	bl obj_delete_but_dont_free_vram
_080DCA16:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DCA34
	.align 2, 0
_080DCA20: .4byte gSprites
_080DCA24:
	ldrh r0, [r4, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bl FreeOamMatrix
	adds r0, r5, 0
	bl move_anim_task_del
_080DCA34:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DC5F4

	thumb_func_start sub_80DC700
sub_80DC700: @ 80DCA3C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DCAB4
	cmp r0, 0x1
	bgt _080DCA52
	cmp r0, 0
	beq _080DCA5C
	b _080DCB54
_080DCA52:
	cmp r0, 0x2
	beq _080DCAE6
	cmp r0, 0x3
	beq _080DCB44
	b _080DCB54
_080DCA5C:
	ldr r4, _080DCAA8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DCA8A
	ldrh r0, [r5, 0x22]
	adds r0, 0xC
	strh r0, [r5, 0x22]
_080DCA8A:
	movs r0, 0x8
	strh r0, [r5, 0x30]
	ldr r1, _080DCAAC
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080DCAB0
	ldrh r1, [r5, 0x30]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	b _080DCADE
	.align 2, 0
_080DCAA8: .4byte gUnknown_0202F7C8
_080DCAAC: .4byte 0x04000050
_080DCAB0: .4byte 0x04000052
_080DCAB4:
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080DCB54
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xCB
	bl PlaySE12WithPanning
	adds r0, r5, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnim
_080DCADE:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DCB54
_080DCAE6:
	ldrh r0, [r5, 0x32]
	adds r1, r0, 0x1
	strh r1, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DCB24
	movs r0, 0
	strh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r1, 0x1
	strh r1, [r5, 0x30]
	ldr r2, _080DCB40
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DCB24
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080DCB24:
	movs r0, 0xE0
	lsls r0, 2
	adds r2, r0, 0
	ldrh r1, [r5, 0x34]
	adds r2, r1
	lsls r1, r2, 16
	asrs r1, 24
	ldrh r0, [r5, 0x26]
	subs r0, r1
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r2, r0
	strh r2, [r5, 0x34]
	b _080DCB54
	.align 2, 0
_080DCB40: .4byte 0x04000052
_080DCB44:
	ldr r0, _080DCB5C
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r5, 0
	bl move_anim_8072740
_080DCB54:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCB5C: .4byte 0x04000050
	thumb_func_end sub_80DC700

	thumb_func_start sub_80DC824
sub_80DC824: @ 80DCB60
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DCB8C
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080DCB88
	ldrh r1, [r0, 0x4]
	negs r1, r1
	strh r1, [r0, 0x4]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
	b _080DCBBC
	.align 2, 0
_080DCB88: .4byte gUnknown_03004B00
_080DCB8C:
	ldr r0, _080DCC20
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DCBBC
	adds r0, r6, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r1, _080DCC24
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
_080DCBBC:
	ldr r5, _080DCC20
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	ldr r4, _080DCC24
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	ldr r0, _080DCC28
	str r0, [r6, 0x1C]
	ldr r1, _080DCC2C
	adds r0, r6, 0
	bl oamt_set_x3A_32
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DCC20: .4byte gUnknown_0202F7C9
_080DCC24: .4byte gUnknown_03004B00
_080DCC28: .4byte sub_8078B34
_080DCC2C: .4byte move_anim_8072740
	thumb_func_end sub_80DC824

	thumb_func_start sub_80DC8F4
sub_80DC8F4: @ 80DCC30
	push {r4-r6,lr}
	adds r6, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DCC54
	ldr r1, _080DCC50
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	b _080DCC70
	.align 2, 0
_080DCC50: .4byte gUnknown_03004B00
_080DCC54:
	ldr r0, _080DCCCC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DCC70
	ldr r0, _080DCCD0
	ldrh r1, [r0, 0x2]
	negs r1, r1
	strh r1, [r0, 0x2]
	ldrh r1, [r0]
	negs r1, r1
	strh r1, [r0]
_080DCC70:
	ldr r5, _080DCCCC
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	ldr r4, _080DCCD0
	lsrs r0, 24
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r6, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x2]
	adds r0, r1
	strh r0, [r6, 0x22]
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x2E]
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x36]
	ldr r0, _080DCCD4
	str r0, [r6, 0x1C]
	ldr r1, _080DCCD8
	adds r0, r6, 0
	bl oamt_set_x3A_32
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DCCCC: .4byte gUnknown_0202F7C9
_080DCCD0: .4byte gUnknown_03004B00
_080DCCD4: .4byte sub_8078B34
_080DCCD8: .4byte move_anim_8072740
	thumb_func_end sub_80DC8F4

	thumb_func_start sub_80DC9A0
sub_80DC9A0: @ 80DCCDC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DCCF8
	ldr r0, _080DCD38
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	lsrs r2, r1, 31
	adds r1, r2
	asrs r1, 1
	strh r1, [r0, 0x4]
_080DCCF8:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r1, _080DCD38
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r0, [r5, 0x22]
	strh r0, [r5, 0x34]
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080DCD40
	ldr r4, _080DCD3C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	b _080DCD52
	.align 2, 0
_080DCD38: .4byte gUnknown_03004B00
_080DCD3C: .4byte gUnknown_0202F7C9
_080DCD40:
	ldr r0, _080DCD68
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x32
	adds r3, r5, 0
	adds r3, 0x36
	movs r1, 0x1
	bl sub_807A3FC
_080DCD52:
	adds r0, r5, 0
	bl sub_8078BD4
	ldr r0, _080DCD6C
	ldrh r0, [r0, 0x6]
	strh r0, [r5, 0x38]
	ldr r0, _080DCD70
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DCD68: .4byte gUnknown_0202F7C9
_080DCD6C: .4byte gUnknown_03004B00
_080DCD70: .4byte sub_80DCA38
	thumb_func_end sub_80DC9A0

	thumb_func_start sub_80DCA38
sub_80DCA38: @ 80DCD74
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080DCD8A
	adds r0, r4, 0
	bl move_anim_8072740
	b _080DCDA6
_080DCD8A:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0xD
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
_080DCDA6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DCA38

	thumb_func_start sub_80DCA70
sub_80DCA70: @ 80DCDAC
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DCDDC
	ldrb r0, [r0]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
	ldr r0, _080DCDE0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DCDE8
	ldr r0, _080DCDE4
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _080DCDF4
	.align 2, 0
_080DCDDC: .4byte gUnknown_0202F7C9
_080DCDE0: .4byte gUnknown_0202F7C8
_080DCDE4: .4byte gUnknown_03004B00
_080DCDE8:
	ldr r1, _080DCE1C
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_080DCDF4:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _080DCE20
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DCE10
	ldrh r0, [r4, 0x22]
	adds r0, 0x8
	strh r0, [r4, 0x22]
_080DCE10:
	ldr r0, _080DCE24
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DCE1C: .4byte gUnknown_03004B00
_080DCE20: .4byte gUnknown_0202F7C9
_080DCE24: .4byte sub_80DCAEC
	thumb_func_end sub_80DCA70

	thumb_func_start sub_80DCAEC
sub_80DCAEC: @ 80DCE28
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DCE5C
	movs r0, 0
	strh r0, [r3, 0x2E]
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
_080DCE5C:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x33
	bne _080DCE70
	adds r0, r3, 0
	bl move_anim_8072740
_080DCE70:
	pop {r0}
	bx r0
	thumb_func_end sub_80DCAEC

	thumb_func_start sub_80DCB38
sub_80DCB38: @ 80DCE74
	ldr r2, _080DCE90
	movs r3, 0xFD
	lsls r3, 6
	adds r1, r3, 0
	strh r1, [r2]
	adds r2, 0x2
	movs r1, 0x10
	strh r1, [r2]
	movs r1, 0x10
	strh r1, [r0, 0x2E]
	ldr r1, _080DCE94
	str r1, [r0, 0x1C]
	bx lr
	.align 2, 0
_080DCE90: .4byte 0x04000050
_080DCE94: .4byte sub_80DCB5C
	thumb_func_end sub_80DCB38

	thumb_func_start sub_80DCB5C
sub_80DCB5C: @ 80DCE98
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x32]
	movs r2, 0x32
	ldrsh r0, [r3, r2]
	cmp r0, 0x13
	bgt _080DCEAC
	adds r0, r1, 0x1
	strh r0, [r3, 0x32]
	b _080DCEE4
_080DCEAC:
	ldrh r1, [r3, 0x30]
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DCEE4
	ldrh r1, [r3, 0x2E]
	subs r1, 0x1
	strh r1, [r3, 0x2E]
	ldr r2, _080DCEE8
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080DCEE4
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DCEEC
	str r0, [r3, 0x1C]
_080DCEE4:
	pop {r0}
	bx r0
	.align 2, 0
_080DCEE8: .4byte 0x04000052
_080DCEEC: .4byte sub_80DCBB4
	thumb_func_end sub_80DCB5C

	thumb_func_start sub_80DCBB4
sub_80DCBB4: @ 80DCEF0
	push {lr}
	ldr r1, _080DCF04
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_080DCF04: .4byte 0x04000050
	thumb_func_end sub_80DCBB4

	thumb_func_start sub_80DCBCC
sub_80DCBCC: @ 80DCF08
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DCF28
	ldr r1, _080DCF24
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	b _080DCF4A
	.align 2, 0
_080DCF24: .4byte gUnknown_03004B00
_080DCF28:
	ldr r0, _080DD024
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DCF4A
	ldr r1, _080DD028
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
	ldrh r0, [r1, 0x6]
	negs r0, r0
	strh r0, [r1, 0x6]
_080DCF4A:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DCF9A
	ldr r0, _080DD024
	ldrb r0, [r0]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r5, _080DD02C
	ldrb r0, [r5]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080DCF9A
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	beq _080DCF88
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DCF9A
_080DCF88:
	ldr r0, _080DD028
	movs r2, 0x4
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0, 0x4]
	movs r2, 0
	ldrsh r1, [r0, r2]
	negs r1, r1
	strh r1, [r0]
_080DCF9A:
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r5, _080DD02C
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	adds r4, r0, 0
	lsls r4, 24
	ldr r6, _080DD028
	lsrs r4, 24
	ldrh r0, [r6, 0x4]
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r6, 0x6]
	adds r1, r2
	lsls r1, 16
	ldrh r2, [r7, 0x20]
	lsls r0, r4, 16
	asrs r0, 16
	subs r0, r2
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r7, 0x22]
	lsrs r5, r1, 16
	asrs r1, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r7, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	ldrh r0, [r6, 0x8]
	strh r0, [r7, 0x2E]
	strh r4, [r7, 0x32]
	strh r5, [r7, 0x36]
	ldr r0, _080DD030
	str r0, [r7, 0x1C]
	ldr r1, _080DD034
	adds r0, r7, 0
	bl oamt_set_x3A_32
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD024: .4byte gUnknown_0202F7C8
_080DD028: .4byte gUnknown_03004B00
_080DD02C: .4byte gUnknown_0202F7C9
_080DD030: .4byte sub_8078B34
_080DD034: .4byte move_anim_8072740
	thumb_func_end sub_80DCBCC

	thumb_func_start sub_80DCCFC
sub_80DCCFC: @ 80DD038
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DD0A4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DD058
	ldr r1, _080DD0A8
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080DD058:
	ldr r4, _080DD0A8
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080DD0AC
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x6]
	adds r0, r1
	strh r0, [r6, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x38]
	adds r0, r6, 0
	bl sub_80786EC
	ldr r0, _080DD0B0
	str r0, [r6, 0x1C]
	adds r2, r6, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD0A4: .4byte gUnknown_0202F7C8
_080DD0A8: .4byte gUnknown_03004B00
_080DD0AC: .4byte gUnknown_0202F7C9
_080DD0B0: .4byte sub_80DCD78
	thumb_func_end sub_80DCCFC

	thumb_func_start sub_80DCD78
sub_80DCD78: @ 80DD0B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r2]
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DD0E0
	adds r0, r4, 0
	bl move_anim_8072740
	b _080DD170
_080DD0E0:
	movs r0, 0x2E
	adds r0, r4
	mov r8, r0
	ldrh r7, [r4, 0x20]
	ldrh r5, [r4, 0x24]
	ldrh r1, [r4, 0x22]
	mov r12, r1
	ldrh r6, [r4, 0x26]
	mov r2, r8
	add r1, sp, 0x4
	movs r3, 0x7
_080DD0F6:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080DD0F6
	adds r0, r7, r5
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r12
	adds r0, r2, r6
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	bne _080DD170
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	lsls r1, r5, 16
	asrs r1, 16
	subs r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r2, [r4, 0x22]
	adds r1, r2
	lsls r2, r6, 16
	asrs r2, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	bl sub_80790F0
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 24
	adds r0, r1
	lsrs r0, 16
	movs r3, 0x80
	lsls r3, 1
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0
	adds r2, r3, 0
	bl sub_8078FDC
	add r2, sp, 0x4
	mov r1, r8
	movs r3, 0x7
_080DD162:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080DD162
_080DD170:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80DCD78

	thumb_func_start sub_80DCE40
sub_80DCE40: @ 80DD17C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DD190
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DD198
	ldr r4, _080DD194
	b _080DD19A
	.align 2, 0
_080DD190: .4byte gUnknown_03004B00
_080DD194: .4byte gUnknown_0202F7C8
_080DD198:
	ldr r4, _080DD1CC
_080DD19A:
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x12
	strh r0, [r5, 0x22]
	ldr r1, _080DD1D0
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080DD1D4
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD1CC: .4byte gUnknown_0202F7C9
_080DD1D0: .4byte move_anim_8074EE0
_080DD1D4: .4byte sub_80785E4
	thumb_func_end sub_80DCE40

	thumb_func_start sub_80DCE9C
sub_80DCE9C: @ 80DD1D8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r6, _080DD244
	movs r1, 0x6
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _080DD1F8
	ldr r0, _080DD248
	ldrb r0, [r0]
	adds r2, r5, 0
	adds r2, 0x20
	adds r3, r5, 0
	adds r3, 0x22
	movs r1, 0
	bl sub_807A3FC
_080DD1F8:
	ldrh r0, [r6]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r4, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r0, 0xE
	strh r0, [r5, 0x22]
	ldrb r1, [r6, 0x2]
	adds r0, r5, 0
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	strh r4, [r5, 0x2E]
	strh r4, [r5, 0x30]
	movs r0, 0x4
	strh r0, [r5, 0x32]
	movs r0, 0x10
	strh r0, [r5, 0x34]
	ldr r0, _080DD24C
	strh r0, [r5, 0x36]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x38]
	ldr r1, _080DD250
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r1, _080DD254
	str r1, [r5, 0x1C]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD244: .4byte gUnknown_03004B00
_080DD248: .4byte gUnknown_0202F7C9
_080DD24C: .4byte 0x0000ffba
_080DD250: .4byte sub_80DCF1C
_080DD254: .4byte sub_8078278
	thumb_func_end sub_80DCE9C

	thumb_func_start sub_80DCF1C
sub_80DCF1C: @ 80DD258
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x38]
	ldrh r2, [r4, 0x20]
	adds r0, r1, r2
	strh r0, [r4, 0x20]
	movs r0, 0xC0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x30]
	movs r0, 0x4
	strh r0, [r4, 0x32]
	movs r0, 0x20
	strh r0, [r4, 0x34]
	ldr r0, _080DD290
	strh r0, [r4, 0x36]
	ldr r1, _080DD294
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _080DD298
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD290: .4byte 0x0000ffe8
_080DD294: .4byte move_anim_8074EE0
_080DD298: .4byte sub_8078278
	thumb_func_end sub_80DCF1C

	thumb_func_start sub_80DCF60
sub_80DCF60: @ 80DD29C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DD2C4
	ldrb r1, [r4, 0xA]
	bl StartSpriteAnim
	adds r0, r5, 0
	bl AnimateSprite
	ldr r0, _080DD2C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DD2CC
	ldrh r0, [r5, 0x20]
	ldrh r1, [r4]
	subs r0, r1
	b _080DD2D2
	.align 2, 0
_080DD2C4: .4byte gUnknown_03004B00
_080DD2C8: .4byte gUnknown_0202F7C8
_080DD2CC:
	ldrh r0, [r4]
	ldrh r1, [r5, 0x20]
	adds r0, r1
_080DD2D2:
	strh r0, [r5, 0x20]
	ldr r3, _080DD314
	ldrh r2, [r3, 0x2]
	ldrh r0, [r5, 0x22]
	adds r2, r0
	movs r4, 0
	strh r2, [r5, 0x22]
	ldrh r0, [r3, 0x8]
	strh r0, [r5, 0x2E]
	ldrh r0, [r5, 0x20]
	strh r0, [r5, 0x30]
	ldrh r1, [r3, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	strh r2, [r5, 0x34]
	ldrh r0, [r3, 0x6]
	adds r2, r0
	strh r2, [r5, 0x36]
	adds r0, r5, 0
	bl sub_8078A5C
	strh r4, [r5, 0x34]
	strh r4, [r5, 0x36]
	ldr r0, _080DD318
	str r0, [r5, 0x1C]
	ldr r1, _080DD31C
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD314: .4byte gUnknown_03004B00
_080DD318: .4byte sub_8078394
_080DD31C: .4byte move_anim_8074EE0
	thumb_func_end sub_80DCF60

	thumb_func_start sub_80DCFE4
sub_80DCFE4: @ 80DD320
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DD338
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DD33C
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	b _080DD344
	.align 2, 0
_080DD338: .4byte gUnknown_03004B00
_080DD33C:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080DD344:
	ldr r1, _080DD360
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x34]
	ldr r0, _080DD364
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DD360: .4byte gUnknown_03004B00
_080DD364: .4byte sub_80DD02C
	thumb_func_end sub_80DCFE4

	thumb_func_start sub_80DD02C
sub_80DD02C: @ 80DD368
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	ldrh r1, [r4, 0x38]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _080DD3AE
	adds r0, r4, 0
	bl move_anim_8072740
_080DD3AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD02C

	thumb_func_start do_boulder_dust
do_boulder_dust: @ 80DD3B4
	push {r4-r6,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	ldr r1, _080DD490
	ldr r2, _080DD494
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r4, _080DD498
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DD400
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080DD400:
	ldr r0, _080DD49C
	strh r5, [r0]
	ldr r0, _080DD4A0
	strh r5, [r0]
	ldr r0, _080DD4A4
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r2, _080DD4A8
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080DD4AC
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080DD4B0
	bl LZDecompressVram
	ldr r0, _080DD4B4
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080DD4B8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DD45C
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080DD45C:
	ldr r0, _080DD4BC
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _080DD476
	ldr r0, _080DD4C0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DD476
	movs r5, 0x1
_080DD476:
	ldr r0, _080DD4C4
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	strh r5, [r1, 0x8]
	ldr r0, _080DD4C8
	str r0, [r1]
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DD490: .4byte 0x04000050
_080DD494: .4byte 0x00003f42
_080DD498: .4byte 0x0400000a
_080DD49C: .4byte gUnknown_030042C0
_080DD4A0: .4byte gUnknown_030041B4
_080DD4A4: .4byte 0x04000014
_080DD4A8: .4byte 0x040000d4
_080DD4AC: .4byte 0x85000400
_080DD4B0: .4byte gBattleAnimBackgroundTilemap_SandstormBrew
_080DD4B4: .4byte gBattleAnimBackgroundImage_SandstormBrew
_080DD4B8: .4byte gBattleAnimSpritePalette_261
_080DD4BC: .4byte gUnknown_03004B00
_080DD4C0: .4byte gUnknown_0202F7C8
_080DD4C4: .4byte gTasks
_080DD4C8: .4byte sub_80DD190
	thumb_func_end do_boulder_dust

	thumb_func_start sub_80DD190
sub_80DD190: @ 80DD4CC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080DD4FC
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r3, r1, 0
	cmp r0, 0
	bne _080DD508
	ldr r1, _080DD500
	ldr r5, _080DD504
	adds r0, r5, 0
	ldrh r2, [r1]
	adds r0, r2
	b _080DD50E
	.align 2, 0
_080DD4FC: .4byte gTasks
_080DD500: .4byte gUnknown_030042C0
_080DD504: .4byte 0x0000fffa
_080DD508:
	ldr r1, _080DD540
	ldrh r0, [r1]
	adds r0, 0x6
_080DD50E:
	strh r0, [r1]
	adds r4, r1, 0
	ldr r1, _080DD544
	ldr r5, _080DD548
	adds r0, r5, 0
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	lsls r2, r7, 2
	adds r0, r2, r7
	lsls r0, 3
	adds r0, r3
	movs r5, 0x20
	ldrsh r0, [r0, r5]
	mov r8, r2
	adds r2, r1, 0
	cmp r0, 0x4
	bls _080DD534
	b _080DD6B8
_080DD534:
	lsls r0, 2
	ldr r1, _080DD54C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD540: .4byte gUnknown_030042C0
_080DD544: .4byte gUnknown_030041B4
_080DD548: .4byte 0x0000ffff
_080DD54C: .4byte _080DD550
	.align 2, 0
_080DD550:
	.4byte _080DD564
	.4byte _080DD5AC
	.4byte _080DD5CE
	.4byte _080DD610
	.4byte _080DD694
_080DD564:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _080DD57E
	b _080DD6B8
_080DD57E:
	strh r4, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	adds r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080DD5A8
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r0, [r3, r2]
	cmp r0, 0x7
	beq _080DD59C
	b _080DD6B8
_080DD59C:
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r4, [r3, 0x1E]
	b _080DD6B8
	.align 2, 0
_080DD5A8: .4byte 0x04000052
_080DD5AC:
	mov r5, r8
	adds r0, r5, r7
	lsls r0, 3
	adds r1, r0, r3
	ldrh r0, [r1, 0x1E]
	adds r0, 0x1
	strh r0, [r1, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x65
	bne _080DD6B8
	movs r0, 0x7
	strh r0, [r1, 0x1E]
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	b _080DD6B8
_080DD5CE:
	mov r1, r8
	adds r0, r1, r7
	lsls r0, 3
	adds r3, r0, r3
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080DD6B8
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0x1E]
	subs r1, 0x1
	strh r1, [r3, 0x1E]
	ldr r2, _080DD60C
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r2, 0x1E
	ldrsh r1, [r3, r2]
	cmp r1, 0
	bne _080DD6B8
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
	strh r1, [r3, 0x1E]
	b _080DD6B8
	.align 2, 0
_080DD60C: .4byte 0x04000052
_080DD610:
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp]
	movs r3, 0x80
	lsls r3, 6
	add r5, sp, 0xC
	movs r6, 0
	ldr r1, _080DD6C8
	movs r4, 0x80
	lsls r4, 5
	mov r9, r5
	ldr r0, _080DD6CC
	mov r12, r0
	movs r0, 0x85
	lsls r0, 24
	mov r10, r0
_080DD632:
	str r6, [sp, 0xC]
	mov r0, r9
	str r0, [r1]
	str r2, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080DD632
	str r6, [sp, 0xC]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r10
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r0, _080DD6C8
	str r5, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080DD6D0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080DD680
	ldr r2, _080DD6D4
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080DD680:
	ldr r0, _080DD6D8
	mov r5, r8
	adds r1, r5, r7
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x20]
	adds r0, 0x1
	strh r0, [r1, 0x20]
	ldr r4, _080DD6DC
	ldr r2, _080DD6E0
_080DD694:
	movs r1, 0
	strh r1, [r4]
	strh r1, [r2]
	ldr r0, _080DD6E4
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _080DD6D4
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, 0
	bl move_anim_task_del
_080DD6B8:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD6C8: .4byte 0x040000d4
_080DD6CC: .4byte 0x85000400
_080DD6D0: .4byte 0x85000200
_080DD6D4: .4byte 0x0400000a
_080DD6D8: .4byte gTasks
_080DD6DC: .4byte gUnknown_030042C0
_080DD6E0: .4byte gUnknown_030041B4
_080DD6E4: .4byte 0x04000050
	thumb_func_end sub_80DD190

	thumb_func_start sub_80DD3AC
sub_80DD3AC: @ 80DD6E8
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DD764
	ldr r4, _080DD72C
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DD734
	ldr r0, _080DD730
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DD734
	movs r0, 0x98
	lsls r0, 1
	strh r0, [r5, 0x20]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
	movs r0, 0x1
	strh r0, [r5, 0x38]
	ldrb r1, [r5, 0x3]
	subs r0, 0x40
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r5, 0x3]
	b _080DD738
	.align 2, 0
_080DD72C: .4byte gUnknown_03004B00
_080DD730: .4byte gUnknown_0202F7C8
_080DD734:
	ldr r0, _080DD758
	strh r0, [r5, 0x20]
_080DD738:
	ldr r4, _080DD75C
	ldrh r0, [r4]
	strh r0, [r5, 0x22]
	ldr r1, _080DD760
	adds r0, r5, 0
	bl SetSubspriteTables
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DD7C0
	.align 2, 0
_080DD758: .4byte 0x0000ffc0
_080DD75C: .4byte gUnknown_03004B00
_080DD760: .4byte gUnknown_083DAD10
_080DD764:
	ldrh r1, [r5, 0x30]
	ldrh r3, [r5, 0x34]
	adds r1, r3
	ldrh r2, [r5, 0x32]
	ldrh r0, [r5, 0x36]
	adds r2, r0
	lsls r0, r1, 16
	asrs r0, 24
	ldrh r3, [r5, 0x24]
	adds r0, r3
	strh r0, [r5, 0x24]
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r3, [r5, 0x26]
	adds r0, r3
	strh r0, [r5, 0x26]
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r5, 0x34]
	ands r2, r0
	strh r2, [r5, 0x36]
	movs r1, 0x38
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DD7AA
	movs r2, 0x20
	ldrsh r0, [r5, r2]
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	adds r0, r1
	movs r1, 0x88
	lsls r1, 1
	cmp r0, r1
	ble _080DD7C0
	b _080DD7BC
_080DD7AA:
	movs r1, 0x20
	ldrsh r0, [r5, r1]
	movs r2, 0x24
	ldrsh r1, [r5, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080DD7C0
_080DD7BC:
	ldr r0, _080DD7C8
	str r0, [r5, 0x1C]
_080DD7C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD7C8: .4byte move_anim_8072740
	thumb_func_end sub_80DD3AC

	thumb_func_start sub_80DD490
sub_80DD490: @ 80DD7CC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DD804
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0x4]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _080DD808
	str r0, [r4, 0x1C]
	ldr r1, _080DD80C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DD804: .4byte gUnknown_03004B00
_080DD808: .4byte sub_8078B34
_080DD80C: .4byte move_anim_8072740
	thumb_func_end sub_80DD490

	thumb_func_start sub_80DD4D4
sub_80DD4D4: @ 80DD810
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DD890
	adds r6, r1, r0
	ldr r5, _080DD894
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xC0
	lsls r1, 13
	adds r0, r1
	lsrs r7, r0, 16
	ldr r4, _080DD898
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xC0
	lsls r2, 13
	adds r0, r2
	lsrs r0, 16
	mov r8, r0
	ldrb r1, [r5]
	movs r0, 0x2
	eors r0, r1
	ldrb r4, [r4]
	cmp r0, r4
	bne _080DD880
	mov r8, r7
_080DD880:
	bl sub_80DD8BC
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bne _080DD89C
	movs r0, 0x20
	b _080DD8A2
	.align 2, 0
_080DD890: .4byte gTasks
_080DD894: .4byte gUnknown_0202F7C8
_080DD898: .4byte gUnknown_0202F7C9
_080DD89C:
	lsls r1, r5, 3
	movs r0, 0x30
	subs r0, r1
_080DD8A2:
	strh r0, [r6, 0x18]
	movs r4, 0
	strh r4, [r6, 0x8]
	strh r4, [r6, 0x1E]
	strh r4, [r6, 0x1A]
	movs r0, 0x1
	strh r0, [r6, 0x20]
	movs r1, 0x18
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bge _080DD8BA
	adds r0, 0x7
_080DD8BA:
	asrs r0, 3
	subs r0, 0x1
	strh r0, [r6, 0x1C]
	mov r2, r9
	lsls r0, r2, 3
	strh r0, [r6, 0xC]
	lsls r0, r7, 3
	strh r0, [r6, 0xE]
	mov r1, r10
	subs r0, r1, r2
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x10]
	mov r1, r8
	subs r0, r1, r7
	lsls r0, 3
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x12]
	strh r4, [r6, 0x14]
	strh r4, [r6, 0x16]
	movs r0, 0x40
	negs r0, r0
	bl sub_8076F98
	adds r4, r0, 0
	lsls r4, 24
	asrs r4, 8
	lsrs r4, 16
	movs r0, 0x3F
	bl sub_8076F98
	lsls r0, 24
	strh r4, [r6, 0x22]
	asrs r0, 24
	lsls r4, 16
	asrs r4, 16
	subs r0, r4
	movs r2, 0x18
	ldrsh r1, [r6, r2]
	bl __divsi3
	strh r0, [r6, 0x24]
	strh r5, [r6, 0xA]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x26]
	ldr r0, _080DD93C
	str r0, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DD93C: .4byte sub_80DD604
	thumb_func_end sub_80DD4D4

	thumb_func_start sub_80DD604
sub_80DD604: @ 80DD940
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DD964
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080DD95A
	b _080DDAA8
_080DD95A:
	lsls r0, 2
	ldr r1, _080DD968
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DD964: .4byte gTasks
_080DD968: .4byte _080DD96C
	.align 2, 0
_080DD96C:
	.4byte _080DD980
	.4byte _080DD9E4
	.4byte _080DD9EC
	.4byte _080DDA48
	.4byte _080DDA9A
_080DD980:
	ldrh r2, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	subs r2, r0
	strh r2, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	ldr r3, _080DD9E0
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	lsls r2, 16
	asrs r2, 19
	strh r2, [r0, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080DD9D0
	movs r0, 0x14
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DD9D0:
	ldrh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xA2
	bl PlaySE12WithPanning
	b _080DDAA8
	.align 2, 0
_080DD9E0: .4byte gSprites
_080DD9E4:
	ldrh r0, [r4, 0x1E]
	subs r0, 0x1
	strh r0, [r4, 0x1E]
	b _080DDA8C
_080DD9EC:
	ldrh r0, [r4, 0x1A]
	subs r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _080DDA0C
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0x14]
	adds r0, r2
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	b _080DDA16
_080DDA0C:
	strh r0, [r4, 0x14]
	strh r0, [r4, 0x16]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DDA16:
	ldr r2, _080DDA44
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x24]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r1, 0x26]
	b _080DDAA8
	.align 2, 0
_080DDA44: .4byte gSprites
_080DDA48:
	ldrh r0, [r4, 0x10]
	ldrh r2, [r4, 0xC]
	adds r0, r2
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0xE]
	adds r0, r1
	strh r0, [r4, 0xE]
	ldrh r0, [r4, 0x1A]
	adds r0, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x1C
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _080DDA86
	movs r0, 0
	strh r0, [r4, 0x1A]
	adds r0, r4, 0
	bl sub_80DD774
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xAF
	bl PlaySE12WithPanning
_080DDA86:
	ldrh r0, [r4, 0x18]
	subs r0, 0x1
	strh r0, [r4, 0x18]
_080DDA8C:
	lsls r0, 16
	cmp r0, 0
	bne _080DDAA8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DDAA8
_080DDA9A:
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DDAA8
	adds r0, r2, 0
	bl move_anim_task_del
_080DDAA8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD604

	thumb_func_start sub_80DD774
sub_80DD774: @ 80DDAB0
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bhi _080DDBA0
	lsls r0, 2
	ldr r1, _080DDACC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DDACC: .4byte _080DDAD0
	.align 2, 0
_080DDAD0:
	.4byte _080DDAE4
	.4byte _080DDAF0
	.4byte _080DDAF0
	.4byte _080DDAFC
	.4byte _080DDB08
_080DDAE4:
	ldr r3, _080DDAEC
	movs r5, 0
	b _080DDB0C
	.align 2, 0
_080DDAEC: .4byte gSpriteTemplate_83DAD78
_080DDAF0:
	ldr r3, _080DDAF8
	movs r5, 0x50
	b _080DDB0C
	.align 2, 0
_080DDAF8: .4byte gSpriteTemplate_83DAD90
_080DDAFC:
	ldr r3, _080DDB04
	movs r5, 0x40
	b _080DDB0C
	.align 2, 0
_080DDB04: .4byte gSpriteTemplate_83DAD90
_080DDB08:
	ldr r3, _080DDBA8
	movs r5, 0x30
_080DDB0C:
	ldrh r1, [r4, 0xC]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r4, 0xE]
	lsls r2, 16
	asrs r2, 19
	lsls r2, 16
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	lsls r0, 2
	adds r1, r0
	lsls r1, 16
	lsrs r6, r1, 16
	asrs r1, 16
	lsrs r7, r2, 16
	asrs r2, 16
	adds r0, r3, 0
	movs r3, 0x23
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080DDB98
	ldr r1, _080DDBAC
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r1, 0x12
	strh r1, [r0, 0x2E]
	movs r2, 0x20
	ldrsh r1, [r4, r2]
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r2, r6, r2
	movs r6, 0xA
	ldrsh r3, [r4, r6]
	lsls r1, r3, 1
	adds r1, r3
	adds r2, r1
	strh r2, [r0, 0x32]
	strh r7, [r0, 0x36]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r2, 1
	movs r3, 0x10
	negs r3, r3
	adds r1, r3, 0
	subs r1, r2
	strh r1, [r0, 0x38]
	ldrh r3, [r0, 0x4]
	lsls r2, r3, 22
	lsrs r2, 22
	adds r2, r5
	ldr r5, _080DDBB0
	adds r1, r5, 0
	ands r2, r1
	ldr r1, _080DDBB4
	ands r1, r3
	orrs r1, r2
	strh r1, [r0, 0x4]
	bl sub_80786EC
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
_080DDB98:
	movs r6, 0x20
	ldrsh r0, [r4, r6]
	negs r0, r0
	strh r0, [r4, 0x20]
_080DDBA0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DDBA8: .4byte gSpriteTemplate_83DAD90
_080DDBAC: .4byte gSprites
_080DDBB0: .4byte 0x000003ff
_080DDBB4: .4byte 0xfffffc00
	thumb_func_end sub_80DD774

	thumb_func_start sub_80DD87C
sub_80DD87C: @ 80DDBB8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080DDBEA
	ldr r0, _080DDBF0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080DDBE4
	ldr r0, _080DDBF4
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1E]
	subs r0, 0x1
	strh r0, [r1, 0x1E]
_080DDBE4:
	adds r0, r4, 0
	bl DestroySprite
_080DDBEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDBF0: .4byte sub_80DD604
_080DDBF4: .4byte gTasks
	thumb_func_end sub_80DD87C

	thumb_func_start sub_80DD8BC
sub_80DD8BC: @ 80DDBF8
	push {lr}
	ldr r0, _080DDC20
	ldr r0, [r0]
	ldrb r1, [r0, 0x11]
	lsrs r0, r1, 4
	lsls r1, 28
	lsrs r1, 28
	subs r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080DDC1A
	movs r1, 0x1
_080DDC1A:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080DDC20: .4byte gUnknown_0202F7B4
	thumb_func_end sub_80DD8BC

	thumb_func_start sub_80DD8E8
sub_80DD8E8: @ 80DDC24
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DDC5C
	ldrb r1, [r5, 0x8]
	bl StartSpriteAnim
	ldrh r0, [r5]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x34]
	ldrh r1, [r5, 0x4]
	subs r0, r1
	strh r0, [r4, 0x34]
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	ldr r0, _080DDC60
	str r0, [r4, 0x1C]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDC5C: .4byte gUnknown_03004B00
_080DDC60: .4byte sub_80DD928
	thumb_func_end sub_80DD8E8

	thumb_func_start sub_80DD928
sub_80DD928: @ 80DDC64
	push {lr}
	adds r2, r0, 0
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x5
	negs r1, r1
	ands r1, r0
	strb r1, [r3]
	ldrh r1, [r2, 0x34]
	movs r3, 0x34
	ldrsh r0, [r2, r3]
	cmp r0, 0
	beq _080DDC9C
	ldrh r3, [r2, 0x32]
	adds r0, r1, r3
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x2E]
	adds r1, r0
	strh r1, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r1, 16
	cmp r1, 0
	ble _080DDCAE
	movs r0, 0
	strh r0, [r2, 0x34]
	b _080DDCAE
_080DDC9C:
	ldrh r0, [r2, 0x30]
	subs r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	cmp r0, 0
	bne _080DDCAE
	adds r0, r2, 0
	bl move_anim_8072740
_080DDCAE:
	pop {r0}
	bx r0
	thumb_func_end sub_80DD928

	thumb_func_start sub_80DD978
sub_80DD978: @ 80DDCB4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DDCDC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DDCD0
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080DDCD0:
	adds r0, r4, 0
	bl sub_807941C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDCDC: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80DD978

	thumb_func_start sub_80DD9A4
sub_80DD9A4: @ 80DDCE0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080DDD2C
	ldrb r0, [r5]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DDD30
	ldrh r3, [r2]
	ldrh r5, [r4, 0x20]
	adds r1, r3, r5
	strh r1, [r4, 0x20]
	ldrh r1, [r2, 0x2]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r3, [r4, 0x30]
	strh r1, [r4, 0x32]
	ldrh r0, [r2, 0x4]
	strh r0, [r4, 0x38]
	ldrb r1, [r2, 0x6]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080DDD34
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDD2C: .4byte gUnknown_0202F7C9
_080DDD30: .4byte gUnknown_03004B00
_080DDD34: .4byte sub_80DD9FC
	thumb_func_end sub_80DD9A4

	thumb_func_start sub_80DD9FC
sub_80DD9FC: @ 80DDD38
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl __divsi3
	ldrh r1, [r4, 0x24]
	adds r1, r0
	strh r1, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	subs r1, r0
	strh r1, [r4, 0x26]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x8C
	ble _080DDD82
	adds r0, r4, 0
	bl move_anim_8072740
_080DDD82:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DD9FC

	thumb_func_start sub_80DDA4C
sub_80DDA4C: @ 80DDD88
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080DDDC0
	ldr r0, [r2]
	cmp r0, 0x20
	bgt _080DDD9C
	ldr r1, _080DDDC4
	movs r0, 0
	strh r0, [r1, 0xE]
_080DDD9C:
	ldr r2, [r2]
	adds r0, r2, 0
	subs r0, 0x21
	cmp r0, 0x20
	bhi _080DDDAC
	ldr r1, _080DDDC4
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080DDDAC:
	cmp r2, 0x41
	ble _080DDDB6
	ldr r1, _080DDDC4
	movs r0, 0x2
	strh r0, [r1, 0xE]
_080DDDB6:
	adds r0, r3, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080DDDC0: .4byte gUnknown_0202F7B8
_080DDDC4: .4byte gUnknown_03004B00
	thumb_func_end sub_80DDA4C

	thumb_func_start sub_80DDA8C
sub_80DDA8C: @ 80DDDC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080DDE24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080DDDEA
	movs r0, 0
	bl sub_80789D4
	movs r0, 0xC8
	strh r0, [r5, 0xA]
_080DDDEA:
	ldr r4, _080DDE28
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r1, 0xA
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	ldrh r0, [r5, 0xA]
	subs r0, 0x3
	strh r0, [r5, 0xA]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x78
	bne _080DDE16
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r6, 0
	bl move_anim_task_del
_080DDE16:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDE24: .4byte gTasks
_080DDE28: .4byte gUnknown_030041B8
	thumb_func_end sub_80DDA8C

	thumb_func_start sub_80DDAF0
sub_80DDAF0: @ 80DDE2C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DDE98
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DDE58
	movs r0, 0
	bl sub_80789D4
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080DDE9C
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
_080DDE58:
	ldrh r0, [r4, 0xA]
	adds r0, 0x50
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0xA]
	ldr r6, _080DDE9C
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r0, 0x4
	bl Cos
	ldrh r4, [r4, 0xC]
	adds r0, r4
	strh r0, [r6]
	ldr r0, _080DDEA0
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	ldr r0, _080DDEA4
	cmp r1, r0
	bne _080DDE90
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r5, 0
	bl move_anim_task_del
_080DDE90:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DDE98: .4byte gTasks
_080DDE9C: .4byte gUnknown_030041B8
_080DDEA0: .4byte gUnknown_03004B00
_080DDEA4: .4byte 0x00000fff
	thumb_func_end sub_80DDAF0

	thumb_func_start sub_80DDB6C
sub_80DDB6C: @ 80DDEA8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DDF04
	ldrh r0, [r0, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldr r5, _080DDF08
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	adds r0, r4, 0
	bl sub_8078BD4
	ldr r0, _080DDF0C
	str r0, [r4, 0x1C]
	movs r0, 0x10
	strh r0, [r4, 0x3A]
	ldr r1, _080DDF10
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x3A]
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DDF04: .4byte gUnknown_03004B00
_080DDF08: .4byte gUnknown_0202F7C9
_080DDF0C: .4byte sub_80DDBD8
_080DDF10: .4byte 0x04000050
	thumb_func_end sub_80DDB6C

	thumb_func_start sub_80DDBD8
sub_80DDBD8: @ 80DDF14
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80DDCC8
	adds r0, r4, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _080DDF34
	ldr r0, _080DDF30
	str r0, [r4, 0x1C]
	b _080DDF7E
	.align 2, 0
_080DDF30: .4byte sub_80DDC4C
_080DDF34:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080DDF6C
	cmp r2, 0xC4
	ble _080DDF7E
_080DDF6C:
	lsls r0, 16
	cmp r0, 0
	ble _080DDF7E
	ldr r0, _080DDF84
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0xC4
	bl PlaySE12WithPanning
_080DDF7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DDF84: .4byte gUnknown_0202F7D2
	thumb_func_end sub_80DDBD8

	thumb_func_start sub_80DDC4C
sub_80DDC4C: @ 80DDF88
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078B5C
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl Sin
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r1, 0xF
	bl Cos
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r2, [r4, 0x38]
	adds r0, r2, 0x5
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x38]
	lsls r2, 16
	asrs r2, 16
	cmp r2, 0
	beq _080DDFCE
	cmp r2, 0xC4
	ble _080DDFDA
_080DDFCE:
	lsls r0, 16
	cmp r0, 0
	ble _080DDFDA
	movs r0, 0xC4
	bl PlaySE
_080DDFDA:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DDFF8
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DDFF4
	str r0, [r4, 0x1C]
	b _080DDFFE
	.align 2, 0
_080DDFF4: .4byte sub_807861C
_080DDFF8:
	adds r0, r4, 0
	bl sub_80DDCC8
_080DDFFE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DDC4C

	thumb_func_start sub_80DDCC8
sub_80DDCC8: @ 80DE004
	push {r4,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0xFF
	ble _080DE028
	adds r0, r2, 0x1
	strh r0, [r3, 0x3A]
	lsls r0, 16
	ldr r1, _080DE024
	cmp r0, r1
	bne _080DE088
	movs r0, 0
	b _080DE086
	.align 2, 0
_080DE024: .4byte 0x010d0000
_080DE028:
	ldrh r1, [r3, 0x3C]
	adds r4, r1, 0x1
	strh r4, [r3, 0x3C]
	movs r0, 0xFF
	ands r0, r1
	cmp r0, 0
	bne _080DE088
	ldr r1, _080DE04C
	ands r1, r4
	strh r1, [r3, 0x3C]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080DE050
	adds r0, r2, 0x1
	b _080DE052
	.align 2, 0
_080DE04C: .4byte 0xffffff00
_080DE050:
	subs r0, r2, 0x1
_080DE052:
	strh r0, [r3, 0x3A]
	ldr r2, _080DE090
	ldrh r1, [r3, 0x3A]
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r0, r1
	strh r0, [r2]
	movs r2, 0x3A
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _080DE06E
	cmp r0, 0x10
	bne _080DE07A
_080DE06E:
	ldrh r0, [r3, 0x3C]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r3, 0x3C]
_080DE07A:
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080DE088
	movs r0, 0x80
	lsls r0, 1
_080DE086:
	strh r0, [r3, 0x3A]
_080DE088:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE090: .4byte 0x04000052
	thumb_func_end sub_80DDCC8

	thumb_func_start sub_80DDD58
sub_80DDD58: @ 80DE094
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r1, _080DE0B0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE0B0: .4byte sub_80DDD78
	thumb_func_end sub_80DDD58

	thumb_func_start sub_80DDD78
sub_80DDD78: @ 80DE0B4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x20
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x8
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x82
	bhi _080DE0E8
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x8
	b _080DE0F2
_080DE0E8:
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
_080DE0F2:
	orrs r1, r0
	strb r1, [r4, 0x5]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x13
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x50
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3D
	bne _080DE124
	adds r0, r4, 0
	bl move_anim_8072740
_080DE124:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DDD78

	thumb_func_start sub_80DDDF0
sub_80DDDF0: @ 80DE12C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080DE1A4
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078E70
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x80
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _080DE1A8
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldr r1, _080DE1AC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	movs r1, 0x80
	strh r1, [r0, 0x8]
	ldr r1, _080DE1B0
	ldrh r1, [r1]
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	movs r1, 0x10
	strh r1, [r0, 0xE]
	ldr r1, _080DE1B4
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DE1A4: .4byte 0x04000050
_080DE1A8: .4byte gSprites
_080DE1AC: .4byte gTasks
_080DE1B0: .4byte gUnknown_03004B00
_080DE1B4: .4byte sub_80DDE7C
	thumb_func_end sub_80DDDF0

	thumb_func_start sub_80DDE7C
sub_80DDE7C: @ 80DE1B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DE200
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DE1FA
	movs r0, 0
	strh r0, [r3, 0x1C]
	ldrh r1, [r3, 0xC]
	adds r1, 0x1
	strh r1, [r3, 0xC]
	ldrh r0, [r3, 0xE]
	subs r0, 0x1
	strh r0, [r3, 0xE]
	ldr r2, _080DE204
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0x9
	bne _080DE1FA
	ldr r0, _080DE208
	str r0, [r3]
_080DE1FA:
	pop {r0}
	bx r0
	.align 2, 0
_080DE200: .4byte gTasks
_080DE204: .4byte 0x04000052
_080DE208: .4byte sub_80DDED0
	thumb_func_end sub_80DDE7C

	thumb_func_start sub_80DDED0
sub_80DDED0: @ 80DE20C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _080DE230
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080DE234
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080DE272
	.align 2, 0
_080DE230: .4byte gTasks
_080DE234:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r1, r0, 24
	ldrh r0, [r4, 0x8]
	adds r0, 0x8
	movs r6, 0
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _080DE25E
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	adds r0, r1, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	b _080DE272
_080DE25E:
	adds r0, r1, 0
	bl sub_8078F40
	adds r0, r5, 0
	bl move_anim_task_del
	ldr r0, _080DE278
	strh r6, [r0]
	adds r0, 0x2
	strh r6, [r0]
_080DE272:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE278: .4byte 0x04000050
	thumb_func_end sub_80DDED0

	thumb_func_start sub_80DDF40
sub_80DDF40: @ 80DE27C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r5, [r4, 0x20]
	ldrh r6, [r4, 0x22]
	ldr r0, _080DE318
	mov r8, r0
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	mov r9, r1
	strh r0, [r4, 0x20]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	mov r1, r9
	strh r1, [r4, 0x2E]
	ldr r2, _080DE31C
	ldrh r1, [r2]
	strh r1, [r4, 0x30]
	ldrh r1, [r2, 0x2]
	strh r1, [r4, 0x32]
	ldrh r1, [r2, 0x4]
	strh r1, [r4, 0x34]
	ldrh r1, [r4, 0x20]
	lsls r1, 4
	strh r1, [r4, 0x36]
	lsls r0, 4
	strh r0, [r4, 0x38]
	lsls r5, 16
	asrs r5, 16
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	subs r5, r0
	lsls r5, 4
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r5, 0
	str r2, [sp]
	bl __divsi3
	strh r0, [r4, 0x3A]
	lsls r6, 16
	asrs r6, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	subs r6, r0
	lsls r6, 4
	ldr r2, [sp]
	movs r0, 0
	ldrsh r1, [r2, r0]
	lsls r1, 1
	adds r0, r6, 0
	bl __divsi3
	strh r0, [r4, 0x3C]
	ldr r0, _080DE320
	str r0, [r4, 0x1C]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE318: .4byte gUnknown_0202F7C8
_080DE31C: .4byte gUnknown_03004B00
_080DE320: .4byte sub_80DDFE8
	thumb_func_end sub_80DDF40

	thumb_func_start sub_80DDFE8
sub_80DDFE8: @ 80DE324
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080DE36E
	cmp r0, 0x1
	bgt _080DE33A
	cmp r0, 0
	beq _080DE344
	b _080DE432
_080DE33A:
	cmp r0, 0x2
	beq _080DE3D8
	cmp r0, 0x3
	beq _080DE42C
	b _080DE432
_080DE344:
	ldrh r0, [r5, 0x3A]
	ldrh r2, [r5, 0x36]
	adds r0, r2
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x30]
	subs r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	cmp r0, 0
	bgt _080DE432
	b _080DE41E
_080DE36E:
	ldrh r0, [r5, 0x32]
	subs r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	cmp r0, 0
	bgt _080DE432
	ldr r4, _080DE3D4
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x30]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrh r0, [r5, 0x20]
	lsls r0, 4
	strh r0, [r5, 0x36]
	ldrh r0, [r5, 0x22]
	lsls r0, 4
	strh r0, [r5, 0x38]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	movs r2, 0x20
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3A]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r2, 0x22
	ldrsh r1, [r5, r2]
	subs r0, r1
	lsls r0, 4
	movs r2, 0x34
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r5, 0x3C]
	b _080DE41E
	.align 2, 0
_080DE3D4: .4byte gUnknown_0202F7C9
_080DE3D8:
	ldrh r0, [r5, 0x3A]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r1, [r5, 0x3C]
	ldrh r2, [r5, 0x38]
	adds r1, r2
	strh r1, [r5, 0x38]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r5, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x34]
	subs r0, 0x1
	strh r0, [r5, 0x34]
	lsls r0, 16
	cmp r0, 0
	bgt _080DE432
	ldr r4, _080DE428
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_080DE41E:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	b _080DE432
	.align 2, 0
_080DE428: .4byte gUnknown_0202F7C9
_080DE42C:
	adds r0, r5, 0
	bl move_anim_8074EE0
_080DE432:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DDFE8

	thumb_func_start sub_80DE0FC
sub_80DE0FC: @ 80DE438
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080DE44C
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DE44C: .4byte sub_80DE114
	thumb_func_end sub_80DE0FC

	thumb_func_start sub_80DE114
sub_80DE114: @ 80DE450
	push {r4-r6,lr}
	adds r3, r0, 0
	movs r5, 0
	movs r6, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080DE4E6
	adds r1, r3, 0
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r0, 0x4
	ands r0, r2
	adds r4, r1, 0
	cmp r0, 0
	bne _080DE47A
	movs r0, 0x4
	orrs r0, r2
	strb r0, [r4]
_080DE47A:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _080DE48A
	cmp r0, 0x1
	beq _080DE494
	movs r6, 0x1
	b _080DE49E
_080DE48A:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x2
	bne _080DE49E
	b _080DE4A2
_080DE494:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0x4
	bne _080DE49E
	movs r5, 0x1
_080DE49E:
	cmp r5, 0
	beq _080DE4D4
_080DE4A2:
	ldrb r2, [r4]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r3, 0x32]
	strh r1, [r3, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _080DE4E6
	strh r1, [r3, 0x32]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080DE4E6
_080DE4D4:
	cmp r6, 0
	beq _080DE4E0
	adds r0, r3, 0
	bl move_anim_8072740
	b _080DE4E6
_080DE4E0:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
_080DE4E6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE114

	thumb_func_start sub_80DE1B0
sub_80DE1B0: @ 80DE4EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DE518
	adds r5, r0, r1
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	movs r6, 0
	movs r1, 0
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080DE51C
	adds r0, r4, 0
	bl move_anim_task_del
	b _080DE5FC
	.align 2, 0
_080DE518: .4byte gTasks
_080DE51C:
	strh r1, [r5, 0xA]
	movs r0, 0xF
	strh r0, [r5, 0xC]
	movs r0, 0x2
	strh r0, [r5, 0xE]
	strh r1, [r5, 0x10]
	ldr r1, _080DE580
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080DE584
	ldrh r0, [r5, 0xE]
	lsls r0, 8
	ldrh r1, [r5, 0xC]
	orrs r0, r1
	strh r0, [r2]
	ldr r4, _080DE588
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x50
	strh r1, [r0, 0x2E]
	ldr r0, _080DE58C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DE594
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080DE590
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x70
	b _080DE5B2
	.align 2, 0
_080DE580: .4byte 0x04000050
_080DE584: .4byte 0x04000052
_080DE588: .4byte gSprites
_080DE58C: .4byte gUnknown_0202F7C9
_080DE590: .4byte 0x0000ff70
_080DE594:
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0x90
	strh r1, [r0, 0x30]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080DE604
_080DE5B2:
	strh r1, [r0, 0x32]
	ldr r4, _080DE608
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r2, 0
	strh r2, [r0, 0x34]
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r2, [r0, 0x36]
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080DE60C
	bl oamt_set_x3A_32
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _080DE610
	str r1, [r0]
	ldr r0, _080DE614
	str r0, [r5]
_080DE5FC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DE604: .4byte 0x0000ff90
_080DE608: .4byte gSprites
_080DE60C: .4byte SpriteCallbackDummy
_080DE610: .4byte sub_8078394
_080DE614: .4byte sub_80DE2DC
	thumb_func_end sub_80DE1B0

	thumb_func_start sub_80DE2DC
sub_80DE2DC: @ 80DE618
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DE63C
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DE6B8
	cmp r0, 0x1
	bgt _080DE640
	cmp r0, 0
	beq _080DE646
	b _080DE6E2
	.align 2, 0
_080DE63C: .4byte gTasks
_080DE640:
	cmp r0, 0x2
	beq _080DE6DC
	b _080DE6E2
_080DE646:
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x3
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0x1
	bne _080DE664
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080DE664
	subs r0, r1, 0x1
	strh r0, [r4, 0xC]
_080DE664:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _080DE67A
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DE67A
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
_080DE67A:
	ldr r2, _080DE6B0
	ldrh r0, [r4, 0xE]
	lsls r0, 8
	ldrh r1, [r4, 0xC]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r4, 0xC]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080DE6E2
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _080DE6E2
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DE6B4
	adds r0, r1
	bl obj_delete_but_dont_free_vram
	movs r0, 0x1
	strh r0, [r4, 0x10]
	b _080DE6E2
	.align 2, 0
_080DE6B0: .4byte 0x04000052
_080DE6B4: .4byte gSprites
_080DE6B8:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DE6E2
	ldr r0, _080DE6D8
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	b _080DE6E2
	.align 2, 0
_080DE6D8: .4byte 0x04000050
_080DE6DC:
	adds r0, r2, 0
	bl move_anim_task_del
_080DE6E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE2DC

	thumb_func_start sub_80DE3AC
sub_80DE3AC: @ 80DE6E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080DE708
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	ldr r2, _080DE70C
	str r2, [r1]
	bl _call_via_r2
	pop {r0}
	bx r0
	.align 2, 0
_080DE708: .4byte gTasks
_080DE70C: .4byte sub_80DE3D4
	thumb_func_end sub_80DE3AC

	thumb_func_start sub_80DE3D4
sub_80DE3D4: @ 80DE710
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080DE748
	adds r5, r0, r1
	ldr r0, _080DE74C
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080DE73C
	b _080DE940
_080DE73C:
	lsls r0, 2
	ldr r1, _080DE750
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DE748: .4byte gTasks
_080DE74C: .4byte gUnknown_0202F7C9
_080DE750: .4byte _080DE754
	.align 2, 0
_080DE754:
	.4byte _080DE768
	.4byte _080DE83C
	.4byte _080DE880
	.4byte _080DE8E8
	.4byte _080DE91C
_080DE768:
	ldr r7, _080DE79C
	adds r0, r7, 0
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	mov r8, r2
	strh r0, [r5, 0x24]
	cmp r0, 0xFF
	beq _080DE792
	movs r0, 0x1
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bge _080DE7A0
	adds r0, r7, 0
	bl FreeSpritePaletteByTag
_080DE792:
	adds r0, r4, 0
	bl move_anim_task_del
	b _080DE946
	.align 2, 0
_080DE79C: .4byte 0x00002771
_080DE7A0:
	ldr r4, _080DE820
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrh r2, [r5, 0x24]
	lsls r2, 4
	ldrb r3, [r1, 0x5]
	movs r0, 0xF
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r1, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	movs r2, 0x8
	ldrsh r1, [r5, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	mov r3, r8
	strh r3, [r5, 0xA]
	strh r3, [r5, 0xC]
	movs r0, 0x10
	strh r0, [r5, 0xE]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x10]
	cmp r6, 0x1
	bne _080DE828
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DE824
	b _080DE830
	.align 2, 0
_080DE820: .4byte gSprites
_080DE824: .4byte 0x0000fdff
_080DE828:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DE838
_080DE830:
	ands r0, r1
	strh r0, [r2]
	b _080DE940
	.align 2, 0
_080DE838: .4byte 0x0000fbff
_080DE83C:
	movs r1, 0x24
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 4
	strh r0, [r5, 0x24]
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	lsls r0, 1
	ldr r1, _080DE870
	adds r0, r1
	movs r3, 0x24
	ldrsh r1, [r5, r3]
	lsls r1, 1
	ldr r2, _080DE874
	adds r1, r2
	ldr r2, _080DE878
	bl CpuSet
	ldrh r0, [r5, 0x10]
	ldr r3, _080DE87C
	movs r1, 0x10
	movs r2, 0xA
	bl BlendPalette
	b _080DE940
	.align 2, 0
_080DE870: .4byte gPlttBufferUnfaded
_080DE874: .4byte gPlttBufferFaded
_080DE878: .4byte 0x04000008
_080DE87C: .4byte 0x00003c0d
_080DE880:
	ldr r2, _080DE8BC
	movs r0, 0x22
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	subs r1, 0x20
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _080DE8A0
	movs r2, 0
_080DE8A0:
	cmp r6, 0x1
	bne _080DE8C0
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x4
	str r2, [sp, 0x4]
	str r6, [sp, 0x8]
	b _080DE8D8
	.align 2, 0
_080DE8BC: .4byte gSprites
_080DE8C0:
	lsls r0, r2, 24
	lsrs r0, 24
	adds r1, r2, 0
	adds r1, 0x40
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	str r2, [sp]
	movs r2, 0x8
	str r2, [sp, 0x4]
	movs r2, 0x1
	str r2, [sp, 0x8]
_080DE8D8:
	movs r2, 0x2
	movs r3, 0x6
	bl sub_8089944
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x1C]
	b _080DE940
_080DE8E8:
	cmp r6, 0x1
	bne _080DE8FC
	ldr r1, _080DE8F4
	ldr r2, _080DE8F8
	adds r0, r2, 0
	b _080DE902
	.align 2, 0
_080DE8F4: .4byte 0x04000050
_080DE8F8: .4byte 0x00003f42
_080DE8FC:
	ldr r1, _080DE910
	ldr r3, _080DE914
	adds r0, r3, 0
_080DE902:
	strh r0, [r1]
	ldr r1, _080DE918
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	b _080DE940
	.align 2, 0
_080DE910: .4byte 0x04000050
_080DE914: .4byte 0x00003f44
_080DE918: .4byte 0x04000052
_080DE91C:
	cmp r6, 0x1
	bne _080DE92C
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 2
	b _080DE936
_080DE92C:
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
_080DE936:
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _080DE954
	str r0, [r5]
_080DE940:
	ldrh r0, [r5, 0x26]
	adds r0, 0x1
	strh r0, [r5, 0x26]
_080DE946:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DE954: .4byte sub_80DE61C
	thumb_func_end sub_80DE3D4

	thumb_func_start sub_80DE61C
sub_80DE61C: @ 80DE958
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DE9DC
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r0, 0x1
	ands r0, r1
	strh r0, [r4, 0x12]
	cmp r0, 0
	bne _080DE990
	ldr r1, _080DE9E0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	strh r0, [r4, 0xC]
_080DE990:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _080DE9B2
	ldr r1, _080DE9E0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x12
	bl __divsi3
	movs r1, 0x10
	subs r1, r0
	strh r1, [r4, 0xE]
_080DE9B2:
	ldr r2, _080DE9E4
	ldrh r0, [r4, 0xE]
	lsls r0, 8
	ldrh r1, [r4, 0xC]
	orrs r0, r1
	strh r0, [r2]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0x80
	bne _080DE9D4
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _080DE9E8
	str r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
_080DE9D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DE9DC: .4byte gTasks
_080DE9E0: .4byte gSineTable
_080DE9E4: .4byte 0x04000052
_080DE9E8: .4byte sub_80DE6B0
	thumb_func_end sub_80DE61C

	thumb_func_start sub_80DE6B0
sub_80DE6B0: @ 80DE9EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080DEA1C
	adds r4, r0, r1
	ldr r0, _080DEA20
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080DEA68
	cmp r0, 0x1
	bgt _080DEA24
	cmp r0, 0
	beq _080DEA2A
	b _080DEAE6
	.align 2, 0
_080DEA1C: .4byte gTasks
_080DEA20: .4byte gUnknown_0202F7C9
_080DEA24:
	cmp r0, 0x2
	beq _080DEA7C
	b _080DEAE6
_080DEA2A:
	ldr r1, _080DEA4C
	movs r0, 0x3
	strb r0, [r1, 0x15]
	movs r0, 0x1
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	cmp r6, 0x1
	bne _080DEA54
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DEA50
	b _080DEA5C
	.align 2, 0
_080DEA4C: .4byte gUnknown_03004DC0
_080DEA50: .4byte 0x0000fdff
_080DEA54:
	movs r2, 0x80
	lsls r2, 19
	ldrh r1, [r2]
	ldr r0, _080DEA64
_080DEA5C:
	ands r0, r1
	strh r0, [r2]
	b _080DEAE6
	.align 2, 0
_080DEA64: .4byte 0x0000fbff
_080DEA68:
	ldrh r0, [r4, 0x10]
	ldr r3, _080DEA78
	movs r1, 0x10
	movs r2, 0
	bl BlendPalette
	b _080DEAE6
	.align 2, 0
_080DEA78: .4byte 0x00003c0d
_080DEA7C:
	ldr r3, _080DEAC4
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	bl obj_delete_but_dont_free_vram
	ldr r0, _080DEAC8
	bl FreeSpritePaletteByTag
	ldr r0, _080DEACC
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	cmp r6, 0x1
	bne _080DEAD0
	subs r0, 0x52
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 2
	b _080DEADA
	.align 2, 0
_080DEAC4: .4byte gSprites
_080DEAC8: .4byte 0x00002771
_080DEACC: .4byte 0x04000050
_080DEAD0:
	movs r0, 0x80
	lsls r0, 19
	ldrh r1, [r0]
	movs r3, 0x80
	lsls r3, 3
_080DEADA:
	adds r2, r3, 0
	orrs r1, r2
	strh r1, [r0]
	adds r0, r5, 0
	bl move_anim_task_del
_080DEAE6:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE6B0

	thumb_func_start sub_80DE7B8
sub_80DE7B8: @ 80DEAF4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	ldr r0, _080DEB30
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DEB3C
	ldr r4, _080DEB34
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080DEB38
	b _080DEB60
	.align 2, 0
_080DEB30: .4byte gUnknown_03004B00
_080DEB34: .4byte gUnknown_0202F7C8
_080DEB38: .4byte gUnknown_0202F7C9
_080DEB3C:
	ldr r4, _080DEC04
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r2, 0xE0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	ldr r4, _080DEC08
_080DEB60:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0xE0
	lsls r1, 13
	adds r0, r1
	lsrs r0, 16
	mov r9, r0
	mov r8, r5
	mov r2, r9
	subs r4, r2, r5
	lsls r4, 16
	lsrs r4, 16
	lsls r0, r6, 4
	strh r0, [r7, 0x2E]
	lsls r0, r5, 4
	strh r0, [r7, 0x30]
	mov r1, r10
	subs r0, r1, r6
	lsls r0, 4
	ldr r5, _080DEC0C
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl __divsi3
	strh r0, [r7, 0x32]
	lsls r4, 16
	asrs r4, 12
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r7, 0x34]
	ldrh r0, [r5, 0x2]
	strh r0, [r7, 0x36]
	mov r1, r10
	strh r1, [r7, 0x38]
	mov r2, r9
	strh r2, [r7, 0x3A]
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r7, 0x3C]
	ldrb r1, [r7, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r7, 0x5]
	strh r6, [r7, 0x20]
	mov r2, r8
	strh r2, [r7, 0x22]
	ldr r0, _080DEC10
	str r0, [r7, 0x1C]
	adds r2, r7, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DEC04: .4byte gUnknown_0202F7C9
_080DEC08: .4byte gUnknown_0202F7C8
_080DEC0C: .4byte gUnknown_03004B00
_080DEC10: .4byte sub_80DE8D8
	thumb_func_end sub_80DE7B8

	thumb_func_start sub_80DE8D8
sub_80DE8D8: @ 80DEC14
	push {r4,lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x36]
	movs r1, 0x36
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080DEC4C
	ldrh r0, [r2, 0x32]
	ldrh r4, [r2, 0x2E]
	adds r0, r4
	strh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x34]
	ldrh r4, [r2, 0x30]
	adds r1, r4
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 20
	strh r0, [r2, 0x20]
	lsls r1, 16
	asrs r1, 20
	strh r1, [r2, 0x22]
	subs r0, r3, 0x1
	strh r0, [r2, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080DEC4C
	strh r0, [r2, 0x2E]
_080DEC4C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DE8D8

	thumb_func_start sub_80DE918
sub_80DE918: @ 80DEC54
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DEDA4
	adds r1, r0
	str r1, [sp]
	ldr r1, _080DEDA8
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	movs r0, 0
	ldr r1, [sp]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	strh r0, [r1, 0x16]
	strh r0, [r1, 0x18]
	movs r0, 0x10
	strh r0, [r1, 0x1A]
	ldr r2, _080DEDAC
	ldrh r0, [r2]
	strh r0, [r1, 0x1C]
	ldr r4, _080DEDB0
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_807A100
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DECC4
	b _080DEDC4
_080DECC4:
	movs r4, 0
_080DECC6:
	lsls r1, r4, 16
	asrs r3, r1, 16
	ldr r0, _080DEDB0
	ldrb r2, [r0]
	str r1, [sp, 0x10]
	cmp r3, r2
	beq _080DED92
	movs r0, 0x2
	eors r2, r0
	cmp r3, r2
	beq _080DED92
	lsls r0, r4, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080DED92
	ldr r6, [sp, 0x4]
	ldr r3, [sp, 0x8]
	lsls r0, r3, 16
	asrs r7, r0, 16
	ldr r0, _080DEDB4
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080DED92
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_807A100
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r0, r8
	lsls r5, r0, 4
	add r5, r8
	lsls r5, 2
	ldr r1, _080DEDB8
	adds r4, r5, r1
	lsls r0, r6, 4
	strh r0, [r4, 0x2E]
	lsls r0, r7, 4
	strh r0, [r4, 0x30]
	mov r2, r10
	subs r0, r2, r6
	lsls r0, 4
	ldr r3, _080DEDAC
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	lsls r0, r3, 16
	asrs r0, 16
	subs r0, r7
	lsls r0, 4
	ldr r2, _080DEDAC
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080DEDAC
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	ldr r0, _080DEDBC
	adds r5, r0
	ldr r0, _080DEDC0
	str r0, [r5]
	ldr r2, [sp]
	movs r3, 0x20
	ldrsh r1, [r2, r3]
	adds r1, 0xD
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x8
	adds r0, r1
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
_080DED92:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _080DECC6
	b _080DEE48
	.align 2, 0
_080DEDA4: .4byte gTasks
_080DEDA8: .4byte 0x04000050
_080DEDAC: .4byte gUnknown_03004B00
_080DEDB0: .4byte gUnknown_0202F7C8
_080DEDB4: .4byte gSpriteTemplate_83DAF08
_080DEDB8: .4byte gSprites
_080DEDBC: .4byte 0x02020020
_080DEDC0: .4byte sub_80DE8D8
_080DEDC4:
	ldr r0, _080DEE60
	ldr r7, [sp, 0x4]
	ldr r2, [sp, 0x8]
	lsls r1, r2, 16
	asrs r1, 16
	str r1, [sp, 0xC]
	adds r1, r7, 0
	ldr r2, [sp, 0xC]
	movs r3, 0x37
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x40
	beq _080DEE48
	movs r3, 0x30
	mov r10, r3
	movs r0, 0x28
	mov r9, r0
	ldr r6, _080DEE64
	mov r1, r8
	lsls r5, r1, 4
	add r5, r8
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, r7, 4
	strh r0, [r4, 0x2E]
	ldr r2, [sp, 0xC]
	lsls r0, r2, 4
	strh r0, [r4, 0x30]
	subs r0, r3, r7
	lsls r0, 4
	ldr r3, _080DEE68
	movs r2, 0x2
	ldrsh r1, [r3, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	mov r3, r9
	ldr r1, [sp, 0xC]
	subs r0, r3, r1
	lsls r0, 4
	ldr r2, _080DEE68
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	bl __divsi3
	strh r0, [r4, 0x34]
	ldr r1, _080DEE68
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x36]
	mov r2, r10
	strh r2, [r4, 0x38]
	mov r3, r9
	strh r3, [r4, 0x3A]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _080DEE6C
	str r0, [r5]
	mov r1, r8
	ldr r0, [sp]
	strh r1, [r0, 0x22]
	movs r0, 0x1
	ldr r2, [sp]
	strh r0, [r2, 0x20]
_080DEE48:
	ldr r0, _080DEE70
	ldr r3, [sp]
	str r0, [r3]
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DEE60: .4byte gSpriteTemplate_83DAF08
_080DEE64: .4byte gSprites
_080DEE68: .4byte gUnknown_03004B00
_080DEE6C: .4byte sub_80DE8D8
_080DEE70: .4byte sub_80DEB38
	thumb_func_end sub_80DE918

	thumb_func_start sub_80DEB38
sub_80DEB38: @ 80DEE74
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080DEE98
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080DEF2A
	cmp r1, 0x1
	bgt _080DEE9C
	cmp r1, 0
	beq _080DEEAA
	b _080DEFE0
	.align 2, 0
_080DEE98: .4byte gTasks
_080DEE9C:
	cmp r1, 0x2
	bne _080DEEA2
	b _080DEFBC
_080DEEA2:
	cmp r1, 0x3
	bne _080DEEA8
	b _080DEFD0
_080DEEA8:
	b _080DEFE0
_080DEEAA:
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DEF0A
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DEF0A
	strh r1, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DEEE0
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DEEEE
	adds r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080DEEEE
_080DEEE0:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DEEEE
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080DEEEE:
	ldr r2, _080DEF1C
	ldrh r0, [r4, 0x1A]
	lsls r0, 8
	ldrh r1, [r4, 0x18]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	cmp r0, 0x17
	ble _080DEF0A
	movs r0, 0
	strh r0, [r4, 0x16]
	movs r0, 0x1
	strh r0, [r4, 0x14]
_080DEF0A:
	ldrh r1, [r4, 0x1C]
	movs r2, 0x1C
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DEF20
	subs r0, r1, 0x1
	strh r0, [r4, 0x1C]
	b _080DEFE0
	.align 2, 0
_080DEF1C: .4byte 0x04000052
_080DEF20:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080DEFE0
	b _080DEFC8
_080DEF2A:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DEFE0
	movs r0, 0
	strh r0, [r4, 0x12]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	ands r0, r1
	lsls r0, 16
	cmp r0, 0
	beq _080DEF5A
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080DEF68
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	b _080DEF68
_080DEF5A:
	ldrh r1, [r4, 0x1A]
	movs r2, 0x1A
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DEF68
	adds r0, r1, 0x1
	strh r0, [r4, 0x1A]
_080DEF68:
	ldr r2, _080DEF84
	ldrh r0, [r4, 0x1A]
	lsls r0, 8
	ldrh r1, [r4, 0x18]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, [r4, 0x18]
	movs r0, 0x80
	lsls r0, 13
	cmp r1, r0
	bne _080DEFE0
	movs r5, 0
	b _080DEFAC
	.align 2, 0
_080DEF84: .4byte 0x04000052
_080DEF88:
	adds r1, r5, 0
	adds r1, 0xD
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x8
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080DEFB8
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_080DEFAC:
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r5, r0
	blt _080DEF88
	b _080DEFC8
	.align 2, 0
_080DEFB8: .4byte gSprites
_080DEFBC:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	cmp r0, 0
	ble _080DEFE0
_080DEFC8:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DEFE0
_080DEFD0:
	ldr r0, _080DEFE8
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	bl move_anim_task_del
_080DEFE0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DEFE8: .4byte 0x04000050
	thumb_func_end sub_80DEB38

	thumb_func_start sub_80DECB0
sub_80DECB0: @ 80DEFEC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080DF034
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080DF038
	strh r1, [r0]
	ldr r1, _080DF03C
	ldr r2, _080DF040
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	subs r2, 0x20
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xC8
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0x10
	strh r0, [r1]
	ldr r0, _080DF044
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DF030
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080DF048
_080DF030:
	movs r6, 0x28
	b _080DF04A
	.align 2, 0
_080DF034: .4byte gUnknown_030042C4
_080DF038: .4byte gUnknown_03004240
_080DF03C: .4byte 0x04000048
_080DF040: .4byte 0x00003f3f
_080DF044: .4byte gUnknown_0202F7C8
_080DF048:
	movs r6, 0xC8
_080DF04A:
	ldr r1, _080DF088
	lsls r3, r6, 16
	asrs r2, r3, 16
	lsls r0, r2, 8
	orrs r0, r2
	strh r0, [r1]
	ldr r1, _080DF08C
	movs r5, 0x28
	ldr r0, _080DF090
	strh r0, [r1]
	lsrs r3, 16
	movs r1, 0xF0
	subs r1, r2
	movs r4, 0x48
	ldr r2, _080DF094
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r2
	strh r3, [r0, 0xA]
	strh r1, [r0, 0xC]
	strh r5, [r0, 0xE]
	strh r4, [r0, 0x10]
	strh r6, [r0, 0x12]
	strh r5, [r0, 0x14]
	ldr r1, _080DF098
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF088: .4byte gUnknown_030042C4
_080DF08C: .4byte gUnknown_03004240
_080DF090: .4byte 0x00002828
_080DF094: .4byte gTasks
_080DF098: .4byte sub_80DED60
	thumb_func_end sub_80DECB0

	thumb_func_start sub_80DED60
sub_80DED60: @ 80DF09C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080DF1BC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0x8]
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
	ldrh r5, [r4, 0xA]
	ldrh r7, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	mov r10, r0
	ldrh r2, [r4, 0x10]
	str r2, [sp, 0xC]
	ldrh r0, [r4, 0x12]
	ldrh r2, [r4, 0x14]
	mov r8, r2
	lsls r1, 16
	asrs r6, r1, 16
	cmp r6, 0xF
	ble _080DF0D8
	b _080DF1C8
_080DF0D8:
	lsls r0, 16
	asrs r0, 16
	bl __floatsidf
	str r0, [sp, 0x10]
	str r1, [sp, 0x14]
	lsls r0, r5, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DF1C0
	ldr r3, _080DF1C4
	bl __muldf3
	adds r5, r1, 0
	adds r4, r0, 0
	adds r0, r6, 0
	bl __floatsidf
	str r0, [sp, 0x18]
	str r1, [sp, 0x1C]
	adds r1, r5, 0
	adds r0, r4, 0
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	lsls r0, r7, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DF1C0
	ldr r3, _080DF1C4
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	ldr r0, [sp, 0x10]
	ldr r1, [sp, 0x14]
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r7, r0, 16
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	adds r5, r1, 0
	adds r4, r0, 0
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DF1C0
	ldr r3, _080DF1C4
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __subdf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r6, r0, 16
	ldr r1, [sp, 0xC]
	lsls r0, r1, 16
	asrs r0, 16
	bl __floatsidf
	ldr r2, _080DF1C0
	ldr r3, _080DF1C4
	bl __muldf3
	ldr r2, [sp, 0x18]
	ldr r3, [sp, 0x1C]
	bl __muldf3
	adds r3, r1, 0
	adds r2, r0, 0
	adds r1, r5, 0
	adds r0, r4, 0
	bl __adddf3
	bl __fixunsdfsi
	lsls r0, 16
	lsrs r5, r0, 16
	b _080DF1F6
	.align 2, 0
_080DF1BC: .4byte gTasks
_080DF1C0: .4byte 0x3fb00000
_080DF1C4: .4byte 0x00000000
_080DF1C8:
	movs r2, 0
	mov r9, r2
	movs r7, 0xF0
	movs r6, 0
	movs r5, 0x70
	str r6, [sp]
	str r6, [sp, 0x4]
	str r6, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_80791A8
	lsls r0, 16
	lsrs r0, 16
	str r6, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080DF218
	str r0, [r4]
_080DF1F6:
	ldr r1, _080DF21C
	mov r2, r9
	lsls r0, r2, 8
	orrs r7, r0
	strh r7, [r1]
	ldr r1, _080DF220
	lsls r0, r6, 8
	orrs r5, r0
	strh r5, [r1]
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF218: .4byte sub_80DEEE8
_080DF21C: .4byte gUnknown_030042C4
_080DF220: .4byte gUnknown_03004240
	thumb_func_end sub_80DED60

	thumb_func_start sub_80DEEE8
sub_80DEEE8: @ 80DF224
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r0, _080DF264
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080DF25C
	ldr r0, _080DF268
	strh r2, [r0]
	ldr r0, _080DF26C
	strh r2, [r0]
	ldr r0, _080DF270
	ldr r4, _080DF274
	adds r1, r4, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r2, [r0]
	adds r0, 0x4
	strh r2, [r0]
	adds r0, r3, 0
	bl move_anim_task_del
_080DF25C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF264: .4byte gPaletteFade
_080DF268: .4byte gUnknown_030042C4
_080DF26C: .4byte gUnknown_03004240
_080DF270: .4byte 0x04000048
_080DF274: .4byte 0x00003f3f
	thumb_func_end sub_80DEEE8

	thumb_func_start sub_80DEF3C
sub_80DEF3C: @ 80DF278
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080DF2A4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080DF2AC
	movs r2, 0x18
	ldr r3, _080DF2A8
	ldrb r0, [r4, 0x3]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r0
	movs r0, 0x10
	orrs r1, r0
	strb r1, [r4, 0x3]
	b _080DF2B0
	.align 2, 0
_080DF2A4: .4byte gUnknown_0202F7C8
_080DF2A8: .4byte 0x0000fffe
_080DF2AC:
	ldr r2, _080DF2CC
	movs r3, 0x2
_080DF2B0:
	lsls r0, r2, 16
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	strh r3, [r4, 0x30]
	movs r0, 0x3C
	strh r0, [r4, 0x2E]
	ldr r0, _080DF2D0
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF2CC: .4byte 0x0000ffe8
_080DF2D0: .4byte sub_80DEF98
	thumb_func_end sub_80DEF3C

	thumb_func_start sub_80DEF98
sub_80DEF98: @ 80DF2D4
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080DF2E6
	subs r0, r1, 0x1
	b _080DF34A
_080DF2E6:
	ldrh r0, [r3, 0x30]
	ldrh r4, [r3, 0x24]
	adds r1, r0, r4
	strh r1, [r3, 0x24]
	adds r0, r1, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xE
	bls _080DF34C
	ldrh r0, [r3, 0x20]
	adds r0, r1
	strh r0, [r3, 0x20]
	movs r0, 0
	strh r0, [r3, 0x24]
	ldrh r2, [r3, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x8
	ldr r4, _080DF338
	adds r0, r4, 0
	ands r1, r0
	ldr r0, _080DF33C
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, 0x4]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DF348
	movs r0, 0x1E
	strh r0, [r3, 0x2E]
	ldr r0, _080DF340
	str r0, [r3, 0x1C]
	ldr r1, _080DF344
	adds r0, r3, 0
	bl oamt_set_x3A_32
	b _080DF34C
	.align 2, 0
_080DF338: .4byte 0x000003ff
_080DF33C: .4byte 0xfffffc00
_080DF340: .4byte sub_80782D8
_080DF344: .4byte sub_80DF018
_080DF348:
	movs r0, 0x28
_080DF34A:
	strh r0, [r3, 0x2E]
_080DF34C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DEF98

	thumb_func_start sub_80DF018
sub_80DF018: @ 80DF354
	push {r4,lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	cmp r2, 0
	bne _080DF380
	ldr r1, _080DF37C
	movs r4, 0xFD
	lsls r4, 6
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x10
	strh r0, [r1]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	strh r2, [r3, 0x30]
	strh r2, [r3, 0x32]
	b _080DF3BE
	.align 2, 0
_080DF37C: .4byte 0x04000050
_080DF380:
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0x1
	bgt _080DF390
	adds r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _080DF3BE
_080DF390:
	movs r0, 0
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	ldr r2, _080DF3C4
	movs r1, 0x10
	subs r1, r0
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r4, 0x32
	ldrsh r0, [r3, r4]
	cmp r0, 0x10
	bne _080DF3BE
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DF3C8
	str r0, [r3, 0x1C]
_080DF3BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF3C4: .4byte 0x04000052
_080DF3C8: .4byte sub_80DF090
	thumb_func_end sub_80DF018

	thumb_func_start sub_80DF090
sub_80DF090: @ 80DF3CC
	push {lr}
	ldr r1, _080DF3E8
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	ldr r1, _080DF3EC
	strh r2, [r1]
	ldr r1, _080DF3F0
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_080DF3E8: .4byte 0x04000050
_080DF3EC: .4byte gUnknown_030042C4
_080DF3F0: .4byte gUnknown_03004240
	thumb_func_end sub_80DF090

	thumb_func_start sub_80DF0B8
sub_80DF0B8: @ 80DF3F4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0xC
	bl Sin
	strh r0, [r4, 0x24]
	ldr r0, _080DF45C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DF418
	ldrh r0, [r4, 0x24]
	negs r0, r0
	strh r0, [r4, 0x24]
_080DF418:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080DF468
	ldr r0, _080DF460
	strh r0, [r4, 0x3A]
	ldr r1, _080DF464
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r4, 0x3A]
	strh r0, [r1]
	b _080DF4BA
	.align 2, 0
_080DF45C: .4byte gUnknown_0202F7C8
_080DF460: .4byte 0x0000050b
_080DF464: .4byte 0x04000050
_080DF468:
	cmp r0, 0x1E
	ble _080DF4BA
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x3A]
	lsls r0, r1, 16
	asrs r0, 24
	lsls r0, 16
	movs r2, 0xFF
	ands r2, r1
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r3, r0, 16
	cmp r3, 0x10
	bls _080DF48C
	movs r3, 0x10
_080DF48C:
	subs r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bge _080DF498
	movs r2, 0
_080DF498:
	ldr r1, _080DF4C0
	lsls r0, r3, 8
	orrs r0, r2
	strh r0, [r1]
	strh r0, [r4, 0x3A]
	cmp r3, 0x10
	bne _080DF4BA
	cmp r2, 0
	bne _080DF4BA
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080DF4C4
	str r0, [r4, 0x1C]
_080DF4BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF4C0: .4byte 0x04000052
_080DF4C4: .4byte sub_80DF18C
	thumb_func_end sub_80DF0B8

	thumb_func_start sub_80DF18C
sub_80DF18C: @ 80DF4C8
	push {lr}
	ldr r1, _080DF4DC
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_080DF4DC: .4byte 0x04000050
	thumb_func_end sub_80DF18C

	thumb_func_start sub_80DF1A4
sub_80DF1A4: @ 80DF4E0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080DF578
	adds r4, r0
	movs r6, 0
	strh r6, [r4, 0x8]
	movs r0, 0x10
	mov r8, r0
	mov r2, r8
	strh r2, [r4, 0xA]
	ldr r5, _080DF57C
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	ldrb r0, [r5]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldrb r0, [r5]
	movs r1, 0x1
	bl sub_807A100
	lsls r0, 16
	asrs r1, r0, 16
	lsrs r0, 31
	adds r1, r0
	asrs r1, 1
	adds r1, 0x8
	strh r1, [r4, 0x1E]
	strh r6, [r4, 0x16]
	ldrb r0, [r5]
	bl sub_8079ED4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x12]
	ldrb r0, [r5]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	subs r0, 0x2
	strh r0, [r4, 0x14]
	strh r6, [r4, 0xE]
	mov r0, r8
	strh r0, [r4, 0x10]
	ldr r1, _080DF580
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	strh r6, [r4, 0x18]
	ldr r0, _080DF584
	str r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DF578: .4byte gTasks
_080DF57C: .4byte gUnknown_0202F7C8
_080DF580: .4byte 0x04000050
_080DF584: .4byte sub_80DF24C
	thumb_func_end sub_80DF1A4

	thumb_func_start sub_80DF24C
sub_80DF24C: @ 80DF588
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	ldr r1, _080DF5AC
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bls _080DF5A2
	b _080DF708
_080DF5A2:
	lsls r0, 2
	ldr r1, _080DF5B0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DF5AC: .4byte gTasks
_080DF5B0: .4byte _080DF5B4
	.align 2, 0
_080DF5B4:
	.4byte _080DF5CC
	.4byte _080DF63C
	.4byte _080DF67E
	.4byte _080DF692
	.4byte _080DF6E8
	.4byte _080DF6F8
_080DF5CC:
	movs r6, 0
_080DF5CE:
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r0, 0x1C
	ldrsh r2, [r4, r0]
	ldrb r3, [r4, 0x14]
	ldr r0, _080DF630
	bl CreateSprite
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x40
	beq _080DF622
	ldr r1, _080DF634
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r5, r0, r1
	strh r7, [r5, 0x2E]
	ldr r0, _080DF638
	ldrb r0, [r0]
	bl battle_side_get_owner
	movs r1, 0
	lsls r0, 24
	cmp r0, 0
	bne _080DF604
	movs r1, 0x1
_080DF604:
	strh r1, [r5, 0x30]
	movs r0, 0x2A
	muls r0, r6
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x1E]
	strh r0, [r5, 0x34]
	lsls r0, r6, 1
	adds r0, r6
	lsls r0, 1
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
_080DF622:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080DF5CE
	b _080DF6F0
	.align 2, 0
_080DF630: .4byte gSpriteTemplate_83DAF80
_080DF634: .4byte gSprites
_080DF638: .4byte gUnknown_0202F7C8
_080DF63C:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DF65A
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0xD
	bgt _080DF668
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080DF668
_080DF65A:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0x4
	ble _080DF668
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
_080DF668:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	cmp r0, 0xE
	bne _080DF6D8
	cmp r2, 0x4
	bne _080DF6D8
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080DF6D2
_080DF67E:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	ble _080DF708
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080DF6F0
_080DF692:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080DF6B0
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080DF6BE
	subs r0, r1, 0x1
	strh r0, [r4, 0xE]
	b _080DF6BE
_080DF6B0:
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DF6BE
	adds r0, r1, 0x1
	strh r0, [r4, 0x10]
_080DF6BE:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	ldrh r3, [r4, 0xE]
	ldrh r2, [r4, 0x10]
	cmp r0, 0
	bne _080DF6D8
	cmp r2, 0x10
	bne _080DF6D8
	movs r0, 0x1
	strh r0, [r4, 0x18]
_080DF6D2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080DF6D8:
	ldr r1, _080DF6E4
	lsls r0, r2, 8
	orrs r0, r3
	strh r0, [r1]
	b _080DF708
	.align 2, 0
_080DF6E4: .4byte 0x04000052
_080DF6E8:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080DF708
_080DF6F0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080DF708
_080DF6F8:
	ldr r0, _080DF710
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r7, 0
	bl move_anim_task_del
_080DF708:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DF710: .4byte 0x04000050
	thumb_func_end sub_80DF24C

	thumb_func_start sub_80DF3D8
sub_80DF3D8: @ 80DF714
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080DF726
	ldrh r0, [r4, 0x32]
	adds r0, 0x2
	b _080DF72A
_080DF726:
	ldrh r0, [r4, 0x32]
	subs r0, 0x2
_080DF72A:
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x32]
	movs r0, 0xFF
	ands r0, r1
	strh r0, [r4, 0x32]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x32]
	subs r0, 0x41
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x7E
	bhi _080DF76C
	ldr r2, _080DF768
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	b _080DF780
	.align 2, 0
_080DF768: .4byte gTasks
_080DF76C:
	ldr r2, _080DF7D4
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x3
	ldrb r1, [r0, 0x12]
	ands r1, r2
_080DF780:
	lsls r1, 2
	ldrb r2, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r0, 3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r1, 0x7
	bl Sin
	strh r0, [r4, 0x26]
	ldr r2, _080DF7D4
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x18
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080DF7CE
	ldrh r0, [r1, 0x16]
	subs r0, 0x1
	strh r0, [r1, 0x16]
	adds r0, r4, 0
	bl DestroySprite
_080DF7CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DF7D4: .4byte gTasks
	thumb_func_end sub_80DF3D8

	thumb_func_start sub_80DF49C
sub_80DF49C: @ 80DF7D8
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	ldr r2, _080DF81C
	ldr r1, _080DF820
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	strh r1, [r0, 0x38]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0xA
	strh r1, [r0, 0x30]
	ldr r2, _080DF824
	ldrh r1, [r2]
	strh r1, [r0, 0x32]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0x34]
	ldr r1, _080DF828
	str r1, [r0, 0x1C]
	ldr r2, _080DF82C
	movs r3, 0x38
	ldrsh r1, [r0, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080DF81C: .4byte gUnknown_02024BE0
_080DF820: .4byte gUnknown_0202F7C8
_080DF824: .4byte gUnknown_03004B00
_080DF828: .4byte sub_80DF4F4
_080DF82C: .4byte gSprites
	thumb_func_end sub_80DF49C

	thumb_func_start sub_80DF4F4
sub_80DF4F4: @ 80DF830
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x34]
	movs r1, 0x34
	ldrsh r3, [r5, r1]
	cmp r3, 0
	beq _080DF898
	subs r0, 0x1
	strh r0, [r5, 0x34]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Sin
	ldr r4, _080DF890
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r2, 0x30
	ldrsh r1, [r5, r2]
	bl Cos
	movs r1, 0x38
	ldrsh r2, [r5, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x26]
	ldrh r0, [r5, 0x32]
	ldrh r2, [r5, 0x2E]
	adds r1, r0, r2
	strh r1, [r5, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080DF8CC
	ldr r2, _080DF894
	adds r0, r1, r2
	strh r0, [r5, 0x2E]
	b _080DF8CC
	.align 2, 0
_080DF890: .4byte gSprites
_080DF894: .4byte 0xffffff00
_080DF898:
	ldr r2, _080DF8D4
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x24]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
	movs r0, 0x38
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x22]
	subs r1, 0x8
	strh r1, [r0, 0x22]
	ldr r0, _080DF8D8
	str r0, [r5, 0x1C]
_080DF8CC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF8D4: .4byte gSprites
_080DF8D8: .4byte move_anim_8074EE0
	thumb_func_end sub_80DF4F4

	thumb_func_start sub_80DF5A0
sub_80DF5A0: @ 80DF8DC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080DF924
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DF92C
	ldr r2, _080DF928
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r2, 0x6]
	negs r0, r0
	strh r0, [r2, 0x6]
	ldrh r0, [r2, 0x8]
	negs r0, r0
	strh r0, [r2, 0x8]
	adds r1, r2, 0
	b _080DF936
	.align 2, 0
_080DF924: .4byte gUnknown_0202F7C8
_080DF928: .4byte gUnknown_03004B00
_080DF92C:
	ldr r1, _080DF96C
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
_080DF936:
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	strh r0, [r5, 0x2E]
	ldrh r0, [r1, 0x6]
	strh r0, [r5, 0x30]
	ldrh r0, [r1, 0x8]
	strh r0, [r5, 0x34]
	ldrh r0, [r1, 0xA]
	strh r0, [r5, 0x38]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080DF970
	adds r0, r5, 0
	bl oamt_set_x3A_32
	ldr r0, _080DF974
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DF96C: .4byte gUnknown_03004B00
_080DF970: .4byte move_anim_8074EE0
_080DF974: .4byte sub_8078504
	thumb_func_end sub_80DF5A0

	thumb_func_start sub_80DF63C
sub_80DF63C: @ 80DF978
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8078650
	ldr r4, _080DF9D0
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	ldr r0, _080DF9D4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DF9DC
	ldr r2, _080DF9D8
	ldrh r0, [r5, 0x20]
	ldrh r1, [r2, 0x2]
	subs r0, r1
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x22]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldrh r0, [r5, 0x32]
	ldrh r1, [r2, 0x4]
	subs r0, r1
	strh r0, [r5, 0x32]
	ldrh r0, [r2, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	b _080DFA06
	.align 2, 0
_080DF9D0: .4byte gUnknown_0202F7C9
_080DF9D4: .4byte gUnknown_0202F7C8
_080DF9D8: .4byte gUnknown_03004B00
_080DF9DC:
	ldr r1, _080DFA20
	ldrh r0, [r1]
	ldrh r2, [r5, 0x20]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	ldrh r0, [r1, 0x4]
	ldrh r2, [r5, 0x32]
	adds r0, r2
	strh r0, [r5, 0x32]
	ldrh r0, [r1, 0x6]
	ldrh r1, [r5, 0x36]
	adds r0, r1
	strh r0, [r5, 0x36]
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080DFA06:
	ldr r0, _080DFA20
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080DFA24
	str r0, [r5, 0x1C]
	ldr r1, _080DFA28
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DFA20: .4byte gUnknown_03004B00
_080DFA24: .4byte sub_8078B34
_080DFA28: .4byte move_anim_8074EE0
	thumb_func_end sub_80DF63C

	thumb_func_start sub_80DF6F0
sub_80DF6F0: @ 80DFA2C
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080DFA40
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080DFA48
	ldr r4, _080DFA44
	b _080DFA4A
	.align 2, 0
_080DFA40: .4byte gUnknown_03004B00
_080DFA44: .4byte gUnknown_0202F7C8
_080DFA48:
	ldr r4, _080DFA8C
_080DFA4A:
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _080DFA90
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	adds r0, r5, 0
	bl sub_807867C
	ldrh r0, [r4, 0x4]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldr r0, _080DFA94
	str r0, [r5, 0x1C]
	ldr r1, _080DFA98
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080DFA8C: .4byte gUnknown_0202F7C9
_080DFA90: .4byte gUnknown_03004B00
_080DFA94: .4byte sub_8078600
_080DFA98: .4byte move_anim_8074EE0
	thumb_func_end sub_80DF6F0

	thumb_func_start sub_80DF760
sub_80DF760: @ 80DFA9C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080DFAC4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080DFAB6
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
_080DFAB6:
	adds r0, r4, 0
	bl sub_80DF63C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DFAC4: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80DF760

	thumb_func_start sub_80DF78C
sub_80DF78C: @ 80DFAC8
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r4, _080DFB1C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	strh r0, [r6, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6, 0x22]
	strh r5, [r6, 0x36]
	movs r0, 0x1
	strh r0, [r6, 0x38]
	ldr r0, _080DFB20
	ldrh r0, [r0]
	strh r0, [r6, 0x3A]
	ldr r4, _080DFB24
	ldrb r0, [r4]
	movs r1, 0
	bl sub_807A100
	lsls r7, r0, 16
	lsrs r5, r7, 16
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_807A100
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r5, r0
	bls _080DFB28
	lsrs r0, r7, 17
	b _080DFB2A
	.align 2, 0
_080DFB1C: .4byte gUnknown_0202F7C8
_080DFB20: .4byte gUnknown_03004B00
_080DFB24: .4byte gUnknown_02024C07
_080DFB28:
	lsrs r0, r1, 17
_080DFB2A:
	strh r0, [r6, 0x3C]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x3C
	ldrsh r1, [r6, r2]
	bl Cos
	strh r0, [r6, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r6, r1]
	movs r2, 0x3C
	ldrsh r1, [r6, r2]
	bl Sin
	strh r0, [r6, 0x26]
	ldr r0, _080DFB54
	str r0, [r6, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DFB54: .4byte sub_80DF81C
	thumb_func_end sub_80DF78C

	thumb_func_start sub_80DF81C
sub_80DF81C: @ 80DFB58
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080DFB6A
	cmp r5, 0x1
	beq _080DFBD6
	b _080DFC5A
_080DFB6A:
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080DFBBC
	strh r5, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DFBBC
	adds r0, r1, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080DFBBC
	movs r0, 0x10
	strh r0, [r4, 0x38]
_080DFBBC:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080DFC5A
	movs r0, 0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080DFC5A
_080DFBD6:
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x38]
	subs r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	cmp r0, 0x95
	bgt _080DFBFE
	adds r0, r1, 0
	adds r0, 0x8
	strh r0, [r4, 0x3C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x95
	ble _080DFBFE
	movs r0, 0x96
	strh r0, [r4, 0x3C]
_080DFBFE:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	movs r2, 0x3C
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080DFC46
	movs r0, 0
	strh r0, [r4, 0x36]
	ldrh r1, [r4, 0x38]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	bgt _080DFC46
	adds r0, r1, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _080DFC46
	movs r0, 0x10
	strh r0, [r4, 0x38]
_080DFC46:
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080DFC5A
	adds r0, r4, 0
	bl move_anim_8072740
_080DFC5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DF81C

	thumb_func_start sub_80DF924
sub_80DF924: @ 80DFC60
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080DFC8C
	adds r4, r1, r0
	ldr r0, _080DFC90
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DFC9C
	ldr r0, _080DFC94
	str r0, [sp]
	ldr r0, _080DFC98
	b _080DFCA2
	.align 2, 0
_080DFC8C: .4byte gTasks
_080DFC90: .4byte gUnknown_0202F7C8
_080DFC94: .4byte 0x04000014
_080DFC98: .4byte gUnknown_030042C0
_080DFC9C:
	ldr r0, _080DFD18
	str r0, [sp]
	ldr r0, _080DFD1C
_080DFCA2:
	ldrh r0, [r0]
	strh r0, [r4, 0xC]
	ldr r0, _080DFD20
	str r0, [sp, 0x4]
	mov r1, sp
	movs r5, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r5, [r0, 0x9]
	ldr r0, _080DFD24
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0xE]
	adds r0, 0x20
	strh r0, [r4, 0x10]
	cmp r1, 0
	bge _080DFCD2
	strh r5, [r4, 0xE]
_080DFCD2:
	ldrh r3, [r4, 0xE]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bgt _080DFD00
	ldr r5, _080DFD28
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080DFCE4:
	lsls r1, r3, 1
	adds r2, r1, r5
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r4, 0xC]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r3, r0
	ble _080DFCE4
_080DFD00:
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r0, _080DFD2C
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DFD18: .4byte 0x04000018
_080DFD1C: .4byte gUnknown_03004288
_080DFD20: .4byte 0xa2600001
_080DFD24: .4byte gUnknown_0202F7C8
_080DFD28: .4byte gUnknown_03004DE0
_080DFD2C: .4byte sub_80DF9F4
	thumb_func_end sub_80DF924

	thumb_func_start sub_80DF9F4
sub_80DF9F4: @ 80DFD30
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080DFD54
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x4
	bhi _080DFDE6
	lsls r0, 2
	ldr r1, _080DFD58
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080DFD54: .4byte gTasks
_080DFD58: .4byte _080DFD5C
	.align 2, 0
_080DFD5C:
	.4byte _080DFD70
	.4byte _080DFD92
	.4byte _080DFDA2
	.4byte _080DFDCE
	.4byte _080DFDE0
_080DFD70:
	ldrh r0, [r2, 0x16]
	adds r0, 0x1
	strh r0, [r2, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DFDC6
	movs r0, 0
	strh r0, [r2, 0x16]
	ldrh r0, [r2, 0x14]
	adds r0, 0x1
	strh r0, [r2, 0x14]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _080DFDC6
	b _080DFDC0
_080DFD92:
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080DFDC6
	b _080DFDC0
_080DFDA2:
	ldrh r0, [r2, 0x16]
	adds r0, 0x1
	strh r0, [r2, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080DFDC6
	movs r0, 0
	strh r0, [r2, 0x16]
	ldrh r0, [r2, 0x14]
	subs r0, 0x1
	strh r0, [r2, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _080DFDC6
_080DFDC0:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_080DFDC6:
	adds r0, r2, 0
	bl sub_80DFAB0
	b _080DFDE6
_080DFDCE:
	ldr r1, _080DFDDC
	movs r0, 0x3
	strb r0, [r1, 0x15]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080DFDE6
	.align 2, 0
_080DFDDC: .4byte gUnknown_03004DC0
_080DFDE0:
	adds r0, r3, 0
	bl move_anim_task_del
_080DFDE6:
	pop {r0}
	bx r0
	thumb_func_end sub_80DF9F4

	thumb_func_start sub_80DFAB0
sub_80DFAB0: @ 80DFDEC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	ldrh r3, [r5, 0x12]
	ldrh r4, [r5, 0xE]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r4, r0
	bgt _080DFE42
	ldr r7, _080DFE58
	mov r12, r7
	ldr r0, _080DFE5C
	mov r8, r0
	ldr r6, _080DFE60
_080DFE0A:
	lsls r2, r4, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	lsls r0, r3, 1
	add r0, r8
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r7, 0x14
	ldrsh r0, [r5, r7]
	muls r0, r1
	asrs r0, 7
	ldrh r1, [r5, 0xC]
	adds r0, r1
	strh r0, [r2]
	adds r3, 0x8
	movs r0, 0xFF
	ands r3, r0
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	movs r7, 0x10
	ldrsh r0, [r5, r7]
	cmp r4, r0
	ble _080DFE0A
_080DFE42:
	ldrh r0, [r5, 0x12]
	adds r0, 0x9
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x12]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080DFE58: .4byte gUnknown_03004DE0
_080DFE5C: .4byte gSineTable
_080DFE60: .4byte gUnknown_03004DC0
	thumb_func_end sub_80DFAB0

	thumb_func_start sub_80DFB28
sub_80DFB28: @ 80DFE64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	ldr r5, _080DFF04
	movs r0, 0x4
	ldrsh r1, [r5, r0]
	lsls r0, r1, 1
	adds r0, r1
	movs r1, 0x5
	bl __divsi3
	adds r6, r0, 0
	ldr r1, _080DFF08
	mov r8, r1
	ldrb r0, [r1]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	mov r2, r8
	ldrb r0, [r2]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r5, 0x8]
	adds r0, r3
	strh r0, [r4, 0x22]
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	movs r2, 0x4
	ldrsh r1, [r5, r2]
	bl Cos
	strh r0, [r4, 0x30]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	lsls r6, 16
	asrs r6, 16
	adds r1, r6, 0
	bl Sin
	strh r0, [r4, 0x32]
	ldrh r1, [r4, 0x30]
	ldrh r2, [r5]
	adds r3, r2, 0
	muls r3, r1
	adds r1, r3, 0
	ldrh r3, [r4, 0x20]
	adds r1, r3
	strh r1, [r4, 0x20]
	adds r1, r2, 0
	muls r1, r0
	adds r0, r1, 0
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x34]
	ldr r0, _080DFF0C
	str r0, [r4, 0x1C]
	adds r4, 0x2E
	ldr r2, _080DFF10
	movs r1, 0x6
_080DFEEC:
	ldrh r0, [r4]
	strh r0, [r2]
	adds r4, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080DFEEC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080DFF04: .4byte gUnknown_03004B00
_080DFF08: .4byte gUnknown_0202F7C8
_080DFF0C: .4byte sub_80DFBD8
_080DFF10: .4byte gUnknown_03000730
	thumb_func_end sub_80DFB28

	thumb_func_start sub_80DFBD8
sub_80DFBD8: @ 80DFF14
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x36]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x38]
	adds r0, r2
	strh r0, [r4, 0x38]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	ble _080DFF58
	adds r0, r4, 0
	bl move_anim_8072740
_080DFF58:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFBD8

	thumb_func_start sub_80DFC24
sub_80DFC24: @ 80DFF60
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080DFF94
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080DFF98
	ldrh r0, [r0]
	strh r0, [r1, 0x8]
	ldr r0, _080DFF9C
	ldrb r0, [r0]
	movs r2, 0x10
	strh r2, [r1, 0xA]
	ldr r1, _080DFFA0
	strh r2, [r1]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080DFFAC
	ldr r1, _080DFFA4
	ldr r2, _080DFFA8
	b _080DFFB0
	.align 2, 0
_080DFF94: .4byte gTasks
_080DFF98: .4byte gUnknown_03004B00
_080DFF9C: .4byte gUnknown_0202F7C8
_080DFFA0: .4byte 0x04000052
_080DFFA4: .4byte 0x04000050
_080DFFA8: .4byte 0x00003f42
_080DFFAC:
	ldr r1, _080DFFC8
	ldr r2, _080DFFCC
_080DFFB0:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080DFFD0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080DFFD4
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080DFFC8: .4byte 0x04000050
_080DFFCC: .4byte 0x00003f44
_080DFFD0: .4byte gTasks
_080DFFD4: .4byte sub_80DFC9C
	thumb_func_end sub_80DFC24

	thumb_func_start sub_80DFC9C
sub_80DFC9C: @ 80DFFD8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E0040
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	lsrs r2, r0, 8
	lsls r0, 24
	lsrs r1, r0, 24
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	ldrb r3, [r4, 0x8]
	cmp r0, r3
	bne _080E0054
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r2, 8
	orrs r1, r0
	movs r3, 0
	strh r1, [r4, 0xA]
	ldr r0, _080E0044
	strh r1, [r0]
	strh r3, [r4, 0xC]
	cmp r2, 0x10
	bne _080E005A
	ldr r2, _080E0048
	ldr r1, _080E004C
	ldr r0, _080E0050
	ldrb r0, [r0]
	adds r0, r1
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
	adds r0, r5, 0
	bl move_anim_task_del
	b _080E005A
	.align 2, 0
_080E0040: .4byte gTasks
_080E0044: .4byte 0x04000052
_080E0048: .4byte gSprites
_080E004C: .4byte gUnknown_02024BE0
_080E0050: .4byte gUnknown_0202F7C8
_080E0054:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_080E005A:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFC9C

	thumb_func_start sub_80DFD24
sub_80DFD24: @ 80E0060
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E0084
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080E0088
	ldrh r0, [r0]
	strh r0, [r1, 0x8]
	movs r2, 0x80
	lsls r2, 5
	strh r2, [r1, 0xA]
	ldr r0, _080E008C
	str r0, [r1]
	ldr r0, _080E0090
	strh r2, [r0]
	bx lr
	.align 2, 0
_080E0084: .4byte gTasks
_080E0088: .4byte gUnknown_03004B00
_080E008C: .4byte sub_80DFD58
_080E0090: .4byte 0x04000052
	thumb_func_end sub_80DFD24

	thumb_func_start sub_80DFD58
sub_80DFD58: @ 80E0094
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E00E4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0xA]
	lsrs r1, r0, 8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0xC
	ldrsh r0, [r2, r3]
	ldrb r3, [r2, 0x8]
	cmp r0, r3
	bne _080E00F0
	subs r0, r1, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r3, 8
	orrs r1, r0
	movs r0, 0
	strh r1, [r2, 0xA]
	ldr r5, _080E00E8
	strh r1, [r5]
	strh r0, [r2, 0xC]
	cmp r3, 0
	bne _080E00F6
	ldr r0, _080E00EC
	strh r3, [r0]
	strh r3, [r5]
	adds r0, r4, 0
	bl move_anim_task_del
	b _080E00F6
	.align 2, 0
_080E00E4: .4byte gTasks
_080E00E8: .4byte 0x04000052
_080E00EC: .4byte 0x04000050
_080E00F0:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
_080E00F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFD58

	thumb_func_start sub_80DFDC0
sub_80DFDC0: @ 80E00FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E0124
	movs r2, 0x80
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080E0128
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E0134
	ldr r1, _080E012C
	ldr r2, _080E0130
	b _080E0138
	.align 2, 0
_080E0124: .4byte 0x04000052
_080E0128: .4byte gUnknown_0202F7C8
_080E012C: .4byte 0x04000050
_080E0130: .4byte 0x00003f42
_080E0134:
	ldr r1, _080E0148
	ldr r2, _080E014C
_080E0138:
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0148: .4byte 0x04000050
_080E014C: .4byte 0x00003f44
	thumb_func_end sub_80DFDC0

	thumb_func_start sub_80DFE14
sub_80DFE14: @ 80E0150
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _080E01BC
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x30]
	ldr r5, _080E01C0
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r6]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x34]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	movs r0, 0x7E
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078A5C
	ldrh r0, [r4, 0x30]
	negs r0, r0
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	negs r0, r0
	strh r0, [r4, 0x36]
	ldr r0, _080E01C4
	strh r0, [r4, 0x3A]
	ldr r1, _080E01C8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E01BC: .4byte gUnknown_0202F7C9
_080E01C0: .4byte gUnknown_0202F7C8
_080E01C4: .4byte 0x0000ffd8
_080E01C8: .4byte sub_80DFE90
	thumb_func_end sub_80DFE14

	thumb_func_start sub_80DFE90
sub_80DFE90: @ 80E01CC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrh r5, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	adds r2, r5, r0
	strh r2, [r4, 0x34]
	ldrh r3, [r4, 0x32]
	ldrh r6, [r4, 0x36]
	adds r1, r3, r6
	strh r1, [r4, 0x36]
	lsls r0, r2, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	movs r6, 0x3C
	ldrsh r0, [r4, r6]
	cmp r0, 0
	bne _080E020E
	adds r0, r2, r5
	strh r0, [r4, 0x34]
	adds r1, r3
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
_080E020E:
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	movs r2, 0x3A
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r6, [r4, 0x26]
	adds r0, r6
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x38]
	adds r0, 0x3
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x38]
	cmp r0, 0x7F
	ble _080E023E
	movs r0, 0
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x14
	strh r0, [r4, 0x3A]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
_080E023E:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080E0250
	adds r0, r4, 0
	bl move_anim_8072740
_080E0250:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80DFE90

	thumb_func_start sub_80DFF1C
sub_80DFF1C: @ 80E0258
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E028C
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r1, [r5, 0x4]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x30]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x32]
	ldr r0, _080E0290
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E028C: .4byte gUnknown_03004B00
_080E0290: .4byte sub_80DFF58
	thumb_func_end sub_80DFF1C

	thumb_func_start sub_80DFF58
sub_80DFF58: @ 80E0294
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x36]
	adds r0, r1
	strh r0, [r2, 0x36]
	ldrh r1, [r2, 0x30]
	ldrh r3, [r2, 0x38]
	adds r1, r3
	strh r1, [r2, 0x38]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bne _080E02CA
	ldr r0, _080E02D0
	str r0, [r2, 0x1C]
_080E02CA:
	pop {r0}
	bx r0
	.align 2, 0
_080E02D0: .4byte sub_80DFF98
	thumb_func_end sub_80DFF58

	thumb_func_start sub_80DFF98
sub_80DFF98: @ 80E02D4
	push {lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x36]
	ldrh r0, [r3, 0x2E]
	subs r1, r0
	strh r1, [r3, 0x36]
	ldrh r0, [r3, 0x38]
	ldrh r2, [r3, 0x30]
	subs r0, r2
	strh r0, [r3, 0x38]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r3, 0x24]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r3, 0x26]
	ldrh r0, [r3, 0x34]
	subs r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	cmp r0, 0
	bne _080E0306
	adds r0, r3, 0
	bl move_anim_8074EE0
_080E0306:
	pop {r0}
	bx r0
	thumb_func_end sub_80DFF98

	thumb_func_start sub_80DFFD0
sub_80DFFD0: @ 80E030C
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r0, _080E0320
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r3, r0, 0
	cmp r1, 0
	bne _080E0328
	ldr r0, _080E0324
	b _080E032A
	.align 2, 0
_080E0320: .4byte gUnknown_03004B00
_080E0324: .4byte gUnknown_0202F7C8
_080E0328:
	ldr r0, _080E0358
_080E032A:
	ldrb r5, [r0]
	movs r6, 0x14
	ldrh r2, [r4, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x4
	ldr r7, _080E035C
	adds r0, r7, 0
	ands r1, r0
	ldr r0, _080E0360
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, 0x4]
	movs r1, 0x2
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _080E0388
	cmp r0, 0x1
	bgt _080E0364
	cmp r0, 0
	beq _080E036E
	b _080E03DC
	.align 2, 0
_080E0358: .4byte gUnknown_0202F7C9
_080E035C: .4byte 0x000003ff
_080E0360: .4byte 0xfffffc00
_080E0364:
	cmp r0, 0x2
	beq _080E03A2
	cmp r0, 0x3
	beq _080E03BA
	b _080E03DC
_080E036E:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0x8
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r4, 0x22]
	b _080E03DC
_080E0388:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_807A100
	subs r0, 0xE
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x10
	strh r0, [r4, 0x22]
	b _080E03DC
_080E03A2:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0x8
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x8
	b _080E03D0
_080E03BA:
	adds r0, r5, 0
	movs r1, 0x4
	bl sub_807A100
	adds r0, 0xE
	strh r0, [r4, 0x20]
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_807A100
	adds r0, 0x10
_080E03D0:
	strh r0, [r4, 0x22]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r6, 0xEC
_080E03DC:
	movs r0, 0x20
	strh r0, [r4, 0x2E]
	lsls r0, r6, 24
	asrs r0, 24
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x22]
	adds r0, 0xC
	strh r0, [r4, 0x36]
	ldr r0, _080E0404
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080E0408
	str r0, [r4, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0404: .4byte 0x0000fff4
_080E0408: .4byte sub_80E00D0
	thumb_func_end sub_80DFFD0

	thumb_func_start sub_80E00D0
sub_80E00D0: @ 80E040C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E0420
	adds r0, r4, 0
	bl move_anim_8074EE0
_080E0420:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E00D0

	thumb_func_start sub_80E00EC
sub_80E00EC: @ 80E0428
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E048C
	adds r5, r1, r0
	ldr r4, _080E0490
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	movs r6, 0
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	subs r0, 0x7
	strh r0, [r5, 0x14]
	ldrh r1, [r5, 0x16]
	strh r1, [r5, 0x12]
	strh r0, [r5, 0x10]
	subs r1, r0
	lsls r1, 8
	strh r1, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r5, 0x24]
	adds r0, 0x20
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080E0498
	ldr r0, _080E0494
	b _080E049A
	.align 2, 0
_080E048C: .4byte gTasks
_080E0490: .4byte gUnknown_0202F7C8
_080E0494: .4byte 0x0000fff4
_080E0498:
	ldr r0, _080E04E4
_080E049A:
	strh r0, [r5, 0x18]
	ldr r0, _080E04E8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	cmp r0, 0x1
	bne _080E0500
	add r4, sp, 0xC
	adds r0, r4, 0
	bl sub_8078914
	ldr r0, _080E04EC
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	ldr r1, _080E04F0
	ldr r2, _080E04F4
	adds r0, r2, 0
	strh r0, [r1]
	ldrb r1, [r4, 0x8]
	lsls r1, 4
	movs r0, 0
	movs r2, 0x20
	bl FillPalette
	ldr r0, _080E04F8
	str r0, [sp]
	movs r7, 0x2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E0530
	ldr r1, _080E04FC
	b _080E052A
	.align 2, 0
_080E04E4: .4byte 0x0000ffc0
_080E04E8: .4byte gUnknown_0202F7C8
_080E04EC: .4byte gUnknown_030041B4
_080E04F0: .4byte 0x04000050
_080E04F4: .4byte 0x00003f42
_080E04F8: .4byte 0x04000016
_080E04FC: .4byte gUnknown_03004288
_080E0500:
	ldr r0, _080E05B4
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	ldr r1, _080E05B8
	ldr r2, _080E05BC
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
	ldr r0, _080E05C0
	str r0, [sp]
	movs r7, 0x4
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E0530
	ldr r1, _080E05C4
_080E052A:
	ldrh r0, [r1]
	adds r0, 0xF0
	strh r0, [r1]
_080E0530:
	ldr r0, _080E05C8
	str r0, [sp, 0x4]
	mov r2, sp
	movs r1, 0
	movs r0, 0x1
	strb r0, [r2, 0x8]
	mov r0, sp
	strb r1, [r0, 0x9]
	strh r1, [r5, 0x1E]
	movs r0, 0x10
	strh r0, [r5, 0x20]
	strh r1, [r5, 0x8]
	strh r1, [r5, 0xA]
	strh r1, [r5, 0xC]
	movs r0, 0x3
	bl sub_80E08CC
	movs r3, 0
	ldr r4, _080E05CC
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r4, r0
_080E055C:
	lsls r1, r3, 1
	adds r2, r1, r4
	ldrh r0, [r5, 0x1C]
	strh r0, [r2]
	adds r1, r6
	ldrh r0, [r5, 0x1C]
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6F
	bls _080E055C
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	ldr r1, _080E05D0
	movs r0, 0x3F
	eors r7, r0
	movs r2, 0xFC
	lsls r2, 6
	adds r0, r2, 0
	orrs r7, r0
	strh r7, [r1]
	subs r1, 0x2
	adds r2, 0x3F
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080E05D4
	ldrh r0, [r5, 0x24]
	lsls r0, 8
	ldrh r1, [r5, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E05D8
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080E05DC
	str r0, [r5]
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E05B4: .4byte gUnknown_03004280
_080E05B8: .4byte 0x04000050
_080E05BC: .4byte 0x00003f44
_080E05C0: .4byte 0x0400001a
_080E05C4: .4byte gUnknown_030042C0
_080E05C8: .4byte 0xa2600001
_080E05CC: .4byte gUnknown_03004DE0
_080E05D0: .4byte 0x0400004a
_080E05D4: .4byte gUnknown_030042C4
_080E05D8: .4byte gUnknown_03004240
_080E05DC: .4byte sub_80E02A4
	thumb_func_end sub_80E00EC

	thumb_func_start sub_80E02A4
sub_80E02A4: @ 80E05E0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E0604
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E05FA
	b _080E06F2
_080E05FA:
	lsls r0, 2
	ldr r1, _080E0608
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E0604: .4byte gTasks
_080E0608: .4byte _080E060C
	.align 2, 0
_080E060C:
	.4byte _080E0620
	.4byte _080E0680
	.4byte _080E069A
	.4byte _080E06D8
	.4byte _080E06EC
_080E0620:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E06F2
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E0650
	ldrh r1, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0xC
	beq _080E065E
	adds r0, r1, 0x1
	strh r0, [r4, 0x1E]
	b _080E065E
_080E0650:
	ldrh r1, [r4, 0x20]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	beq _080E065E
	subs r0, r1, 0x1
	strh r0, [r4, 0x20]
_080E065E:
	ldr r2, _080E067C
	ldrh r0, [r4, 0x20]
	lsls r0, 8
	ldrh r1, [r4, 0x1E]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0xC
	bne _080E06F2
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x8
	bne _080E06F2
	b _080E06DE
	.align 2, 0
_080E067C: .4byte 0x04000052
_080E0680:
	ldrh r0, [r4, 0x10]
	subs r0, 0x8
	strh r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80E079C
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _080E06F2
	b _080E06DE
_080E069A:
	ldrh r0, [r4, 0x10]
	subs r0, 0x8
	strh r0, [r4, 0x10]
	adds r0, r4, 0
	bl sub_80E079C
	ldrh r1, [r4, 0x24]
	adds r1, 0x4
	strh r1, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	subs r2, r0, 0x4
	strh r2, [r4, 0x26]
	lsls r1, 16
	lsls r0, r2, 16
	cmp r1, r0
	blt _080E06BC
	strh r2, [r4, 0x24]
_080E06BC:
	ldr r3, _080E06D4
	ldrh r2, [r4, 0x24]
	lsls r0, r2, 8
	ldrh r1, [r4, 0x26]
	orrs r0, r1
	strh r0, [r3]
	lsls r2, 16
	lsls r1, 16
	cmp r2, r1
	bne _080E06F2
	b _080E06DE
	.align 2, 0
_080E06D4: .4byte gUnknown_030042C4
_080E06D8:
	ldr r1, _080E06E8
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E06DE:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E06F2
	.align 2, 0
_080E06E8: .4byte gUnknown_03004DC0
_080E06EC:
	adds r0, r2, 0
	bl move_anim_task_del
_080E06F2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E02A4

	thumb_func_start sub_80E03BC
sub_80E03BC: @ 80E06F8
	push {r4-r7,lr}
	sub sp, 0x18
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080E0720
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x4
	bls _080E0714
	b _080E092E
_080E0714:
	lsls r0, 2
	ldr r1, _080E0724
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E0720: .4byte gTasks
_080E0724: .4byte _080E0728
	.align 2, 0
_080E0728:
	.4byte _080E073C
	.4byte _080E07C8
	.4byte _080E080C
	.4byte _080E0878
	.4byte _080E08E0
_080E073C:
	bl sub_8076BE0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E0778
	ldr r0, _080E0768
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E076C
	strh r1, [r0]
	ldr r0, _080E0770
	ldr r2, _080E0774
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r4, 0
	bl move_anim_task_del
	b _080E092E
	.align 2, 0
_080E0768: .4byte gUnknown_030042C4
_080E076C: .4byte gUnknown_03004240
_080E0770: .4byte 0x04000048
_080E0774: .4byte 0x00003f3f
_080E0778:
	ldr r0, _080E0798
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xE]
	cmp r0, 0x1
	bne _080E07A8
	ldr r1, _080E079C
	ldr r2, _080E07A0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E07A4
	b _080E07B2
	.align 2, 0
_080E0798: .4byte gUnknown_0202F7C9
_080E079C: .4byte 0x04000050
_080E07A0: .4byte 0x00003f42
_080E07A4: .4byte gUnknown_03004288
_080E07A8:
	ldr r1, _080E07BC
	ldr r2, _080E07C0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E07C4
_080E07B2:
	ldrh r0, [r1]
	adds r0, 0xF0
	strh r0, [r1]
	b _080E08CC
	.align 2, 0
_080E07BC: .4byte 0x04000050
_080E07C0: .4byte 0x00003f44
_080E07C4: .4byte gUnknown_030042C0
_080E07C8:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080E07F0
	mov r0, sp
	bl sub_8078914
	ldr r0, _080E07EC
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	mov r0, sp
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	movs r0, 0
	movs r2, 0x20
	bl FillPalette
	b _080E0800
	.align 2, 0
_080E07EC: .4byte gUnknown_030041B4
_080E07F0:
	ldr r0, _080E0808
	ldrh r0, [r0]
	strh r0, [r5, 0x1C]
	movs r0, 0
	movs r1, 0x90
	movs r2, 0x20
	bl FillPalette
_080E0800:
	movs r0, 0x3
	bl sub_80E08CC
	b _080E08CC
	.align 2, 0
_080E0808: .4byte gUnknown_03004280
_080E080C:
	ldr r4, _080E0858
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	movs r6, 0
	strh r0, [r5, 0x16]
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_807A100
	subs r0, 0x7
	strh r0, [r5, 0x14]
	ldrh r1, [r5, 0x16]
	subs r1, r0
	lsls r1, 8
	strh r1, [r5, 0x22]
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	subs r1, r0, 0x4
	strh r1, [r5, 0x24]
	adds r0, 0x4
	strh r0, [r5, 0x26]
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _080E0860
	ldr r0, _080E085C
	b _080E0862
	.align 2, 0
_080E0858: .4byte gUnknown_0202F7C9
_080E085C: .4byte 0x0000fff4
_080E0860:
	ldr r0, _080E0874
_080E0862:
	strh r0, [r5, 0x18]
	ldrh r0, [r5, 0x18]
	strh r0, [r5, 0x10]
	strh r0, [r5, 0x12]
	movs r0, 0xC
	strh r0, [r5, 0x1E]
	movs r0, 0x8
	strh r0, [r5, 0x20]
	b _080E08CC
	.align 2, 0
_080E0874: .4byte 0x0000ffc0
_080E0878:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0x1
	bne _080E0888
	ldr r0, _080E0884
	b _080E088A
	.align 2, 0
_080E0884: .4byte 0x04000016
_080E0888:
	ldr r0, _080E08D4
_080E088A:
	str r0, [sp, 0xC]
	movs r3, 0
	add r4, sp, 0xC
	ldr r6, _080E08D8
	movs r0, 0xF0
	lsls r0, 3
	adds r7, r6, r0
_080E0898:
	lsls r1, r3, 1
	adds r2, r1, r6
	ldrh r0, [r5, 0x1C]
	adds r0, 0x9F
	subs r0, r3
	strh r0, [r2]
	adds r1, r7
	ldrh r0, [r5, 0x1C]
	adds r0, 0x9F
	subs r0, r3
	strh r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6F
	bls _080E0898
	ldr r1, _080E08DC
	str r1, [r4, 0x4]
	movs r2, 0
	movs r0, 0x1
	strb r0, [r4, 0x8]
	strb r2, [r4, 0x9]
	ldr r0, [sp, 0xC]
	ldr r2, [r4, 0x8]
	bl sub_80895F8
_080E08CC:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	b _080E092E
	.align 2, 0
_080E08D4: .4byte 0x0400001a
_080E08D8: .4byte gUnknown_03004DE0
_080E08DC: .4byte 0xa2600001
_080E08E0:
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _080E08F8
	ldr r1, _080E08F0
	ldr r2, _080E08F4
	b _080E08FC
	.align 2, 0
_080E08F0: .4byte 0x0400004a
_080E08F4: .4byte 0x00003f3d
_080E08F8:
	ldr r1, _080E0938
	ldr r2, _080E093C
_080E08FC:
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _080E0940
	ldr r2, _080E0944
	adds r0, r2, 0
	strh r0, [r1]
	ldr r2, _080E0948
	ldrh r0, [r5, 0x24]
	lsls r0, 8
	ldrh r1, [r5, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E094C
	movs r0, 0xA0
	strh r0, [r1]
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	ldr r1, _080E0950
	ldr r2, _080E0954
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080E0958
	str r0, [r5]
_080E092E:
	add sp, 0x18
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0938: .4byte 0x0400004a
_080E093C: .4byte 0x00003f3b
_080E0940: .4byte 0x04000048
_080E0944: .4byte 0x00003f3f
_080E0948: .4byte gUnknown_030042C4
_080E094C: .4byte gUnknown_03004240
_080E0950: .4byte 0x04000052
_080E0954: .4byte 0x0000080c
_080E0958: .4byte sub_80E0620
	thumb_func_end sub_80E03BC

	thumb_func_start sub_80E0620
sub_80E0620: @ 80E095C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E0980
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E0976
	b _080E0AC0
_080E0976:
	lsls r0, 2
	ldr r1, _080E0984
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E0980: .4byte gTasks
_080E0984: .4byte _080E0988
	.align 2, 0
_080E0988:
	.4byte _080E099C
	.4byte _080E09C8
	.4byte _080E0A30
	.4byte _080E0A90
	.4byte _080E0AA4
_080E099C:
	ldrh r0, [r4, 0x12]
	adds r0, 0x8
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0x16]
	movs r3, 0x16
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E09B2
	strh r2, [r4, 0x12]
_080E09B2:
	adds r0, r4, 0
	bl sub_80E079C
	movs r0, 0x12
	ldrsh r1, [r4, r0]
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080E09C6
	b _080E0AC0
_080E09C6:
	b _080E0A96
_080E09C8:
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	subs r0, r1
	cmp r0, 0x3F
	bgt _080E09E4
	ldrh r0, [r4, 0x24]
	subs r0, 0x4
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x26]
	adds r0, 0x4
	strh r0, [r4, 0x26]
	b _080E09E8
_080E09E4:
	movs r0, 0x1
	strh r0, [r4, 0xA]
_080E09E8:
	ldr r2, _080E0A2C
	ldrh r0, [r4, 0x24]
	lsls r0, 8
	ldrh r1, [r4, 0x26]
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r4, 0x10]
	adds r0, 0x8
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	ldrh r2, [r4, 0x14]
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E0A0A
	strh r2, [r4, 0x10]
_080E0A0A:
	adds r0, r4, 0
	bl sub_80E079C
	movs r0, 0x10
	ldrsh r1, [r4, r0]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E0AC0
	movs r3, 0xA
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _080E0AC0
	movs r0, 0
	strh r0, [r4, 0xA]
	b _080E0A96
	.align 2, 0
_080E0A2C: .4byte gUnknown_030042C4
_080E0A30:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E0AC0
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080E0A60
	ldrh r1, [r4, 0x1E]
	movs r2, 0x1E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080E0A6E
	subs r0, r1, 0x1
	strh r0, [r4, 0x1E]
	b _080E0A6E
_080E0A60:
	ldrh r1, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0xF
	bgt _080E0A6E
	adds r0, r1, 0x1
	strh r0, [r4, 0x20]
_080E0A6E:
	ldr r2, _080E0A8C
	ldrh r0, [r4, 0x20]
	lsls r0, 8
	ldrh r1, [r4, 0x1E]
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E0AC0
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x10
	bne _080E0AC0
	b _080E0A96
	.align 2, 0
_080E0A8C: .4byte 0x04000052
_080E0A90:
	ldr r1, _080E0AA0
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E0A96:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E0AC0
	.align 2, 0
_080E0AA0: .4byte gUnknown_03004DC0
_080E0AA4:
	ldr r0, _080E0AC8
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E0ACC
	strh r1, [r0]
	ldr r0, _080E0AD0
	ldr r3, _080E0AD4
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, r2, 0
	bl move_anim_task_del
_080E0AC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0AC8: .4byte gUnknown_030042C4
_080E0ACC: .4byte gUnknown_03004240
_080E0AD0: .4byte 0x04000048
_080E0AD4: .4byte 0x00003f3f
	thumb_func_end sub_80E0620

	thumb_func_start sub_80E079C
sub_80E079C: @ 80E0AD8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldrh r0, [r6, 0x12]
	ldrh r4, [r6, 0x10]
	subs r0, r4
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080E0BCC
	movs r2, 0x22
	ldrsh r0, [r6, r2]
	bl __divsi3
	mov r8, r0
	movs r3, 0x14
	ldrsh r0, [r6, r3]
	lsls r5, r0, 8
	lsls r0, r4, 16
	movs r4, 0
	cmp r0, 0
	ble _080E0B38
	ldr r0, _080E0BC4
	mov r12, r0
	ldr r7, _080E0BC8
_080E0B0C:
	lsls r2, r4, 16
	asrs r2, 16
	lsls r3, r2, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r3, r0
	add r3, r12
	adds r1, r2, 0
	subs r1, 0x9F
	ldrh r0, [r6, 0x1C]
	subs r0, r1
	strh r0, [r3]
	adds r2, 0x1
	lsls r2, 16
	lsrs r4, r2, 16
	asrs r2, 16
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	cmp r2, r0
	blt _080E0B0C
_080E0B38:
	ldrh r4, [r6, 0x10]
	lsls r3, r4, 16
	asrs r1, r3, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	bgt _080E0B82
	ldr r0, _080E0BC4
	mov r12, r0
	ldr r7, _080E0BC8
_080E0B4C:
	asrs r4, r3, 16
	cmp r4, 0
	blt _080E0B6E
	asrs r1, r5, 8
	subs r1, r4
	lsls r3, r4, 1
	ldrb r2, [r7, 0x14]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 7
	adds r3, r0
	add r3, r12
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r6, 0x1C]
	adds r1, r2
	strh r1, [r3]
_080E0B6E:
	add r5, r8
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r3, r4, 16
	asrs r1, r3, 16
	movs r2, 0x12
	ldrsh r0, [r6, r2]
	cmp r1, r0
	ble _080E0B4C
_080E0B82:
	movs r3, 0x1C
	ldrsh r0, [r6, r3]
	adds r0, 0x9F
	lsls r2, r4, 16
	asrs r1, r2, 16
	subs r5, r0, r1
	movs r3, 0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	bge _080E0BFA
	ldr r7, _080E0BC4
	ldr r4, _080E0BC8
_080E0B9A:
	asrs r3, r2, 16
	cmp r3, 0
	blt _080E0BB2
	lsls r2, r3, 1
	ldrb r1, [r4, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	strh r5, [r2]
	subs r5, 0x1
_080E0BB2:
	adds r0, r3, 0x1
	lsls r2, r0, 16
	asrs r1, r2, 16
	movs r3, 0x16
	ldrsh r0, [r6, r3]
	cmp r1, r0
	blt _080E0B9A
	b _080E0BFA
	.align 2, 0
_080E0BC4: .4byte gUnknown_03004DE0
_080E0BC8: .4byte gUnknown_03004DC0
_080E0BCC:
	movs r1, 0x1C
	ldrsh r0, [r6, r1]
	adds r5, r0, 0
	adds r5, 0x9F
	movs r4, 0
	ldr r3, _080E0C04
	movs r2, 0xF0
	lsls r2, 3
	adds r6, r3, r2
_080E0BDE:
	lsls r0, r4, 16
	asrs r0, 16
	lsls r2, r0, 1
	adds r1, r2, r3
	strh r5, [r1]
	adds r2, r6
	strh r5, [r2]
	subs r5, 0x1
	adds r0, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _080E0BDE
_080E0BFA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0C04: .4byte gUnknown_03004DE0
	thumb_func_end sub_80E079C

	thumb_func_start sub_80E08CC
sub_80E08CC: @ 80E0C08
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0
	ldr r7, _080E0C50
	movs r1, 0x3
	ands r0, r1
	lsls r5, r0, 2
	movs r0, 0xD
	negs r0, r0
	adds r6, r0, 0
_080E0C1E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080E0C3E
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	ldrb r0, [r1, 0x5]
	ands r0, r6
	orrs r0, r5
	strb r0, [r1, 0x5]
_080E0C3E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080E0C1E
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0C50: .4byte gSprites
	thumb_func_end sub_80E08CC

	thumb_func_start sub_80E0918
sub_80E0918: @ 80E0C54
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r6, _080E0CF4
	ldrb r0, [r6]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r4, r1, 31
	ldrb r0, [r6]
	adds r1, r4, 0
	bl sub_8076034
	ldr r0, _080E0CF8
	mov r9, r0
	ldr r0, _080E0CFC
	mov r8, r0
	ldrb r0, [r6]
	add r0, r8
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r7, 0x5
	negs r7, r7
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080E0CDE
	ldrb r0, [r6]
	eors r0, r5
	movs r1, 0x1
	eors r4, r1
	adds r1, r4, 0
	bl sub_8076034
	ldrb r0, [r6]
	eors r0, r5
	add r0, r8
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	adds r0, 0x3E
	ldrb r2, [r0]
	adds r1, r7, 0
	ands r1, r2
	strb r1, [r0]
_080E0CDE:
	mov r0, r10
	bl move_anim_task_del
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E0CF4: .4byte gUnknown_0202F7C8
_080E0CF8: .4byte gSprites
_080E0CFC: .4byte gUnknown_02024BE0
	thumb_func_end sub_80E0918

	thumb_func_start sub_80E09C4
sub_80E09C4: @ 80E0D00
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r4, _080E0D48
	ldrb r0, [r4]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	eors r0, r1
	negs r1, r0
	orrs r1, r0
	lsrs r5, r1, 31
	adds r0, r5, 0
	bl sub_8076464
	ldrb r1, [r4]
	movs r0, 0x2
	eors r0, r1
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080E0D3C
	movs r0, 0x1
	eors r5, r0
	adds r0, r5, 0
	bl sub_8076464
_080E0D3C:
	adds r0, r6, 0
	bl move_anim_task_del
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E0D48: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80E09C4

	thumb_func_start sub_80E0A10
sub_80E0A10: @ 80E0D4C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080E0D7C
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r2, [r4, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
	ldrb r1, [r1, 0x4]
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _080E0D80
	str r0, [r4, 0x1C]
	ldr r1, _080E0D84
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E0D7C: .4byte gUnknown_03004B00
_080E0D80: .4byte sub_8078600
_080E0D84: .4byte move_anim_8072740
	thumb_func_end sub_80E0A10

	thumb_func_start sub_80E0A4C
sub_80E0A4C: @ 80E0D88
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0
	ldr r0, _080E0E8C
	strh r7, [r0]
	ldr r0, _080E0E90
	strh r7, [r0]
	ldr r1, _080E0E94
	ldr r2, _080E0E98
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E0E9C
	adds r0, r3, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E0EA0
	ldr r2, _080E0EA4
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E0EA8
	adds r0, r3, 0
	strh r0, [r1]
	ldr r5, _080E0EAC
	ldrb r1, [r5]
	movs r0, 0x4
	negs r0, r0
	mov r8, r0
	ands r0, r1
	strb r0, [r5]
	ldrb r1, [r5, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r5, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E0E00
	ldrb r0, [r5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r5]
_080E0E00:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080E0E7C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E0E7C
	ldr r4, _080E0EB0
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E0E30
	ldrb r0, [r4]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _080E0E7C
_080E0E30:
	ldrb r0, [r4]
	movs r6, 0x2
	eors r0, r6
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E0E7C
	ldr r3, _080E0EB4
	ldr r1, _080E0EB8
	ldrb r0, [r4]
	eors r0, r6
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r1, [r5]
	mov r0, r8
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5]
	movs r7, 0x1
_080E0E7C:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E0EC0
	ldr r0, _080E0EBC
	ldrh r5, [r0]
	b _080E0F08
	.align 2, 0
_080E0E8C: .4byte gUnknown_030042C4
_080E0E90: .4byte gUnknown_03004240
_080E0E94: .4byte 0x04000048
_080E0E98: .4byte 0x00003f3f
_080E0E9C: .4byte 0x00003f3d
_080E0EA0: .4byte 0x04000050
_080E0EA4: .4byte 0x00003f42
_080E0EA8: .4byte 0x00000c08
_080E0EAC: .4byte 0x0400000a
_080E0EB0: .4byte gUnknown_0202F7C8
_080E0EB4: .4byte gSprites
_080E0EB8: .4byte gUnknown_02024BE0
_080E0EBC: .4byte 0x02019348
_080E0EC0:
	ldr r4, _080E0EE0
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080E0EEC
	ldr r1, _080E0EE4
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E0EE8
	b _080E0EFC
	.align 2, 0
_080E0EE0: .4byte gUnknown_0202F7C8
_080E0EE4: .4byte gUnknown_02024A6A
_080E0EE8: .4byte gEnemyParty
_080E0EEC:
	ldr r1, _080E0F94
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E0F98
_080E0EFC:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
_080E0F08:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E0F9C
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _080E0FA0
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080E0FA4
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080E0FA8
	bl LZDecompressVram
	ldr r0, _080E0FAC
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080E0FB0
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r2, _080E0FB4
	ldr r0, _080E0FB8
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x60
	strh r0, [r2]
	ldr r2, _080E0FBC
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	adds r1, r0, 0
	ldr r2, _080E0FC0
	movs r3, 0x2
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080E0FC4
	adds r0, r1, 0
	movs r1, 0
	bl sub_8079108
	b _080E0FD0
	.align 2, 0
_080E0F94: .4byte gUnknown_02024A6A
_080E0F98: .4byte gPlayerParty
_080E0F9C: .4byte gUnknown_0202F7C8
_080E0FA0: .4byte 0x040000d4
_080E0FA4: .4byte 0x85000400
_080E0FA8: .4byte gUnknown_08D1D574
_080E0FAC: .4byte gUnknown_08D1D410
_080E0FB0: .4byte gUnknown_08D1D54C
_080E0FB4: .4byte gUnknown_030042C0
_080E0FB8: .4byte gSprites
_080E0FBC: .4byte gUnknown_030041B4
_080E0FC0: .4byte gUnknown_03004B00
_080E0FC4:
	lsls r0, r1, 4
	ldrh r3, [r2, 0x4]
	movs r1, 0x10
	movs r2, 0xB
	bl BlendPalette
_080E0FD0:
	ldr r1, _080E1000
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	ldr r2, _080E1004
	ldrh r1, [r2]
	strh r1, [r0, 0xA]
	ldrh r1, [r2, 0x2]
	strh r1, [r0, 0xC]
	ldrh r1, [r2, 0x4]
	strh r1, [r0, 0xE]
	strh r7, [r0, 0x14]
	ldr r1, _080E1008
	str r1, [r0]
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1000: .4byte gTasks
_080E1004: .4byte gUnknown_03004B00
_080E1008: .4byte sub_80E0CD0
	thumb_func_end sub_80E0A4C

	thumb_func_start sub_80E0CD0
sub_80E0CD0: @ 80E100C
	push {r4-r7,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r1, _080E112C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x4
	movs r5, 0
	strh r0, [r4, 0x1C]
	ldr r2, _080E1130
	ldrh r3, [r2]
	subs r1, r3, 0x4
	strh r1, [r2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x80
	bne _080E1124
	strh r5, [r4, 0x1C]
	adds r0, r3, 0
	adds r0, 0x7C
	strh r0, [r2]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080E1124
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E1134
	strh r5, [r0]
	ldr r0, _080E1138
	strh r5, [r0]
	ldr r0, _080E113C
	ldr r2, _080E1140
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E107C
	ldr r2, _080E1144
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E107C:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E1148
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080E114C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	adds r1, r0, 0
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080E10C0
	adds r0, r1, 0
	movs r1, 0x1
	bl sub_8079108
_080E10C0:
	movs r3, 0x8
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r1, _080E1150
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080E1154
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080E111E
	ldr r2, _080E1158
	ldr r0, _080E115C
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080E111E:
	adds r0, r7, 0
	bl move_anim_task_del
_080E1124:
	add sp, 0x10
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E112C: .4byte gTasks
_080E1130: .4byte gUnknown_030042C0
_080E1134: .4byte gUnknown_030042C4
_080E1138: .4byte gUnknown_03004240
_080E113C: .4byte 0x04000048
_080E1140: .4byte 0x00003f3f
_080E1144: .4byte 0x0400000a
_080E1148: .4byte 0x04000050
_080E114C: .4byte gSprites
_080E1150: .4byte 0x040000d4
_080E1154: .4byte 0x85000200
_080E1158: .4byte gUnknown_02024BE0
_080E115C: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80E0CD0

	thumb_func_start sub_80E0E24
sub_80E0E24: @ 80E1160
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080E1180
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r2, r0, 0
	cmp r1, 0x7
	bhi _080E11C4
	lsls r0, r1, 2
	ldr r1, _080E1184
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E1180: .4byte gUnknown_03004B00
_080E1184: .4byte _080E1188
	.align 2, 0
_080E1188:
	.4byte _080E11A8
	.4byte _080E11A8
	.4byte _080E11A8
	.4byte _080E11A8
	.4byte _080E11B4
	.4byte _080E11B8
	.4byte _080E11BC
	.4byte _080E11C0
_080E11A8:
	ldrb r0, [r2]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r2, r0, 24
	b _080E11C6
_080E11B4:
	movs r4, 0
	b _080E11CC
_080E11B8:
	movs r4, 0x2
	b _080E11CC
_080E11BC:
	movs r4, 0x1
	b _080E11CC
_080E11C0:
	movs r4, 0x3
	b _080E11CC
_080E11C4:
	movs r2, 0xFF
_080E11C6:
	movs r0, 0
	cmp r0, 0
	beq _080E11F2
_080E11CC:
	adds r0, r4, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080E11F0
	ldr r0, _080E11EC
	adds r0, r4, r0
	ldrb r2, [r0]
	b _080E11F2
	.align 2, 0
_080E11EC: .4byte gUnknown_02024BE0
_080E11F0:
	movs r2, 0xFF
_080E11F2:
	cmp r2, 0xFF
	beq _080E120E
	ldr r1, _080E121C
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	ldr r1, _080E1220
	ldrb r1, [r1, 0x2]
	bl sub_8079108
_080E120E:
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E121C: .4byte gSprites
_080E1220: .4byte gUnknown_03004B00
	thumb_func_end sub_80E0E24

	thumb_func_start sub_80E0EE8
sub_80E0EE8: @ 80E1224
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r2, _080E1250
	ldrb r0, [r2]
	cmp r0, 0x1
	bhi _080E1238
	ldr r1, _080E1254
	movs r0, 0
	strh r0, [r1, 0xE]
_080E1238:
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _080E1244
	ldr r1, _080E1254
	movs r0, 0x1
	strh r0, [r1, 0xE]
_080E1244:
	adds r0, r3, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080E1250: .4byte gUnknown_0202F7C4
_080E1254: .4byte gUnknown_03004B00
	thumb_func_end sub_80E0EE8

	thumb_func_start sub_80E0F1C
sub_80E0F1C: @ 80E1258
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E12B0
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	movs r0, 0x14
	strh r0, [r4, 0x2E]
	ldr r5, _080E12B4
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x36]
	ldr r0, _080E12B8
	strh r0, [r4, 0x38]
	adds r0, r4, 0
	bl sub_80786EC
	ldr r0, _080E12BC
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E12B0: .4byte gUnknown_0202F7C8
_080E12B4: .4byte gUnknown_0202F7C9
_080E12B8: .4byte 0x0000ffd8
_080E12BC: .4byte sub_80E0F84
	thumb_func_end sub_80E0F1C

	thumb_func_start sub_80E0F84
sub_80E0F84: @ 80E12C0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E1314
	ldrh r0, [r5, 0x24]
	ldrh r1, [r5, 0x20]
	adds r0, r1
	movs r1, 0
	strh r0, [r5, 0x20]
	ldrh r0, [r5, 0x26]
	ldrh r2, [r5, 0x22]
	adds r0, r2
	strh r0, [r5, 0x22]
	strh r1, [r5, 0x26]
	strh r1, [r5, 0x24]
	movs r0, 0x14
	strh r0, [r5, 0x2E]
	ldr r4, _080E131C
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x36]
	movs r0, 0x28
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080E1320
	str r0, [r5, 0x1C]
_080E1314:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E131C: .4byte gUnknown_0202F7C8
_080E1320: .4byte sub_80E0FE8
	thumb_func_end sub_80E0F84

	thumb_func_start sub_80E0FE8
sub_80E0FE8: @ 80E1324
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E1338
	adds r0, r4, 0
	bl move_anim_8072740
_080E1338:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E0FE8

	thumb_func_start sub_80E1004
sub_80E1004: @ 80E1340
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_8078764
	ldr r0, _080E13A0
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080E1360
	ldr r1, _080E13A4
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_080E1360:
	ldr r4, _080E13A4
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080E13A8
	ldrb r0, [r5]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r4, 0x4]
	adds r0, r1
	strh r0, [r6, 0x32]
	ldrb r0, [r5]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r6, 0x36]
	ldr r0, _080E13AC
	str r0, [r6, 0x1C]
	ldr r1, _080E13B0
	adds r0, r6, 0
	bl oamt_set_x3A_32
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E13A0: .4byte gUnknown_0202F7C8
_080E13A4: .4byte gUnknown_03004B00
_080E13A8: .4byte gUnknown_0202F7C9
_080E13AC: .4byte sub_8078B34
_080E13B0: .4byte move_anim_8072740
	thumb_func_end sub_80E1004

	thumb_func_start sub_80E1078
sub_80E1078: @ 80E13B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r4, _080E1434
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077EE4
	lsls r0, 24
	lsrs r7, r0, 24
	bl Random
	movs r4, 0x1F
	adds r5, r4, 0
	ands r5, r0
	bl Random
	ands r4, r0
	adds r1, r5, 0
	cmp r1, 0x10
	ble _080E13FC
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
_080E13FC:
	lsls r0, r4, 16
	asrs r1, r0, 16
	cmp r1, 0x10
	ble _080E140C
	movs r0, 0x10
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
_080E140C:
	ldr r0, _080E1438
	ldrh r0, [r0, 0x4]
	strh r0, [r6, 0x2E]
	mov r1, r8
	adds r0, r1, r5
	strh r0, [r6, 0x32]
	adds r0, r7, r4
	strh r0, [r6, 0x36]
	ldr r0, _080E143C
	str r0, [r6, 0x1C]
	ldr r1, _080E1440
	adds r0, r6, 0
	bl oamt_set_x3A_32
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1434: .4byte gUnknown_0202F7C9
_080E1438: .4byte gUnknown_03004B00
_080E143C: .4byte sub_8078B34
_080E1440: .4byte move_anim_8074EE0
	thumb_func_end sub_80E1078

	thumb_func_start sub_80E1108
sub_80E1108: @ 80E1444
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x1
	ldr r3, _080E14A4
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080E14A8
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldr r6, _080E14AC
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _080E14B8
	ldr r4, _080E14B0
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r6, 0x2]
	adds r0, r2
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r3, [r6, 0x4]
	adds r0, r3
	strh r0, [r5, 0x22]
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	movs r2, 0x1
	negs r2, r2
	adds r1, r2, 0
	cmp r0, 0
	ble _080E149E
	movs r1, 0x1
_080E149E:
	strh r1, [r5, 0x2E]
	ldr r0, _080E14B4
	b _080E14C6
	.align 2, 0
_080E14A4: .4byte 0x000003ff
_080E14A8: .4byte 0xfffffc00
_080E14AC: .4byte gUnknown_03004B00
_080E14B0: .4byte gUnknown_0202F7C8
_080E14B4: .4byte sub_80E1198
_080E14B8:
	ldrh r0, [r6, 0x2]
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0x4]
	strh r0, [r5, 0x22]
	negs r0, r0
	strh r0, [r5, 0x26]
	ldr r0, _080E14D0
_080E14C6:
	str r0, [r5, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E14D0: .4byte sub_80E11D4
	thumb_func_end sub_80E1108

	thumb_func_start sub_80E1198
sub_80E1198: @ 80E14D4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E14F2
	movs r0, 0
	strh r0, [r2, 0x30]
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
_080E14F2:
	ldrh r0, [r2, 0x22]
	subs r0, 0x4
	strh r0, [r2, 0x22]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x4
	negs r1, r1
	cmp r0, r1
	bge _080E150A
	adds r0, r2, 0
	bl move_anim_8072740
_080E150A:
	pop {r0}
	bx r0
	thumb_func_end sub_80E1198

	thumb_func_start sub_80E11D4
sub_80E11D4: @ 80E1510
	push {lr}
	adds r3, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	cmp r1, 0
	beq _080E1522
	cmp r1, 0x1
	beq _080E1538
	b _080E157A
_080E1522:
	ldrh r0, [r3, 0x26]
	adds r0, 0x4
	strh r0, [r3, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080E157A
	strh r1, [r3, 0x26]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _080E157A
_080E1538:
	ldrh r0, [r3, 0x30]
	adds r0, 0x1
	strh r0, [r3, 0x30]
	lsls r0, 16
	cmp r0, 0
	ble _080E157A
	movs r0, 0
	strh r0, [r3, 0x30]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r2, [r1]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _080E157A
	adds r0, r3, 0
	bl move_anim_8072740
_080E157A:
	pop {r0}
	bx r0
	thumb_func_end sub_80E11D4

	thumb_func_start sub_80E1244
sub_80E1244: @ 80E1580
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E15A0
	adds r1, r0, r1
	ldr r0, _080E15A4
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080E15AC
	ldr r0, _080E15A8
	b _080E15AE
	.align 2, 0
_080E15A0: .4byte gTasks
_080E15A4: .4byte gUnknown_03004B00
_080E15A8: .4byte sub_80E1284
_080E15AC:
	ldr r0, _080E15BC
_080E15AE:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E15BC: .4byte sub_80E143C
	thumb_func_end sub_80E1244

	thumb_func_start sub_80E1284
sub_80E1284: @ 80E15C0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E15E4
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bls _080E15DA
	b _080E176E
_080E15DA:
	lsls r0, 2
	ldr r1, _080E15E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E15E4: .4byte gTasks
_080E15E8: .4byte _080E15EC
	.align 2, 0
_080E15EC:
	.4byte _080E1600
	.4byte _080E1688
	.4byte _080E1698
	.4byte _080E173C
	.4byte _080E1750
_080E1600:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080E1628
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080E1634
	ldr r0, _080E162C
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E1630
	b _080E163C
	.align 2, 0
_080E1628: .4byte gUnknown_0202F7C8
_080E162C: .4byte gUnknown_030042C0
_080E1630: .4byte gUnknown_030041B4
_080E1634:
	ldr r0, _080E1678
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E167C
_080E163C:
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080E1680
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	cmp r1, 0
	bge _080E165E
	movs r0, 0
	strh r0, [r4, 0x24]
_080E165E:
	ldr r2, _080E1684
	movs r3, 0x1C
	ldrsh r1, [r4, r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _080E1742
	.align 2, 0
_080E1678: .4byte gUnknown_03004288
_080E167C: .4byte gUnknown_03004280
_080E1680: .4byte gUnknown_0202F7C8
_080E1684: .4byte gSprites
_080E1688:
	ldrb r0, [r4, 0x1E]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	bl sub_80E1668
	b _080E1742
_080E1698:
	ldrh r0, [r4, 0xC]
	adds r0, 0x6
	movs r1, 0x7F
	ands r0, r1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080E16BA
	movs r0, 0
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
_080E16BA:
	ldr r1, _080E16DC
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 16
	asrs r0, 20
	ldrh r3, [r4, 0xE]
	adds r2, r0, r3
	strh r2, [r4, 0x12]
	movs r1, 0x1E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080E16E4
	ldr r1, _080E16E0
	b _080E16E6
	.align 2, 0
_080E16DC: .4byte gSineTable
_080E16E0: .4byte gUnknown_030041B4
_080E16E4:
	ldr r1, _080E1708
_080E16E6:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0x3F
	ble _080E176E
	ldrh r0, [r4, 0x24]
	movs r1, 0x78
	subs r2, r1, r0
	strh r2, [r4, 0x12]
	movs r3, 0x1E
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080E1710
	ldr r1, _080E170C
	b _080E1712
	.align 2, 0
_080E1708: .4byte gUnknown_03004280
_080E170C: .4byte gUnknown_030041B4
_080E1710:
	ldr r1, _080E1734
_080E1712:
	ldrh r0, [r4, 0x22]
	subs r0, r2
	strh r0, [r1]
	ldr r2, _080E1738
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r2, [r1, 0x20]
	movs r3, 0x88
	lsls r3, 1
	adds r0, r3, 0
	subs r0, r2
	strh r0, [r1, 0x24]
	b _080E1742
	.align 2, 0
_080E1734: .4byte gUnknown_03004280
_080E1738: .4byte gSprites
_080E173C:
	ldr r1, _080E174C
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E1742:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E176E
	.align 2, 0
_080E174C: .4byte gUnknown_03004DC0
_080E1750:
	adds r0, r2, 0
	bl move_anim_task_del
	ldr r2, _080E1774
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_080E176E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1774: .4byte gSprites
	thumb_func_end sub_80E1284

	thumb_func_start sub_80E143C
sub_80E143C: @ 80E1778
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E17B8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r3, r1, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r3]
	movs r4, 0
	strh r4, [r1, 0x24]
	strh r4, [r1, 0x26]
	ldr r0, _080E17BC
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E17C4
	ldr r0, _080E17C0
	b _080E17C6
	.align 2, 0
_080E17B8: .4byte gSprites
_080E17BC: .4byte gUnknown_0202F7C8
_080E17C0: .4byte gUnknown_030041B4
_080E17C4:
	ldr r0, _080E17D4
_080E17C6:
	strh r4, [r0]
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E17D4: .4byte gUnknown_03004280
	thumb_func_end sub_80E143C

	thumb_func_start sub_80E149C
sub_80E149C: @ 80E17D8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E17F8
	adds r1, r0, r1
	ldr r0, _080E17FC
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bne _080E1804
	ldr r0, _080E1800
	b _080E1806
	.align 2, 0
_080E17F8: .4byte gTasks
_080E17FC: .4byte gUnknown_03004B00
_080E1800: .4byte sub_80E14DC
_080E1804:
	ldr r0, _080E1814
_080E1806:
	str r0, [r1]
	ldr r1, [r1]
	adds r0, r2, 0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E1814: .4byte sub_80E1560
	thumb_func_end sub_80E149C

	thumb_func_start sub_80E14DC
sub_80E14DC: @ 80E1818
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E1838
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080E183C
	cmp r5, 0x1
	beq _080E1890
	b _080E1896
	.align 2, 0
_080E1838: .4byte gTasks
_080E183C:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r3, _080E188C
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
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
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r5, [r0, 0x24]
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x22]
	movs r0, 0xA0
	subs r0, r2
	strh r0, [r1, 0x26]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1896
	.align 2, 0
_080E188C: .4byte gSprites
_080E1890:
	adds r0, r2, 0
	bl move_anim_task_del
_080E1896:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80E14DC

	thumb_func_start sub_80E1560
sub_80E1560: @ 80E189C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E18C0
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _080E199E
	lsls r0, 2
	ldr r1, _080E18C4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E18C0: .4byte gTasks
_080E18C4: .4byte _080E18C8
	.align 2, 0
_080E18C8:
	.4byte _080E18DC
	.4byte _080E1930
	.4byte _080E193E
	.4byte _080E1958
	.4byte _080E1998
_080E18DC:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1C]
	ldr r0, _080E1900
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1E]
	cmp r0, 0x1
	bne _080E1908
	ldr r0, _080E1904
	b _080E190A
	.align 2, 0
_080E1900: .4byte gUnknown_0202F7C8
_080E1904: .4byte gUnknown_030042C0
_080E1908:
	ldr r0, _080E1928
_080E190A:
	ldrh r0, [r0]
	strh r0, [r4, 0x20]
	ldr r0, _080E192C
	ldrb r0, [r0]
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	subs r1, 0x20
	strh r1, [r4, 0x24]
	adds r0, 0x20
	strh r0, [r4, 0x26]
	b _080E1986
	.align 2, 0
_080E1928: .4byte gUnknown_03004288
_080E192C: .4byte gUnknown_0202F7C8
_080E1930:
	ldrb r0, [r4, 0x1E]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0
	bl sub_80E1668
	b _080E1986
_080E193E:
	ldr r2, _080E1954
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x60
	strh r1, [r0, 0x26]
	b _080E1986
	.align 2, 0
_080E1954: .4byte gSprites
_080E1958:
	ldr r2, _080E1990
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	subs r1, 0x8
	strh r1, [r0, 0x26]
	movs r0, 0x1C
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E199E
	ldr r1, _080E1994
	movs r0, 0x3
	strb r0, [r1, 0x15]
_080E1986:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E199E
	.align 2, 0
_080E1990: .4byte gSprites
_080E1994: .4byte gUnknown_03004DC0
_080E1998:
	adds r0, r2, 0
	bl move_anim_task_del
_080E199E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1560

	thumb_func_start sub_80E1668
sub_80E1668: @ 80E19A4
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	cmp r0, 0x1
	bne _080E19C8
	ldr r0, _080E19C0
	ldrh r3, [r0]
	ldr r0, _080E19C4
	b _080E19CE
	.align 2, 0
_080E19C0: .4byte gUnknown_030042C0
_080E19C4: .4byte 0x04000014
_080E19C8:
	ldr r0, _080E1A54
	ldrh r3, [r0]
	ldr r0, _080E1A58
_080E19CE:
	str r0, [sp]
	lsls r0, r1, 16
	cmp r0, 0
	bge _080E19D8
	movs r1, 0
_080E19D8:
	lsls r2, r1, 16
	lsls r0, r4, 16
	asrs r4, r0, 16
	cmp r2, r0
	bge _080E1A04
	ldr r5, _080E1A5C
	movs r0, 0xF0
	lsls r0, 3
	adds r6, r5, r0
_080E19EA:
	asrs r2, 16
	lsls r1, r2, 1
	adds r0, r1, r5
	strh r3, [r0]
	adds r1, r6
	strh r3, [r1]
	adds r2, 0x1
	lsls r2, 16
	lsrs r1, r2, 16
	lsls r2, r1, 16
	asrs r0, r2, 16
	cmp r0, r4
	blt _080E19EA
_080E1A04:
	lsls r1, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	bgt _080E1A32
	ldr r4, _080E1A5C
	lsls r0, r3, 16
	asrs r0, 16
	adds r3, r0, 0
	adds r3, 0xF0
	movs r0, 0xF0
	lsls r0, 3
	adds r5, r4, r0
_080E1A1C:
	asrs r2, r1, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	strh r3, [r0]
	adds r1, r5
	strh r3, [r1]
	adds r2, 0x1
	lsls r1, r2, 16
	asrs r0, r1, 16
	cmp r0, 0x9F
	ble _080E1A1C
_080E1A32:
	ldr r0, _080E1A60
	str r0, [sp, 0x4]
	mov r1, sp
	movs r2, 0
	movs r0, 0x1
	strb r0, [r1, 0x8]
	mov r0, sp
	strb r2, [r0, 0x9]
	ldr r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, [sp, 0x8]
	bl sub_80895F8
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1A54: .4byte gUnknown_03004288
_080E1A58: .4byte 0x04000018
_080E1A5C: .4byte gUnknown_03004DE0
_080E1A60: .4byte 0xa2600001
	thumb_func_end sub_80E1668

	thumb_func_start sub_80E1728
sub_80E1728: @ 80E1A64
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _080E1A78
	movs r2, 0
	ldrsh r1, [r0, r2]
	adds r7, r0, 0
	cmp r1, 0
	bne _080E1A80
	ldr r0, _080E1A7C
	b _080E1A82
	.align 2, 0
_080E1A78: .4byte gUnknown_03004B00
_080E1A7C: .4byte gUnknown_0202F7C8
_080E1A80:
	ldr r0, _080E1AE4
_080E1A82:
	ldrb r4, [r0]
	movs r6, 0x18
	adds r1, r7, 0
	movs r2, 0x2
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	bne _080E1A9E
	negs r0, r6
	lsls r0, 16
	lsrs r6, r0, 16
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	negs r0, r0
	strh r0, [r1, 0x4]
_080E1A9E:
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, r6
	strh r0, [r5, 0x20]
	adds r0, r4, 0
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1E
	strh r0, [r5, 0x22]
	ldrh r1, [r7, 0xA]
	strh r1, [r5, 0x2E]
	ldrh r1, [r7, 0x4]
	ldrh r2, [r5, 0x20]
	adds r1, r2
	strh r1, [r5, 0x32]
	ldrh r1, [r7, 0x6]
	adds r0, r1
	strh r0, [r5, 0x36]
	ldrh r0, [r7, 0x8]
	strh r0, [r5, 0x38]
	adds r0, r5, 0
	bl sub_80786EC
	ldr r0, _080E1AE8
	str r0, [r5, 0x1C]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1AE4: .4byte gUnknown_0202F7C9
_080E1AE8: .4byte sub_80E17B0
	thumb_func_end sub_80E1728

	thumb_func_start sub_80E17B0
sub_80E17B0: @ 80E1AEC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080E1B00
	adds r0, r4, 0
	bl move_anim_8072740
_080E1B00:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E17B0

	thumb_func_start sub_80E17CC
sub_80E17CC: @ 80E1B08
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _080E1B1C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E1B24
	ldr r0, _080E1B20
	b _080E1B26
	.align 2, 0
_080E1B1C: .4byte gUnknown_03004B00
_080E1B20: .4byte gUnknown_0202F7C8
_080E1B24:
	ldr r0, _080E1B84
_080E1B26:
	ldrb r5, [r0]
	adds r0, r5, 0
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E1B88
	adds r0, r2
	ldr r4, _080E1B8C
	movs r3, 0x2
	ldrsh r1, [r4, r3]
	lsls r1, 5
	adds r0, r1
	strh r0, [r6, 0x20]
	adds r0, r5, 0
	bl sub_8077FC0
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x20
	strh r0, [r6, 0x22]
	ldrh r2, [r6, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	lsls r0, 3
	adds r1, r0
	ldr r3, _080E1B90
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080E1B94
	ands r0, r2
	orrs r0, r1
	strh r0, [r6, 0x4]
	ldr r1, _080E1B98
	adds r0, r6, 0
	bl oamt_set_x3A_32
	ldrh r0, [r4, 0x4]
	strh r0, [r6, 0x2E]
	ldr r0, _080E1B9C
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1B84: .4byte gUnknown_0202F7C9
_080E1B88: .4byte 0x0000fff0
_080E1B8C: .4byte gUnknown_03004B00
_080E1B90: .4byte 0x000003ff
_080E1B94: .4byte 0xfffffc00
_080E1B98: .4byte move_anim_8072740
_080E1B9C: .4byte sub_80782D8
	thumb_func_end sub_80E17CC

	thumb_func_start sub_80E1864
sub_80E1864: @ 80E1BA0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080E1BC4
	adds r4, r0, r1
	ldr r0, _080E1BC8
	ldrh r2, [r0, 0x2]
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	adds r6, r0, 0
	cmp r1, 0
	beq _080E1BCC
	adds r0, r2, 0x3
	b _080E1BD8
	.align 2, 0
_080E1BC4: .4byte gTasks
_080E1BC8: .4byte gUnknown_03004B00
_080E1BCC:
	ldr r0, _080E1BF8
	ldrh r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	adds r0, 0x3
_080E1BD8:
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x24]
	adds r1, r6, 0
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0xE]
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x4
	beq _080E1C04
	cmp r0, 0x5
	bne _080E1C44
	ldr r0, _080E1BFC
	ldrh r0, [r0]
	strh r0, [r4, 0x22]
	ldr r0, _080E1C00
	b _080E1C62
	.align 2, 0
_080E1BF8: .4byte gUnknown_0202F7BC
_080E1BFC: .4byte gUnknown_030041B0
_080E1C00: .4byte sub_80E1934
_080E1C04:
	movs r0, 0
	strh r0, [r4, 0x22]
	movs r5, 0
_080E1C0A:
	lsls r0, r5, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080E1C34
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	adds r0, 0x9
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x8
	adds r1, r0
	ldr r0, _080E1C40
	adds r0, r5, r0
	ldrb r0, [r0]
	strh r0, [r1]
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_080E1C34:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080E1C0A
	b _080E1C60
	.align 2, 0
_080E1C40: .4byte gUnknown_02024BE0
_080E1C44:
	ldrb r0, [r6]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x1A]
	cmp r0, 0xFF
	bne _080E1C5C
	adds r0, r5, 0
	bl move_anim_task_del
	b _080E1C64
_080E1C5C:
	movs r0, 0x1
	strh r0, [r4, 0x22]
_080E1C60:
	ldr r0, _080E1C6C
_080E1C62:
	str r0, [r4]
_080E1C64:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E1C6C: .4byte sub_80E1A2C
	thumb_func_end sub_80E1864

	thumb_func_start sub_80E1934
sub_80E1934: @ 80E1C70
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E1C94
	adds r3, r0, r1
	movs r0, 0x8
	ldrsh r1, [r3, r0]
	cmp r1, 0x1
	beq _080E1CF4
	cmp r1, 0x1
	bgt _080E1C98
	cmp r1, 0
	beq _080E1C9E
	b _080E1D60
	.align 2, 0
_080E1C94: .4byte gTasks
_080E1C98:
	cmp r1, 0x2
	beq _080E1D54
	b _080E1D60
_080E1C9E:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1D60
	strh r1, [r3, 0xA]
	ldrh r1, [r3, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E1CC8
	ldr r1, _080E1CC4
	ldrh r0, [r3, 0x26]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080E1CD2
	.align 2, 0
_080E1CC4: .4byte gUnknown_030041B0
_080E1CC8:
	ldr r0, _080E1CF0
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x26]
	subs r1, r2
	strh r1, [r0]
_080E1CD2:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r3, r2]
	cmp r0, r1
	bne _080E1D60
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	b _080E1D48
	.align 2, 0
_080E1CF0: .4byte gUnknown_030041B0
_080E1CF4:
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1D60
	movs r0, 0
	strh r0, [r3, 0xA]
	ldrh r0, [r3, 0xC]
	ands r1, r0
	cmp r1, 0
	bne _080E1D20
	ldr r1, _080E1D1C
	ldrh r0, [r3, 0x24]
	ldrh r2, [r3, 0x22]
	adds r0, r2
	strh r0, [r1]
	b _080E1D2A
	.align 2, 0
_080E1D1C: .4byte gUnknown_030041B0
_080E1D20:
	ldr r0, _080E1D50
	ldrh r1, [r3, 0x22]
	ldrh r2, [r3, 0x24]
	subs r1, r2
	strh r1, [r0]
_080E1D2A:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080E1D60
	movs r0, 0
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x24]
	subs r0, 0x1
	strh r0, [r3, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080E1D60
_080E1D48:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080E1D60
	.align 2, 0
_080E1D50: .4byte gUnknown_030041B0
_080E1D54:
	ldr r1, _080E1D64
	ldrh r0, [r3, 0x22]
	strh r0, [r1]
	adds r0, r2, 0
	bl move_anim_task_del
_080E1D60:
	pop {r0}
	bx r0
	.align 2, 0
_080E1D64: .4byte gUnknown_030041B0
	thumb_func_end sub_80E1934

	thumb_func_start sub_80E1A2C
sub_80E1A2C: @ 80E1D68
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080E1D8C
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080E1DC8
	cmp r5, 0x1
	bgt _080E1D90
	cmp r5, 0
	beq _080E1D96
	b _080E1E42
	.align 2, 0
_080E1D8C: .4byte gTasks
_080E1D90:
	cmp r5, 0x2
	beq _080E1E04
	b _080E1E42
_080E1D96:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1E42
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80E1B10
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080E1E42
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	b _080E1DFC
_080E1DC8:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	movs r5, 0
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E1E42
	strh r5, [r4, 0xA]
	adds r0, r4, 0
	bl sub_80E1B10
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080E1E42
	strh r5, [r4, 0xC]
	ldrh r0, [r4, 0x24]
	subs r0, 0x1
	strh r0, [r4, 0x24]
	lsls r0, 16
	cmp r0, 0
	bne _080E1E42
_080E1DFC:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E1E42
_080E1E04:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r4, r7]
	cmp r2, r0
	bge _080E1E3C
	ldr r0, _080E1E48
	mov r12, r0
	adds r5, r4, 0
	adds r5, 0x8
	movs r6, 0
_080E1E18:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r12
	strh r6, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r2, r0
	blt _080E1E18
_080E1E3C:
	adds r0, r3, 0
	bl move_anim_task_del
_080E1E42:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1E48: .4byte gSprites
	thumb_func_end sub_80E1A2C

	thumb_func_start sub_80E1B10
sub_80E1B10: @ 80E1E4C
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0xC]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	bne _080E1E74
	movs r0, 0x24
	ldrsh r1, [r3, r0]
	lsrs r0, r1, 31
	adds r1, r0
	asrs r1, 1
	ldrh r2, [r3, 0x24]
	adds r0, r4, 0
	ands r0, r2
	adds r1, r0
	lsls r1, 16
	lsrs r4, r1, 16
	b _080E1E84
_080E1E74:
	movs r1, 0x24
	ldrsh r0, [r3, r1]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	negs r0, r0
	lsls r0, 16
	lsrs r4, r0, 16
_080E1E84:
	movs r2, 0
	movs r7, 0x22
	ldrsh r0, [r3, r7]
	cmp r2, r0
	bge _080E1EB8
	ldr r6, _080E1EC0
	adds r5, r3, 0
	adds r5, 0x8
_080E1E94:
	adds r0, r2, 0
	adds r0, 0x9
	lsls r0, 1
	adds r0, r5, r0
	movs r7, 0
	ldrsh r1, [r0, r7]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r4, [r0, 0x24]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0x22
	ldrsh r0, [r3, r1]
	cmp r2, r0
	blt _080E1E94
_080E1EB8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1EC0: .4byte gSprites
	thumb_func_end sub_80E1B10

	thumb_func_start sub_80E1B88
sub_80E1B88: @ 80E1EC4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080E1EE4
	movs r2, 0
	ldr r0, _080E1EE8
	ldrh r0, [r0]
	cmp r0, 0x63
	bls _080E1ED8
	movs r2, 0x1
_080E1ED8:
	strh r2, [r3, 0x1E]
	adds r0, r1, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080E1EE4: .4byte gUnknown_03004B00
_080E1EE8: .4byte gUnknown_0202F7BC
	thumb_func_end sub_80E1B88

	thumb_func_start sub_80E1BB0
sub_80E1BB0: @ 80E1EEC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r2, _080E1F04
	ldrh r1, [r2]
	movs r0, 0x1
	ands r0, r1
	adds r6, r2, 0
	cmp r0, 0
	beq _080E1F0C
	ldr r0, _080E1F08
	b _080E1F0E
	.align 2, 0
_080E1F04: .4byte gUnknown_03004B00
_080E1F08: .4byte gUnknown_0202F7C9
_080E1F0C:
	ldr r0, _080E1F7C
_080E1F0E:
	ldrb r0, [r0]
	adds r5, r0, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x1
	ble _080E1F1E
	movs r0, 0x2
	eors r5, r0
_080E1F1E:
	ldr r0, _080E1F80
	ldrb r1, [r6, 0x2]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080E1F84
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x20
	subs r1, r0
	ldr r2, _080E1F88
	adds r0, r2, 0
	ands r1, r0
	strh r1, [r4, 0xA]
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x40
	subs r1, r0
	movs r0, 0xFF
	ands r1, r0
	strh r1, [r4, 0xC]
	ldr r2, _080E1F8C
	ldrh r0, [r4, 0xA]
	strh r0, [r2]
	ldr r0, _080E1F90
	strh r1, [r0]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0xE]
	adds r0, r7, 0
	bl move_anim_task_del
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E1F7C: .4byte gUnknown_0202F7C8
_080E1F80: .4byte sub_80E1C58
_080E1F84: .4byte gTasks
_080E1F88: .4byte 0x000001ff
_080E1F8C: .4byte gUnknown_030041B0
_080E1F90: .4byte gUnknown_030041B8
	thumb_func_end sub_80E1BB0

	thumb_func_start sub_80E1C58
sub_80E1C58: @ 80E1F94
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080E1FC4
	adds r2, r0, r1
	ldr r0, _080E1FC8
	movs r4, 0xE
	ldrsh r1, [r0, r4]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _080E1FD4
	ldr r0, _080E1FCC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E1FD0
	strh r1, [r0]
	adds r0, r3, 0
	bl DestroyTask
	b _080E1FE0
	.align 2, 0
_080E1FC4: .4byte gTasks
_080E1FC8: .4byte gUnknown_03004B00
_080E1FCC: .4byte gUnknown_030041B0
_080E1FD0: .4byte gUnknown_030041B8
_080E1FD4:
	ldr r1, _080E1FE8
	ldrh r0, [r2, 0xA]
	strh r0, [r1]
	ldr r1, _080E1FEC
	ldrh r0, [r2, 0xC]
	strh r0, [r1]
_080E1FE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E1FE8: .4byte gUnknown_030041B0
_080E1FEC: .4byte gUnknown_030041B8
	thumb_func_end sub_80E1C58

	thumb_func_start sub_80E1CB4
sub_80E1CB4: @ 80E1FF0
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E2028
	ldrh r0, [r5]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldr r0, _080E202C
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080E2030
	ldrh r0, [r5, 0x6]
	negs r0, r0
	strh r0, [r4, 0x30]
	movs r0, 0x1
	strh r0, [r4, 0x36]
	b _080E203E
	.align 2, 0
_080E2028: .4byte gUnknown_03004B00
_080E202C: .4byte gUnknown_0202F7C8
_080E2030:
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x36]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
_080E203E:
	ldr r0, _080E2054
	ldrh r0, [r0, 0x8]
	strh r0, [r4, 0x34]
	ldr r1, _080E2058
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2054: .4byte gUnknown_03004B00
_080E2058: .4byte sub_80E1D20
	thumb_func_end sub_80E1CB4

	thumb_func_start sub_80E1D20
sub_80E1D20: @ 80E205C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x1E
	bl Cos
	strh r0, [r4, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x2E]
	cmp r0, 0x7F
	bhi _080E208E
	ldrb r0, [r4, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x5]
	b _080E2096
_080E208E:
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
_080E2096:
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x2E]
	adds r0, r1
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080E20BA
	adds r0, r4, 0
	bl move_anim_8072740
_080E20BA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1D20

	thumb_func_start sub_80E1D84
sub_80E1D84: @ 80E20C0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r4, _080E20F8
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrh r4, [r4, 0x8]
	str r4, [sp]
	bl BeginNormalPaletteFade
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E20FC
	str r0, [r5, 0x1C]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E20F8: .4byte gUnknown_03004B00
_080E20FC: .4byte sub_80E1E0C
	thumb_func_end sub_80E1D84

	thumb_func_start sub_80E1DC4
sub_80E1DC4: @ 80E2100
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x1
	mov r8, r0
	mov r1, r8
	ands r1, r4
	mov r8, r1
	lsls r0, 16
	asrs r1, r0, 17
	ands r1, r4
	asrs r2, r0, 18
	ands r2, r4
	asrs r3, r0, 19
	ands r3, r4
	asrs r6, r0, 20
	ands r6, r4
	asrs r5, r0, 21
	ands r5, r4
	asrs r0, 22
	ands r0, r4
	str r6, [sp]
	str r5, [sp, 0x4]
	str r0, [sp, 0x8]
	mov r0, r8
	bl sub_80791A8
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80E1DC4

	thumb_func_start sub_80E1E0C
sub_80E1E0C: @ 80E2148
	push {lr}
	adds r2, r0, 0
	ldr r0, _080E2164
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E215E
	adds r0, r2, 0
	bl move_anim_8072740
_080E215E:
	pop {r0}
	bx r0
	.align 2, 0
_080E2164: .4byte gPaletteFade
	thumb_func_end sub_80E1E0C

	thumb_func_start sub_80E1E2C
sub_80E1E2C: @ 80E2168
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E21B4
	ldrh r0, [r4, 0x2]
	strh r0, [r5, 0x2E]
	strh r0, [r5, 0x30]
	ldrh r0, [r4, 0x4]
	strh r0, [r5, 0x32]
	ldrh r0, [r4, 0x6]
	strh r0, [r5, 0x34]
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x36]
	ldrh r0, [r4, 0xA]
	strh r0, [r5, 0x38]
	ldrh r0, [r4, 0xC]
	strh r0, [r5, 0x3A]
	ldrh r0, [r4]
	strh r0, [r5, 0x3C]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	bl sub_80E1DC4
	ldrb r1, [r4, 0x8]
	ldrh r2, [r4, 0x6]
	bl BlendPalettes
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080E21B8
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E21B4: .4byte gUnknown_03004B00
_080E21B8: .4byte sub_80E1E80
	thumb_func_end sub_80E1E2C

	thumb_func_start sub_80E1E80
sub_80E1E80: @ 80E21BC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080E21D0
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080E2240
_080E21D0:
	ldr r0, _080E21EC
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E2240
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E21F4
	ldr r0, _080E21F0
	str r0, [r4, 0x1C]
	b _080E2240
	.align 2, 0
_080E21EC: .4byte gPaletteFade
_080E21F0: .4byte sub_80E1F0C
_080E21F4:
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	bl sub_80E1DC4
	adds r3, r0, 0
	ldrh r1, [r4, 0x30]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080E221A
	ldrh r1, [r4, 0x36]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x34]
	adds r0, r3, 0
	bl BlendPalettes
	b _080E2228
_080E221A:
	ldrh r1, [r4, 0x3A]
	lsls r1, 24
	lsrs r1, 24
	ldrh r2, [r4, 0x38]
	adds r0, r3, 0
	bl BlendPalettes
_080E2228:
	ldrh r0, [r4, 0x30]
	movs r2, 0x80
	lsls r2, 1
	adds r1, r2, 0
	eors r0, r1
	strh r0, [r4, 0x30]
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x32]
	subs r0, 0x1
	strh r0, [r4, 0x32]
_080E2240:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80E1E80

	thumb_func_start sub_80E1F0C
sub_80E1F0C: @ 80E2248
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2274
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E226E
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0
	movs r2, 0
	bl BlendPalettes
	adds r0, r4, 0
	bl move_anim_8072740
_080E226E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2274: .4byte gPaletteFade
	thumb_func_end sub_80E1F0C

	thumb_func_start sub_80E1F3C
sub_80E1F3C: @ 80E2278
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _080E22BC
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	movs r2, 0
	strh r0, [r4, 0x20]
	ldrh r0, [r1, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	strh r2, [r4, 0x2E]
	movs r0, 0xA
	strh r0, [r4, 0x30]
	movs r0, 0x8
	strh r0, [r4, 0x32]
	movs r0, 0x28
	strh r0, [r4, 0x34]
	movs r0, 0x70
	strh r0, [r4, 0x36]
	strh r2, [r4, 0x38]
	ldr r1, _080E22C0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r1, _080E22C4
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E22BC: .4byte gUnknown_03004B00
_080E22C0: .4byte move_anim_8074EE0
_080E22C4: .4byte sub_8078174
	thumb_func_end sub_80E1F3C

	thumb_func_start sub_80E1F8C
sub_80E1F8C: @ 80E22C8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E230C
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080E2310
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80E1FDC
	ldr r0, _080E2314
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E230C: .4byte gTasks
_080E2310: .4byte gUnknown_03004B00
_080E2314: .4byte sub_80E202C
	thumb_func_end sub_80E1F8C

	thumb_func_start sub_80E1FDC
sub_80E1FDC: @ 80E2318
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080E2364
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r2, [r4, 0x12]
	str r2, [sp]
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2364: .4byte gTasks
	thumb_func_end sub_80E1FDC

	thumb_func_start sub_80E202C
sub_80E202C: @ 80E2368
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080E23A0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E23CA
	ldr r1, _080E23A4
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080E23C4
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E23A8
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080E23AC
	.align 2, 0
_080E23A0: .4byte gPaletteFade
_080E23A4: .4byte gTasks
_080E23A8:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080E23AC:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080E23BC
	movs r2, 0
_080E23BC:
	adds r0, r4, 0
	bl sub_80E1FDC
	b _080E23CA
_080E23C4:
	adds r0, r4, 0
	bl move_anim_task_del
_080E23CA:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E202C

	thumb_func_start sub_80E2094
sub_80E2094: @ 80E23D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E2414
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r3, _080E2418
	ldrh r1, [r3]
	movs r5, 0
	strh r1, [r4, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r4, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r4, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r4, 0xE]
	ldrh r2, [r3, 0x8]
	strh r2, [r4, 0x10]
	ldrh r1, [r3, 0xA]
	strh r1, [r4, 0x12]
	strh r5, [r4, 0x18]
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	bl sub_80E20E4
	ldr r0, _080E241C
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2414: .4byte gTasks
_080E2418: .4byte gUnknown_03004B00
_080E241C: .4byte sub_80E2140
	thumb_func_end sub_80E2094

	thumb_func_start sub_80E20E4
sub_80E20E4: @ 80E2420
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r1, 0
	adds r6, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080E2478
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrh r0, [r4, 0x8]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	movs r1, 0xA
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x18]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x18]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2478: .4byte gTasks
	thumb_func_end sub_80E20E4

	thumb_func_start sub_80E2140
sub_80E2140: @ 80E247C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	adds r4, r3, 0
	ldr r0, _080E24B4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E24DE
	ldr r1, _080E24B8
	lsls r2, r3, 2
	adds r0, r2, r3
	lsls r0, 3
	adds r3, r0, r1
	movs r5, 0xC
	ldrsh r0, [r3, r5]
	adds r6, r1, 0
	adds r5, r2, 0
	cmp r0, 0
	ble _080E24D8
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080E24BC
	ldrb r1, [r3, 0xE]
	ldrb r2, [r3, 0x10]
	b _080E24C0
	.align 2, 0
_080E24B4: .4byte gPaletteFade
_080E24B8: .4byte gTasks
_080E24BC:
	ldrb r1, [r3, 0x10]
	ldrb r2, [r3, 0xE]
_080E24C0:
	adds r0, r5, r4
	lsls r0, 3
	adds r0, r6
	movs r3, 0xC
	ldrsh r0, [r0, r3]
	cmp r0, 0x1
	bne _080E24D0
	movs r2, 0
_080E24D0:
	adds r0, r4, 0
	bl sub_80E20E4
	b _080E24DE
_080E24D8:
	adds r0, r4, 0
	bl move_anim_task_del
_080E24DE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2140

	thumb_func_start sub_80E21A8
sub_80E21A8: @ 80E24E4
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E2544
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldr r5, _080E2548
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x8]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0xA]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0xC]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0xE]
	ldrh r0, [r5, 0x8]
	strh r0, [r4, 0x10]
	ldrh r0, [r5, 0xA]
	strh r0, [r4, 0x12]
	ldrh r0, [r5, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r5]
	strh r0, [r4, 0x16]
	ldrh r0, [r5]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	ldrb r3, [r5, 0x8]
	ldrh r0, [r5, 0x6]
	str r0, [sp]
	adds r0, r1, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080E254C
	str r0, [r4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2544: .4byte gTasks
_080E2548: .4byte gUnknown_03004B00
_080E254C: .4byte sub_80E2214
	thumb_func_end sub_80E21A8

	thumb_func_start sub_80E2214
sub_80E2214: @ 80E2550
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E2574
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080E2578
	subs r0, r1, 0x1
	strh r0, [r4, 0x8]
	b _080E25FC
	.align 2, 0
_080E2574: .4byte gTasks
_080E2578:
	ldr r0, _080E2594
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E25FC
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bne _080E259C
	ldr r0, _080E2598
	str r0, [r4]
	b _080E25FC
	.align 2, 0
_080E2594: .4byte gPaletteFade
_080E2598: .4byte sub_80E22CC
_080E259C:
	ldrh r0, [r4, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r2, 0x1
	lsls r2, r0
	ldrh r1, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080E25CA
	ldrb r3, [r4, 0x10]
	ldrh r0, [r4, 0xE]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
	b _080E25DA
_080E25CA:
	ldrb r3, [r4, 0x14]
	ldrh r0, [r4, 0x12]
	str r0, [sp]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r3, 0
	bl BeginNormalPaletteFade
_080E25DA:
	ldr r0, _080E2604
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	movs r3, 0x80
	lsls r3, 1
	adds r2, r3, 0
	eors r0, r2
	strh r0, [r1, 0xA]
	movs r2, 0xFF
	ands r0, r2
	strh r0, [r1, 0x8]
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
_080E25FC:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2604: .4byte gTasks
	thumb_func_end sub_80E2214

	thumb_func_start sub_80E22CC
sub_80E22CC: @ 80E2608
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E2658
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _080E264E
	ldr r1, _080E265C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x16]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	str r5, [sp]
	adds r0, r1, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl BeginNormalPaletteFade
	adds r0, r4, 0
	bl move_anim_task_del
_080E264E:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2658: .4byte gPaletteFade
_080E265C: .4byte gTasks
	thumb_func_end sub_80E22CC

	thumb_func_start sub_80E2324
sub_80E2324: @ 80E2660
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r2, 0
	ldr r0, _080E26D8
	ldrb r6, [r0]
	ldr r0, _080E26DC
	ldrb r7, [r0]
	ldr r4, _080E26E0
	ldrh r1, [r4]
	movs r5, 0x80
	lsls r5, 1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E269A
	str r2, [sp]
	str r2, [sp, 0x4]
	str r2, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r3, 0
	bl sub_80791A8
	adds r2, r0, 0
_080E269A:
	ldrh r1, [r4, 0x2]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E26AC
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r6
	orrs r2, r0
_080E26AC:
	ldrh r1, [r4, 0x4]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080E26BE
	movs r0, 0x80
	lsls r0, 9
	lsls r0, r7
	orrs r2, r0
_080E26BE:
	adds r0, r2, 0
	bl InvertPlttBuffer
	mov r0, r8
	bl move_anim_task_del
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E26D8: .4byte gUnknown_0202F7C8
_080E26DC: .4byte gUnknown_0202F7C9
_080E26E0: .4byte gUnknown_03004B00
	thumb_func_end sub_80E2324

	thumb_func_start unref_sub_80E23A8
unref_sub_80E23A8: @ 80E26E4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r1, _080E27D8
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E2726
	ldr r1, _080E27DC
	ldrh r0, [r1]
	strh r0, [r4, 0xC]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0xE]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x10]
	ldrh r0, [r1, 0x6]
	strh r0, [r4, 0xA]
	ldrh r0, [r1, 0x8]
	strh r0, [r4, 0x12]
	ldrh r0, [r1, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r1, 0xC]
	strh r0, [r4, 0x16]
_080E2726:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _080E27E0
	ldrb r0, [r0]
	mov r9, r0
	ldr r0, _080E27E4
	ldrb r0, [r0]
	mov r10, r0
	ldrh r1, [r4, 0xC]
	movs r7, 0x80
	lsls r7, 1
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2748
	ldr r5, _080E27E8
_080E2748:
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _080E2778
	ldr r2, _080E27EC
	ldr r0, _080E27F0
	add r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x14
	adds r0, r2
	ldr r0, [r0]
	ldrh r0, [r0, 0x2]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r1, r6, 0
	lsls r1, r0
	lsls r1, 16
	orrs r5, r1
_080E2778:
	ldrh r1, [r4, 0xE]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E278C
	adds r0, r6, 0
	mov r2, r9
	lsls r0, r2
	lsls r0, 16
	orrs r5, r0
_080E278C:
	ldrh r1, [r4, 0x10]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	beq _080E27A0
	adds r0, r6, 0
	mov r1, r10
	lsls r0, r1
	lsls r0, 16
	orrs r5, r0
_080E27A0:
	movs r1, 0x12
	ldrsb r1, [r4, r1]
	movs r2, 0x14
	ldrsb r2, [r4, r2]
	movs r3, 0x16
	ldrsb r3, [r4, r3]
	adds r0, r5, 0
	bl TintPlttBuffer
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E27CA
	adds r0, r5, 0
	bl UnfadePlttBuffer
	mov r0, r8
	bl move_anim_task_del
_080E27CA:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E27D8: .4byte gTasks
_080E27DC: .4byte gUnknown_03004B00
_080E27E0: .4byte gUnknown_0202F7C8
_080E27E4: .4byte gUnknown_0202F7C9
_080E27E8: .4byte 0x0000ffff
_080E27EC: .4byte gSprites
_080E27F0: .4byte gUnknown_03004340
	thumb_func_end unref_sub_80E23A8

	thumb_func_start sub_80E24B8
sub_80E24B8: @ 80E27F4
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080E2828
	ldrh r0, [r1]
	negs r0, r0
	strh r0, [r4, 0x2E]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x30]
	strh r0, [r4, 0x32]
	ldrh r0, [r1, 0x4]
	strh r0, [r4, 0x34]
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _080E283C
	cmp r0, 0x1
	bgt _080E282C
	cmp r0, 0
	beq _080E2832
	b _080E2854
	.align 2, 0
_080E2828: .4byte gUnknown_03004B00
_080E282C:
	cmp r0, 0x2
	beq _080E2844
	b _080E2854
_080E2832:
	ldr r1, _080E2838
	b _080E2846
	.align 2, 0
_080E2838: .4byte gUnknown_030041B0
_080E283C:
	ldr r1, _080E2840
	b _080E2846
	.align 2, 0
_080E2840: .4byte gUnknown_030041B8
_080E2844:
	ldr r1, _080E2850
_080E2846:
	adds r0, r4, 0
	bl oamt_set_x3A_32
	b _080E285C
	.align 2, 0
_080E2850: .4byte gSpriteCoordOffsetX
_080E2854:
	ldr r1, _080E288C
	adds r0, r4, 0
	bl oamt_set_x3A_32
_080E285C:
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r0, 16
	orrs r1, r0
	ldr r0, [r1]
	strh r0, [r4, 0x36]
	ldr r0, _080E2890
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080E2880
	bl sub_80E260C
_080E2880:
	ldr r0, _080E2894
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E288C: .4byte gSpriteCoordOffsetY
_080E2890: .4byte gUnknown_03004B00
_080E2894: .4byte sub_80E255C
	thumb_func_end sub_80E24B8

	thumb_func_start sub_80E255C
sub_80E255C: @ 80E2898
	push {r4-r7,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x34]
	movs r2, 0x34
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080E28DC
	subs r0, r1, 0x1
	strh r0, [r3, 0x34]
	ldrh r1, [r3, 0x30]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _080E28BA
	subs r0, r1, 0x1
	strh r0, [r3, 0x30]
	b _080E2936
_080E28BA:
	ldrh r0, [r3, 0x32]
	strh r0, [r3, 0x30]
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	movs r0, 0x2E
	ldrsh r2, [r3, r0]
	ldr r0, [r1]
	adds r0, r2
	str r0, [r1]
	ldrh r0, [r3, 0x2E]
	negs r0, r0
	strh r0, [r3, 0x2E]
	b _080E2936
_080E28DC:
	movs r2, 0x3A
	ldrsh r1, [r3, r2]
	movs r2, 0x3C
	ldrsh r0, [r3, r2]
	lsls r0, 16
	orrs r1, r0
	movs r2, 0x36
	ldrsh r0, [r3, r2]
	str r0, [r1]
	ldrh r0, [r3, 0x38]
	subs r0, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080E2930
	movs r4, 0
	ldr r5, _080E293C
	ldrb r0, [r5]
	cmp r4, r0
	bcs _080E2930
	ldr r2, _080E2940
	mov r12, r2
	ldr r6, _080E2944
	movs r7, 0x3
	negs r7, r7
_080E290E:
	adds r0, r4, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r12
	adds r1, 0x3E
	ldrb r2, [r1]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r5]
	cmp r4, r0
	bcc _080E290E
_080E2930:
	adds r0, r3, 0
	bl move_anim_8072740
_080E2936:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E293C: .4byte gUnknown_02024A68
_080E2940: .4byte gSprites
_080E2944: .4byte gUnknown_02024BE0
	thumb_func_end sub_80E255C

	thumb_func_start sub_80E260C
sub_80E260C: @ 80E2948
	push {r4-r6,lr}
	ldr r6, _080E29BC
	ldr r4, _080E29C0
	ldr r5, _080E29C4
	ldrb r0, [r5]
	adds r0, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x3
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	strb r0, [r1]
	ldr r3, _080E29C8
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	ands r2, r1
	strb r2, [r0]
	ldr r0, _080E29CC
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x2
	bne _080E29D0
	ldrb r0, [r5]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r3]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	b _080E29EC
	.align 2, 0
_080E29BC: .4byte gSprites
_080E29C0: .4byte gUnknown_02024BE0
_080E29C4: .4byte gUnknown_0202F7C8
_080E29C8: .4byte gUnknown_0202F7C9
_080E29CC: .4byte gUnknown_03004B00
_080E29D0:
	cmp r0, 0
	bne _080E29D8
	ldrb r0, [r5]
	b _080E29DA
_080E29D8:
	ldrb r0, [r3]
_080E29DA:
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x2
_080E29EC:
	orrs r1, r2
	strb r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E260C

	thumb_func_start sub_80E26BC
sub_80E26BC: @ 80E29F8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080E2A38
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r1
	ldr r3, _080E2A3C
	ldrh r1, [r3]
	strh r1, [r2, 0x8]
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xA]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x18]
	ldr r4, _080E2A40
	ldrh r1, [r3]
	strh r1, [r4]
	ldr r4, _080E2A44
	ldrh r1, [r3, 0x2]
	strh r1, [r4]
	ldr r1, _080E2A48
	str r1, [r2]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2A38: .4byte gTasks
_080E2A3C: .4byte gUnknown_03004B00
_080E2A40: .4byte gUnknown_030041B0
_080E2A44: .4byte gUnknown_030041B8
_080E2A48: .4byte sub_80E2710
	thumb_func_end sub_80E26BC

	thumb_func_start sub_80E2710
sub_80E2710: @ 80E2A4C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E2A7C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	mov r12, r1
	cmp r0, 0
	bne _080E2AD2
	ldr r0, _080E2A80
	ldrh r2, [r0]
	movs r7, 0x8
	ldrsh r1, [r3, r7]
	adds r6, r0, 0
	cmp r2, r1
	bne _080E2A84
	ldrh r0, [r3, 0x8]
	negs r0, r0
	b _080E2A86
	.align 2, 0
_080E2A7C: .4byte gTasks
_080E2A80: .4byte gUnknown_030041B0
_080E2A84:
	ldrh r0, [r3, 0x8]
_080E2A86:
	strh r0, [r6]
	ldr r2, _080E2AA4
	ldrh r3, [r2]
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	mov r7, r12
	adds r4, r0, r7
	movs r7, 0xA
	ldrsh r0, [r4, r7]
	cmn r3, r0
	bne _080E2AA8
	movs r0, 0
	b _080E2AAC
	.align 2, 0
_080E2AA4: .4byte gUnknown_030041B8
_080E2AA8:
	ldrh r0, [r4, 0xA]
	negs r0, r0
_080E2AAC:
	strh r0, [r2]
	adds r0, r1, r5
	lsls r0, 3
	add r0, r12
	ldrh r1, [r0, 0x18]
	strh r1, [r0, 0xE]
	ldrh r1, [r0, 0xC]
	subs r1, 0x1
	strh r1, [r0, 0xC]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0
	bne _080E2AD6
	strh r1, [r6]
	strh r1, [r2]
	adds r0, r5, 0
	bl move_anim_task_del
	b _080E2AD6
_080E2AD2:
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
_080E2AD6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2710

	thumb_func_start sub_80E27A0
sub_80E27A0: @ 80E2ADC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E2AFC
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E2B00
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E2B08
	.align 2, 0
_080E2AFC: .4byte gUnknown_03004B00
_080E2B00:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E2B08:
	ldr r0, _080E2B1C
	str r0, [r5, 0x1C]
	ldr r1, _080E2B20
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2B1C: .4byte sub_80785E4
_080E2B20: .4byte move_anim_8072740
	thumb_func_end sub_80E27A0

	thumb_func_start sub_80E27E8
sub_80E27E8: @ 80E2B24
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E2B44
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E2B48
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E2B50
	.align 2, 0
_080E2B44: .4byte gUnknown_03004B00
_080E2B48:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E2B50:
	ldr r0, _080E2B68
	ldrh r0, [r0, 0x8]
	strh r0, [r5, 0x2E]
	ldr r0, _080E2B6C
	str r0, [r5, 0x1C]
	ldr r1, _080E2B70
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2B68: .4byte gUnknown_03004B00
_080E2B6C: .4byte sub_80785E4
_080E2B70: .4byte sub_80DA48C
	thumb_func_end sub_80E27E8

	thumb_func_start sub_80E2838
sub_80E2838: @ 80E2B74
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2BA4
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080E2B98
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E2B98
	ldr r1, _080E2BA8
	ldrh r0, [r1, 0x2]
	negs r0, r0
	strh r0, [r1, 0x2]
_080E2B98:
	adds r0, r4, 0
	bl sub_80E27A0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2BA4: .4byte gUnknown_0202F7C8
_080E2BA8: .4byte gUnknown_03004B00
	thumb_func_end sub_80E2838

	thumb_func_start sub_80E2870
sub_80E2870: @ 80E2BAC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E2BE4
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _080E2BC8
	bl Random
	movs r1, 0x3
	ands r1, r0
	strh r1, [r5, 0x2]
_080E2BC8:
	ldrb r1, [r5, 0x2]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _080E2BE8
	adds r0, r4, 0
	movs r1, 0
	bl sub_80787B0
	b _080E2BF0
	.align 2, 0
_080E2BE4: .4byte gUnknown_03004B00
_080E2BE8:
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078764
_080E2BF0:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x30
	bl __umodsi3
	ldr r1, _080E2C34
	adds r0, r1
	ldrh r1, [r4, 0x24]
	adds r0, r1
	strh r0, [r4, 0x24]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x18
	bl __umodsi3
	ldr r1, _080E2C38
	adds r0, r1
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	ldr r1, _080E2C3C
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080E2C40
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2C34: .4byte 0x0000ffe8
_080E2C38: .4byte 0x0000fff4
_080E2C3C: .4byte move_anim_8074EE0
_080E2C40: .4byte sub_80785E4
	thumb_func_end sub_80E2870

	thumb_func_start sub_80E2908
sub_80E2908: @ 80E2C44
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080E2CA4
	ldrb r0, [r5]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2E]
	ldr r2, _080E2CA8
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x24]
	ldrh r0, [r0, 0x20]
	adds r1, r0
	strh r1, [r4, 0x20]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x26]
	ldrh r0, [r0, 0x22]
	adds r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x24]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x26]
	ldrb r1, [r5, 0x6]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	ldr r1, _080E2CAC
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080E2CB0
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2CA4: .4byte gUnknown_03004B00
_080E2CA8: .4byte gSprites
_080E2CAC: .4byte move_anim_8074EE0
_080E2CB0: .4byte sub_80785E4
	thumb_func_end sub_80E2908

	thumb_func_start sub_80E2978
sub_80E2978: @ 80E2CB4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _080E2CCC
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E2CD0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E2CD8
	.align 2, 0
_080E2CCC: .4byte gUnknown_03004B00
_080E2CD0:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8078764
_080E2CD8:
	ldr r0, _080E2CF0
	ldrh r0, [r0, 0x6]
	strh r0, [r4, 0x2E]
	ldr r1, _080E2CF4
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _080E2CF8
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2CF0: .4byte gUnknown_03004B00
_080E2CF4: .4byte move_anim_8072740
_080E2CF8: .4byte sub_80782D8
	thumb_func_end sub_80E2978

	thumb_func_start sub_80E29C0
sub_80E29C0: @ 80E2CFC
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080E2D1C
	ldrb r1, [r4, 0x6]
	bl StartSpriteAffineAnim
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E2D20
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80787B0
	b _080E2D28
	.align 2, 0
_080E2D1C: .4byte gUnknown_03004B00
_080E2D20:
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8078764
_080E2D28:
	ldr r0, _080E2D34
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E2D34: .4byte sub_80E29FC
	thumb_func_end sub_80E29C0

	thumb_func_start sub_80E29FC
sub_80E29FC: @ 80E2D38
	push {lr}
	adds r3, r0, 0
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x2E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xC
	ble _080E2D6E
	adds r0, r3, 0
	bl move_anim_8072740
_080E2D6E:
	pop {r0}
	bx r0
	thumb_func_end sub_80E29FC

	thumb_func_start sub_80E2A38
sub_80E2A38: @ 80E2D74
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080E2DB4
	movs r1, 0
	ldrsh r0, [r4, r1]
	bl sub_80E1DC4
	adds r6, r0, 0
	ldrh r3, [r4]
	lsls r3, 16
	asrs r0, r3, 23
	movs r4, 0x1
	ands r0, r4
	asrs r1, r3, 24
	ands r1, r4
	asrs r2, r3, 25
	ands r2, r4
	asrs r3, 26
	ands r3, r4
	bl sub_80792C0
	orrs r6, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80E2C8C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E2DB4: .4byte gUnknown_03004B00
	thumb_func_end sub_80E2A38

	thumb_func_start sub_80E2A7C
sub_80E2A7C: @ 80E2DB8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x1]
	movs r0, 0x1
	bl sub_80E1DC4
	adds r5, r0, 0
	ldr r0, _080E2DE4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	bhi _080E2E62
	lsls r0, 2
	ldr r1, _080E2DE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2DE4: .4byte gUnknown_03004B00
_080E2DE8: .4byte _080E2DEC
	.align 2, 0
_080E2DEC:
	.4byte _080E2E0E
	.4byte _080E2E1A
	.4byte _080E2E0C
	.4byte _080E2E18
	.4byte _080E2E28
	.4byte _080E2E40
	.4byte _080E2E48
	.4byte _080E2E54
_080E2E0C:
	movs r5, 0
_080E2E0E:
	mov r0, sp
	ldr r1, _080E2E14
	b _080E2E1E
	.align 2, 0
_080E2E14: .4byte gUnknown_0202F7C8
_080E2E18:
	movs r5, 0
_080E2E1A:
	mov r0, sp
	ldr r1, _080E2E24
_080E2E1E:
	ldrb r1, [r1]
	strb r1, [r0]
	b _080E2E62
	.align 2, 0
_080E2E24: .4byte gUnknown_0202F7C9
_080E2E28:
	mov r1, sp
	ldr r0, _080E2E38
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080E2E3C
	ldrb r0, [r0]
	strb r0, [r1, 0x1]
	b _080E2E62
	.align 2, 0
_080E2E38: .4byte gUnknown_0202F7C8
_080E2E3C: .4byte gUnknown_0202F7C9
_080E2E40:
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	b _080E2E62
_080E2E48:
	movs r5, 0
	mov r2, sp
	ldr r0, _080E2E50
	b _080E2E5A
	.align 2, 0
_080E2E50: .4byte gUnknown_0202F7C8
_080E2E54:
	movs r5, 0
	mov r2, sp
	ldr r0, _080E2EAC
_080E2E5A:
	ldrb r0, [r0]
	movs r1, 0x2
	eors r0, r1
	strb r0, [r2]
_080E2E62:
	movs r4, 0
	mov r6, sp
_080E2E66:
	ldrb r0, [r6]
	cmp r4, r0
	beq _080E2E90
	ldrb r0, [r6, 0x1]
	cmp r4, r0
	beq _080E2E90
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080E2E90
	adds r0, r4, 0
	bl sub_80793A8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r0
	orrs r5, r1
_080E2E90:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080E2E66
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80E2C8C
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E2EAC: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80E2A7C

	thumb_func_start sub_80E2B74
sub_80E2B74: @ 80E2EB0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E2ED4
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80E1DC4
	adds r2, r0, 0
	ldr r0, _080E2ED8
	ldrb r0, [r0]
	cmp r0, 0x9
	bhi _080E2F86
	lsls r0, 2
	ldr r1, _080E2EDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E2ED4: .4byte gUnknown_03004B00
_080E2ED8: .4byte gUnknown_0300428C
_080E2EDC: .4byte _080E2EE0
	.align 2, 0
_080E2EE0:
	.4byte _080E2F08
	.4byte _080E2F18
	.4byte _080E2F24
	.4byte _080E2F34
	.4byte _080E2F40
	.4byte _080E2F50
	.4byte _080E2F60
	.4byte _080E2F70
	.4byte _080E2F80
	.4byte _080E2F80
_080E2F08:
	ldr r1, _080E2F10
	ldr r0, _080E2F14
	b _080E2F84
	.align 2, 0
_080E2F10: .4byte gUnknown_03004B00
_080E2F14: .4byte 0x00000b0c
_080E2F18:
	ldr r1, _080E2F20
	movs r0, 0x9E
	lsls r0, 4
	b _080E2F84
	.align 2, 0
_080E2F20: .4byte gUnknown_03004B00
_080E2F24:
	ldr r1, _080E2F2C
	ldr r0, _080E2F30
	b _080E2F84
	.align 2, 0
_080E2F2C: .4byte gUnknown_03004B00
_080E2F30: .4byte 0x00002f1e
_080E2F34:
	ldr r1, _080E2F3C
	movs r0, 0x90
	lsls r0, 7
	b _080E2F84
	.align 2, 0
_080E2F3C: .4byte gUnknown_03004B00
_080E2F40:
	ldr r1, _080E2F48
	ldr r0, _080E2F4C
	b _080E2F84
	.align 2, 0
_080E2F48: .4byte gUnknown_03004B00
_080E2F4C: .4byte 0x00007ecb
_080E2F50:
	ldr r1, _080E2F58
	ldr r0, _080E2F5C
	b _080E2F84
	.align 2, 0
_080E2F58: .4byte gUnknown_03004B00
_080E2F5C: .4byte 0x00007ecb
_080E2F60:
	ldr r1, _080E2F68
	ldr r0, _080E2F6C
	b _080E2F84
	.align 2, 0
_080E2F68: .4byte gUnknown_03004B00
_080E2F6C: .4byte 0x00002a16
_080E2F70:
	ldr r1, _080E2F78
	ldr r0, _080E2F7C
	b _080E2F84
	.align 2, 0
_080E2F78: .4byte gUnknown_03004B00
_080E2F7C: .4byte 0x00000d2e
_080E2F80:
	ldr r1, _080E2F94
	ldr r0, _080E2F98
_080E2F84:
	strh r0, [r1, 0x8]
_080E2F86:
	adds r0, r4, 0
	adds r1, r2, 0
	bl sub_80E2C8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2F94: .4byte gUnknown_03004B00
_080E2F98: .4byte 0x00007fff
	thumb_func_end sub_80E2B74

	thumb_func_start sub_80E2C60
sub_80E2C60: @ 80E2F9C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E2FC4
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r1, 0x1
	lsls r1, r0
	adds r0, r4, 0
	bl sub_80E2C8C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E2FC4: .4byte gUnknown_03004B00
	thumb_func_end sub_80E2C60

	thumb_func_start sub_80E2C8C
sub_80E2C8C: @ 80E2FC8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080E3000
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	strh r1, [r2, 0x8]
	lsrs r1, 16
	strh r1, [r2, 0xA]
	ldr r3, _080E3004
	ldrh r1, [r3, 0x2]
	strh r1, [r2, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0xE]
	ldrh r1, [r3, 0x6]
	strh r1, [r2, 0x10]
	ldrh r1, [r3, 0x8]
	strh r1, [r2, 0x12]
	ldrh r1, [r3, 0x4]
	strh r1, [r2, 0x1C]
	ldr r1, _080E3008
	str r1, [r2]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080E3000: .4byte gTasks
_080E3004: .4byte gUnknown_03004B00
_080E3008: .4byte sub_80E2CD0
	thumb_func_end sub_80E2C8C

	thumb_func_start sub_80E2CD0
sub_80E2CD0: @ 80E300C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r2, _080E308C
	lsls r5, r7, 2
	adds r0, r5, r7
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1A]
	mov r8, r0
	movs r4, 0x1A
	ldrsh r1, [r3, r4]
	movs r4, 0xC
	ldrsh r0, [r3, r4]
	mov r9, r2
	cmp r1, r0
	bne _080E30A2
	strh r6, [r3, 0x1A]
	movs r0, 0x8
	ldrsh r4, [r3, r0]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	lsls r0, 16
	orrs r4, r0
	mov r8, r5
	cmp r4, 0
	beq _080E306E
	adds r5, r3, 0
_080E304C:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080E3060
	ldrb r2, [r5, 0x1C]
	ldrh r3, [r5, 0x12]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
_080E3060:
	adds r0, r6, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r4, 1
	cmp r4, 0
	bne _080E304C
_080E306E:
	mov r4, r8
	adds r0, r4, r7
	lsls r0, 3
	mov r1, r9
	adds r2, r0, r1
	ldrh r0, [r2, 0x1C]
	movs r4, 0x1C
	ldrsh r3, [r2, r4]
	movs r4, 0x10
	ldrsh r1, [r2, r4]
	cmp r3, r1
	bge _080E3090
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	b _080E30A8
	.align 2, 0
_080E308C: .4byte gTasks
_080E3090:
	cmp r3, r1
	ble _080E309A
	subs r0, 0x1
	strh r0, [r2, 0x1C]
	b _080E30A8
_080E309A:
	adds r0, r7, 0
	bl move_anim_task_del
	b _080E30A8
_080E30A2:
	mov r0, r8
	adds r0, 0x1
	strh r0, [r3, 0x1A]
_080E30A8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2CD0

	thumb_func_start sub_80E2D78
sub_80E2D78: @ 80E30B4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _080E30E8
	ldrb r0, [r4]
	ldrb r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	ldrb r3, [r4, 0x6]
	ldrb r4, [r4, 0x8]
	str r4, [sp]
	bl BeginHardwarePaletteFade
	ldr r1, _080E30EC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080E30F0
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E30E8: .4byte gUnknown_03004B00
_080E30EC: .4byte gTasks
_080E30F0: .4byte sub_80E2DB8
	thumb_func_end sub_80E2D78

	thumb_func_start sub_80E2DB8
sub_80E2DB8: @ 80E30F4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080E3110
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080E310C
	adds r0, r2, 0
	bl move_anim_task_del
_080E310C:
	pop {r0}
	bx r0
	.align 2, 0
_080E3110: .4byte gPaletteFade
	thumb_func_end sub_80E2DB8

	thumb_func_start sub_80E2DD8
sub_80E2DD8: @ 80E3114
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080E3140
	adds r1, r0
	ldr r2, _080E3144
	ldrh r0, [r2]
	movs r3, 0
	strh r0, [r1, 0x8]
	strh r3, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x4]
	strh r0, [r1, 0xE]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	ldr r0, _080E3148
	str r0, [r1]
	bx lr
	.align 2, 0
_080E3140: .4byte gTasks
_080E3144: .4byte gUnknown_03004B00
_080E3148: .4byte sub_80E2E10
	thumb_func_end sub_80E2DD8

	thumb_func_start sub_80E2E10
sub_80E2E10: @ 80E314C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r2, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080E3178
	adds r4, r0, r1
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3210
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080E317C
	subs r0, r1, 0x1
	strh r0, [r4, 0xA]
	b _080E321E
	.align 2, 0
_080E3178: .4byte gTasks
_080E317C:
	ldrb r0, [r4, 0x8]
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	blt _080E31FA
	ldr r6, _080E3208
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r3, r1, r6
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x2
	cmp r0, 0
	beq _080E31A4
	movs r2, 0x1
_080E31A4:
	lsls r2, 2
	ldrb r1, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x5]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrh r1, [r4, 0xE]
	strh r1, [r0, 0x2E]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strh r5, [r0, 0x30]
	movs r0, 0x14
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5
	strh r1, [r0, 0x32]
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080E320C
	str r1, [r0]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
_080E31FA:
	ldrh r0, [r4, 0x10]
	subs r0, 0x1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0xA]
	b _080E321E
	.align 2, 0
_080E3208: .4byte gSprites
_080E320C: .4byte sub_80E2EE8
_080E3210:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E321E
	adds r0, r2, 0
	bl move_anim_task_del
_080E321E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E2E10

	thumb_func_start sub_80E2EE8
sub_80E2EE8: @ 80E3224
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080E3238
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	b _080E325C
_080E3238:
	ldr r3, _080E3264
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	lsls r1, 1
	movs r0, 0x30
	ldrsh r2, [r4, r0]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r3, 0x8
	adds r1, r3
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	adds r0, r4, 0
	bl obj_delete_but_dont_free_vram
_080E325C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E3264: .4byte gTasks
	thumb_func_end sub_80E2EE8

	thumb_func_start sub_80E2F2C
sub_80E2F2C: @ 80E3268
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r7, 0
	ldr r0, _080E3374
	strh r7, [r0]
	ldr r0, _080E3378
	strh r7, [r0]
	ldr r1, _080E337C
	ldr r2, _080E3380
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E3384
	adds r0, r3, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E3388
	ldr r2, _080E338C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E3390
	adds r0, r3, 0
	strh r0, [r1]
	ldr r4, _080E3394
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	mov r8, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E32E8
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080E32E8:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080E3364
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E3364
	ldr r5, _080E3398
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E3318
	ldrb r0, [r5]
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _080E3364
_080E3318:
	ldrb r0, [r5]
	movs r6, 0x2
	eors r0, r6
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E3364
	ldr r3, _080E339C
	ldr r1, _080E33A0
	ldrb r0, [r5]
	eors r0, r6
	adds r0, r1
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r1, [r4]
	mov r0, r8
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	movs r7, 0x1
_080E3364:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E33A8
	ldr r0, _080E33A4
	ldrh r4, [r0]
	b _080E33F0
	.align 2, 0
_080E3374: .4byte gUnknown_030042C4
_080E3378: .4byte gUnknown_03004240
_080E337C: .4byte 0x04000048
_080E3380: .4byte 0x00003f3f
_080E3384: .4byte 0x00003f3d
_080E3388: .4byte 0x04000050
_080E338C: .4byte 0x00003f42
_080E3390: .4byte 0x00000c08
_080E3394: .4byte 0x0400000a
_080E3398: .4byte gUnknown_0202F7C8
_080E339C: .4byte gSprites
_080E33A0: .4byte gUnknown_02024BE0
_080E33A4: .4byte 0x02019348
_080E33A8:
	ldr r4, _080E33C8
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080E33D4
	ldr r1, _080E33CC
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E33D0
	b _080E33E4
	.align 2, 0
_080E33C8: .4byte gUnknown_0202F7C8
_080E33CC: .4byte gUnknown_02024A6A
_080E33D0: .4byte gEnemyParty
_080E33D4:
	ldr r1, _080E349C
	ldrb r0, [r4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E34A0
_080E33E4:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_080E33F0:
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E34A4
	ldrb r0, [r0]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0xC]
	ldr r2, _080E34A8
	add r0, sp, 0xC
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080E34AC
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _080E34B0
	bl LZDecompressVram
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E3442
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080E3442:
	ldr r0, _080E34B4
	ldr r1, [sp]
	bl LZDecompressVram
	ldr r0, _080E34B8
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	adds r1, 0x1
	movs r2, 0x2
	bl LoadPalette
	ldr r2, _080E34BC
	ldr r0, _080E34C0
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x20]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r2, _080E34C4
	ldrh r0, [r1, 0x22]
	negs r0, r0
	adds r0, 0x20
	strh r0, [r2]
	ldr r1, _080E34C8
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	strh r4, [r0, 0x8]
	strh r7, [r0, 0x14]
	ldr r1, _080E34CC
	str r1, [r0]
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E349C: .4byte gUnknown_02024A6A
_080E34A0: .4byte gPlayerParty
_080E34A4: .4byte gUnknown_0202F7C8
_080E34A8: .4byte 0x040000d4
_080E34AC: .4byte 0x85000400
_080E34B0: .4byte gUnknown_08D20A30
_080E34B4: .4byte gUnknown_08D20A14
_080E34B8: .4byte gUnknown_083DB568
_080E34BC: .4byte gUnknown_030042C0
_080E34C0: .4byte gSprites
_080E34C4: .4byte gUnknown_030041B4
_080E34C8: .4byte gTasks
_080E34CC: .4byte sub_80E3194
	thumb_func_end sub_80E2F2C

	thumb_func_start sub_80E3194
sub_80E3194: @ 80E34D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E35E8
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x4
	movs r5, 0
	strh r0, [r4, 0x1C]
	ldr r7, _080E35EC
	ldrh r2, [r7]
	subs r1, r2, 0x4
	strh r1, [r7]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	bne _080E35DA
	strh r5, [r4, 0x1C]
	adds r0, r2, 0
	adds r0, 0x3C
	strh r0, [r7]
	ldrh r0, [r4, 0x1E]
	adds r0, 0x1
	strh r0, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	bne _080E35DA
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E35F0
	strh r5, [r0]
	ldr r0, _080E35F4
	strh r5, [r0]
	ldr r0, _080E35F8
	ldr r2, _080E35FC
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E3544
	ldr r2, _080E3600
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E3544:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E3604
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	ldr r0, _080E3608
	mov r8, r0
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	bl DestroySprite
	mov r0, sp
	bl sub_8078914
	ldr r2, [sp, 0x4]
	str r5, [sp, 0xC]
	ldr r1, _080E360C
	add r0, sp, 0xC
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080E3610
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r3, 0x14
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080E35C4
	ldr r2, _080E3614
	ldr r0, _080E3618
	ldrb r1, [r0]
	movs r0, 0x2
	eors r0, r1
	adds r0, r2
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080E35C4:
	ldr r2, _080E3600
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	movs r0, 0
	strh r0, [r7]
	adds r0, r6, 0
	bl move_anim_task_del
_080E35DA:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E35E8: .4byte gTasks
_080E35EC: .4byte gUnknown_030041B4
_080E35F0: .4byte gUnknown_030042C4
_080E35F4: .4byte gUnknown_03004240
_080E35F8: .4byte 0x04000048
_080E35FC: .4byte 0x00003f3f
_080E3600: .4byte 0x0400000a
_080E3604: .4byte 0x04000050
_080E3608: .4byte gSprites
_080E360C: .4byte 0x040000d4
_080E3610: .4byte 0x85000200
_080E3614: .4byte gUnknown_02024BE0
_080E3618: .4byte gUnknown_0202F7C8
	thumb_func_end sub_80E3194

	thumb_func_start sub_80E32E0
sub_80E32E0: @ 80E361C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r0, _080E3668
	mov r12, r0
	ldr r1, _080E366C
	mov r8, r1
	lsls r1, r3, 2
	adds r0, r1, r3
	lsls r4, r0, 3
	mov r7, r12
	adds r7, 0x8
	adds r5, r1, 0
	ldr r6, _080E3670
_080E363E:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r1, r7
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _080E363E
	adds r0, r5, r3
	lsls r0, 3
	add r0, r12
	mov r1, r8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3668: .4byte gTasks
_080E366C: .4byte sub_80E3338
_080E3670: .4byte gUnknown_03004B00
	thumb_func_end sub_80E32E0

	thumb_func_start sub_80E3338
sub_80E3338: @ 80E3674
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r0, 0
	str r0, [sp, 0x1C]
	movs r1, 0
	str r1, [sp, 0x20]
	add r7, sp, 0xC
	ldr r2, _080E36C4
	mov r3, r9
	lsls r1, r3, 2
	adds r0, r1, r3
	lsls r0, 3
	mov r10, r1
	adds r1, r2, 0
	adds r1, 0x8
	adds r1, r0, r1
	adds r3, r7, 0
	movs r4, 0
	movs r2, 0x7
_080E36A8:
	ldrh r0, [r1]
	strh r0, [r3]
	strh r4, [r1]
	adds r1, 0x2
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080E36A8
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E36CC
	ldr r0, _080E36C8
	b _080E36CE
	.align 2, 0
_080E36C4: .4byte gTasks
_080E36C8: .4byte gUnknown_0202F7C8
_080E36CC:
	ldr r0, _080E37F0
_080E36CE:
	ldrb r5, [r0]
	movs r0, 0x2
	mov r8, r5
	mov r2, r8
	eors r2, r0
	mov r8, r2
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E36F8
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	cmp r0, 0
	beq _080E36FC
	mov r0, r8
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080E36FC
_080E36F8:
	movs r0, 0
	strh r0, [r7, 0x6]
_080E36FC:
	ldr r0, _080E37F4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E37F8
	strh r1, [r0]
	ldr r1, _080E37FC
	ldr r2, _080E3800
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080E3804
	adds r0, r3, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E3808
	ldr r2, _080E380C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r4, _080E3810
	ldrb r1, [r4]
	movs r6, 0x4
	negs r6, r6
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E376E
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080E376E:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _080E37E0
	movs r1, 0x6
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E37E0
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080E379A
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	cmp r0, 0
	bne _080E37E0
_080E379A:
	mov r0, r8
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080E37E0
	ldr r1, _080E3814
	ldr r0, _080E3818
	add r0, r8
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	subs r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
	ldrb r1, [r4]
	adds r0, r6, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
	movs r2, 0x1
	str r2, [sp, 0x20]
_080E37E0:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E3820
	ldr r0, _080E381C
	ldrh r4, [r0]
	b _080E385E
	.align 2, 0
_080E37F0: .4byte gUnknown_0202F7C9
_080E37F4: .4byte gUnknown_030042C4
_080E37F8: .4byte gUnknown_03004240
_080E37FC: .4byte 0x04000048
_080E3800: .4byte 0x00003f3f
_080E3804: .4byte 0x00003f3d
_080E3808: .4byte 0x04000050
_080E380C: .4byte 0x00003f42
_080E3810: .4byte 0x0400000a
_080E3814: .4byte gSprites
_080E3818: .4byte gUnknown_02024BE0
_080E381C: .4byte 0x02019348
_080E3820:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080E3844
	ldr r1, _080E383C
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E3840
	b _080E3852
	.align 2, 0
_080E383C: .4byte gUnknown_02024A6A
_080E3840: .4byte gEnemyParty
_080E3844:
	ldr r1, _080E38A4
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E38A8
_080E3852:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_080E385E:
	ldr r6, _080E38AC
	adds r0, r5, r6
	ldrb r1, [r0]
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0x6
	ldrsh r0, [r7, r3]
	cmp r0, 0
	beq _080E388C
	mov r1, r8
	adds r0, r1, r6
	ldrb r1, [r0]
	mov r0, r8
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x1C]
_080E388C:
	mov r0, sp
	bl sub_8078914
	movs r2, 0
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080E38B4
	ldr r0, _080E38B0
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
	b _080E38BC
	.align 2, 0
_080E38A4: .4byte gUnknown_02024A6A
_080E38A8: .4byte gPlayerParty
_080E38AC: .4byte gUnknown_02024BE0
_080E38B0: .4byte gBattleStatMask1_Tilemap
_080E38B4:
	ldr r0, _080E38EC
	ldr r1, [sp, 0x4]
	bl LZDecompressVram
_080E38BC:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E38D4
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080E38D4:
	ldr r0, _080E38F0
	ldr r1, [sp]
	bl LZDecompressVram
	ldrh r0, [r7, 0x2]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bne _080E38F8
	ldr r0, _080E38F4
	b _080E393A
	.align 2, 0
_080E38EC: .4byte gBattleStatMask2_Tilemap
_080E38F0: .4byte gBattleStatMask_Gfx
_080E38F4: .4byte gBattleStatMask2_Pal
_080E38F8:
	cmp r0, 0x1
	bne _080E3904
	ldr r0, _080E3900
	b _080E393A
	.align 2, 0
_080E3900: .4byte gBattleStatMask1_Pal
_080E3904:
	cmp r0, 0x2
	bne _080E3910
	ldr r0, _080E390C
	b _080E393A
	.align 2, 0
_080E390C: .4byte gBattleStatMask3_Pal
_080E3910:
	cmp r0, 0x3
	bne _080E391C
	ldr r0, _080E3918
	b _080E393A
	.align 2, 0
_080E3918: .4byte gBattleStatMask4_Pal
_080E391C:
	cmp r0, 0x4
	bne _080E3928
	ldr r0, _080E3924
	b _080E393A
	.align 2, 0
_080E3924: .4byte gBattleStatMask6_Pal
_080E3928:
	cmp r0, 0x5
	bne _080E3934
	ldr r0, _080E3930
	b _080E393A
	.align 2, 0
_080E3930: .4byte gBattleStatMask7_Pal
_080E3934:
	cmp r0, 0x6
	bne _080E394C
	ldr r0, _080E3948
_080E393A:
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
	b _080E395A
	.align 2, 0
_080E3948: .4byte gBattleStatMask8_Pal
_080E394C:
	ldr r0, _080E3980
	mov r1, sp
	ldrb r1, [r1, 0x8]
	lsls r1, 4
	movs r2, 0x20
	bl LoadCompressedPalette
_080E395A:
	ldr r2, _080E3984
	movs r1, 0
	strh r1, [r2]
	ldr r0, _080E3988
	strh r1, [r0]
	movs r3, 0
	ldrsh r0, [r7, r3]
	cmp r0, 0x1
	bne _080E3994
	movs r0, 0x40
	strh r0, [r2]
	ldr r2, _080E398C
	mov r0, r10
	add r0, r9
	lsls r0, 3
	adds r0, r2
	ldr r1, _080E3990
	strh r1, [r0, 0xA]
	b _080E39A4
	.align 2, 0
_080E3980: .4byte gBattleStatMask5_Pal
_080E3984: .4byte gUnknown_030042C0
_080E3988: .4byte gUnknown_030041B4
_080E398C: .4byte gTasks
_080E3990: .4byte 0x0000fffd
_080E3994:
	ldr r0, _080E39BC
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r0
	movs r2, 0x3
	strh r2, [r1, 0xA]
	adds r2, r0, 0
_080E39A4:
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E39C0
	mov r0, r10
	add r0, r9
	lsls r0, 3
	adds r0, r2
	movs r1, 0xA
	strh r1, [r0, 0x10]
	movs r1, 0x14
	b _080E39CE
	.align 2, 0
_080E39BC: .4byte gTasks
_080E39C0:
	mov r0, r10
	add r0, r9
	lsls r0, 3
	adds r0, r2
	movs r1, 0xD
	strh r1, [r0, 0x10]
	movs r1, 0x1E
_080E39CE:
	strh r1, [r0, 0x12]
	mov r1, r10
	add r1, r9
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	ldrh r0, [r7, 0x6]
	strh r0, [r1, 0xC]
	mov r2, sp
	ldrh r2, [r2, 0x1C]
	strh r2, [r1, 0xE]
	mov r3, sp
	ldrh r3, [r3, 0x20]
	strh r3, [r1, 0x14]
	ldr r0, _080E3A14
	add r0, r8
	ldrb r0, [r0]
	strh r0, [r1, 0x16]
	ldr r0, _080E3A18
	str r0, [r1]
	movs r1, 0
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _080E3A1C
	movs r0, 0x40
	negs r0, r0
	bl sub_8077094
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xEF
	bl PlaySE12WithPanning
	b _080E3A30
	.align 2, 0
_080E3A14: .4byte gUnknown_02024BE0
_080E3A18: .4byte sub_80E3704
_080E3A1C:
	movs r0, 0x40
	negs r0, r0
	bl sub_8077094
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	movs r0, 0xF5
	bl PlaySE12WithPanning
_080E3A30:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E3338

	thumb_func_start sub_80E3704
sub_80E3704: @ 80E3A40
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080E3A6C
	ldr r1, _080E3A70
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	movs r3, 0x26
	ldrsh r2, [r4, r3]
	cmp r2, 0x1
	beq _080E3AB0
	cmp r2, 0x1
	bgt _080E3A74
	cmp r2, 0
	beq _080E3A7A
	b _080E3BA2
	.align 2, 0
_080E3A6C: .4byte gUnknown_030041B4
_080E3A70: .4byte gTasks
_080E3A74:
	cmp r2, 0x2
	beq _080E3ACA
	b _080E3BA2
_080E3A7A:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	cmp r0, 0
	bgt _080E3A88
	b _080E3BA2
_080E3A88:
	strh r2, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	adds r1, 0x1
	strh r1, [r4, 0x20]
	ldr r2, _080E3AAC
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E3BA2
	b _080E3AC2
	.align 2, 0
_080E3AAC: .4byte 0x04000052
_080E3AB0:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080E3BA2
_080E3AC2:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _080E3BA2
_080E3ACA:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	cmp r0, 0
	ble _080E3BA2
	movs r0, 0
	strh r0, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	subs r1, 0x1
	strh r1, [r4, 0x20]
	ldr r7, _080E3BA8
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r7]
	movs r0, 0x20
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _080E3BA2
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E3BAC
	strh r5, [r0]
	ldr r0, _080E3BB0
	strh r5, [r0]
	ldr r0, _080E3BB4
	ldr r2, _080E3BB8
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E3B24
	ldr r2, _080E3BBC
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E3B24:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E3BC0
	strh r5, [r0]
	strh r5, [r7]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080E3BC4
	adds r0, r5
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3B64
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_080E3B64:
	movs r3, 0x14
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	bne _080E3B90
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldrb r3, [r2, 0x5]
	lsls r1, r3, 28
	lsrs r1, 30
	adds r1, 0x1
	movs r0, 0x3
	ands r1, r0
	lsls r1, 2
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, 0x5]
_080E3B90:
	ldr r2, _080E3BBC
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	adds r0, r6, 0
	bl move_anim_task_del
_080E3BA2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3BA8: .4byte 0x04000052
_080E3BAC: .4byte gUnknown_030042C4
_080E3BB0: .4byte gUnknown_03004240
_080E3BB4: .4byte 0x04000048
_080E3BB8: .4byte 0x00003f3f
_080E3BBC: .4byte 0x0400000a
_080E3BC0: .4byte 0x04000050
_080E3BC4: .4byte gSprites
	thumb_func_end sub_80E3704

	thumb_func_start sub_80E388C
sub_80E388C: @ 80E3BC8
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80792C0
	adds r6, r0, 0
	movs r1, 0
	bl sub_80E39BC
	ldr r0, _080E3C28
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	lsrs r0, r6, 16
	movs r5, 0
	strh r0, [r4, 0x24]
	str r5, [sp]
	str r5, [sp, 0x4]
	str r5, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r6, r0, 0
	ldr r1, _080E3C2C
	ands r6, r1
	adds r0, r6, 0
	bl sub_80E39BC
	strh r6, [r4, 0x26]
	strh r5, [r4, 0x8]
	strh r5, [r4, 0xA]
	ldr r0, _080E3C30
	str r0, [r4]
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3C28: .4byte gTasks
_080E3C2C: .4byte 0x0000ffff
_080E3C30: .4byte sub_80E38F8
	thumb_func_end sub_80E388C

	thumb_func_start sub_80E38F8
sub_80E38F8: @ 80E3C34
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	ldr r1, _080E3C58
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	cmp r1, 0x1
	beq _080E3C78
	cmp r1, 0x1
	bgt _080E3C5C
	cmp r1, 0
	beq _080E3C62
	b _080E3CF2
	.align 2, 0
_080E3C58: .4byte gTasks
_080E3C5C:
	cmp r1, 0x2
	beq _080E3CEC
	b _080E3CF2
_080E3C62:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080E3CF2
	strh r1, [r4, 0xA]
	movs r0, 0x10
	strh r0, [r4, 0xC]
	b _080E3CE0
_080E3C78:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _080E3CF2
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	movs r5, 0
	movs r6, 0x1
_080E3C94:
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080E3CAE
	lsls r0, r5, 20
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	ldr r3, _080E3CE8
	bl BlendPalette
_080E3CAE:
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _080E3CCE
	lsls r0, r5, 20
	movs r1, 0x80
	lsls r1, 17
	adds r0, r1
	lsrs r0, 16
	ldrb r2, [r4, 0xC]
	movs r1, 0x10
	movs r3, 0
	bl BlendPalette
_080E3CCE:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xF
	bls _080E3C94
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080E3CF2
_080E3CE0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080E3CF2
	.align 2, 0
_080E3CE8: .4byte 0x0000ffff
_080E3CEC:
	adds r0, r2, 0
	bl move_anim_task_del
_080E3CF2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80E38F8

	thumb_func_start sub_80E39BC
sub_80E39BC: @ 80E3CF8
	push {r4-r6,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	movs r2, 0
_080E3D02:
	movs r0, 0x1
	ands r0, r3
	lsrs r4, r3, 1
	adds r5, r2, 0x1
	cmp r0, 0
	beq _080E3D2E
	lsls r0, r2, 20
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x10
	cmp r2, r0
	bge _080E3D2E
	ldr r1, _080E3D40
	adds r3, r0, 0
_080E3D1E:
	lsls r0, r2, 1
	adds r0, r1
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r3
	blt _080E3D1E
_080E3D2E:
	adds r3, r4, 0
	lsls r0, r5, 16
	lsrs r2, r0, 16
	cmp r2, 0x1F
	bls _080E3D02
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3D40: .4byte gPlttBufferFaded
	thumb_func_end sub_80E39BC

	thumb_func_start sub_80E3A08
sub_80E3A08: @ 80E3D44
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	movs r2, 0
	ldr r0, _080E3D8C
	ldrb r3, [r0]
	movs r5, 0x1
_080E3D54:
	cmp r3, r2
	beq _080E3D62
	adds r1, r2, 0
	adds r1, 0x10
	adds r0, r5, 0
	lsls r0, r1
	orrs r4, r0
_080E3D62:
	adds r2, 0x1
	cmp r2, 0x3
	bls _080E3D54
	movs r2, 0x5
	ldr r0, _080E3D90
	adds r1, r0, 0
	adds r1, 0x8
_080E3D70:
	ldrh r0, [r1]
	strh r0, [r1, 0x2]
	subs r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E3D70
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80E2C8C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3D8C: .4byte gUnknown_0202F7C8
_080E3D90: .4byte gUnknown_03004B00
	thumb_func_end sub_80E3A08

	thumb_func_start sub_80E3A58
sub_80E3A58: @ 80E3D94
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r0, 0
	bl sub_80789D4
	ldr r0, _080E3DFC
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080E3E00
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E3DD0
	ldr r0, _080E3E04
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080E3DD0
	ldrh r0, [r4]
	negs r0, r0
	strh r0, [r4]
	ldrh r0, [r4, 0x2]
	negs r0, r0
	strh r0, [r4, 0x2]
_080E3DD0:
	ldr r0, _080E3E08
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r2, _080E3E00
	ldrh r0, [r2]
	strh r0, [r1, 0xA]
	ldrh r0, [r2, 0x2]
	strh r0, [r1, 0xC]
	ldrh r0, [r2, 0x6]
	strh r0, [r1, 0xE]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	adds r0, r6, 0
	bl move_anim_task_del
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E3DFC: .4byte sub_80E3AD0
_080E3E00: .4byte gUnknown_03004B00
_080E3E04: .4byte gUnknown_0202F7C8
_080E3E08: .4byte gTasks
	thumb_func_end sub_80E3A58

	thumb_func_start sub_80E3AD0
sub_80E3AD0: @ 80E3E0C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E3E78
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldrh r3, [r1, 0xA]
	ldrh r0, [r1, 0x1C]
	adds r3, r0
	movs r4, 0
	mov r12, r4
	strh r3, [r1, 0x1C]
	ldrh r2, [r1, 0xC]
	ldrh r7, [r1, 0x1E]
	adds r2, r7
	strh r2, [r1, 0x1E]
	ldr r6, _080E3E7C
	lsls r0, r3, 16
	asrs r0, 24
	ldrh r4, [r6]
	adds r0, r4
	strh r0, [r6]
	ldr r4, _080E3E80
	lsls r0, r2, 16
	asrs r0, 24
	ldrh r7, [r4]
	adds r0, r7
	strh r0, [r4]
	movs r0, 0xFF
	ands r3, r0
	strh r3, [r1, 0x1C]
	ands r2, r0
	strh r2, [r1, 0x1E]
	ldr r0, _080E3E84
	movs r3, 0xE
	ldrsh r2, [r0, r3]
	movs r7, 0xE
	ldrsh r0, [r1, r7]
	cmp r2, r0
	bne _080E3E72
	mov r0, r12
	strh r0, [r6]
	strh r0, [r4]
	movs r0, 0x1
	bl sub_80789D4
	adds r0, r5, 0
	bl DestroyTask
_080E3E72:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3E78: .4byte gTasks
_080E3E7C: .4byte gUnknown_030041B0
_080E3E80: .4byte gUnknown_030041B8
_080E3E84: .4byte gUnknown_03004B00
	thumb_func_end sub_80E3AD0

	thumb_func_start sub_80E3B4C
sub_80E3B4C: @ 80E3E88
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E3EAC
	ldrb r0, [r0]
	bl battle_side_get_owner
	ldr r1, _080E3EB0
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E3EAC: .4byte gUnknown_0202F7C8
_080E3EB0: .4byte gUnknown_03004B00
	thumb_func_end sub_80E3B4C

	thumb_func_start sub_80E3B78
sub_80E3B78: @ 80E3EB4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080E3ED8
	ldrb r0, [r0]
	bl battle_side_get_owner
	ldr r1, _080E3EDC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0xE]
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E3ED8: .4byte gUnknown_0202F7C9
_080E3EDC: .4byte gUnknown_03004B00
	thumb_func_end sub_80E3B78

	thumb_func_start sub_80E3BA4
sub_80E3BA4: @ 80E3EE0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r5, _080E3F0C
	movs r4, 0
	ldr r0, _080E3F10
	ldrb r2, [r0]
	movs r0, 0x2
	ldr r1, _080E3F14
	eors r0, r2
	ldrb r1, [r1]
	cmp r0, r1
	bne _080E3EFC
	movs r4, 0x1
_080E3EFC:
	strh r4, [r5, 0xE]
	adds r0, r3, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E3F0C: .4byte gUnknown_03004B00
_080E3F10: .4byte gUnknown_0202F7C8
_080E3F14: .4byte gUnknown_0202F7C9
	thumb_func_end sub_80E3BA4

	thumb_func_start sub_80E3BDC
sub_80E3BDC: @ 80E3F18
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080E3F78
_080E3F22:
	ldr r0, _080E3F7C
	ldrb r0, [r0]
	cmp r4, r0
	beq _080E3F60
	lsls r0, r4, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080E3F60
	ldr r0, _080E3F80
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r6
	ldr r1, _080E3F84
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r3, [r1]
	ands r3, r0
	lsls r3, 2
	ldrb r0, [r2]
	movs r7, 0x5
	negs r7, r7
	adds r1, r7, 0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
_080E3F60:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080E3F22
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E3F78: .4byte gSprites
_080E3F7C: .4byte gUnknown_0202F7C8
_080E3F80: .4byte gUnknown_02024BE0
_080E3F84: .4byte gUnknown_03004B00
	thumb_func_end sub_80E3BDC

	thumb_func_start sub_80E3C4C
sub_80E3C4C: @ 80E3F88
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	ldr r1, [sp, 0x3C]
	ldr r4, [sp, 0x40]
	ldr r5, [sp, 0x44]
	ldr r6, [sp, 0x48]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r2, 16
	lsrs r2, 16
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r7, r3, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x10]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x14]
	lsls r6, 24
	lsrs r6, 24
	mov r10, r6
	movs r0, 0
	str r0, [sp, 0x18]
	movs r0, 0x2
	adds r6, r7, 0
	eors r6, r0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E3FEA
	mov r1, r8
	cmp r1, 0
	beq _080E3FEE
	adds r0, r6, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080E3FEE
_080E3FEA:
	movs r2, 0
	mov r8, r2
_080E3FEE:
	ldr r0, _080E4070
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E4074
	strh r1, [r0]
	ldr r1, _080E4078
	ldr r3, _080E407C
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080E4080
	adds r0, r2, 0
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080E4084
	ldr r2, _080E4088
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x80
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r4, _080E408C
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E405E
	ldrb r0, [r4]
	movs r1, 0xD
	negs r1, r1
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4]
_080E405E:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E4094
	ldr r0, _080E4090
	ldrh r4, [r0]
	b _080E40D2
	.align 2, 0
_080E4070: .4byte gUnknown_030042C4
_080E4074: .4byte gUnknown_03004240
_080E4078: .4byte 0x04000048
_080E407C: .4byte 0x00003f3f
_080E4080: .4byte 0x00003f3d
_080E4084: .4byte 0x04000050
_080E4088: .4byte 0x00003f42
_080E408C: .4byte 0x0400000a
_080E4090: .4byte 0x02019348
_080E4094:
	adds r0, r7, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080E40B8
	ldr r1, _080E40B0
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E40B4
	b _080E40C6
	.align 2, 0
_080E40B0: .4byte gUnknown_02024A6A
_080E40B4: .4byte gEnemyParty
_080E40B8:
	ldr r1, _080E4184
	lsls r0, r7, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080E4188
_080E40C6:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
_080E40D2:
	ldr r5, _080E418C
	adds r0, r7, r5
	ldrb r1, [r0]
	adds r0, r7, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r8
	cmp r0, 0
	beq _080E40FC
	adds r0, r6, r5
	ldrb r1, [r0]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_807A4A0
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
_080E40FC:
	mov r0, sp
	bl sub_8078914
	ldr r1, [sp, 0x4]
	ldr r0, [sp, 0x50]
	bl LZDecompressVram
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E4122
	mov r0, sp
	ldrb r0, [r0, 0x8]
	ldr r1, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_80763FC
_080E4122:
	ldr r1, [sp]
	ldr r0, [sp, 0x4C]
	bl LZDecompressVram
	mov r0, sp
	ldrb r1, [r0, 0x8]
	lsls r1, 4
	ldr r0, [sp, 0x54]
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r0, _080E4190
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E4194
	strh r1, [r0]
	ldr r1, _080E4198
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	mov r3, sp
	ldrh r3, [r3, 0xC]
	strh r3, [r0, 0xA]
	mov r1, sp
	ldrh r1, [r1, 0x10]
	strh r1, [r0, 0x10]
	mov r2, r10
	strh r2, [r0, 0x12]
	mov r3, sp
	ldrh r3, [r3, 0x14]
	strh r3, [r0, 0x14]
	strh r7, [r0, 0x8]
	mov r1, r8
	strh r1, [r0, 0xC]
	mov r2, sp
	ldrh r2, [r2, 0x18]
	strh r2, [r0, 0xE]
	ldr r1, _080E419C
	str r1, [r0]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4184: .4byte gUnknown_02024A6A
_080E4188: .4byte gPlayerParty
_080E418C: .4byte gUnknown_02024BE0
_080E4190: .4byte gUnknown_030042C0
_080E4194: .4byte gUnknown_030041B4
_080E4198: .4byte gTasks
_080E419C: .4byte sub_80E3E64
	thumb_func_end sub_80E3C4C

	thumb_func_start sub_80E3E64
sub_80E3E64: @ 80E41A0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E41D8
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r3, r0, r1
	movs r0, 0xA
	ldrsh r2, [r3, r0]
	adds r5, r1, 0
	cmp r2, 0
	bge _080E41BC
	negs r2, r2
_080E41BC:
	ldrh r0, [r3, 0x22]
	adds r4, r0, r2
	strh r4, [r3, 0x22]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bge _080E41E0
	ldr r2, _080E41DC
	lsls r1, r4, 16
	asrs r1, 24
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r2]
	b _080E41EC
	.align 2, 0
_080E41D8: .4byte gTasks
_080E41DC: .4byte gUnknown_030041B4
_080E41E0:
	ldr r1, _080E4210
	lsls r0, r4, 16
	asrs r0, 24
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
_080E41EC:
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r4, r0, r5
	ldrh r1, [r4, 0x22]
	movs r0, 0xFF
	ands r0, r1
	movs r2, 0
	strh r0, [r4, 0x22]
	movs r3, 0x26
	ldrsh r0, [r4, r3]
	cmp r0, 0x1
	beq _080E4254
	cmp r0, 0x1
	bgt _080E4214
	cmp r0, 0
	beq _080E421A
	b _080E431E
	.align 2, 0
_080E4210: .4byte gUnknown_030041B4
_080E4214:
	cmp r0, 0x2
	beq _080E426E
	b _080E431E
_080E421A:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E431E
	strh r2, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	adds r1, 0x1
	strh r1, [r4, 0x20]
	ldr r2, _080E4250
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080E431E
	b _080E4266
	.align 2, 0
_080E4250: .4byte 0x04000052
_080E4254:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x12
	ldrsh r1, [r4, r3]
	cmp r0, r1
	bne _080E431E
_080E4266:
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	b _080E431E
_080E426E:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x14
	ldrsh r1, [r4, r3]
	cmp r0, r1
	blt _080E431E
	strh r2, [r4, 0x1E]
	ldrh r1, [r4, 0x20]
	subs r1, 0x1
	strh r1, [r4, 0x20]
	ldr r7, _080E4324
	movs r0, 0x10
	subs r0, r1
	lsls r0, 8
	orrs r1, r0
	strh r1, [r7]
	movs r0, 0x20
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _080E431E
	movs r0, 0
	bl sub_8076464
	ldr r0, _080E4328
	strh r5, [r0]
	ldr r0, _080E432C
	strh r5, [r0]
	ldr r0, _080E4330
	ldr r2, _080E4334
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080E42CC
	ldr r2, _080E4338
	ldrb r1, [r2]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_080E42CC:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 8
	adds r1, r3, 0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _080E433C
	strh r5, [r0]
	strh r5, [r7]
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _080E4340
	adds r0, r5
	bl DestroySprite
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080E430C
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl DestroySprite
_080E430C:
	ldr r2, _080E4338
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	adds r0, r6, 0
	bl move_anim_task_del
_080E431E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4324: .4byte 0x04000052
_080E4328: .4byte gUnknown_030042C4
_080E432C: .4byte gUnknown_03004240
_080E4330: .4byte 0x04000048
_080E4334: .4byte 0x00003f3f
_080E4338: .4byte 0x0400000a
_080E433C: .4byte 0x04000050
_080E4340: .4byte gSprites
	thumb_func_end sub_80E3E64

	thumb_func_start sub_80E4008
sub_80E4008: @ 80E4344
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E435C
	ldr r1, _080E4360
	ldrb r1, [r1]
	strh r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080E435C: .4byte gUnknown_03004B00
_080E4360: .4byte gUnknown_0300428C
	thumb_func_end sub_80E4008

	thumb_func_start sub_80E4028
sub_80E4028: @ 80E4364
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r0, _080E43A4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E43A8
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E43C0
	movs r2, 0x1
_080E4396:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080E4396
	b _080E43C0
	.align 2, 0
_080E43A4: .4byte gUnknown_03004B00
_080E43A8:
	cmp r0, 0x1
	bne _080E43B4
	ldr r0, _080E43B0
	b _080E43BA
	.align 2, 0
_080E43B0: .4byte gUnknown_0202F7C8
_080E43B4:
	cmp r0, 0x2
	bne _080E43C0
	ldr r0, _080E43D8
_080E43BA:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080E43C0:
	ldr r0, _080E43DC
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	lsls r5, r0, 5
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E43E4
	ldr r0, _080E43E0
	b _080E43E6
	.align 2, 0
_080E43D8: .4byte gUnknown_0202F7C9
_080E43DC: .4byte gUnknown_03004B00
_080E43E0: .4byte 0x02014800
_080E43E4:
	ldr r0, _080E4404
_080E43E6:
	adds r2, r5, r0
	lsls r1, r4, 5
	ldr r0, _080E4408
	adds r1, r0
	adds r0, r2, 0
	movs r2, 0x20
	bl memcpy
	adds r0, r6, 0
	bl move_anim_task_del
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E4404: .4byte 0x02018000
_080E4408: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80E4028

	thumb_func_start sub_80E40D0
sub_80E40D0: @ 80E440C
	push {r4-r6,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r0, _080E444C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E4450
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E4468
	movs r2, 0x1
_080E443E:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080E443E
	b _080E4468
	.align 2, 0
_080E444C: .4byte gUnknown_03004B00
_080E4450:
	cmp r0, 0x1
	bne _080E445C
	ldr r0, _080E4458
	b _080E4462
	.align 2, 0
_080E4458: .4byte gUnknown_0202F7C8
_080E445C:
	cmp r0, 0x2
	bne _080E4468
	ldr r0, _080E4484
_080E4462:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080E4468:
	lsls r1, r4, 5
	ldr r0, _080E4488
	adds r5, r1, r0
	ldr r0, _080E448C
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	lsls r4, r0, 5
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E4494
	ldr r0, _080E4490
	b _080E4496
	.align 2, 0
_080E4484: .4byte gUnknown_0202F7C9
_080E4488: .4byte gPlttBufferUnfaded
_080E448C: .4byte gUnknown_03004B00
_080E4490: .4byte 0x02014800
_080E4494:
	ldr r0, _080E44B0
_080E4496:
	adds r1, r4, r0
	adds r0, r5, 0
	movs r2, 0x20
	bl memcpy
	adds r0, r6, 0
	bl move_anim_task_del
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E44B0: .4byte 0x02018000
	thumb_func_end sub_80E40D0

	thumb_func_start sub_80E4178
sub_80E4178: @ 80E44B4
	push {r4,r5,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _080E44F4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _080E44F8
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	movs r0, 0x1
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl sub_80791A8
	adds r1, r0, 0
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080E4510
	movs r2, 0x1
_080E44E6:
	lsrs r1, 1
	adds r4, 0x1
	adds r0, r1, 0
	ands r0, r2
	cmp r0, 0
	beq _080E44E6
	b _080E4510
	.align 2, 0
_080E44F4: .4byte gUnknown_03004B00
_080E44F8:
	cmp r0, 0x1
	bne _080E4504
	ldr r0, _080E4500
	b _080E450A
	.align 2, 0
_080E4500: .4byte gUnknown_0202F7C8
_080E4504:
	cmp r0, 0x2
	bne _080E4510
	ldr r0, _080E4530
_080E450A:
	ldrb r0, [r0]
	adds r4, r0, 0
	adds r4, 0x10
_080E4510:
	lsls r1, r4, 5
	ldr r0, _080E4534
	adds r0, r1, r0
	ldr r2, _080E4538
	adds r1, r2
	movs r2, 0x20
	bl memcpy
	adds r0, r5, 0
	bl move_anim_task_del
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E4530: .4byte gUnknown_0202F7C9
_080E4534: .4byte gPlttBufferUnfaded
_080E4538: .4byte gPlttBufferFaded
	thumb_func_end sub_80E4178

	thumb_func_start sub_80E4200
sub_80E4200: @ 80E453C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080E455C
	ldr r1, _080E4558
	movs r0, 0x1
	strh r0, [r1, 0xE]
	b _080E4560
	.align 2, 0
_080E4558: .4byte gUnknown_03004B00
_080E455C:
	ldr r0, _080E456C
	strh r1, [r0, 0xE]
_080E4560:
	adds r0, r4, 0
	bl move_anim_task_del
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E456C: .4byte gUnknown_03004B00
	thumb_func_end sub_80E4200

	thumb_func_start sub_80E4234
sub_80E4234: @ 80E4570
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E4590
	ldr r1, _080E4594
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080E4598
	ldr r1, _080E459C
	ldrb r1, [r1]
	strb r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080E4590: .4byte gUnknown_0202F7C8
_080E4594: .4byte gUnknown_02024C08
_080E4598: .4byte gUnknown_0202F7C9
_080E459C: .4byte gUnknown_02024C0A
	thumb_func_end sub_80E4234

	thumb_func_start sub_80E4264
sub_80E4264: @ 80E45A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080E45C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	adds r4, r0, 0
	ldr r0, _080E45CC
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	bne _080E45D4
	ldr r1, _080E45D0
	movs r0, 0x1
	b _080E45D8
	.align 2, 0
_080E45C8: .4byte gUnknown_0202F7C8
_080E45CC: .4byte gUnknown_0202F7C9
_080E45D0: .4byte gUnknown_03004B00
_080E45D4:
	ldr r1, _080E45E8
	movs r0, 0
_080E45D8:
	strh r0, [r1, 0xE]
	adds r0, r5, 0
	bl move_anim_task_del
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E45E8: .4byte gUnknown_03004B00
	thumb_func_end sub_80E4264

	thumb_func_start sub_80E42B0
sub_80E42B0: @ 80E45EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E4604
	ldr r1, _080E4608
	ldrb r1, [r1]
	strb r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080E4604: .4byte gUnknown_0202F7C9
_080E4608: .4byte gUnknown_02024C08
	thumb_func_end sub_80E42B0

	thumb_func_start sub_80E42D0
sub_80E42D0: @ 80E460C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E462C
	ldr r1, _080E4630
	ldrb r1, [r1]
	strb r1, [r2]
	ldr r2, _080E4634
	ldr r1, _080E4638
	ldrb r1, [r1]
	strb r1, [r2]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_080E462C: .4byte gUnknown_0202F7C8
_080E4630: .4byte gUnknown_02024C07
_080E4634: .4byte gUnknown_0202F7C9
_080E4638: .4byte gUnknown_02024C0A
	thumb_func_end sub_80E42D0

	thumb_func_start sub_80E4300
sub_80E4300: @ 80E463C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080E4654
	adds r0, r4, 0
	bl move_anim_task_del
	b _080E468A
_080E4654:
	ldr r0, _080E4690
	lsls r3, r4, 2
	adds r3, r4
	lsls r3, 3
	adds r3, r0
	ldr r1, _080E4694
	ldrb r0, [r1]
	lsls r0, 2
	ldr r2, _080E4698
	adds r0, r2
	ldr r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	strh r0, [r3, 0x8]
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080E469C
	str r0, [r3]
	ldr r1, _080E46A0
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
_080E468A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4690: .4byte gTasks
_080E4694: .4byte gUnknown_0202F7C8
_080E4698: .4byte 0x02017800
_080E469C: .4byte sub_80E4368
_080E46A0: .4byte gUnknown_0202F7B2
	thumb_func_end sub_80E4300

	thumb_func_start sub_80E4368
sub_80E4368: @ 80E46A4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E46EC
	movs r2, 0xE
	ldrsh r1, [r0, r2]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _080E46E4
	ldr r0, _080E46F0
	ldrb r3, [r0]
	lsls r3, 2
	ldr r0, _080E46F4
	adds r3, r0
	ldr r1, _080E46F8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0x1
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r4, 0
	bl DestroyTask
_080E46E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E46EC: .4byte gUnknown_03004B00
_080E46F0: .4byte gUnknown_0202F7C8
_080E46F4: .4byte 0x02017800
_080E46F8: .4byte gTasks
	thumb_func_end sub_80E4368

	thumb_func_start sub_80E43C0
sub_80E43C0: @ 80E46FC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080E4714
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E471C
	ldr r0, _080E4718
	b _080E4744
	.align 2, 0
_080E4714: .4byte gUnknown_020239F8
_080E4718: .4byte sub_80E4C34
_080E471C:
	movs r0, 0x80
	lsls r0, 5
	ands r0, r1
	cmp r0, 0
	beq _080E473C
	ldr r0, _080E4734
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _080E473C
	movs r4, 0x3
	ldr r0, _080E4738
	b _080E4744
	.align 2, 0
_080E4734: .4byte gGameVersion
_080E4738: .4byte task00_battle_intro_80BC6C8
_080E473C:
	ldr r1, _080E4770
	lsls r0, r4, 2
	adds r0, r1
	ldr r0, [r0]
_080E4744:
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080E4774
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r0, [r1, 0x10]
	strh r0, [r1, 0x12]
	strh r0, [r1, 0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E4770: .4byte gUnknown_083DB56C
_080E4774: .4byte gTasks
	thumb_func_end sub_80E43C0

	thumb_func_start sub_80E443C
sub_80E443C: @ 80E4778
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r0, _080E47B0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080E47B4
	strh r1, [r0]
	ldr r0, _080E47B8
	strh r1, [r0]
	ldr r0, _080E47BC
	strh r1, [r0]
	ldr r0, _080E47C0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0xC
	ldr r2, _080E47C4
	adds r1, r2, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080E47B0: .4byte gUnknown_030042C0
_080E47B4: .4byte gUnknown_030041B4
_080E47B8: .4byte gUnknown_03004288
_080E47BC: .4byte gUnknown_03004280
_080E47C0: .4byte 0x04000050
_080E47C4: .4byte 0x00003f3f
	thumb_func_end sub_80E443C

	thumb_func_start task_battle_intro_80BC47C
task_battle_intro_80BC47C: @ 80E47C8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E4800
	ldrh r0, [r1]
	adds r0, 0x6
	strh r0, [r1]
	ldr r1, _080E4804
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0x4
	bls _080E47F4
	b _080E49FA
_080E47F4:
	lsls r0, 2
	ldr r1, _080E4808
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4800: .4byte gUnknown_030042C0
_080E4804: .4byte gTasks
_080E4808: .4byte _080E480C
	.align 2, 0
_080E480C:
	.4byte _080E4820
	.4byte _080E4850
	.4byte _080E487C
	.4byte _080E48C4
	.4byte _080E49F4
_080E4820:
	ldr r0, _080E4838
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E483C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x10
	b _080E4846
	.align 2, 0
_080E4838: .4byte gUnknown_020239F8
_080E483C:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	add r0, r8
	movs r1, 0x1
_080E4846:
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080E49FA
_080E4850:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	mov r3, r8
	adds r1, r0, r3
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E4868
	b _080E49FA
_080E4868:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4878
	movs r0, 0x3F
	strh r0, [r1]
	b _080E49FA
	.align 2, 0
_080E4878: .4byte 0x04000048
_080E487C:
	ldr r1, _080E48B8
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4894
	b _080E49FA
_080E4894:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	add r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080E48BC
	ldrh r1, [r2]
	ldr r0, _080E48C0
	ands r0, r1
	strh r0, [r2]
	b _080E49FA
	.align 2, 0
_080E48B8: .4byte gUnknown_03004240
_080E48BC: .4byte gUnknown_02024DE8
_080E48C0: .4byte 0x0000fffe
_080E48C4:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	mov r5, r8
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r5, 0xE
	ldrsh r1, [r2, r5]
	mov r12, r0
	cmp r1, 0
	beq _080E48E0
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080E490E
_080E48E0:
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	bne _080E4900
	ldr r2, _080E48F8
	ldrh r1, [r2]
	ldr r0, _080E48FC
	cmp r1, r0
	beq _080E490E
	subs r0, r1, 0x2
	b _080E490C
	.align 2, 0
_080E48F8: .4byte gUnknown_030041B4
_080E48FC: .4byte 0x0000ffb0
_080E4900:
	ldr r2, _080E49CC
	ldrh r1, [r2]
	ldr r0, _080E49D0
	cmp r1, r0
	beq _080E490E
	subs r0, r1, 0x1
_080E490C:
	strh r0, [r2]
_080E490E:
	ldr r2, _080E49D4
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E4922
	ldr r3, _080E49D8
	adds r0, r1, r3
	strh r0, [r2]
_080E4922:
	mov r5, r12
	adds r0, r5, r4
	lsls r0, 3
	mov r2, r8
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E493A
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E493A:
	movs r3, 0
	ldr r5, _080E49DC
	mov r9, r5
	ldr r7, _080E49E0
	mov r6, r9
	adds r5, r1, 0
_080E4946:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E4946
	cmp r3, 0x9F
	bgt _080E498A
	ldr r7, _080E49E0
	ldr r6, _080E49DC
	ldr r1, _080E49E4
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080E4970:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4970
_080E498A:
	mov r3, r12
	adds r0, r3, r4
	lsls r0, 3
	mov r5, r8
	adds r1, r0, r5
	movs r0, 0xC
	ldrsh r2, [r1, r0]
	cmp r2, 0
	bne _080E49FA
	movs r0, 0x3
	mov r3, r9
	strb r0, [r3, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E49E8
	ldr r2, _080E49EC
	mov r0, sp
	bl CpuSet
	ldr r1, _080E49F0
	movs r5, 0x9C
	lsls r5, 8
	adds r0, r5, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xBC
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	b _080E49FA
	.align 2, 0
_080E49CC: .4byte gUnknown_030041B4
_080E49D0: .4byte 0x0000ffc8
_080E49D4: .4byte gUnknown_03004240
_080E49D8: .4byte 0xfffffc04
_080E49DC: .4byte gUnknown_03004DC0
_080E49E0: .4byte gUnknown_03004DE0
_080E49E4: .4byte gTasks
_080E49E8: .4byte 0x0600e000
_080E49EC: .4byte 0x05000200
_080E49F0: .4byte 0x0400000a
_080E49F4:
	adds r0, r4, 0
	bl sub_80E443C
_080E49FA:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end task_battle_intro_80BC47C

	thumb_func_start task00_battle_intro_80BC6C8
task00_battle_intro_80BC6C8: @ 80E4A08
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080E4A34
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r2, 0xA
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x3
	beq _080E4A48
	cmp r0, 0x3
	bgt _080E4A38
	cmp r0, 0x2
	beq _080E4A3C
	b _080E4A50
	.align 2, 0
_080E4A34: .4byte gTasks
_080E4A38:
	cmp r0, 0x4
	bne _080E4A50
_080E4A3C:
	ldr r1, _080E4A44
	ldrh r0, [r1]
	adds r0, 0x8
	b _080E4A4E
	.align 2, 0
_080E4A44: .4byte gUnknown_030042C0
_080E4A48:
	ldr r1, _080E4A8C
	ldrh r0, [r1]
	adds r0, 0x6
_080E4A4E:
	strh r0, [r1]
_080E4A50:
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	adds r4, r1, r2
	movs r3, 0xA
	ldrsh r1, [r4, r3]
	adds r6, r0, 0
	cmp r1, 0x4
	bne _080E4AB4
	ldr r7, _080E4A90
	ldrh r0, [r4, 0x14]
	bl Cos2
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _080E4A76
	ldr r1, _080E4A94
	adds r0, r1
_080E4A76:
	asrs r0, 9
	subs r0, 0x8
	strh r0, [r7]
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0xB3
	bgt _080E4A98
	adds r0, r1, 0x4
	b _080E4A9A
	.align 2, 0
_080E4A8C: .4byte gUnknown_030042C0
_080E4A90: .4byte gUnknown_030041B4
_080E4A94: .4byte 0x000001ff
_080E4A98:
	adds r0, r1, 0x6
_080E4A9A:
	strh r0, [r4, 0x14]
	ldr r2, _080E4AD0
	adds r0, r6, r5
	lsls r0, 3
	adds r3, r0, r2
	movs r4, 0x14
	ldrsh r1, [r3, r4]
	movs r0, 0xB4
	lsls r0, 1
	cmp r1, r0
	bne _080E4AB4
	movs r0, 0
	strh r0, [r3, 0x14]
_080E4AB4:
	adds r0, r6, r5
	lsls r0, 3
	adds r0, r2
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x4
	bls _080E4AC4
	b _080E4CD2
_080E4AC4:
	lsls r0, 2
	ldr r1, _080E4AD4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4AD0: .4byte gTasks
_080E4AD4: .4byte _080E4AD8
	.align 2, 0
_080E4AD8:
	.4byte _080E4AEC
	.4byte _080E4B1C
	.4byte _080E4B48
	.4byte _080E4B98
	.4byte _080E4CCC
_080E4AEC:
	ldr r1, _080E4B08
	adds r0, r6, r5
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x10
	strh r3, [r2, 0x10]
	ldr r0, _080E4B0C
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E4B10
	strh r3, [r2, 0xC]
	b _080E4B14
	.align 2, 0
_080E4B08: .4byte gTasks
_080E4B0C: .4byte gUnknown_020239F8
_080E4B10:
	movs r0, 0x1
	strh r0, [r2, 0xC]
_080E4B14:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _080E4CD2
_080E4B1C:
	ldr r0, _080E4B40
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E4B32
	b _080E4CD2
_080E4B32:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4B44
	movs r0, 0x3F
	strh r0, [r1]
	b _080E4CD2
	.align 2, 0
_080E4B40: .4byte gTasks
_080E4B44: .4byte 0x04000048
_080E4B48:
	ldr r1, _080E4B88
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4B60
	b _080E4CD2
_080E4B60:
	ldr r0, _080E4B8C
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080E4B90
	ldrh r1, [r2]
	ldr r0, _080E4B94
	ands r0, r1
	strh r0, [r2]
	b _080E4CD2
	.align 2, 0
_080E4B88: .4byte gUnknown_03004240
_080E4B8C: .4byte gTasks
_080E4B90: .4byte gUnknown_02024DE8
_080E4B94: .4byte 0x0000fffe
_080E4B98:
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r3, [r1, 0xE]
	movs r4, 0xE
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _080E4BD4
	subs r0, r3, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	asrs r3, r0, 16
	cmp r3, 0
	bne _080E4BF4
	ldr r1, _080E4BC8
	ldr r4, _080E4BCC
	adds r0, r4, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xF
	strh r0, [r1]
	ldr r0, _080E4BD0
	strh r3, [r0]
	b _080E4BF4
	.align 2, 0
_080E4BC8: .4byte 0x04000050
_080E4BCC: .4byte 0x00001842
_080E4BD0: .4byte 0x04000054
_080E4BD4:
	ldrh r3, [r1, 0x10]
	movs r0, 0x1F
	ands r0, r3
	cmp r0, 0
	beq _080E4BF4
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080E4BF4
	adds r0, r3, 0
	adds r0, 0xFF
	strh r0, [r1, 0x10]
	movs r0, 0x4
	strh r0, [r1, 0x12]
_080E4BF4:
	ldr r3, _080E4CAC
	ldrh r1, [r3]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E4C08
	ldr r4, _080E4CB0
	adds r0, r1, r4
	strh r0, [r3]
_080E4C08:
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E4C1C
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E4C1C:
	movs r3, 0
	ldr r4, _080E4CB4
	mov r8, r4
	ldr r0, _080E4CB8
	mov r12, r0
	mov r7, r8
	adds r4, r1, 0
_080E4C2A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E4C2A
	cmp r3, 0x9F
	bgt _080E4C6E
	ldr r1, _080E4CB8
	mov r12, r1
	ldr r7, _080E4CB4
	ldr r1, _080E4CBC
	adds r0, r6, r5
	lsls r0, 3
	adds r4, r0, r1
_080E4C54:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r12
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4C54
_080E4C6E:
	ldr r1, _080E4CBC
	adds r0, r6, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080E4CD2
	movs r0, 0x3
	mov r4, r8
	strb r0, [r4, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E4CC0
	ldr r2, _080E4CC4
	mov r0, sp
	bl CpuSet
	ldr r1, _080E4CC8
	movs r2, 0x9C
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xBC
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	b _080E4CD2
	.align 2, 0
_080E4CAC: .4byte gUnknown_03004240
_080E4CB0: .4byte 0xfffffc04
_080E4CB4: .4byte gUnknown_03004DC0
_080E4CB8: .4byte gUnknown_03004DE0
_080E4CBC: .4byte gTasks
_080E4CC0: .4byte 0x0600e000
_080E4CC4: .4byte 0x05000200
_080E4CC8: .4byte 0x0400000a
_080E4CCC:
	adds r0, r5, 0
	bl sub_80E443C
_080E4CD2:
	ldr r0, _080E4CF4
	adds r1, r6, r5
	lsls r1, 3
	adds r2, r1, r0
	movs r4, 0x8
	ldrsh r0, [r2, r4]
	cmp r0, 0x4
	beq _080E4CE8
	ldr r1, _080E4CF8
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
_080E4CE8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4CF4: .4byte gTasks
_080E4CF8: .4byte 0x04000052
	thumb_func_end task00_battle_intro_80BC6C8

	thumb_func_start task_battle_intro_anim
task_battle_intro_anim: @ 80E4CFC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080E4D30
	ldrh r0, [r1]
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, _080E4D34
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r5, r1, 0
	cmp r0, 0x4
	bls _080E4D26
	b _080E4F42
_080E4D26:
	lsls r0, 2
	ldr r1, _080E4D38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E4D30: .4byte gUnknown_030042C0
_080E4D34: .4byte gTasks
_080E4D38: .4byte _080E4D3C
	.align 2, 0
_080E4D3C:
	.4byte _080E4D50
	.4byte _080E4DA8
	.4byte _080E4DD8
	.4byte _080E4E28
	.4byte _080E4F3C
_080E4D50:
	ldr r1, _080E4D84
	ldr r3, _080E4D88
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080E4D8C
	ldr r6, _080E4D90
	adds r2, r6, 0
	strh r2, [r0]
	adds r1, 0x4
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080E4D94
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r3, r0, r1
	strh r2, [r3, 0x10]
	ldr r0, _080E4D98
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080E4D9C
	movs r0, 0x10
	b _080E4D9E
	.align 2, 0
_080E4D84: .4byte 0x04000050
_080E4D88: .4byte 0x00001842
_080E4D8C: .4byte 0x04000052
_080E4D90: .4byte 0x00000808
_080E4D94: .4byte gTasks
_080E4D98: .4byte gUnknown_020239F8
_080E4D9C:
	movs r0, 0x1
_080E4D9E:
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	b _080E4F42
_080E4DA8:
	ldr r0, _080E4DD0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E4DC0
	b _080E4F42
_080E4DC0:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E4DD4
	movs r0, 0x3F
	strh r0, [r1]
	b _080E4F42
	.align 2, 0
_080E4DD0: .4byte gTasks
_080E4DD4: .4byte 0x04000048
_080E4DD8:
	ldr r1, _080E4E18
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E4DF0
	b _080E4F42
_080E4DF0:
	ldr r0, _080E4E1C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	movs r0, 0x1
	strh r0, [r1, 0x12]
	ldr r2, _080E4E20
	ldrh r1, [r2]
	ldr r0, _080E4E24
	ands r0, r1
	strh r0, [r2]
	b _080E4F42
	.align 2, 0
_080E4E18: .4byte gUnknown_03004240
_080E4E1C: .4byte gTasks
_080E4E20: .4byte gUnknown_02024DE8
_080E4E24: .4byte 0x0000fffe
_080E4E28:
	lsls r0, r4, 2
	adds r1, r0, r4
	lsls r1, 3
	adds r2, r1, r5
	ldrh r3, [r2, 0xE]
	movs r6, 0xE
	ldrsh r1, [r2, r6]
	mov r12, r0
	cmp r1, 0
	beq _080E4E42
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	b _080E4E62
_080E4E42:
	ldrh r1, [r2, 0x10]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _080E4E62
	ldrh r0, [r2, 0x12]
	subs r0, 0x1
	strh r0, [r2, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080E4E62
	adds r0, r1, 0
	adds r0, 0xFF
	strh r0, [r2, 0x10]
	movs r0, 0x6
	strh r0, [r2, 0x12]
_080E4E62:
	ldr r2, _080E4F1C
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E4E76
	ldr r3, _080E4F20
	adds r0, r1, r3
	strh r0, [r2]
_080E4E76:
	mov r6, r12
	adds r0, r6, r4
	lsls r0, 3
	adds r1, r0, r5
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E4E8C
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E4E8C:
	movs r3, 0
	ldr r6, _080E4F24
	mov r8, r6
	ldr r7, _080E4F28
	adds r5, r1, 0
_080E4E96:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E4E96
	cmp r3, 0x9F
	bgt _080E4EDA
	ldr r7, _080E4F28
	ldr r6, _080E4F24
	ldr r1, _080E4F2C
	mov r2, r12
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r1
_080E4EC0:
	lsls r2, r3, 1
	ldrb r1, [r6, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	adds r2, r7
	ldrh r0, [r5, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E4EC0
_080E4EDA:
	ldr r1, _080E4F2C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0xC
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080E4F42
	movs r0, 0x3
	mov r6, r8
	strb r0, [r6, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	str r2, [sp]
	ldr r1, _080E4F30
	ldr r2, _080E4F34
	mov r0, sp
	bl CpuSet
	ldr r1, _080E4F38
	movs r2, 0x9C
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0xBC
	lsls r3, 7
	adds r0, r3, 0
	strh r0, [r1]
	b _080E4F42
	.align 2, 0
_080E4F1C: .4byte gUnknown_03004240
_080E4F20: .4byte 0xfffffc04
_080E4F24: .4byte gUnknown_03004DC0
_080E4F28: .4byte gUnknown_03004DE0
_080E4F2C: .4byte gTasks
_080E4F30: .4byte 0x0600e000
_080E4F34: .4byte 0x05000200
_080E4F38: .4byte 0x0400000a
_080E4F3C:
	adds r0, r4, 0
	bl sub_80E443C
_080E4F42:
	ldr r0, _080E4F68
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r2, r1, r0
	movs r6, 0x8
	ldrsh r0, [r2, r6]
	cmp r0, 0x4
	beq _080E4F5A
	ldr r1, _080E4F6C
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
_080E4F5A:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E4F68: .4byte gTasks
_080E4F6C: .4byte 0x04000052
	thumb_func_end task_battle_intro_anim

	thumb_func_start sub_80E4C34
sub_80E4C34: @ 80E4F70
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _080E4FBC
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r7, r0, r1
	movs r1, 0x8
	ldrsh r0, [r7, r1]
	cmp r0, 0x1
	ble _080E4FE6
	movs r2, 0x10
	ldrsh r0, [r7, r2]
	cmp r0, 0
	bne _080E4FE6
	ldr r2, _080E4FC0
	ldrh r1, [r2]
	movs r0, 0x80
	lsls r0, 8
	ands r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080E4FAE
	cmp r1, 0x4F
	bhi _080E4FC8
_080E4FAE:
	adds r0, r1, 0x3
	strh r0, [r2]
	ldr r1, _080E4FC4
	ldrh r0, [r1]
	subs r0, 0x3
	strh r0, [r1]
	b _080E4FE6
	.align 2, 0
_080E4FBC: .4byte gTasks
_080E4FC0: .4byte gUnknown_030042C0
_080E4FC4: .4byte gUnknown_03004288
_080E4FC8:
	str r5, [sp]
	ldr r1, _080E5008
	ldr r4, _080E500C
	mov r0, sp
	adds r2, r4, 0
	bl CpuSet
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	ldr r1, _080E5010
	adds r2, r4, 0
	bl CpuSet
	movs r0, 0x1
	strh r0, [r7, 0x10]
_080E4FE6:
	ldr r0, _080E5014
	lsls r2, r6, 2
	adds r1, r2, r6
	lsls r1, 3
	adds r1, r0
	movs r3, 0x8
	ldrsh r1, [r1, r3]
	mov r12, r0
	adds r5, r2, 0
	cmp r1, 0x4
	bls _080E4FFE
	b _080E51F6
_080E4FFE:
	lsls r0, r1, 2
	ldr r1, _080E5018
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E5008: .4byte 0x0600e000
_080E500C: .4byte 0x05000200
_080E5010: .4byte 0x0600f000
_080E5014: .4byte gTasks
_080E5018: .4byte _080E501C
	.align 2, 0
_080E501C:
	.4byte _080E5030
	.4byte _080E5042
	.4byte _080E50E4
	.4byte _080E5128
	.4byte _080E51F0
_080E5030:
	adds r0, r5, r6
	lsls r0, 3
	add r0, r12
	movs r1, 0x10
	strh r1, [r0, 0xC]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080E51F6
_080E5042:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r0, [r1, 0xC]
	subs r0, 0x1
	strh r0, [r1, 0xC]
	lsls r0, 16
	cmp r0, 0
	beq _080E5058
	b _080E51F6
_080E5058:
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r5, _080E50C8
	ldr r4, _080E50CC
	ldr r3, _080E50D0
	adds r6, r4, r3
	ldrb r0, [r6]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x8
	mov r8, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r1, 0x1]
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r6, r5, 0
	adds r6, 0x1C
	adds r0, r6
	ldr r3, _080E50D4
	str r3, [r0]
	ldr r0, _080E50D8
	adds r4, r0
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r2, r1
	mov r1, r8
	orrs r2, r1
	strb r2, [r0, 0x1]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	str r3, [r0]
	ldr r1, _080E50DC
	movs r0, 0x3F
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080E50E0
	b _080E51D0
	.align 2, 0
_080E50C8: .4byte gSprites
_080E50CC: .4byte 0x02000000
_080E50D0: .4byte 0x0001608a
_080E50D4: .4byte sub_800FE20
_080E50D8: .4byte 0x0001608b
_080E50DC: .4byte 0x04000048
_080E50E0: .4byte 0x00003f06
_080E50E4:
	ldr r1, _080E511C
	ldrh r0, [r1]
	subs r0, 0xFF
	strh r0, [r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 6
	cmp r0, r1
	beq _080E50FC
	b _080E51F6
_080E50FC:
	adds r1, r5, r6
	lsls r1, 3
	add r1, r12
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0xF0
	strh r0, [r1, 0xC]
	movs r0, 0x20
	strh r0, [r1, 0xE]
	ldr r2, _080E5120
	ldrh r1, [r2]
	ldr r0, _080E5124
	ands r0, r1
	strh r0, [r2]
	b _080E51F6
	.align 2, 0
_080E511C: .4byte gUnknown_03004240
_080E5120: .4byte gUnknown_02024DE8
_080E5124: .4byte 0x0000fffe
_080E5128:
	ldr r2, _080E51D8
	ldrh r1, [r2]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	cmp r0, 0
	beq _080E513C
	ldr r3, _080E51DC
	adds r0, r1, r3
	strh r0, [r2]
_080E513C:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _080E5152
	subs r0, r2, 0x2
	strh r0, [r1, 0xC]
_080E5152:
	movs r3, 0
	ldr r0, _080E51E0
	mov r9, r0
	ldr r2, _080E51E4
	mov r8, r2
	mov r7, r9
	adds r4, r1, 0
_080E5160:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x4F
	ble _080E5160
	cmp r3, 0x9F
	bgt _080E51A4
	ldr r0, _080E51E4
	mov r8, r0
	ldr r7, _080E51E0
	ldr r1, _080E51E8
	adds r0, r5, r6
	lsls r0, 3
	adds r4, r0, r1
_080E518A:
	lsls r2, r3, 1
	ldrb r1, [r7, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 7
	adds r2, r0
	add r2, r8
	ldrh r0, [r4, 0xC]
	negs r0, r0
	strh r0, [r2]
	adds r3, 0x1
	cmp r3, 0x9F
	ble _080E518A
_080E51A4:
	adds r0, r5, r6
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _080E51F6
	movs r0, 0x3
	mov r2, r9
	strb r0, [r2, 0x15]
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	ldr r1, _080E51EC
	movs r3, 0x9C
	lsls r3, 8
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r2, 0xBC
	lsls r2, 7
_080E51D0:
	adds r0, r2, 0
	strh r0, [r1]
	b _080E51F6
	.align 2, 0
_080E51D8: .4byte gUnknown_03004240
_080E51DC: .4byte 0xfffffc04
_080E51E0: .4byte gUnknown_03004DC0
_080E51E4: .4byte gUnknown_03004DE0
_080E51E8: .4byte gTasks
_080E51EC: .4byte 0x0400000a
_080E51F0:
	adds r0, r6, 0
	bl sub_80E443C
_080E51F6:
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80E4C34

	thumb_func_start unref_sub_80E4EC8
unref_sub_80E4EC8: @ 80E5204
	push {r4,lr}
	sub sp, 0xC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0x80
	lsls r4, 7
	str r4, [sp]
	movs r4, 0x1E
	str r4, [sp, 0x4]
	movs r4, 0x1
	str r4, [sp, 0x8]
	bl sub_80E4EF8
	add sp, 0xC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80E4EC8

	thumb_func_start sub_80E4EF8
sub_80E4EF8: @ 80E5234
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r9, r1
	adds r4, r2, 0
	ldr r1, [sp, 0x24]
	mov r8, r1
	ldr r1, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	mov r7, r9
	lsls r7, 24
	adds r0, r7, 0
	lsrs r0, 24
	mov r9, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	mov r3, r8
	lsls r3, 16
	mov r8, r3
	lsrs r6, r3, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r5, 24
	lsrs r5, 24
	adds r0, r4, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080E5308
	ldr r1, _080E530C
	lsls r4, 2
	adds r4, r1
	ldr r1, _080E5310
	adds r0, r1
	ldrb r1, [r0]
	lsls r1, 11
	ldr r0, [r4]
	adds r0, r1
	str r0, [r2]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r2, 0x4]
	ldr r0, _080E5314
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	mov r0, r8
	lsrs r0, 21
	lsls r5, 9
	subs r5, r0, r5
	mov r0, r9
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080E52F8
	mov r9, r1
	mov r1, r10
	lsls r1, 1
	mov r8, r1
	lsls r7, 11
	mov r12, r7
_080E52C2:
	mov r2, r10
	adds r4, r2, 0
	adds r4, 0x8
	adds r1, r0, 0x1
	cmp r2, r4
	bge _080E52F2
	ldr r3, [sp]
	lsls r6, r3, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	add r0, r12
	mov r7, r8
	adds r3, r7, r0
	subs r2, r4, r2
_080E52E2:
	adds r0, r5, 0
	orrs r0, r6
	strh r0, [r3]
	adds r5, 0x1
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E52E2
_080E52F2:
	adds r0, r1, 0
	cmp r0, r9
	blt _080E52C2
_080E52F8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E5308: .4byte 0x040000d4
_080E530C: .4byte gUnknown_081FAF4C
_080E5310: .4byte gUnknown_02024E84
_080E5314: .4byte 0x80000400
	thumb_func_end sub_80E4EF8

	thumb_func_start unref_sub_80E4FDC
unref_sub_80E4FDC: @ 80E5318
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	ldr r5, [sp, 0x28]
	mov r8, r5
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	mov r9, r6
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 24
	lsls r2, 24
	lsls r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	mov r7, r8
	lsls r7, 16
	lsrs r6, r7, 16
	lsls r5, 24
	lsrs r5, 24
	mov r0, r9
	lsls r0, 24
	mov r9, r0
	ldr r4, _080E53D8
	ldr r0, _080E53DC
	lsrs r2, 22
	adds r2, r0
	lsrs r3, 13
	ldr r0, [r2]
	adds r0, r3
	str r0, [r4]
	movs r0, 0xC0
	lsls r0, 19
	adds r6, r0
	str r6, [r4, 0x4]
	ldr r0, _080E53E0
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, r7, 0
	lsrs r2, 21
	mov r6, r9
	lsrs r6, 15
	subs r4, r2, r6
	lsrs r0, r1, 24
	adds r1, r0, 0
	adds r1, 0x8
	cmp r0, r1
	bge _080E53C8
	mov r9, r1
	mov r7, r12
	lsls r7, 1
	mov r8, r7
	lsls r5, 11
	str r5, [sp]
_080E5390:
	mov r2, r12
	adds r3, r2, 0
	adds r3, 0x8
	adds r5, r0, 0x1
	cmp r2, r3
	bge _080E53C2
	mov r1, r10
	lsls r6, r1, 12
	lsls r0, 6
	movs r7, 0xC0
	lsls r7, 19
	adds r0, r7
	ldr r1, [sp]
	adds r0, r1, r0
	mov r7, r8
	adds r1, r7, r0
	subs r2, r3, r2
_080E53B2:
	adds r0, r4, 0
	orrs r0, r6
	strh r0, [r1]
	adds r4, 0x1
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bne _080E53B2
_080E53C2:
	adds r0, r5, 0
	cmp r0, r9
	blt _080E5390
_080E53C8:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E53D8: .4byte 0x040000d4
_080E53DC: .4byte gUnknown_081FAF4C
_080E53E0: .4byte 0x80000400
	thumb_func_end unref_sub_80E4FDC

	.align 2, 0 @ Don't pad with nop.
