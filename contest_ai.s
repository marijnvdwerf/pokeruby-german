	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81288F4
sub_81288F4: @ 8128C70
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _08128CB8 @ =0x020192e4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x44
	bl memset
	movs r3, 0x64
	adds r2, r4, 0
	movs r1, 0x3
	adds r0, r2, 0
	adds r0, 0x8
_08128C8C:
	strb r3, [r0]
	subs r0, 0x1
	subs r1, 0x1
	cmp r1, 0
	bge _08128C8C
	adds r3, r2, 0
	adds r3, 0x41
	movs r1, 0
	strb r5, [r3]
	adds r0, r2, 0
	adds r0, 0x40
	strb r1, [r0]
	ldr r1, _08128CBC @ =gContestMons
	ldrb r0, [r3]
	lsls r0, 6
	adds r1, 0x18
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2, 0x14]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08128CB8: .4byte 0x020192e4
_08128CBC: .4byte gContestMons
	thumb_func_end sub_81288F4

	thumb_func_start sub_8128944
sub_8128944: @ 8128CC0
	push {r4-r6,lr}
	ldr r1, _08128D24 @ =0x020192e4
	ldr r0, [r1, 0x14]
	cmp r0, 0
	beq _08128CF0
	adds r4, r1, 0
	movs r5, 0
_08128CCE:
	ldr r0, [r4, 0x14]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08128CDE
	strb r5, [r4]
	bl sub_81289AC
_08128CDE:
	ldr r1, [r4, 0x14]
	lsrs r1, 1
	str r1, [r4, 0x14]
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
	strb r5, [r4, 0x4]
	cmp r1, 0
	bne _08128CCE
_08128CF0:
	movs r6, 0x3
	ldr r5, _08128D24 @ =0x020192e4
_08128CF4:
	bl Random
	adds r4, r0, 0
	ands r4, r6
	adds r3, r5, 0x5
	adds r0, r4, r3
	ldrb r2, [r0]
	movs r1, 0
	ldrb r0, [r5, 0x5]
	cmp r2, r0
	bcc _08128D18
_08128D0A:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _08128D18
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r2, r0
	bcs _08128D0A
_08128D18:
	cmp r1, 0x4
	bne _08128CF4
	adds r0, r4, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08128D24: .4byte 0x020192e4
	thumb_func_end sub_8128944

	thumb_func_start sub_81289AC
sub_81289AC: @ 8128D28
	push {r4-r6,lr}
	ldr r1, _08128D70 @ =0x020192e4
	ldrb r0, [r1]
	adds r2, r1, 0
	cmp r0, 0x2
	beq _08128DF2
	adds r4, r1, 0
	ldr r5, _08128D74 @ =gAIScriptPtr
	ldr r6, _08128D78 @ =gUnknown_0203858E
_08128D3A:
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08128D8A
	cmp r0, 0x1
	bgt _08128DEA
	cmp r0, 0
	bne _08128DEA
	ldr r1, _08128D7C @ =gContestAIs
	ldrb r0, [r4, 0x10]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r5]
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r1, r6
	ldrh r1, [r1]
	adds r0, r1, 0
	cmp r0, 0
	bne _08128D80
	strh r0, [r4, 0x2]
	b _08128D82
	.align 2, 0
_08128D70: .4byte 0x020192e4
_08128D74: .4byte gAIScriptPtr
_08128D78: .4byte gUnknown_0203858E
_08128D7C: .4byte gContestAIs
_08128D80:
	strh r1, [r4, 0x2]
_08128D82:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08128DEA
_08128D8A:
	ldrh r1, [r1, 0x2]
	cmp r1, 0
	beq _08128DA8
	ldr r1, _08128DA4 @ =gUnknown_08401E60
	ldr r0, [r5]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	b _08128DB8
	.align 2, 0
_08128DA4: .4byte gUnknown_08401E60
_08128DA8:
	adds r0, r4, 0x5
	ldrb r2, [r4, 0x4]
	adds r0, r2
	strb r1, [r0]
	ldrb r1, [r4, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r4, 0x9]
_08128DB8:
	ldr r2, _08128DD8 @ =0x020192e4
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08128DEA
	ldrb r0, [r2, 0x4]
	adds r0, 0x1
	movs r1, 0
	strb r0, [r2, 0x4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08128DDC
	strb r1, [r2]
	b _08128DE2
	.align 2, 0
_08128DD8: .4byte 0x020192e4
_08128DDC:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
_08128DE2:
	ldrb r1, [r4, 0x9]
	movs r0, 0xFE
	ands r0, r1
	strb r0, [r4, 0x9]
_08128DEA:
	adds r1, r2, 0
	ldrb r0, [r1]
	cmp r0, 0x2
	bne _08128D3A
_08128DF2:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81289AC

	thumb_func_start sub_8128A7C
sub_8128A7C: @ 8128DF8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08128E20 @ =0x020192d0
	ldrb r0, [r3]
	cmp r0, r2
	beq _08128E16
_08128E08:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _08128E16
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08128E08
_08128E16:
	lsls r0, r1, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08128E20: .4byte 0x020192d0
	thumb_func_end sub_8128A7C

	thumb_func_start sub_8128AA8
sub_8128AA8: @ 8128E24
	push {lr}
	ldr r2, _08128E4C @ =0x020192e4
	adds r1, r2, 0x5
	ldrb r0, [r2, 0x4]
	adds r1, r0
	ldr r3, _08128E50 @ =gAIScriptPtr
	ldr r0, [r3]
	ldrb r0, [r0, 0x1]
	lsls r0, 24
	asrs r0, 24
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08128E54
	movs r1, 0xFF
	b _08128E5A
	.align 2, 0
_08128E4C: .4byte 0x020192e4
_08128E50: .4byte gAIScriptPtr
_08128E54:
	cmp r0, 0
	bge _08128E5A
	movs r1, 0
_08128E5A:
	adds r0, r2, 0x5
	ldrb r2, [r2, 0x4]
	adds r0, r2
	strb r1, [r0]
	ldr r0, [r3]
	adds r0, 0x2
	str r0, [r3]
	pop {r0}
	bx r0
	thumb_func_end sub_8128AA8

	thumb_func_start contest_ai_get_turn
contest_ai_get_turn: @ 8128E6C
	ldr r1, _08128E80 @ =0x020192e4
	adds r0, r1, 0
	subs r0, 0xE0
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x18]
	ldr r1, _08128E84 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128E80: .4byte 0x020192e4
_08128E84: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_turn

	thumb_func_start sub_8128B0C
sub_8128B0C: @ 8128E88
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128EB8 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128EBC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128EC0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128EC4
	.align 2, 0
_08128EB8: .4byte 0x020192e4
_08128EBC: .4byte gAIScriptPtr
_08128EC0:
	adds r0, r2, 0x5
	str r0, [r3]
_08128EC4:
	pop {r0}
	bx r0
	thumb_func_end sub_8128B0C

	thumb_func_start sub_8128B4C
sub_8128B4C: @ 8128EC8
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128EF8 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128EFC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08128F00
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128F04
	.align 2, 0
_08128EF8: .4byte 0x020192e4
_08128EFC: .4byte gAIScriptPtr
_08128F00:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F04:
	pop {r0}
	bx r0
	thumb_func_end sub_8128B4C

	thumb_func_start sub_8128B8C
sub_8128B8C: @ 8128F08
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128F38 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F3C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08128F40
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128F44
	.align 2, 0
_08128F38: .4byte 0x020192e4
_08128F3C: .4byte gAIScriptPtr
_08128F40:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F44:
	pop {r0}
	bx r0
	thumb_func_end sub_8128B8C

	thumb_func_start sub_8128BCC
sub_8128BCC: @ 8128F48
	push {lr}
	bl contest_ai_get_turn
	ldr r0, _08128F78 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128F7C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08128F80
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128F84
	.align 2, 0
_08128F78: .4byte 0x020192e4
_08128F7C: .4byte gAIScriptPtr
_08128F80:
	adds r0, r2, 0x5
	str r0, [r3]
_08128F84:
	pop {r0}
	bx r0
	thumb_func_end sub_8128BCC

	thumb_func_start contest_ai_get_excitement
contest_ai_get_excitement: @ 8128F88
	ldr r1, _08128FA0 @ =0x020192e4
	adds r0, r1, 0
	subs r0, 0xE0
	ldrb r0, [r0, 0x13]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r1, 0x18]
	ldr r1, _08128FA4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08128FA0: .4byte 0x020192e4
_08128FA4: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_excitement

	thumb_func_start sub_8128C2C
sub_8128C2C: @ 8128FA8
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08128FD8 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08128FDC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08128FE0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08128FE4
	.align 2, 0
_08128FD8: .4byte 0x020192e4
_08128FDC: .4byte gAIScriptPtr
_08128FE0:
	adds r0, r2, 0x5
	str r0, [r3]
_08128FE4:
	pop {r0}
	bx r0
	thumb_func_end sub_8128C2C

	thumb_func_start sub_8128C6C
sub_8128C6C: @ 8128FE8
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08129018 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812901C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129020
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129024
	.align 2, 0
_08129018: .4byte 0x020192e4
_0812901C: .4byte gAIScriptPtr
_08129020:
	adds r0, r2, 0x5
	str r0, [r3]
_08129024:
	pop {r0}
	bx r0
	thumb_func_end sub_8128C6C

	thumb_func_start sub_8128CAC
sub_8128CAC: @ 8129028
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08129058 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812905C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129060
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129064
	.align 2, 0
_08129058: .4byte 0x020192e4
_0812905C: .4byte gAIScriptPtr
_08129060:
	adds r0, r2, 0x5
	str r0, [r3]
_08129064:
	pop {r0}
	bx r0
	thumb_func_end sub_8128CAC

	thumb_func_start sub_8128CEC
sub_8128CEC: @ 8129068
	push {lr}
	bl contest_ai_get_excitement
	ldr r0, _08129098 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812909C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081290A0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081290A4
	.align 2, 0
