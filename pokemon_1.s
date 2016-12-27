	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ZeroBoxMonData
ZeroBoxMonData: @ 803A894
	push {lr}
	adds r2, r0, 0
	movs r1, 0
	movs r3, 0
_0803A89C:
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, 0x1
	cmp r1, 0x4F
	bls _0803A89C
	pop {r0}
	bx r0
	thumb_func_end ZeroBoxMonData

	thumb_func_start ZeroMonData
ZeroMonData: @ 803A8AC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl ZeroBoxMonData
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x38
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3B
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3C
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3D
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3E
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3F
	mov r2, sp
	bl SetMonData
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x40
	mov r2, sp
	bl SetMonData
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ZeroMonData

	thumb_func_start ZeroPlayerPartyMons
ZeroPlayerPartyMons: @ 803A92C
	push {r4,r5,lr}
	ldr r4, _0803A948 @ =gPlayerParty
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0803A936:
	adds r0, r4, 0
	bl ZeroMonData
	adds r4, 0x64
	cmp r4, r5
	ble _0803A936
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A948: .4byte gPlayerParty
	thumb_func_end ZeroPlayerPartyMons

	thumb_func_start ZeroEnemyPartyMons
ZeroEnemyPartyMons: @ 803A94C
	push {r4,r5,lr}
	ldr r4, _0803A968 @ =gEnemyParty
	movs r0, 0xFA
	lsls r0, 1
	adds r5, r4, r0
_0803A956:
	adds r0, r4, 0
	bl ZeroMonData
	adds r4, 0x64
	cmp r4, r5
	ble _0803A956
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A968: .4byte gEnemyParty
	thumb_func_end ZeroEnemyPartyMons

	thumb_func_start CreateMon
CreateMon: @ 803A96C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x1C
	mov r8, r0
	adds r6, r1, 0
	ldr r4, [sp, 0x34]
	ldr r7, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	lsls r6, 16
	lsrs r6, 16
	add r0, sp, 0x10
	strb r2, [r0]
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r0, r8
	str r3, [sp, 0x18]
	bl ZeroMonData
	str r4, [sp]
	str r7, [sp, 0x4]
	str r5, [sp, 0x8]
	ldr r0, [sp, 0x40]
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	add r2, sp, 0x10
	ldrb r2, [r2]
	ldr r3, [sp, 0x18]
	bl CreateBoxMon
	mov r0, r8
	movs r1, 0x38
	add r2, sp, 0x10
	bl SetMonData
	movs r0, 0xFF
	str r0, [sp, 0x14]
	add r2, sp, 0x14
	mov r0, r8
	movs r1, 0x40
	bl SetMonData
	mov r0, r8
	bl CalculateMonStats
	add sp, 0x1C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMon

	thumb_func_start CreateBoxMon
CreateBoxMon: @ 803A9DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	adds r7, r0, 0
	ldr r4, [sp, 0x40]
	ldr r0, [sp, 0x48]
	movs r5, 0xE
	add r5, sp
	strh r1, [r5]
	add r6, sp, 0x10
	strb r2, [r6]
	mov r5, sp
	adds r5, 0x11
	strb r3, [r5]
	lsls r4, 24
	lsrs r4, 24
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	adds r0, r7, 0
	bl ZeroBoxMonData
	cmp r4, 0
	beq _0803AA18
	ldr r0, [sp, 0x44]
	str r0, [sp, 0x14]
	b _0803AA2C
_0803AA18:
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	str r4, [sp, 0x14]
_0803AA2C:
	add r2, sp, 0x14
	adds r0, r7, 0
	movs r1, 0
	bl SetBoxMonData
	add r0, sp, 0x18
	mov r9, r0
	add r5, sp, 0xC
	mov r1, r10
	cmp r1, 0x2
	bne _0803AA84
	ldr r2, _0803AA7C @ =0xffff0000
	mov r8, r2
	ldr r6, _0803AA80 @ =0x0000ffff
_0803AA48:
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	str r4, [sp, 0x18]
	adds r1, r4, 0
	mov r3, r8
	ands r1, r3
	lsrs r1, 16
	ands r4, r6
	eors r1, r4
	ldr r2, [sp, 0x14]
	adds r0, r2, 0
	ands r0, r3
	lsrs r0, 16
	eors r1, r0
	ands r2, r6
	eors r1, r2
	cmp r1, 0x7
	bls _0803AA48
	b _0803AAA8
	.align 2, 0
_0803AA7C: .4byte 0xffff0000
_0803AA80: .4byte 0x0000ffff
_0803AA84:
	mov r0, r10
	cmp r0, 0x1
	bne _0803AA90
	ldr r0, [sp, 0x4C]
	str r0, [sp, 0x18]
	b _0803AAA8
_0803AA90:
	ldr r2, _0803ABD4 @ =gSaveBlock2
	ldrb r1, [r2, 0xA]
	ldrb r0, [r2, 0xB]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0xC]
	lsls r0, 16
	orrs r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 24
	orrs r1, r0
	str r1, [sp, 0x18]
