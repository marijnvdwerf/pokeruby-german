	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80AAC5C
sub_80AAC5C: @ 80AADAC
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	cmp r1, 0
	ble _080AADC8
	ldr r1, _080AADC4
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	adds r4, r1, 0
	b _080AADD6
	.align 2, 0
_080AADC4: .4byte gScriptContestRank
_080AADC8:
	ldr r0, _080AAE0C
	ldrh r2, [r0]
	adds r4, r0, 0
	cmp r2, 0
	beq _080AADD6
	subs r0, r2, 0x1
	strh r0, [r4]
_080AADD6:
	adds r1, r4, 0
	ldrh r0, [r1]
	cmp r0, 0x3
	bls _080AADE2
	movs r0, 0x3
	strh r0, [r1]
_080AADE2:
	ldrb r0, [r4]
	bl sub_80AA5E8
	ldr r0, _080AAE10
	ldrb r0, [r0]
	ldrb r1, [r4]
	bl sub_80AE398
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA280
	ldrh r0, [r5, 0x32]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80AA658
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAE0C: .4byte gScriptContestRank
_080AAE10: .4byte gScriptContestCategory
	thumb_func_end sub_80AAC5C

	thumb_func_start sub_80AACC4
sub_80AACC4: @ 80AAE14
	push {lr}
	bl UpdatePaletteFade
	ldr r0, _080AAE48
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080AAE44
	bl SetDebugMonForContest
	ldr r0, _080AAE4C
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080AAE3E
	ldr r0, _080AAE50
	ldrb r0, [r0]
	bl sub_80AE82C
_080AAE3E:
	ldr r0, _080AAE54
	bl SetMainCallback2
_080AAE44:
	pop {r0}
	bx r0
	.align 2, 0
_080AAE48: .4byte gPaletteFade
_080AAE4C: .4byte gUnknown_0203869A
_080AAE50: .4byte 0x02000000
_080AAE54: .4byte sub_80AB47C
	thumb_func_end sub_80AACC4

	thumb_func_start sub_80AAD08
sub_80AAD08: @ 80AAE58
	push {r4,lr}
	sub sp, 0x4
	lsls r1, 24
	asrs r1, 24
	cmp r1, 0x1
	bne _080AAE82
	ldr r1, _080AAE8C
	ldrh r0, [r0, 0x34]
	movs r4, 0
	strb r0, [r1]
	ldr r0, _080AAE90
	bl SetMainCallback2
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_080AAE82:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AAE8C: .4byte 0x02000000
_080AAE90: .4byte sub_80AACC4
	thumb_func_end sub_80AAD08

	thumb_func_start sub_80AAD44
sub_80AAD44: @ 80AAE94
	push {r4,r5,lr}
	lsls r1, 24
	asrs r1, 24
	cmp r1, 0x1
	bne _080AAEC2
	bl SetDebugMonForContest
	movs r4, 0
	ldr r5, _080AAEC8
_080AAEA6:
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r1, _080AAECC
	ldrb r1, [r1]
	bl sub_80AE770
	strh r0, [r5]
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _080AAEA6
	ldr r0, _080AAED0
	bl SetMainCallback2
_080AAEC2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AAEC8: .4byte gUnknown_02038670
_080AAECC: .4byte gScriptContestCategory
_080AAED0: .4byte sub_805469C
	thumb_func_end sub_80AAD44

	thumb_func_start sub_80AAD84
sub_80AAD84: @ 80AAED4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x64
	mov r9, r0
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x48]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x4C]
	lsls r3, 24
	lsrs r3, 24
	mov r10, r3
	mov r5, r10
	adds r5, 0x1
	lsls r1, r5, 8
	ldr r0, _080AB014
	subs r1, r0, r1
	movs r0, 0
	str r0, [sp, 0x44]
	ldr r4, _080AB018
	add r0, sp, 0x44
	str r0, [r4]
	str r1, [r4, 0x4]
	ldr r0, _080AB01C
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	mov r0, r9
	bl StringLength
	lsls r0, 16
	lsrs r7, r0, 16
	cmp r7, 0x8
	bls _080AAF20
	movs r7, 0x8
_080AAF20:
	movs r6, 0
	mov r8, r5
	mov r1, r10
	lsls r1, 1
	str r1, [sp, 0x58]
	ldr r2, [sp, 0x48]
	adds r2, 0x20
	str r2, [sp, 0x5C]
	cmp r6, r7
	bge _080AAF6E
	add r5, sp, 0x40
	add r0, sp, 0x20
	mov r10, r0
	ldr r2, _080AB014
_080AAF3C:
	mov r1, r9
	adds r0, r1, r6
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, 0xFF
	strb r0, [r5, 0x1]
	mov r0, sp
	adds r1, r5, 0
	str r2, [sp, 0x60]
	bl sub_80034D4
	mov r1, r8
	lsls r0, r1, 8
	ldr r2, [sp, 0x60]
	subs r0, r2, r0
	mov r1, r10
	str r1, [r4]
	str r0, [r4, 0x4]
	ldr r0, _080AB020
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, 0x20
	adds r6, 0x1
	cmp r6, r7
	blt _080AAF3C
