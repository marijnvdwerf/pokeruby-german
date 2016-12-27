	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8077ABC
sub_8077ABC: @ 8077E7C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077E9A
	cmp r4, 0x3
	bne _08077E9A
	cmp r5, 0x3
	bne _08077E9A
	movs r4, 0x1
_08077E9A:
	cmp r4, 0x4
	bhi _08077F10
	lsls r0, r4, 2
	ldr r1, _08077EA8 @ =_08077EAC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077EA8: .4byte _08077EAC
	.align 2, 0
_08077EAC:
	.4byte _08077EC0
	.4byte _08077EE8
	.4byte _08077EC0
	.4byte _08077F10
	.4byte _08077F10
_08077EC0:
	ldr r4, _08077EE0 @ =gUnknown_0837F578
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077EE4 @ =gUnknown_020239F8
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	b _08077FB4
	.align 2, 0
_08077EE0: .4byte gUnknown_0837F578
_08077EE4: .4byte gUnknown_020239F8
_08077EE8:
	ldr r4, _08077F08 @ =gUnknown_0837F578
	adds r0, r5, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08077F0C @ =gUnknown_020239F8
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0, 0x1]
	b _08077FB4
	.align 2, 0
_08077F08: .4byte gUnknown_0837F578
_08077F0C: .4byte gUnknown_020239F8
_08077F10:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08077F34
	ldr r2, _08077F2C @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08077F30
	ldrh r1, [r2, 0x2]
	b _08077F9E
	.align 2, 0
_08077F2C: .4byte 0x02019348
_08077F30:
	ldrh r1, [r2]
	b _08077F9E
_08077F34:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077F68
	lsls r0, r5, 2
	ldr r1, _08077F5C @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077F9C
	ldr r1, _08077F60 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077F64 @ =gEnemyParty
	b _08077F82
	.align 2, 0
_08077F5C: .4byte 0x02017800
_08077F60: .4byte gUnknown_02024A6A
_08077F64: .4byte gEnemyParty
_08077F68:
	lsls r0, r5, 2
	ldr r1, _08077F90 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08077F9C
	ldr r1, _08077F94 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08077F98 @ =gPlayerParty
_08077F82:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08077F9E
	.align 2, 0
_08077F90: .4byte 0x02017800
_08077F94: .4byte gUnknown_02024A6A
_08077F98: .4byte gPlayerParty
_08077F9C:
	ldrh r1, [r1, 0x2]
_08077F9E:
	cmp r4, 0x3
	bne _08077FA8
	adds r0, r5, 0
	movs r2, 0x1
	b _08077FAC
_08077FA8:
	adds r0, r5, 0
	movs r2, 0
_08077FAC:
	bl sub_8077E44
	lsls r0, 24
	lsrs r0, 24
_08077FB4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8077ABC

	thumb_func_start sub_8077BFC
sub_8077BFC: @ 8077FBC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08077FDC
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080780C4
_08077FDC:
	cmp r5, 0xC9
	bne _0807808C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078004
	ldr r2, _08077FFC @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08078000
	ldr r2, [r2, 0x10]
	b _0807803E
	.align 2, 0
_08077FFC: .4byte 0x02019348
_08078000:
	ldr r2, [r2, 0x8]
	b _0807803E
_08078004:
	lsls r1, r4, 2
	ldr r0, _0807802C @ =0x02017800
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _08078038
	ldr r1, _08078030 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078034 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _0807803E
	.align 2, 0
_0807802C: .4byte 0x02017800
_08078030: .4byte gUnknown_02024A6A
_08078034: .4byte gPlayerParty
_08078038:
	ldr r0, _08078074 @ =gUnknown_02024E70
	adds r0, r1, r0
	ldr r2, [r0]
_0807803E:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _08078078
	adds r0, r5, 0
	b _08078082
	.align 2, 0
_08078074: .4byte gUnknown_02024E70
_08078078:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08078082:
	ldr r1, _08078088 @ =gMonBackPicCoords
	lsls r0, 2
	b _08078188
	.align 2, 0
_08078088: .4byte gMonBackPicCoords
_0807808C:
	ldr r0, _080780A0 @ =0x00000181
	cmp r5, r0
	bne _080780AC
	ldr r0, _080780A4 @ =gUnknown_0837F5AC
	ldr r1, _080780A8 @ =gUnknown_02024E84
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	b _0807818C
	.align 2, 0
_080780A0: .4byte 0x00000181
_080780A4: .4byte gUnknown_0837F5AC
_080780A8: .4byte gUnknown_02024E84
_080780AC:
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	bls _080780BC
	ldr r0, _080780B8 @ =gMonBackPicCoords
	b _0807818A
	.align 2, 0
_080780B8: .4byte gMonBackPicCoords
_080780BC:
	ldr r1, _080780C0 @ =gMonBackPicCoords
	b _08078186
	.align 2, 0
_080780C0: .4byte gMonBackPicCoords
_080780C4:
	cmp r5, 0xC9
	bne _08078150
	lsls r1, r4, 2
	ldr r0, _080780F0 @ =0x02017800
	adds r0, r1, r0
	ldrh r0, [r0, 0x2]
	cmp r0, 0
	bne _080780FC
	ldr r1, _080780F4 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080780F8 @ =gEnemyParty
	adds r0, r1
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _08078102
	.align 2, 0
_080780F0: .4byte 0x02017800
_080780F4: .4byte gUnknown_02024A6A
_080780F8: .4byte gEnemyParty
_080780FC:
	ldr r0, _08078138 @ =gUnknown_02024E70
	adds r0, r1, r0
	ldr r2, [r0]
_08078102:
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807813C
	adds r0, r5, 0
	b _08078146
	.align 2, 0
_08078138: .4byte gUnknown_02024E70
_0807813C:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_08078146:
	ldr r1, _0807814C @ =gMonFrontPicCoords
	lsls r0, 2
	b _08078188
	.align 2, 0
_0807814C: .4byte gMonFrontPicCoords
_08078150:
	ldr r0, _08078168 @ =0x00000181
	cmp r5, r0
	bne _08078174
	ldr r0, _0807816C @ =gUnknownCastformCoords_0837F598
	ldr r1, _08078170 @ =gUnknown_02024E84
	adds r1, r4, r1
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _0807818C
	.align 2, 0
_08078168: .4byte 0x00000181
_0807816C: .4byte gUnknownCastformCoords_0837F598
_08078170: .4byte gUnknown_02024E84
_08078174:
	movs r0, 0xCE
	lsls r0, 1
	cmp r5, r0
	bls _08078184
	ldr r0, _08078180 @ =gMonFrontPicCoords
	b _0807818A
	.align 2, 0
_08078180: .4byte gMonFrontPicCoords
_08078184:
	ldr r1, _08078194 @ =gMonFrontPicCoords
_08078186:
	lsls r0, r5, 2
_08078188:
	adds r0, r1
_0807818A:
	ldrb r0, [r0, 0x1]
_0807818C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08078194: .4byte gMonFrontPicCoords
	thumb_func_end sub_8077BFC

	thumb_func_start sub_8077DD8
sub_8077DD8: @ 8078198
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	adds r7, r4, 0
	movs r5, 0
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080781F6
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080781F6
	ldr r0, _080781D4 @ =0x00000181
	cmp r4, r0
	bne _080781E0
	ldr r0, _080781D8 @ =gUnknownCastformData_0837F5A8
	ldr r1, _080781DC @ =gUnknown_02024E84
	adds r1, r6, r1
	ldrb r1, [r1]
	adds r1, r0
	ldrb r5, [r1]
	b _080781F6
	.align 2, 0
_080781D4: .4byte 0x00000181
_080781D8: .4byte gUnknownCastformData_0837F5A8
_080781DC: .4byte gUnknown_02024E84
_080781E0:
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bls _080781F0
	ldr r0, _080781EC @ =gEnemyMonElevation
	b _080781F4
	.align 2, 0
_080781EC: .4byte gEnemyMonElevation
_080781F0:
	ldr r0, _08078200 @ =gEnemyMonElevation
	adds r0, r7, r0
_080781F4:
	ldrb r5, [r0]
_080781F6:
	adds r0, r5, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08078200: .4byte gEnemyMonElevation
	thumb_func_end sub_8077DD8

	thumb_func_start sub_8077E44
sub_8077E44: @ 8078204
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078228
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078236
_08078228:
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077BFC
	lsls r0, 24
	lsrs r4, r0, 24
	b _08078254
_08078236:
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077BFC
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8077DD8
	lsls r0, 24
	lsrs r0, 24
	subs r0, r4, r0
	lsls r0, 16
	lsrs r4, r0, 16
_08078254:
	adds r0, r6, 0
	bl battle_get_per_side_status
	ldr r3, _0807829C @ =gUnknown_0837F578
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _080782A0 @ =gUnknown_020239F8
	ldrh r2, [r1]
	movs r1, 0x1
	ands r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0, 0x1]
	adds r0, r4
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, 0
	beq _08078294
	adds r0, r6, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807828E
	adds r0, r4, 0
	adds r0, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
_0807828E:
	cmp r4, 0x68
	bls _08078294
	movs r4, 0x68
_08078294:
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807829C: .4byte gUnknown_0837F578
_080782A0: .4byte gUnknown_020239F8
	thumb_func_end sub_8077E44

	thumb_func_start sub_8077EE4
sub_8077EE4: @ 80782A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	movs r0, 0xFD
	lsls r0, 24
	adds r1, r0
	lsrs r1, 24
	cmp r1, 0x1
	bhi _08078316
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080782DC
	ldr r2, _080782D4 @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080782D8
	ldrh r1, [r2, 0x2]
	b _080782FE
	.align 2, 0
_080782D4: .4byte 0x02019348
_080782D8:
	ldrh r1, [r2]
	b _080782FE
_080782DC:
	lsls r0, r4, 2
	ldr r1, _080782F4 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _080782FC
	ldr r1, _080782F8 @ =gUnknown_0202F7CA
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080782FE
	.align 2, 0
_080782F4: .4byte 0x02017800
_080782F8: .4byte gUnknown_0202F7CA
_080782FC:
	ldrh r1, [r1, 0x2]
_080782FE:
	cmp r5, 0x3
	bne _0807830C
	adds r0, r4, 0
	movs r2, 0x1
	bl sub_8077E44
	b _0807831E
_0807830C:
	adds r0, r4, 0
	movs r2, 0
	bl sub_8077E44
	b _0807831E
_08078316:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
_0807831E:
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8077EE4

	thumb_func_start sub_8077F68
sub_8077F68: @ 8078328
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8077F68

	thumb_func_start sub_8077F7C
sub_8077F7C: @ 807833C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078360
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x80
	lsls r1, 13
	b _08078370
_08078360:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 8
	movs r1, 0x88
	lsls r1, 13
_08078370:
	adds r0, r1
	lsrs r0, 16
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8077F7C

	thumb_func_start sub_8077FC0
sub_8077FC0: @ 8078380
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078420
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _080783D0
	lsls r0, r5, 2
	ldr r1, _080783C4 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08078404
	ldr r1, _080783C8 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080783CC @ =gEnemyParty
	b _080783EA
	.align 2, 0
_080783C4: .4byte 0x02017800
_080783C8: .4byte gUnknown_02024A6A
_080783CC: .4byte gEnemyParty
_080783D0:
	lsls r0, r5, 2
	ldr r1, _080783F8 @ =0x02017800
	adds r1, r0, r1
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08078404
	ldr r1, _080783FC @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078400 @ =gPlayerParty
_080783EA:
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	b _08078406
	.align 2, 0
_080783F8: .4byte 0x02017800
_080783FC: .4byte gUnknown_02024A6A
_08078400: .4byte gPlayerParty
_08078404:
	ldrh r4, [r1, 0x2]
_08078406:
	adds r0, r5, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078420
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8077DD8
	subs r0, r6, r0
	lsls r0, 24
	lsrs r6, r0, 24
_08078420:
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8077FC0

	thumb_func_start obj_id_for_side_relative_to_move
obj_id_for_side_relative_to_move: @ 8078428
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	bne _08078450
	ldr r4, _08078448 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _0807849E
	ldr r1, _0807844C @ =gUnknown_02024BE0
	ldrb r0, [r4]
	b _080784AE
	.align 2, 0
_08078448: .4byte gUnknown_0202F7C8
_0807844C: .4byte gUnknown_02024BE0
_08078450:
	cmp r0, 0x1
	bne _08078470
	ldr r4, _08078468 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _0807849E
	ldr r1, _0807846C @ =gUnknown_02024BE0
	ldrb r0, [r4]
	b _080784AE
	.align 2, 0
_08078468: .4byte gUnknown_0202F7C9
_0807846C: .4byte gUnknown_02024BE0
_08078470:
	cmp r1, 0x2
	bne _0807848C
	ldr r5, _08078488 @ =gUnknown_0202F7C8
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807849E
	b _080784A8
	.align 2, 0
_08078488: .4byte gUnknown_0202F7C8
_0807848C:
	ldr r5, _080784A4 @ =gUnknown_0202F7C9
	ldrb r0, [r5]
	movs r4, 0x2
	eors r0, r4
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	bne _080784A8
_0807849E:
	movs r0, 0xFF
	b _080784B2
	.align 2, 0
