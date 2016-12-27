	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_74
nullsub_74: @ 811DE68
	bx lr
	thumb_func_end nullsub_74

	thumb_func_start sub_811DA78
sub_811DA78: @ 811DE6C
	ldr r1, _0811DE7C @ =gUnknown_03004330
	ldr r0, _0811DE80 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811DE84 @ =sub_811DA94
	str r1, [r0]
	bx lr
	.align 2, 0
_0811DE7C: .4byte gUnknown_03004330
_0811DE80: .4byte gUnknown_02024A60
_0811DE84: .4byte sub_811DA94
	thumb_func_end sub_811DA78

	thumb_func_start sub_811DA94
sub_811DA94: @ 811DE88
	push {lr}
	ldr r2, _0811DEBC @ =gUnknown_02024A64
	ldr r1, _0811DEC0 @ =gBitTable
	ldr r0, _0811DEC4 @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 2
	adds r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _0811DED4
	ldr r0, _0811DEC8 @ =gUnknown_02023A60
	lsls r1, r3, 9
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x38
	bhi _0811DED0
	ldr r0, _0811DECC @ =gUnknown_083FE4F4
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0811DED4
	.align 2, 0
_0811DEBC: .4byte gUnknown_02024A64
_0811DEC0: .4byte gBitTable
_0811DEC4: .4byte gUnknown_02024A60
_0811DEC8: .4byte gUnknown_02023A60
_0811DECC: .4byte gUnknown_083FE4F4
_0811DED0:
	bl dp01_tbl3_exec_completed
_0811DED4:
	pop {r0}
	bx r0
	thumb_func_end sub_811DA94

	thumb_func_start sub_811DAE4
sub_811DAE4: @ 811DED8
	push {lr}
	ldr r2, _0811DF00 @ =gSprites
	ldr r1, _0811DF04 @ =gUnknown_02024BE0
	ldr r0, _0811DF08 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0811DF0C @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0811DEFC
	bl dp01_tbl3_exec_completed
_0811DEFC:
	pop {r0}
	bx r0
	.align 2, 0
_0811DF00: .4byte gSprites
_0811DF04: .4byte gUnknown_02024BE0
_0811DF08: .4byte gUnknown_02024A60
_0811DF0C: .4byte SpriteCallbackDummy
	thumb_func_end sub_811DAE4

	thumb_func_start sub_811DB1C
sub_811DB1C: @ 811DF10
	push {r4-r6,lr}
	ldr r6, _0811DF68 @ =gSprites
	ldr r5, _0811DF6C @ =gUnknown_02024BE0
	ldr r4, _0811DF70 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _0811DF74 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0811DF60
	movs r0, 0
	bl nullsub_10
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl FreeSpriteOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	bl dp01_tbl3_exec_completed
_0811DF60:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811DF68: .4byte gSprites
_0811DF6C: .4byte gUnknown_02024BE0
_0811DF70: .4byte gUnknown_02024A60
_0811DF74: .4byte SpriteCallbackDummy
	thumb_func_end sub_811DB1C

	thumb_func_start sub_811DB84
sub_811DB84: @ 811DF78
	push {lr}
	ldr r3, _0811DFAC @ =gUnknown_02024A60
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r2, _0811DFB0 @ =0x02017810
	adds r1, r2
	ldrb r0, [r1, 0x9]
	subs r0, 0x1
	strb r0, [r1, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0811DFA8
	ldrb r0, [r3]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0
	strb r0, [r1, 0x9]
	bl dp01_tbl3_exec_completed
_0811DFA8:
	pop {r0}
	bx r0
	.align 2, 0
_0811DFAC: .4byte gUnknown_02024A60
_0811DFB0: .4byte 0x02017810
	thumb_func_end sub_811DB84

	thumb_func_start sub_811DBC0
sub_811DBC0: @ 811DFB4
	push {r4-r6,lr}
	movs r6, 0
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0811DFD8
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0811E00C
	ldr r0, _0811DFF8 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0811E00C
_0811DFD8:
	ldr r2, _0811DFFC @ =gSprites
	ldr r1, _0811E000 @ =gUnknown_03004340
	ldr r0, _0811E004 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0811E008 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0811E044
	b _0811E042
	.align 2, 0
_0811DFF8: .4byte gUnknown_020239F8
_0811DFFC: .4byte gSprites
_0811E000: .4byte gUnknown_03004340
_0811E004: .4byte gUnknown_02024A60
_0811E008: .4byte SpriteCallbackDummy
_0811E00C:
	ldr r2, _0811E078 @ =gSprites
	ldr r5, _0811E07C @ =gUnknown_03004340
	ldr r0, _0811E080 @ =gUnknown_02024A60
	ldrb r3, [r0]
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r2, 0
	adds r4, 0x1C
	adds r0, r4
	ldr r2, [r0]
	ldr r0, _0811E084 @ =SpriteCallbackDummy
	cmp r2, r0
	bne _0811E044
	movs r0, 0x2
	eors r3, r0
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	cmp r0, r2
	bne _0811E044
_0811E042:
	movs r6, 0x1
_0811E044:
	bl IsCryPlayingOrClearCrySongs
	lsls r0, 24
	cmp r0, 0
	beq _0811E050
	movs r6, 0
_0811E050:
	cmp r6, 0
	beq _0811E072
	ldr r2, _0811E080 @ =gUnknown_02024A60
	ldrb r1, [r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E088 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x9]
	ldr r1, _0811E08C @ =gUnknown_03004330
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E090 @ =sub_811DB84
	str r1, [r0]
_0811E072:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E078: .4byte gSprites
_0811E07C: .4byte gUnknown_03004340
_0811E080: .4byte gUnknown_02024A60
_0811E084: .4byte SpriteCallbackDummy
_0811E088: .4byte 0x02017810
_0811E08C: .4byte gUnknown_03004330
_0811E090: .4byte sub_811DB84
	thumb_func_end sub_811DBC0

	thumb_func_start sub_811DCA0
sub_811DCA0: @ 811E094
	push {r4-r7,lr}
	ldr r6, _0811E1B0 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0811E1B4 @ =0x02017810
	adds r3, r0, r4
	ldrb r1, [r3]
	movs r5, 0x8
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _0811E1A8
	movs r7, 0x2
	adds r1, r7, 0
	eors r1, r2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0811E1A8
	ldrb r0, [r3, 0x9]
	adds r0, 0x1
	strb r0, [r3, 0x9]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811E1A8
	ldrb r0, [r6]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	strb r2, [r1, 0x9]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _0811E14A
	ldr r0, _0811E1B8 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0811E14A
	ldr r1, _0811E1BC @ =gUnknown_0300434C
	ldrb r0, [r6]
	eors r0, r7
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E1C0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r4, _0811E1C4 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r1, r7, 0
	eors r1, r0
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0811E1C8 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0811E1CC @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r6]
	eors r0, r7
	bl sub_804777C
	ldrb r0, [r6]
	eors r0, r7
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
_0811E14A:
	ldr r1, _0811E1BC @ =gUnknown_0300434C
	ldr r4, _0811E1B0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E1C0 @ =gSprites
	adds r0, r1
	bl DestroySprite
	ldr r5, _0811E1C4 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r5
	ldrb r0, [r0]
	ldr r2, _0811E1C8 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _0811E1CC @ =gPlayerParty
	adds r1, r2
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r4]
	bl sub_804777C
	ldrb r0, [r4]
	adds r0, r5
	ldrb r0, [r0]
	bl sub_8043DFC
	ldr r2, _0811E1D0 @ =0x02017840
	ldrb r1, [r2, 0x9]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _0811E1D4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E1D8 @ =sub_811DBC0
	str r1, [r0]
_0811E1A8:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E1B0: .4byte gUnknown_02024A60
_0811E1B4: .4byte 0x02017810
_0811E1B8: .4byte gUnknown_020239F8
_0811E1BC: .4byte gUnknown_0300434C
_0811E1C0: .4byte gSprites
_0811E1C4: .4byte gUnknown_03004340
_0811E1C8: .4byte gUnknown_02024A6A
_0811E1CC: .4byte gPlayerParty
_0811E1D0: .4byte 0x02017840
_0811E1D4: .4byte gUnknown_03004330
_0811E1D8: .4byte sub_811DBC0
	thumb_func_end sub_811DCA0

	thumb_func_start sub_811DDE8
sub_811DDE8: @ 811E1DC
	push {lr}
	ldr r2, _0811E210 @ =gSprites
	ldr r1, _0811E214 @ =gUnknown_02024BE0
	ldr r0, _0811E218 @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	cmp r0, 0
	bge _0811E20A
	movs r2, 0x24
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0811E20A
	bl dp01_tbl3_exec_completed
_0811E20A:
	pop {r0}
	bx r0
	.align 2, 0
_0811E210: .4byte gSprites
_0811E214: .4byte gUnknown_02024BE0
_0811E218: .4byte gUnknown_02024A60
	thumb_func_end sub_811DDE8

	thumb_func_start bx_t3_healthbar_update
bx_t3_healthbar_update: @ 811E21C
	push {r4-r6,lr}
	ldr r5, _0811E25C @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r6, _0811E260 @ =gUnknown_03004340
	adds r1, r0, r6
	ldrb r1, [r1]
	movs r2, 0
	movs r3, 0
	bl sub_8045C78
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	bl sub_8043DFC
	lsls r4, 16
	asrs r1, r4, 16
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0811E264
	ldrb r0, [r5]
	adds r0, r6
	ldrb r0, [r0]
	movs r2, 0
	bl sub_80440EC
	b _0811E27E
	.align 2, 0
_0811E25C: .4byte gUnknown_02024A60
_0811E260: .4byte gUnknown_03004340
_0811E264:
	ldr r2, _0811E284 @ =gUnknown_02024A6A
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811E288 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	bl dp01_tbl3_exec_completed
_0811E27E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E284: .4byte gUnknown_02024A6A
_0811E288: .4byte gPlayerParty
	thumb_func_end bx_t3_healthbar_update

	thumb_func_start sub_811DE98
sub_811DE98: @ 811E28C
	push {r4-r6,lr}
	ldr r6, _0811E310 @ =gSprites
	ldr r5, _0811E314 @ =gUnknown_02024BE0
	ldr r4, _0811E318 @ =gUnknown_02024A60
	ldrb r2, [r4]
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r3, 0x22
	ldrsh r1, [r0, r3]
	movs r3, 0x26
	ldrsh r0, [r0, r3]
	adds r1, r0
	cmp r1, 0xA0
	ble _0811E308
	ldr r1, _0811E31C @ =gUnknown_02024A6A
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811E320 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl nullsub_9
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	bl DestroySprite
	ldr r1, _0811E324 @ =gUnknown_03004340
	ldrb r0, [r4]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl3_exec_completed
_0811E308:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E310: .4byte gSprites
_0811E314: .4byte gUnknown_02024BE0
_0811E318: .4byte gUnknown_02024A60
_0811E31C: .4byte gUnknown_02024A6A
_0811E320: .4byte gPlayerParty
_0811E324: .4byte gUnknown_03004340
	thumb_func_end sub_811DE98

	thumb_func_start sub_811DF34
sub_811DF34: @ 811E328
	push {r4-r6,lr}
	ldr r6, _0811E380 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0811E384 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0811E378
	ldr r5, _0811E388 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0811E38C @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _0811E390 @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl3_exec_completed
_0811E378:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E380: .4byte gUnknown_02024A60
_0811E384: .4byte 0x02017810
_0811E388: .4byte gUnknown_02024BE0
_0811E38C: .4byte gSprites
_0811E390: .4byte gUnknown_03004340
	thumb_func_end sub_811DF34

	thumb_func_start sub_811DFA0
sub_811DFA0: @ 811E394
	push {lr}
	ldr r0, _0811E3A8 @ =gUnknown_03004210
	ldrh r0, [r0, 0x16]
	cmp r0, 0
	bne _0811E3A2
	bl dp01_tbl3_exec_completed
_0811E3A2:
	pop {r0}
	bx r0
	.align 2, 0
_0811E3A8: .4byte gUnknown_03004210
	thumb_func_end sub_811DFA0

	thumb_func_start bx_blink_t3
bx_blink_t3: @ 811E3AC
	push {r4,lr}
	ldr r1, _0811E3E8 @ =gUnknown_02024BE0
	ldr r0, _0811E3EC @ =gUnknown_02024A60
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	ldr r2, _0811E3F0 @ =gSprites
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	cmp r0, 0x20
	bne _0811E3F8
	movs r3, 0
	movs r0, 0
	strh r0, [r4, 0x30]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	subs r0, 0x5
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0811E3F4 @ =gUnknown_02024E6D
	strb r3, [r0]
	bl dp01_tbl3_exec_completed
	b _0811E422
	.align 2, 0