_0803AAA8:
	adds r0, r7, 0
	movs r1, 0x1
	mov r2, r9
	bl SetBoxMonData
	adds r0, r7, 0
	bl CalculateBoxMonChecksum
	strh r0, [r5]
	adds r0, r7, 0
	movs r1, 0x9
	adds r2, r5, 0
	bl SetBoxMonData
	adds r0, r7, 0
	bl EncryptBoxMon
	mov r0, sp
	ldrh r1, [r0, 0xE]
	bl GetSpeciesName
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, sp
	bl SetBoxMonData
	ldr r2, _0803ABD8 @ =gGameLanguage
	adds r0, r7, 0
	movs r1, 0x3
	bl SetBoxMonData
	ldr r5, _0803ABD4 @ =gSaveBlock2
	adds r0, r7, 0
	movs r1, 0x7
	adds r2, r5, 0
	bl SetBoxMonData
	adds r0, r7, 0
	movs r1, 0xB
	mov r2, sp
	adds r2, 0xE
	bl SetBoxMonData
	ldr r4, _0803ABDC @ =gBaseStats
	mov r2, sp
	ldrh r1, [r2, 0xE]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x13]
	movs r0, 0xCA
	lsls r0, 1
	adds r2, r1, 0
	muls r2, r0
	mov r3, sp
	ldrb r0, [r3, 0x10]
	lsls r0, 2
	ldr r1, _0803ABE0 @ =gExperienceTables
	adds r0, r1
	adds r2, r0
	adds r0, r7, 0
	movs r1, 0x19
	bl SetBoxMonData
	mov r1, sp
	ldrh r0, [r1, 0xE]
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	adds r4, 0x12
	adds r2, r4
	adds r0, r7, 0
	movs r1, 0x20
	bl SetBoxMonData
	bl sav1_map_get_name
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x18]
	adds r0, r7, 0
	movs r1, 0x23
	mov r2, r9
	bl SetBoxMonData
	adds r0, r7, 0
	movs r1, 0x24
	add r2, sp, 0x10
	bl SetBoxMonData
	ldr r2, _0803ABE4 @ =gGameVersion
	adds r0, r7, 0
	movs r1, 0x25
	bl SetBoxMonData
	movs r0, 0x4
	str r0, [sp, 0x18]
	adds r0, r7, 0
	movs r1, 0x26
	mov r2, r9
	bl SetBoxMonData
	adds r5, 0x8
	adds r0, r7, 0
	movs r1, 0x31
	adds r2, r5, 0
	bl SetBoxMonData
	mov r2, sp
	ldrb r0, [r2, 0x11]
	cmp r0, 0x1F
	bhi _0803ABE8
	adds r0, r7, 0
	movs r1, 0x27
	adds r2, 0x11
	bl SetBoxMonData
	adds r0, r7, 0
	movs r1, 0x28
	mov r2, sp
	adds r2, 0x11
	bl SetBoxMonData
	adds r0, r7, 0
	movs r1, 0x29
	mov r2, sp
	adds r2, 0x11
	bl SetBoxMonData
	adds r0, r7, 0
	movs r1, 0x2A
	mov r2, sp
	adds r2, 0x11
	bl SetBoxMonData
	adds r0, r7, 0
	movs r1, 0x2B
	mov r2, sp
	adds r2, 0x11
	bl SetBoxMonData
	adds r0, r7, 0
	movs r1, 0x2C
	mov r2, sp
	adds r2, 0x11
	bl SetBoxMonData
	b _0803AC70
	.align 2, 0
_0803ABD4: .4byte gSaveBlock2
_0803ABD8: .4byte gGameLanguage
_0803ABDC: .4byte gBaseStats
_0803ABE0: .4byte gExperienceTables
_0803ABE4: .4byte gGameVersion
_0803ABE8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	movs r3, 0x1F
	mov r8, r3
	ands r0, r3
	str r0, [sp, 0x1C]
	add r4, sp, 0x1C
	adds r0, r7, 0
	movs r1, 0x27
	adds r2, r4, 0
	bl SetBoxMonData
	ldr r0, [sp, 0x18]
	movs r6, 0xF8
	lsls r6, 2
	ands r0, r6
	lsrs r0, 5
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x28
	adds r2, r4, 0
	bl SetBoxMonData
	ldr r0, [sp, 0x18]
	movs r5, 0xF8
	lsls r5, 7
	ands r0, r5
	lsrs r0, 10
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x29
	adds r2, r4, 0
	bl SetBoxMonData
	bl Random
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	mov r1, r8
	ands r0, r1
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2A
	adds r2, r4, 0
	bl SetBoxMonData
	ldr r0, [sp, 0x18]
	ands r0, r6
	lsrs r0, 5
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2B
	adds r2, r4, 0
	bl SetBoxMonData
	ldr r0, [sp, 0x18]
	ands r0, r5
	lsrs r0, 10
	str r0, [sp, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2C
	adds r2, r4, 0
	bl SetBoxMonData
_0803AC70:
	ldr r2, _0803ACAC @ =gBaseStats
	mov r3, sp
	ldrh r1, [r3, 0xE]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x17]
	cmp r0, 0
	beq _0803AC96
	ldr r0, [sp, 0x14]
	movs r1, 0x1
	ands r0, r1
	str r0, [sp, 0x18]
	adds r0, r7, 0
	movs r1, 0x2E
	mov r2, r9
	bl SetBoxMonData
_0803AC96:
	adds r0, r7, 0
	bl GiveBoxMonInitialMoveset
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803ACAC: .4byte gBaseStats
	thumb_func_end CreateBoxMon

	thumb_func_start CreateMonWithNature
CreateMonWithNature: @ 803ACB0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	mov r9, r0
	ldr r0, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
_0803ACD0:
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bne _0803ACD0
	movs r0, 0x1
	str r0, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r0, r9
	mov r1, r8
	adds r2, r7, 0
	adds r3, r6, 0
	bl CreateMon
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMonWithNature

	thumb_func_start CreateMonWithGenderNatureLetter
CreateMonWithGenderNatureLetter: @ 803AD18
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	str r0, [sp, 0x10]
	ldr r4, [sp, 0x38]
	ldr r5, [sp, 0x3C]
	ldr r0, [sp, 0x40]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x14]
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	lsls r5, 24
	lsrs r6, r5, 24
	lsls r0, 24
	lsrs r1, r0, 24
	mov r9, r1
	movs r1, 0xFF
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1B
	bhi _0803ADBE