_080784A4: .4byte gUnknown_0202F7C9
_080784A8:
	ldr r1, _080784B8 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	eors r0, r4
_080784AE:
	adds r0, r1
	ldrb r0, [r0]
_080784B2:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080784B8: .4byte gUnknown_02024BE0
	thumb_func_end obj_id_for_side_relative_to_move

	thumb_func_start oamt_set_x3A_32
oamt_set_x3A_32: @ 80784BC
	strh r1, [r0, 0x3A]
	lsrs r1, 16
	strh r1, [r0, 0x3C]
	bx lr
	thumb_func_end oamt_set_x3A_32

	thumb_func_start sub_8078104
sub_8078104: @ 80784C4
	ldrh r2, [r0, 0x3A]
	movs r3, 0x3C
	ldrsh r1, [r0, r3]
	lsls r1, 16
	orrs r2, r1
	str r2, [r0, 0x1C]
	bx lr
	thumb_func_end sub_8078104

	thumb_func_start sub_8078114
sub_8078114: @ 80784D4
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08078528
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08078514
	ldr r2, _08078510 @ =0xffffff00
	b _0807851C
	.align 2, 0
_08078510: .4byte 0xffffff00
_08078514:
	cmp r0, 0
	bge _08078520
	movs r2, 0x80
	lsls r2, 1
_0807851C:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08078520:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _0807852E
_08078528:
	adds r0, r4, 0
	bl sub_8078104
_0807852E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078114

	thumb_func_start sub_8078174
sub_8078174: @ 8078534
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080785A4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
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
	ble _08078590
	ldr r2, _0807858C @ =0xffffff00
	b _08078598
	.align 2, 0
_0807858C: .4byte 0xffffff00
_08078590:
	cmp r0, 0
	bge _0807859C
	movs r2, 0x80
	lsls r2, 1
_08078598:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_0807859C:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _080785AA
_080785A4:
	adds r0, r4, 0
	bl sub_8078104
_080785AA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078174

	thumb_func_start unref_sub_80781F0
unref_sub_80781F0: @ 80785B0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807862C
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	ldrh r0, [r4, 0x38]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080785F8
	ldr r2, _080785F4 @ =0xffffff00
	b _08078600
	.align 2, 0
_080785F4: .4byte 0xffffff00
_080785F8:
	cmp r0, 0
	bge _08078604
	movs r2, 0x80
	lsls r2, 1
_08078600:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08078604:
	ldrh r1, [r4, 0x36]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	cmp r0, 0xFF
	ble _08078618
	ldr r2, _08078614 @ =0xffffff00
	b _08078620
	.align 2, 0
_08078614: .4byte 0xffffff00
_08078618:
	cmp r0, 0
	bge _08078624
	movs r2, 0x80
	lsls r2, 1
_08078620:
	adds r0, r1, r2
	strh r0, [r4, 0x36]
_08078624:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08078632
_0807862C:
	adds r0, r4, 0
	bl sub_8078104
_08078632:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80781F0

	thumb_func_start sub_8078278
sub_8078278: @ 8078638
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807868C
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x24]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x2E]
	adds r1, r0, r2
	strh r1, [r4, 0x2E]
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _08078678
	ldr r2, _08078674 @ =0xffffff00
	b _08078680
	.align 2, 0
_08078674: .4byte 0xffffff00
_08078678:
	cmp r0, 0
	bge _08078684
	movs r2, 0x80
	lsls r2, 1
_08078680:
	adds r0, r1, r2
	strh r0, [r4, 0x2E]
_08078684:
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x34]
	b _08078692
_0807868C:
	adds r0, r4, 0
	bl sub_8078104
_08078692:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078278

	thumb_func_start sub_80782D8
sub_80782D8: @ 8078698
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080786AC
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	b _080786B2
_080786AC:
	adds r0, r1, 0
	bl sub_8078104
_080786B2:
	pop {r0}
	bx r0
	thumb_func_end sub_80782D8

	thumb_func_start sub_80782F8
sub_80782F8: @ 80786B8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078314
	ldr r1, _080786D0 @ =sub_8078364
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080786D0: .4byte sub_8078364
	thumb_func_end sub_80782F8

	thumb_func_start sub_8078314
sub_8078314: @ 80786D4
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _080786EA
	ldrh r0, [r4, 0x2E]
	negs r0, r0
	strh r0, [r4, 0x2E]
_080786EA:
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	subs r0, r1
	ldrh r5, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	cmp r0, 0
	bge _08078704
	negs r0, r0
_08078704:
	strh r0, [r4, 0x2E]
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r2, 0x34
	ldrsh r1, [r4, r2]
	subs r0, r1
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x32]
	strh r5, [r4, 0x30]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8078314

	thumb_func_start sub_8078364
sub_8078364: @ 8078724
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08078748
	subs r0, r2, 0x1
	strh r0, [r1, 0x2E]
	ldrh r0, [r1, 0x30]
	ldrh r2, [r1, 0x24]
	adds r0, r2
	strh r0, [r1, 0x24]
	ldrh r0, [r1, 0x32]
	ldrh r3, [r1, 0x26]
	adds r0, r3
	strh r0, [r1, 0x26]
	b _0807874E
_08078748:
	adds r0, r1, 0
	bl sub_8078104
_0807874E:
	pop {r0}
	bx r0
	thumb_func_end sub_8078364

	thumb_func_start sub_8078394
sub_8078394: @ 8078754
	push {lr}
	adds r2, r0, 0
	ldrh r1, [r2, 0x2E]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	cmp r0, 0
	ble _08078784
	subs r0, r1, 0x1
	strh r0, [r2, 0x2E]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	ldrh r1, [r2, 0x32]
	ldrh r3, [r2, 0x36]
	adds r1, r3
	strh r1, [r2, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r2, 0x26]
	b _0807878A
_08078784:
	adds r0, r2, 0
	bl sub_8078104
_0807878A:
	pop {r0}
	bx r0
	thumb_func_end sub_8078394

	thumb_func_start sub_80783D0
sub_80783D0: @ 8078790
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080787C0
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	ldrh r1, [r4, 0x34]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r1, r2
	strh r1, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	lsls r1, 16
	asrs r1, 24
	strh r1, [r4, 0x26]
	b _080787C6
_080787C0:
	adds r0, r4, 0
	bl sub_8078104
_080787C6:
	adds r0, r4, 0
	bl sub_809D638
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80783D0

	thumb_func_start unref_sub_8078414
unref_sub_8078414: @ 80787D4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _08078810 @ =gUnknown_0202F7C9
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
	ldr r0, _08078814 @ =sub_80782F8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078810: .4byte gUnknown_0202F7C9
_08078814: .4byte sub_80782F8
	thumb_func_end unref_sub_8078414

	thumb_func_start sub_8078458
sub_8078458: @ 8078818
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r3, r2]
	cmp r0, 0
	ble _0807885C
	subs r0, r1, 0x1
	strh r0, [r3, 0x2E]
	ldr r2, _08078858 @ =gSprites
	movs r4, 0x34
	ldrsh r1, [r3, r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x30]
	ldrh r4, [r0, 0x24]
	adds r1, r4
	strh r1, [r0, 0x24]
	movs r0, 0x34
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r3, 0x32]
	ldrh r2, [r0, 0x26]
	adds r1, r2
	strh r1, [r0, 0x26]
	b _08078862
	.align 2, 0
_08078858: .4byte gSprites
_0807885C:
	adds r0, r3, 0
	bl sub_8078104
_08078862:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078458

	thumb_func_start sub_80784A8
sub_80784A8: @ 8078868
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080788B8
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x30]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x34]
	ldrh r0, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	adds r0, r2
	strh r0, [r4, 0x36]
	ldr r3, _080788B4 @ =gSprites
	movs r0, 0x38
	ldrsh r2, [r4, r0]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r3
	lsls r1, 16
	asrs r1, 24
	strh r1, [r0, 0x24]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r4, 0x36]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r1, 0x26]
	b _080788BE
	.align 2, 0
_080788B4: .4byte gSprites
_080788B8:
	adds r0, r4, 0
	bl sub_8078104
_080788BE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80784A8

	thumb_func_start sub_8078504
sub_8078504: @ 80788C4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08078926
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x30]
	adds r1, r0
	strh r1, [r4, 0x32]
	ldrh r1, [r4, 0x36]
	lsls r0, r1, 16
	asrs r0, 24
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x34]
	adds r1, r0
	strh r1, [r4, 0x36]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0807892C
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0807892C
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
	b _0807892C
_08078926:
	adds r0, r4, 0
	bl sub_8078104
_0807892C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078504

	thumb_func_start move_anim_8074EE0
move_anim_8074EE0: @ 8078934
	push {r4,lr}
	adds r4, r0, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl move_anim_8072740
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end move_anim_8074EE0

	thumb_func_start unref_sub_8078588
unref_sub_8078588: @ 8078948
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x24]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x26]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x34]
	ldr r5, _08078984 @ =gUnknown_0202F7C8
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
	ldr r0, _08078988 @ =sub_80782F8
	str r0, [r4, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078984: .4byte gUnknown_0202F7C8
_08078988: .4byte sub_80782F8
	thumb_func_end unref_sub_8078588

	thumb_func_start unref_sub_80785CC
unref_sub_80785CC: @ 807898C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x38]
	bl ResetPaletteStructByUid
	adds r0, r4, 0
	bl move_anim_8074EE0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80785CC

	thumb_func_start sub_80785E4
sub_80785E4: @ 80789A4
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080789BA
	adds r0, r2, 0
	bl sub_8078104
_080789BA:
	pop {r0}
	bx r0
	thumb_func_end sub_80785E4

	thumb_func_start sub_8078600
sub_8078600: @ 80789C0
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080789D6
	adds r0, r2, 0
	bl sub_8078104
_080789D6:
	pop {r0}
	bx r0
	thumb_func_end sub_8078600

	thumb_func_start sub_807861C
sub_807861C: @ 80789DC
	push {lr}
	ldr r1, _080789F0 @ =0x04000050
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_8072740
	pop {r0}
	bx r0
	.align 2, 0
_080789F0: .4byte 0x04000050
	thumb_func_end sub_807861C

	thumb_func_start sub_8078634
sub_8078634: @ 80789F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08078A0C @ =0x04000050
	movs r2, 0
	strh r2, [r1]
	adds r1, 0x2
	strh r2, [r1]
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_08078A0C: .4byte 0x04000050
	thumb_func_end sub_8078634

	thumb_func_start sub_8078650
sub_8078650: @ 8078A10
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08078A38 @ =gUnknown_0202F7C8
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
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078A38: .4byte gUnknown_0202F7C8
	thumb_func_end sub_8078650

	thumb_func_start sub_807867C
sub_807867C: @ 8078A3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	mov r8, r5
	ldr r7, _08078A74 @ =gUnknown_0202F7C8
	ldrb r0, [r7]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08078A78 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bhi _08078A88
	cmp r6, r0
	bcs _08078A7C
	lsls r0, r5, 16
	b _08078A98
	.align 2, 0
_08078A74: .4byte gUnknown_0202F7C8
_08078A78: .4byte gUnknown_0202F7C9
_08078A7C:
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078A94
_08078A88:
	ldrh r1, [r4, 0x20]
	lsls r0, r5, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4, 0x20]
	b _08078AA0
_08078A94:
	mov r1, r8
	lsls r0, r1, 16
_08078A98:
	asrs r0, 16
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
_08078AA0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807867C

	thumb_func_start sub_80786EC
sub_80786EC: @ 8078AAC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	movs r5, 0
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r0, 0x80
	lsls r0, 8
	bl __divsi3
	strh r0, [r4, 0x3A]
	strh r5, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80786EC

	thumb_func_start sub_8078718
sub_8078718: @ 8078AD8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	bne _08078B04
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	adds r0, r1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	ldrh r1, [r4, 0x26]
	adds r0, r1
	strh r0, [r4, 0x26]
	movs r0, 0
	b _08078B06
_08078B04:
	movs r0, 0x1
_08078B06:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8078718

	thumb_func_start oamt_add_pos2_onto_pos1
oamt_add_pos2_onto_pos1: @ 8078B0C
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	movs r2, 0
	strh r1, [r0, 0x20]
	ldrh r1, [r0, 0x26]
	ldrh r3, [r0, 0x22]
	adds r1, r3
	strh r1, [r0, 0x22]
	strh r2, [r0, 0x24]
	strh r2, [r0, 0x26]
	bx lr
	thumb_func_end oamt_add_pos2_onto_pos1

	thumb_func_start sub_8078764
sub_8078764: @ 8078B24
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _08078B4C
	ldr r4, _08078B68 @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
_08078B4C:
	ldr r4, _08078B6C @ =gUnknown_03004B00
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
_08078B68: .4byte gUnknown_0202F7C9
_08078B6C: .4byte gUnknown_03004B00
	thumb_func_end sub_8078764

	thumb_func_start sub_80787B0
sub_80787B0: @ 8078B70
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	bne _08078B94
	ldr r4, _08078B90 @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x1
	b _08078BA8
	.align 2, 0
