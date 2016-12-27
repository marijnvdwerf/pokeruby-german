	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F99CC
sub_80F99CC: @ 80F9D7C
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080F9DB4 @ =sub_80F9A8C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F9DB8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x2
	strh r0, [r1, 0x8]
	subs r0, 0x3
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F9DB4: .4byte sub_80F9A8C
_080F9DB8: .4byte gTasks
	thumb_func_end sub_80F99CC

	thumb_func_start sub_80F9A0C
sub_80F9A0C: @ 80F9DBC
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080F9DF4 @ =sub_80F9A8C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F9DF8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x3
	strh r0, [r1, 0x8]
	subs r0, 0x4
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F9DF4: .4byte sub_80F9A8C
_080F9DF8: .4byte gTasks
	thumb_func_end sub_80F9A0C

	thumb_func_start sub_80F9A4C
sub_80F9A4C: @ 80F9DFC
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _080F9E34 @ =sub_80F9A8C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F9E38 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	movs r0, 0x7
	strh r0, [r1, 0x8]
	subs r0, 0x8
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080F9E34: .4byte sub_80F9A8C
_080F9E38: .4byte gTasks
	thumb_func_end sub_80F9A4C

	thumb_func_start sub_80F9A8C
sub_80F9A8C: @ 80F9E3C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080F9E74 @ =gPaletteFade
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080F9E6E
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _080F9E78 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x8]
	movs r1, 0
	bl OpenPartyMenu
	adds r0, r4, 0
	bl DestroyTask
_080F9E6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F9E74: .4byte gPaletteFade
_080F9E78: .4byte gTasks
	thumb_func_end sub_80F9A8C

	thumb_func_start sub_80F9ACC
sub_80F9ACC: @ 80F9E7C
	push {r4,r5,lr}
	ldr r1, _080F9E9C @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _080F9E92
	b _080F9FA6
_080F9E92:
	lsls r0, 2
	ldr r1, _080F9EA0 @ =_080F9EA4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F9E9C: .4byte 0x0201b000
_080F9EA0: .4byte _080F9EA4
	.align 2, 0
_080F9EA4:
	.4byte _080F9EC4
	.4byte _080F9F04
	.4byte _080F9F0A
	.4byte _080F9F1E
	.4byte _080F9F48
	.4byte _080F9F4E
	.4byte _080F9F60
	.4byte _080F9F78
_080F9EC4:
	ldr r0, _080F9EEC @ =0x00000266
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _080F9EF0 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _080F9EF8
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _080F9EF4 @ =gPlayerParty
	adds r2, r3
	bl sub_806D90C
	b _080F9FA0
	.align 2, 0
_080F9EEC: .4byte 0x00000266
_080F9EF0: .4byte gPlayerPartyCount
_080F9EF4: .4byte gPlayerParty
_080F9EF8:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9F6C
_080F9F04:
	bl sub_806DA98
	b _080F9F64
_080F9F0A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _080F9F6C
_080F9F1E:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080F9F44 @ =0x00000266
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9FA0
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080F9F6C
	.align 2, 0
_080F9F44: .4byte 0x00000266
_080F9F48:
	bl sub_806E334
	b _080F9F64
_080F9F4E:
	bl sub_806E0C4
	ldr r1, _080F9F5C @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _080F9F6C
	.align 2, 0
_080F9F5C: .4byte 0x0201b000
_080F9F60:
	bl sub_80F9C00
_080F9F64:
	ldr r1, _080F9F74 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_080F9F6C:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080F9FA6
	.align 2, 0
_080F9F74: .4byte 0x0201b000
_080F9F78:
	ldr r0, _080F9F9C @ =0x00000266
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080F9FA0
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _080F9FA8
	.align 2, 0
_080F9F9C: .4byte 0x00000266
_080F9FA0:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080F9FA6:
	movs r0, 0
_080F9FA8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F9ACC

	thumb_func_start sub_80F9C00
sub_80F9C00: @ 80F9FB0
	push {r4,lr}
	movs r4, 0
	b _080FA008
_080F9FB6:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080F9FD4 @ =gPlayerParty
	adds r0, r1
	bl sub_80AE47C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080FA002
	lsls r0, 2
	ldr r1, _080F9FD8 @ =_080F9FDC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F9FD4: .4byte gPlayerParty
_080F9FD8: .4byte _080F9FDC
	.align 2, 0
_080F9FDC:
	.4byte _080F9FF0
	.4byte _080F9FFA
	.4byte _080F9FFA
	.4byte _080F9FF0
	.4byte _080F9FF0