_080AAF6E:
	movs r1, 0x7C
	ldr r2, [sp, 0x58]
	subs r1, r2
	lsls r1, 24
	lsrs r7, r1, 24
	ldr r0, _080AB024
	mov r9, r0
	lsls r3, r7, 3
	add r3, r9
	ldr r0, _080AB028
	ldr r1, [r0]
	ldr r2, [r0, 0x4]
	str r1, [sp, 0x50]
	str r2, [sp, 0x54]
	str r1, [r3, 0x3C]
	str r2, [r3, 0x40]
	mov r2, r8
	lsls r0, r2, 3
	movs r1, 0x80
	lsls r1, 3
	adds r2, r1, 0
	subs r2, r0
	adds r6, r3, 0
	adds r6, 0x40
	ldr r0, _080AB02C
	mov r8, r0
	mov r1, r8
	ands r2, r1
	ldrh r5, [r6]
	ldr r4, _080AB030
	adds r0, r4, 0
	ands r0, r5
	orrs r0, r2
	strh r0, [r6]
	ldrh r5, [r3, 0x3E]
	ldr r2, _080AB034
	adds r0, r2, 0
	ands r0, r5
	ldr r1, [sp, 0x48]
	orrs r0, r1
	strh r0, [r3, 0x3E]
	adds r3, 0x3C
	add r0, sp, 0x4C
	ldrb r0, [r0]
	strb r0, [r3]
	adds r1, r7, 0x1
	lsls r1, 3
	mov r0, r9
	adds r7, r1, r0
	ldr r0, [sp, 0x50]
	ldr r1, [sp, 0x54]
	str r0, [r7, 0x3C]
	str r1, [r7, 0x40]
	ldrh r0, [r6]
	lsls r0, 22
	lsrs r0, 22
	adds r0, 0x4
	adds r5, r7, 0
	adds r5, 0x40
	mov r1, r8
	ands r0, r1
	ldrh r3, [r5]
	ands r4, r3
	orrs r4, r0
	strh r4, [r5]
	ldrh r0, [r7, 0x3E]
	ands r2, r0
	ldr r0, [sp, 0x5C]
	orrs r2, r0
	strh r2, [r7, 0x3E]
	adds r1, r7, 0
	adds r1, 0x3C
	add r2, sp, 0x4C
	ldrb r2, [r2]
	strb r2, [r1]
	add sp, 0x64
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB014: .4byte 0x06018000
_080AB018: .4byte 0x040000d4
_080AB01C: .4byte 0x85000040
_080AB020: .4byte 0x84000008
_080AB024: .4byte gMain
_080AB028: .4byte gUnknown_083C9400
_080AB02C: .4byte 0x000003ff
_080AB030: .4byte 0xfffffc00
_080AB034: .4byte 0xfffffe00
	thumb_func_end sub_80AAD84

	thumb_func_start unref_sub_80AAEE8