_0803AD58:
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	movs r0, 0xC0
	lsls r0, 18
	ands r0, r4
	lsrs r0, 18
	movs r1, 0xC0
	lsls r1, 10
	ands r1, r4
	lsrs r1, 12
	orrs r0, r1
	movs r1, 0xC0
	lsls r1, 2
	ands r1, r4
	lsrs r1, 6
	orrs r0, r1
	movs r1, 0x3
	ands r1, r4
	orrs r0, r1
	movs r1, 0x1C
	bl __umodsi3
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0803AD58
	adds r0, r7, 0
	adds r1, r4, 0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	bne _0803AD58
	mov r0, r9
	subs r0, 0x1
	cmp r5, r0
	bne _0803AD58
	b _0803ADEE
_0803ADBE:
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl GetNatureFromPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0803ADBE
	adds r0, r7, 0
	adds r1, r4, 0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	lsrs r0, 24
	cmp r8, r0
	bne _0803ADBE
_0803ADEE:
	movs r0, 0x1
	str r0, [sp]
	str r4, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	ldr r0, [sp, 0x10]
	adds r1, r7, 0
	ldr r2, [sp, 0x14]
	mov r3, r10
	bl CreateMon
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMonWithGenderNatureLetter

	thumb_func_start CreateMaleMon
CreateMaleMon: @ 803AE18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r7, r2, 24
_0803AE2A:
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsrs r5, r4, 16
	lsls r0, 16
	orrs r5, r0
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 16
	orrs r4, r0
	adds r0, r6, 0
	adds r1, r4, 0
	bl GetGenderFromSpeciesAndPersonality
	lsls r0, 24
	cmp r0, 0
	bne _0803AE2A
	movs r0, 0x1
	str r0, [sp]
	str r4, [sp, 0x4]
	str r0, [sp, 0x8]
	str r5, [sp, 0xC]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r7, 0
	movs r3, 0x20
	bl CreateMon
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMaleMon

	thumb_func_start CreateMonWithIVsPersonality
CreateMonWithIVsPersonality: @ 803AE80
	push {r4,lr}
	sub sp, 0x14
	adds r4, r0, 0
	str r3, [sp, 0x10]
	ldr r3, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x1
	str r0, [sp]
	str r3, [sp, 0x4]
	movs r0, 0
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r4, 0
	movs r3, 0
	bl CreateMon
	adds r0, r4, 0
	movs r1, 0x42
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r4, 0
	bl CalculateMonStats
	add sp, 0x14
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CreateMonWithIVsPersonality

	thumb_func_start CreateMonWithIVsOTID