_08078B90: .4byte gUnknown_0202F7C8
_08078B94:
	ldr r4, _08078BCC @ =gUnknown_0202F7C8
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x20]
	ldrb r0, [r4]
	movs r1, 0x3
_08078BA8:
	bl sub_8077EE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x22]
	ldr r4, _08078BD0 @ =gUnknown_03004B00
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
_08078BCC: .4byte gUnknown_0202F7C8
_08078BD0: .4byte gUnknown_03004B00
	thumb_func_end sub_80787B0

	thumb_func_start battle_side_get_owner
battle_side_get_owner: @ 8078BD4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08078BE4 @ =gUnknown_02024A72
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08078BE4: .4byte gUnknown_02024A72
	thumb_func_end battle_side_get_owner

	thumb_func_start battle_get_per_side_status
battle_get_per_side_status: @ 8078BE8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08078BF4 @ =gUnknown_02024A72
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08078BF4: .4byte gUnknown_02024A72
	thumb_func_end battle_get_per_side_status

	thumb_func_start battle_get_side_with_given_state
battle_get_side_with_given_state: @ 8078BF8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r1, 0
	ldr r0, _08078C2C @ =gUnknown_02024A68
	ldrb r2, [r0]
	cmp r1, r2
	bcs _08078C22
	ldr r4, _08078C30 @ =gUnknown_02024A72
	ldrb r0, [r4]
	cmp r0, r3
	beq _08078C22
_08078C10:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcs _08078C22
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _08078C10
_08078C22:
	adds r0, r1, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08078C2C: .4byte gUnknown_02024A68
_08078C30: .4byte gUnknown_02024A72
	thumb_func_end battle_get_side_with_given_state

	thumb_func_start sub_8078874
sub_8078874: @ 8078C34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078C60
	ldr r0, _08078C58 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	cmp r0, r4
	beq _08078CAE
	ldr r0, _08078C5C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	cmp r0, r4
	beq _08078CAE
	b _08078CBC
	.align 2, 0
_08078C58: .4byte gUnknown_0202F7C8
_08078C5C: .4byte gUnknown_0202F7C9
_08078C60:
	ldr r0, _08078C88 @ =gUnknown_02024A72
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08078CBC
	adds r0, r4, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08078C94
	ldr r1, _08078C8C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078C90 @ =gEnemyParty
	b _08078CA2
	.align 2, 0
_08078C88: .4byte gUnknown_02024A72
_08078C8C: .4byte gUnknown_02024A6A
_08078C90: .4byte gEnemyParty
_08078C94:
	ldr r1, _08078CB4 @ =gUnknown_02024A6A
	lsls r0, r5, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08078CB8 @ =gPlayerParty
_08078CA2:
	adds r0, r1
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08078CBC
_08078CAE:
	movs r0, 0x1
	b _08078CBE
	.align 2, 0
_08078CB4: .4byte gUnknown_02024A6A
_08078CB8: .4byte gPlayerParty
_08078CBC:
	movs r0, 0
_08078CBE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8078874

	thumb_func_start battle_type_is_double
battle_type_is_double: @ 8078CC4
	ldr r0, _08078CD0 @ =gUnknown_020239F8
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08078CD0: .4byte gUnknown_020239F8
	thumb_func_end battle_type_is_double

	thumb_func_start sub_8078914
sub_8078914: @ 8078CD4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078CF8
	ldr r0, _08078CF0 @ =0x06008000
	str r0, [r4]
	ldr r0, _08078CF4 @ =0x0600f000
	str r0, [r4, 0x4]
	movs r0, 0xE
	b _08078D02
	.align 2, 0
_08078CF0: .4byte 0x06008000
_08078CF4: .4byte 0x0600f000
_08078CF8:
	ldr r0, _08078D0C @ =0x06004000
	str r0, [r4]
	ldr r0, _08078D10 @ =0x0600e000
	str r0, [r4, 0x4]
	movs r0, 0x8
_08078D02:
	strb r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078D0C: .4byte 0x06004000
_08078D10: .4byte 0x0600e000
	thumb_func_end sub_8078914

	thumb_func_start sub_8078954
sub_8078954: @ 8078D14
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078D38
	ldr r0, _08078D30 @ =0x06008000
	str r0, [r4]
	ldr r0, _08078D34 @ =0x0600f000
	str r0, [r4, 0x4]
	movs r0, 0xE
	b _08078D6A
	.align 2, 0
_08078D30: .4byte 0x06008000
_08078D34: .4byte 0x0600f000
_08078D38:
	ldr r0, _08078D54 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_get_per_side_status_permutated
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08078D60
	ldr r0, _08078D58 @ =0x06004000
	str r0, [r4]
	ldr r0, _08078D5C @ =0x0600e000
	str r0, [r4, 0x4]
	movs r0, 0x8
	b _08078D6A
	.align 2, 0
_08078D54: .4byte gUnknown_0202F7C8
_08078D58: .4byte 0x06004000
_08078D5C: .4byte 0x0600e000
_08078D60:
	ldr r0, _08078D74 @ =0x06006000
	str r0, [r4]
	ldr r0, _08078D78 @ =0x0600f000
	str r0, [r4, 0x4]
	movs r0, 0x9
_08078D6A:
	strb r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078D74: .4byte 0x06006000
_08078D78: .4byte 0x0600f000
	thumb_func_end sub_8078954

	thumb_func_start sub_80789BC
sub_80789BC: @ 8078D7C
	push {lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08078D8C
	movs r0, 0x2
	b _08078D8E
_08078D8C:
	movs r0, 0x1
_08078D8E:
	pop {r1}
	bx r1
	thumb_func_end sub_80789BC

	thumb_func_start sub_80789D4
sub_80789D4: @ 8078D94
	push {lr}
	lsls r0, 24
	cmp r0, 0
	bne _08078DB4
	ldr r2, _08078DB0 @ =0x0400000e
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	b _08078DEA
	.align 2, 0
_08078DB0: .4byte 0x0400000e
_08078DB4:
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08078DD4
	ldr r2, _08078DD0 @ =0x0400000e
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x1]
	movs r1, 0x20
	orrs r0, r1
	b _08078DEA
	.align 2, 0
_08078DD0: .4byte 0x0400000e
_08078DD4:
	ldr r2, _08078DF0 @ =0x0400000e
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
_08078DEA:
	strb r0, [r2, 0x1]
	pop {r0}
	bx r0
	.align 2, 0
_08078DF0: .4byte 0x0400000e
	thumb_func_end sub_80789D4

	thumb_func_start sub_8078A34
sub_8078A34: @ 8078DF4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078A5C
	ldr r1, _08078E18 @ =sub_80783D0
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078E18: .4byte sub_80783D0
	thumb_func_end sub_8078A34

	thumb_func_start sub_8078A5C
sub_8078A5C: @ 8078E1C
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x32]
	ldrh r1, [r5, 0x30]
	subs r0, r1
	ldrh r4, [r5, 0x36]
	ldrh r1, [r5, 0x34]
	subs r4, r1
	lsls r4, 24
	lsrs r4, 16
	lsls r0, 24
	asrs r0, 16
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	bl __divsi3
	movs r6, 0
	strh r0, [r5, 0x30]
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	adds r0, r4, 0
	bl __divsi3
	strh r0, [r5, 0x32]
	strh r6, [r5, 0x36]
	strh r6, [r5, 0x34]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8078A5C

	thumb_func_start obj_translate_based_on_private_1_2_3_4
obj_translate_based_on_private_1_2_3_4: @ 8078E5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _08078E88
	negs r1, r1
_08078E88:
	lsls r0, r1, 24
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08078E94
	negs r0, r0
_08078E94:
	lsls r0, 24
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _08078EC0
	movs r0, 0x1
	orrs r6, r0
	b _08078EC4
_08078EC0:
	ldr r0, _08078ED0 @ =0x0000fffe
	ands r6, r0
_08078EC4:
	mov r3, r9
	cmp r3, 0
	beq _08078ED4
	movs r0, 0x1
	orrs r5, r0
	b _08078ED8
	.align 2, 0
_08078ED0: .4byte 0x0000fffe
_08078ED4:
	ldr r0, _08078EF0 @ =0x0000fffe
	ands r5, r0
_08078ED8:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078EF0: .4byte 0x0000fffe
	thumb_func_end obj_translate_based_on_private_1_2_3_4

	thumb_func_start sub_8078B34
sub_8078B34: @ 8078EF4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	ldr r1, _08078F18 @ =sub_8078BB8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078F18: .4byte sub_8078BB8
	thumb_func_end sub_8078B34

	thumb_func_start sub_8078B5C
sub_8078B5C: @ 8078F1C
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08078F2C
	movs r0, 0x1
	b _08078F70
_08078F2C:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _08078F4E
	lsrs r0, r3, 24
	negs r0, r0
	b _08078F50
_08078F4E:
	lsrs r0, r3, 24
_08078F50:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _08078F60
	lsrs r0, r5, 8
	negs r0, r0
	b _08078F62
_08078F60:
	lsrs r0, r5, 8
_08078F62:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_08078F70:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8078B5C

	thumb_func_start sub_8078BB8
sub_8078BB8: @ 8078F78
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078B5C
	lsls r0, 24
	cmp r0, 0
	beq _08078F8C
	adds r0, r4, 0
	bl sub_8078104
_08078F8C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078BB8

	thumb_func_start sub_8078BD4
sub_8078BD4: @ 8078F94
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _08078FA8
	negs r0, r0
_08078FA8:
	lsls r0, 8
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl obj_translate_based_on_private_1_2_3_4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078BD4

	thumb_func_start sub_8078C00
sub_8078C00: @ 8078FC0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078BD4
	ldr r1, _08078FE4 @ =sub_8078BB8
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078FE4: .4byte sub_8078BB8
	thumb_func_end sub_8078C00

	thumb_func_start sub_8078C28
sub_8078C28: @ 8078FE8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	movs r0, 0x32
	ldrsh r1, [r7, r0]
	movs r2, 0x30
	ldrsh r0, [r7, r2]
	subs r1, r0
	movs r3, 0x36
	ldrsh r2, [r7, r3]
	movs r3, 0x34
	ldrsh r0, [r7, r3]
	subs r2, r0
	lsrs r0, r1, 31
	mov r8, r0
	lsrs r3, r2, 31
	mov r9, r3
	cmp r1, 0
	bge _08079014
	negs r1, r1
_08079014:
	lsls r0, r1, 20
	lsrs r6, r0, 16
	adds r0, r2, 0
	cmp r0, 0
	bge _08079020
	negs r0, r0
_08079020:
	lsls r0, 20
	lsrs r5, r0, 16
	movs r0, 0x2E
	ldrsh r4, [r7, r0]
	adds r0, r6, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl __divsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r2, r8
	cmp r2, 0
	beq _0807904C
	movs r0, 0x1
	orrs r6, r0
	b _08079050
_0807904C:
	ldr r0, _0807905C @ =0x0000fffe
	ands r6, r0
_08079050:
	mov r3, r9
	cmp r3, 0
	beq _08079060
	movs r0, 0x1
	orrs r5, r0
	b _08079064
	.align 2, 0
_0807905C: .4byte 0x0000fffe
_08079060:
	ldr r0, _0807907C @ =0x0000fffe
	ands r5, r0
_08079064:
	movs r0, 0
	strh r6, [r7, 0x30]
	strh r5, [r7, 0x32]
	strh r0, [r7, 0x36]
	strh r0, [r7, 0x34]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807907C: .4byte 0x0000fffe
	thumb_func_end sub_8078C28

	thumb_func_start sub_8078CC0
sub_8078CC0: @ 8079080
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078C28
	ldr r1, _080790A4 @ =sub_8078D44
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080790A4: .4byte sub_8078D44
	thumb_func_end sub_8078CC0

	thumb_func_start sub_8078CE8
sub_8078CE8: @ 80790A8
	push {r4-r6,lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _080790B8
	movs r0, 0x1
	b _080790FC
_080790B8:
	ldrh r1, [r2, 0x30]
	ldrh r4, [r2, 0x32]
	ldrh r6, [r2, 0x34]
	ldrh r5, [r2, 0x36]
	adds r0, r6, r1
	lsls r3, r0, 16
	lsrs r6, r3, 16
	adds r0, r5, r4
	lsls r0, 16
	lsrs r5, r0, 16
	movs r0, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080790DA
	lsrs r0, r3, 20
	negs r0, r0
	b _080790DC
_080790DA:
	lsrs r0, r3, 20
_080790DC:
	strh r0, [r2, 0x24]
	movs r0, 0x1
	ands r4, r0
	cmp r4, 0
	beq _080790EC
	lsrs r0, r5, 4
	negs r0, r0
	b _080790EE
_080790EC:
	lsrs r0, r5, 4
_080790EE:
	strh r0, [r2, 0x26]
	strh r6, [r2, 0x34]
	strh r5, [r2, 0x36]
	ldrh r0, [r2, 0x2E]
	subs r0, 0x1
	strh r0, [r2, 0x2E]
	movs r0, 0
_080790FC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8078CE8

	thumb_func_start sub_8078D44
sub_8078D44: @ 8079104
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078CE8
	lsls r0, 24
	cmp r0, 0
	beq _08079118
	adds r0, r4, 0
	bl sub_8078104
_08079118:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078D44

	thumb_func_start sub_8078D60
sub_8078D60: @ 8079120
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x32
	ldrsh r1, [r4, r0]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	subs r0, r1, r0
	cmp r0, 0
	bge _08079134
	negs r0, r0
_08079134:
	lsls r0, 4
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	bl __divsi3
	strh r0, [r4, 0x2E]
	adds r0, r4, 0
	bl sub_8078C28
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8078D60

	thumb_func_start sub_8078D8C
sub_8078D8C: @ 807914C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x20]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x34]
	adds r0, r4, 0
	bl sub_8078D60
	ldr r1, _08079170 @ =sub_8078D44
	str r1, [r4, 0x1C]
	adds r0, r4, 0
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079170: .4byte sub_8078D44
	thumb_func_end sub_8078D8C

	thumb_func_start obj_id_set_rotscale
