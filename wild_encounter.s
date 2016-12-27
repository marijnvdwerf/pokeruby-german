	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start DisableWildEncounters
DisableWildEncounters: @ 8084DCC
	ldr r1, _08084DD4 @ =0x0202ff7c
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084DD4: .4byte 0x0202ff7c
	thumb_func_end DisableWildEncounters

	thumb_func_start GetRoute119WaterTileNum
GetRoute119WaterTileNum: @ 8084DD8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x4]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _08084E60 @ =gRoute119WaterTileData
	lsls r1, r2, 1
	adds r1, r2
	lsls r2, r1, 1
	adds r2, r3
	adds r0, r1, 0x1
	lsls r0, 1
	adds r0, r3
	ldrh r0, [r0]
	mov r9, r0
	adds r1, 0x2
	lsls r1, 1
	adds r1, r3
	ldrh r6, [r1]
	ldrh r5, [r2]
	cmp r5, r9
	bhi _08084E82
	ldr r0, _08084E64 @ =gMapHeader
	mov r10, r0
_08084E1A:
	movs r4, 0
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	bge _08084E78
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r0, 16
	mov r8, r0
	ldr r1, [sp, 0x4]
	lsls r0, r1, 16
	asrs r7, r0, 16
_08084E34:
	adds r0, r4, 0x7
	adds r1, r5, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_805759C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08084E68
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r8, r4
	bne _08084E68
	cmp r7, r5
	bne _08084E68
	adds r0, r6, 0
	b _08084E88
	.align 2, 0
_08084E60: .4byte gRoute119WaterTileData
_08084E64: .4byte gMapHeader
_08084E68:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	mov r1, r10
	ldr r0, [r1]
	ldr r0, [r0]
	cmp r4, r0
	blt _08084E34
_08084E78:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, r9
	bls _08084E1A
_08084E82:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r0, 16
_08084E88:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetRoute119WaterTileNum

	thumb_func_start CheckFeebas
CheckFeebas: @ 8084E98
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	movs r7, 0
	ldr r0, _08084F10 @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x88
	lsls r0, 6
	cmp r1, r0
	bne _08084F8C
	add r5, sp, 0xC
	mov r4, sp
	adds r4, 0xE
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldrh r0, [r5]
	subs r0, 0x7
	strh r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x7
	strh r0, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _08084F14 @ =gRoute119WaterTileData
	mov r9, r5
	mov r8, r4
	ldrh r2, [r0, 0x6]
	cmp r1, r2
	blt _08084EE2
	ldrh r3, [r0, 0x8]
	cmp r1, r3
	bgt _08084EE2
	movs r7, 0x1
_08084EE2:
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	ldrh r2, [r0, 0xC]
	cmp r1, r2
	blt _08084EF6
	ldrh r0, [r0, 0xE]
	cmp r1, r0
	bgt _08084EF6
	movs r7, 0x2
_08084EF6:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bls _08084F1C
	b _08084F8C
	.align 2, 0
_08084F10: .4byte gSaveBlock1
_08084F14: .4byte gRoute119WaterTileData
_08084F18:
	movs r0, 0x1
	b _08084F8E
_08084F1C:
	ldr r0, _08084F9C @ =gSaveBlock1
	ldr r3, _08084FA0 @ =0x00002dd6
	adds r0, r3
	ldrh r0, [r0]
	bl FeebasSeedRng
	movs r5, 0
	ldr r6, _08084FA4 @ =0x000001bf
_08084F2C:
	bl FeebasRandom
	lsls r1, r5, 1
	mov r2, sp
	adds r4, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __umodsi3
	strh r0, [r4]
	lsls r0, 16
	cmp r0, 0
	bne _08084F4A
	strh r6, [r4]
_08084F4A:
	ldrh r0, [r4]
	subs r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bls _08084F5C
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08084F5C:
	cmp r5, 0x6
	bne _08084F2C
	mov r3, r9
	movs r1, 0
	ldrsh r0, [r3, r1]
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r2, r7, 0
	bl GetRoute119WaterTileNum
	lsls r0, 16
	lsrs r1, r0, 16
	movs r5, 0
_08084F78:
	lsls r0, r5, 1
	add r0, sp
	ldrh r0, [r0]
	cmp r1, r0
	beq _08084F18
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08084F78
_08084F8C:
	movs r0, 0