_08129098: .4byte 0x020192e4
_0812909C: .4byte gAIScriptPtr
_081290A0:
	adds r0, r2, 0x5
	str r0, [r3]
_081290A4:
	pop {r0}
	bx r0
	thumb_func_end sub_8128CEC

	thumb_func_start contest_ai_get_user_order
contest_ai_get_user_order: @ 81290A8
	ldr r1, _081290C4 @ =0x020192e4
	adds r2, r1, 0
	adds r2, 0x41
	adds r0, r1, 0
	subs r0, 0x14
	ldrb r2, [r2]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1, 0x18]
	ldr r1, _081290C8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081290C4: .4byte 0x020192e4
_081290C8: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_user_order

	thumb_func_start sub_8128D50
sub_8128D50: @ 81290CC
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _081290FC @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129100 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129104
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129108
	.align 2, 0
_081290FC: .4byte 0x020192e4
_08129100: .4byte gAIScriptPtr
_08129104:
	adds r0, r2, 0x5
	str r0, [r3]
_08129108:
	pop {r0}
	bx r0
	thumb_func_end sub_8128D50

	thumb_func_start sub_8128D90
sub_8128D90: @ 812910C
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _0812913C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129140 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129144
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129148
	.align 2, 0
_0812913C: .4byte 0x020192e4
_08129140: .4byte gAIScriptPtr
_08129144:
	adds r0, r2, 0x5
	str r0, [r3]
_08129148:
	pop {r0}
	bx r0
	thumb_func_end sub_8128D90

	thumb_func_start sub_8128DD0
sub_8128DD0: @ 812914C
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _0812917C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129180 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129184
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129188
	.align 2, 0
_0812917C: .4byte 0x020192e4
_08129180: .4byte gAIScriptPtr
_08129184:
	adds r0, r2, 0x5
	str r0, [r3]
_08129188:
	pop {r0}
	bx r0
	thumb_func_end sub_8128DD0

	thumb_func_start sub_8128E10
sub_8128E10: @ 812918C
	push {lr}
	bl contest_ai_get_user_order
	ldr r0, _081291BC @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081291C0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _081291C4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081291C8
	.align 2, 0
_081291BC: .4byte 0x020192e4
_081291C0: .4byte gAIScriptPtr
_081291C4:
	adds r0, r2, 0x5
	str r0, [r3]
_081291C8:
	pop {r0}
	bx r0
	thumb_func_end sub_8128E10

	thumb_func_start contest_ai_get_user_condition_maybe
contest_ai_get_user_condition_maybe: @ 81291CC
	push {r4,lr}
	ldr r4, _08129204 @ =0x020192e4
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r0, r1
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08129208 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129204: .4byte 0x020192e4
_08129208: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_user_condition_maybe

	thumb_func_start sub_8128E90
sub_8128E90: @ 812920C
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _0812923C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129240 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129244
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129248
	.align 2, 0
_0812923C: .4byte 0x020192e4
_08129240: .4byte gAIScriptPtr
_08129244:
	adds r0, r2, 0x5
	str r0, [r3]
_08129248:
	pop {r0}
	bx r0
	thumb_func_end sub_8128E90

	thumb_func_start sub_8128ED0
sub_8128ED0: @ 812924C
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _0812927C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129280 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129284
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129288
	.align 2, 0
_0812927C: .4byte 0x020192e4
_08129280: .4byte gAIScriptPtr
_08129284:
	adds r0, r2, 0x5
	str r0, [r3]
_08129288:
	pop {r0}
	bx r0
	thumb_func_end sub_8128ED0

	thumb_func_start sub_8128F10
sub_8128F10: @ 812928C
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _081292BC @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081292C0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081292C4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081292C8
	.align 2, 0
_081292BC: .4byte 0x020192e4
_081292C0: .4byte gAIScriptPtr
_081292C4:
	adds r0, r2, 0x5
	str r0, [r3]
_081292C8:
	pop {r0}
	bx r0
	thumb_func_end sub_8128F10

	thumb_func_start sub_8128F50
sub_8128F50: @ 81292CC
	push {lr}
	bl contest_ai_get_user_condition_maybe
	ldr r0, _081292FC @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129300 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129304
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129308
	.align 2, 0
_081292FC: .4byte 0x020192e4
_08129300: .4byte gAIScriptPtr
_08129304:
	adds r0, r2, 0x5
	str r0, [r3]
_08129308:
	pop {r0}
	bx r0
	thumb_func_end sub_8128F50

	thumb_func_start sub_8128F90
sub_8128F90: @ 812930C
	ldr r2, _08129330 @ =0x020192e4
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r2, 0
	subs r1, 0x84
	adds r0, r1
	ldrh r0, [r0, 0x4]
	strh r0, [r2, 0x18]
	ldr r1, _08129334 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129330: .4byte 0x020192e4
_08129334: .4byte gAIScriptPtr
	thumb_func_end sub_8128F90

	thumb_func_start sub_8128FBC
sub_8128FBC: @ 8129338
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _08129370 @ =0x020192e4
	ldr r4, _08129374 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _08129378
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812937C
	.align 2, 0
_08129370: .4byte 0x020192e4
_08129374: .4byte gAIScriptPtr
_08129378:
	adds r0, r3, 0x6
	str r0, [r4]
_0812937C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8128FBC

	thumb_func_start sub_8129008
sub_8129008: @ 8129384
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _081293BC @ =0x020192e4
	ldr r4, _081293C0 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	ble _081293C4
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081293C8
	.align 2, 0
_081293BC: .4byte 0x020192e4
_081293C0: .4byte gAIScriptPtr
_081293C4:
	adds r0, r3, 0x6
	str r0, [r4]
_081293C8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129008

	thumb_func_start sub_8129054
sub_8129054: @ 81293D0
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _08129408 @ =0x020192e4
	ldr r4, _0812940C @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08129410
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08129414
	.align 2, 0
_08129408: .4byte 0x020192e4
_0812940C: .4byte gAIScriptPtr
_08129410:
	adds r0, r3, 0x6
	str r0, [r4]
_08129414:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129054

	thumb_func_start sub_81290A0
sub_81290A0: @ 812941C
	push {r4,r5,lr}
	bl sub_8128F90
	ldr r2, _08129454 @ =0x020192e4
	ldr r4, _08129458 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	beq _0812945C
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08129460
	.align 2, 0
_08129454: .4byte 0x020192e4
_08129458: .4byte gAIScriptPtr
_0812945C:
	adds r0, r3, 0x6
	str r0, [r4]
_08129460:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81290A0

	thumb_func_start sub_81290EC
sub_81290EC: @ 8129468
	ldr r2, _08129484 @ =0x020192e4
	ldr r1, _08129488 @ =gUnknown_02038670
	adds r0, r2, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2, 0x18]
	ldr r1, _0812948C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_08129484: .4byte 0x020192e4
_08129488: .4byte gUnknown_02038670
_0812948C: .4byte gAIScriptPtr
	thumb_func_end sub_81290EC

	thumb_func_start sub_8129114
sub_8129114: @ 8129490
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _081294C8 @ =0x020192e4
	ldr r4, _081294CC @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bge _081294D0
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081294D4
	.align 2, 0
_081294C8: .4byte 0x020192e4
_081294CC: .4byte gAIScriptPtr
_081294D0:
	adds r0, r3, 0x6
	str r0, [r4]
_081294D4:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129114

	thumb_func_start sub_8129160
sub_8129160: @ 81294DC
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _08129514 @ =0x020192e4
	ldr r4, _08129518 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	ble _0812951C
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _08129520
	.align 2, 0
_08129514: .4byte 0x020192e4
_08129518: .4byte gAIScriptPtr
_0812951C:
	adds r0, r3, 0x6
	str r0, [r4]
_08129520:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8129160

	thumb_func_start sub_81291AC
sub_81291AC: @ 8129528
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _08129560 @ =0x020192e4
	ldr r4, _08129564 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	bne _08129568
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812956C
	.align 2, 0
_08129560: .4byte 0x020192e4
_08129564: .4byte gAIScriptPtr
_08129568:
	adds r0, r3, 0x6
	str r0, [r4]
_0812956C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81291AC

	thumb_func_start sub_81291F8
sub_81291F8: @ 8129574
	push {r4,r5,lr}
	bl sub_81290EC
	ldr r2, _081295AC @ =0x020192e4
	ldr r4, _081295B0 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3]
	ldrb r0, [r3, 0x1]
	lsls r0, 8
	orrs r1, r0
	movs r5, 0x18
	ldrsh r0, [r2, r5]
	lsls r1, 16
	asrs r1, 16
	cmp r0, r1
	beq _081295B4
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _081295B8
	.align 2, 0
_081295AC: .4byte 0x020192e4
_081295B0: .4byte gAIScriptPtr
_081295B4:
	adds r0, r3, 0x6
	str r0, [r4]
_081295B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81291F8

	thumb_func_start contest_ai_get_contest_type
contest_ai_get_contest_type: @ 81295C0
	ldr r1, _081295D4 @ =0x020192e4
	ldr r0, _081295D8 @ =gScriptContestCategory
	ldrh r0, [r0]
	strh r0, [r1, 0x18]
	ldr r1, _081295DC @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081295D4: .4byte 0x020192e4
_081295D8: .4byte gScriptContestCategory
_081295DC: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_contest_type

	thumb_func_start sub_8129264
sub_8129264: @ 81295E0
	push {lr}
	bl contest_ai_get_contest_type
	ldr r0, _08129610 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129614 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129618
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812961C
	.align 2, 0
_08129610: .4byte 0x020192e4
_08129614: .4byte gAIScriptPtr
_08129618:
	adds r0, r2, 0x5
	str r0, [r3]
_0812961C:
	pop {r0}
	bx r0
	thumb_func_end sub_8129264

	thumb_func_start sub_81292A4