CreateMonWithIVsOTID: @ 803AEC0
	push {r4,r5,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r4, r3, 0
	ldr r3, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	movs r0, 0x1
	str r0, [sp, 0x8]
	str r3, [sp, 0xC]
	adds r0, r5, 0
	movs r3, 0
	bl CreateMon
	adds r0, r5, 0
	movs r1, 0x27
	adds r2, r4, 0
	bl SetMonData
	adds r2, r4, 0x1
	adds r0, r5, 0
	movs r1, 0x28
	bl SetMonData
	adds r2, r4, 0x2
	adds r0, r5, 0
	movs r1, 0x29
	bl SetMonData
	adds r2, r4, 0x3
	adds r0, r5, 0
	movs r1, 0x2A
	bl SetMonData
	adds r2, r4, 0x4
	adds r0, r5, 0
	movs r1, 0x2B
	bl SetMonData
	adds r4, 0x5
	adds r0, r5, 0
	movs r1, 0x2C
	adds r2, r4, 0
	bl SetMonData
	adds r0, r5, 0
	bl CalculateMonStats
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end CreateMonWithIVsOTID

	thumb_func_start CreateMonWithEVSpread
CreateMonWithEVSpread: @ 803AF34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r7, r0, 0
	ldr r0, [sp, 0x2C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r6, 0
	str r6, [sp]
	str r6, [sp, 0x4]
	str r6, [sp, 0x8]
	str r6, [sp, 0xC]
	adds r0, r7, 0
	bl CreateMon
	mov r4, r8
	movs r1, 0x1
	movs r5, 0x5
_0803AF68:
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0803AF72
	adds r6, 0x1
_0803AF72:
	lsrs r4, 1
	subs r5, 0x1
	cmp r5, 0
	bge _0803AF68
	movs r0, 0xFF
	lsls r0, 1
	adds r1, r6, 0
	bl __divsi3
	add r1, sp, 0x10
	strh r0, [r1]
	movs r4, 0x1
	movs r5, 0
_0803AF8C:
	mov r0, r8
	ands r0, r4
	cmp r0, 0
	beq _0803AFA0
	adds r1, r5, 0
	adds r1, 0x1A
	adds r0, r7, 0
	add r2, sp, 0x10
	bl SetMonData
_0803AFA0:
	lsls r0, r4, 25
	lsrs r4, r0, 24
	adds r5, 0x1
	cmp r5, 0x5
	ble _0803AF8C
	adds r0, r7, 0
	bl CalculateMonStats
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CreateMonWithEVSpread

	thumb_func_start sub_803ADE8
sub_803ADE8: @ 803AFBC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x20
	adds r7, r0, 0
	adds r6, r1, 0
	ldrh r1, [r6]
	ldrb r2, [r6, 0xC]
	movs r3, 0x1
	str r3, [sp]
	ldr r0, [r6, 0x1C]
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	ldr r0, [r6, 0x14]
	str r0, [sp, 0xC]
	adds r0, r7, 0
	movs r3, 0
	bl CreateMon
	movs r5, 0
	add r0, sp, 0x1C
	mov r9, r0
	movs r1, 0x1D
	add r1, sp
	mov r8, r1
	adds r4, r6, 0x4
_0803AFF2:
	ldrh r1, [r4]
	lsls r2, r5, 24
	lsrs r2, 24
	adds r0, r7, 0
	bl SetMonMoveSlot
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803AFF2
	adds r2, r6, 0
	adds r2, 0xD
	adds r0, r7, 0
	movs r1, 0x15
	bl SetMonData
	adds r2, r6, 0x2
	adds r0, r7, 0
	movs r1, 0xC
	bl SetMonData
	adds r1, r6, 0
	adds r1, 0x20
	add r0, sp, 0x10
	bl StringCopy
	add r0, sp, 0x10
	ldrb r0, [r0]
	cmp r0, 0xFC
	bne _0803B03A
	add r0, sp, 0x10
	ldrb r0, [r0, 0x1]
	cmp r0, 0x15
	bne _0803B03A
	movs r0, 0x1
	b _0803B03C
_0803B03A:
	movs r0, 0x5
_0803B03C:
	mov r1, r9
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x3
	mov r2, r9
	bl SetMonData
	add r0, sp, 0x10
	bl StripExtCtrlCodes
	adds r0, r7, 0
	movs r1, 0x2
	add r2, sp, 0x10
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x2B
	adds r0, r7, 0
	movs r1, 0x20
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0xE
	adds r0, r7, 0
	movs r1, 0x1A
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0xF
	adds r0, r7, 0
	movs r1, 0x1B
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x10
	adds r0, r7, 0
	movs r1, 0x1C
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x11
	adds r0, r7, 0
	movs r1, 0x1D
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x12
	adds r0, r7, 0
	movs r1, 0x1E
	bl SetMonData
	adds r2, r6, 0
	adds r2, 0x13
	adds r0, r7, 0
	movs r1, 0x1F
	bl SetMonData
	ldrb r0, [r6, 0x1B]
	lsrs r0, 7
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2E
	mov r2, r8
	bl SetMonData
	ldrb r0, [r6, 0x18]
	lsls r0, 27
	lsrs r0, 27
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x27
	mov r2, r8
	bl SetMonData
	ldrh r0, [r6, 0x18]
	lsls r0, 22
	lsrs r0, 27
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x28
	mov r2, r8
	bl SetMonData
	ldrb r0, [r6, 0x19]
	lsls r0, 25
	lsrs r0, 27
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x29
	mov r2, r8
	bl SetMonData
	ldr r0, [r6, 0x18]
	lsls r0, 12
	lsrs r0, 27
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2A
	mov r2, r8
	bl SetMonData
	ldrh r0, [r6, 0x1A]
	lsls r0, 23
	lsrs r0, 27
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2B
	mov r2, r8
	bl SetMonData
	ldrb r0, [r6, 0x1B]
	lsls r0, 26
	lsrs r0, 27
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x2C
	mov r2, r8
	bl SetMonData
	adds r0, r7, 0
	bl CalculateMonStats
	add sp, 0x20
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_803ADE8

	thumb_func_start sub_803AF78
sub_803AF78: @ 803B14C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r6, r1, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	strh r0, [r6]
	adds r0, r7, 0
	movs r1, 0xC
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xAF
	bne _0803B176
	movs r0, 0
_0803B176:
	strh r0, [r6, 0x2]
	movs r5, 0
	movs r0, 0x2B
	adds r0, r6
	mov r8, r0
	movs r1, 0x20
	adds r1, r6
	mov r9, r1
	adds r4, r6, 0x4
_0803B188:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r7, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r4]
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803B188
	adds r0, r7, 0
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0xC]
	adds r0, r7, 0
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0xD]
	adds r0, r7, 0
	movs r1, 0x1
	movs r2, 0
	bl GetMonData
	str r0, [r6, 0x14]
	adds r0, r7, 0
	movs r1, 0x1A
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0xE]
	adds r0, r7, 0
	movs r1, 0x1B
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0xF]
	adds r0, r7, 0
	movs r1, 0x1C
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0x10]
	adds r0, r7, 0
	movs r1, 0x1D
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0x11]
	adds r0, r7, 0
	movs r1, 0x1E
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0x12]
	adds r0, r7, 0
	movs r1, 0x1F
	movs r2, 0
	bl GetMonData
	strb r0, [r6, 0x13]
	adds r0, r7, 0
	movs r1, 0x20
	movs r2, 0
	bl GetMonData
	mov r1, r8
	strb r0, [r1]
	adds r0, r7, 0
	movs r1, 0x27
	movs r2, 0
	bl GetMonData
	movs r4, 0x1F
	ands r0, r4
	ldrb r2, [r6, 0x18]
	movs r1, 0x20
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x18]
	adds r0, r7, 0
	movs r1, 0x28
	movs r2, 0
	bl GetMonData
	movs r5, 0x1F
	ands r0, r5
	lsls r0, 5
	ldrh r2, [r6, 0x18]
	ldr r1, _0803B2EC @ =0xfffffc1f
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, 0x18]
	adds r0, r7, 0
	movs r1, 0x29
	movs r2, 0
	bl GetMonData
	ands r0, r4
	lsls r0, 2
	ldrb r2, [r6, 0x19]
	movs r1, 0x7D
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x19]
	adds r0, r7, 0
	movs r1, 0x2A
	movs r2, 0
	bl GetMonData
	movs r1, 0x1F
	ands r1, r0
	lsls r1, 15
	ldr r0, [r6, 0x18]
	ldr r2, _0803B2F0 @ =0xfff07fff
	ands r0, r2
	orrs r0, r1
	str r0, [r6, 0x18]
	adds r0, r7, 0
	movs r1, 0x2B
	movs r2, 0
	bl GetMonData
	ands r0, r5
	lsls r0, 4
	ldrh r2, [r6, 0x1A]
	ldr r1, _0803B2F4 @ =0xfffffe0f
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, 0x1A]
	adds r0, r7, 0
	movs r1, 0x2C
	movs r2, 0
	bl GetMonData
	ands r0, r4
	lsls r0, 1
	ldrb r2, [r6, 0x1B]
	movs r1, 0x3F
	negs r1, r1
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x1B]
	adds r0, r7, 0
	movs r1, 0x2E
	movs r2, 0
	bl GetMonData
	lsls r0, 7
	ldrb r2, [r6, 0x1B]
	movs r1, 0x7F
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, 0x1B]
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	bl GetMonData
	str r0, [r6, 0x1C]
	adds r0, r7, 0
	movs r1, 0x2
	mov r2, r9
	bl GetMonData
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B2EC: .4byte 0xfffffc1f
_0803B2F0: .4byte 0xfff07fff
_0803B2F4: .4byte 0xfffffe0f
	thumb_func_end sub_803AF78

	thumb_func_start CalculateBoxMonChecksum