obj_id_set_rotscale: @ 8079174
	push {r4,r5,lr}
	sub sp, 0x10
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r5, _080791EC @ =0xffff0000
	lsls r2, 16
	lsrs r1, 16
	orrs r1, r2
	str r1, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r5
	orrs r0, r3
	str r0, [sp, 0x4]
	bl sub_8078E38
	lsls r0, 24
	cmp r0, 0
	beq _080791B0
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r5
	orrs r1, r0
	str r1, [sp]
_080791B0:
	ldr r1, _080791F0 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r4, [r0, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _080791F4 @ =gOamMatrices
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080791EC: .4byte 0xffff0000
_080791F0: .4byte gSprites
_080791F4: .4byte gOamMatrices
	thumb_func_end obj_id_set_rotscale

	thumb_func_start sub_8078E38
sub_8078E38: @ 80791F8
	push {r4,lr}
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079228
	ldr r4, _08079224 @ =gSprites
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x32
	ldrsh r0, [r1, r2]
	cmp r0, 0xC9
	beq _08079228
	movs r0, 0x1
	b _0807922A
	.align 2, 0
_08079224: .4byte gSprites
_08079228:
	movs r0, 0
_0807922A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8078E38

	thumb_func_start sub_8078E70
sub_8078E70: @ 8079230
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r1, _080792F8 @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08079266
	adds r0, r7, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079274
_08079266:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_08079274:
	ldr r1, _080792F8 @ =gSprites
	lsls r4, r6, 4
	adds r0, r4, r6
	lsls r0, 2
	adds r5, r0, r1
	movs r0, 0x3
	mov r1, r8
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x1]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080792CE
	ldrb r0, [r5, 0x1]
	lsls r0, 30
	cmp r0, 0
	bne _080792CE
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	ldr r1, _080792FC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0, 0x6]
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r5, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
_080792CE:
	ldr r1, _080792F8 @ =gSprites
	adds r0, r4, r6
	lsls r0, 2
	adds r0, r1
	ldrb r3, [r0, 0x1]
	movs r1, 0x3
	orrs r3, r1
	strb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080792F8: .4byte gSprites
_080792FC: .4byte 0x02017810
	thumb_func_end sub_8078E70

	thumb_func_start sub_8078F40
sub_8078F40: @ 8079300
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r2, 0x80
	lsls r2, 1
	adds r0, r4, 0
	adds r1, r2, 0
	movs r3, 0
	bl obj_id_set_rotscale
	ldr r1, _08079358 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r2
	movs r2, 0x1
	orrs r1, r2
	movs r2, 0xD
	negs r2, r2
	ands r1, r2
	strb r1, [r0, 0x1]
	adds r3, r0, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r3]
	ldrb r3, [r0, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r0, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	bl CalcCenterToCornerVec
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079358: .4byte gSprites
	thumb_func_end sub_8078F40

	thumb_func_start sub_8078F9C
sub_8078F9C: @ 807935C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08079394 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _08079398 @ =gOamMatrices
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x4]
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	bge _08079388
	negs r0, r0
	lsls r0, 16
	lsrs r1, r0, 16
_08079388:
	lsls r0, r1, 16
	asrs r0, 19
	strh r0, [r2, 0x26]
	pop {r0}
	bx r0
	.align 2, 0
_08079394: .4byte gSprites
_08079398: .4byte gOamMatrices
	thumb_func_end sub_8078F9C

	thumb_func_start sub_8078FDC
sub_8078FDC: @ 807939C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r0, [sp, 0x28]
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 16
	lsrs r7, r3, 16
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldrb r0, [r4, 0x1]
	lsls r0, 30
	lsrs r0, 30
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08079442
	adds r0, r4, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	cmp r6, 0
	beq _080793EA
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
_080793EA:
	ldr r6, _08079450 @ =0xffff0000
	lsls r0, r7, 16
	orrs r5, r0
	str r5, [sp]
	ldr r0, [sp, 0x4]
	ands r0, r6
	mov r1, r8
	orrs r0, r1
	str r0, [sp, 0x4]
	bl sub_8078E38
	lsls r0, 24
	cmp r0, 0
	beq _08079418
	mov r0, sp
	ldrh r0, [r0]
	negs r0, r0
	lsls r0, 16
	lsrs r0, 16
	ldr r1, [sp]
	ands r1, r6
	orrs r1, r0
	str r1, [sp]
_08079418:
	ldrb r4, [r4, 0x3]
	lsls r4, 26
	lsrs r4, 27
	add r5, sp, 0x8
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ObjAffineSet
	ldr r0, _08079454 @ =gOamMatrices
	lsls r4, 3
	adds r4, r0
	ldrh r0, [r5]
	strh r0, [r4]
	ldrh r0, [r5, 0x2]
	strh r0, [r4, 0x2]
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x4]
	ldrh r0, [r5, 0x6]
	strh r0, [r4, 0x6]
_08079442:
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079450: .4byte 0xffff0000
_08079454: .4byte gOamMatrices
	thumb_func_end sub_8078FDC

	thumb_func_start sub_8079098
sub_8079098: @ 8079458
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r3, 0x80
	lsls r3, 1
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x1
	adds r2, r3, 0
	bl sub_8078FDC
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r3, [r4, 0x1]
	lsrs r1, r3, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	lsls r3, 30
	lsrs r3, 30
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079098

	thumb_func_start sub_80790D8
sub_80790D8: @ 8079498
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl ArcTan2
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80790D8

	thumb_func_start sub_80790F0
sub_80790F0: @ 80794B0
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl sub_80790D8
	lsls r0, 16
	negs r0, r0
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80790F0

	thumb_func_start sub_8079108
sub_8079108: @ 80794C8
	push {r4-r7,lr}
	lsls r1, 24
	lsls r0, 20
	lsrs r0, 16
	cmp r1, 0
	bne _08079544
	ldr r2, _08079538 @ =gPlttBufferUnfaded
	ldr r1, _0807953C @ =gPlttBufferFaded
	lsls r0, 1
	adds r4, r0, r1
	adds r5, r0, r2
	movs r6, 0xF
_080794E0:
	ldr r0, [r5]
	lsls r2, r0, 27
	lsrs r2, 27
	lsls r1, r0, 22
	lsrs r1, 27
	adds r2, r1
	lsls r0, 17
	lsrs r0, 27
	adds r0, r2
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1F
	ands r0, r1
	ldrb r1, [r4]
	movs r3, 0x20
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	lsls r3, r0, 5
	ldrh r1, [r4]
	ldr r7, _08079540 @ =0xfffffc1f
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r3
	strh r1, [r4]
	lsls r0, 2
	ldrb r1, [r4, 0x1]
	movs r3, 0x7D
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r4, 0x2
	adds r5, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080794E0
	b _08079554
	.align 2, 0
_08079538: .4byte gPlttBufferUnfaded
_0807953C: .4byte gPlttBufferFaded
_08079540: .4byte 0xfffffc1f
_08079544:
	lsls r1, r0, 1
	ldr r0, _0807955C @ =gPlttBufferUnfaded
	adds r0, r1, r0
	ldr r2, _08079560 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _08079564 @ =0x04000008
	bl CpuSet
_08079554:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807955C: .4byte gPlttBufferUnfaded
_08079560: .4byte gPlttBufferFaded
_08079564: .4byte 0x04000008
	thumb_func_end sub_8079108

	thumb_func_start sub_80791A8
sub_80791A8: @ 8079568
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r4, [sp, 0x28]
	ldr r5, [sp, 0x2C]
	ldr r6, [sp, 0x30]
	lsls r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp]
	lsls r6, 24
	lsrs r6, 24
	str r6, [sp, 0x4]
	movs r4, 0
	cmp r0, 0
	beq _080795BE
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _080795B2
	movs r4, 0xE
	b _080795BE
_080795B2:
	bl sub_80789BC
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x1
	lsls r4, r0
_080795BE:
	cmp r7, 0
	beq _080795D0
	ldr r0, _08079648 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_080795D0:
	mov r0, r8
	cmp r0, 0
	beq _080795E4
	ldr r0, _0807964C @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_080795E4:
	mov r0, r9
	cmp r0, 0
	beq _0807960A
	ldr r6, _08079648 @ =gUnknown_0202F7C8
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807960A
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807960A:
	mov r0, r10
	cmp r0, 0
	beq _08079630
	ldr r6, _0807964C @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079630
	ldrb r0, [r6]
	eors r0, r5
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079630:
	ldr r0, [sp]
	cmp r0, 0
	beq _08079656
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _08079650
	movs r0, 0x80
	lsls r0, 1
	b _08079654
	.align 2, 0
_08079648: .4byte gUnknown_0202F7C8
_0807964C: .4byte gUnknown_0202F7C9
_08079650:
	movs r0, 0x80
	lsls r0, 7
_08079654:
	orrs r4, r0
_08079656:
	ldr r0, [sp, 0x4]
	cmp r0, 0
	beq _0807966C
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807966C
	movs r0, 0x80
	lsls r0, 2
	orrs r4, r0
_0807966C:
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80791A8

	thumb_func_start sub_80792C0
sub_80792C0: @ 8079680
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r4, 0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _080796AE
	cmp r5, 0
	beq _0807975C
	movs r4, 0x80
	lsls r4, 11
	b _0807975C
_080796AE:
	cmp r5, 0
	beq _080796D6
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _080796D6
	movs r0, 0
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x10
	movs r4, 0x1
	lsls r4, r0
_080796D6:
	cmp r6, 0
	beq _08079702
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _08079702
	movs r0, 0x2
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_08079702:
	cmp r7, 0
	beq _0807972E
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807972E
	movs r0, 0x1
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807972E:
	mov r0, r8
	cmp r0, 0
	beq _0807975C
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807975C
	movs r0, 0x3
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	adds r1, 0x10
	movs r0, 0x1
	lsls r0, r1
	orrs r4, r0
_0807975C:
	adds r0, r4, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80792C0

	thumb_func_start sub_80793A8
sub_80793A8: @ 8079768
	lsls r0, 24
	lsrs r0, 24
	bx lr
	thumb_func_end sub_80793A8

	thumb_func_start unref_sub_80793B0
unref_sub_80793B0: @ 8079770
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_side_with_given_state
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80793B0

	thumb_func_start sub_80793C4
sub_80793C4: @ 8079784
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080797C2
	ldr r2, _080797B0 @ =gUnknown_03004B00
	movs r3, 0x6
	ldrsh r0, [r2, r3]
	movs r1, 0
	cmp r0, 0
	bne _0807979E
	movs r1, 0x1
_0807979E:
	movs r3, 0x4
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080797B4
	adds r0, r4, 0
	bl sub_80787B0
	b _080797BA
	.align 2, 0
_080797B0: .4byte gUnknown_03004B00
_080797B4:
	adds r0, r4, 0
	bl sub_8078764
_080797BA:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _080797D6
_080797C2:
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0
	beq _080797D6
	adds r0, r4, 0
	bl move_anim_8074EE0
_080797D6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80793C4

	thumb_func_start sub_807941C
sub_807941C: @ 80797DC
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r6, _08079854 @ =gUnknown_03004B00
	movs r1, 0xA
	ldrsh r0, [r6, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	movs r1, 0
	cmp r0, 0
	bne _080797F4
	movs r1, 0x1
_080797F4:
	ldrb r0, [r6, 0xA]
	movs r7, 0x1
	cmp r0, 0
	bne _080797FE
	movs r7, 0x3
_080797FE:
	adds r0, r5, 0
	bl sub_80787B0
	ldr r0, _08079858 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08079818
	ldrh r0, [r6, 0x4]
	negs r0, r0
	strh r0, [r6, 0x4]
_08079818:
	ldrh r0, [r6, 0x8]
	strh r0, [r5, 0x2E]
	ldr r4, _0807985C @ =gUnknown_0202F7C9
	ldrb r0, [r4]
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r6, 0x4]
	adds r0, r1
	strh r0, [r5, 0x32]
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r6, [r6, 0x6]
	adds r0, r6
	strh r0, [r5, 0x36]
	ldr r0, _08079860 @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _08079864 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079854: .4byte gUnknown_03004B00