_0811E3E8: .4byte gUnknown_02024BE0
_0811E3EC: .4byte gUnknown_02024A60
_0811E3F0: .4byte gSprites
_0811E3F4: .4byte gUnknown_02024E6D
_0811E3F8:
	ldrh r0, [r4, 0x30]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0811E41C
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
_0811E41C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
_0811E422:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end bx_blink_t3

	thumb_func_start sub_811E034
sub_811E034: @ 811E428
	push {r4,lr}
	ldr r2, _0811E478 @ =gSprites
	ldr r0, _0811E47C @ =gUnknown_03004340
	ldr r4, _0811E480 @ =gUnknown_02024A60
	ldrb r3, [r4]
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _0811E484 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0811E470
	lsls r0, r3, 2
	ldr r1, _0811E488 @ =0x02017800
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0811E464
	adds r0, r3, 0
	adds r1, r3, 0
	adds r2, r3, 0
	movs r3, 0x6
	bl move_anim_start_t4
_0811E464:
	ldr r0, _0811E48C @ =gUnknown_03004330
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, _0811E490 @ =sub_811E0A0
	str r0, [r1]
_0811E470:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811E478: .4byte gSprites
_0811E47C: .4byte gUnknown_03004340
_0811E480: .4byte gUnknown_02024A60
_0811E484: .4byte SpriteCallbackDummy
_0811E488: .4byte 0x02017800
_0811E48C: .4byte gUnknown_03004330
_0811E490: .4byte sub_811E0A0
	thumb_func_end sub_811E034

	thumb_func_start sub_811E0A0
sub_811E0A0: @ 811E494
	push {lr}
	ldr r0, _0811E4B8 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E4BC @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0811E4B2
	bl dp01_tbl3_exec_completed
_0811E4B2:
	pop {r0}
	bx r0
	.align 2, 0
_0811E4B8: .4byte gUnknown_02024A60
_0811E4BC: .4byte 0x02017810
	thumb_func_end sub_811E0A0

	thumb_func_start sub_811E0CC
sub_811E0CC: @ 811E4C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r7, _0811E584 @ =gUnknown_02024A60
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _0811E588 @ =0x02017810
	adds r2, r0, r3
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0811E57A
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r7]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrb r2, [r1, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x1]
	ldr r4, _0811E58C @ =0x000027f9
	adds r0, r4, 0
	bl FreeSpriteTilesByTag
	adds r0, r4, 0
	bl FreeSpritePaletteByTag
	ldr r0, _0811E590 @ =c3_0802FDF4
	movs r1, 0xA
	bl CreateTask
	ldr r0, _0811E594 @ =gUnknown_02024A6A
	mov r8, r0
	ldrb r1, [r7]
	lsls r0, r1, 1
	add r0, r8
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0811E598 @ =gPlayerParty
	adds r0, r5
	bl sub_80324F8
	ldr r1, _0811E59C @ =gUnknown_02024BE0
	ldrb r0, [r7]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E5A0 @ =gSprites
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	ldr r4, _0811E5A4 @ =gUnknown_03004340
	ldrb r1, [r7]
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r1, 1
	add r1, r8
	ldrh r1, [r1]
	muls r1, r6
	adds r1, r5
	movs r2, 0
	bl sub_8045A5C
	ldrb r0, [r7]
	bl sub_804777C
	ldrb r0, [r7]
	adds r0, r4
	ldrb r0, [r0]
	bl sub_8043DFC
	ldrb r0, [r7]
	bl sub_8031F88
	ldr r1, _0811E5A8 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E5AC @ =sub_811E034
	str r1, [r0]
_0811E57A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811E584: .4byte gUnknown_02024A60
_0811E588: .4byte 0x02017810
_0811E58C: .4byte 0x000027f9
_0811E590: .4byte c3_0802FDF4
_0811E594: .4byte gUnknown_02024A6A
_0811E598: .4byte gPlayerParty
_0811E59C: .4byte gUnknown_02024BE0
_0811E5A0: .4byte gSprites
_0811E5A4: .4byte gUnknown_03004340
_0811E5A8: .4byte gUnknown_03004330
_0811E5AC: .4byte sub_811E034
	thumb_func_end sub_811E0CC

	thumb_func_start sub_811E1BC
sub_811E1BC: @ 811E5B0
	push {r4-r6,lr}
	ldr r4, _0811E628 @ =gUnknown_02024A60
	ldrb r2, [r4]
	lsls r3, r2, 1
	adds r0, r3, r2
	lsls r0, 2
	ldr r6, _0811E62C @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x88
	ands r0, r1
	cmp r0, 0
	bne _0811E5DE
	ldr r0, _0811E630 @ =gUnknown_02024A6A
	adds r0, r3, r0
	ldrh r1, [r0]
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0811E634 @ =gPlayerParty
	adds r1, r0
	adds r0, r2, 0
	bl sub_8141828
_0811E5DE:
	ldr r5, _0811E638 @ =gSprites
	ldr r0, _0811E63C @ =gUnknown_0300434C
	ldrb r2, [r4]
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r3, r0, 2
	adds r0, r5, 0
	adds r0, 0x1C
	adds r0, r3, r0
	ldr r1, [r0]
	ldr r0, _0811E640 @ =SpriteCallbackDummy
	cmp r1, r0
	bne _0811E620
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	bne _0811E620
	adds r0, r3, r5
	bl DestroySprite
	ldr r1, _0811E644 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E648 @ =sub_811E0CC
	str r1, [r0]
_0811E620:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811E628: .4byte gUnknown_02024A60
_0811E62C: .4byte 0x02017810
_0811E630: .4byte gUnknown_02024A6A
_0811E634: .4byte gPlayerParty
_0811E638: .4byte gSprites
_0811E63C: .4byte gUnknown_0300434C
_0811E640: .4byte SpriteCallbackDummy
_0811E644: .4byte gUnknown_03004330
_0811E648: .4byte sub_811E0CC
	thumb_func_end sub_811E1BC

	thumb_func_start sub_811E258
sub_811E258: @ 811E64C
	push {lr}
	ldr r0, _0811E67C @ =gReceivedRemoteLinkPlayers
	ldrb r0, [r0]
	cmp r0, 0
	bne _0811E678
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r3, _0811E680 @ =gMain
	ldr r0, _0811E684 @ =0x0000043d
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0811E688 @ =gUnknown_030042D0
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0811E68C @ =c2_8011A1C
	bl SetMainCallback2
_0811E678:
	pop {r0}
	bx r0
	.align 2, 0
_0811E67C: .4byte gReceivedRemoteLinkPlayers
_0811E680: .4byte gMain
_0811E684: .4byte 0x0000043d
_0811E688: .4byte gUnknown_030042D0
_0811E68C: .4byte c2_8011A1C
	thumb_func_end sub_811E258

	thumb_func_start sub_811E29C
sub_811E29C: @ 811E690
	push {lr}
	ldr r0, _0811E6C0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811E6F6
	ldr r0, _0811E6C4 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811E6D4
	bl sub_800832C
	ldr r1, _0811E6C8 @ =gUnknown_03004330
	ldr r0, _0811E6CC @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E6D0 @ =sub_811E258
	str r1, [r0]
	b _0811E6F6
	.align 2, 0
_0811E6C0: .4byte gPaletteFade
_0811E6C4: .4byte gUnknown_020239F8
_0811E6C8: .4byte gUnknown_03004330
_0811E6CC: .4byte gUnknown_02024A60
_0811E6D0: .4byte sub_811E258
_0811E6D4:
	movs r0, 0x5A
	bl m4aSongNumStop
	ldr r2, _0811E6FC @ =gMain
	ldr r0, _0811E700 @ =0x0000043d
	adds r3, r2, r0
	ldrb r1, [r3]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldr r0, _0811E704 @ =gUnknown_030042D0
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, [r2, 0x8]
	bl SetMainCallback2
_0811E6F6:
	pop {r0}
	bx r0
	.align 2, 0
_0811E6FC: .4byte gMain
_0811E700: .4byte 0x0000043d
_0811E704: .4byte gUnknown_030042D0
	thumb_func_end sub_811E29C

	thumb_func_start dp01_tbl3_exec_completed
dp01_tbl3_exec_completed: @ 811E708
	push {r4,lr}
	sub sp, 0x4
	ldr r1, _0811E748 @ =gUnknown_03004330
	ldr r4, _0811E74C @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811E750 @ =sub_811DA94
	str r1, [r0]
	ldr r0, _0811E754 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0811E75C
	bl GetMultiplayerId
	mov r1, sp
	strb r0, [r1]
	movs r0, 0x2
	movs r1, 0x4
	mov r2, sp
	bl dp01_prepare_buffer_wireless_probably
	ldr r1, _0811E758 @ =gUnknown_02023A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r0, r1
	movs r1, 0x38
	strb r1, [r0]
	b _0811E76E
	.align 2, 0
_0811E748: .4byte gUnknown_03004330
_0811E74C: .4byte gUnknown_02024A60
_0811E750: .4byte sub_811DA94
_0811E754: .4byte gUnknown_020239F8
_0811E758: .4byte gUnknown_02023A60
_0811E75C:
	ldr r2, _0811E778 @ =gUnknown_02024A64
	ldr r1, _0811E77C @ =gBitTable
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	ldr r0, [r2]
	bics r0, r1
	str r0, [r2]
_0811E76E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811E778: .4byte gUnknown_02024A64
_0811E77C: .4byte gBitTable
	thumb_func_end dp01_tbl3_exec_completed

	thumb_func_start sub_811E38C
sub_811E38C: @ 811E780
	push {lr}
	ldr r0, _0811E7A4 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E7A8 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _0811E79E
	bl dp01_tbl3_exec_completed
_0811E79E:
	pop {r0}
	bx r0
	.align 2, 0
_0811E7A4: .4byte gUnknown_02024A60
_0811E7A8: .4byte 0x02017810
	thumb_func_end sub_811E38C

	thumb_func_start sub_811E3B8
sub_811E3B8: @ 811E7AC
	push {lr}
	ldr r0, _0811E7D0 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _0811E7D4 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _0811E7CA
	bl dp01_tbl3_exec_completed
_0811E7CA:
	pop {r0}
	bx r0
	.align 2, 0
_0811E7D0: .4byte gUnknown_02024A60
_0811E7D4: .4byte 0x02017810
	thumb_func_end sub_811E3B8

	thumb_func_start dp01t_00_3_getattr
dp01t_00_3_getattr: @ 811E7D8
	push {r4-r6,lr}
	sub sp, 0x100
	movs r6, 0
	ldr r1, _0811E804 @ =gUnknown_02023A60
	ldr r0, _0811E808 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0811E810
	ldr r0, _0811E80C @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	mov r1, sp
	bl dp01_getattr_by_ch1_for_player_pokemon
	adds r6, r0, 0
	b _0811E832
	.align 2, 0
_0811E804: .4byte gUnknown_02023A60
_0811E808: .4byte gUnknown_02024A60
_0811E80C: .4byte gUnknown_02024A6A
_0811E810:
	ldrb r4, [r1]
	movs r5, 0
_0811E814:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0811E82A
	lsls r0, r5, 24
	lsrs r0, 24
	mov r2, sp
	adds r1, r2, r6
	bl dp01_getattr_by_ch1_for_player_pokemon
	adds r6, r0
_0811E82A:
	lsrs r4, 1
	adds r5, 0x1
	cmp r5, 0x5
	ble _0811E814
_0811E832:
	lsls r1, r6, 16
	lsrs r1, 16
	movs r0, 0x1
	mov r2, sp
	bl dp01_build_cmdbuf_x1D_1D_numargs_varargs
	bl dp01_tbl3_exec_completed
	add sp, 0x100
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end dp01t_00_3_getattr

	thumb_func_start dp01_getattr_by_ch1_for_player_pokemon
dp01_getattr_by_ch1_for_player_pokemon: @ 811E84C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x90
	adds r7, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	ldr r2, _0811E880 @ =gUnknown_02023A60
	ldr r3, _0811E884 @ =gUnknown_02024A60
	ldrb r0, [r3]
	lsls r0, 9
	adds r1, r2, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x3B
	bls _0811E876
	bl _0811EFE2
_0811E876:
	lsls r0, 2
	ldr r1, _0811E888 @ =_0811E88C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811E880: .4byte gUnknown_02023A60
_0811E884: .4byte gUnknown_02024A60
_0811E888: .4byte _0811E88C
	.align 2, 0