_080F9FF0:
	adds r0, r4, 0
	movs r1, 0x7E
	bl sub_806BC3C
	b _080FA002
_080F9FFA:
	adds r0, r4, 0
	movs r1, 0x70
	bl sub_806BC3C
_080FA002:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080FA008:
	ldr r0, _080FA018 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080F9FB6
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA018: .4byte gPlayerPartyCount
	thumb_func_end sub_80F9C00

	thumb_func_start sub_80F9C6C
sub_80F9C6C: @ 80FA01C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080FA044 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080FA088
	adds r0, r4, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080FA048
	cmp r0, 0x2
	beq _080FA070
	b _080FA088
	.align 2, 0
_080FA044: .4byte gPaletteFade
_080FA048:
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_806CA38
	ldr r1, _080FA068 @ =gUnknown_02038694
	strb r0, [r1]
	ldr r2, _080FA06C @ =gSpecialVar_0x8004
	ldrb r0, [r1]
	strh r0, [r2]
	adds r0, r4, 0
	bl sub_8123138
	b _080FA088
	.align 2, 0
_080FA068: .4byte gUnknown_02038694
_080FA06C: .4byte gSpecialVar_0x8004
_080FA070:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080FA090 @ =gUnknown_02038694
	movs r0, 0xFF
	strb r0, [r1]
	ldr r1, _080FA094 @ =gSpecialVar_0x8004
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_8123138
_080FA088:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA090: .4byte gUnknown_02038694
_080FA094: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80F9C6C

	thumb_func_start sub_80F9CE8
sub_80F9CE8: @ 80FA098
	push {r4,r5,lr}
	ldr r1, _080FA0B8 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x7
	bls _080FA0AE
	b _080FA1C2
_080FA0AE:
	lsls r0, 2
	ldr r1, _080FA0BC @ =_080FA0C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080FA0B8: .4byte 0x0201b000
_080FA0BC: .4byte _080FA0C0
	.align 2, 0
_080FA0C0:
	.4byte _080FA0E0
	.4byte _080FA120
	.4byte _080FA126
	.4byte _080FA13A
	.4byte _080FA164
	.4byte _080FA16A
	.4byte _080FA17C
	.4byte _080FA194
_080FA0E0:
	ldr r0, _080FA108 @ =0x00000266
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _080FA10C @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r3, r0
	bge _080FA114
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _080FA110 @ =gPlayerParty
	adds r2, r3
	bl sub_806D90C
	b _080FA1BC
	.align 2, 0
_080FA108: .4byte 0x00000266
_080FA10C: .4byte gPlayerPartyCount
_080FA110: .4byte gPlayerParty
_080FA114:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080FA188
_080FA120:
	bl sub_806DA98
	b _080FA180
_080FA126:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _080FA188
_080FA13A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _080FA160 @ =0x00000266
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FA1BC
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _080FA188
	.align 2, 0
_080FA160: .4byte 0x00000266
_080FA164:
	bl sub_806E334
	b _080FA180
_080FA16A:
	bl sub_806E0C4
	ldr r1, _080FA178 @ =0x0201b000
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _080FA188
	.align 2, 0
_080FA178: .4byte 0x0201b000
_080FA17C:
	bl sub_80F9E1C
_080FA180:
	ldr r1, _080FA190 @ =0x0201b000
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_080FA188:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _080FA1C2
	.align 2, 0
_080FA190: .4byte 0x0201b000
_080FA194:
	ldr r0, _080FA1B8 @ =0x00000266
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080FA1BC
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _080FA1C4
	.align 2, 0
_080FA1B8: .4byte 0x00000266
_080FA1BC:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080FA1C2:
	movs r0, 0
_080FA1C4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F9CE8

	thumb_func_start sub_80F9E1C
sub_80F9E1C: @ 80FA1CC
	push {r4,lr}
	movs r4, 0
	b _080FA202
_080FA1D2:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _080FA1F0 @ =gPlayerParty
	adds r0, r1
	bl sub_8040574
	lsls r0, 24
	cmp r0, 0
	bne _080FA1F4
	adds r0, r4, 0
	movs r1, 0x9A
	bl sub_806BC3C
	b _080FA1FC
	.align 2, 0
_080FA1F0: .4byte gPlayerParty
_080FA1F4:
	adds r0, r4, 0
	movs r1, 0x8C
	bl sub_806BC3C