sub_81292A4: @ 8129620
	push {lr}
	bl contest_ai_get_contest_type
	ldr r0, _08129650 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129654 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129658
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812965C
	.align 2, 0
_08129650: .4byte 0x020192e4
_08129654: .4byte gAIScriptPtr
_08129658:
	adds r0, r2, 0x5
	str r0, [r3]
_0812965C:
	pop {r0}
	bx r0
	thumb_func_end sub_81292A4

	thumb_func_start contest_ai_get_move_excitement
contest_ai_get_move_excitement: @ 8129660
	push {r4,lr}
	ldr r2, _08129694 @ =gContestMons
	ldr r4, _08129698 @ =0x020192e4
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	bl contest_get_move_excitement
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _0812969C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129694: .4byte gContestMons
_08129698: .4byte 0x020192e4
_0812969C: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_move_excitement

	thumb_func_start sub_8129324
sub_8129324: @ 81296A0
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _081296D0 @ =0x020192e4
	ldr r3, _081296D4 @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bge _081296D8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081296DC
	.align 2, 0
_081296D0: .4byte 0x020192e4
_081296D4: .4byte gAIScriptPtr
_081296D8:
	adds r0, r2, 0x5
	str r0, [r3]
_081296DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8129324

	thumb_func_start sub_8129368
sub_8129368: @ 81296E4
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _08129714 @ =0x020192e4
	ldr r3, _08129718 @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	ble _0812971C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129720
	.align 2, 0
_08129714: .4byte 0x020192e4
_08129718: .4byte gAIScriptPtr
_0812971C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129720:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8129368

	thumb_func_start sub_81293AC
sub_81293AC: @ 8129728
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _08129758 @ =0x020192e4
	ldr r3, _0812975C @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08129760
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129764
	.align 2, 0
_08129758: .4byte 0x020192e4
_0812975C: .4byte gAIScriptPtr
_08129760:
	adds r0, r2, 0x5
	str r0, [r3]
_08129764:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81293AC

	thumb_func_start sub_81293F0
sub_81293F0: @ 812976C
	push {r4,lr}
	bl contest_ai_get_move_excitement
	ldr r0, _0812979C @ =0x020192e4
	ldr r3, _081297A0 @ =gAIScriptPtr
	ldr r2, [r3]
	movs r4, 0x18
	ldrsh r1, [r0, r4]
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _081297A4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081297A8
	.align 2, 0
_0812979C: .4byte 0x020192e4
_081297A0: .4byte gAIScriptPtr
_081297A4:
	adds r0, r2, 0x5
	str r0, [r3]
_081297A8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81293F0

	thumb_func_start contest_ai_get_move_effect
contest_ai_get_move_effect: @ 81297B0
	ldr r2, _081297DC @ =gContestMons
	ldr r3, _081297E0 @ =0x020192e4
	ldrb r1, [r3, 0x4]
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r1, _081297E4 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r3, 0x18]
	ldr r1, _081297E8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081297DC: .4byte gContestMons
_081297E0: .4byte 0x020192e4
_081297E4: .4byte gContestMoves
_081297E8: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_move_effect

	thumb_func_start sub_8129470
sub_8129470: @ 81297EC
	push {lr}
	bl contest_ai_get_move_effect
	ldr r0, _0812981C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129820 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129824
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129828
	.align 2, 0
_0812981C: .4byte 0x020192e4
_08129820: .4byte gAIScriptPtr
_08129824:
	adds r0, r2, 0x5
	str r0, [r3]
_08129828:
	pop {r0}
	bx r0
	thumb_func_end sub_8129470

	thumb_func_start sub_81294B0
sub_81294B0: @ 812982C
	push {lr}
	bl contest_ai_get_move_effect
	ldr r0, _0812985C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129860 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129864
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129868
	.align 2, 0
_0812985C: .4byte 0x020192e4
_08129860: .4byte gAIScriptPtr
_08129864:
	adds r0, r2, 0x5
	str r0, [r3]
_08129868:
	pop {r0}
	bx r0
	thumb_func_end sub_81294B0

	thumb_func_start contest_ai_get_move_effect_type
contest_ai_get_move_effect_type: @ 812986C
	ldr r2, _081298A0 @ =gContestMons
	ldr r3, _081298A4 @ =0x020192e4
	ldrb r1, [r3, 0x4]
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _081298A8 @ =gContestEffects
	ldr r1, _081298AC @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r3, 0x18]
	ldr r1, _081298B0 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	bx lr
	.align 2, 0
_081298A0: .4byte gContestMons
_081298A4: .4byte 0x020192e4
_081298A8: .4byte gContestEffects
_081298AC: .4byte gContestMoves
_081298B0: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_move_effect_type

	thumb_func_start sub_8129538
sub_8129538: @ 81298B4
	push {lr}
	bl contest_ai_get_move_effect_type
	ldr r0, _081298E4 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _081298E8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _081298EC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081298F0
	.align 2, 0
_081298E4: .4byte 0x020192e4
_081298E8: .4byte gAIScriptPtr
_081298EC:
	adds r0, r2, 0x5
	str r0, [r3]
_081298F0:
	pop {r0}
	bx r0
	thumb_func_end sub_8129538

	thumb_func_start sub_8129578
sub_8129578: @ 81298F4
	push {lr}
	bl contest_ai_get_move_effect_type
	ldr r0, _08129924 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129928 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812992C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129930
	.align 2, 0
_08129924: .4byte 0x020192e4
_08129928: .4byte gAIScriptPtr
_0812992C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129930:
	pop {r0}
	bx r0
	thumb_func_end sub_8129578

	thumb_func_start contest_ai_check_move_has_highest_appeal
contest_ai_check_move_has_highest_appeal: @ 8129934
	push {r4-r7,lr}
	ldr r2, _0812998C @ =gContestMons
	ldr r3, _08129990 @ =0x020192e4
	ldrb r0, [r3, 0x4]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 6
	adds r0, r1
	adds r2, 0x1E
	adds r0, r2
	ldrh r0, [r0]
	ldr r4, _08129994 @ =gContestEffects
	ldr r5, _08129998 @ =gContestMoves
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r7, [r0, 0x1]
	movs r6, 0
	ldr r0, _0812999C @ =gAIScriptPtr
	mov r12, r0
	adds r1, r2
_08129966:
	ldrh r0, [r1]
	cmp r0, 0
	beq _0812997C
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x1]
	cmp r7, r0
	bcc _08129984
_0812997C:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08129966
_08129984:
	cmp r6, 0x4
	bne _081299A0
	movs r0, 0x1
	b _081299A2
	.align 2, 0
_0812998C: .4byte gContestMons
_08129990: .4byte 0x020192e4
_08129994: .4byte gContestEffects
_08129998: .4byte gContestMoves
_0812999C: .4byte gAIScriptPtr
_081299A0:
	movs r0, 0
_081299A2:
	strh r0, [r3, 0x18]
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end contest_ai_check_move_has_highest_appeal

	thumb_func_start sub_8129638
sub_8129638: @ 81299B4
	push {lr}
	bl contest_ai_check_move_has_highest_appeal
	ldr r0, _081299E0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _081299E8
	ldr r3, _081299E4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _081299F0
	.align 2, 0
_081299E0: .4byte 0x020192e4
_081299E4: .4byte gAIScriptPtr
_081299E8:
	ldr r1, _081299F4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_081299F0:
	pop {r0}
	bx r0
	.align 2, 0
_081299F4: .4byte gAIScriptPtr
	thumb_func_end sub_8129638

	thumb_func_start sub_812967C
sub_812967C: @ 81299F8
	push {r4-r7,lr}
	ldr r2, _08129A50 @ =gContestMons
	ldr r3, _08129A54 @ =0x020192e4
	ldrb r0, [r3, 0x4]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 6
	adds r0, r1
	adds r2, 0x1E
	adds r0, r2
	ldrh r0, [r0]
	ldr r4, _08129A58 @ =gContestEffects
	ldr r5, _08129A5C @ =gContestMoves
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r7, [r0, 0x2]
	movs r6, 0
	ldr r0, _08129A60 @ =gAIScriptPtr
	mov r12, r0
	adds r1, r2
_08129A2A:
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129A40
	lsls r0, 3
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x2]
	cmp r7, r0
	bcc _08129A48
_08129A40:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _08129A2A
_08129A48:
	cmp r6, 0x4
	bne _08129A64
	movs r0, 0x1
	b _08129A66
	.align 2, 0
_08129A50: .4byte gContestMons
_08129A54: .4byte 0x020192e4
_08129A58: .4byte gContestEffects
_08129A5C: .4byte gContestMoves
_08129A60: .4byte gAIScriptPtr
_08129A64:
	movs r0, 0
_08129A66:
	strh r0, [r3, 0x18]
	mov r1, r12
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812967C

	thumb_func_start sub_81296FC
sub_81296FC: @ 8129A78
	push {lr}
	bl sub_812967C
	ldr r0, _08129AA4 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129AAC
	ldr r3, _08129AA8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129AB4
	.align 2, 0
_08129AA4: .4byte 0x020192e4
_08129AA8: .4byte gAIScriptPtr
_08129AAC:
	ldr r1, _08129AB8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x5
	str r0, [r1]
_08129AB4:
	pop {r0}
	bx r0
	.align 2, 0
_08129AB8: .4byte gAIScriptPtr
	thumb_func_end sub_81296FC

	thumb_func_start sub_8129740
sub_8129740: @ 8129ABC
	push {r4,lr}
	ldr r2, _08129B00 @ =gContestMons
	ldr r4, _08129B04 @ =0x020192e4
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _08129B08 @ =gContestEffects
	ldr r1, _08129B0C @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08129B10 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129B00: .4byte gContestMons
_08129B04: .4byte 0x020192e4
_08129B08: .4byte gContestEffects
_08129B0C: .4byte gContestMoves
_08129B10: .4byte gAIScriptPtr
	thumb_func_end sub_8129740

	thumb_func_start sub_8129798