_0811E88C:
	.4byte _0811E97C
	.4byte _0811EBA0
	.4byte _0811EBB0
	.4byte _0811EBC0
	.4byte _0811EC28
	.4byte _0811EC28
	.4byte _0811EC28
	.4byte _0811EC28
	.4byte _0811EC44
	.4byte _0811EC80
	.4byte _0811EC80
	.4byte _0811EC80
	.4byte _0811EC80
	.4byte _0811EFE2
	.4byte _0811EFE2
	.4byte _0811EFE2
	.4byte _0811EFE2
	.4byte _0811EC9C
	.4byte _0811ECAC
	.4byte _0811ECDC
	.4byte _0811ECEC
	.4byte _0811ECFC
	.4byte _0811ED0C
	.4byte _0811ED1C
	.4byte _0811ED2C
	.4byte _0811ED3C
	.4byte _0811ED4C
	.4byte _0811ED5C
	.4byte _0811ED6C
	.4byte _0811ED7C
	.4byte _0811ED8C
	.4byte _0811ED9C
	.4byte _0811EDEC
	.4byte _0811EDFC
	.4byte _0811EE0C
	.4byte _0811EE1C
	.4byte _0811EE2C
	.4byte _0811EE3C
	.4byte _0811EE4C
	.4byte _0811EE5C
	.4byte _0811EE6C
	.4byte _0811EEA0
	.4byte _0811EEB0
	.4byte _0811EEC0
	.4byte _0811EED0
	.4byte _0811EEE0
	.4byte _0811EEF0
	.4byte _0811EF00
	.4byte _0811EF10
	.4byte _0811EF30
	.4byte _0811EF40
	.4byte _0811EF50
	.4byte _0811EF60
	.4byte _0811EF70
	.4byte _0811EF80
	.4byte _0811EF90
	.4byte _0811EFA0
	.4byte _0811EFB0
	.4byte _0811EFC0
	.4byte _0811EFD0
_0811E97C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811EB90 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2E]
	movs r6, 0
	add r0, sp, 0x24
	mov r9, r0
	movs r1, 0x3B
	add r1, sp
	mov r10, r1
	mov r2, sp
	adds r2, 0x2B
	str r2, [sp, 0x80]
	mov r0, sp
	adds r0, 0x2A
	str r0, [sp, 0x7C]
	mov r1, sp
	adds r1, 0x68
	str r1, [sp, 0x8C]
	adds r2, 0x5
	str r2, [sp, 0x84]
	adds r0, 0x12
	str r0, [sp, 0x88]
	mov r8, r4
	add r4, sp, 0xC
_0811E9C8:
	adds r1, r6, 0
	adds r1, 0xD
	mov r0, r8
	bl GetMonData
	strh r0, [r4]
	adds r1, r6, 0
	adds r1, 0x11
	mov r0, r8
	bl GetMonData
	mov r2, r9
	adds r1, r2, r6
	strb r0, [r1]
	adds r4, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0811E9C8
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811EB90 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	mov r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	ldr r2, [sp, 0x80]
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x19
	bl GetMonData
	str r0, [sp, 0x44]
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	mov r3, sp
	movs r5, 0x1F
	ands r0, r5
	ldrb r2, [r3, 0x14]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	mov r3, sp
	movs r6, 0x1F
	ands r0, r6
	lsls r0, 5
	ldrh r2, [r3, 0x14]
	ldr r1, _0811EB94 @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x14]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 2
	ldrb r2, [r3, 0x15]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x15]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [sp, 0x14]
	ldr r2, _0811EB98 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [sp, 0x14]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	mov r3, sp
	ands r0, r6
	lsls r0, 4
	ldrh r2, [r3, 0x16]
	ldr r1, _0811EB9C @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r3, 0x16]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	mov r3, sp
	ands r0, r5
	lsls r0, 1
	ldrb r2, [r3, 0x17]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	str r0, [sp, 0x48]
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	str r0, [sp, 0x4C]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, [sp, 0x7C]
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x28]
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2C]
	adds r0, r4, 0
	movs r1, 0x3B
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x2]
	adds r0, r4, 0
	movs r1, 0x3C
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x4]
	adds r0, r4, 0
	movs r1, 0x3D
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x6]
	adds r0, r4, 0
	movs r1, 0x3E
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0x8]
	adds r0, r4, 0
	movs r1, 0x3F
	bl GetMonData
	mov r1, sp
	strh r0, [r1, 0xA]
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	mov r3, sp
	movs r1, 0x1
	ands r0, r1
	lsls r0, 6
	ldrb r2, [r3, 0x17]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x2E
	bl GetMonData
	mov r3, sp
	lsls r0, 7
	ldrb r2, [r3, 0x17]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x17]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	str r0, [sp, 0x54]
	adds r0, r4, 0
	movs r1, 0x2
	ldr r2, [sp, 0x8C]
	bl GetMonData
	ldr r0, [sp, 0x84]
	ldr r1, [sp, 0x8C]
	bl StringCopy10
	adds r0, r4, 0
	movs r1, 0x7
	ldr r2, [sp, 0x88]
	bl GetMonData
	mov r2, sp
	movs r6, 0
_0811EB80:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0x57
	bls _0811EB80
	b _0811EFE2
	.align 2, 0
_0811EB90: .4byte gPlayerParty
_0811EB94: .4byte 0xfffffc1f
_0811EB98: .4byte 0xfff07fff
_0811EB9C: .4byte 0xfffffe0f
_0811EBA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EBAC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	b _0811EF1A
	.align 2, 0
_0811EBAC: .4byte gPlayerParty
_0811EBB0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EBBC @ =gPlayerParty
	adds r0, r1
	movs r1, 0xC
	b _0811EF1A
	.align 2, 0
_0811EBBC: .4byte gPlayerParty
_0811EBC0:
	movs r6, 0
	add r2, sp, 0x58
	mov r9, r2
	add r0, sp, 0x60
	mov r10, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811EC24 @ =gPlayerParty
	adds r4, r1, r0
	mov r8, r9
_0811EBD6:
	adds r1, r6, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	mov r1, r8
	strh r0, [r1]
	adds r1, r6, 0
	adds r1, 0x11
	adds r0, r4, 0
	bl GetMonData
	mov r2, r10
	adds r1, r2, r6
	strb r0, [r1]
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0811EBD6
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EC24 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	mov r1, r9
	strb r0, [r1, 0xC]
	mov r2, r9
	movs r6, 0
_0811EC14:
	adds r0, r7, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	adds r6, 0x1
	cmp r6, 0xF
	bls _0811EC14
	b _0811EFE2
	.align 2, 0
_0811EC24: .4byte gPlayerParty
_0811EC28:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EC40 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x9
	b _0811EF1A
	.align 2, 0
_0811EC40: .4byte gPlayerParty
_0811EC44:
	movs r6, 0
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r2, _0811EC7C @ =gPlayerParty
	mov r8, r2
_0811EC50:
	adds r1, r6, 0
	adds r1, 0x11
	mov r2, r8
	adds r0, r4, r2
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	cmp r6, 0x3
	ble _0811EC50
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EC7C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	bl GetMonData
	adds r1, r7, r6
	strb r0, [r1]
	adds r6, 0x1
	b _0811EFE2
	.align 2, 0
_0811EC7C: .4byte gPlayerParty
_0811EC80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EC98 @ =gPlayerParty
	adds r0, r1
	ldrb r1, [r3]
	lsls r1, 9
	adds r2, 0x1
	adds r1, r2
	ldrb r1, [r1]
	adds r1, 0x8
	b _0811EFDA
	.align 2, 0
_0811EC98: .4byte gPlayerParty
_0811EC9C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ECA8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1
	b _0811ECB6
	.align 2, 0
_0811ECA8: .4byte gPlayerParty
_0811ECAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ECD8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x19
_0811ECB6:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	movs r6, 0x3
	b _0811EFE2
	.align 2, 0
_0811ECD8: .4byte gPlayerParty
_0811ECDC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ECE8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1A
	b _0811EFDA
	.align 2, 0
_0811ECE8: .4byte gPlayerParty
_0811ECEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ECF8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1B
	b _0811EFDA
	.align 2, 0
_0811ECF8: .4byte gPlayerParty
_0811ECFC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED08 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1C
	b _0811EFDA
	.align 2, 0
_0811ED08: .4byte gPlayerParty
_0811ED0C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED18 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1D
	b _0811EFDA
	.align 2, 0
_0811ED18: .4byte gPlayerParty
_0811ED1C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED28 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1E
	b _0811EFDA
	.align 2, 0
_0811ED28: .4byte gPlayerParty
_0811ED2C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED38 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x1F
	b _0811EFDA
	.align 2, 0
_0811ED38: .4byte gPlayerParty
_0811ED3C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED48 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x20
	b _0811EFDA
	.align 2, 0
_0811ED48: .4byte gPlayerParty
_0811ED4C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED58 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x22
	b _0811EFDA
	.align 2, 0
_0811ED58: .4byte gPlayerParty
_0811ED5C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED68 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x23
	b _0811EFDA
	.align 2, 0
_0811ED68: .4byte gPlayerParty
_0811ED6C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED78 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x24
	b _0811EFDA
	.align 2, 0
_0811ED78: .4byte gPlayerParty
_0811ED7C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED88 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x25
	b _0811EFDA
	.align 2, 0
_0811ED88: .4byte gPlayerParty
_0811ED8C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811ED98 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x26
	b _0811EFDA
	.align 2, 0
_0811ED98: .4byte gPlayerParty
_0811ED9C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811EDE8 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x27
	bl GetMonData
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x28
	bl GetMonData
	strb r0, [r7, 0x1]
	adds r0, r4, 0
	movs r1, 0x29
	bl GetMonData
	strb r0, [r7, 0x2]
	adds r0, r4, 0
	movs r1, 0x2A
	bl GetMonData
	strb r0, [r7, 0x3]
	adds r0, r4, 0
	movs r1, 0x2B
	bl GetMonData
	strb r0, [r7, 0x4]
	adds r0, r4, 0
	movs r1, 0x2C
	bl GetMonData
	strb r0, [r7, 0x5]
	movs r6, 0x6
	b _0811EFE2
	.align 2, 0
_0811EDE8: .4byte gPlayerParty
_0811EDEC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EDF8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x27
	b _0811EFDA
	.align 2, 0
_0811EDF8: .4byte gPlayerParty
_0811EDFC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE08 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x28
	b _0811EFDA
	.align 2, 0
_0811EE08: .4byte gPlayerParty
_0811EE0C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE18 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x29
	b _0811EFDA
	.align 2, 0
_0811EE18: .4byte gPlayerParty
_0811EE1C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE28 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2A
	b _0811EFDA
	.align 2, 0
_0811EE28: .4byte gPlayerParty
_0811EE2C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE38 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2B
	b _0811EFDA
	.align 2, 0
_0811EE38: .4byte gPlayerParty
_0811EE3C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE48 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2C
	b _0811EFDA
	.align 2, 0
_0811EE48: .4byte gPlayerParty
_0811EE4C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE58 @ =gPlayerParty
	adds r0, r1
	movs r1, 0
	b _0811EE76
	.align 2, 0
_0811EE58: .4byte gPlayerParty
_0811EE5C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE68 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x9
	b _0811EF1A
	.align 2, 0
_0811EE68: .4byte gPlayerParty
_0811EE6C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EE9C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x37
_0811EE76:
	bl GetMonData
	adds r1, r0, 0
	strb r1, [r7]
	movs r0, 0xFF
	lsls r0, 8
	ands r0, r1
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r0, 16
	strb r0, [r7, 0x2]
	lsrs r0, r1, 24
	strb r0, [r7, 0x3]
	movs r6, 0x4
	b _0811EFE2
	.align 2, 0
_0811EE9C: .4byte gPlayerParty
_0811EEA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EEAC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x38
	b _0811EFDA
	.align 2, 0
_0811EEAC: .4byte gPlayerParty
_0811EEB0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EEBC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x39
	b _0811EF1A
	.align 2, 0
_0811EEBC: .4byte gPlayerParty
_0811EEC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EECC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	b _0811EF1A
	.align 2, 0
_0811EECC: .4byte gPlayerParty
_0811EED0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EEDC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3B
	b _0811EF1A
	.align 2, 0
_0811EEDC: .4byte gPlayerParty
_0811EEE0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EEEC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3C
	b _0811EF1A
	.align 2, 0
_0811EEEC: .4byte gPlayerParty
_0811EEF0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EEFC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3D
	b _0811EF1A
	.align 2, 0
_0811EEFC: .4byte gPlayerParty
_0811EF00:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF0C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3E
	b _0811EF1A
	.align 2, 0
_0811EF0C: .4byte gPlayerParty
_0811EF10:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF2C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3F
_0811EF1A:
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	strb r0, [r7]
	lsrs r0, 8
	strb r0, [r7, 0x1]
	movs r6, 0x2
	b _0811EFE2
	.align 2, 0
_0811EF2C: .4byte gPlayerParty
_0811EF30:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF3C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	b _0811EFDA
	.align 2, 0
_0811EF3C: .4byte gPlayerParty
_0811EF40:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF4C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	b _0811EFDA
	.align 2, 0