_080FA1FC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080FA202:
	ldr r0, _080FA210 @ =gPlayerPartyCount
	ldrb r0, [r0]
	cmp r4, r0
	bcc _080FA1D2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA210: .4byte gPlayerPartyCount
	thumb_func_end sub_80F9E1C

	thumb_func_start sub_80F9E64
sub_80F9E64: @ 80FA214
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080FA23C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080FA292
	adds r0, r6, 0
	bl sub_806BD80
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _080FA240
	cmp r0, 0x2
	beq _080FA280
	b _080FA292
	.align 2, 0
_080FA23C: .4byte gPaletteFade
_080FA240:
	movs r0, 0x5
	bl PlaySE
	ldr r4, _080FA274 @ =gSpecialVar_0x8004
	adds r0, r6, 0
	bl sub_806CA38
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r5, _080FA278 @ =gSpecialVar_0x8005
	ldrh r1, [r4]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA27C @ =gPlayerParty
	adds r0, r1
	bl sub_8040574
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	adds r0, r6, 0
	bl sub_8123138
	b _080FA292
	.align 2, 0
_080FA274: .4byte gSpecialVar_0x8004
_080FA278: .4byte gSpecialVar_0x8005
_080FA27C: .4byte gPlayerParty
_080FA280:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080FA298 @ =gSpecialVar_0x8004
	movs r0, 0xFF
	strh r0, [r1]
	adds r0, r6, 0
	bl sub_8123138
_080FA292:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FA298: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80F9E64

	thumb_func_start sub_80F9EEC
sub_80F9EEC: @ 80FA29C
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _080FA2D0 @ =gPlayerParty
	ldr r1, _080FA2D4 @ =gSpecialVar_0x8004
	ldrb r1, [r1]
	ldr r2, _080FA2D8 @ =gPlayerPartyCount
	ldrb r2, [r2]
	subs r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080FA2DC @ =c2_exit_to_overworld_2_switch
	movs r4, 0
	str r4, [sp]
	bl sub_809D9F0
	ldr r1, _080FA2E0 @ =0x02018000
	movs r0, 0x3
	strb r0, [r1, 0x8]
	ldr r1, _080FA2E4 @ =gUnknown_0300485C
	ldr r0, _080FA2E8 @ =sub_8080990
	str r0, [r1]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA2D0: .4byte gPlayerParty
_080FA2D4: .4byte gSpecialVar_0x8004
_080FA2D8: .4byte gPlayerPartyCount
_080FA2DC: .4byte c2_exit_to_overworld_2_switch
_080FA2E0: .4byte 0x02018000
_080FA2E4: .4byte gUnknown_0300485C
_080FA2E8: .4byte sub_8080990
	thumb_func_end sub_80F9EEC

	thumb_func_start sub_80F9F3C
sub_80F9F3C: @ 80FA2EC
	push {r4,r5,lr}
	ldr r1, _080FA328 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	movs r4, 0
	adds r5, r1, 0
_080FA2F8:
	ldr r0, _080FA32C @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA330 @ =gPlayerParty
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0xD
	bl GetMonData
	cmp r0, 0
	beq _080FA316
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_080FA316:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080FA2F8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA328: .4byte gScriptResult
_080FA32C: .4byte gSpecialVar_0x8004
_080FA330: .4byte gPlayerParty
	thumb_func_end sub_80F9F3C

	thumb_func_start sub_80F9F84
sub_80F9F84: @ 80FA334
	push {r4,r5,lr}
	ldr r0, _080FA374 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	adds r5, r1, 0
	muls r5, r0
	ldr r0, _080FA378 @ =gPlayerParty
	adds r5, r0
	ldr r0, _080FA37C @ =gSpecialVar_0x8005
	ldrh r1, [r0]
	adds r1, 0xD
	adds r0, r5, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r1, _080FA380 @ =gStringVar1
	adds r0, r5, 0
	bl GetMonNickname
	ldr r0, _080FA384 @ =gStringVar2
	movs r1, 0xD
	muls r1, r4
	ldr r2, _080FA388 @ =gMoveNames
	adds r1, r2
	bl StringCopy
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080FA374: .4byte gSpecialVar_0x8004
_080FA378: .4byte gPlayerParty
_080FA37C: .4byte gSpecialVar_0x8005
_080FA380: .4byte gStringVar1
_080FA384: .4byte gStringVar2
_080FA388: .4byte gMoveNames
	thumb_func_end sub_80F9F84

	thumb_func_start sub_80F9FDC