sub_8129798: @ 8129B14
	push {lr}
	bl sub_8129740
	ldr r0, _08129B44 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129B48 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129B4C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129B50
	.align 2, 0
_08129B44: .4byte 0x020192e4
_08129B48: .4byte gAIScriptPtr
_08129B4C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129B50:
	pop {r0}
	bx r0
	thumb_func_end sub_8129798

	thumb_func_start sub_81297D8
sub_81297D8: @ 8129B54
	push {lr}
	bl sub_8129740
	ldr r0, _08129B84 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129B88 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129B8C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129B90
	.align 2, 0
_08129B84: .4byte 0x020192e4
_08129B88: .4byte gAIScriptPtr
_08129B8C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129B90:
	pop {r0}
	bx r0
	thumb_func_end sub_81297D8

	thumb_func_start sub_8129818
sub_8129818: @ 8129B94
	push {lr}
	bl sub_8129740
	ldr r0, _08129BC4 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129BC8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129BCC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129BD0
	.align 2, 0
_08129BC4: .4byte 0x020192e4
_08129BC8: .4byte gAIScriptPtr
_08129BCC:
	adds r0, r2, 0x5
	str r0, [r3]
_08129BD0:
	pop {r0}
	bx r0
	thumb_func_end sub_8129818

	thumb_func_start sub_8129858
sub_8129858: @ 8129BD4
	push {lr}
	bl sub_8129740
	ldr r0, _08129C04 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129C08 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129C0C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129C10
	.align 2, 0
_08129C04: .4byte 0x020192e4
_08129C08: .4byte gAIScriptPtr
_08129C0C:
	adds r0, r2, 0x5
	str r0, [r3]
_08129C10:
	pop {r0}
	bx r0
	thumb_func_end sub_8129858

	thumb_func_start sub_8129898
sub_8129898: @ 8129C14
	push {r4,lr}
	ldr r2, _08129C58 @ =gContestMons
	ldr r4, _08129C5C @ =0x020192e4
	ldrb r1, [r4, 0x4]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	ldr r2, _08129C60 @ =gContestEffects
	ldr r1, _08129C64 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x2]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x18]
	ldr r1, _08129C68 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129C58: .4byte gContestMons
_08129C5C: .4byte 0x020192e4
_08129C60: .4byte gContestEffects
_08129C64: .4byte gContestMoves
_08129C68: .4byte gAIScriptPtr
	thumb_func_end sub_8129898

	thumb_func_start sub_81298F0
sub_81298F0: @ 8129C6C
	push {lr}
	bl sub_8129898
	ldr r0, _08129C9C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129CA0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129CA4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129CA8
	.align 2, 0
_08129C9C: .4byte 0x020192e4
_08129CA0: .4byte gAIScriptPtr
_08129CA4:
	adds r0, r2, 0x5
	str r0, [r3]
_08129CA8:
	pop {r0}
	bx r0
	thumb_func_end sub_81298F0

	thumb_func_start sub_8129930
sub_8129930: @ 8129CAC
	push {lr}
	bl sub_8129898
	ldr r0, _08129CDC @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129CE0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129CE4
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129CE8
	.align 2, 0
_08129CDC: .4byte 0x020192e4
_08129CE0: .4byte gAIScriptPtr
_08129CE4:
	adds r0, r2, 0x5
	str r0, [r3]
_08129CE8:
	pop {r0}
	bx r0
	thumb_func_end sub_8129930

	thumb_func_start sub_8129970
sub_8129970: @ 8129CEC
	push {lr}
	bl sub_8129898
	ldr r0, _08129D1C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129D20 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129D24
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129D28
	.align 2, 0
_08129D1C: .4byte 0x020192e4
_08129D20: .4byte gAIScriptPtr
_08129D24:
	adds r0, r2, 0x5
	str r0, [r3]
_08129D28:
	pop {r0}
	bx r0
	thumb_func_end sub_8129970

	thumb_func_start sub_81299B0
sub_81299B0: @ 8129D2C
	push {lr}
	bl sub_8129898
	ldr r0, _08129D5C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129D60 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129D64
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129D68
	.align 2, 0
_08129D5C: .4byte 0x020192e4
_08129D60: .4byte gAIScriptPtr
_08129D64:
	adds r0, r2, 0x5
	str r0, [r3]
_08129D68:
	pop {r0}
	bx r0
	thumb_func_end sub_81299B0

	thumb_func_start contest_ai_get_move_used_count
contest_ai_get_move_used_count: @ 8129D6C
	push {r4,lr}
	ldr r3, _08129D9C @ =gContestMons
	ldr r4, _08129DA0 @ =0x020192e4
	ldrb r0, [r4, 0x4]
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x41
	ldrb r2, [r1]
	lsls r1, r2, 6
	adds r0, r1
	adds r3, 0x1E
	adds r0, r3
	ldrh r3, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r0, r1
	ldrh r1, [r0, 0x8]
	cmp r3, r1
	beq _08129DA4
	movs r0, 0
	b _08129DAC
	.align 2, 0
_08129D9C: .4byte gContestMons
_08129DA0: .4byte 0x020192e4
_08129DA4:
	ldrb r0, [r0, 0xB]
	lsls r0, 25
	lsrs r0, 29
	adds r0, 0x1
_08129DAC:
	strh r0, [r4, 0x18]
	ldr r1, _08129DBC @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08129DBC: .4byte gAIScriptPtr
	thumb_func_end contest_ai_get_move_used_count

	thumb_func_start sub_8129A44
sub_8129A44: @ 8129DC0
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129DF0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129DF4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _08129DF8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129DFC
	.align 2, 0
_08129DF0: .4byte 0x020192e4
_08129DF4: .4byte gAIScriptPtr
_08129DF8:
	adds r0, r2, 0x5
	str r0, [r3]
_08129DFC:
	pop {r0}
	bx r0
	thumb_func_end sub_8129A44

	thumb_func_start sub_8129A84
sub_8129A84: @ 8129E00
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129E30 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129E34 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _08129E38
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129E3C
	.align 2, 0
_08129E30: .4byte 0x020192e4
_08129E34: .4byte gAIScriptPtr
_08129E38:
	adds r0, r2, 0x5
	str r0, [r3]
_08129E3C:
	pop {r0}
	bx r0
	thumb_func_end sub_8129A84

	thumb_func_start sub_8129AC4
sub_8129AC4: @ 8129E40
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129E70 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129E74 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _08129E78
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129E7C
	.align 2, 0
_08129E70: .4byte 0x020192e4
_08129E74: .4byte gAIScriptPtr
_08129E78:
	adds r0, r2, 0x5
	str r0, [r3]
_08129E7C:
	pop {r0}
	bx r0
	thumb_func_end sub_8129AC4

	thumb_func_start sub_8129B04
sub_8129B04: @ 8129E80
	push {lr}
	bl contest_ai_get_move_used_count
	ldr r0, _08129EB0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _08129EB4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _08129EB8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129EBC
	.align 2, 0
_08129EB0: .4byte 0x020192e4
_08129EB4: .4byte gAIScriptPtr
_08129EB8:
	adds r0, r2, 0x5
	str r0, [r3]
_08129EBC:
	pop {r0}
	bx r0
	thumb_func_end sub_8129B04

	thumb_func_start contest_ai_check_combo_starter
contest_ai_check_combo_starter: @ 8129EC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r3, _08129F28 @ =gContestMons
	ldr r2, _08129F2C @ =0x020192e4
	ldrb r1, [r2, 0x4]
	lsls r1, 1
	adds r2, 0x41
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r3, 0x1E
	adds r1, r3
	ldrh r6, [r1]
	movs r4, 0
	mov r8, r2
	adds r7, r3, 0
_08129EE4:
	lsls r0, r4, 1
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r7
	ldrh r0, [r1]
	cmp r0, 0
	beq _08129F06
	adds r1, r0, 0
	adds r0, r6, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _08129F10
_08129F06:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08129EE4
	cmp r5, 0
	beq _08129F12
_08129F10:
	movs r5, 0x1
_08129F12:
	ldr r0, _08129F2C @ =0x020192e4
	strh r5, [r0, 0x18]
	ldr r1, _08129F30 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08129F28: .4byte gContestMons
_08129F2C: .4byte 0x020192e4
_08129F30: .4byte gAIScriptPtr
	thumb_func_end contest_ai_check_combo_starter

	thumb_func_start sub_8129BB8
sub_8129BB8: @ 8129F34
	push {lr}
	bl contest_ai_check_combo_starter
	ldr r0, _08129F60 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _08129F68
	ldr r3, _08129F64 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129F70
	.align 2, 0
_08129F60: .4byte 0x020192e4
_08129F64: .4byte gAIScriptPtr
_08129F68:
	ldr r1, _08129F74 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129F70:
	pop {r0}
	bx r0
	.align 2, 0
_08129F74: .4byte gAIScriptPtr
	thumb_func_end sub_8129BB8

	thumb_func_start sub_8129BFC
sub_8129BFC: @ 8129F78
	push {lr}
	bl contest_ai_check_combo_starter
	ldr r0, _08129FA4 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08129FAC
	ldr r3, _08129FA8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _08129FB4
	.align 2, 0
_08129FA4: .4byte 0x020192e4
_08129FA8: .4byte gAIScriptPtr
_08129FAC:
	ldr r1, _08129FB8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_08129FB4:
	pop {r0}
	bx r0
	.align 2, 0
_08129FB8: .4byte gAIScriptPtr
	thumb_func_end sub_8129BFC

	thumb_func_start contest_ai_check_combo_finisher
contest_ai_check_combo_finisher: @ 8129FBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r3, _0812A024 @ =gContestMons
	ldr r2, _0812A028 @ =0x020192e4
	ldrb r1, [r2, 0x4]
	lsls r1, 1
	adds r2, 0x41
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r3, 0x1E
	adds r1, r3
	ldrh r6, [r1]
	movs r4, 0
	mov r8, r2
	adds r7, r3, 0