_0811EF4C: .4byte gPlayerParty
_0811EF50:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF5C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	b _0811EFDA
	.align 2, 0
_0811EF5C: .4byte gPlayerParty
_0811EF60:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF6C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	b _0811EFDA
	.align 2, 0
_0811EF6C: .4byte gPlayerParty
_0811EF70:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF7C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	b _0811EFDA
	.align 2, 0
_0811EF7C: .4byte gPlayerParty
_0811EF80:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF8C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x30
	b _0811EFDA
	.align 2, 0
_0811EF8C: .4byte gPlayerParty
_0811EF90:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EF9C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x32
	b _0811EFDA
	.align 2, 0
_0811EF9C: .4byte gPlayerParty
_0811EFA0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFAC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x33
	b _0811EFDA
	.align 2, 0
_0811EFAC: .4byte gPlayerParty
_0811EFB0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFBC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x34
	b _0811EFDA
	.align 2, 0
_0811EFBC: .4byte gPlayerParty
_0811EFC0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFCC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x35
	b _0811EFDA
	.align 2, 0
_0811EFCC: .4byte gPlayerParty
_0811EFD0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811EFF4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x36
_0811EFDA:
	bl GetMonData
	strb r0, [r7]
	movs r6, 0x1
_0811EFE2:
	adds r0, r6, 0
	add sp, 0x90
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811EFF4: .4byte gPlayerParty
	thumb_func_end dp01_getattr_by_ch1_for_player_pokemon

	thumb_func_start sub_811EC04
sub_811EC04: @ 811EFF8
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811EC04

	thumb_func_start sub_811EC10
sub_811EC10: @ 811F004
	push {r4,r5,lr}
	ldr r1, _0811F028 @ =gUnknown_02023A60
	ldr r0, _0811F02C @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x2
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	bne _0811F034
	ldr r0, _0811F030 @ =gUnknown_02024A6A
	lsls r1, r2, 1
	adds r1, r0
	ldrb r0, [r1]
	bl sub_811EC68
	b _0811F052
	.align 2, 0
_0811F028: .4byte gUnknown_02023A60
_0811F02C: .4byte gUnknown_02024A60
_0811F030: .4byte gUnknown_02024A6A
_0811F034:
	ldrb r4, [r1]
	movs r5, 0
_0811F038:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _0811F046
	adds r0, r5, 0
	bl sub_811EC68
_0811F046:
	lsrs r4, 1
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0811F038
_0811F052:
	bl dp01_tbl3_exec_completed
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_811EC10

	thumb_func_start sub_811EC68
sub_811EC68: @ 811F05C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0811F094 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	ldr r2, _0811F098 @ =gUnknown_02023A63
	adds r3, r0, r2
	adds r6, r3, 0
	subs r1, r2, 0x2
	adds r0, r1
	ldrb r0, [r0]
	adds r7, r2, 0
	cmp r0, 0x3B
	bls _0811F088
	bl _0811FA22
_0811F088:
	lsls r0, 2
	ldr r1, _0811F09C @ =_0811F0A0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0811F094: .4byte gUnknown_02024A60
_0811F098: .4byte gUnknown_02023A63
_0811F09C: .4byte _0811F0A0
	.align 2, 0
_0811F0A0:
	.4byte _0811F190
	.4byte _0811F328
	.4byte _0811F348
	.4byte _0811F368
	.4byte _0811F3C0
	.4byte _0811F3C0
	.4byte _0811F3C0
	.4byte _0811F3C0
	.4byte _0811F3E8
	.4byte _0811F44C
	.4byte _0811F44C
	.4byte _0811F44C
	.4byte _0811F44C
	.4byte _0811FA22
	.4byte _0811FA22
	.4byte _0811FA22
	.4byte _0811FA22
	.4byte _0811F47C
	.4byte _0811F49C
	.4byte _0811F4BC
	.4byte _0811F4DC
	.4byte _0811F4FC
	.4byte _0811F51C
	.4byte _0811F53C
	.4byte _0811F55C
	.4byte _0811F57C
	.4byte _0811F59C
	.4byte _0811F5BC
	.4byte _0811F5DC
	.4byte _0811F5FC
	.4byte _0811F61C
	.4byte _0811F63C
	.4byte _0811F6AC
	.4byte _0811F6CC
	.4byte _0811F6EC
	.4byte _0811F70C
	.4byte _0811F72C
	.4byte _0811F74C
	.4byte _0811F76C
	.4byte _0811F78C
	.4byte _0811F7AC
	.4byte _0811F7CC
	.4byte _0811F7EC
	.4byte _0811F80C
	.4byte _0811F82C
	.4byte _0811F84C
	.4byte _0811F86C
	.4byte _0811F88C
	.4byte _0811F8AC
	.4byte _0811F8CC
	.4byte _0811F8EC
	.4byte _0811F90C
	.4byte _0811F92C
	.4byte _0811F94C
	.4byte _0811F96C
	.4byte _0811F98C
	.4byte _0811F9AC
	.4byte _0811F9CC
	.4byte _0811F9EC
	.4byte _0811FA0C
_0811F190:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F324 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	adds r2, r6, 0
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2E
	adds r0, r4, 0
	movs r1, 0xC
	bl SetMonData
	movs r0, 0
	mov r8, r0
	movs r0, 0x3B
	adds r0, r6
	mov r10, r0
	adds r0, r6, 0
	adds r0, 0x2B
	str r0, [sp, 0x20]
	adds r0, 0x19
	str r0, [sp, 0x28]
	adds r0, 0x4
	str r0, [sp, 0x2C]
	adds r0, 0x4
	str r0, [sp, 0x30]
	subs r0, 0x22
	str r0, [sp, 0x1C]
	subs r0, 0x2
	str r0, [sp, 0x18]
	adds r0, 0x4
	str r0, [sp, 0x24]
	adds r0, r6, 0x2
	str r0, [sp, 0x4]
	adds r0, r6, 0x4
	str r0, [sp, 0x8]
	adds r0, r6, 0x6
	str r0, [sp, 0xC]
	adds r0, 0x2
	str r0, [sp, 0x10]
	adds r0, 0x2
	str r0, [sp, 0x14]
	mov r9, r4
	adds r7, r6, 0
	adds r7, 0x24
	adds r4, r6, 0
	adds r4, 0xC
_0811F1F6:
	mov r1, r8
	adds r1, 0xD
	mov r0, r9
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	mov r0, r9
	adds r2, r7, 0
	bl SetMonData
	adds r7, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0811F1F6
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F324 @ =gPlayerParty
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x15
	mov r2, r10
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x20
	ldr r2, [sp, 0x20]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x19
	ldr r2, [sp, 0x28]
	bl SetMonData
	ldrb r0, [r6, 0x14]
	lsls r0, 27
	lsrs r0, 27
	mov r1, sp
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x27
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x14]
	lsls r0, 22
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x28
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x15]
	lsls r0, 25
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x29
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldr r0, [r6, 0x14]
	lsls r0, 12
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2A
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrh r0, [r6, 0x16]
	lsls r0, 23
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2B
	mov r2, sp
	bl SetMonData
	mov r1, sp
	ldrb r0, [r6, 0x17]
	lsls r0, 26
	lsrs r0, 27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0
	ldr r2, [sp, 0x2C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x37
	ldr r2, [sp, 0x30]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	ldr r2, [sp, 0x1C]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	ldr r2, [sp, 0x18]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	ldr r2, [sp, 0x24]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	ldr r2, [sp, 0x4]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	ldr r2, [sp, 0x8]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	ldr r2, [sp, 0xC]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	ldr r2, [sp, 0x10]
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	ldr r2, [sp, 0x14]
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F324: .4byte gPlayerParty
_0811F328:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F340 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F344 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xB
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F340: .4byte gPlayerParty
_0811F344: .4byte gUnknown_02024A60
_0811F348:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F360 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F364 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0xC
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F360: .4byte gPlayerParty
_0811F364: .4byte gUnknown_02024A60
_0811F368:
	movs r0, 0
	mov r8, r0
	movs r0, 0xC
	adds r0, r3
	mov r9, r0
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0811F3BC @ =gPlayerParty
	adds r7, r1, r0
	adds r6, r3, 0
	adds r6, 0x8
	adds r4, r3, 0
_0811F382:
	mov r1, r8
	adds r1, 0xD
	adds r0, r7, 0
	adds r2, r4, 0
	bl SetMonData
	mov r1, r8
	adds r1, 0x11
	adds r0, r7, 0
	adds r2, r6, 0
	bl SetMonData
	adds r6, 0x1
	adds r4, 0x2
	movs r0, 0x1
	add r8, r0
	mov r0, r8
	cmp r0, 0x3
	ble _0811F382
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3BC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F3BC: .4byte gPlayerParty
_0811F3C0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F3DC @ =gPlayerParty
	adds r0, r1
	ldr r3, _0811F3E0 @ =gUnknown_02023A60
	ldr r1, _0811F3E4 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x9
	b _0811F464
	.align 2, 0
_0811F3DC: .4byte gPlayerParty
_0811F3E0: .4byte gUnknown_02023A60
_0811F3E4: .4byte gUnknown_02024A60
_0811F3E8:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F444 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0811F448 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x11
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x12
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x13
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x14
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x15
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F444: .4byte gPlayerParty
_0811F448: .4byte gUnknown_02024A60
_0811F44C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F470 @ =gPlayerParty
	adds r0, r1
	ldr r3, _0811F474 @ =gUnknown_02023A60
	ldr r1, _0811F478 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r1, r3, 0x1
	adds r1, r2, r1
	ldrb r1, [r1]
	adds r1, 0x8
_0811F464:
	adds r3, 0x3
	adds r2, r3
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F470: .4byte gPlayerParty
_0811F474: .4byte gUnknown_02023A60
_0811F478: .4byte gUnknown_02024A60
_0811F47C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F494 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F498 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F494: .4byte gPlayerParty
_0811F498: .4byte gUnknown_02024A60
_0811F49C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4B4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F4B8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x19
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F4B4: .4byte gPlayerParty
_0811F4B8: .4byte gUnknown_02024A60
_0811F4BC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4D4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F4D8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1A
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F4D4: .4byte gPlayerParty
_0811F4D8: .4byte gUnknown_02024A60
_0811F4DC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F4F4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F4F8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1B
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F4F4: .4byte gPlayerParty
_0811F4F8: .4byte gUnknown_02024A60
_0811F4FC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F514 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F518 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1C
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F514: .4byte gPlayerParty
_0811F518: .4byte gUnknown_02024A60
_0811F51C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F534 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F538 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1D
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F534: .4byte gPlayerParty
_0811F538: .4byte gUnknown_02024A60
_0811F53C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F554 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F558 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1E
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F554: .4byte gPlayerParty
_0811F558: .4byte gUnknown_02024A60
_0811F55C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F574 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F578 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x1F
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F574: .4byte gPlayerParty
_0811F578: .4byte gUnknown_02024A60
_0811F57C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F594 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F598 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x20
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F594: .4byte gPlayerParty
_0811F598: .4byte gUnknown_02024A60
_0811F59C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5B4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F5B8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x22
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F5B4: .4byte gPlayerParty
_0811F5B8: .4byte gUnknown_02024A60
_0811F5BC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5D4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F5D8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x23
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F5D4: .4byte gPlayerParty
_0811F5D8: .4byte gUnknown_02024A60
_0811F5DC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F5F4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F5F8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x24
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F5F4: .4byte gPlayerParty
_0811F5F8: .4byte gUnknown_02024A60
_0811F5FC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F614 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F618 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x25
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F614: .4byte gPlayerParty
_0811F618: .4byte gUnknown_02024A60
_0811F61C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F634 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F638 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x26
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F634: .4byte gPlayerParty
_0811F638: .4byte gUnknown_02024A60
_0811F63C:
	movs r0, 0x64
	adds r4, r5, 0
	muls r4, r0
	ldr r0, _0811F6A4 @ =gPlayerParty
	adds r4, r0
	ldr r5, _0811F6A8 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r2, 9
	adds r2, r7
	adds r0, r4, 0
	movs r1, 0x27
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x1
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x28
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x2
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x29
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x3
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2A
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x4
	adds r2, r0
	adds r0, r4, 0
	movs r1, 0x2B
	bl SetMonData
	ldrb r2, [r5]
	lsls r2, 9
	adds r0, r7, 0x5
	adds r2, r0
	adds r0, r4, 0
	b _0811F75C
	.align 2, 0
_0811F6A4: .4byte gPlayerParty
_0811F6A8: .4byte gUnknown_02024A60
_0811F6AC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F6C4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F6C8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x27
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F6C4: .4byte gPlayerParty
_0811F6C8: .4byte gUnknown_02024A60
_0811F6CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F6E4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F6E8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x28
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F6E4: .4byte gPlayerParty
_0811F6E8: .4byte gUnknown_02024A60
_0811F6EC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F704 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F708 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x29
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F704: .4byte gPlayerParty
_0811F708: .4byte gUnknown_02024A60
_0811F70C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F724 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F728 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2A
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F724: .4byte gPlayerParty
_0811F728: .4byte gUnknown_02024A60
_0811F72C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F744 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F748 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2B
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F744: .4byte gPlayerParty
_0811F748: .4byte gUnknown_02024A60
_0811F74C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F764 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F768 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
_0811F75C:
	movs r1, 0x2C
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F764: .4byte gPlayerParty
_0811F768: .4byte gUnknown_02024A60
_0811F76C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F784 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F788 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F784: .4byte gPlayerParty
_0811F788: .4byte gUnknown_02024A60
_0811F78C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F7A4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F7A8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x9
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F7A4: .4byte gPlayerParty
_0811F7A8: .4byte gUnknown_02024A60
_0811F7AC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F7C4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F7C8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x37
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F7C4: .4byte gPlayerParty
_0811F7C8: .4byte gUnknown_02024A60
_0811F7CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F7E4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F7E8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x38
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F7E4: .4byte gPlayerParty
_0811F7E8: .4byte gUnknown_02024A60
_0811F7EC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F804 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F808 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x39
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F804: .4byte gPlayerParty
_0811F808: .4byte gUnknown_02024A60
_0811F80C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F824 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F828 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3A
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F824: .4byte gPlayerParty
_0811F828: .4byte gUnknown_02024A60
_0811F82C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F844 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F848 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3B
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F844: .4byte gPlayerParty
_0811F848: .4byte gUnknown_02024A60
_0811F84C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F864 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F868 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3C
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F864: .4byte gPlayerParty
_0811F868: .4byte gUnknown_02024A60
_0811F86C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F884 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F888 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3D
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F884: .4byte gPlayerParty
_0811F888: .4byte gUnknown_02024A60
_0811F88C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F8A4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F8A8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3E
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F8A4: .4byte gPlayerParty
_0811F8A8: .4byte gUnknown_02024A60
_0811F8AC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F8C4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F8C8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x3F
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F8C4: .4byte gPlayerParty
_0811F8C8: .4byte gUnknown_02024A60
_0811F8CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F8E4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F8E8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x16
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F8E4: .4byte gPlayerParty
_0811F8E8: .4byte gUnknown_02024A60
_0811F8EC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F904 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F908 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x17
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F904: .4byte gPlayerParty
_0811F908: .4byte gUnknown_02024A60
_0811F90C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F924 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F928 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x18
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F924: .4byte gPlayerParty
_0811F928: .4byte gUnknown_02024A60
_0811F92C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F944 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F948 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x21
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F944: .4byte gPlayerParty
_0811F948: .4byte gUnknown_02024A60
_0811F94C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F964 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F968 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x2F
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F964: .4byte gPlayerParty
_0811F968: .4byte gUnknown_02024A60
_0811F96C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F984 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F988 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x30
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F984: .4byte gPlayerParty
_0811F988: .4byte gUnknown_02024A60
_0811F98C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F9A4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F9A8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x32
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F9A4: .4byte gPlayerParty
_0811F9A8: .4byte gUnknown_02024A60
_0811F9AC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F9C4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F9C8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x33
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F9C4: .4byte gPlayerParty
_0811F9C8: .4byte gUnknown_02024A60
_0811F9CC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811F9E4 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811F9E8 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x34
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811F9E4: .4byte gPlayerParty
_0811F9E8: .4byte gUnknown_02024A60
_0811F9EC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811FA04 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811FA08 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x35
	bl SetMonData
	b _0811FA22
	.align 2, 0
_0811FA04: .4byte gPlayerParty
_0811FA08: .4byte gUnknown_02024A60
_0811FA0C:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0811FA4C @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811FA50 @ =gUnknown_02024A60
	ldrb r2, [r1]
	lsls r2, 9
	adds r2, r7
	movs r1, 0x36
	bl SetMonData
_0811FA22:
	ldr r2, _0811FA54 @ =gUnknown_02024A6A
	ldr r0, _0811FA50 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811FA4C @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811FA4C: .4byte gPlayerParty
_0811FA50: .4byte gUnknown_02024A60
_0811FA54: .4byte gUnknown_02024A6A
	thumb_func_end sub_811EC68

	thumb_func_start sub_811F664
sub_811F664: @ 811FA58
	push {r4-r7,lr}
	ldr r1, _0811FABC @ =gUnknown_02024A6A
	ldr r7, _0811FAC0 @ =gUnknown_02024A60
	ldrb r2, [r7]
	lsls r0, r2, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	adds r3, r1, 0
	muls r3, r0
	ldr r4, _0811FAC4 @ =gUnknown_02023A60
	lsls r2, 9
	adds r0, r4, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	ldr r1, _0811FAC8 @ =gPlayerParty
	adds r0, r1
	adds r5, r3, r0
	movs r3, 0
	adds r0, r4, 0x2
	adds r2, r0
	ldrb r2, [r2]
	cmp r3, r2
	bcs _0811FAB0
	adds r6, r4, 0
	adds r2, r7, 0
	adds r4, r0, 0
_0811FA8E:
	adds r1, r5, r3
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, 0x3
	adds r0, r3, r0
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r2]
	lsls r0, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r3, r0
	bcc _0811FA8E