CalculateBoxMonChecksum: @ 803B2F8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	movs r6, 0
	ldr r1, [r4]
	movs r2, 0
	bl GetSubstruct
	adds r5, r0, 0
	ldr r1, [r4]
	adds r0, r4, 0
	movs r2, 0x1
	bl GetSubstruct
	adds r7, r0, 0
	ldr r1, [r4]
	adds r0, r4, 0
	movs r2, 0x2
	bl GetSubstruct
	mov r8, r0
	ldr r1, [r4]
	adds r0, r4, 0
	movs r2, 0x3
	bl GetSubstruct
	adds r3, r0, 0
	movs r1, 0x5
_0803B332:
	ldrh r0, [r5]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r5, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803B332
	adds r2, r7, 0
	movs r1, 0x5
_0803B346:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803B346
	mov r2, r8
	movs r1, 0x5
_0803B35A:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803B35A
	adds r2, r3, 0
	movs r1, 0x5
_0803B36E:
	ldrh r0, [r2]
	adds r0, r6, r0
	lsls r0, 16
	lsrs r6, r0, 16
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _0803B36E
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CalculateBoxMonChecksum

	thumb_func_start CalculateMonStats
CalculateMonStats: @ 803B38C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x40
	adds r5, r0, 0
	movs r1, 0x3A
	movs r2, 0
	bl GetMonData
	mov r8, r0
	adds r0, r5, 0
	movs r1, 0x39
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x1C]
	adds r0, r5, 0
	movs r1, 0x27
	movs r2, 0
	bl GetMonData
	adds r6, r0, 0
	adds r0, r5, 0
	movs r1, 0x1A
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0x28
	movs r2, 0
	bl GetMonData
	mov r10, r0
	adds r0, r5, 0
	movs r1, 0x1B
	movs r2, 0
	bl GetMonData
	mov r9, r0
	adds r0, r5, 0
	movs r1, 0x29
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x20]
	adds r0, r5, 0
	movs r1, 0x1C
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x24]
	adds r0, r5, 0
	movs r1, 0x2A
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x28]
	adds r0, r5, 0
	movs r1, 0x1D
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x2C]
	adds r0, r5, 0
	movs r1, 0x2B
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x30]
	adds r0, r5, 0
	movs r1, 0x1E
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x34]
	adds r0, r5, 0
	movs r1, 0x2C
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x38]
	adds r0, r5, 0
	movs r1, 0x1F
	movs r2, 0
	bl GetMonData
	str r0, [sp, 0x3C]
	adds r0, r5, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r5, 0
	bl GetLevelFromMonExp
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x38
	mov r2, sp
	bl SetMonData
	ldr r0, _0803B474 @ =0x0000012f
	cmp r7, r0
	bne _0803B478
	movs r0, 0x1
	str r0, [sp, 0x4]
	lsls r6, r7, 3
	b _0803B4A6
	.align 2, 0
_0803B474: .4byte 0x0000012f
_0803B478:
	ldr r1, _0803B644 @ =gBaseStats
	lsls r2, r7, 3
	subs r0, r2, r7
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r1, r0, r6
	adds r0, r4, 0
	adds r6, r2, 0
	cmp r0, 0
	bge _0803B492
	adds r0, 0x3
_0803B492:
	asrs r0, 2
	adds r0, r1, r0
	ldr r4, [sp]
	muls r0, r4
	movs r1, 0x64
	bl __divsi3
	adds r0, r4
	adds r0, 0xA
	str r0, [sp, 0x4]
_0803B4A6:
	ldr r1, _0803B648 @ =0x02000000
	add r2, sp, 0x4
	ldrb r0, [r2]
	mov r3, r8
	subs r0, r3
	ldr r3, _0803B64C @ =0x000160fa
	adds r1, r3
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bne _0803B4C0
	movs r0, 0x1
	strb r0, [r1]
_0803B4C0:
	adds r0, r5, 0
	movs r1, 0x3A
	bl SetMonData
	ldr r0, _0803B644 @ =gBaseStats
	subs r1, r6, r7
	lsls r1, 2
	adds r6, r1, r0
	ldrb r0, [r6, 0x1]
	lsls r0, 1
	mov r2, r10
	adds r1, r0, r2
	mov r0, r9
	cmp r0, 0
	bge _0803B4E0
	adds r0, 0x3
_0803B4E0:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x8]
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x8
	ldrh r1, [r4]
	movs r2, 0x1
	bl nature_stat_mod
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	adds r0, r5, 0
	movs r1, 0x3B
	adds r2, r4, 0
	bl SetMonData
	ldrb r0, [r6, 0x2]
	lsls r0, 1
	ldr r3, [sp, 0x20]
	adds r1, r0, r3
	ldr r0, [sp, 0x24]
	cmp r0, 0
	bge _0803B526
	adds r0, 0x3