sub_80F9FDC: @ 80FA38C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	mov r8, r0
	adds r5, r1, 0
	adds r4, r2, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	adds r0, 0xD
	str r0, [sp, 0x8]
	mov r0, r8
	ldr r1, [sp, 0x8]
	bl GetMonData
	mov r1, sp
	adds r1, 0x2
	str r1, [sp, 0x14]
	strh r0, [r1]
	adds r3, r4, 0
	adds r3, 0xD
	str r3, [sp, 0xC]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	mov r1, sp
	strh r0, [r1]
	adds r7, r5, 0
	adds r7, 0x11
	str r7, [sp, 0x10]
	mov r0, r8
	adds r1, r7, 0
	bl GetMonData
	mov r1, sp
	adds r1, 0x5
	str r1, [sp, 0x18]
	strb r0, [r1]
	adds r3, r4, 0
	adds r3, 0x11
	str r3, [sp, 0x1C]
	mov r0, r8
	adds r1, r3, 0
	bl GetMonData
	add r7, sp, 0x4
	mov r10, r7
	strb r0, [r7]
	mov r0, r8
	movs r1, 0x15
	bl GetMonData
	mov r6, sp
	adds r6, 0x6
	strb r0, [r6]
	ldr r1, _080FA488 @ =gUnknown_08208238
	adds r0, r5, r1
	ldrb r0, [r0]
	mov r9, r0
	ldrb r0, [r6]
	adds r2, r0, 0
	mov r3, r9
	ands r2, r3
	lsls r5, 1
	asrs r2, r5
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, r1
	ldrb r3, [r1]
	adds r1, r0, 0
	ands r1, r3
	lsls r4, 1
	asrs r1, r4
	lsls r1, 24
	lsrs r1, 24
	mov r7, r9
	bics r0, r7
	strb r0, [r6]
	ldrb r0, [r6]
	bics r0, r3
	strb r0, [r6]
	lsls r2, r4
	lsls r1, r5
	adds r2, r1
	ldrb r0, [r6]
	orrs r0, r2
	strb r0, [r6]
	mov r0, r8
	ldr r1, [sp, 0x8]
	mov r2, sp
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0xC]
	ldr r2, [sp, 0x14]
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0x10]
	mov r2, r10
	bl SetMonData
	mov r0, r8
	ldr r1, [sp, 0x1C]
	ldr r2, [sp, 0x18]
	bl SetMonData
	mov r0, r8
	movs r1, 0x15
	adds r2, r6, 0
	bl SetMonData
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080FA488: .4byte gUnknown_08208238
	thumb_func_end sub_80F9FDC

	thumb_func_start sub_80FA0DC
sub_80FA0DC: @ 80FA48C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _080FA4EC @ =gSpecialVar_0x8004
	mov r8, r0
	ldrh r0, [r0]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _080FA4F0 @ =gPlayerParty
	adds r0, r5
	ldr r4, _080FA4F4 @ =gSpecialVar_0x8005
	ldrb r2, [r4]
	movs r1, 0
	bl SetMonMoveSlot
	mov r1, r8
	ldrh r0, [r1]
	muls r0, r6
	adds r0, r5
	ldrb r1, [r4]
	bl RemoveMonPPBonus
	ldrh r4, [r4]
	cmp r4, 0x2
	bhi _080FA4E0
_080FA4BE:
	ldr r0, _080FA4EC @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA4F0 @ =gPlayerParty
	adds r0, r1
	lsls r1, r4, 24
	lsrs r1, 24
	adds r4, 0x1
	lsls r2, r4, 24
	lsrs r2, 24
	bl sub_80F9FDC
	lsls r4, 16
	lsrs r4, 16
	cmp r4, 0x2
	bls _080FA4BE
_080FA4E0:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080FA4EC: .4byte gSpecialVar_0x8004
_080FA4F0: .4byte gPlayerParty
_080FA4F4: .4byte gSpecialVar_0x8005
	thumb_func_end sub_80FA0DC

	thumb_func_start sub_80FA148
sub_80FA148: @ 80FA4F8
	push {r4,lr}
	ldr r0, _080FA520 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _080FA524 @ =gPlayerParty
	adds r0, r1
	ldr r4, _080FA528 @ =gScriptResult
	movs r1, 0
	strh r1, [r4]
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _080FA51A
	movs r0, 0x1
	strh r0, [r4]
_080FA51A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080FA520: .4byte gSpecialVar_0x8004
_080FA524: .4byte gPlayerParty
_080FA528: .4byte gScriptResult
	thumb_func_end sub_80FA148

	.align 2, 0 @ Don't pad with nop.