_0811FAB0:
	bl dp01_tbl3_exec_completed
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811FABC: .4byte gUnknown_02024A6A
_0811FAC0: .4byte gUnknown_02024A60
_0811FAC4: .4byte gUnknown_02023A60
_0811FAC8: .4byte gPlayerParty
	thumb_func_end sub_811F664

	thumb_func_start sub_811F6D8
sub_811F6D8: @ 811FACC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0811FBC0 @ =gUnknown_02024A6A
	mov r8, r0
	ldr r6, _0811FBC4 @ =gUnknown_02024A60
	ldrb r1, [r6]
	lsls r0, r1, 1
	add r0, r8
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _0811FBC8 @ =gPlayerParty
	adds r0, r4
	bl sub_80318FC
	ldrb r0, [r6]
	lsls r0, 1
	add r0, r8
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811FBCC @ =gUnknown_02024E8C
	mov r8, r0
	ldrb r0, [r6]
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldrb r0, [r6]
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0811FBD0 @ =gUnknown_02024BE0
	ldrb r1, [r6]
	adds r1, r4
	strb r0, [r1]
	ldr r5, _0811FBD4 @ =gSprites
	ldrb r0, [r6]
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811FBD8 @ =0x0000ff10
	strh r1, [r0, 0x24]
	ldrb r2, [r6]
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x2E]
	ldrb r3, [r6]
	adds r0, r3, r4
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r2, [r6]
	adds r4, r2, r4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811FBDC @ =gUnknown_02024E84
	adds r2, r1
	ldrb r1, [r2]
	bl StartSpriteAnim
	ldr r1, _0811FBE0 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FBE4 @ =sub_811DDE8
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FBC0: .4byte gUnknown_02024A6A
_0811FBC4: .4byte gUnknown_02024A60
_0811FBC8: .4byte gPlayerParty
_0811FBCC: .4byte gUnknown_02024E8C
_0811FBD0: .4byte gUnknown_02024BE0
_0811FBD4: .4byte gSprites
_0811FBD8: .4byte 0x0000ff10
_0811FBDC: .4byte gUnknown_02024E84
_0811FBE0: .4byte gUnknown_03004330
_0811FBE4: .4byte sub_811DDE8
	thumb_func_end sub_811F6D8

	thumb_func_start sub_811F7F4
sub_811F7F4: @ 811FBE8
	push {r4-r6,lr}
	ldr r5, _0811FC40 @ =gUnknown_02024A60
	ldrb r0, [r5]
	ldr r4, _0811FC44 @ =gUnknown_02023A60
	lsls r1, r0, 9
	adds r6, r4, 0x2
	adds r1, r6
	ldrb r1, [r1]
	bl sub_8032AA8
	ldr r2, _0811FC48 @ =gUnknown_02024A6A
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r2
	lsls r0, 9
	adds r4, 0x1
	adds r0, r4
	ldrb r0, [r0]
	strh r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _0811FC4C @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r5]
	lsls r1, r0, 9
	adds r1, r6
	ldrb r1, [r1]
	bl sub_811F864
	ldr r1, _0811FC50 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FC54 @ =sub_811E1BC
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FC40: .4byte gUnknown_02024A60
_0811FC44: .4byte gUnknown_02023A60
_0811FC48: .4byte gUnknown_02024A6A
_0811FC4C: .4byte gPlayerParty
_0811FC50: .4byte gUnknown_03004330
_0811FC54: .4byte sub_811E1BC
	thumb_func_end sub_811F7F4

	thumb_func_start sub_811F864
sub_811F864: @ 811FC58
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	bl sub_8032AA8
	ldr r0, _0811FD9C @ =gUnknown_02024A6A
	lsls r2, r6, 1
	adds r2, r0
	ldr r0, _0811FDA0 @ =gUnknown_02023A60
	lsls r1, r6, 9
	adds r0, 0x1
	adds r1, r0
	ldrb r0, [r1]
	strh r0, [r2]
	ldrh r1, [r2]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811FDA4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	mov r8, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	ldr r0, _0811FDA8 @ =sub_80312F0
	bl object_new_hidden_with_callback
	ldr r1, _0811FDAC @ =gUnknown_0300434C
	mov r9, r1
	add r9, r6
	mov r1, r9
	strb r0, [r1]
	adds r0, r6, 0
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _0811FDB0 @ =gUnknown_02024E8C
	mov r10, r0
	adds r0, r6, 0
	movs r1, 0x2
	bl sub_8077ABC
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	bl sub_8077F68
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r10
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r4, _0811FDB4 @ =gUnknown_02024BE0
	adds r4, r6, r4
	strb r0, [r4]
	ldr r5, _0811FDB8 @ =gSprites
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r4]
	strh r1, [r0, 0x30]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r6, [r0, 0x2E]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	lsls r3, r6, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _0811FDBC @ =gUnknown_02024E84
	adds r6, r1
	ldrb r1, [r6]
	bl StartSpriteAnim
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _0811FDC0 @ =SpriteCallbackDummy
	str r1, [r0]
	movs r0, 0
	movs r1, 0xFF
	bl sub_8046400
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1, 0x2E]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FD9C: .4byte gUnknown_02024A6A
_0811FDA0: .4byte gUnknown_02023A60
_0811FDA4: .4byte gPlayerParty
_0811FDA8: .4byte sub_80312F0
_0811FDAC: .4byte gUnknown_0300434C
_0811FDB0: .4byte gUnknown_02024E8C
_0811FDB4: .4byte gUnknown_02024BE0
_0811FDB8: .4byte gSprites
_0811FDBC: .4byte gUnknown_02024E84
_0811FDC0: .4byte SpriteCallbackDummy
	thumb_func_end sub_811F864

	thumb_func_start sub_811F9D0
sub_811F9D0: @ 811FDC4
	push {r4-r6,lr}
	ldr r1, _0811FDF4 @ =gUnknown_02023A60
	ldr r6, _0811FDF8 @ =gUnknown_02024A60
	ldrb r2, [r6]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	cmp r3, 0
	bne _0811FE08
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r1, _0811FDFC @ =0x02017810
	adds r0, r1
	strb r3, [r0, 0x4]
	ldr r1, _0811FE00 @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FE04 @ =sub_811FA5C
	str r1, [r0]
	b _0811FE3E
	.align 2, 0
_0811FDF4: .4byte gUnknown_02023A60
_0811FDF8: .4byte gUnknown_02024A60
_0811FDFC: .4byte 0x02017810
_0811FE00: .4byte gUnknown_03004330
_0811FE04: .4byte sub_811FA5C
_0811FE08:
	ldr r5, _0811FE44 @ =gUnknown_02024BE0
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _0811FE48 @ =gSprites
	adds r0, r4
	bl FreeSpriteOamMatrix
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl DestroySprite
	ldr r1, _0811FE4C @ =gUnknown_03004340
	ldrb r0, [r6]
	adds r0, r1
	ldrb r0, [r0]
	bl sub_8043DB0
	bl dp01_tbl3_exec_completed
_0811FE3E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FE44: .4byte gUnknown_02024BE0
_0811FE48: .4byte gSprites
_0811FE4C: .4byte gUnknown_03004340
	thumb_func_end sub_811F9D0

	thumb_func_start sub_811FA5C
sub_811FA5C: @ 811FE50
	push {r4,r5,lr}
	ldr r5, _0811FE6C @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _0811FE70 @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _0811FE74
	cmp r0, 0x1
	beq _0811FEA0
	b _0811FEC8
	.align 2, 0