_08129FE0:
	lsls r0, r4, 1
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r7
	ldrh r0, [r1]
	cmp r0, 0
	beq _0812A000
	adds r1, r6, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0
	bne _0812A00A
_0812A000:
	adds r4, 0x1
	cmp r4, 0x3
	ble _08129FE0
	cmp r5, 0
	beq _0812A00C
_0812A00A:
	movs r5, 0x1
_0812A00C:
	ldr r0, _0812A028 @ =0x020192e4
	strh r5, [r0, 0x18]
	ldr r1, _0812A02C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812A024: .4byte gContestMons
_0812A028: .4byte 0x020192e4
_0812A02C: .4byte gAIScriptPtr
	thumb_func_end contest_ai_check_combo_finisher

	thumb_func_start sub_8129CB4
sub_8129CB4: @ 812A030
	push {lr}
	bl contest_ai_check_combo_finisher
	ldr r0, _0812A05C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A064
	ldr r3, _0812A060 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A06C
	.align 2, 0
_0812A05C: .4byte 0x020192e4
_0812A060: .4byte gAIScriptPtr
_0812A064:
	ldr r1, _0812A070 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A06C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A070: .4byte gAIScriptPtr
	thumb_func_end sub_8129CB4

	thumb_func_start sub_8129CF8
sub_8129CF8: @ 812A074
	push {lr}
	bl contest_ai_check_combo_finisher
	ldr r0, _0812A0A0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A0A8
	ldr r3, _0812A0A4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A0B0
	.align 2, 0
_0812A0A0: .4byte 0x020192e4
_0812A0A4: .4byte gAIScriptPtr
_0812A0A8:
	ldr r1, _0812A0B4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A0B0:
	pop {r0}
	bx r0
	.align 2, 0
_0812A0B4: .4byte gAIScriptPtr
	thumb_func_end sub_8129CF8

	thumb_func_start contest_ai_check_would_finish_combo
contest_ai_check_would_finish_combo: @ 812A0B8
	push {r4,r5,lr}
	movs r5, 0
	ldr r3, _0812A108 @ =gContestMons
	ldr r4, _0812A10C @ =0x020192e4
	ldrb r0, [r4, 0x4]
	lsls r0, 1
	adds r1, r4, 0
	adds r1, 0x41
	ldrb r2, [r1]
	lsls r1, r2, 6
	adds r0, r1
	adds r3, 0x1E
	adds r0, r3
	ldrh r3, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r1, r4, 0
	subs r1, 0x84
	adds r1, r0, r1
	ldrh r0, [r1, 0x8]
	cmp r0, 0
	beq _0812A0F0
	adds r1, r3, 0
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r5, r0, 24
_0812A0F0:
	cmp r5, 0
	beq _0812A0F6
	movs r5, 0x1
_0812A0F6:
	strh r5, [r4, 0x18]
	ldr r1, _0812A110 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A108: .4byte gContestMons
_0812A10C: .4byte 0x020192e4
_0812A110: .4byte gAIScriptPtr
	thumb_func_end contest_ai_check_would_finish_combo

	thumb_func_start sub_8129D98
sub_8129D98: @ 812A114
	push {lr}
	bl contest_ai_check_would_finish_combo
	ldr r0, _0812A140 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A148
	ldr r3, _0812A144 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A150
	.align 2, 0
_0812A140: .4byte 0x020192e4
_0812A144: .4byte gAIScriptPtr
_0812A148:
	ldr r1, _0812A154 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A150:
	pop {r0}
	bx r0
	.align 2, 0
_0812A154: .4byte gAIScriptPtr
	thumb_func_end sub_8129D98

	thumb_func_start sub_8129DDC
sub_8129DDC: @ 812A158
	push {lr}
	bl contest_ai_check_would_finish_combo
	ldr r0, _0812A184 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A18C
	ldr r3, _0812A188 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A194
	.align 2, 0
_0812A184: .4byte 0x020192e4
_0812A188: .4byte gAIScriptPtr
_0812A18C:
	ldr r1, _0812A198 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A194:
	pop {r0}
	bx r0
	.align 2, 0
_0812A198: .4byte gAIScriptPtr
	thumb_func_end sub_8129DDC

	thumb_func_start contest_ai_get_condition
contest_ai_get_condition: @ 812A19C
	push {r4,r5,lr}
	ldr r4, _0812A1D8 @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0812A1DC @ =0x020192e4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r5, 0
	subs r0, 0x84
	adds r1, r0
	movs r0, 0xD
	ldrsb r0, [r1, r0]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	strh r0, [r5, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A1D8: .4byte gAIScriptPtr
_0812A1DC: .4byte 0x020192e4
	thumb_func_end contest_ai_get_condition

	thumb_func_start sub_8129E64
sub_8129E64: @ 812A1E0
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _0812A210 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A214 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812A218
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A21C
	.align 2, 0
_0812A210: .4byte 0x020192e4
_0812A214: .4byte gAIScriptPtr
_0812A218:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A21C:
	pop {r0}
	bx r0
	thumb_func_end sub_8129E64

	thumb_func_start sub_8129EA4
sub_8129EA4: @ 812A220
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _0812A250 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A254 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A258
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A25C
	.align 2, 0
_0812A250: .4byte 0x020192e4
_0812A254: .4byte gAIScriptPtr
_0812A258:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A25C:
	pop {r0}
	bx r0
	thumb_func_end sub_8129EA4

	thumb_func_start sub_8129EE4
sub_8129EE4: @ 812A260
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _0812A290 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A294 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A298
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A29C
	.align 2, 0
_0812A290: .4byte 0x020192e4
_0812A294: .4byte gAIScriptPtr
_0812A298:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A29C:
	pop {r0}
	bx r0
	thumb_func_end sub_8129EE4

	thumb_func_start sub_8129F24
sub_8129F24: @ 812A2A0
	push {lr}
	bl contest_ai_get_condition
	ldr r0, _0812A2D0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A2D4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A2D8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A2DC
	.align 2, 0
_0812A2D0: .4byte 0x020192e4
_0812A2D4: .4byte gAIScriptPtr
_0812A2D8:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A2DC:
	pop {r0}
	bx r0
	thumb_func_end sub_8129F24

	thumb_func_start contest_ai_get_used_combo_starter
contest_ai_get_used_combo_starter: @ 812A2E0
	push {r4-r6,lr}
	movs r6, 0
	ldr r5, _0812A328 @ =gAIScriptPtr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _0812A318
	ldr r2, _0812A32C @ =gContestMoves
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _0812A330 @ =0x02019260
	adds r0, r1
	ldrh r0, [r0, 0x8]
	lsls r0, 3
	adds r0, r2
	ldrb r1, [r0, 0x2]
	negs r0, r1
	orrs r0, r1
	lsrs r6, r0, 31
_0812A318:
	ldr r0, _0812A334 @ =0x020192e4
	strh r6, [r0, 0x18]
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812A328: .4byte gAIScriptPtr
_0812A32C: .4byte gContestMoves
_0812A330: .4byte 0x02019260
_0812A334: .4byte 0x020192e4
	thumb_func_end contest_ai_get_used_combo_starter

	thumb_func_start sub_8129FBC
sub_8129FBC: @ 812A338
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _0812A368 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A36C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812A370
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A374
	.align 2, 0
_0812A368: .4byte 0x020192e4
_0812A36C: .4byte gAIScriptPtr
_0812A370:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A374:
	pop {r0}
	bx r0
	thumb_func_end sub_8129FBC

	thumb_func_start sub_8129FFC
sub_8129FFC: @ 812A378
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _0812A3A8 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A3AC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A3B0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A3B4
	.align 2, 0
_0812A3A8: .4byte 0x020192e4
_0812A3AC: .4byte gAIScriptPtr
_0812A3B0:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A3B4:
	pop {r0}
	bx r0
	thumb_func_end sub_8129FFC

	thumb_func_start sub_812A03C
sub_812A03C: @ 812A3B8
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _0812A3E8 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A3EC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A3F0
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A3F4
	.align 2, 0
_0812A3E8: .4byte 0x020192e4
_0812A3EC: .4byte gAIScriptPtr
_0812A3F0:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A3F4:
	pop {r0}
	bx r0
	thumb_func_end sub_812A03C

	thumb_func_start sub_812A07C
sub_812A07C: @ 812A3F8
	push {lr}
	bl contest_ai_get_used_combo_starter
	ldr r0, _0812A428 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A42C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A430
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A434
	.align 2, 0
_0812A428: .4byte 0x020192e4
_0812A42C: .4byte gAIScriptPtr
_0812A430:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A434:
	pop {r0}
	bx r0
	thumb_func_end sub_812A07C

	thumb_func_start contest_ai_check_can_participate
contest_ai_check_can_participate: @ 812A438
	push {lr}
	ldr r0, _0812A458 @ =gAIScriptPtr
	ldr r0, [r0]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	beq _0812A460
	ldr r1, _0812A45C @ =0x020192e4
	movs r0, 0
	b _0812A464
	.align 2, 0
_0812A458: .4byte gAIScriptPtr
_0812A45C: .4byte 0x020192e4
_0812A460:
	ldr r1, _0812A474 @ =0x020192e4
	movs r0, 0x1
_0812A464:
	strh r0, [r1, 0x18]
	ldr r1, _0812A478 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x2
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0812A474: .4byte 0x020192e4
_0812A478: .4byte gAIScriptPtr
	thumb_func_end contest_ai_check_can_participate

	thumb_func_start sub_812A100
sub_812A100: @ 812A47C
	push {lr}
	bl contest_ai_check_can_participate
	ldr r0, _0812A4A8 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A4B0
	ldr r3, _0812A4AC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A4B8
	.align 2, 0
_0812A4A8: .4byte 0x020192e4
_0812A4AC: .4byte gAIScriptPtr
_0812A4B0:
	ldr r1, _0812A4BC @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A4B8:
	pop {r0}
	bx r0
	.align 2, 0
_0812A4BC: .4byte gAIScriptPtr
	thumb_func_end sub_812A100

	thumb_func_start sub_812A144
sub_812A144: @ 812A4C0
	push {lr}
	bl contest_ai_check_can_participate
	ldr r0, _0812A4EC @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A4F4
	ldr r3, _0812A4F0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A4FC
	.align 2, 0
_0812A4EC: .4byte 0x020192e4
_0812A4F0: .4byte gAIScriptPtr
_0812A4F4:
	ldr r1, _0812A500 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A4FC:
	pop {r0}
	bx r0
	.align 2, 0
_0812A500: .4byte gAIScriptPtr
	thumb_func_end sub_812A144

	thumb_func_start contest_ai_get_val_812A188
contest_ai_get_val_812A188: @ 812A504
	push {r4,lr}
	ldr r4, _0812A538 @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0812A53C @ =0x020192e4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r0, r2, 0
	subs r0, 0x84
	adds r1, r0
	ldrb r0, [r1, 0x15]
	lsls r0, 28
	lsrs r0, 31
	strh r0, [r2, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A538: .4byte gAIScriptPtr
_0812A53C: .4byte 0x020192e4
	thumb_func_end contest_ai_get_val_812A188

	thumb_func_start sub_812A1C4
sub_812A1C4: @ 812A540
	push {lr}
	bl contest_ai_get_val_812A188
	ldr r0, _0812A56C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A574
	ldr r3, _0812A570 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A57C
	.align 2, 0
_0812A56C: .4byte 0x020192e4
_0812A570: .4byte gAIScriptPtr
_0812A574:
	ldr r1, _0812A580 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A57C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A580: .4byte gAIScriptPtr
	thumb_func_end sub_812A1C4

	thumb_func_start sub_812A208
sub_812A208: @ 812A584
	push {lr}
	bl contest_ai_get_val_812A188
	ldr r0, _0812A5B0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A5B8
	ldr r3, _0812A5B4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A5C0
	.align 2, 0
_0812A5B0: .4byte 0x020192e4
_0812A5B4: .4byte gAIScriptPtr
_0812A5B8:
	ldr r1, _0812A5C4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A5C0:
	pop {r0}
	bx r0
	.align 2, 0
_0812A5C4: .4byte gAIScriptPtr
	thumb_func_end sub_812A208

	thumb_func_start sub_812A24C
sub_812A24C: @ 812A5C8
	push {r4,r5,lr}
	ldr r5, _0812A608 @ =gAIScriptPtr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0812A60C @ =0x020192e4
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r4, r3, 0
	subs r4, 0x84
	adds r1, r4
	adds r0, r3, 0
	adds r0, 0x41
	ldrb r2, [r0]
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r1, 0x4]
	ldrh r0, [r0, 0x4]
	subs r1, r0
	strh r1, [r3, 0x18]
	ldr r0, [r5]
	adds r0, 0x2
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812A608: .4byte gAIScriptPtr
_0812A60C: .4byte 0x020192e4
	thumb_func_end sub_812A24C

	thumb_func_start sub_812A294
sub_812A294: @ 812A610
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A63C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0812A644
	ldr r3, _0812A640 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A64C
	.align 2, 0
_0812A63C: .4byte 0x020192e4
_0812A640: .4byte gAIScriptPtr
_0812A644:
	ldr r1, _0812A650 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A64C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A650: .4byte gAIScriptPtr
	thumb_func_end sub_812A294

	thumb_func_start sub_812A2D8
sub_812A2D8: @ 812A654
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A680 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _0812A688
	ldr r3, _0812A684 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A690
	.align 2, 0
_0812A680: .4byte 0x020192e4
_0812A684: .4byte gAIScriptPtr
_0812A688:
	ldr r1, _0812A694 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A690:
	pop {r0}
	bx r0
	.align 2, 0
_0812A694: .4byte gAIScriptPtr
	thumb_func_end sub_812A2D8

	thumb_func_start sub_812A31C
sub_812A31C: @ 812A698
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A6C4 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A6CC
	ldr r3, _0812A6C8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A6D4
	.align 2, 0
_0812A6C4: .4byte 0x020192e4
_0812A6C8: .4byte gAIScriptPtr
_0812A6CC:
	ldr r1, _0812A6D8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A6D4:
	pop {r0}
	bx r0
	.align 2, 0
_0812A6D8: .4byte gAIScriptPtr
	thumb_func_end sub_812A31C

	thumb_func_start sub_812A360
sub_812A360: @ 812A6DC
	push {lr}
	bl sub_812A24C
	ldr r0, _0812A708 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A710
	ldr r3, _0812A70C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A718
	.align 2, 0
_0812A708: .4byte 0x020192e4
_0812A70C: .4byte gAIScriptPtr
_0812A710:
	ldr r1, _0812A71C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A718:
	pop {r0}
	bx r0
	.align 2, 0
_0812A71C: .4byte gAIScriptPtr
	thumb_func_end sub_812A360

	thumb_func_start sub_812A3A4
sub_812A3A4: @ 812A720
	push {r4,lr}
	ldr r4, _0812A754 @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, _0812A758 @ =0x020192e4
	ldr r2, _0812A75C @ =gUnknown_02038670
	lsrs r0, 23
	adds r0, r2
	adds r1, r3, 0
	adds r1, 0x41
	ldrb r1, [r1]
	lsls r1, 1
	adds r1, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r3, 0x18]
	ldr r0, [r4]
	adds r0, 0x2
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A754: .4byte gAIScriptPtr
_0812A758: .4byte 0x020192e4
_0812A75C: .4byte gUnknown_02038670
	thumb_func_end sub_812A3A4

	thumb_func_start sub_812A3E4