_0803B526:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0xC]
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0xC
	ldrh r1, [r4]
	movs r2, 0x2
	bl nature_stat_mod
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	adds r0, r5, 0
	movs r1, 0x3C
	adds r2, r4, 0
	bl SetMonData
	ldrb r0, [r6, 0x3]
	lsls r0, 1
	ldr r2, [sp, 0x28]
	adds r1, r0, r2
	ldr r0, [sp, 0x2C]
	cmp r0, 0
	bge _0803B56C
	adds r0, 0x3
_0803B56C:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x10]
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x10
	ldrh r1, [r4]
	movs r2, 0x3
	bl nature_stat_mod
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x10]
	adds r0, r5, 0
	movs r1, 0x3D
	adds r2, r4, 0
	bl SetMonData
	ldrb r0, [r6, 0x4]
	lsls r0, 1
	ldr r3, [sp, 0x30]
	adds r1, r0, r3
	ldr r0, [sp, 0x34]
	cmp r0, 0
	bge _0803B5B2
	adds r0, 0x3
_0803B5B2:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x14]
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x14
	ldrh r1, [r4]
	movs r2, 0x4
	bl nature_stat_mod
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
	adds r0, r5, 0
	movs r1, 0x3E
	adds r2, r4, 0
	bl SetMonData
	ldrb r0, [r6, 0x5]
	lsls r0, 1
	ldr r2, [sp, 0x38]
	adds r1, r0, r2
	ldr r0, [sp, 0x3C]
	cmp r0, 0
	bge _0803B5F8
	adds r0, 0x3
_0803B5F8:
	asrs r0, 2
	adds r0, r1, r0
	ldr r1, [sp]
	muls r0, r1
	movs r1, 0x64
	bl __divsi3
	adds r0, 0x5
	str r0, [sp, 0x18]
	adds r0, r5, 0
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	add r4, sp, 0x18
	ldrh r1, [r4]
	movs r2, 0x5
	bl nature_stat_mod
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x18]
	adds r0, r5, 0
	movs r1, 0x3F
	adds r2, r4, 0
	bl SetMonData
	ldr r0, _0803B650 @ =0x0000012f
	cmp r7, r0
	bne _0803B654
	ldr r0, [sp, 0x1C]
	cmp r0, 0
	bne _0803B640
	mov r3, r8
	cmp r3, 0
	bne _0803B678
_0803B640:
	movs r0, 0x1
	b _0803B66C
	.align 2, 0
_0803B644: .4byte gBaseStats
_0803B648: .4byte 0x02000000
_0803B64C: .4byte 0x000160fa
_0803B650: .4byte 0x0000012f
_0803B654:
	ldr r1, [sp, 0x1C]
	cmp r1, 0
	bne _0803B664
	mov r0, r8
	cmp r0, 0
	bne _0803B678
	ldr r0, [sp, 0x4]
	b _0803B66C
_0803B664:
	ldr r0, [sp, 0x4]
	mov r2, r8
	subs r0, r2
	adds r0, r1, r0
_0803B66C:
	str r0, [sp, 0x1C]
	add r2, sp, 0x1C
	adds r0, r5, 0
	movs r1, 0x39
	bl SetMonData
_0803B678:
	add sp, 0x40
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end CalculateMonStats

	thumb_func_start sub_803B4B4
sub_803B4B4: @ 803B688
	push {r4,lr}
	sub sp, 0x4
	adds r2, r0, 0
	adds r4, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r2, 0
	movs r2, 0x50
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x3A
	mov r2, sp
	bl SetMonData
	movs r0, 0xFF
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x40
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	bl CalculateMonStats
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_803B4B4

	thumb_func_start GetLevelFromMonExp
GetLevelFromMonExp: @ 803B6D8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x19
	movs r2, 0
	bl GetMonData
	adds r3, r0, 0
	movs r2, 0x1
	ldr r6, _0803B73C @ =gExperienceTables
	ldr r1, _0803B740 @ =gBaseStats
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x13]
	movs r5, 0xCA
	lsls r5, 1
	muls r0, r5
	adds r0, 0x4
	adds r0, r6
	ldr r0, [r0]
	cmp r0, r3
	bhi _0803B72E
	adds r4, r1, 0
_0803B718:
	adds r2, 0x1
	cmp r2, 0x64
	bgt _0803B72E
	lsls r1, r2, 2
	ldrb r0, [r4, 0x13]
	muls r0, r5
	adds r1, r0
	adds r1, r6
	ldr r0, [r1]
	cmp r0, r3
	bls _0803B718
_0803B72E:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803B73C: .4byte gExperienceTables
_0803B740: .4byte gBaseStats
	thumb_func_end GetLevelFromMonExp

	thumb_func_start GetLevelFromBoxMonExp
GetLevelFromBoxMonExp: @ 803B744
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x19
	movs r2, 0
	bl GetBoxMonData
	adds r3, r0, 0
	movs r2, 0x1
	ldr r6, _0803B7A8 @ =gExperienceTables
	ldr r1, _0803B7AC @ =gBaseStats
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r1, r0, r1
	ldrb r0, [r1, 0x13]
	movs r5, 0xCA
	lsls r5, 1
	muls r0, r5
	adds r0, 0x4
	adds r0, r6
	ldr r0, [r0]
	cmp r0, r3
	bhi _0803B79A
	adds r4, r1, 0
_0803B784:
	adds r2, 0x1
	cmp r2, 0x64
	bgt _0803B79A
	lsls r1, r2, 2
	ldrb r0, [r4, 0x13]
	muls r0, r5
	adds r1, r0
	adds r1, r6
	ldr r0, [r1]
	cmp r0, r3
	bls _0803B784
_0803B79A:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803B7A8: .4byte gExperienceTables
_0803B7AC: .4byte gBaseStats
	thumb_func_end GetLevelFromBoxMonExp

	thumb_func_start GiveMoveToMon
GiveMoveToMon: @ 803B7B0
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	bl GiveMoveToBoxMon
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end GiveMoveToMon

	thumb_func_start GiveMoveToBoxMon