_0811FE6C: .4byte gUnknown_02024A60
_0811FE70: .4byte 0x02017810
_0811FE74:
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0811FE90
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0811FE90:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _0811FEC8
_0811FEA0:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _0811FEC8
	strb r0, [r3, 0x4]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x1
	bl move_anim_start_t4
	ldr r1, _0811FED0 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0811FED4 @ =sub_811DF34
	str r1, [r0]
_0811FEC8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811FED0: .4byte gUnknown_03004330
_0811FED4: .4byte sub_811DF34
	thumb_func_end sub_811FA5C

	thumb_func_start sub_811FAE4
sub_811FAE4: @ 811FED8
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _0811FF08 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0811FF18
	ldr r6, _0811FF0C @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl battle_get_per_side_status
	movs r1, 0x2
	ands r1, r0
	ldr r5, _0811FF10 @ =0x0000fff0
	cmp r1, 0
	beq _0811FEFE
	movs r5, 0x10
_0811FEFE:
	ldr r4, _0811FF14 @ =gLinkPlayers
	ldrb r0, [r6]
	bl sub_803FC34
	b _0811FF28
	.align 2, 0
_0811FF08: .4byte gUnknown_020239F8
_0811FF0C: .4byte gUnknown_02024A60
_0811FF10: .4byte 0x0000fff0
_0811FF14: .4byte gLinkPlayers
_0811FF18:
	movs r5, 0
	ldr r4, _0811FFFC @ =gLinkPlayers
	bl GetMultiplayerId
	movs r1, 0x1
	eors r0, r1
	lsls r0, 24
	lsrs r0, 24
_0811FF28:
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r4, [r1, 0x13]
	ldr r6, _08120000 @ =gUnknown_02024A60
	ldrb r1, [r6]
	adds r0, r4, 0
	bl sub_8031AF4
	ldrb r0, [r6]
	bl battle_get_per_side_status
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl GetMonSpriteTemplate_803C5A0
	ldr r0, _08120004 @ =gUnknown_02024E8C
	mov r8, r0
	lsls r5, 16
	movs r0, 0xA0
	lsls r0, 15
	adds r5, r0
	asrs r5, 16
	ldr r0, _08120008 @ =gTrainerBackPicCoords
	lsls r4, 2
	adds r4, r0
	ldrb r0, [r4]
	movs r4, 0x8
	subs r4, r0
	lsls r4, 18
	movs r0, 0xA0
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	ldrb r0, [r6]
	bl sub_8079E90
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl CreateSprite
	ldr r5, _0812000C @ =gUnknown_02024BE0
	ldrb r1, [r6]
	adds r1, r5
	strb r0, [r1]
	ldr r4, _08120010 @ =gSprites
	ldrb r3, [r6]
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	lsls r3, 4
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	movs r1, 0xF0
	strh r1, [r0, 0x24]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _08120014 @ =0x0000fffe
	strh r1, [r0, 0x2E]
	ldrb r0, [r6]
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, 0x1C
	adds r0, r4
	ldr r1, _08120018 @ =sub_80313A0
	str r1, [r0]
	ldr r1, _0812001C @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120020 @ =sub_811DAE4
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811FFFC: .4byte gLinkPlayers
_08120000: .4byte gUnknown_02024A60
_08120004: .4byte gUnknown_02024E8C
_08120008: .4byte gTrainerBackPicCoords
_0812000C: .4byte gUnknown_02024BE0
_08120010: .4byte gSprites
_08120014: .4byte 0x0000fffe
_08120018: .4byte sub_80313A0
_0812001C: .4byte gUnknown_03004330
_08120020: .4byte sub_811DAE4
	thumb_func_end sub_811FAE4

	thumb_func_start sub_811FC30
sub_811FC30: @ 8120024
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FC30

	thumb_func_start sub_811FC3C
sub_811FC3C: @ 8120030
	push {r4-r6,lr}
	ldr r6, _081200BC @ =gUnknown_02024BE0
	ldr r4, _081200C0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _081200C4 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x23
	strh r1, [r0, 0x2E]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081200C8 @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _081200CC @ =sub_8078B34
	str r1, [r0]
	ldrb r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _081200D0 @ =SpriteCallbackDummy
	bl oamt_set_x3A_32
	ldr r1, _081200D4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081200D8 @ =sub_811DB1C
	str r1, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081200BC: .4byte gUnknown_02024BE0
_081200C0: .4byte gUnknown_02024A60
_081200C4: .4byte gSprites
_081200C8: .4byte 0x0000ffd8
_081200CC: .4byte sub_8078B34
_081200D0: .4byte SpriteCallbackDummy
_081200D4: .4byte gUnknown_03004330
_081200D8: .4byte sub_811DB1C
	thumb_func_end sub_811FC3C

	thumb_func_start sub_811FCE8
sub_811FCE8: @ 81200DC
	push {r4,r5,lr}
	ldr r5, _08120120 @ =gUnknown_02024A60
	ldrb r2, [r5]
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	ldr r4, _08120124 @ =0x02017810
	adds r3, r0, r4
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	bne _08120128
	lsls r0, r2, 2
	adds r1, r4, 0
	subs r1, 0x10
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0812010E
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_0812010E:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r0, [r1, 0x4]
	adds r0, 0x1
	strb r0, [r1, 0x4]
	b _0812019E
	.align 2, 0
_08120120: .4byte gUnknown_02024A60
_08120124: .4byte 0x02017810
_08120128:
	ldrb r1, [r3]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0812019E
	strb r4, [r3, 0x4]
	ldr r2, _081201A4 @ =gUnknown_02024A6A
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r2
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _081201A8 @ =gPlayerParty
	adds r0, r2
	bl sub_80324F8
	movs r1, 0x40
	negs r1, r1
	movs r0, 0x10
	bl PlaySE12WithPanning
	ldr r2, _081201AC @ =gSprites
	ldr r3, _081201B0 @ =gUnknown_02024BE0
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r4, [r0, 0x30]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x5
	strh r1, [r0, 0x32]
	ldrb r0, [r5]
	adds r0, r3
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _081201B4 @ =sub_80105EC
	str r1, [r0]
	ldr r1, _081201B8 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081201BC @ =sub_811DE98
	str r1, [r0]
_0812019E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081201A4: .4byte gUnknown_02024A6A
_081201A8: .4byte gPlayerParty
_081201AC: .4byte gSprites
_081201B0: .4byte gUnknown_02024BE0
_081201B4: .4byte sub_80105EC
_081201B8: .4byte gUnknown_03004330
_081201BC: .4byte sub_811DE98
	thumb_func_end sub_811FCE8

	thumb_func_start sub_811FDCC
sub_811FDCC: @ 81201C0
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDCC

	thumb_func_start sub_811FDD8
sub_811FDD8: @ 81201CC
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDD8

	thumb_func_start sub_811FDE4
sub_811FDE4: @ 81201D8
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDE4

	thumb_func_start sub_811FDF0
sub_811FDF0: @ 81201E4
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_811FDF0

	thumb_func_start sub_811FDFC
sub_811FDFC: @ 81201F0
	push {r4-r6,lr}
	ldr r6, _081202D4 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	beq _08120202
	b _08120312
_08120202:
	ldr r0, _081202D8 @ =gUnknown_02023A60
	mov r12, r0
	ldrb r2, [r6]
	lsls r2, 9
	adds r0, 0x1
	adds r0, r2, r0
	ldrb r0, [r0]
	mov r1, r12
	adds r1, 0x2
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	ldr r5, _081202DC @ =gUnknown_0202F7C4
	mov r1, r12
	adds r1, 0x3
	adds r2, r1
	ldrb r1, [r2]
	strb r1, [r5]
	ldr r4, _081202E0 @ =gUnknown_0202F7BC
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x4
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x5
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r4, _081202E4 @ =gUnknown_0202F7B8
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x6
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0x7
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 8
	orrs r3, r1
	mov r1, r12
	adds r1, 0x8
	adds r1, r2, r1
	ldrb r1, [r1]
	lsls r1, 16
	orrs r3, r1
	mov r1, r12
	adds r1, 0x9
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 24
	orrs r3, r1
	str r3, [r4]
	ldr r3, _081202E8 @ =gUnknown_0202F7BE
	ldrb r1, [r6]
	lsls r1, 9
	mov r2, r12
	adds r2, 0xA
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r3]
	ldr r4, _081202EC @ =gUnknown_0202F7C0
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0xC
	adds r1, r2, r1
	ldrb r3, [r1]
	mov r1, r12
	adds r1, 0xD
	adds r2, r1
	ldrb r1, [r2]
	lsls r1, 8
	orrs r3, r1
	strh r3, [r4]
	ldr r3, _081202F0 @ =gUnknown_0202F7B4
	ldrb r2, [r6]
	lsls r2, 9
	mov r1, r12
	adds r1, 0x10
	adds r2, r1
	str r2, [r3]
	ldr r3, _081202F4 @ =gUnknown_02024E70
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r3
	ldr r2, [r2]
	str r2, [r1]
	ldrb r1, [r5]
	bl sub_8031720
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _081202F8
	bl dp01_tbl3_exec_completed
	b _08120312
	.align 2, 0
_081202D4: .4byte gUnknown_02024A60
_081202D8: .4byte gUnknown_02023A60
_081202DC: .4byte gUnknown_0202F7C4
_081202E0: .4byte gUnknown_0202F7BC
_081202E4: .4byte gUnknown_0202F7B8
_081202E8: .4byte gUnknown_0202F7BE
_081202EC: .4byte gUnknown_0202F7C0
_081202F0: .4byte gUnknown_0202F7B4
_081202F4: .4byte gUnknown_02024E70
_081202F8:
	ldrb r1, [r6]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08120318 @ =0x02017810
	adds r0, r1
	strb r2, [r0, 0x4]
	ldr r1, _0812031C @ =gUnknown_03004330
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120320 @ =sub_811FF30
	str r1, [r0]
_08120312:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120318: .4byte 0x02017810
_0812031C: .4byte gUnknown_03004330
_08120320: .4byte sub_811FF30
	thumb_func_end sub_811FDFC

	thumb_func_start sub_811FF30
sub_811FF30: @ 8120324
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r2, _08120368 @ =gUnknown_02023A60
	ldr r5, _0812036C @ =gUnknown_02024A60
	ldrb r3, [r5]
	lsls r1, r3, 9
	adds r0, r2, 0x1
	mov r9, r0
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r6, r2, 0x2
	mov r8, r6
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 8
	orrs r4, r0
	adds r2, 0xB
	adds r1, r2
	ldrb r7, [r1]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r6, _08120370 @ =0x02017810
	adds r0, r6
	ldrb r2, [r0, 0x4]
	cmp r2, 0x1
	beq _081203B2
	cmp r2, 0x1
	bgt _08120374
	cmp r2, 0
	beq _0812037E
	b _0812047C
	.align 2, 0
_08120368: .4byte gUnknown_02023A60
_0812036C: .4byte gUnknown_02024A60
_08120370: .4byte 0x02017810
_08120374:
	cmp r2, 0x2
	beq _081203D8
	cmp r2, 0x3
	beq _08120444
	b _0812047C
_0812037E:
	lsls r1, r3, 2
	adds r0, r6, 0
	subs r0, 0x10
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0xC
	ands r0, r2
	cmp r0, 0x4
	bne _081203A2
	movs r0, 0x8
	orrs r0, r2
	strb r0, [r1]
	ldrb r2, [r5]
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x5
	bl move_anim_start_t4
_081203A2:
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	strb r0, [r1, 0x4]
	b _0812047C
_081203B2:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _0812047C
	movs r0, 0
	bl sub_80326EC
	adds r0, r4, 0
	bl move_anim_start_t1
	ldrb r0, [r5]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x2
	strb r0, [r1, 0x4]
	b _0812047C
_081203D8:
	ldr r0, _08120434 @ =gUnknown_0202F7AC
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _08120438 @ =gUnknown_0202F7B1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0812047C
	movs r0, 0x1
	bl sub_80326EC
	ldrb r2, [r5]
	lsls r0, r2, 2
	adds r4, r6, 0
	subs r4, 0x10
	adds r0, r4
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08120420
	cmp r7, 0x1
	bhi _08120420
	adds r0, r2, 0
	adds r1, r2, 0
	movs r3, 0x6
	bl move_anim_start_t4
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r4
	ldrb r2, [r0]
	movs r1, 0x9
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
_08120420:
	ldr r0, _0812043C @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _08120440 @ =0x02017810
	adds r0, r1
	movs r1, 0x3
	strb r1, [r0, 0x4]
	b _0812047C
	.align 2, 0