_08079858: .4byte gUnknown_0202F7C8
_0807985C: .4byte gUnknown_0202F7C9
_08079860: .4byte sub_8078B34
_08079864: .4byte move_anim_8072740
	thumb_func_end sub_807941C

	thumb_func_start sub_80794A8
sub_80794A8: @ 8079868
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_80787B0
	ldr r0, _080798C8 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _08079888
	ldr r1, _080798CC @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_08079888:
	ldr r4, _080798CC @ =gUnknown_03004B00
	ldrh r0, [r4, 0x8]
	strh r0, [r6, 0x2E]
	ldr r5, _080798D0 @ =gUnknown_0202F7C9
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
	ldr r0, _080798D4 @ =sub_8079518
	str r0, [r6, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080798C8: .4byte gUnknown_0202F7C8
_080798CC: .4byte gUnknown_03004B00
_080798D0: .4byte gUnknown_0202F7C9
_080798D4: .4byte sub_8079518
	thumb_func_end sub_80794A8

	thumb_func_start sub_8079518
sub_8079518: @ 80798D8
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078718
	lsls r0, 24
	cmp r0, 0
	beq _080798EC
	adds r0, r4, 0
	bl move_anim_8072740
_080798EC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8079518

	thumb_func_start sub_8079534
sub_8079534: @ 80798F4
	push {r4-r7,lr}
	adds r5, r0, 0
	ldr r0, _08079908 @ =gUnknown_03004B00
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	cmp r1, 0
	bne _0807990C
	movs r4, 0x1
	movs r7, 0x3
	b _08079910
	.align 2, 0
_08079908: .4byte gUnknown_03004B00
_0807990C:
	movs r4, 0
	movs r7, 0x1
_08079910:
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08079928
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80787B0
	ldr r0, _08079924 @ =gUnknown_0202F7C8
	b _08079932
	.align 2, 0
_08079924: .4byte gUnknown_0202F7C8
_08079928:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8078764
	ldr r0, _08079990 @ =gUnknown_0202F7C9
_08079932:
	ldrb r6, [r0]
	ldr r0, _08079994 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807994A
	ldr r1, _08079998 @ =gUnknown_03004B00
	ldrh r0, [r1, 0x4]
	negs r0, r0
	strh r0, [r1, 0x4]
_0807994A:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8078764
	ldr r4, _08079998 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x8]
	strh r0, [r5, 0x2E]
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r2, [r4, 0x4]
	adds r0, r2
	strh r0, [r5, 0x32]
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrh r4, [r4, 0x6]
	adds r0, r4
	strh r0, [r5, 0x36]
	ldr r0, _0807999C @ =sub_8078B34
	str r0, [r5, 0x1C]
	ldr r1, _080799A0 @ =move_anim_8072740
	adds r0, r5, 0
	bl oamt_set_x3A_32
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079990: .4byte gUnknown_0202F7C9
_08079994: .4byte gUnknown_0202F7C8
_08079998: .4byte gUnknown_03004B00
_0807999C: .4byte sub_8078B34
_080799A0: .4byte move_anim_8072740
	thumb_func_end sub_8079534

	thumb_func_start duplicate_obj_of_side_rel2move_in_transparent_mode
duplicate_obj_of_side_rel2move_in_transparent_mode: @ 80799A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _08079A0E
	movs r6, 0
	ldr r2, _08079A00 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r1, r0, 2
_080799C0:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r4, r0, r2
	adds r5, r4, 0
	adds r5, 0x3E
	ldrb r0, [r5]
	lsls r0, 31
	cmp r0, 0
	bne _08079A04
	adds r0, r4, 0
	adds r1, r2
	movs r2, 0x44
	bl memcpy
	ldrb r1, [r4, 0x1]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r1, r0
	movs r0, 0x4
	orrs r1, r0
	strb r1, [r4, 0x1]
	ldrb r0, [r5]
	adds r2, 0x8
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r5]
	lsls r0, r6, 16
	asrs r0, 16
	b _08079A12
	.align 2, 0
_08079A00: .4byte gSprites
_08079A04:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3F
	bls _080799C0
_08079A0E:
	movs r0, 0x1
	negs r0, r0
_08079A12:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end duplicate_obj_of_side_rel2move_in_transparent_mode

	thumb_func_start obj_delete_but_dont_free_vram
obj_delete_but_dont_free_vram: @ 8079A18
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r3]
	bl DestroySprite
	pop {r0}
	bx r0
	thumb_func_end obj_delete_but_dont_free_vram

	thumb_func_start sub_8079670
sub_8079670: @ 8079A30
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r5, 0
	movs r3, 0
	ldr r4, _08079AA4 @ =gUnknown_03004B00
	movs r0, 0x4
	ldrsh r1, [r4, r0]
	movs r6, 0
	ldrsh r0, [r4, r6]
	cmp r1, r0
	ble _08079A4A
	movs r3, 0x1
_08079A4A:
	cmp r1, r0
	bge _08079A50
	ldr r3, _08079AA8 @ =0x0000ffff
_08079A50:
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r6, 0x2
	ldrsh r0, [r4, r6]
	cmp r1, r0
	ble _08079A5E
	movs r5, 0x1
_08079A5E:
	cmp r1, r0
	bge _08079A64
	ldr r5, _08079AA8 @ =0x0000ffff
_08079A64:
	ldr r0, _08079AAC @ =gTasks
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	movs r2, 0
	strh r2, [r1, 0x8]
	ldrh r0, [r4, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldrh r0, [r4]
	strh r0, [r1, 0xE]
	ldrh r0, [r4, 0x2]
	strh r0, [r1, 0x10]
	strh r3, [r1, 0x12]
	strh r5, [r1, 0x14]
	ldrh r0, [r4, 0x4]
	strh r0, [r1, 0x16]
	ldrh r0, [r4, 0x6]
	strh r0, [r1, 0x18]
	ldr r3, _08079AB0 @ =0x04000052
	ldrh r0, [r4, 0x2]
	lsls r0, 8
	ldrh r2, [r4]
	orrs r0, r2
	strh r0, [r3]
	ldr r0, _08079AB4 @ =sub_80796F8
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079AA4: .4byte gUnknown_03004B00
_08079AA8: .4byte 0x0000ffff
_08079AAC: .4byte gTasks
_08079AB0: .4byte 0x04000052
_08079AB4: .4byte sub_80796F8
	thumb_func_end sub_8079670

	thumb_func_start sub_80796F8
sub_80796F8: @ 8079AB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _08079B04 @ =gTasks
	adds r3, r0, r1
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0xA
	ldrsh r1, [r3, r2]
	cmp r0, r1
	ble _08079B46
	movs r0, 0
	strh r0, [r3, 0x8]
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08079B08
	ldrh r2, [r3, 0xE]
	movs r5, 0xE
	ldrsh r1, [r3, r5]
	movs r5, 0x16
	ldrsh r0, [r3, r5]
	cmp r1, r0
	beq _08079B1C
	ldrh r0, [r3, 0x12]
	adds r0, r2, r0
	strh r0, [r3, 0xE]
	b _08079B1C
	.align 2, 0
_08079B04: .4byte gTasks
_08079B08:
	ldrh r2, [r3, 0x10]
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r5, 0x18
	ldrsh r0, [r3, r5]
	cmp r1, r0
	beq _08079B1C
	ldrh r0, [r3, 0x14]
	adds r0, r2, r0
	strh r0, [r3, 0x10]
_08079B1C:
	ldr r2, _08079B4C @ =0x04000052
	ldrh r0, [r3, 0x10]
	lsls r0, 8
	ldrh r1, [r3, 0xE]
	orrs r0, r1
	strh r0, [r2]
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r2, 0x16
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _08079B46
	movs r5, 0x10
	ldrsh r1, [r3, r5]
	movs r2, 0x18
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bne _08079B46
	adds r0, r4, 0
	bl move_anim_task_del
_08079B46:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079B4C: .4byte 0x04000052
	thumb_func_end sub_80796F8

	thumb_func_start sub_8079790
sub_8079790: @ 8079B50
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08079B70 @ =gUnknown_03004B00
	ldrb r0, [r0]
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xFF
	bne _08079B74
	adds r0, r4, 0
	bl move_anim_task_del
	b _08079B9A
	.align 2, 0
_08079B70: .4byte gUnknown_03004B00
_08079B74:
	ldr r1, _08079BA0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r2, _08079BA4 @ =gSprites
	lsls r1, r3, 4
	adds r1, r3
	lsls r1, 2
	adds r1, r2
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 4
	ldr r3, _08079BA8 @ =0x00000101
	adds r2, r3, 0
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80797EC
_08079B9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079BA0: .4byte gTasks
_08079BA4: .4byte gSprites
_08079BA8: .4byte 0x00000101
	thumb_func_end sub_8079790

	thumb_func_start sub_80797EC
sub_80797EC: @ 8079BAC
	ldr r3, _08079BCC @ =gUnknown_03004B00
	ldrh r1, [r3, 0x2]
	movs r2, 0
	strh r1, [r0, 0xA]
	strh r2, [r0, 0xC]
	ldrh r1, [r3, 0x4]
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	ldrh r1, [r3, 0x6]
	strh r1, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldrh r1, [r3, 0x8]
	strh r1, [r0, 0x16]
	ldr r1, _08079BD0 @ =sub_8079814
	str r1, [r0]
	bx lr
	.align 2, 0
_08079BCC: .4byte gUnknown_03004B00
_08079BD0: .4byte sub_8079814
	thumb_func_end sub_80797EC

	thumb_func_start sub_8079814
sub_8079814: @ 8079BD4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08079C2C @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08079C64
	movs r0, 0
	strh r0, [r4, 0x10]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08079C30
	ldrh r2, [r4, 0xC]
	adds r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r2, 0xC
	ldrsh r1, [r4, r2]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08079C64
	movs r0, 0x1
	strh r0, [r4, 0x14]
	b _08079C64
	.align 2, 0
_08079C2C: .4byte gTasks
_08079C30:
	ldrh r2, [r4, 0xC]
	subs r2, 0x1
	strh r2, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	lsls r2, 24
	lsrs r2, 24
	ldrh r3, [r4, 0xA]
	movs r1, 0xF
	bl BlendPalette
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _08079C64
	ldrh r0, [r4, 0x16]
	subs r0, 0x1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	beq _08079C5E
	strh r1, [r4, 0x10]
	strh r1, [r4, 0x14]
	b _08079C64
_08079C5E:
	adds r0, r5, 0
	bl move_anim_task_del
_08079C64:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8079814

	thumb_func_start sub_80798AC
sub_80798AC: @ 8079C6C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08079C8C @ =gUnknown_03004B00
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	bne _08079C90
	adds r0, r4, 0
	bl move_anim_task_del
	b _08079CA6
	.align 2, 0
_08079C8C: .4byte gUnknown_03004B00
_08079C90:
	ldr r1, _08079CAC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	lsls r1, r2, 4
	ldr r2, _08079CB0 @ =0x00000101
	adds r1, r2
	strh r1, [r0, 0x8]
	bl sub_80797EC
_08079CA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08079CAC: .4byte gTasks
_08079CB0: .4byte 0x00000101
	thumb_func_end sub_80798AC

	thumb_func_start sub_80798F4
sub_80798F4: @ 8079CB4
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0
	strh r1, [r3, 0x16]
	strh r1, [r3, 0x18]
	strh r1, [r3, 0x1A]
	strh r4, [r3, 0x26]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r3, 0x1C]
	strh r0, [r3, 0x1E]
	strh r1, [r3, 0x20]
	adds r0, r3, 0
	adds r0, 0x22
	adds r3, 0x24
	adds r1, r3, 0
	bl sub_8079BF4
	adds r0, r4, 0
	movs r1, 0
	bl sub_8078E70
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80798F4

	thumb_func_start sub_807992C
sub_807992C: @ 8079CEC
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _08079D8C @ =gUnknown_0202F7D4
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	bl sub_8079BFC
	movs r3, 0x16
	ldrsh r1, [r4, r3]
	lsls r1, 3
	adds r1, r0, r1
	str r1, [r5]
	movs r6, 0
	ldrsh r2, [r1, r6]
	ldr r0, _08079D90 @ =0x00007ffe
	cmp r2, r0
	beq _08079D94
	cmp r2, r0
	bgt _08079DF4
	subs r0, 0x1
	cmp r2, r0
	beq _08079D9A
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	bne _08079D3A
	ldrh r0, [r1]
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x1E]
	ldrb r0, [r1, 0x4]
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	adds r0, r1, 0
	adds r0, 0x8
	str r0, [r5]
_08079D3A:
	ldr r1, [r5]
	ldrh r0, [r1]
	ldrh r2, [r4, 0x1C]
	adds r0, r2
	strh r0, [r4, 0x1C]
	ldrh r0, [r1, 0x2]
	ldrh r3, [r4, 0x1E]
	adds r0, r3
	strh r0, [r4, 0x1E]
	ldrh r0, [r4, 0x20]
	ldrb r1, [r1, 0x4]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x1C
	ldrsh r1, [r4, r6]
	movs r3, 0x1E
	ldrsh r2, [r4, r3]
	ldrh r3, [r4, 0x20]
	bl obj_id_set_rotscale
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	asrs r0, 16
	ldr r1, [r5]
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	blt _08079E1A
	movs r0, 0
	strh r0, [r4, 0x18]
	b _08079DEC
	.align 2, 0