_08084F8E:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08084F9C: .4byte gSaveBlock1
_08084FA0: .4byte 0x00002dd6
_08084FA4: .4byte 0x000001bf
	thumb_func_end CheckFeebas

	thumb_func_start FeebasRandom
FeebasRandom: @ 8084FA8
	ldr r2, _08084FBC @ =0x0202ff80
	ldr r1, [r2]
	ldr r0, _08084FC0 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _08084FC4 @ =0x00003039
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	bx lr
	.align 2, 0
_08084FBC: .4byte 0x0202ff80
_08084FC0: .4byte 0x41c64e6d
_08084FC4: .4byte 0x00003039
	thumb_func_end FeebasRandom

	thumb_func_start FeebasSeedRng
FeebasSeedRng: @ 8084FC8
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08084FD4 @ =0x0202ff80
	str r0, [r1]
	bx lr
	.align 2, 0
_08084FD4: .4byte 0x0202ff80
	thumb_func_end FeebasSeedRng

	thumb_func_start ChooseWildMonIndex_Land
ChooseWildMonIndex_Land: @ 8084FD8
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bhi _08084FF4
	movs r0, 0
	b _0808508E
_08084FF4:
	adds r0, r1, 0
	subs r0, 0x14
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08085004
	movs r0, 0x1
	b _0808508E
_08085004:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08085014
	movs r0, 0x2
	b _0808508E
_08085014:
	adds r0, r1, 0
	subs r0, 0x32
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08085024
	movs r0, 0x3
	b _0808508E
_08085024:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08085034
	movs r0, 0x4
	b _0808508E
_08085034:
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bhi _08085044
	movs r0, 0x5
	b _0808508E
_08085044:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08085054
	movs r0, 0x6
	b _0808508E
_08085054:
	adds r0, r1, 0
	subs r0, 0x55
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _08085064
	movs r0, 0x7
	b _0808508E
_08085064:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08085074
	movs r0, 0x8
	b _0808508E
_08085074:
	adds r0, r1, 0
	subs r0, 0x5E
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08085084
	movs r0, 0x9
	b _0808508E
_08085084:
	cmp r1, 0x62
	beq _0808508C
	movs r0, 0xB
	b _0808508E
_0808508C:
	movs r0, 0xA
_0808508E:
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_Land

	thumb_func_start ChooseWildMonIndex_Water
ChooseWildMonIndex_Water: @ 8085094
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0x3B
	bhi _080850B2
	movs r0, 0
	b _080850E4
_080850B2:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1D
	bhi _080850C2
	movs r0, 0x1
	b _080850E4
_080850C2:
	adds r0, r1, 0
	subs r0, 0x5A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080850D2
	movs r0, 0x2
	b _080850E4
_080850D2:
	adds r0, r2, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080850E2
	movs r0, 0x4
	b _080850E4
_080850E2:
	movs r0, 0x3
_080850E4:
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_Water

	thumb_func_start ChooseWildMonIndex_Fishing
ChooseWildMonIndex_Fishing: @ 80850E8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	movs r5, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r4, 0x1
	beq _08085122
	cmp r4, 0x1
	bgt _08085112
	cmp r4, 0
	beq _08085118
	b _0808517C
_08085112:
	cmp r6, 0x2
	beq _08085146
	b _0808517C
_08085118:
	movs r5, 0x1
	cmp r1, 0x45
	bhi _0808517C
	movs r5, 0
	b _0808517C
_08085122:
	cmp r1, 0x3B
	bhi _08085128
	movs r5, 0x2
_08085128:
	adds r0, r1, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08085136
	movs r5, 0x3
_08085136:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _0808517C
	movs r5, 0x4
	b _0808517C
_08085146:
	cmp r1, 0x27
	bhi _0808514C
	movs r5, 0x5
_0808514C:
	adds r0, r1, 0
	subs r0, 0x28
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	bhi _0808515A
	movs r5, 0x6
_0808515A:
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bhi _08085168
	movs r5, 0x7
_08085168:
	adds r0, r1, 0
	subs r0, 0x5F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08085176
	movs r5, 0x8
_08085176:
	cmp r1, 0x63
	bne _0808517C
	movs r5, 0x9