unref_sub_80AAEE8: @ 80AB038
	push {r4-r7,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	lsls r3, 24
	lsrs r5, r3, 24
	movs r0, 0
	cmp r4, 0
	bge _080AB058
	mov r1, sp
	movs r0, 0xAE
	strb r0, [r1]
	movs r0, 0x1
_080AB058:
	add r0, sp
	adds r1, r4, 0
	cmp r1, 0
	bge _080AB062
	negs r1, r1
_080AB062:
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	mov r0, sp
	adds r1, r7, 0
	adds r2, r6, 0
	adds r3, r5, 0
	bl sub_80AAD84
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80AAEE8

	thumb_func_start sub_80AAF30
sub_80AAF30: @ 80AB080
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	ldr r1, _080AB110
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _080AB114
	movs r0, 0x3
	strb r0, [r1]
	movs r0, 0
	bl sub_80AE098
	movs r4, 0x3
	movs r5, 0x1
	negs r5, r5
	ldr r3, _080AB118
	movs r2, 0x3
_080AB0A6:
	adds r1, r4, r3
	subs r0, r2, r4
	strb r0, [r1]
	subs r4, 0x1
	cmp r4, r5
	bgt _080AB0A6
	movs r4, 0
	movs r6, 0
	ldr r7, _080AB11C
	ldr r5, _080AB120
	mov r9, r5
_080AB0BC:
	lsls r1, r4, 1
	strh r6, [r7]
	ldr r0, _080AB124
	mov r8, r0
	adds r0, r1, r0
	strh r6, [r0]
	ldr r3, _080AB128
	adds r1, r3
	strh r6, [r1]
	adds r0, r5, 0
	mov r1, r9
	adds r1, 0xC0
	movs r2, 0x40
	str r3, [sp]
	bl memcpy
	adds r7, 0x2
	adds r5, 0x40
	adds r4, 0x1
	ldr r3, [sp]
	cmp r4, 0x2
	ble _080AB0BC
	ldr r0, _080AB11C
	movs r1, 0x96
	lsls r1, 1
	strh r1, [r0, 0x6]
	movs r0, 0xC8
	lsls r0, 1
	mov r1, r8
	strh r0, [r1, 0x6]
	strh r0, [r3, 0x6]
	movs r0, 0xFE
	bl sub_80B2A7C
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB110: .4byte gUnknown_0203856C
_080AB114: .4byte gContestPlayerMonIndex
_080AB118: .4byte gUnknown_02038690
_080AB11C: .4byte gUnknown_02038670
_080AB120: .4byte gContestMons
_080AB124: .4byte gUnknown_02038680
_080AB128: .4byte gUnknown_02038678
	thumb_func_end sub_80AAF30

	thumb_func_start MatsudaDebugMenu_SetHighScore
MatsudaDebugMenu_SetHighScore: @ 80AB12C
	push {lr}
	bl sub_80AAF30
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end MatsudaDebugMenu_SetHighScore

	thumb_func_start MatsudaDebugMenu_ResetHighScore
MatsudaDebugMenu_ResetHighScore: @ 80AB13C
	push {r4,lr}
	ldr r1, _080AB16C
	movs r0, 0
	strb r0, [r1]
	movs r4, 0
	ldr r3, _080AB170
	ldr r2, _080AB174
	ldr r1, _080AB178
	movs r0, 0x3
_080AB14E:
	strh r4, [r1]
	strh r4, [r2]
	strh r4, [r3]
	adds r3, 0x2
	adds r2, 0x2
	adds r1, 0x2
	subs r0, 0x1
	cmp r0, 0
	bge _080AB14E
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080AB16C: .4byte gUnknown_0203856C
_080AB170: .4byte gUnknown_02038678
_080AB174: .4byte gUnknown_02038680
_080AB178: .4byte gUnknown_02038670
	thumb_func_end MatsudaDebugMenu_ResetHighScore

	thumb_func_start MatsudaDebugMenu_SetArtMuseumItems
MatsudaDebugMenu_SetArtMuseumItems: @ 80AB17C
	push {r4,r5,lr}
	ldr r1, _080AB1C8
	movs r0, 0x3
	strb r0, [r1]
	movs r0, 0
	bl sub_80AE098
	movs r2, 0x3
	movs r5, 0x1
	negs r5, r5
	ldr r4, _080AB1CC
	movs r3, 0x3
_080AB194:
	adds r1, r2, r4
	subs r0, r3, r2
	strb r0, [r1]
	subs r2, 0x1
	cmp r2, r5
	bgt _080AB194
	ldr r1, _080AB1D0
	movs r0, 0
	strh r0, [r1]
	adds r4, r1, 0
_080AB1A8:
	movs r0, 0xFF
	bl sub_80B2A7C
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bls _080AB1A8
	bl sub_8071C20
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AB1C8: .4byte gContestPlayerMonIndex
_080AB1CC: .4byte gUnknown_02038690
_080AB1D0: .4byte gScriptContestCategory
	thumb_func_end MatsudaDebugMenu_SetArtMuseumItems

	thumb_func_start unref_sub_80AB084
unref_sub_80AB084: @ 80AB1D4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	ldr r0, _080AB2B0
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x22
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	movs r2, 0x80
	lsls r2, 19
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r2]
	ldr r3, _080AB2B4
	ldrh r2, [r3]
	strh r1, [r3]
	ldr r4, _080AB2B8
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r1, _080AB2BC
	movs r0, 0x8
	strh r0, [r1]
	bl ResetTasks
	bl ResetSpriteData
	ldr r0, _080AB2C0
	bl SetMainCallback2
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	movs r5, 0
	ldr r1, _080AB2C4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080AB2C8
	movs r7, 0x85
	lsls r7, 24
_080AB258:
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080AB258
	str r5, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r4, _080AB2CC
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r5, _080AB2D0
	adds r0, r5, 0
	adds r1, r4, 0
	bl InitWindowFromConfig
	adds r0, r4, 0
	bl LoadFontDefaultPalette
	movs r0, 0x7
	str r0, [sp]
	adds r0, r5, 0
	mov r1, r8
	movs r2, 0x1
	movs r3, 0x9
	bl sub_8003460
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB2B0: .4byte 0x04000010
_080AB2B4: .4byte 0x04000208
_080AB2B8: .4byte 0x04000200
_080AB2BC: .4byte 0x04000004
_080AB2C0: .4byte sub_80AB184
_080AB2C4: .4byte 0x040000d4
_080AB2C8: .4byte 0x85000400
_080AB2CC: .4byte gWindowConfig_81E6FD8
_080AB2D0: .4byte gUnknown_03004210
	thumb_func_end unref_sub_80AB084

	thumb_func_start sub_80AB184
sub_80AB184: @ 80AB2D4
	ldr r0, _080AB2F8
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_080AB2F8: .4byte 0x04000010
	thumb_func_end sub_80AB184

	.align 2, 0 @ Don't pad with nop.