_08120434: .4byte gUnknown_0202F7AC
_08120438: .4byte gUnknown_0202F7B1
_0812043C: .4byte gUnknown_02024A60
_08120440: .4byte 0x02017810
_08120444:
	ldrb r1, [r0]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0812047C
	bl sub_8031F24
	ldrb r0, [r5]
	lsls r2, r0, 9
	mov r3, r9
	adds r1, r2, r3
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	bl sub_80324BC
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r4, [r0, 0x4]
	bl dp01_tbl3_exec_completed
_0812047C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811FF30

	thumb_func_start sub_8120094
sub_8120094: @ 8120488
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _081204CC @ =gUnknown_030042A4
	movs r1, 0
	strh r1, [r0]
	ldr r0, _081204D0 @ =gUnknown_030042A0
	strh r1, [r0]
	ldr r4, _081204D4 @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	ldr r1, _081204D8 @ =gUnknown_02023A62
	adds r0, r1
	ldrh r0, [r0]
	bl sub_8120AA8
	ldr r0, _081204DC @ =gUnknown_03004210
	ldr r1, _081204E0 @ =gUnknown_020238CC
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x90
	movs r3, 0x2
	bl sub_8002EB0
	ldr r1, _081204E4 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081204E8 @ =sub_811DFA0
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081204CC: .4byte gUnknown_030042A4
_081204D0: .4byte gUnknown_030042A0
_081204D4: .4byte gUnknown_02024A60
_081204D8: .4byte gUnknown_02023A62
_081204DC: .4byte gUnknown_03004210
_081204E0: .4byte gUnknown_020238CC
_081204E4: .4byte gUnknown_03004330
_081204E8: .4byte sub_811DFA0
	thumb_func_end sub_8120094

	thumb_func_start sub_81200F8
sub_81200F8: @ 81204EC
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_81200F8

	thumb_func_start sub_8120104
sub_8120104: @ 81204F8
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120104

	thumb_func_start sub_8120110
sub_8120110: @ 8120504
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120110

	thumb_func_start sub_812011C
sub_812011C: @ 8120510
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812011C

	thumb_func_start sub_8120128
sub_8120128: @ 812051C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120128

	thumb_func_start sub_8120134
sub_8120134: @ 8120528
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120134

	thumb_func_start sub_8120140
sub_8120140: @ 8120534
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120140

	thumb_func_start sub_812014C
sub_812014C: @ 8120540
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	movs r0, 0
	bl load_gfxc_health_bar
	ldr r3, _081205B8 @ =gUnknown_02023A60
	ldr r0, _081205BC @ =gUnknown_02024A60
	mov r9, r0
	ldrb r4, [r0]
	lsls r2, r4, 9
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	adds r3, 0x3
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 8
	orrs r1, r0
	lsls r1, 16
	asrs r7, r1, 16
	ldr r0, _081205C0 @ =0x00007fff
	cmp r7, r0
	beq _081205D0
	ldr r6, _081205C4 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r6
	ldrh r0, [r0]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _081205C8 @ =gPlayerParty
	adds r0, r4
	movs r1, 0x3A
	bl GetMonData
	mov r8, r0
	mov r1, r9
	ldrb r0, [r1]
	lsls r0, 1
	adds r0, r6
	ldrh r0, [r0]
	muls r0, r5
	adds r0, r4
	movs r1, 0x39
	bl GetMonData
	adds r3, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _081205CC @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	mov r2, r8
	bl sub_8043D84
	b _081205FA
	.align 2, 0
_081205B8: .4byte gUnknown_02023A60
_081205BC: .4byte gUnknown_02024A60
_081205C0: .4byte 0x00007fff
_081205C4: .4byte gUnknown_02024A6A
_081205C8: .4byte gPlayerParty
_081205CC: .4byte gUnknown_03004340
_081205D0:
	ldr r1, _08120618 @ =gUnknown_02024A6A
	lsls r0, r4, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0812061C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x3A
	bl GetMonData
	adds r2, r0, 0
	mov r1, r9
	ldrb r0, [r1]
	ldr r1, _08120620 @ =gUnknown_03004340
	adds r1, r0, r1
	ldrb r1, [r1]
	str r7, [sp]
	movs r3, 0
	bl sub_8043D84
_081205FA:
	ldr r1, _08120624 @ =gUnknown_03004330
	ldr r0, _08120628 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, _0812062C @ =bx_t3_healthbar_update
	str r1, [r0]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120618: .4byte gUnknown_02024A6A
_0812061C: .4byte gPlayerParty
_08120620: .4byte gUnknown_03004340
_08120624: .4byte gUnknown_03004330
_08120628: .4byte gUnknown_02024A60
_0812062C: .4byte bx_t3_healthbar_update
	thumb_func_end sub_812014C

	thumb_func_start sub_812023C
sub_812023C: @ 8120630
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812023C

	thumb_func_start sub_8120248
sub_8120248: @ 812063C
	push {r4,lr}
	ldr r4, _08120694 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _0812068C
	ldr r0, _08120698 @ =gUnknown_03004340
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	ldr r2, _0812069C @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r2
	ldrh r2, [r1]
	movs r1, 0x64
	muls r1, r2
	ldr r2, _081206A0 @ =gPlayerParty
	adds r1, r2
	movs r2, 0x9
	bl sub_8045A5C
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _081206A4 @ =0x02017810
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	ldr r1, _081206A8 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _081206AC @ =sub_811E38C
	str r1, [r0]
_0812068C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120694: .4byte gUnknown_02024A60
_08120698: .4byte gUnknown_03004340
_0812069C: .4byte gUnknown_02024A6A
_081206A0: .4byte gPlayerParty
_081206A4: .4byte 0x02017810
_081206A8: .4byte gUnknown_03004330
_081206AC: .4byte sub_811E38C
	thumb_func_end sub_8120248

	thumb_func_start sub_81202BC
sub_81202BC: @ 81206B0
	push {r4,r5,lr}
	ldr r5, _08120708 @ =gUnknown_02024A60
	ldrb r0, [r5]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120700
	ldr r4, _0812070C @ =gUnknown_02023A60
	ldrb r3, [r5]
	lsls r3, 9
	adds r0, r4, 0x1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0x2
	adds r1, r3, r1
	ldrb r1, [r1]
	adds r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 8
	orrs r1, r2
	adds r2, r4, 0x4
	adds r2, r3, r2
	ldrb r2, [r2]
	lsls r2, 16
	orrs r1, r2
	adds r4, 0x5
	adds r3, r4
	ldrb r2, [r3]
	lsls r2, 24
	orrs r1, r2
	bl move_anim_start_t2_for_situation
	ldr r1, _08120710 @ =gUnknown_03004330
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120714 @ =sub_811E38C
	str r1, [r0]
_08120700:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08120708: .4byte gUnknown_02024A60
_0812070C: .4byte gUnknown_02023A60
_08120710: .4byte gUnknown_03004330
_08120714: .4byte sub_811E38C
	thumb_func_end sub_81202BC

	thumb_func_start sub_8120324
sub_8120324: @ 8120718
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120324

	thumb_func_start sub_8120330
sub_8120330: @ 8120724
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120330

	thumb_func_start sub_812033C
sub_812033C: @ 8120730
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812033C

	thumb_func_start sub_8120348
sub_8120348: @ 812073C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120348

	thumb_func_start sub_8120354
sub_8120354: @ 8120748
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120354

	thumb_func_start sub_8120360
sub_8120360: @ 8120754
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120360

	thumb_func_start sub_812036C
sub_812036C: @ 8120760
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812036C

	thumb_func_start sub_8120378
sub_8120378: @ 812076C
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120378

	thumb_func_start sub_8120384
sub_8120384: @ 8120778
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120384

	thumb_func_start sub_8120390
sub_8120390: @ 8120784
	push {lr}
	ldr r2, _0812079C @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x80
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812079C: .4byte gUnknown_020238C8
	thumb_func_end sub_8120390

	thumb_func_start sub_81203AC
sub_81203AC: @ 81207A0
	push {lr}
	ldr r3, _081207CC @ =gUnknown_020238C8
	ldr r1, _081207D0 @ =gUnknown_02023A60
	ldr r0, _081207D4 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0x7F
	ands r1, r0
	ldrb r2, [r3]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081207CC: .4byte gUnknown_020238C8
_081207D0: .4byte gUnknown_02023A60
_081207D4: .4byte gUnknown_02024A60
	thumb_func_end sub_81203AC

	thumb_func_start sub_81203E4
sub_81203E4: @ 81207D8
	push {lr}
	ldr r2, _081207EC @ =gUnknown_020238C8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_081207EC: .4byte gUnknown_020238C8
	thumb_func_end sub_81203E4

	thumb_func_start sub_81203FC
sub_81203FC: @ 81207F0
	push {lr}
	ldr r3, _08120814 @ =gUnknown_020238C8
	ldr r1, [r3]
	lsls r1, 24
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 7
	ldrb r2, [r3]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120814: .4byte gUnknown_020238C8
	thumb_func_end sub_81203FC

	thumb_func_start dp01t_29_3_blink
dp01t_29_3_blink: @ 8120818
	push {r4,lr}
	ldr r3, _08120840 @ =gSprites
	ldr r2, _08120844 @ =gUnknown_02024BE0
	ldr r4, _08120848 @ =gUnknown_02024A60
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0812084C
	bl dp01_tbl3_exec_completed
	b _08120876
	.align 2, 0
_08120840: .4byte gSprites
_08120844: .4byte gUnknown_02024BE0
_08120848: .4byte gUnknown_02024A60
_0812084C:
	ldr r1, _0812087C @ =gUnknown_02024E6D
	movs r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, r2
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x30]
	ldrb r0, [r4]
	bl sub_8047858
	ldr r1, _08120880 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120884 @ =bx_blink_t3
	str r1, [r0]
_08120876:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812087C: .4byte gUnknown_02024E6D
_08120880: .4byte gUnknown_03004330
_08120884: .4byte bx_blink_t3
	thumb_func_end dp01t_29_3_blink

	thumb_func_start sub_8120494
sub_8120494: @ 8120888
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120494

	thumb_func_start sub_81204A0
sub_81204A0: @ 8120894
	push {r4,lr}
	ldr r4, _081208D0 @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl battle_side_get_owner
	lsls r0, 24
	movs r3, 0x3F
	cmp r0, 0
	bne _081208A8
	movs r3, 0xC0
_081208A8:
	ldr r2, _081208D4 @ =gUnknown_02023A60
	ldrb r1, [r4]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	lsls r1, r3, 24
	asrs r1, 24
	bl PlaySE12WithPanning
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081208D0: .4byte gUnknown_02024A60
_081208D4: .4byte gUnknown_02023A60
	thumb_func_end sub_81204A0

	thumb_func_start sub_81204E4
sub_81204E4: @ 81208D8
	push {lr}
	ldr r2, _08120900 @ =gUnknown_02023A60
	ldr r0, _08120904 @ =gUnknown_02024A60
	ldrb r1, [r0]
	lsls r1, 9
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, 0x2
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 8
	orrs r0, r1
	bl PlayFanfare
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120900: .4byte gUnknown_02023A60
_08120904: .4byte gUnknown_02024A60
	thumb_func_end sub_81204E4

	thumb_func_start sub_8120514
sub_8120514: @ 8120908
	push {lr}
	ldr r1, _0812093C @ =gUnknown_02024A6A
	ldr r0, _08120940 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _08120944 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	negs r1, r1
	movs r2, 0x5
	bl PlayCry3
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_0812093C: .4byte gUnknown_02024A6A
_08120940: .4byte gUnknown_02024A60
_08120944: .4byte gPlayerParty
	thumb_func_end sub_8120514

	thumb_func_start dp01t_2E_3_battle_intro
dp01t_2E_3_battle_intro: @ 8120948
	push {lr}
	ldr r1, _08120970 @ =gUnknown_02023A60
	ldr r0, _08120974 @ =gUnknown_02024A60
	ldrb r0, [r0]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	bl sub_80E43C0
	ldr r2, _08120978 @ =gUnknown_02024DE8
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120970: .4byte gUnknown_02023A60
_08120974: .4byte gUnknown_02024A60
_08120978: .4byte gUnknown_02024DE8
	thumb_func_end dp01t_2E_3_battle_intro

	thumb_func_start sub_8120588