_0808517C:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonIndex_Fishing

	thumb_func_start ChooseWildMonLevel
ChooseWildMonLevel: @ 8085184
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	cmp r0, r1
	bcc _08085194
	ldrb r5, [r4]
	b _08085198
_08085194:
	ldrb r5, [r4, 0x1]
	ldrb r0, [r4]
_08085198:
	subs r4, r0, r5
	adds r4, 0x1
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r0, r5, r0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ChooseWildMonLevel

	thumb_func_start GetCurrentMapWildMonHeader
GetCurrentMapWildMonHeader: @ 80851C0
	push {r4-r6,lr}
	movs r3, 0
	ldr r5, _080851F0 @ =gWildMonHeaders
	ldrb r0, [r5]
	cmp r0, 0xFF
	beq _0808520C
	adds r6, r5, 0
	ldr r4, _080851F4 @ =gSaveBlock1
_080851D0:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r6
	ldrb r1, [r2]
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _080851F8
	ldrb r1, [r2, 0x1]
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _080851F8
	adds r0, r3, 0
	b _0808520E
	.align 2, 0
_080851F0: .4byte gWildMonHeaders
_080851F4: .4byte gSaveBlock1
_080851F8:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080851D0
_0808520C:
	ldr r0, _08085214 @ =0x0000ffff
_0808520E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08085214: .4byte 0x0000ffff
	thumb_func_end GetCurrentMapWildMonHeader

	thumb_func_start PickWildMonNature
PickWildMonNature: @ 8085218
	push {r4-r7,lr}
	sub sp, 0x1C
	bl GetSafariZoneFlag
	cmp r0, 0x1
	bne _080852B2
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bhi _080852B2
	bl SafariZoneGetActivePokeblock
	adds r7, r0, 0
	cmp r7, 0
	beq _080852B2
	movs r5, 0
_08085246:
	mov r1, sp
	adds r0, r1, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _08085246
	movs r5, 0
_08085258:
	adds r1, r5, 0x1
	lsls r0, r1, 24
	lsrs r4, r0, 24
	adds r6, r1, 0
	cmp r4, 0x18
	bhi _08085288
	add r5, sp
_08085266:
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0808527E
	ldrb r2, [r5]
	mov r0, sp
	adds r1, r0, r4
	ldrb r0, [r1]
	strb r0, [r5]
	strb r2, [r1]
_0808527E:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x18
	bls _08085266
_08085288:
	lsls r0, r6, 24
	lsrs r5, r0, 24
	cmp r5, 0x17
	bls _08085258
	movs r5, 0
_08085292:
	mov r1, sp
	adds r4, r1, r5
	ldrb r0, [r4]
	adds r1, r7, 0
	bl sub_810CAE4
	lsls r0, 16
	cmp r0, 0
	ble _080852A8
	ldrb r0, [r4]
	b _080852C4
_080852A8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x18
	bls _08085292
_080852B2:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x19
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
_080852C4:
	add sp, 0x1C
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end PickWildMonNature

	thumb_func_start CreateWildMon
CreateWildMon: @ 80852CC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	bl ZeroEnemyPartyMons
	bl PickWildMonNature
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08085300 @ =gEnemyParty
	str r0, [sp]
	adds r0, r1, 0
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x20
	bl CreateMonWithNature
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085300: .4byte gEnemyParty
	thumb_func_end CreateWildMon

	thumb_func_start GenerateWildMon
GenerateWildMon: @ 8085304
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0
	cmp r1, 0x1
	beq _0808532E
	cmp r1, 0x1
	bgt _08085322
	cmp r1, 0
	beq _08085328
	b _08085336
_08085322:
	cmp r3, 0x2
	beq _0808532E
	b _08085336
_08085328:
	bl ChooseWildMonIndex_Land
	b _08085332
_0808532E:
	bl ChooseWildMonIndex_Water
_08085332:
	lsls r0, 24
	lsrs r0, 24
_08085336:
	lsls r4, r0, 2
	ldr r0, [r6, 0x4]
	adds r0, r4
	bl ChooseWildMonLevel
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r7, 0x1
	bne _08085358
	adds r0, r5, 0
	bl RepelCheck
	lsls r0, 24
	cmp r0, 0
	bne _08085358
	movs r0, 0
	b _08085366