GiveMoveToBoxMon: @ 803B7C4
	push {r4-r7,lr}
	sub sp, 0x4
	adds r7, r0, 0
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	mov r6, sp
_0803B7D2:
	adds r4, r5, 0
	adds r4, 0xD
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0
	bl GetBoxMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	bne _0803B810
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, sp
	bl SetBoxMonData
	adds r1, r5, 0
	adds r1, 0x11
	ldrh r0, [r6]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _0803B80C @ =0x08208100
	adds r2, r0
	adds r0, r7, 0
	bl SetBoxMonData
	ldrh r0, [r6]
	b _0803B828
	.align 2, 0
_0803B80C: .4byte 0x08208100
_0803B810:
	ldrh r1, [r6]
	cmp r0, r1
	bne _0803B820
	ldr r0, _0803B81C @ =0x0000fffe
	b _0803B828
	.align 2, 0
_0803B81C: .4byte 0x0000fffe
_0803B820:
	adds r5, 0x1
	cmp r5, 0x3
	ble _0803B7D2
	ldr r0, _0803B830 @ =0x0000ffff
_0803B828:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B830: .4byte 0x0000ffff
	thumb_func_end GiveMoveToBoxMon

	thumb_func_start GiveMoveToBattleMon
GiveMoveToBattleMon: @ 803B834
	push {r4,r5,lr}
	lsls r1, 16
	lsrs r4, r1, 16
	movs r3, 0
	adds r5, r0, 0
	adds r5, 0x24
	ldr r2, _0803B860 @ =gBattleMoves
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 2
	adds r2, r1, r2
	adds r1, r0, 0
	adds r1, 0xC
_0803B84E:
	ldrh r0, [r1]
	cmp r0, 0
	bne _0803B864
	strh r4, [r1]
	adds r1, r5, r3
	ldrb r0, [r2, 0x4]
	strb r0, [r1]
	adds r0, r4, 0
	b _0803B86E
	.align 2, 0
_0803B860: .4byte gBattleMoves
_0803B864:
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x3
	ble _0803B84E
	ldr r0, _0803B874 @ =0x0000ffff
_0803B86E:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803B874: .4byte 0x0000ffff
	thumb_func_end GiveMoveToBattleMon

	thumb_func_start SetMonMoveSlot
SetMonMoveSlot: @ 803B878
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r4, r2, 0
	mov r0, sp
	strh r1, [r0]
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r5, 0
	mov r2, sp
	bl SetMonData
	adds r4, 0x11
	mov r0, sp
	ldrh r0, [r0]
	lsls r2, r0, 1
	adds r2, r0
	lsls r2, 2
	ldr r0, _0803B8B4 @ =0x08208100
	adds r2, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl SetMonData
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803B8B4: .4byte 0x08208100
	thumb_func_end SetMonMoveSlot

	thumb_func_start SetBattleMonMoveSlot
SetBattleMonMoveSlot: @ 803B8B8
	push {r4,lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r2, 24
	lsls r4, r2, 1
	adds r3, r0, 0
	adds r3, 0xC
	adds r3, r4
	strh r1, [r3]
	adds r0, 0x24
	adds r0, r2
	ldr r3, _0803B8E4 @ =gBattleMoves
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 2
	adds r2, r3
	ldrb r1, [r2, 0x4]
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B8E4: .4byte gBattleMoves
	thumb_func_end SetBattleMonMoveSlot

	thumb_func_start GiveMonInitialMoveset
GiveMonInitialMoveset: @ 803B8E8
	push {lr}
	bl GiveBoxMonInitialMoveset
	pop {r0}
	bx r0
	thumb_func_end GiveMonInitialMoveset

	thumb_func_start GiveBoxMonInitialMoveset
GiveBoxMonInitialMoveset: @ 803B8F4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	bl GetLevelFromBoxMonExp
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r0, _0803B990 @ =gLevelUpLearnsets
	lsls r6, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	ldrh r1, [r0]
	ldr r2, _0803B994 @ =0xffff0000
	lsrs r0, r2, 16
	cmp r1, r0
	beq _0803B980
	mov r9, r2
	movs r3, 0
_0803B932:
	ldr r0, _0803B990 @ =gLevelUpLearnsets
	adds r7, r6, r0
	ldr r0, [r7]
	adds r0, r3, r0
	ldrh r2, [r0]
	movs r1, 0xFE
	lsls r1, 8
	adds r0, r1, 0
	ands r0, r2
	mov r4, r10
	lsls r1, r4, 9
	cmp r0, r1
	bgt _0803B980
	ldr r1, _0803B998 @ =0x000001ff
	adds r0, r1, 0
	adds r4, r0, 0
	ands r4, r2
	mov r0, r8
	adds r1, r4, 0
	str r3, [sp]
	bl GiveMoveToBoxMon
	lsls r0, 16
	mov r1, r9
	lsrs r5, r1, 16
	ldr r3, [sp]
	cmp r0, r9
	bne _0803B974
	mov r0, r8
	adds r1, r4, 0
	bl DeleteFirstMoveAndGiveMoveToBoxMon
	ldr r3, [sp]
_0803B974:
	adds r3, 0x2
	ldr r0, [r7]
	adds r0, r3, r0
	ldrh r0, [r0]
	cmp r0, r5
	bne _0803B932
_0803B980:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803B990: .4byte gLevelUpLearnsets
_0803B994: .4byte 0xffff0000
_0803B998: .4byte 0x000001ff
	thumb_func_end GiveBoxMonInitialMoveset

	thumb_func_start sub_803B7C8
sub_803B7C8: @ 803B99C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r8, r0
	lsls r4, r1, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	mov r0, r8
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r0, r8
	movs r1, 0x38
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	cmp r4, 0
	beq _0803BA34
	ldr r4, _0803BA20 @ =byte_2024E88
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r4]
	ldr r2, _0803BA24 @ =gLevelUpLearnsets
	mov r5, r9
	lsls r3, r5, 2
	adds r5, r3, r2
	ldr r0, [r5]
	ldrh r1, [r0]
	movs r7, 0xFE
	lsls r7, 8
	adds r0, r7, 0
	ands r0, r1
	adds r6, r4, 0
	mov r12, r2
	mov r1, r10
	lsls r4, r1, 9
	cmp r0, r4
	beq _0803BA5C
	adds r2, r6, 0
	ldr r0, _0803BA28 @ =0x0000ffff
	mov r12, r0
	adds r6, r7, 0
	adds r3, r5, 0