sub_812A3E4: @ 812A760
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A78C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0812A794
	ldr r3, _0812A790 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A79C
	.align 2, 0
_0812A78C: .4byte 0x020192e4
_0812A790: .4byte gAIScriptPtr
_0812A794:
	ldr r1, _0812A7A0 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A79C:
	pop {r0}
	bx r0
	.align 2, 0
_0812A7A0: .4byte gAIScriptPtr
	thumb_func_end sub_812A3E4

	thumb_func_start sub_812A428
sub_812A428: @ 812A7A4
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A7D0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _0812A7D8
	ldr r3, _0812A7D4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A7E0
	.align 2, 0
_0812A7D0: .4byte 0x020192e4
_0812A7D4: .4byte gAIScriptPtr
_0812A7D8:
	ldr r1, _0812A7E4 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A7E0:
	pop {r0}
	bx r0
	.align 2, 0
_0812A7E4: .4byte gAIScriptPtr
	thumb_func_end sub_812A428

	thumb_func_start sub_812A46C
sub_812A46C: @ 812A7E8
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A814 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812A81C
	ldr r3, _0812A818 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A824
	.align 2, 0
_0812A814: .4byte 0x020192e4
_0812A818: .4byte gAIScriptPtr
_0812A81C:
	ldr r1, _0812A828 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A824:
	pop {r0}
	bx r0
	.align 2, 0
_0812A828: .4byte gAIScriptPtr
	thumb_func_end sub_812A46C

	thumb_func_start sub_812A4B0
sub_812A4B0: @ 812A82C
	push {lr}
	bl sub_812A3A4
	ldr r0, _0812A858 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812A860
	ldr r3, _0812A85C @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A868
	.align 2, 0
_0812A858: .4byte 0x020192e4
_0812A85C: .4byte gAIScriptPtr
_0812A860:
	ldr r1, _0812A86C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812A868:
	pop {r0}
	bx r0
	.align 2, 0
_0812A86C: .4byte gAIScriptPtr
	thumb_func_end sub_812A4B0

	thumb_func_start sub_812A4F4
sub_812A4F4: @ 812A870
	push {r4,lr}
	ldr r4, _0812A8A8 @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A8AC @ =0x02019204
	lsrs r0, 23
	lsls r1, 3
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0xE0
	ldr r1, _0812A8B0 @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A8A8: .4byte gAIScriptPtr
_0812A8AC: .4byte 0x02019204
_0812A8B0: .4byte gContestMoves
	thumb_func_end sub_812A4F4

	thumb_func_start sub_812A538
sub_812A538: @ 812A8B4
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A8E4 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A8E8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812A8EC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A8F0
	.align 2, 0
_0812A8E4: .4byte 0x020192e4
_0812A8E8: .4byte gAIScriptPtr
_0812A8EC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A8F0:
	pop {r0}
	bx r0
	thumb_func_end sub_812A538

	thumb_func_start sub_812A578
sub_812A578: @ 812A8F4
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A924 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A928 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812A92C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A930
	.align 2, 0
_0812A924: .4byte 0x020192e4
_0812A928: .4byte gAIScriptPtr
_0812A92C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A930:
	pop {r0}
	bx r0
	thumb_func_end sub_812A578

	thumb_func_start sub_812A5B8
sub_812A5B8: @ 812A934
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A964 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A968 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812A96C
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A970
	.align 2, 0
_0812A964: .4byte 0x020192e4
_0812A968: .4byte gAIScriptPtr
_0812A96C:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A970:
	pop {r0}
	bx r0
	thumb_func_end sub_812A5B8

	thumb_func_start sub_812A5F8
sub_812A5F8: @ 812A974
	push {lr}
	bl sub_812A4F4
	ldr r0, _0812A9A4 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812A9A8 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812A9AC
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812A9B0
	.align 2, 0
_0812A9A4: .4byte 0x020192e4
_0812A9A8: .4byte gAIScriptPtr
_0812A9AC:
	adds r0, r2, 0x5
	str r0, [r3]
_0812A9B0:
	pop {r0}
	bx r0
	thumb_func_end sub_812A5F8

	thumb_func_start sub_812A638
sub_812A638: @ 812A9B4
	push {r4,lr}
	ldr r4, _0812A9E8 @ =gAIScriptPtr
	ldr r0, [r4]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	lsrs r0, 24
	ldr r3, [r4]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812A9EC @ =0x02019204
	lsls r1, 2
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x44
	adds r0, r1
	adds r2, 0xE0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812A9E8: .4byte gAIScriptPtr