_08085358:
	ldr r0, [r6, 0x4]
	adds r0, r4, r0
	ldrh r0, [r0, 0x2]
	adds r1, r5, 0
	bl CreateWildMon
	movs r0, 0x1
_08085366:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GenerateWildMon

	thumb_func_start GenerateFishingWildMon
GenerateFishingWildMon: @ 808536C
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl ChooseWildMonIndex_Fishing
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	ldr r0, [r5, 0x4]
	adds r0, r4
	bl ChooseWildMonLevel
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, [r5, 0x4]
	adds r0, r4, r0
	ldrh r0, [r0, 0x2]
	bl CreateWildMon
	ldr r0, [r5, 0x4]
	adds r4, r0
	ldrh r0, [r4, 0x2]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GenerateFishingWildMon

	thumb_func_start SetUpMassOutbreakEncounter
SetUpMassOutbreakEncounter: @ 80853A4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080853CC
	ldr r0, _080853C8 @ =gSaveBlock1
	movs r1, 0xAC
	lsls r1, 6
	adds r0, r1
	ldrb r0, [r0]
	bl RepelCheck
	lsls r0, 24
	cmp r0, 0
	bne _080853CC
	movs r0, 0
	b _08085400
	.align 2, 0
_080853C8: .4byte gSaveBlock1
_080853CC:
	ldr r4, _08085408 @ =gSaveBlock1
	ldr r2, _0808540C @ =0x00002afc
	adds r0, r4, r2
	ldrh r0, [r0]
	adds r2, 0x4
	adds r1, r4, r2
	ldrb r1, [r1]
	bl CreateWildMon
	movs r5, 0
	ldr r0, _08085410 @ =0x00002b04
	adds r4, r0
_080853E4:
	lsls r0, r5, 1
	adds r0, r4
	ldrh r1, [r0]
	lsls r2, r5, 24
	lsrs r2, 24
	ldr r0, _08085414 @ =gEnemyParty
	bl SetMonMoveSlot
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x3
	bls _080853E4
	movs r0, 0x1
_08085400:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085408: .4byte gSaveBlock1
_0808540C: .4byte 0x00002afc
_08085410: .4byte 0x00002b04
_08085414: .4byte gEnemyParty
	thumb_func_end SetUpMassOutbreakEncounter

	thumb_func_start DoMassOutbreakEncounterTest
DoMassOutbreakEncounterTest: @ 8085418
	push {r4,lr}
	ldr r4, _08085464 @ =gSaveBlock1
	ldr r1, _08085468 @ =0x00002afc
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _08085474
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	ldr r2, _0808546C @ =0x00002afe
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08085474
	movs r1, 0x4
	ldrsb r1, [r4, r1]
	adds r2, 0x1
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _08085474
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	ldr r2, _08085470 @ =0x00002b0d
	adds r1, r4, r2
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1]
	cmp r0, r1
	bcs _08085474
	movs r0, 0x1
	b _08085476
	.align 2, 0
_08085464: .4byte gSaveBlock1
_08085468: .4byte 0x00002afc
_0808546C: .4byte 0x00002afe
_08085470: .4byte 0x00002b0d
_08085474:
	movs r0, 0
_08085476:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoMassOutbreakEncounterTest

	thumb_func_start DoWildEncounterRateDiceRoll
DoWildEncounterRateDiceRoll: @ 808547C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xB4
	lsls r1, 4
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r4
	bcc _080854A0
	movs r0, 0
	b _080854A2
_080854A0:
	movs r0, 0x1
_080854A2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end DoWildEncounterRateDiceRoll

	thumb_func_start DoWildEncounterTest
DoWildEncounterTest: @ 80854A8
	push {r4,lr}
	sub sp, 0x4
	str r0, [sp]
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r0, 4
	str r0, [sp]
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080854D2
	ldr r1, [sp]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 4
	movs r1, 0x64
	bl __udivsi3
	str r0, [sp]
_080854D2:
	mov r0, sp
	bl ApplyFluteEncounterRateMod
	mov r0, sp
	bl ApplyCleanseTagEncounterRateMod
	cmp r4, 0
	bne _0808550E
	ldr r4, _08085530 @ =gPlayerParty
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _0808550E
	adds r0, r4, 0
	bl GetMonAbility
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _08085504
	ldr r0, [sp]
	lsrs r0, 1
	str r0, [sp]