_0803BA08:
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	ldrb r0, [r2]
	ldr r1, [r3]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, r12
	bne _0803BA2C
	movs r0, 0
	b _0803BA88
	.align 2, 0
_0803BA20: .4byte byte_2024E88
_0803BA24: .4byte gLevelUpLearnsets
_0803BA28: .4byte 0x0000ffff
_0803BA2C:
	adds r0, r6, 0
	ands r0, r1
	cmp r0, r4
	bne _0803BA08
_0803BA34:
	ldr r3, _0803BA98 @ =gLevelUpLearnsets
	mov r1, r9
	lsls r4, r1, 2
	adds r1, r4, r3
	ldr r2, _0803BA9C @ =byte_2024E88
	ldrb r0, [r2]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	movs r0, 0xFE
	lsls r0, 8
	ands r0, r1
	mov r5, r10
	lsls r1, r5, 9
	adds r6, r2, 0
	mov r12, r3
	adds r3, r4, 0
	cmp r0, r1
	bne _0803BA86
_0803BA5C:
	ldr r2, _0803BAA0 @ =word_2024E82
	mov r0, r12
	adds r1, r3, r0
	ldrb r0, [r6]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0803BAA4 @ =0x000001ff
	ands r0, r1
	strh r0, [r2]
	ldrb r0, [r6]
	adds r0, 0x1
	strb r0, [r6]
	ldrh r1, [r2]
	mov r0, r8
	bl GiveMoveToMon
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp]
_0803BA86:
	ldr r0, [sp]
_0803BA88:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803BA98: .4byte gLevelUpLearnsets
_0803BA9C: .4byte byte_2024E88
_0803BAA0: .4byte word_2024E82
_0803BAA4: .4byte 0x000001ff
	thumb_func_end sub_803B7C8

	thumb_func_start DeleteFirstMoveAndGiveMoveToMon
DeleteFirstMoveAndGiveMoveToMon: @ 803BAA8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r4, 0
	add r7, sp, 0x8
	add r0, sp, 0xC
	mov r9, r0
	mov r5, sp
_0803BAC4:
	adds r1, r4, 0
	adds r1, 0xE
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	strh r0, [r5]
	adds r1, r4, 0
	adds r1, 0x12
	adds r0, r6, 0
	movs r2, 0
	bl GetMonData
	adds r1, r7, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _0803BAC4
	adds r0, r6, 0
	movs r1, 0x15
	movs r2, 0
	bl GetMonData
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r1]
	lsrs r0, 2
	strb r0, [r1]
	mov r0, sp
	mov r2, r8
	strh r2, [r0, 0x6]
	ldr r1, _0803BB50 @ =gBattleMoves
	mov r2, r8
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x4]
	strb r0, [r7, 0x3]
	movs r4, 0
	mov r5, sp
_0803BB18:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	adds r2, r5, 0
	bl SetMonData
	adds r1, r4, 0
	adds r1, 0x11
	adds r2, r7, r4
	adds r0, r6, 0
	bl SetMonData
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0803BB18
	adds r0, r6, 0
	movs r1, 0x15
	mov r2, r9
	bl SetMonData
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BB50: .4byte gBattleMoves
	thumb_func_end DeleteFirstMoveAndGiveMoveToMon

	thumb_func_start DeleteFirstMoveAndGiveMoveToBoxMon
DeleteFirstMoveAndGiveMoveToBoxMon: @ 803BB54
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r6, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	movs r4, 0
	add r7, sp, 0x8
	add r0, sp, 0xC
	mov r9, r0
	mov r5, sp
_0803BB70:
	adds r1, r4, 0
	adds r1, 0xE
	adds r0, r6, 0
	movs r2, 0
	bl GetBoxMonData
	strh r0, [r5]
	adds r1, r4, 0
	adds r1, 0x12
	adds r0, r6, 0
	movs r2, 0
	bl GetBoxMonData
	adds r1, r7, r4
	strb r0, [r1]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x2
	ble _0803BB70
	adds r0, r6, 0
	movs r1, 0x15
	movs r2, 0
	bl GetBoxMonData
	mov r1, r9
	strb r0, [r1]
	ldrb r0, [r1]
	lsrs r0, 2
	strb r0, [r1]
	mov r0, sp
	mov r2, r8
	strh r2, [r0, 0x6]
	ldr r1, _0803BBFC @ =gBattleMoves
	mov r2, r8
	lsls r0, r2, 1
	add r0, r8
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x4]
	strb r0, [r7, 0x3]
	movs r4, 0
	mov r5, sp
_0803BBC4:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r6, 0
	adds r2, r5, 0
	bl SetBoxMonData
	adds r1, r4, 0
	adds r1, 0x11
	adds r2, r7, r4
	adds r0, r6, 0
	bl SetBoxMonData
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0803BBC4
	adds r0, r6, 0
	movs r1, 0x15
	mov r2, r9
	bl SetBoxMonData
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BBFC: .4byte gBattleMoves
	thumb_func_end DeleteFirstMoveAndGiveMoveToBoxMon

	.align 2, 0 @ Don't pad with nop.