sub_8120588: @ 812097C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _08120AD0 @ =gUnknown_02024BE0
	ldr r7, _08120AD4 @ =gUnknown_02024A60
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _08120AD8 @ =gSprites
	adds r0, r5
	bl oamt_add_pos2_onto_pos1
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x32
	strh r1, [r0, 0x2E]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08120ADC @ =0x0000ffd8
	strh r1, [r0, 0x32]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrh r1, [r0, 0x22]
	strh r1, [r0, 0x36]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r5, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _08120AE0 @ =sub_8078B34
	str r1, [r0]
	ldrb r2, [r7]
	adds r0, r2, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	strh r2, [r0, 0x38]
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldr r1, _08120AE4 @ =sub_8030E38
	bl oamt_set_x3A_32
	ldrb r0, [r7]
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r0, _08120AE8 @ =0x0000d6f9
	bl AllocSpritePalette
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08120AEC @ =gTrainerBackPicPaletteTable
	mov r8, r0
	ldrb r0, [r7]
	bl sub_803FC34
	ldr r2, _08120AF0 @ =gLinkPlayers
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x13]
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	lsls r4, 4
	movs r2, 0x80
	lsls r2, 1
	adds r1, r4, r2
	movs r2, 0x20
	bl LoadCompressedPalette
	ldrb r0, [r7]
	adds r0, r6
	ldrb r0, [r0]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, 0x5]
	ldr r0, _08120AF4 @ =sub_812071C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08120AF8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r7]
	strh r0, [r1, 0x8]
	ldrb r3, [r7]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r2, _08120AFC @ =0x02017810
	adds r0, r2
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120AAE
	ldr r0, _08120B00 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r4
	ldr r1, _08120B04 @ =sub_8044CA0
	str r1, [r0]
_08120AAE:
	adds r2, 0x30
	ldrb r0, [r2, 0x9]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, _08120B08 @ =gUnknown_03004330
	ldrb r0, [r7]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120B0C @ =nullsub_74
	str r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120AD0: .4byte gUnknown_02024BE0
_08120AD4: .4byte gUnknown_02024A60
_08120AD8: .4byte gSprites
_08120ADC: .4byte 0x0000ffd8
_08120AE0: .4byte sub_8078B34
_08120AE4: .4byte sub_8030E38
_08120AE8: .4byte 0x0000d6f9
_08120AEC: .4byte gTrainerBackPicPaletteTable
_08120AF0: .4byte gLinkPlayers
_08120AF4: .4byte sub_812071C
_08120AF8: .4byte gTasks
_08120AFC: .4byte 0x02017810
_08120B00: .4byte gUnknown_02024E68
_08120B04: .4byte sub_8044CA0
_08120B08: .4byte gUnknown_03004330
_08120B0C: .4byte nullsub_74
	thumb_func_end sub_8120588

	thumb_func_start sub_812071C
sub_812071C: @ 8120B10
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _08120B38 @ =gTasks
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0xA]
	movs r3, 0xA
	ldrsh r0, [r1, r3]
	cmp r0, 0x17
	bgt _08120B3C
	adds r0, r2, 0x1
	strh r0, [r1, 0xA]
	b _08120BF8
	.align 2, 0
_08120B38: .4byte gTasks
_08120B3C:
	ldr r7, _08120B7C @ =gUnknown_02024A60
	ldrb r0, [r7]
	mov r9, r0
	ldrh r0, [r1, 0x8]
	strb r0, [r7]
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	beq _08120B5C
	ldr r0, _08120B80 @ =gUnknown_020239F8
	ldrh r1, [r0]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08120B8C
_08120B5C:
	ldr r0, _08120B84 @ =gUnknown_02023A60
	ldrb r1, [r7]
	lsls r2, r1, 9
	adds r0, 0x1
	adds r2, r0
	ldr r0, _08120B88 @ =gUnknown_02024A6A
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	strb r0, [r2]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	b _08120BE0
	.align 2, 0
_08120B7C: .4byte gUnknown_02024A60
_08120B80: .4byte gUnknown_020239F8
_08120B84: .4byte gUnknown_02023A60
_08120B88: .4byte gUnknown_02024A6A
_08120B8C:
	ldr r4, _08120C04 @ =gUnknown_02023A60
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r4, 0x1
	adds r1, r4
	ldr r5, _08120C08 @ =gUnknown_02024A6A
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	movs r6, 0x2
	eors r0, r6
	strb r0, [r7]
	ldrb r0, [r7]
	lsls r1, r0, 9
	adds r1, r4
	lsls r0, 1
	adds r0, r5
	ldrh r0, [r0]
	strb r0, [r1]
	ldrb r1, [r7]
	lsls r0, r1, 1
	adds r0, r5
	ldrh r2, [r0]
	movs r0, 0x64
	muls r0, r2
	ldr r2, _08120C0C @ =gPlayerParty
	adds r0, r2
	bl sub_80318FC
	ldrb r0, [r7]
	movs r1, 0
	bl sub_811F864
	ldrb r0, [r7]
	eors r0, r6
	strb r0, [r7]
_08120BE0:
	ldr r1, _08120C10 @ =gUnknown_03004330
	ldr r2, _08120C14 @ =gUnknown_02024A60
	ldrb r0, [r2]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120C18 @ =sub_811DCA0
	str r1, [r0]
	mov r3, r9
	strb r3, [r2]
	mov r0, r8
	bl DestroyTask
_08120BF8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08120C04: .4byte gUnknown_02023A60
_08120C08: .4byte gUnknown_02024A6A
_08120C0C: .4byte gPlayerParty
_08120C10: .4byte gUnknown_03004330
_08120C14: .4byte gUnknown_02024A60
_08120C18: .4byte sub_811DCA0
	thumb_func_end sub_812071C

	thumb_func_start dp01t_30_3_80EB11C
dp01t_30_3_80EB11C: @ 8120C1C
	push {r4-r6,lr}
	ldr r1, _08120C44 @ =gUnknown_02023A60
	ldr r0, _08120C48 @ =gUnknown_02024A60
	ldrb r2, [r0]
	lsls r0, r2, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _08120C4C
	adds r0, r2, 0
	bl battle_side_get_owner
	lsls r0, 24
	cmp r0, 0
	bne _08120C4C
	bl dp01_tbl3_exec_completed
	b _08120CB4
	.align 2, 0
_08120C44: .4byte gUnknown_02023A60
_08120C48: .4byte gUnknown_02024A60
_08120C4C:
	ldr r5, _08120CBC @ =gUnknown_02024A60
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r6, _08120CC0 @ =0x02017810
	adds r0, r6
	ldrb r1, [r0]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r5]
	lsls r3, r0, 9
	ldr r4, _08120CC4 @ =gUnknown_02023A64
	adds r1, r3, r4
	subs r2, r4, 0x3
	adds r2, r3, r2
	ldrb r2, [r2]
	subs r4, 0x2
	adds r3, r4
	ldrb r3, [r3]
	bl sub_8044804
	ldr r2, _08120CC8 @ =gUnknown_02024E68
	ldrb r1, [r5]
	adds r1, r2
	movs r2, 0
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	strb r2, [r0, 0x5]
	ldrb r1, [r5]
	lsls r0, r1, 9
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _08120CA8
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x5D
	strb r1, [r0, 0x5]
_08120CA8:
	ldr r0, _08120CCC @ =gUnknown_03004330
	ldrb r1, [r5]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08120CD0 @ =sub_81208E0
	str r0, [r1]
_08120CB4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120CBC: .4byte gUnknown_02024A60
_08120CC0: .4byte 0x02017810
_08120CC4: .4byte gUnknown_02023A64
_08120CC8: .4byte gUnknown_02024E68
_08120CCC: .4byte gUnknown_03004330
_08120CD0: .4byte sub_81208E0
	thumb_func_end dp01t_30_3_80EB11C

	thumb_func_start sub_81208E0
sub_81208E0: @ 8120CD4
	push {r4,lr}
	ldr r4, _08120D0C @ =gUnknown_02024A60
	ldrb r1, [r4]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r3, _08120D10 @ =0x02017810
	adds r0, r3
	ldrb r1, [r0, 0x5]
	adds r2, r1, 0x1
	strb r2, [r0, 0x5]
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x5C
	bls _08120D04
	ldrb r0, [r4]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	movs r0, 0
	strb r0, [r1, 0x5]
	bl dp01_tbl3_exec_completed
_08120D04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120D0C: .4byte gUnknown_02024A60
_08120D10: .4byte 0x02017810
	thumb_func_end sub_81208E0

	thumb_func_start sub_8120920
sub_8120920: @ 8120D14
	push {lr}
	ldr r0, _08120D4C @ =gUnknown_02024A60
	ldrb r3, [r0]
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 2
	ldr r1, _08120D50 @ =0x02017810
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08120D42
	ldr r2, _08120D54 @ =gTasks
	ldr r0, _08120D58 @ =gUnknown_02024E68
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _08120D5C @ =sub_8044CA0
	str r1, [r0]
_08120D42:
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	.align 2, 0
_08120D4C: .4byte gUnknown_02024A60
_08120D50: .4byte 0x02017810
_08120D54: .4byte gTasks
_08120D58: .4byte gUnknown_02024E68
_08120D5C: .4byte sub_8044CA0
	thumb_func_end sub_8120920

	thumb_func_start sub_812096C
sub_812096C: @ 8120D60
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_812096C

	thumb_func_start sub_8120978
sub_8120978: @ 8120D6C
	push {r4,lr}
	ldr r4, _08120DBC @ =gUnknown_02024A60
	ldrb r0, [r4]
	bl sub_8078874
	lsls r0, 24
	cmp r0, 0
	beq _08120DB2
	ldr r3, _08120DC0 @ =gSprites
	ldr r0, _08120DC4 @ =gUnknown_02024BE0
	ldrb r1, [r4]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _08120DC8 @ =gUnknown_02023A60
	lsls r1, 9
	adds r0, 0x1
	adds r1, r0
	adds r2, 0x3E
	movs r0, 0x1
	ldrb r1, [r1]
	ands r1, r0
	lsls r1, 2
	ldrb r3, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r4]
	bl sub_8031F88
_08120DB2:
	bl dp01_tbl3_exec_completed
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120DBC: .4byte gUnknown_02024A60
_08120DC0: .4byte gSprites
_08120DC4: .4byte gUnknown_02024BE0
_08120DC8: .4byte gUnknown_02023A60
	thumb_func_end sub_8120978

	thumb_func_start sub_81209D8
sub_81209D8: @ 8120DCC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _08120E10 @ =gUnknown_02024A60
	ldrb r0, [r6]
	bl mplay_80342A4
	lsls r0, 24
	cmp r0, 0
	bne _08120E24
	ldr r5, _08120E14 @ =gUnknown_02023A60
	ldrb r2, [r6]
	lsls r1, r2, 9
	adds r0, r5, 0x1
	adds r0, r1, r0
	ldrb r3, [r0]
	adds r0, r5, 0x2
	adds r0, r1, r0
	ldrb r4, [r0]
	adds r5, 0x3
	adds r1, r5
	ldrb r0, [r1]
	lsls r0, 8
	orrs r4, r0
	str r4, [sp]
	adds r0, r2, 0
	adds r1, r2, 0
	bl move_anim_start_t3
	lsls r0, 24
	cmp r0, 0
	beq _08120E18
	bl dp01_tbl3_exec_completed
	b _08120E24
	.align 2, 0
_08120E10: .4byte gUnknown_02024A60
_08120E14: .4byte gUnknown_02023A60
_08120E18:
	ldr r0, _08120E2C @ =gUnknown_03004330
	ldrb r1, [r6]
	lsls r1, 2
	adds r1, r0
	ldr r0, _08120E30 @ =sub_811E3B8
	str r0, [r1]
_08120E24:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08120E2C: .4byte gUnknown_03004330
_08120E30: .4byte sub_811E3B8
	thumb_func_end sub_81209D8

	thumb_func_start sub_8120A40
sub_8120A40: @ 8120E34
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A40

	thumb_func_start sub_8120A4C
sub_8120A4C: @ 8120E40
	push {lr}
	bl dp01_tbl3_exec_completed
	pop {r0}
	bx r0
	thumb_func_end sub_8120A4C

	thumb_func_start sub_8120A58
sub_8120A58: @ 8120E4C
	push {r4,lr}
	ldr r2, _08120E84 @ =gUnknown_02024D26
	ldr r1, _08120E88 @ =gUnknown_02023A60
	ldr r4, _08120E8C @ =gUnknown_02024A60
	ldrb r0, [r4]
	lsls r0, 9
	adds r1, 0x1
	adds r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	movs r0, 0x5
	bl FadeOutMapMusic
	movs r0, 0x3
	bl BeginFastPaletteFade
	bl dp01_tbl3_exec_completed
	ldr r1, _08120E90 @ =gUnknown_03004330
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	ldr r1, _08120E94 @ =sub_811E29C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08120E84: .4byte gUnknown_02024D26
_08120E88: .4byte gUnknown_02023A60
_08120E8C: .4byte gUnknown_02024A60
_08120E90: .4byte gUnknown_03004330
_08120E94: .4byte sub_811E29C
	thumb_func_end sub_8120A58

	thumb_func_start nullsub_75
nullsub_75: @ 8120E98
	bx lr
	thumb_func_end nullsub_75

	.align 2, 0 @ Don't pad with nop.