_08085504:
	cmp r1, 0x23
	bne _0808550E
	ldr r0, [sp]
	lsls r0, 1
	str r0, [sp]
_0808550E:
	ldr r0, [sp]
	movs r1, 0xB4
	lsls r1, 4
	cmp r0, r1
	bls _0808551A
	str r1, [sp]
_0808551A:
	ldr r0, [sp]
	lsls r0, 16
	lsrs r0, 16
	bl DoWildEncounterRateDiceRoll
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08085530: .4byte gPlayerParty
	thumb_func_end DoWildEncounterTest

	thumb_func_start DoGlobalWildEncounterDiceRoll
DoGlobalWildEncounterDiceRoll: @ 8085534
	push {lr}
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3B
	bhi _08085550
	movs r0, 0x1
	b _08085552
_08085550:
	movs r0, 0
_08085552:
	pop {r1}
	bx r1
	thumb_func_end DoGlobalWildEncounterDiceRoll

	thumb_func_start StandardWildEncounter
StandardWildEncounter: @ 8085558
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 16
	lsrs r6, r0, 16
	mov r9, r6
	lsls r1, 16
	lsrs r7, r1, 16
	mov r8, r7
	ldr r0, _08085620 @ =0x0202ff7c
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08085576
	b _080856D6
_08085576:
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08085624 @ =0x0000ffff
	cmp r5, r0
	bne _08085586
	b _080856D6
_08085586:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsLandWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808562C
	ldr r1, _08085628 @ =gWildMonHeaders
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	adds r4, r2, 0
	cmp r0, 0
	bne _080855AE
	b _080856D6
_080855AE:
	cmp r7, r6
	beq _080855BE
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, 24
	cmp r0, 0
	bne _080855BE
	b _080856D6
_080855BE:
	ldr r1, _08085628 @ =gWildMonHeaders
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	ldrb r0, [r0]
	movs r1, 0
	bl DoWildEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080855DC
	b _080856D6
_080855DC:
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0808569E
	bl DoMassOutbreakEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085602
	movs r0, 0x1
	bl SetUpMassOutbreakEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080856CE
_08085602:
	ldr r1, _08085628 @ =gWildMonHeaders
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x1
	bl GenerateWildMon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080856CE
	b _080856D6
	.align 2, 0
_08085620: .4byte 0x0202ff7c
_08085624: .4byte 0x0000ffff
_08085628: .4byte gWildMonHeaders
_0808562C:
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08085654
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _080856D6
	adds r0, r4, 0
	bl MetatileBehavior_IsBridge
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080856D6
_08085654:
	ldr r1, _080856B4 @ =gWildMonHeaders
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r0, [r0]
	adds r4, r2, 0
	cmp r0, 0
	beq _080856D6
	cmp r8, r9
	beq _08085676
	bl DoGlobalWildEncounterDiceRoll
	lsls r0, 24
	cmp r0, 0
	beq _080856D6
_08085676:
	ldr r1, _080856B4 @ =gWildMonHeaders
	adds r0, r4, r5
	lsls r0, 2
	adds r1, 0x8
	adds r4, r0, r1
	ldr r0, [r4]
	ldrb r0, [r0]
	movs r1, 0
	bl DoWildEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080856D6
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080856BC
_0808569E:
	ldr r0, _080856B8 @ =0x02028878
	ldrb r0, [r0, 0xC]
	bl RepelCheck
	lsls r0, 24
	cmp r0, 0
	beq _080856D6
	bl sub_8081A5C
	movs r0, 0x1
	b _080856D8
	.align 2, 0
_080856B4: .4byte gWildMonHeaders
_080856B8: .4byte 0x02028878
_080856BC:
	ldr r0, [r4]
	movs r1, 0x1
	movs r2, 0x1
	bl GenerateWildMon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080856D6
_080856CE:
	bl CheckForSafariZoneAndProceed
	movs r0, 0x1
	b _080856D8
_080856D6:
	movs r0, 0
_080856D8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end StandardWildEncounter

	thumb_func_start RockSmashWildEncounter