_0812A9EC: .4byte 0x02019204
	thumb_func_end sub_812A638

	thumb_func_start sub_812A674
sub_812A674: @ 812A9F0
	push {lr}
	bl sub_812A638
	ldr r0, _0812AA20 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812AA24 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bge _0812AA28
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AA2C
	.align 2, 0
_0812AA20: .4byte 0x020192e4
_0812AA24: .4byte gAIScriptPtr
_0812AA28:
	adds r0, r2, 0x5
	str r0, [r3]
_0812AA2C:
	pop {r0}
	bx r0
	thumb_func_end sub_812A674

	thumb_func_start sub_812A6B4
sub_812A6B4: @ 812AA30
	push {lr}
	bl sub_812A638
	ldr r0, _0812AA60 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812AA64 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	ble _0812AA68
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AA6C
	.align 2, 0
_0812AA60: .4byte 0x020192e4
_0812AA64: .4byte gAIScriptPtr
_0812AA68:
	adds r0, r2, 0x5
	str r0, [r3]
_0812AA6C:
	pop {r0}
	bx r0
	thumb_func_end sub_812A6B4

	thumb_func_start sub_812A6F4
sub_812A6F4: @ 812AA70
	push {lr}
	bl sub_812A638
	ldr r0, _0812AAA0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812AAA4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812AAA8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AAAC
	.align 2, 0
_0812AAA0: .4byte 0x020192e4
_0812AAA4: .4byte gAIScriptPtr
_0812AAA8:
	adds r0, r2, 0x5
	str r0, [r3]
_0812AAAC:
	pop {r0}
	bx r0
	thumb_func_end sub_812A6F4

	thumb_func_start sub_812A734
sub_812A734: @ 812AAB0
	push {lr}
	bl sub_812A638
	ldr r0, _0812AAE0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812AAE4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812AAE8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AAEC
	.align 2, 0
_0812AAE0: .4byte 0x020192e4
_0812AAE4: .4byte gAIScriptPtr
_0812AAE8:
	adds r0, r2, 0x5
	str r0, [r3]
_0812AAEC:
	pop {r0}
	bx r0
	thumb_func_end sub_812A734

	thumb_func_start sub_812A774
sub_812A774: @ 812AAF0
	push {r4,r5,lr}
	ldr r5, _0812AB30 @ =gAIScriptPtr
	ldr r0, [r5]
	ldrb r0, [r0, 0x1]
	bl sub_8128A7C
	lsls r0, 24
	ldr r3, [r5]
	ldrb r1, [r3, 0x2]
	ldr r2, _0812AB34 @ =0x02019204
	lsrs r0, 23
	lsls r1, 3
	adds r0, r1
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldrh r0, [r0]
	adds r2, 0xE0
	ldr r4, _0812AB38 @ =gContestEffects
	ldr r1, _0812AB3C @ =gContestMoves
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r2, 0x18]
	adds r3, 0x3
	str r3, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0812AB30: .4byte gAIScriptPtr
_0812AB34: .4byte 0x02019204
_0812AB38: .4byte gContestEffects
_0812AB3C: .4byte gContestMoves
	thumb_func_end sub_812A774

	thumb_func_start sub_812A7C4
sub_812A7C4: @ 812AB40
	push {lr}
	bl sub_812A774
	ldr r0, _0812AB70 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812AB74 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	bne _0812AB78
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812AB7C
	.align 2, 0
_0812AB70: .4byte 0x020192e4
_0812AB74: .4byte gAIScriptPtr
_0812AB78:
	adds r0, r2, 0x5
	str r0, [r3]
_0812AB7C:
	pop {r0}
	bx r0
	thumb_func_end sub_812A7C4

	thumb_func_start sub_812A804
sub_812A804: @ 812AB80
	push {lr}
	bl sub_812A774
	ldr r0, _0812ABB0 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	ldr r3, _0812ABB4 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0812ABB8
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812ABBC
	.align 2, 0
_0812ABB0: .4byte 0x020192e4
_0812ABB4: .4byte gAIScriptPtr
_0812ABB8:
	adds r0, r2, 0x5
	str r0, [r3]
_0812ABBC:
	pop {r0}
	bx r0
	thumb_func_end sub_812A804

	thumb_func_start sub_812A844
sub_812A844: @ 812ABC0
	push {r4,lr}
	ldr r3, _0812ABE0 @ =0x020192e4
	ldr r4, _0812ABE4 @ =gAIScriptPtr
	ldr r2, [r4]
	ldrb r0, [r2, 0x1]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x1A
	adds r0, r1
	ldrh r1, [r3, 0x18]
	strh r1, [r0]
	adds r2, 0x2
	str r2, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812ABE0: .4byte 0x020192e4
_0812ABE4: .4byte gAIScriptPtr
	thumb_func_end sub_812A844

	thumb_func_start sub_812A86C
sub_812A86C: @ 812ABE8
	push {r4,lr}
	ldr r0, _0812AC0C @ =0x020192e4
	ldr r4, _0812AC10 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	lsls r2, 1
	adds r0, 0x1A
	adds r2, r0
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	strh r1, [r2]
	adds r3, 0x4
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AC0C: .4byte 0x020192e4
_0812AC10: .4byte gAIScriptPtr
	thumb_func_end sub_812A86C

	thumb_func_start sub_812A898
sub_812A898: @ 812AC14
	push {r4,lr}
	ldr r0, _0812AC40 @ =0x020192e4
	ldr r4, _0812AC44 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r2, [r3, 0x1]
	lsls r2, 1
	adds r0, 0x1A
	adds r2, r0
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrh r0, [r2]
	adds r1, r0
	strh r1, [r2]
	adds r3, 0x4
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AC40: .4byte 0x020192e4
_0812AC44: .4byte gAIScriptPtr
	thumb_func_end sub_812A898

	thumb_func_start sub_812A8CC
sub_812A8CC: @ 812AC48
	push {r4,lr}
	ldr r2, _0812AC70 @ =0x020192e4
	ldr r4, _0812AC74 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AC70: .4byte 0x020192e4
_0812AC74: .4byte gAIScriptPtr
	thumb_func_end sub_812A8CC

	thumb_func_start sub_812A8FC
sub_812A8FC: @ 812AC78
	push {r4,lr}
	ldr r2, _0812ACA0 @ =0x020192e4
	ldr r4, _0812ACA4 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	adds r3, 0x3
	str r3, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812ACA0: .4byte 0x020192e4
_0812ACA4: .4byte gAIScriptPtr
	thumb_func_end sub_812A8FC

	thumb_func_start sub_812A92C
sub_812A92C: @ 812ACA8
	push {r4,lr}
	ldr r1, _0812ACE0 @ =0x020192e4
	ldr r4, _0812ACE4 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	bge _0812ACE8
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812ACEE
	.align 2, 0
_0812ACE0: .4byte 0x020192e4
_0812ACE4: .4byte gAIScriptPtr
_0812ACE8:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812ACEE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812A92C

	thumb_func_start sub_812A978
sub_812A978: @ 812ACF4
	push {r4,lr}
	ldr r1, _0812AD2C @ =0x020192e4
	ldr r4, _0812AD30 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	ble _0812AD34
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AD3A
	.align 2, 0
_0812AD2C: .4byte 0x020192e4
_0812AD30: .4byte gAIScriptPtr
_0812AD34:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812AD3A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812A978

	thumb_func_start sub_812A9C4
sub_812A9C4: @ 812AD40
	push {r4,lr}
	ldr r1, _0812AD78 @ =0x020192e4
	ldr r4, _0812AD7C @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	bne _0812AD80
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AD86
	.align 2, 0
_0812AD78: .4byte 0x020192e4
_0812AD7C: .4byte gAIScriptPtr
_0812AD80:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812AD86:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812A9C4

	thumb_func_start sub_812AA10
sub_812AA10: @ 812AD8C
	push {r4,lr}
	ldr r1, _0812ADC4 @ =0x020192e4
	ldr r4, _0812ADC8 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r2, [r0, r1]
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	cmp r2, r1
	beq _0812ADCC
	ldrb r1, [r3, 0x4]
	ldrb r0, [r3, 0x5]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x7]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812ADD2
	.align 2, 0
_0812ADC4: .4byte 0x020192e4
_0812ADC8: .4byte gAIScriptPtr
_0812ADCC:
	adds r0, r3, 0
	adds r0, 0x8
	str r0, [r4]
_0812ADD2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AA10

	thumb_func_start sub_812AA5C
sub_812AA5C: @ 812ADD8
	push {r4,lr}
	ldr r2, _0812AE14 @ =0x020192e4
	ldr r4, _0812AE18 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _0812AE1C
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AE20
	.align 2, 0
_0812AE14: .4byte 0x020192e4
_0812AE18: .4byte gAIScriptPtr
_0812AE1C:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AE20:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AA5C

	thumb_func_start sub_812AAAC
sub_812AAAC: @ 812AE28
	push {r4,lr}
	ldr r2, _0812AE64 @ =0x020192e4
	ldr r4, _0812AE68 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0812AE6C
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AE70
	.align 2, 0
_0812AE64: .4byte 0x020192e4
_0812AE68: .4byte gAIScriptPtr
_0812AE6C:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AE70:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AAAC

	thumb_func_start sub_812AAFC
sub_812AAFC: @ 812AE78
	push {r4,lr}
	ldr r2, _0812AEB4 @ =0x020192e4
	ldr r4, _0812AEB8 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _0812AEBC
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AEC0
	.align 2, 0
_0812AEB4: .4byte 0x020192e4
_0812AEB8: .4byte gAIScriptPtr
_0812AEBC:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AEC0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AAFC

	thumb_func_start sub_812AB4C