_08079D8C: .4byte gUnknown_0202F7D4
_08079D90: .4byte 0x00007ffe
_08079D94:
	ldrh r0, [r1, 0x2]
	strh r0, [r4, 0x16]
	b _08079E1A
_08079D9A:
	ldrh r2, [r1, 0x2]
	movs r6, 0x2
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _08079DEC
	ldrh r1, [r4, 0x1A]
	movs r3, 0x1A
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08079DBA
	subs r0, r1, 0x1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bne _08079DBC
	b _08079DEC
_08079DBA:
	strh r2, [r4, 0x1A]
_08079DBC:
	movs r6, 0x16
	ldrsh r0, [r4, r6]
	cmp r0, 0
	beq _08079E1A
	ldr r3, _08079DE4 @ =gUnknown_0202F7D4
	ldr r5, _08079DE8 @ =0x00007ffd
_08079DC8:
	ldrh r2, [r4, 0x16]
	subs r1, r2, 0x1
	strh r1, [r4, 0x16]
	ldr r0, [r3]
	subs r0, 0x8
	str r0, [r3]
	movs r6, 0
	ldrsh r0, [r0, r6]
	cmp r0, r5
	beq _08079E18
	lsls r0, r1, 16
	cmp r0, 0
	bne _08079DC8
	b _08079E1A
	.align 2, 0
_08079DE4: .4byte gUnknown_0202F7D4
_08079DE8: .4byte 0x00007ffd
_08079DEC:
	ldrh r0, [r4, 0x16]
	adds r0, 0x1
	strh r0, [r4, 0x16]
	b _08079E1A
_08079DF4:
	ldr r2, _08079E14 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x26]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8078F40
	movs r0, 0
	b _08079E1C
	.align 2, 0
_08079E14: .4byte gSprites
_08079E18:
	strh r2, [r4, 0x16]
_08079E1A:
	movs r0, 0x1
_08079E1C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_807992C

	thumb_func_start sub_8079A64
sub_8079A64: @ 8079E24
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8079B10
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _08079E70 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _08079E74 @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _08079E60
	movs r0, 0x80
_08079E60:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079E70: .4byte gSprites
_08079E74: .4byte gOamMatrices
	thumb_func_end sub_8079A64

	thumb_func_start sub_8079AB8
sub_8079AB8: @ 8079E78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079B10
	lsls r0, 16
	lsrs r0, 15
	movs r1, 0x40
	subs r5, r1, r0
	ldr r1, _08079EC8 @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x3]
	lsls r1, 26
	lsrs r1, 27
	lsls r0, r5, 8
	ldr r2, _08079ECC @ =gOamMatrices
	lsls r1, 3
	adds r1, r2
	movs r2, 0x6
	ldrsh r1, [r1, r2]
	bl __divsi3
	cmp r0, 0x80
	ble _08079EB8
	movs r0, 0x80
_08079EB8:
	subs r0, r5, r0
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r4, 0x26]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079EC8: .4byte gSprites
_08079ECC: .4byte gOamMatrices
	thumb_func_end sub_8079AB8

	thumb_func_start sub_8079B10
sub_8079B10: @ 8079ED0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08079F04 @ =gSprites
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	movs r4, 0
	ldr r1, _08079F08 @ =gUnknown_02024BE0
	ldr r6, _08079F0C @ =gMonBackPicCoords
	lsrs r5, r0, 22
_08079EEC:
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, r2
	bne _08079FA0
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _08079F14
	ldr r0, _08079F10 @ =0x02019348
	ldrh r1, [r0]
	b _08079F56
	.align 2, 0
_08079F04: .4byte gSprites
_08079F08: .4byte gUnknown_02024BE0
_08079F0C: .4byte gMonBackPicCoords
_08079F10: .4byte 0x02019348
_08079F14:
	lsls r0, r4, 24
	lsrs r0, 24
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08079F5E
	ldr r0, _08079F48 @ =0x02017800
	adds r1, r5, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08079F54
	ldr r1, _08079F4C @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08079F50 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08079F56
	.align 2, 0
_08079F48: .4byte 0x02017800
_08079F4C: .4byte gUnknown_02024A6A
_08079F50: .4byte gPlayerParty
_08079F54:
	ldrh r1, [r1, 0x2]
_08079F56:
	lsls r0, r1, 2
	adds r0, r6
	ldrb r0, [r0, 0x1]
	b _08079FAC
_08079F5E:
	ldr r0, _08079F84 @ =0x02017800
	adds r1, r5, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _08079F90
	ldr r1, _08079F88 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08079F8C @ =gEnemyParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	b _08079F92
	.align 2, 0
_08079F84: .4byte 0x02017800
_08079F88: .4byte gUnknown_02024A6A
_08079F8C: .4byte gEnemyParty
_08079F90:
	ldrh r1, [r1, 0x2]
_08079F92:
	ldr r0, _08079F9C @ =gMonFrontPicCoords
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x1]
	b _08079FAC
	.align 2, 0
_08079F9C: .4byte gMonFrontPicCoords
_08079FA0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08079EEC
	movs r0, 0x40
_08079FAC:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8079B10

	thumb_func_start sub_8079BF4
sub_8079BF4: @ 8079FB4
	strh r2, [r0]
	asrs r2, 16
	strh r2, [r1]
	bx lr
	thumb_func_end sub_8079BF4

	thumb_func_start sub_8079BFC
sub_8079BFC: @ 8079FBC
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	orrs r0, r1
	bx lr
	thumb_func_end sub_8079BFC

	thumb_func_start sub_8079C08
sub_8079C08: @ 8079FC8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r5, r3, 0
	ldr r0, [sp, 0x14]
	ldr r4, [sp, 0x18]
	ldr r6, [sp, 0x1C]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r3, r8
	strh r6, [r3, 0x18]
	strh r1, [r3, 0x26]
	strh r2, [r3, 0x1A]
	strh r5, [r3, 0x1C]
	strh r0, [r3, 0x22]
	strh r4, [r3, 0x24]
	lsls r0, 16
	asrs r0, 16
	lsls r2, 16
	asrs r2, 16
	subs r0, r2
	adds r1, r6, 0
	bl __divsi3
	mov r1, r8
	strh r0, [r1, 0x1E]
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	subs r4, r5
	adds r0, r4, 0
	adds r1, r6, 0
	bl __divsi3
	mov r3, r8
	strh r0, [r3, 0x20]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8079C08

	thumb_func_start sub_8079C74
sub_8079C74: @ 807A034
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x18]
	movs r2, 0x18
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807A046
	movs r0, 0
	b _0807A0A2
_0807A046:
	subs r0, r1, 0x1
	strh r0, [r4, 0x18]
	lsls r0, 16
	cmp r0, 0
	beq _0807A060
	ldrh r0, [r4, 0x1E]
	ldrh r3, [r4, 0x1A]
	adds r0, r3
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x20]
	ldrh r1, [r4, 0x1C]
	adds r0, r1
	b _0807A066
_0807A060:
	ldrh r0, [r4, 0x22]
	strh r0, [r4, 0x1A]
	ldrh r0, [r4, 0x24]
_0807A066:
	strh r0, [r4, 0x1C]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1A
	ldrsh r1, [r4, r2]
	movs r3, 0x1C
	ldrsh r2, [r4, r3]
	movs r3, 0
	bl obj_id_set_rotscale
	movs r0, 0x18
	ldrsh r3, [r4, r0]
	cmp r3, 0
	beq _0807A090
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_8079A64
	b _0807A0A0
_0807A090:
	ldr r2, _0807A0A8 @ =gSprites
	movs r0, 0x26
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r3, [r0, 0x26]
_0807A0A0:
	ldrb r0, [r4, 0x18]
_0807A0A2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A0A8: .4byte gSprites
	thumb_func_end sub_8079C74

	thumb_func_start sub_8079CEC
sub_8079CEC: @ 807A0AC
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0807A0D8 @ =gUnknown_0202F7BE
	ldrb r0, [r0]
	movs r1, 0
	cmp r0, 0x1E
	bls _0807A0CA
	movs r1, 0x1
	cmp r0, 0x64
	bls _0807A0CA
	movs r1, 0x3
	cmp r0, 0xC8
	bhi _0807A0CA
	movs r1, 0x2
_0807A0CA:
	ldr r0, _0807A0DC @ =gUnknown_03004B00
	strh r1, [r0, 0xE]
	adds r0, r2, 0
	bl move_anim_task_del
	pop {r0}
	bx r0
	.align 2, 0
_0807A0D8: .4byte gUnknown_0202F7BE
_0807A0DC: .4byte gUnknown_03004B00
	thumb_func_end sub_8079CEC

	thumb_func_start unref_sub_8079D20
unref_sub_8079D20: @ 807A0E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldr r6, _0807A1D4 @ =gUnknown_0202F7C9
	ldrb r0, [r6]
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807A120
	ldr r2, _0807A1D8 @ =gSprites
	ldr r1, _0807A1DC @ =gUnknown_02024BE0
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_0807A120:
	ldr r0, _0807A1E0 @ =gUnknown_0202F7C8
	mov r8, r0
	ldrb r0, [r0]
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807A158
	ldr r2, _0807A1D8 @ =gSprites
	ldr r1, _0807A1DC @ =gUnknown_02024BE0
	mov r3, r8
	ldrb r0, [r3]
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_0807A158:
	ldrb r0, [r6]
	movs r5, 0x2
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807A190
	ldr r2, _0807A1D8 @ =gSprites
	ldr r1, _0807A1DC @ =gUnknown_02024BE0
	ldrb r0, [r6]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 2
	ldrb r3, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x5]
_0807A190:
	mov r1, r8
	ldrb r0, [r1]
	eors r0, r5
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807A1C8
	ldr r2, _0807A1D8 @ =gSprites
	ldr r1, _0807A1DC @ =gUnknown_02024BE0
	mov r3, r8
	ldrb r0, [r3]
	eors r0, r5
	adds r0, r1
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x3
	ands r7, r0
	lsls r3, r7, 2
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
_0807A1C8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A1D4: .4byte gUnknown_0202F7C9
_0807A1D8: .4byte gSprites
_0807A1DC: .4byte gUnknown_02024BE0
_0807A1E0: .4byte gUnknown_0202F7C8
	thumb_func_end unref_sub_8079D20

	thumb_func_start sub_8079E24
sub_8079E24: @ 807A1E4
	push {r4-r6,lr}
	movs r5, 0
	ldr r0, _0807A244 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	bge _0807A23E
	ldr r6, _0807A248 @ =gSprites
_0807A1F2:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl b_side_obj__get_some_boolean
	lsls r0, 24
	cmp r0, 0
	beq _0807A234
	adds r0, r4, 0
	bl sub_8079E90
	ldr r3, _0807A24C @ =gUnknown_02024BE0
	adds r3, r5, r3
	ldrb r2, [r3]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r6
	adds r1, 0x43
	strb r0, [r1]
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r2, [r0, 0x5]
	movs r3, 0xD
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	movs r1, 0x8
	orrs r2, r1
	strb r2, [r0, 0x5]
_0807A234:
	adds r5, 0x1
	ldr r0, _0807A244 @ =gUnknown_02024A68
	ldrb r0, [r0]
	cmp r5, r0
	blt _0807A1F2
_0807A23E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807A244: .4byte gUnknown_02024A68
_0807A248: .4byte gSprites
_0807A24C: .4byte gUnknown_02024BE0
	thumb_func_end sub_8079E24

	thumb_func_start sub_8079E90
sub_8079E90: @ 807A250
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A26C
	cmp r4, 0x2
	bne _0807A268
	movs r0, 0x1E
	b _0807A28C
_0807A268:
	movs r0, 0x28
	b _0807A28C
_0807A26C:
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1E
	cmp r0, 0
	beq _0807A28A
	movs r1, 0x14
	cmp r0, 0x2
	beq _0807A28A
	movs r1, 0x32
	cmp r0, 0x1
	bne _0807A28A
	movs r1, 0x28
_0807A28A:
	adds r0, r1, 0
_0807A28C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8079E90

	thumb_func_start sub_8079ED4
sub_8079ED4: @ 807A294
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A2B0
	movs r0, 0x2
	b _0807A2C8
_0807A2B0:
	cmp r4, 0
	beq _0807A2B8
	cmp r4, 0x3
	bne _0807A2C0
_0807A2B8:
	ldr r0, _0807A2BC @ =0x0400000c
	b _0807A2C2
	.align 2, 0
_0807A2BC: .4byte 0x0400000c
_0807A2C0:
	ldr r0, _0807A2D0 @ =0x0400000a
_0807A2C2:
	ldr r0, [r0]
	lsls r0, 30
	lsrs r0, 30
_0807A2C8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807A2D0: .4byte 0x0400000a
	thumb_func_end sub_8079ED4

	thumb_func_start battle_get_per_side_status_permutated
battle_get_per_side_status_permutated: @ 807A2D4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807A2FA
	adds r0, r4, 0
	bl battle_get_per_side_status
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0807A2F6
	cmp r0, 0x3
	bne _0807A2FA