RockSmashWildEncounter: @ 80856E4
	push {r4,lr}
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08085734 @ =0x0000ffff
	cmp r2, r0
	beq _08085740
	ldr r1, _08085738 @ =gWildMonHeaders
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0xC
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _0808572C
	ldrb r0, [r4]
	movs r1, 0x1
	bl DoWildEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085740
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0x1
	bl GenerateWildMon
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08085740
	bl CheckForSafariZoneAndProceed
_0808572C:
	ldr r0, _0808573C @ =gScriptResult
	strh r4, [r0]
	b _08085746
	.align 2, 0
_08085734: .4byte 0x0000ffff
_08085738: .4byte gWildMonHeaders
_0808573C: .4byte gScriptResult
_08085740:
	ldr r1, _0808574C @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
_08085746:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808574C: .4byte gScriptResult
	thumb_func_end RockSmashWildEncounter

	thumb_func_start SweetScentWildEncounter
SweetScentWildEncounter: @ 8085750
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080857C0 @ =0x0000ffff
	cmp r4, r0
	beq _0808582E
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsLandWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080857D4
	ldr r1, _080857C4 @ =gWildMonHeaders
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r1, 0x4
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _0808582E
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08085810
	bl DoMassOutbreakEncounterTest
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080857C8
	movs r0, 0
	bl SetUpMassOutbreakEncounter
	b _08085826
	.align 2, 0
_080857C0: .4byte 0x0000ffff
_080857C4: .4byte gWildMonHeaders
_080857C8:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0
	bl GenerateWildMon
	b _08085826
_080857D4:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWaterWildEncounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808582E
	ldr r1, _08085818 @ =gWildMonHeaders
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _0808582E
	bl sub_81344CC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0808581C
_08085810:
	bl sub_8081A5C
	movs r0, 0x1
	b _08085830
	.align 2, 0
_08085818: .4byte gWildMonHeaders
_0808581C:
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl GenerateWildMon
_08085826:
	bl CheckForSafariZoneAndProceed
	movs r0, 0x1
	b _08085830
_0808582E:
	movs r0, 0
_08085830:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end SweetScentWildEncounter

	thumb_func_start GetFishingWildMonListHeader
GetFishingWildMonListHeader: @ 8085838
	push {lr}
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _08085860 @ =0x0000ffff
	cmp r2, r0
	beq _08085868
	ldr r0, _08085864 @ =gWildMonHeaders
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 2
	adds r0, 0x10
	adds r1, r0
	ldr r0, [r1]
	cmp r0, 0
	beq _08085868
	movs r0, 0x1
	b _0808586A
	.align 2, 0
_08085860: .4byte 0x0000ffff
_08085864: .4byte gWildMonHeaders
_08085868:
	movs r0, 0
_0808586A:
	pop {r1}
	bx r1
	thumb_func_end GetFishingWildMonListHeader

	thumb_func_start FishingWildEncounter
FishingWildEncounter: @ 8085870
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl CheckFeebas
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080858A0
	ldr r4, _0808589C @ =gWildFeebasRoute119Data
	adds r0, r4, 0
	bl ChooseWildMonLevel
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r4, 0x2]
	adds r0, r4, 0
	bl CreateWildMon
	b _080858C0
	.align 2, 0
_0808589C: .4byte gWildFeebasRoute119Data
_080858A0:
	ldr r4, _080858D8 @ =gWildMonHeaders
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 2
	adds r4, 0x10
	adds r1, r4
	ldr r0, [r1]
	adds r1, r5, 0
	bl GenerateFishingWildMon
	lsls r0, 16
	lsrs r4, r0, 16
_080858C0:
	movs r0, 0xC
	bl sav12_xor_increment
	adds r0, r4, 0
	bl sub_80BEA50
	bl CheckForSafariZoneAndProceed
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080858D8: .4byte gWildMonHeaders
	thumb_func_end FishingWildEncounter

	thumb_func_start GetLocalWildMon
GetLocalWildMon: @ 80858DC
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r0, 0
	strb r0, [r6]
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08085914 @ =0x0000ffff
	cmp r3, r0
	beq _0808590E
	ldr r2, _08085918 @ =gWildMonHeaders
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 2
	adds r0, r2, 0x4
	adds r0, r1, r0
	ldr r5, [r0]
	adds r2, 0x8
	adds r1, r2
	ldr r4, [r1]
	cmp r5, 0
	bne _0808591C
	cmp r4, 0
	bne _08085922