sub_812AB4C: @ 812AEC8
	push {r4,lr}
	ldr r2, _0812AF04 @ =0x020192e4
	ldr r4, _0812AF08 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r1, [r3, 0x1]
	lsls r1, 1
	adds r2, 0x1A
	adds r1, r2
	ldrb r0, [r3, 0x2]
	lsls r0, 1
	adds r0, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	beq _0812AF0C
	ldrb r1, [r3, 0x3]
	ldrb r0, [r3, 0x4]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x6]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AF10
	.align 2, 0
_0812AF04: .4byte 0x020192e4
_0812AF08: .4byte gAIScriptPtr
_0812AF0C:
	adds r0, r3, 0x7
	str r0, [r4]
_0812AF10:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AB4C

	thumb_func_start sub_812AB9C
sub_812AB9C: @ 812AF18
	push {r4,lr}
	bl Random
	movs r2, 0xFF
	ands r2, r0
	ldr r1, _0812AF50 @ =0x020192e4
	ldr r4, _0812AF54 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	bge _0812AF58
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AF5C
	.align 2, 0
_0812AF50: .4byte 0x020192e4
_0812AF54: .4byte gAIScriptPtr
_0812AF58:
	adds r0, r3, 0x6
	str r0, [r4]
_0812AF5C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812AB9C

	thumb_func_start sub_812ABE8
sub_812ABE8: @ 812AF64
	push {r4,lr}
	bl Random
	movs r2, 0xFF
	ands r2, r0
	ldr r1, _0812AF9C @ =0x020192e4
	ldr r4, _0812AFA0 @ =gAIScriptPtr
	ldr r3, [r4]
	ldrb r0, [r3, 0x1]
	lsls r0, 1
	adds r1, 0x1A
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r2, r0
	ble _0812AFA4
	ldrb r1, [r3, 0x2]
	ldrb r0, [r3, 0x3]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r3, 0x4]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r3, 0x5]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	b _0812AFA8
	.align 2, 0
_0812AF9C: .4byte 0x020192e4
_0812AFA0: .4byte gAIScriptPtr
_0812AFA4:
	adds r0, r3, 0x6
	str r0, [r4]
_0812AFA8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_812ABE8

	thumb_func_start sub_812AC34
sub_812AC34: @ 812AFB0
	ldr r3, _0812AFCC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	bx lr
	.align 2, 0
_0812AFCC: .4byte gAIScriptPtr
	thumb_func_end sub_812AC34

	thumb_func_start sub_812AC54
sub_812AC54: @ 812AFD0
	push {r4,lr}
	ldr r4, _0812AFFC @ =gAIScriptPtr
	ldr r0, [r4]
	adds r0, 0x5
	bl sub_812ACA4
	ldr r2, [r4]
	ldrb r1, [r2, 0x1]
	ldrb r0, [r2, 0x2]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x4]
	lsls r0, 24
	orrs r1, r0
	str r1, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812AFFC: .4byte gAIScriptPtr
	thumb_func_end sub_812AC54

	thumb_func_start sub_812AC84
sub_812AC84: @ 812B000
	push {lr}
	bl sub_812ACC8
	lsls r0, 24
	cmp r0, 0
	bne _0812B016
	ldr r2, _0812B01C @ =0x020192e4
	ldrb r1, [r2, 0x9]
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
_0812B016:
	pop {r0}
	bx r0
	.align 2, 0
_0812B01C: .4byte 0x020192e4
	thumb_func_end sub_812AC84

	thumb_func_start sub_812ACA4
sub_812ACA4: @ 812B020
	push {r4,lr}
	ldr r3, _0812B040 @ =0x020192e4
	adds r4, r3, 0
	adds r4, 0x40
	ldrb r1, [r4]
	adds r2, r1, 0x1
	strb r2, [r4]
	lsls r1, 24
	lsrs r1, 22
	adds r3, 0x20
	adds r1, r3
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812B040: .4byte 0x020192e4
	thumb_func_end sub_812ACA4

	thumb_func_start sub_812ACC8
sub_812ACC8: @ 812B044
	push {lr}
	ldr r1, _0812B058 @ =0x020192e4
	adds r3, r1, 0
	adds r3, 0x40
	ldrb r0, [r3]
	cmp r0, 0
	bne _0812B05C
	movs r0, 0
	b _0812B070
	.align 2, 0
_0812B058: .4byte 0x020192e4
_0812B05C:
	subs r0, 0x1
	strb r0, [r3]
	ldr r2, _0812B074 @ =gAIScriptPtr
	ldrb r0, [r3]
	lsls r0, 2
	adds r1, 0x20
	adds r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r0, 0x1
_0812B070:
	pop {r1}
	bx r1
	.align 2, 0
_0812B074: .4byte gAIScriptPtr
	thumb_func_end sub_812ACC8

	thumb_func_start contest_ai_check_for_exciting_move
contest_ai_check_for_exciting_move: @ 812B078
	push {r4-r7,lr}
	movs r5, 0
	movs r4, 0
	ldr r7, _0812B0A4 @ =0x02019325
	ldr r6, _0812B0A8 @ =gUnknown_0203858E
_0812B082:
	lsls r0, r4, 1
	ldrb r1, [r7]
	lsls r1, 6
	adds r0, r1
	adds r1, r0, r6
	ldrh r0, [r1]
	cmp r0, 0
	beq _0812B0AC
	bl contest_get_move_excitement
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x1
	bne _0812B0AC
	movs r5, 0x1
	b _0812B0B2
	.align 2, 0
_0812B0A4: .4byte 0x02019325
_0812B0A8: .4byte gUnknown_0203858E
_0812B0AC:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0812B082
_0812B0B2:
	ldr r0, _0812B0C4 @ =0x020192e4
	strh r5, [r0, 0x18]
	ldr r1, _0812B0C8 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0812B0C4: .4byte 0x020192e4
_0812B0C8: .4byte gAIScriptPtr
	thumb_func_end contest_ai_check_for_exciting_move

	thumb_func_start sub_812AD50
sub_812AD50: @ 812B0CC
	push {lr}
	bl contest_ai_check_for_exciting_move
	ldr r0, _0812B0F8 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812B100
	ldr r3, _0812B0FC @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812B108
	.align 2, 0
_0812B0F8: .4byte 0x020192e4
_0812B0FC: .4byte gAIScriptPtr
_0812B100:
	ldr r1, _0812B10C @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812B108:
	pop {r0}
	bx r0
	.align 2, 0
_0812B10C: .4byte gAIScriptPtr
	thumb_func_end sub_812AD50

	thumb_func_start sub_812AD94
sub_812AD94: @ 812B110
	push {lr}
	bl contest_ai_check_for_exciting_move
	ldr r0, _0812B13C @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812B144
	ldr r3, _0812B140 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812B14C
	.align 2, 0
_0812B13C: .4byte 0x020192e4
_0812B140: .4byte gAIScriptPtr
_0812B144:
	ldr r1, _0812B150 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812B14C:
	pop {r0}
	bx r0
	.align 2, 0
_0812B150: .4byte gAIScriptPtr
	thumb_func_end sub_812AD94

	thumb_func_start sub_812ADD8
sub_812ADD8: @ 812B154
	push {r4-r7,lr}
	movs r6, 0
	ldr r2, _0812B184 @ =gAIScriptPtr
	ldr r0, [r2]
	ldrb r4, [r0, 0x1]
	ldrb r0, [r0, 0x2]
	lsls r0, 8
	orrs r4, r0
	movs r3, 0
	ldr r0, _0812B188 @ =gContestMons
	mov r12, r0
	ldr r5, _0812B18C @ =0x020192e4
	adds r0, r5, 0
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	mov r1, r12
	adds r1, 0x1E
	adds r0, r1
	ldrh r0, [r0]
	adds r7, r2, 0
	mov r2, r12
	mov r12, r5
	b _0812B1AA
	.align 2, 0
_0812B184: .4byte gAIScriptPtr
_0812B188: .4byte gContestMons
_0812B18C: .4byte 0x020192e4
_0812B190:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _0812B1B0
	lsls r1, r3, 1
	mov r0, r12
	adds r0, 0x41
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r0, r2, 0
	adds r0, 0x1E
	adds r1, r0
	ldrh r0, [r1]
_0812B1AA:
	cmp r0, r4
	bne _0812B190
	movs r6, 0x1
_0812B1B0:
	mov r0, r12
	strh r6, [r0, 0x18]
	ldr r0, [r7]
	adds r0, 0x3
	str r0, [r7]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_812ADD8

	thumb_func_start sub_812AE44
sub_812AE44: @ 812B1C0
	push {lr}
	bl sub_812ADD8
	ldr r0, _0812B1EC @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0812B1F4
	ldr r3, _0812B1F0 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812B1FC
	.align 2, 0
_0812B1EC: .4byte 0x020192e4
_0812B1F0: .4byte gAIScriptPtr
_0812B1F4:
	ldr r1, _0812B200 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812B1FC:
	pop {r0}
	bx r0
	.align 2, 0
_0812B200: .4byte gAIScriptPtr
	thumb_func_end sub_812AE44

	thumb_func_start sub_812AE88
sub_812AE88: @ 812B204
	push {lr}
	bl sub_812ADD8
	ldr r0, _0812B230 @ =0x020192e4
	movs r1, 0x18
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0812B238
	ldr r3, _0812B234 @ =gAIScriptPtr
	ldr r2, [r3]
	ldrb r1, [r2]
	ldrb r0, [r2, 0x1]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x2]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0x3]
	lsls r0, 24
	orrs r1, r0
	str r1, [r3]
	b _0812B240
	.align 2, 0
_0812B230: .4byte 0x020192e4
_0812B234: .4byte gAIScriptPtr
_0812B238:
	ldr r1, _0812B244 @ =gAIScriptPtr
	ldr r0, [r1]
	adds r0, 0x4
	str r0, [r1]
_0812B240:
	pop {r0}
	bx r0
	.align 2, 0
_0812B244: .4byte gAIScriptPtr
	thumb_func_end sub_812AE88

	.align 2, 0 @ Don't pad with nop.