_0807A2F6:
	movs r0, 0x2
	b _0807A2FC
_0807A2FA:
	movs r0, 0x1
_0807A2FC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end battle_get_per_side_status_permutated

	thumb_func_start sub_8079F44
sub_8079F44: @ 807A304
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	ldr r4, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp, 0x10]
	lsls r5, 24
	lsrs r5, 24
	str r5, [sp, 0x14]
	lsls r0, r7, 3
	ldr r1, _0807A3A0 @ =gUnknown_0837F5E0
	adds r0, r1
	bl LoadSpriteSheet
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	ldr r1, _0807A3A4 @ =gSpriteTemplate_837F5B0
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x2]
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r4, r0, 24
	mov r0, r8
	cmp r0, 0
	bne _0807A3B0
	adds r0, r6, 0
	ldr r1, [sp, 0x44]
	ldr r2, [sp, 0x40]
	bl species_and_otid_get_pal
	lsls r1, r4, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r0, r6, 3
	ldr r1, _0807A3A8 @ =gMonFrontPicTable
	adds r0, r1
	ldr r2, _0807A3AC @ =gMonFrontPicCoords
	lsls r5, r6, 2
	adds r2, r5, r2
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	str r3, [sp]
	str r6, [sp, 0x4]
	ldr r4, [sp, 0x40]
	str r4, [sp, 0x8]
	movs r4, 0x1
	str r4, [sp, 0xC]
	bl sub_800D378
	b _0807A3EE
	.align 2, 0
_0807A3A0: .4byte gUnknown_0837F5E0
_0807A3A4: .4byte gSpriteTemplate_837F5B0
_0807A3A8: .4byte gMonFrontPicTable
_0807A3AC: .4byte gMonFrontPicCoords
_0807A3B0:
	adds r0, r6, 0
	ldr r1, [sp, 0x44]
	ldr r2, [sp, 0x40]
	bl species_and_otid_get_pal
	lsls r1, r4, 20
	movs r2, 0x80
	lsls r2, 17
	adds r1, r2
	lsrs r1, 16
	movs r2, 0x20
	bl LoadCompressedPalette
	lsls r0, r6, 3
	ldr r1, _0807A428 @ =gMonBackPicTable
	adds r0, r1
	ldr r2, _0807A42C @ =gMonBackPicCoords
	lsls r5, r6, 2
	adds r2, r5, r2
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	str r3, [sp]
	str r6, [sp, 0x4]
	ldr r4, [sp, 0x40]
	str r4, [sp, 0x8]
	movs r4, 0
	str r4, [sp, 0xC]
	bl sub_800D378
_0807A3EE:
	movs r2, 0x80
	lsls r2, 18
	mov r6, r10
	lsls r0, r6, 5
	ldr r1, _0807A430 @ =0x06010000
	adds r0, r1
	ldr r1, _0807A434 @ =0x040000d4
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _0807A438 @ =0x84000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r2, r8
	cmp r2, 0
	bne _0807A444
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _0807A43C @ =gSpriteTemplate_837F5B0
	adds r0, r1
	mov r3, r9
	lsls r1, r3, 16
	asrs r1, 16
	ldr r2, _0807A440 @ =gMonFrontPicCoords
	adds r2, r5, r2
	ldrb r2, [r2, 0x1]
	ldr r4, [sp, 0x10]
	adds r2, r4
	b _0807A45E
	.align 2, 0
_0807A428: .4byte gMonBackPicTable
_0807A42C: .4byte gMonBackPicCoords
_0807A430: .4byte 0x06010000
_0807A434: .4byte 0x040000d4
_0807A438: .4byte 0x84000200
_0807A43C: .4byte gSpriteTemplate_837F5B0
_0807A440: .4byte gMonFrontPicCoords
_0807A444:
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 3
	ldr r1, _0807A4A4 @ =gSpriteTemplate_837F5B0
	adds r0, r1
	mov r6, r9
	lsls r1, r6, 16
	asrs r1, 16
	ldr r2, _0807A4A8 @ =gMonBackPicCoords
	adds r2, r5, r2
	ldrb r2, [r2, 0x1]
	ldr r3, [sp, 0x10]
	adds r2, r3
_0807A45E:
	lsls r2, 16
	asrs r2, 16
	ldr r3, [sp, 0x14]
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A490
	ldr r3, _0807A4AC @ =gSprites
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r1, r3, 0
	adds r1, 0x10
	adds r1, r0, r1
	ldr r2, _0807A4B0 @ =gSpriteAffineAnimTable_81E7C18
	str r2, [r1]
	adds r0, r3
	movs r1, 0
	bl StartSpriteAffineAnim
_0807A490:
	adds r0, r4, 0
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807A4A4: .4byte gSpriteTemplate_837F5B0
_0807A4A8: .4byte gMonBackPicCoords
_0807A4AC: .4byte gSprites
_0807A4B0: .4byte gSpriteAffineAnimTable_81E7C18
	thumb_func_end sub_8079F44

	thumb_func_start sub_807A0F4
sub_807A0F4: @ 807A4B4
	push {lr}
	bl DestroySpriteAndFreeResources
	pop {r0}
	bx r0
	thumb_func_end sub_807A0F4

	thumb_func_start sub_807A100
sub_807A100: @ 807A4C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	beq _0807A564
	ldr r2, _0807A4F0 @ =0x02019348
	ldrb r1, [r2, 0x4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807A4F4
	ldrh r7, [r2, 0x2]
	ldr r2, [r2, 0x10]
	b _0807A4F8
	.align 2, 0
_0807A4F0: .4byte 0x02019348
_0807A4F4:
	ldrh r7, [r2]
	ldr r2, [r2, 0x8]
_0807A4F8:
	cmp r7, 0xC9
	bne _0807A544
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A530
	movs r0, 0xC9
	b _0807A53A
_0807A530:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A53A:
	lsls r1, r0, 2
	ldr r0, _0807A540 @ =gMonBackPicCoords
	b _0807A6FC
	.align 2, 0
_0807A540: .4byte gMonBackPicCoords
_0807A544:
	ldr r0, _0807A55C @ =0x00000181
	cmp r7, r0
	bne _0807A54C
	b _0807A6CC
_0807A54C:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bhi _0807A618
	lsls r1, r7, 2
	ldr r0, _0807A560 @ =gMonBackPicCoords
	b _0807A6FC
	.align 2, 0
_0807A55C: .4byte 0x00000181
_0807A560: .4byte gMonBackPicCoords
_0807A564:
	mov r0, r8
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807A62C
	mov r0, r8
	lsls r2, r0, 2
	ldr r0, _0807A5AC @ =0x02017800
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807A5B8
	ldr r0, _0807A5B0 @ =gUnknown_02024A6A
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807A5B4 @ =gPlayerParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _0807A5C0
	.align 2, 0
_0807A5AC: .4byte 0x02017800
_0807A5B0: .4byte gUnknown_02024A6A
_0807A5B4: .4byte gPlayerParty
_0807A5B8:
	ldrh r7, [r1, 0x2]
	ldr r0, _0807A5F8 @ =gUnknown_02024E70
	adds r0, r2, r0
	ldr r2, [r0]
_0807A5C0:
	cmp r7, 0xC9
	bne _0807A610
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A5FC
	movs r0, 0xC9
	b _0807A606
	.align 2, 0
_0807A5F8: .4byte gUnknown_02024E70
_0807A5FC:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A606:
	lsls r1, r0, 2
	ldr r0, _0807A60C @ =gMonBackPicCoords
	b _0807A6FC
	.align 2, 0
_0807A60C: .4byte gMonBackPicCoords
_0807A610:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _0807A620
_0807A618:
	ldr r4, _0807A61C @ =gMonBackPicCoords
	b _0807A6FE
	.align 2, 0
_0807A61C: .4byte gMonBackPicCoords
_0807A620:
	lsls r1, r7, 2
	ldr r0, _0807A628 @ =gMonBackPicCoords
	b _0807A6FC
	.align 2, 0
_0807A628: .4byte gMonBackPicCoords
_0807A62C:
	mov r0, r8
	lsls r2, r0, 2
	ldr r0, _0807A668 @ =0x02017800
	adds r1, r2, r0
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	bne _0807A674
	ldr r0, _0807A66C @ =gUnknown_02024A6A
	mov r1, r8
	lsls r4, r1, 1
	adds r4, r0
	ldrh r0, [r4]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0807A670 @ =gEnemyParty
	adds r0, r5
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	ldrh r0, [r4]
	muls r0, r6
	adds r0, r5
	movs r1, 0
	bl GetMonData
	adds r2, r0, 0
	b _0807A67C
	.align 2, 0
_0807A668: .4byte 0x02017800
_0807A66C: .4byte gUnknown_02024A6A
_0807A670: .4byte gEnemyParty
_0807A674:
	ldrh r7, [r1, 0x2]
	ldr r0, _0807A6B4 @ =gUnknown_02024E70
	adds r0, r2, r0
	ldr r2, [r0]
_0807A67C:
	cmp r7, 0xC9
	bne _0807A6C6
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r2
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r2
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r2
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r2
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0807A6B8
	movs r0, 0xC9
	b _0807A6C2
	.align 2, 0
_0807A6B4: .4byte gUnknown_02024E70
_0807A6B8:
	movs r1, 0xCE
	lsls r1, 1
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
_0807A6C2:
	lsls r1, r0, 2
	b _0807A6FA
_0807A6C6:
	ldr r0, _0807A6DC @ =0x00000181
	cmp r7, r0
	bne _0807A6E8
_0807A6CC:
	ldr r0, _0807A6E0 @ =gUnknown_02024E84
	add r0, r8
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0807A6E4 @ =gUnknownCastformCoords_0837F598
	adds r4, r0, r1
	b _0807A6FE
	.align 2, 0
_0807A6DC: .4byte 0x00000181
_0807A6E0: .4byte gUnknown_02024E84
_0807A6E4: .4byte gUnknownCastformCoords_0837F598
_0807A6E8:
	movs r0, 0xCE
	lsls r0, 1
	cmp r7, r0
	bls _0807A6F8
	ldr r4, _0807A6F4 @ =gMonFrontPicCoords
	b _0807A6FE
	.align 2, 0
_0807A6F4: .4byte gMonFrontPicCoords
_0807A6F8:
	lsls r1, r7, 2
_0807A6FA:
	ldr r0, _0807A710 @ =gMonFrontPicCoords
_0807A6FC:
	adds r4, r1, r0
_0807A6FE:
	mov r0, r9
	cmp r0, 0x6
	bhi _0807A7AE
	lsls r0, 2
	ldr r1, _0807A714 @ =_0807A718
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A710: .4byte gMonFrontPicCoords
_0807A714: .4byte _0807A718
	.align 2, 0
_0807A718:
	.4byte _0807A734
	.4byte _0807A73E
	.4byte _0807A76A
	.4byte _0807A782
	.4byte _0807A746
	.4byte _0807A758
	.4byte _0807A79A
_0807A734:
	ldrb r1, [r4]
	movs r0, 0xF
	ands r0, r1
	lsls r0, 3
	b _0807A7B0
_0807A73E:
	ldrb r0, [r4]
	lsrs r0, 4
	lsls r0, 3
	b _0807A7B0
_0807A746:
	mov r0, r8
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _0807A77C
_0807A758:
	mov r0, r8
	movs r1, 0x2
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4]
	lsrs r1, 4
	b _0807A794
_0807A76A:
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_0807A77C:
	lsls r1, 2
	subs r0, r1
	b _0807A7B0
_0807A782:
	mov r0, r8
	movs r1, 0x3
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	movs r1, 0xF
	ands r1, r2
_0807A794:
	lsls r1, 2
	adds r0, r1
	b _0807A7B0
_0807A79A:
	mov r0, r8
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1F
	ldrb r1, [r4, 0x1]
	subs r0, r1
	b _0807A7B0
_0807A7AE:
	movs r0, 0
_0807A7B0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_807A100

	thumb_func_start sub_807A3FC
sub_807A3FC: @ 807A7BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r2
	mov r10, r3
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _0807A7DA
	movs r5, 0
	movs r6, 0x1
	b _0807A7DE
_0807A7DA:
	movs r5, 0x2
	movs r6, 0x3
_0807A7DE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r7, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0807A830
	bl sub_8076BE0
	lsls r0, 24
	cmp r0, 0
	bne _0807A830
	movs r0, 0x2
	eors r4, r0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	adds r1, r6, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r3, r0, 24
	mov r0, r8
	lsls r1, r0, 16
	lsls r2, r7, 16
	b _0807A83C
_0807A830:
	mov r0, r8
	lsls r1, r0, 16
	lsrs r5, r1, 16
	lsls r0, r7, 16
	lsrs r3, r0, 16
	adds r2, r0, 0