_0808590E:
	movs r0, 0
	b _08085962
	.align 2, 0
_08085914: .4byte 0x0000ffff
_08085918: .4byte gWildMonHeaders
_0808591C:
	cmp r4, 0
	bne _08085930
	b _08085954
_08085922:
	movs r0, 0x1
	strb r0, [r6]
	bl ChooseWildMonIndex_Water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _0808595C
_08085930:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4F
	bls _08085954
	movs r0, 0x1
	strb r0, [r6]
	bl ChooseWildMonIndex_Water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	b _0808595C
_08085954:
	bl ChooseWildMonIndex_Land
	lsls r0, 24
	ldr r1, [r5, 0x4]
_0808595C:
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
_08085962:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLocalWildMon

	thumb_func_start GetMirageIslandMon
GetMirageIslandMon: @ 8085968
	push {r4,lr}
	bl GetCurrentMapWildMonHeader
	lsls r0, 16
	lsrs r2, r0, 16
	ldr r0, _0808599C @ =0x0000ffff
	cmp r2, r0
	beq _080859A4
	ldr r1, _080859A0 @ =gWildMonHeaders
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 2
	adds r1, 0x8
	adds r0, r1
	ldr r4, [r0]
	cmp r4, 0
	beq _080859A4
	bl ChooseWildMonIndex_Water
	lsls r0, 24
	ldr r1, [r4, 0x4]
	lsrs r0, 22
	adds r0, r1
	ldrh r0, [r0, 0x2]
	b _080859A6
	.align 2, 0
_0808599C: .4byte 0x0000ffff
_080859A0: .4byte gWildMonHeaders
_080859A4:
	movs r0, 0
_080859A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMirageIslandMon

	thumb_func_start UpdateRepelCounter
UpdateRepelCounter: @ 80859AC
	push {r4,r5,lr}
	ldr r5, _080859DC @ =0x00004021
	adds r0, r5, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080859E4
	subs r4, r0, 0x1
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl VarSet
	cmp r4, 0
	bne _080859E4
	ldr r0, _080859E0 @ =Event_RepelWoreOff
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _080859E6
	.align 2, 0
_080859DC: .4byte 0x00004021
_080859E0: .4byte Event_RepelWoreOff
_080859E4:
	movs r0, 0
_080859E6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end UpdateRepelCounter

	thumb_func_start RepelCheck
RepelCheck: @ 80859EC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08085A38 @ =0x00004021
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	beq _08085A32
	movs r5, 0
_08085A00:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08085A3C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _08085A40
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08085A40
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bcc _08085A4A
_08085A32:
	movs r0, 0x1
	b _08085A4C
	.align 2, 0
_08085A38: .4byte 0x00004021
_08085A3C: .4byte gPlayerParty
_08085A40:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08085A00
_08085A4A:
	movs r0, 0
_08085A4C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end RepelCheck

	thumb_func_start ApplyFluteEncounterRateMod
ApplyFluteEncounterRateMod: @ 8085A54
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08085A70 @ =0x0000084d
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085A74
	ldr r0, [r4]
	lsrs r1, r0, 1
	adds r0, r1
	b _08085A86
	.align 2, 0
_08085A70: .4byte 0x0000084d
_08085A74:
	ldr r0, _08085A90 @ =0x0000084e
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08085A88
	ldr r0, [r4]
	lsrs r0, 1
_08085A86:
	str r0, [r4]
_08085A88:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085A90: .4byte 0x0000084e
	thumb_func_end ApplyFluteEncounterRateMod

	thumb_func_start ApplyCleanseTagEncounterRateMod
ApplyCleanseTagEncounterRateMod: @ 8085A94
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08085AB8 @ =gPlayerParty
	movs r1, 0xC
	bl GetMonData
	cmp r0, 0xBE
	bne _08085AB0
	ldr r0, [r4]
	lsls r0, 1
	movs r1, 0x3
	bl __udivsi3
	str r0, [r4]
_08085AB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085AB8: .4byte gPlayerParty
	thumb_func_end ApplyCleanseTagEncounterRateMod

	.align 2, 0 @ Don't pad with nop.