_0807A83C:
	asrs r0, r1, 16
	adds r0, r5
	asrs r0, 1
	mov r1, r9
	strh r0, [r1]
	asrs r0, r2, 16
	adds r0, r3
	asrs r0, 1
	mov r1, r10
	strh r0, [r1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_807A3FC

	thumb_func_start sub_807A4A0
sub_807A4A0: @ 807A860
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x4
	lsls r6, r1, 24
	lsrs r6, 24
	ldr r0, _0807A8F8 @ =SpriteCallbackDummy
	mov r10, r0
	bl object_new_hidden_with_callback
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0807A8FC @ =gSprites
	mov r9, r0
	mov r0, r8
	lsls r3, r0, 4
	add r3, r8
	lsls r3, 2
	mov r0, r9
	adds r5, r3, r0
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	add r4, r9
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x44
	str r3, [sp]
	bl memcpy
	adds r2, r5, 0
	adds r2, 0x3F
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r2, [r5, 0x5]
	movs r1, 0xD
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r5, 0x5]
	ldrb r0, [r5, 0x1]
	ands r1, r0
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r5, 0x1]
	ldrh r1, [r4, 0x4]
	lsls r1, 22
	lsrs r1, 22
	ldrh r2, [r5, 0x4]
	ldr r0, _0807A900 @ =0xfffffc00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	movs r0, 0x1C
	add r9, r0
	ldr r3, [sp]
	add r3, r9
	mov r0, r10
	str r0, [r3]
	mov r0, r8
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807A8F8: .4byte SpriteCallbackDummy
_0807A8FC: .4byte gSprites
_0807A900: .4byte 0xfffffc00
	thumb_func_end sub_807A4A0

	thumb_func_start sub_807A544
sub_807A544: @ 807A904
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _0807A93C @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A944
	ldr r2, _0807A940 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x6]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r3, r4, 0
	adds r3, 0x3F
	ldrb r0, [r3]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r3]
	adds r1, r2, 0
	b _0807A94E
	.align 2, 0
_0807A93C: .4byte gUnknown_0202F7C8
_0807A940: .4byte gUnknown_03004B00
_0807A944:
	ldr r1, _0807A978 @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_0807A94E:
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
	ldr r1, _0807A97C @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _0807A980 @ =sub_8078504
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A978: .4byte gUnknown_03004B00
_0807A97C: .4byte move_anim_8074EE0
_0807A980: .4byte sub_8078504
	thumb_func_end sub_807A544

	thumb_func_start sub_807A5C4
sub_807A5C4: @ 807A984
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0807A9AC @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807A9B4
	ldr r2, _0807A9B0 @ =gUnknown_03004B00
	ldrh r0, [r4, 0x20]
	ldrh r1, [r2]
	subs r0, r1
	strh r0, [r4, 0x20]
	movs r1, 0x6
	ldrsh r0, [r2, r1]
	negs r0, r0
	strh r0, [r2, 0x6]
	adds r1, r2, 0
	b _0807A9BE
	.align 2, 0
_0807A9AC: .4byte gUnknown_0202F7C8
_0807A9B0: .4byte gUnknown_03004B00
_0807A9B4:
	ldr r1, _0807A9F0 @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
_0807A9BE:
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
	bl StartSpriteAnim
	ldr r1, _0807A9F4 @ =move_anim_8074EE0
	adds r0, r4, 0
	bl oamt_set_x3A_32
	ldr r0, _0807A9F8 @ =sub_8078504
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807A9F0: .4byte gUnknown_03004B00
_0807A9F4: .4byte move_anim_8074EE0
_0807A9F8: .4byte sub_8078504
	thumb_func_end sub_807A5C4

	thumb_func_start sub_807A63C
sub_807A63C: @ 807A9FC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8078650
	ldr r0, _0807AA20 @ =gUnknown_0202F7C8
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	beq _0807AA28
	ldr r0, _0807AA24 @ =gUnknown_03004B00
	ldrh r1, [r4, 0x20]
	ldrh r2, [r0]
	subs r1, r2
	strh r1, [r4, 0x20]
	b _0807AA34
	.align 2, 0
_0807AA20: .4byte gUnknown_0202F7C8
_0807AA24: .4byte gUnknown_03004B00
_0807AA28:
	ldr r1, _0807AA50 @ =gUnknown_03004B00
	ldrh r0, [r1]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, r1, 0
_0807AA34:
	ldrh r0, [r0, 0x2]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, _0807AA54 @ =sub_8078600
	str r0, [r4, 0x1C]
	ldr r1, _0807AA58 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807AA50: .4byte gUnknown_03004B00
_0807AA54: .4byte sub_8078600
_0807AA58: .4byte move_anim_8072740
	thumb_func_end sub_807A63C

	thumb_func_start sub_807A69C
sub_807A69C: @ 807AA5C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0807AAF0 @ =gTasks
	adds r5, r1, r0
	movs r0, 0
	bl obj_id_for_side_relative_to_move
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	strh r0, [r5, 0x8]
	ldr r7, _0807AAF4 @ =gUnknown_0202F7C8
	ldrb r0, [r7]
	bl battle_side_get_owner
	lsls r0, 24
	movs r1, 0x8
	cmp r0, 0
	beq _0807AA90
	movs r0, 0x8
	negs r0, r0
	adds r1, r0, 0
_0807AA90:
	strh r1, [r5, 0xA]
	strh r6, [r5, 0xC]
	strh r6, [r5, 0xE]
	ldr r4, _0807AAF8 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r1, [r0, 0x24]
	ldrh r2, [r5, 0x8]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldr r0, _0807AAFC @ =0x00002771
	bl AllocSpritePalette
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x10]
	strh r6, [r5, 0x12]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	adds r0, 0x10
	lsls r0, 20
	lsrs r6, r0, 16
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r0, [r0, 0x5]
	lsrs r0, 4
	adds r0, 0x10
	lsls r4, r0, 4
	ldrb r0, [r7]
	bl sub_8079E90
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x14]
	cmp r0, 0x14
	beq _0807AAEC
	cmp r0, 0x28
	bne _0807AB00
_0807AAEC:
	movs r0, 0x2
	b _0807AB02
	.align 2, 0
_0807AAF0: .4byte gTasks
_0807AAF4: .4byte gUnknown_0202F7C8
_0807AAF8: .4byte gSprites
_0807AAFC: .4byte 0x00002771
_0807AB00:
	movs r0, 0x3
_0807AB02:
	strh r0, [r5, 0x14]
	lsls r0, r4, 1
	ldr r1, _0807AB30 @ =gPlttBufferUnfaded
	adds r0, r1
	lsls r1, r6, 1
	ldr r2, _0807AB34 @ =gPlttBufferFaded
	adds r1, r2
	ldr r2, _0807AB38 @ =0x04000008
	bl CpuSet
	ldr r0, _0807AB3C @ =gUnknown_03004B00
	ldrb r2, [r0, 0x2]
	ldrh r3, [r0]
	adds r0, r6, 0
	movs r1, 0x10
	bl BlendPalette
	ldr r0, _0807AB40 @ =sub_807A784
	str r0, [r5]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AB30: .4byte gPlttBufferUnfaded
_0807AB34: .4byte gPlttBufferFaded
_0807AB38: .4byte 0x04000008
_0807AB3C: .4byte gUnknown_03004B00
_0807AB40: .4byte sub_807A784
	thumb_func_end sub_807A69C

	thumb_func_start sub_807A784
sub_807A784: @ 807AB44
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807AB68 @ =gTasks
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0807ABA8
	cmp r0, 0x1
	bgt _0807AB6C
	cmp r0, 0
	beq _0807AB72
	b _0807AC04
	.align 2, 0
_0807AB68: .4byte gTasks
_0807AB6C:
	cmp r0, 0x2
	beq _0807ABF0
	b _0807AC04
_0807AB72:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_807A850
	ldr r2, _0807ABA4 @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r4, 0xA]
	ldrh r2, [r0, 0x24]
	adds r1, r2
	strh r1, [r0, 0x24]
	ldrh r1, [r4, 0xE]
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0807AC04
	strh r1, [r4, 0xE]
	b _0807ABE2
	.align 2, 0
_0807ABA4: .4byte gSprites
_0807ABA8:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_807A850
	ldr r3, _0807ABEC @ =gSprites
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x24]
	ldrh r2, [r4, 0xA]
	subs r1, r2
	strh r1, [r0, 0x24]
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bne _0807AC04
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	strh r2, [r1, 0x24]
_0807ABE2:
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	b _0807AC04
	.align 2, 0
_0807ABEC: .4byte gSprites
_0807ABF0:
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0807AC04
	ldr r0, _0807AC0C @ =0x00002771
	bl FreeSpritePaletteByTag
	adds r0, r5, 0
	bl move_anim_task_del
_0807AC04:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AC0C: .4byte 0x00002771
	thumb_func_end sub_807A784

	thumb_func_start sub_807A850
sub_807A850: @ 807AC10
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	movs r0, 0
	bl duplicate_obj_of_side_rel2move_in_transparent_mode
	lsls r0, 16
	lsrs r7, r0, 16
	asrs r0, 16
	cmp r0, 0
	blt _0807AC80
	ldr r5, _0807AC8C @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r3, r4, r5
	movs r0, 0x3
	ldrb r1, [r6, 0x14]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrb r1, [r6, 0x10]
	lsls r1, 4
	movs r2, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x5]
	movs r0, 0x8
	strh r0, [r3, 0x2E]
	mov r0, r8
	strh r0, [r3, 0x30]
	strh r7, [r3, 0x32]
	movs r0, 0x8
	ldrsh r1, [r6, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x24]
	strh r0, [r3, 0x24]
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0807AC90 @ =sub_807A8D4
	str r0, [r4]
	ldrh r0, [r6, 0x12]
	adds r0, 0x1
	strh r0, [r6, 0x12]
_0807AC80:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807AC8C: .4byte gSprites
_0807AC90: .4byte sub_807A8D4
	thumb_func_end sub_807A850

	thumb_func_start sub_807A8D4
sub_807A8D4: @ 807AC94
	push {lr}
	adds r3, r0, 0
	ldrh r0, [r3, 0x2E]
	subs r0, 0x1
	strh r0, [r3, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _0807ACBE
	ldr r2, _0807ACC4 @ =gTasks
	movs r0, 0x30
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r1, [r0, 0x12]
	subs r1, 0x1
	strh r1, [r0, 0x12]
	adds r0, r3, 0
	bl obj_delete_but_dont_free_vram
_0807ACBE:
	pop {r0}
	bx r0
	.align 2, 0
_0807ACC4: .4byte gTasks
	thumb_func_end sub_807A8D4

	thumb_func_start sub_807A908
sub_807A908: @ 807ACC8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0807ACFC @ =gUnknown_0202F7C8
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
	bne _0807AD00
	movs r0, 0x5
	b _0807AD02
	.align 2, 0
_0807ACFC: .4byte gUnknown_0202F7C8
_0807AD00:
	ldr r0, _0807AD14 @ =0x0000fff6
_0807AD02:
	strh r0, [r5, 0x2E]
	ldr r0, _0807AD18 @ =0x0000ffd8
	strh r0, [r5, 0x30]
	ldr r0, _0807AD1C @ =sub_807A960
	str r0, [r5, 0x1C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807AD14: .4byte 0x0000fff6
_0807AD18: .4byte 0x0000ffd8
_0807AD1C: .4byte sub_807A960
	thumb_func_end sub_807A908

	thumb_func_start sub_807A960
sub_807A960: @ 807AD20
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	ldrh r1, [r4, 0x32]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r5, [r4, 0x30]
	ldrh r2, [r4, 0x34]
	adds r0, r5, r2
	strh r0, [r4, 0x34]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x24]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	movs r1, 0xA
	bl __divsi3
	strh r0, [r4, 0x26]
	lsls r0, r5, 16
	asrs r0, 16
	movs r1, 0x14
	negs r1, r1
	cmp r0, r1
	bge _0807AD5C
	adds r0, r5, 0x1
	strh r0, [r4, 0x30]
_0807AD5C:
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _0807AD74
	adds r0, r4, 0
	bl move_anim_8072740
_0807AD74:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_807A960

	thumb_func_start sub_807A9BC
sub_807A9BC: @ 807AD7C
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0807ADB4 @ =gUnknown_03004B00
	ldrh r0, [r5, 0x4]
	strh r0, [r4, 0x2E]
	ldrh r0, [r5, 0x8]
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x32]
	ldrh r0, [r5, 0xA]
	ldrh r1, [r4, 0x22]
	adds r0, r1
	strh r0, [r4, 0x36]
	ldr r0, _0807ADB8 @ =gUnknown_0202F7C9
	ldrb r0, [r0]
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _0807ADBC
	ldrh r0, [r5, 0x8]
	adds r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x14
	b _0807ADCA
	.align 2, 0
_0807ADB4: .4byte gUnknown_03004B00
_0807ADB8: .4byte gUnknown_0202F7C9
_0807ADBC:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1E
	ldrh r1, [r4, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r5, 0xA]
	subs r0, 0x50
_0807ADCA:
	strh r0, [r4, 0x22]
	ldr r0, _0807ADE0 @ =sub_8078B34
	str r0, [r4, 0x1C]
	ldr r1, _0807ADE4 @ =move_anim_8072740
	adds r0, r4, 0
	bl oamt_set_x3A_32
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807ADE0: .4byte sub_8078B34
_0807ADE4: .4byte move_anim_8072740
	thumb_func_end sub_807A9BC

	.align 2, 0 @ Don't pad with nop.
