	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_811AABC
sub_811AABC: @ 811AEB0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AEC4 @ =gMain
	ldr r1, _0811AEC8 @ =sub_8054398
	str r1, [r2, 0x4]
	bl sub_811AB20
	pop {r0}
	bx r0
	.align 2, 0
_0811AEC4: .4byte gMain
_0811AEC8: .4byte sub_8054398
	thumb_func_end sub_811AABC

	thumb_func_start sub_811AAD8
sub_811AAD8: @ 811AECC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_811AB20
	pop {r0}
	bx r0
	thumb_func_end sub_811AAD8

	thumb_func_start sub_811AAE8
sub_811AAE8: @ 811AEDC
	push {lr}
	ldr r0, _0811AF00 @ =sub_811AB50
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0811AF04 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0x26
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _0811AF08
	movs r0, 0
	b _0811AF10
	.align 2, 0
_0811AF00: .4byte sub_811AB50
_0811AF04: .4byte gTasks
_0811AF08:
	adds r0, r2, 0
	bl DestroyTask
	movs r0, 0x1
_0811AF10:
	pop {r1}
	bx r1
	thumb_func_end sub_811AAE8

	thumb_func_start sub_811AB20
sub_811AB20: @ 811AF14
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0811AF3C @ =sub_811AB50
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AF40 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811AF3C: .4byte sub_811AB50
_0811AF40: .4byte gTasks
	thumb_func_end sub_811AB20

	thumb_func_start sub_811AB50
sub_811AB50: @ 811AF44
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811AF74 @ =gUnknown_083FD794
	ldr r2, _0811AF78 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811AF56:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811AF56
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811AF74: .4byte gUnknown_083FD794
_0811AF78: .4byte gTasks
	thumb_func_end sub_811AB50

	thumb_func_start sub_811AB88
sub_811AB88: @ 811AF7C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_807DE10
	ldr r0, _0811AFA8 @ =gPlttBufferFaded
	ldr r1, _0811AFAC @ =gPlttBufferUnfaded
	ldr r2, _0811AFB0 @ =0x04000100
	bl CpuSet
	ldr r1, _0811AFB4 @ =gUnknown_083FD70C
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	cmp r0, 0
	bne _0811AFB8
	movs r0, 0x2
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _0811AFC6
	.align 2, 0
_0811AFA8: .4byte gPlttBufferFaded
_0811AFAC: .4byte gPlttBufferUnfaded
_0811AFB0: .4byte 0x04000100
_0811AFB4: .4byte gUnknown_083FD70C
_0811AFB8:
	movs r1, 0x4
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
_0811AFC6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811AB88

	thumb_func_start sub_811ABD8
sub_811ABD8: @ 811AFCC
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811AFEC @ =gUnknown_083FD70C
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0811AFF0
	movs r0, 0
	b _0811AFF8
	.align 2, 0
_0811AFEC: .4byte gUnknown_083FD70C
_0811AFF0:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
_0811AFF8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811ABD8

	thumb_func_start sub_811AC0C
sub_811AC0C: @ 811B000
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811B024 @ =gBattleTransitionFuncs
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B024: .4byte gBattleTransitionFuncs
	thumb_func_end sub_811AC0C

	thumb_func_start sub_811AC34
sub_811AC34: @ 811B028
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	strh r0, [r4, 0x26]
	ldr r1, _0811B054 @ =gBattleTransitionFuncs
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0811B04C
	movs r0, 0x1
	strh r0, [r4, 0x26]
_0811B04C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B054: .4byte gBattleTransitionFuncs
	thumb_func_end sub_811AC34

	thumb_func_start sub_811AC64
sub_811AC64: @ 811B058
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r1, _0811B08C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x8]
	movs r3, 0x8
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bne _0811B090
	adds r0, r2, 0x1
	strh r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [sp]
	movs r0, 0
	movs r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_811D4C8
	b _0811B0A0
	.align 2, 0
_0811B08C: .4byte gTasks
_0811B090:
	bl sub_811D52C
	lsls r0, 24
	cmp r0, 0
	beq _0811B0A0
	adds r0, r4, 0
	bl DestroyTask
_0811B0A0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_811AC64

	thumb_func_start sub_811ACB4
sub_811ACB4: @ 811B0A8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B0D8 @ =gUnknown_083FD7A4
	ldr r2, _0811B0DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B0BA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B0BA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B0D8: .4byte gUnknown_083FD7A4
_0811B0DC: .4byte gTasks
	thumb_func_end sub_811ACB4

	thumb_func_start sub_811ACEC
sub_811ACEC: @ 811B0E0
	ldr r2, _0811B10C @ =0x0400004c
	movs r1, 0
	strh r1, [r2]
	subs r2, 0x42
	ldrh r1, [r2]
	movs r3, 0x40
	orrs r1, r3
	strh r1, [r2]
	adds r2, 0x2
	ldrh r1, [r2]
	orrs r1, r3
	strh r1, [r2]
	adds r2, 0x2
	ldrh r1, [r2]
	orrs r1, r3
	strh r1, [r2]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0x1
	bx lr
	.align 2, 0
_0811B10C: .4byte 0x0400004c
	thumb_func_end sub_811ACEC

	thumb_func_start sub_811AD1C
sub_811AD1C: @ 811B110
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	cmp r2, 0
	beq _0811B126
	subs r0, 0x1
	strh r0, [r4, 0xA]
	b _0811B164
_0811B126:
	movs r0, 0x4
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA
	bne _0811B148
	movs r1, 0x1
	negs r1, r1
	str r2, [sp]
	adds r0, r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811B148:
	ldr r2, _0811B170 @ =0x0400004c
	ldrh r0, [r4, 0xC]
	movs r1, 0xF
	ands r1, r0
	lsls r0, r1, 4
	adds r0, r1
	strh r0, [r2]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xE
	ble _0811B164
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811B164:
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B170: .4byte 0x0400004c
	thumb_func_end sub_811AD1C

	thumb_func_start sub_811AD80
sub_811AD80: @ 811B174
	push {lr}
	ldr r0, _0811B198 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811B190
	ldr r0, _0811B19C @ =sub_811ACB4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B190:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811B198: .4byte gPaletteFade
_0811B19C: .4byte sub_811ACB4
	thumb_func_end sub_811AD80

	thumb_func_start sub_811ADAC
sub_811ADAC: @ 811B1A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B1D0 @ =gUnknown_083FD7B0
	ldr r2, _0811B1D4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B1B2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B1B2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B1D0: .4byte gUnknown_083FD7B0
_0811B1D4: .4byte gTasks
	thumb_func_end sub_811ADAC

	thumb_func_start sub_811ADE4
sub_811ADE4: @ 811B1D8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0811B248 @ =gUnknown_03005560
	ldr r1, _0811B24C @ =0x0200c000
	movs r2, 0x14
	ldrsh r1, [r1, r2]
	str r4, [sp]
	movs r2, 0xA0
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_811D6E8
	ldr r0, _0811B250 @ =sub_811AEE0
	bl SetVBlankCallback
	ldr r0, _0811B254 @ =sub_811AF18
	bl SetHBlankCallback
	ldr r3, _0811B258 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0811B25C @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0811B260 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B248: .4byte gUnknown_03005560
_0811B24C: .4byte 0x0200c000
_0811B250: .4byte sub_811AEE0
_0811B254: .4byte sub_811AF18
_0811B258: .4byte 0x04000208
_0811B25C: .4byte 0x04000200
_0811B260: .4byte 0x04000004
	thumb_func_end sub_811ADE4

	thumb_func_start sub_811AE70
sub_811AE70: @ 811B264
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, _0811B2C4 @ =0x0200c000
	ldrb r1, [r4]
	movs r1, 0
	strb r1, [r4]
	ldrh r1, [r0, 0xA]
	adds r1, 0x4
	strh r1, [r0, 0xA]
	ldrh r1, [r0, 0xC]
	adds r1, 0x8
	strh r1, [r0, 0xC]
	ldr r3, _0811B2C8 @ =gUnknown_03004DE0
	movs r2, 0x14
	ldrsh r1, [r4, r2]
	movs r5, 0xA
	ldrsh r2, [r0, r5]
	movs r5, 0xC
	ldrsh r0, [r0, r5]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	adds r0, r3, 0
	movs r3, 0x2
	bl sub_811D6E8
	ldr r0, _0811B2CC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811B2B2
	ldr r0, _0811B2D0 @ =sub_811ADAC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B2B2:
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B2C4: .4byte 0x0200c000
_0811B2C8: .4byte gUnknown_03004DE0
_0811B2CC: .4byte gPaletteFade
_0811B2D0: .4byte sub_811ADAC
	thumb_func_end sub_811AE70

	thumb_func_start sub_811AEE0
sub_811AEE0: @ 811B2D4
	push {lr}
	bl sub_811D67C
	ldr r0, _0811B2FC @ =0x0200c000
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811B2F6
	ldr r1, _0811B300 @ =0x040000d4
	ldr r0, _0811B304 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811B308 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811B2F6:
	pop {r0}
	bx r0
	.align 2, 0
_0811B2FC: .4byte 0x0200c000
_0811B300: .4byte 0x040000d4
_0811B304: .4byte gUnknown_03004DE0
_0811B308: .4byte 0x800000a0
	thumb_func_end sub_811AEE0

	thumb_func_start sub_811AF18
sub_811AF18: @ 811B30C
	ldr r1, _0811B32C @ =gUnknown_03004DE0
	ldr r0, _0811B330 @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811B334 @ =0x04000014
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811B32C: .4byte gUnknown_03004DE0
_0811B330: .4byte 0x04000006
_0811B334: .4byte 0x04000014
	thumb_func_end sub_811AF18

	thumb_func_start sub_811AF44
sub_811AF44: @ 811B338
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B368 @ =gUnknown_083FD7B8
	ldr r2, _0811B36C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B34A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B34A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B368: .4byte gUnknown_083FD7B8
_0811B36C: .4byte gTasks
	thumb_func_end sub_811AF44

	thumb_func_start sub_811AF7C
sub_811AF7C: @ 811B370
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0x4
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0811B3D8 @ =0x0200c000
	ldr r0, _0811B3DC @ =gUnknown_03005560
	movs r2, 0x16
	ldrsh r1, [r1, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	ldr r0, _0811B3E0 @ =sub_811B08C
	bl SetVBlankCallback
	ldr r0, _0811B3E4 @ =sub_811B0C4
	bl SetHBlankCallback
	ldr r3, _0811B3E8 @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0811B3EC @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x3
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0811B3F0 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x18
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B3D8: .4byte 0x0200c000
_0811B3DC: .4byte gUnknown_03005560
_0811B3E0: .4byte sub_811B08C
_0811B3E4: .4byte sub_811B0C4
_0811B3E8: .4byte 0x04000208
_0811B3EC: .4byte 0x04000200
_0811B3F0: .4byte 0x04000004
	thumb_func_end sub_811AF7C

	thumb_func_start sub_811B000
sub_811B000: @ 811B3F4
	push {r4-r7,lr}
	ldr r2, _0811B470 @ =0x0200c000
	ldrb r1, [r2]
	movs r1, 0
	strb r1, [r2]
	ldrh r4, [r0, 0xA]
	ldrh r2, [r0, 0xC]
	lsls r3, r2, 16
	asrs r3, 24
	movs r5, 0x84
	lsls r5, 5
	adds r1, r4, r5
	strh r1, [r0, 0xA]
	movs r1, 0xC0
	lsls r1, 1
	adds r2, r1
	strh r2, [r0, 0xC]
	movs r5, 0
	lsls r7, r3, 16
_0811B41A:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r2, _0811B474 @ =gUnknown_03004DE0
	lsls r1, r5, 1
	adds r1, r2
	ldr r6, _0811B470 @ =0x0200c000
	ldrh r2, [r6, 0x16]
	adds r0, r2
	strh r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x84
	lsls r1, 5
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _0811B41A
	ldr r0, _0811B478 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811B45E
	ldr r0, _0811B47C @ =sub_811AF44
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B45E:
	ldrb r0, [r6]
	adds r0, 0x1
	ldrb r1, [r6]
	strb r0, [r6]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B470: .4byte 0x0200c000
_0811B474: .4byte gUnknown_03004DE0
_0811B478: .4byte gPaletteFade
_0811B47C: .4byte sub_811AF44
	thumb_func_end sub_811B000

	thumb_func_start sub_811B08C
sub_811B08C: @ 811B480
	push {lr}
	bl sub_811D67C
	ldr r0, _0811B4A8 @ =0x0200c000
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811B4A2
	ldr r1, _0811B4AC @ =0x040000d4
	ldr r0, _0811B4B0 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811B4B4 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811B4A2:
	pop {r0}
	bx r0
	.align 2, 0
_0811B4A8: .4byte 0x0200c000
_0811B4AC: .4byte 0x040000d4
_0811B4B0: .4byte gUnknown_03004DE0
_0811B4B4: .4byte 0x800000a0
	thumb_func_end sub_811B08C

	thumb_func_start sub_811B0C4
sub_811B0C4: @ 811B4B8
	ldr r1, _0811B4D8 @ =gUnknown_03004DE0
	ldr r0, _0811B4DC @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811B4E0 @ =0x04000016
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811B4D8: .4byte gUnknown_03004DE0
_0811B4DC: .4byte 0x04000006
_0811B4E0: .4byte 0x04000016
	thumb_func_end sub_811B0C4

	thumb_func_start sub_811B0F0
sub_811B0F0: @ 811B4E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B514 @ =gUnknown_083FD7C0
	ldr r2, _0811B518 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B4F6:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B4F6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B514: .4byte gUnknown_083FD7C0
_0811B518: .4byte gTasks
	thumb_func_end sub_811B0F0

	thumb_func_start sub_811B128
sub_811B128: @ 811B51C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	movs r3, 0x10
	strh r3, [r4, 0xA]
	strh r2, [r4, 0xC]
	strh r2, [r4, 0x10]
	movs r0, 0x80
	lsls r0, 7
	strh r0, [r4, 0x12]
	ldr r1, _0811B5B0 @ =0x0200c000
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	ldr r0, _0811B5B4 @ =0x00003f41
	strh r0, [r1, 0xE]
	lsls r3, 8
	strh r3, [r1, 0x10]
	movs r1, 0
	add r5, sp, 0x4
	add r6, sp, 0x8
	ldr r3, _0811B5B8 @ =gUnknown_03005560
	movs r2, 0xF0
_0811B55C:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811B55C
	ldr r0, _0811B5BC @ =sub_811B520
	bl SetVBlankCallback
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_811D6A8
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _0811B5C0 @ =0x01000400
	mov r0, sp
	bl CpuSet
	ldr r0, _0811B5C4 @ =gUnknown_083FBB88
	ldr r1, [sp, 0x8]
	movs r2, 0xB0
	lsls r2, 2
	bl CpuSet
	ldr r0, _0811B5C8 @ =gFieldEffectObjectPalette10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811B5B0: .4byte 0x0200c000
_0811B5B4: .4byte 0x00003f41
_0811B5B8: .4byte gUnknown_03005560
_0811B5BC: .4byte sub_811B520
_0811B5C0: .4byte 0x01000400
_0811B5C4: .4byte gUnknown_083FBB88
_0811B5C8: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811B128

	thumb_func_start sub_811B1D8
sub_811B1D8: @ 811B5CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r5, _0811B654 @ =gUnknown_083FDB44
	add r1, sp, 0xC
	add r0, sp, 0x8
	bl sub_811D6A8
	movs r1, 0
	ldr r0, [sp, 0x8]
	mov r9, r0
	ldr r6, _0811B658 @ =gUnknown_03004DE0
	mov r8, r6
	movs r0, 0xF0
	lsls r0, 8
	mov r12, r0
_0811B5F2:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_0811B5F8:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	add r1, r9
	ldrh r0, [r5]
	mov r6, r12
	orrs r0, r6
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r5, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1D
	ble _0811B5F8
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0811B5F2
	movs r6, 0x10
	ldrsh r2, [r7, r6]
	movs r1, 0x12
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, 0xA0
	str r0, [sp, 0x4]
	mov r0, r8
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0x1
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B654: .4byte gUnknown_083FDB44
_0811B658: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B1D8

	thumb_func_start sub_811B268
sub_811B268: @ 811B65C
	push {r4,lr}
	sub sp, 0x8
	adds r2, r0, 0
	ldr r1, _0811B6DC @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r3, [r2, 0xE]
	movs r4, 0xE
	ldrsh r0, [r2, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _0811B680
	subs r0, r3, 0x1
	strh r0, [r2, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811B68A
_0811B680:
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r0, 0x2
	strh r0, [r2, 0xE]
_0811B68A:
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	ldrh r1, [r2, 0xC]
	orrs r0, r1
	strh r0, [r4, 0x10]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF
	ble _0811B6A2
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_0811B6A2:
	ldrh r0, [r2, 0x10]
	adds r0, 0x8
	strh r0, [r2, 0x10]
	ldr r0, _0811B6E0 @ =0xffffff00
	adds r1, r0, 0
	ldrh r3, [r2, 0x12]
	adds r1, r3
	strh r1, [r2, 0x12]
	ldr r0, _0811B6E4 @ =gUnknown_03004DE0
	movs r3, 0x10
	ldrsh r2, [r2, r3]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B6DC: .4byte 0x0200c000
_0811B6E0: .4byte 0xffffff00
_0811B6E4: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B268

	thumb_func_start sub_811B2F4
sub_811B2F4: @ 811B6E8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r3, r0, 0
	ldr r1, _0811B768 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r2, [r3, 0xE]
	movs r4, 0xE
	ldrsh r0, [r3, r4]
	adds r4, r1, 0
	cmp r0, 0
	beq _0811B70C
	subs r0, r2, 0x1
	strh r0, [r3, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811B716
_0811B70C:
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
	movs r0, 0x2
	strh r0, [r3, 0xE]
_0811B716:
	ldrh r0, [r3, 0xA]
	lsls r1, r0, 8
	ldrh r2, [r3, 0xC]
	orrs r1, r2
	strh r1, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _0811B72C
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_0811B72C:
	ldrh r0, [r3, 0x10]
	adds r0, 0x8
	strh r0, [r3, 0x10]
	ldr r5, _0811B76C @ =0xffffff00
	adds r1, r5, 0
	ldrh r0, [r3, 0x12]
	adds r1, r0
	strh r1, [r3, 0x12]
	ldr r0, _0811B770 @ =gUnknown_03004DE0
	movs r5, 0x10
	ldrsh r2, [r3, r5]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r1, 0xA0
	str r1, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	ldrb r0, [r4]
	adds r0, 0x1
	ldrb r1, [r4]
	strb r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811B768: .4byte 0x0200c000
_0811B76C: .4byte 0xffffff00
_0811B770: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B2F4

	thumb_func_start sub_811B380
sub_811B380: @ 811B774
	push {r4-r7,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r5, _0811B7D4 @ =0x0200c000
	ldrb r0, [r5]
	movs r7, 0
	strb r7, [r5]
	ldrh r0, [r4, 0x10]
	adds r0, 0x8
	strh r0, [r4, 0x10]
	ldr r0, _0811B7D8 @ =0xffffff00
	adds r1, r0, 0
	ldrh r3, [r4, 0x12]
	adds r1, r3
	strh r1, [r4, 0x12]
	ldr r0, _0811B7DC @ =gUnknown_03004DE0
	movs r3, 0x10
	ldrsh r2, [r4, r3]
	lsls r1, 16
	asrs r1, 24
	str r1, [sp]
	movs r6, 0xA0
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0x84
	bl sub_811D6E8
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bgt _0811B7C2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r6, [r4, 0xA]
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xC]
	strh r7, [r4, 0xE]
_0811B7C2:
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811B7D4: .4byte 0x0200c000
_0811B7D8: .4byte 0xffffff00
_0811B7DC: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B380

	thumb_func_start sub_811B3EC
sub_811B3EC: @ 811B7E0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811B87C @ =0x0200c000
	ldrb r1, [r0]
	movs r3, 0
	strb r3, [r0]
	ldrh r2, [r4, 0xC]
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	ldr r0, _0811B880 @ =0x000003ff
	cmp r1, r0
	bgt _0811B7FE
	adds r0, r2, 0
	adds r0, 0x80
	strh r0, [r4, 0xC]
_0811B7FE:
	ldrh r1, [r4, 0xA]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811B81A
	ldrh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 24
	subs r0, r1, r0
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _0811B81A
	strh r3, [r4, 0xA]
_0811B81A:
	ldr r0, _0811B884 @ =gUnknown_03004DE0
	movs r1, 0xA
	ldrsh r3, [r4, r1]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D764
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811B856
	ldr r1, _0811B888 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B88C @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B890 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811B894 @ =sub_811B0F0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811B856:
	ldrh r1, [r4, 0xE]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0811B86A
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _0811B898 @ =sub_811B54C
	bl SetVBlankCallback
_0811B86A:
	ldr r0, _0811B87C @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B87C: .4byte 0x0200c000
_0811B880: .4byte 0x000003ff
_0811B884: .4byte gUnknown_03004DE0
_0811B888: .4byte 0x040000b0
_0811B88C: .4byte 0x0000c5ff
_0811B890: .4byte 0x00007fff
_0811B894: .4byte sub_811B0F0
_0811B898: .4byte sub_811B54C
	thumb_func_end sub_811B3EC

	thumb_func_start sub_811B4A8
sub_811B4A8: @ 811B89C
	push {lr}
	ldr r1, _0811B8F4 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B8F8 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811B8FC @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D67C
	ldr r2, _0811B900 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811B8D2
	ldr r1, _0811B904 @ =0x040000d4
	ldr r0, _0811B908 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811B90C @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811B8D2:
	ldr r1, _0811B910 @ =0x04000048
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0xC
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x10]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811B8F4: .4byte 0x040000b0
_0811B8F8: .4byte 0x0000c5ff
_0811B8FC: .4byte 0x00007fff
_0811B900: .4byte 0x0200c000
_0811B904: .4byte 0x040000d4
_0811B908: .4byte gUnknown_03004DE0
_0811B90C: .4byte 0x800000a0
_0811B910: .4byte 0x04000048
	thumb_func_end sub_811B4A8

	thumb_func_start sub_811B520
sub_811B520: @ 811B914
	push {lr}
	bl sub_811B4A8
	ldr r1, _0811B930 @ =0x040000b0
	ldr r0, _0811B934 @ =gUnknown_03005560
	str r0, [r1]
	ldr r0, _0811B938 @ =0x04000010
	str r0, [r1, 0x4]
	ldr r0, _0811B93C @ =0xa2400001
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0811B930: .4byte 0x040000b0
_0811B934: .4byte gUnknown_03005560
_0811B938: .4byte 0x04000010
_0811B93C: .4byte 0xa2400001
	thumb_func_end sub_811B520

	thumb_func_start sub_811B54C
sub_811B54C: @ 811B940
	push {lr}
	bl sub_811B4A8
	ldr r1, _0811B95C @ =0x040000b0
	ldr r0, _0811B960 @ =gUnknown_03005560
	str r0, [r1]
	ldr r0, _0811B964 @ =0x04000040
	str r0, [r1, 0x4]
	ldr r0, _0811B968 @ =0xa2400001
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0811B95C: .4byte 0x040000b0
_0811B960: .4byte gUnknown_03005560
_0811B964: .4byte 0x04000040
_0811B968: .4byte 0xa2400001
	thumb_func_end sub_811B54C

	thumb_func_start sub_811B578
sub_811B578: @ 811B96C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811B99C @ =gUnknown_083FD7D8
	ldr r2, _0811B9A0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811B97E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811B97E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811B99C: .4byte gUnknown_083FD7D8
_0811B9A0: .4byte gTasks
	thumb_func_end sub_811B578

	thumb_func_start sub_811B5B0
sub_811B5B0: @ 811B9A4
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_811D6A8
	ldr r0, _0811B9E4 @ =gUnknown_083FC108
	ldr r1, [sp, 0x8]
	movs r2, 0x20
	bl CpuSet
	movs r0, 0
	str r0, [sp]
	ldr r1, [sp, 0x4]
	ldr r2, _0811B9E8 @ =0x05000200
	mov r0, sp
	bl CpuSet
	ldr r0, _0811B9EC @ =gFieldEffectObjectPalette10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811B9E4: .4byte gUnknown_083FC108
_0811B9E8: .4byte 0x05000200
_0811B9EC: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811B5B0

	thumb_func_start sub_811B5FC
sub_811B5FC: @ 811B9F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	ldr r1, _0811BA70 @ =gUnknown_083FD7E4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _0811BA74 @ =gUnknown_083FD7E8
	adds r0, r4, 0
	movs r2, 0xA
	bl memcpy
	bl Random
	movs r5, 0x1
	ands r5, r0
	movs r1, 0
	mov r8, r4
	ldr r6, _0811BA78 @ =gUnknown_0202FF84
_0811BA1E:
	lsls r5, 16
	asrs r5, 16
	lsls r0, r5, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	str r0, [r6]
	lsls r4, r1, 16
	asrs r4, 16
	lsls r0, r4, 5
	adds r0, 0x10
	str r0, [r6, 0x4]
	str r5, [r6, 0x8]
	lsls r0, r4, 1
	add r0, r8
	movs r1, 0
	ldrsh r0, [r0, r1]
	str r0, [r6, 0xC]
	movs r0, 0x2D
	bl FieldEffectStart
	adds r4, 0x1
	lsls r4, 16
	movs r0, 0x1
	eors r5, r0
	lsls r5, 16
	lsrs r5, 16
	lsrs r1, r4, 16
	asrs r4, 16
	cmp r4, 0x4
	ble _0811BA1E
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BA70: .4byte gUnknown_083FD7E4
_0811BA74: .4byte gUnknown_083FD7E8
_0811BA78: .4byte gUnknown_0202FF84
	thumb_func_end sub_811B5FC

	thumb_func_start sub_811B688
sub_811B688: @ 811BA7C
	push {lr}
	movs r0, 0x2D
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _0811BA9C
	bl sub_811D6D4
	ldr r0, _0811BAA4 @ =sub_811B578
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811BA9C:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811BAA4: .4byte sub_811B578
	thumb_func_end sub_811B688

	thumb_func_start FldEff_Pokeball
FldEff_Pokeball: @ 811BAA8
	push {r4,r5,lr}
	ldr r0, _0811BB04 @ =gSpriteTemplate_83FD98C
	ldr r5, _0811BB08 @ =gUnknown_0202FF84
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r5, r3]
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0811BB0C @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, [r5, 0x8]
	strh r0, [r4, 0x2E]
	ldr r0, [r5, 0xC]
	strh r0, [r4, 0x30]
	ldr r0, _0811BB10 @ =0x0000ffff
	strh r0, [r4, 0x32]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	ldrb r1, [r5, 0x8]
	adds r0, r4, 0
	bl StartSpriteAffineAnim
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811BB04: .4byte gSpriteTemplate_83FD98C
_0811BB08: .4byte gUnknown_0202FF84
_0811BB0C: .4byte gSprites
_0811BB10: .4byte 0x0000ffff
	thumb_func_end FldEff_Pokeball

	thumb_func_start sub_811B720
sub_811B720: @ 811BB14
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0811BB34 @ =gUnknown_083FD7F2
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811BB38
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
	b _0811BBCA
	.align 2, 0
_0811BB34: .4byte gUnknown_083FD7F2
_0811BB38:
	ldrh r0, [r4, 0x20]
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r0, 0xF0
	bhi _0811BBA6
	asrs r0, r1, 19
	lsls r0, 16
	ldrh r1, [r4, 0x22]
	lsls r1, 16
	asrs r1, 19
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r0, 16
	asrs r5, r0, 16
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r5, r0
	beq _0811BBA6
	strh r2, [r4, 0x32]
	ldr r0, _0811BBD4 @ =0x04000008
	ldrh r2, [r0]
	lsrs r2, 8
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 11
	movs r0, 0xC0
	lsls r0, 19
	adds r2, r0
	lsls r1, 16
	asrs r1, 16
	subs r0, r1, 0x2
	lsls r0, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	ldr r6, _0811BBD8 @ =0x0000f001
	adds r3, r6, 0
	strh r3, [r0]
	subs r0, r1, 0x1
	lsls r0, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	lsls r0, r1, 5
	adds r0, r5
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	adds r1, 0x1
	lsls r1, 5
	adds r1, r5
	lsls r1, 1
	adds r1, r2
	strh r3, [r1]
_0811BBA6:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	ldrh r2, [r4, 0x20]
	adds r0, r2
	strh r0, [r4, 0x20]
	adds r0, 0xF
	lsls r0, 16
	movs r1, 0x87
	lsls r1, 17
	cmp r0, r1
	bls _0811BBCA
	adds r0, r4, 0
	movs r1, 0x2D
	bl FieldEffectStop
_0811BBCA:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811BBD4: .4byte 0x04000008
_0811BBD8: .4byte 0x0000f001
	thumb_func_end sub_811B720

	thumb_func_start sub_811B7E8
sub_811B7E8: @ 811BBDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811BC0C @ =gUnknown_083FD7F8
	ldr r2, _0811BC10 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811BBEE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811BBEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811BC0C: .4byte gUnknown_083FD7F8
_0811BC10: .4byte gTasks
	thumb_func_end sub_811B7E8

	thumb_func_start sub_811B820
sub_811B820: @ 811BC14
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811BC64 @ =0x0200c000
	movs r0, 0
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	ldr r0, _0811BC68 @ =0x0000f0f1
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811BC6C @ =gUnknown_03005560
	ldr r2, _0811BC70 @ =0x0000f3f4
_0811BC38:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811BC38
	ldr r0, _0811BC74 @ =sub_811BC2C
	bl SetVBlankCallback
	ldr r1, _0811BC64 @ =0x0200c000
	movs r0, 0x78
	strh r0, [r1, 0x2C]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811BC64: .4byte 0x0200c000
_0811BC68: .4byte 0x0000f0f1
_0811BC6C: .4byte gUnknown_03005560
_0811BC70: .4byte 0x0000f3f4
_0811BC74: .4byte sub_811BC2C
	thumb_func_end sub_811B820

	thumb_func_start sub_811B884
sub_811B884: @ 811BC78
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811BCF8 @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x2C
	ldrsh r3, [r4, r1]
	movs r1, 0x1
	negs r1, r1
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811BCFC @ =gUnknown_03004DE0
_0811BCA4:
	movs r3, 0x2A
	ldrsh r2, [r4, r3]
	lsls r2, 1
	adds r2, r5
	ldrh r0, [r4, 0x28]
	adds r0, 0x1
	movs r3, 0xF0
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811BCA4
	ldr r2, _0811BCF8 @ =0x0200c000
	ldrh r0, [r2, 0x2C]
	adds r0, 0x10
	strh r0, [r2, 0x2C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _0811BCE6
	movs r0, 0
	strh r0, [r2, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811BCE6:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811BCF8: .4byte 0x0200c000
_0811BCFC: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B884

	thumb_func_start sub_811B90C
sub_811B90C: @ 811BD00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r7, r0, 0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0811BD7C @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0xF0
	bl sub_811D8FC
	adds r6, r4, 0
	ldr r5, _0811BD80 @ =gUnknown_03004DE0
	mov r8, r5
	add r5, sp, 0xC
_0811BD3A:
	movs r1, 0x78
	ldrh r0, [r4, 0x28]
	adds r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0x4F
	ble _0811BD50
	ldrh r1, [r4, 0x28]
	movs r3, 0xF0
_0811BD50:
	movs r0, 0x2A
	ldrsh r2, [r4, r0]
	lsls r2, 1
	add r2, r8
	lsls r1, 16
	asrs r1, 8
	lsls r0, r3, 16
	asrs r3, r0, 16
	orrs r3, r1
	strh r3, [r2]
	ldrb r0, [r5]
	cmp r0, 0
	bne _0811BD84
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	strb r0, [r5]
	b _0811BD3A
	.align 2, 0
_0811BD7C: .4byte 0x0200c000
_0811BD80: .4byte gUnknown_03004DE0
_0811BD84:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x8
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0x9F
	ble _0811BD9E
	movs r0, 0xF0
	strh r0, [r4, 0x2C]
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	b _0811BDC4
_0811BD9E:
	movs r2, 0x2A
	ldrsh r0, [r4, r2]
	cmp r0, r1
	bge _0811BDC4
	ldr r4, _0811BDDC @ =gUnknown_03004DE0
	ldr r2, _0811BDE0 @ =0x0200c000
_0811BDAA:
	ldrh r0, [r2, 0x2A]
	adds r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r4
	strh r3, [r0]
	movs r5, 0x2A
	ldrsh r1, [r2, r5]
	movs r5, 0x2E
	ldrsh r0, [r2, r5]
	cmp r1, r0
	blt _0811BDAA
_0811BDC4:
	ldrb r0, [r6]
	adds r0, 0x1
	ldrb r1, [r6]
	strb r0, [r6]
	movs r0, 0
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BDDC: .4byte gUnknown_03004DE0
_0811BDE0: .4byte 0x0200c000
	thumb_func_end sub_811B90C

	thumb_func_start sub_811B9F0
sub_811B9F0: @ 811BDE4
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811BE5C @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x2C
	ldrsh r3, [r4, r1]
	movs r1, 0xA0
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811BE60 @ =gUnknown_03004DE0
_0811BE0E:
	movs r0, 0x2A
	ldrsh r2, [r4, r0]
	lsls r2, 1
	adds r2, r5
	ldrh r0, [r4, 0x28]
	lsls r0, 8
	movs r1, 0xF0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811BE0E
	ldr r2, _0811BE5C @ =0x0200c000
	ldrh r0, [r2, 0x2C]
	subs r0, 0x10
	strh r0, [r2, 0x2C]
	lsls r0, 16
	cmp r0, 0
	bgt _0811BE4A
	movs r0, 0xA0
	strh r0, [r2, 0x2E]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811BE4A:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811BE5C: .4byte 0x0200c000
_0811BE60: .4byte gUnknown_03004DE0
	thumb_func_end sub_811B9F0

	thumb_func_start sub_811BA70
sub_811BA70: @ 811BE64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r8, r0
	add r1, sp, 0xC
	movs r0, 0
	strb r0, [r1]
	ldr r4, _0811BEE4 @ =0x0200c000
	ldrb r0, [r4]
	movs r0, 0
	strb r0, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2E
	ldrsh r1, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	movs r3, 0
	bl sub_811D8FC
	ldr r3, _0811BEE8 @ =gUnknown_03004DE0
	mov r9, r3
	mov r10, r4
	add r6, sp, 0xC
_0811BEA2:
	movs r5, 0x2A
	ldrsh r0, [r4, r5]
	lsls r0, 1
	mov r7, r9
	adds r5, r0, r7
	ldrb r1, [r5]
	ldrh r2, [r4, 0x28]
	adds r3, r2, 0
	movs r7, 0x2E
	ldrsh r0, [r4, r7]
	cmp r0, 0x50
	bgt _0811BEBE
	movs r2, 0x78
	adds r1, r3, 0
_0811BEBE:
	lsls r0, r2, 16
	asrs r0, 8
	lsls r1, 16
	asrs r1, 16
	orrs r1, r0
	movs r3, 0
	strh r1, [r5]
	ldrb r0, [r6]
	cmp r0, 0
	bne _0811BEEC
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	strb r0, [r6]
	b _0811BEA2
	.align 2, 0
_0811BEE4: .4byte 0x0200c000
_0811BEE8: .4byte gUnknown_03004DE0
_0811BEEC:
	ldrh r0, [r4, 0x2E]
	subs r0, 0x8
	strh r0, [r4, 0x2E]
	lsls r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	bgt _0811BF06
	strh r3, [r4, 0x2C]
	mov r1, r8
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _0811BF2E
_0811BF06:
	movs r3, 0x2A
	ldrsh r0, [r4, r3]
	cmp r0, r2
	ble _0811BF2E
	ldr r4, _0811BF4C @ =gUnknown_03004DE0
	ldr r2, _0811BF50 @ =0x0200c000
	adds r3, r1, 0
_0811BF14:
	ldrh r0, [r2, 0x2A]
	subs r0, 0x1
	strh r0, [r2, 0x2A]
	lsls r0, 16
	asrs r0, 15
	adds r0, r4
	strh r3, [r0]
	movs r5, 0x2A
	ldrsh r1, [r2, r5]
	movs r7, 0x2E
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bgt _0811BF14
_0811BF2E:
	mov r1, r10
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r1, [r1]
	mov r2, r10
	strb r0, [r2]
	movs r0, 0
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811BF4C: .4byte gUnknown_03004DE0
_0811BF50: .4byte 0x0200c000
	thumb_func_end sub_811BA70

	thumb_func_start sub_811BB60
sub_811BB60: @ 811BF54
	push {r4-r6,lr}
	sub sp, 0xC
	adds r6, r0, 0
	ldr r4, _0811BFD8 @ =0x0200c000
	ldrb r0, [r4]
	movs r1, 0
	strb r1, [r4]
	adds r0, r4, 0
	adds r0, 0x24
	movs r2, 0x2C
	ldrsh r3, [r4, r2]
	str r1, [sp]
	movs r1, 0x1
	str r1, [sp, 0x4]
	str r1, [sp, 0x8]
	movs r1, 0x78
	movs r2, 0x50
	bl sub_811D8FC
	ldr r5, _0811BFDC @ =gUnknown_03004DE0
_0811BF7C:
	movs r2, 0x78
	ldrh r3, [r4, 0x28]
	movs r1, 0x28
	ldrsh r0, [r4, r1]
	cmp r0, 0x77
	ble _0811BF8C
	movs r2, 0
	movs r3, 0xF0
_0811BF8C:
	movs r0, 0x2A
	ldrsh r1, [r4, r0]
	lsls r1, 1
	adds r1, r5
	lsls r2, 8
	lsls r0, r3, 16
	asrs r0, 16
	orrs r0, r2
	strh r0, [r1]
	adds r0, r4, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	cmp r0, 0
	beq _0811BF7C
	ldr r2, _0811BFD8 @ =0x0200c000
	ldrh r0, [r2, 0x2C]
	adds r0, 0x10
	strh r0, [r2, 0x2C]
	movs r1, 0x28
	ldrsh r0, [r2, r1]
	cmp r0, 0x78
	ble _0811BFC6
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0811BFC6:
	ldrb r0, [r2]
	adds r0, 0x1
	ldrb r1, [r2]
	strb r0, [r2]
	movs r0, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811BFD8: .4byte 0x0200c000
_0811BFDC: .4byte gUnknown_03004DE0
	thumb_func_end sub_811BB60

	thumb_func_start sub_811BBEC
sub_811BBEC: @ 811BFE0
	push {lr}
	ldr r1, _0811C010 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C014 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C018 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811C01C @ =sub_811B7E8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811C010: .4byte 0x040000b0
_0811C014: .4byte 0x0000c5ff
_0811C018: .4byte 0x00007fff
_0811C01C: .4byte sub_811B7E8
	thumb_func_end sub_811BBEC

	thumb_func_start sub_811BC2C
sub_811BC2C: @ 811C020
	push {r4,lr}
	ldr r4, _0811C088 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C08C @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C090 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C094 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C056
	ldr r1, _0811C098 @ =0x040000d4
	ldr r0, _0811C09C @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C0A0 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C056:
	ldr r1, _0811C0A4 @ =0x04000048
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r2, _0811C0A8 @ =0x04000040
	ldr r0, _0811C09C @ =gUnknown_03004DE0
	movs r1, 0xF0
	lsls r1, 3
	adds r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _0811C0AC @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C088: .4byte 0x040000b0
_0811C08C: .4byte 0x0000c5ff
_0811C090: .4byte 0x00007fff
_0811C094: .4byte 0x0200c000
_0811C098: .4byte 0x040000d4
_0811C09C: .4byte gUnknown_03004DE0
_0811C0A0: .4byte 0x800000a0
_0811C0A4: .4byte 0x04000048
_0811C0A8: .4byte 0x04000040
_0811C0AC: .4byte 0xa2400001
	thumb_func_end sub_811BC2C

	thumb_func_start sub_811BCBC
sub_811BCBC: @ 811C0B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811C0E0 @ =gUnknown_083FD814
	ldr r2, _0811C0E4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811C0C2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811C0C2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C0E0: .4byte gUnknown_083FD814
_0811C0E4: .4byte gTasks
	thumb_func_end sub_811BCBC

	thumb_func_start sub_811BCF4
sub_811BCF4: @ 811C0E8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	ldr r4, _0811C13C @ =gUnknown_03005560
	ldr r3, _0811C140 @ =0x0200c000
_0811C0FA:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r3, 0x16]
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9F
	bls _0811C0FA
	ldr r0, _0811C144 @ =sub_811BE3C
	bl SetVBlankCallback
	ldr r0, _0811C148 @ =sub_811BE74
	bl SetHBlankCallback
	ldr r2, _0811C14C @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811C150 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C13C: .4byte gUnknown_03005560
_0811C140: .4byte 0x0200c000
_0811C144: .4byte sub_811BE3C
_0811C148: .4byte sub_811BE74
_0811C14C: .4byte 0x04000200
_0811C150: .4byte 0x04000004
	thumb_func_end sub_811BCF4

	thumb_func_start sub_811BD60
sub_811BD60: @ 811C154
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r1, _0811C21C @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r2, [r6, 0xC]
	lsls r1, r2, 16
	asrs r0, r1, 24
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r4, [r6, 0xA]
	movs r0, 0xC0
	lsls r0, 1
	mov r8, r0
	movs r5, 0x80
	lsls r5, 3
	adds r0, r4, r5
	strh r0, [r6, 0xA]
	ldr r0, _0811C220 @ =0x1fff0000
	cmp r1, r0
	bgt _0811C18E
	movs r1, 0xC0
	lsls r1, 1
	adds r0, r2, r1
	strh r0, [r6, 0xC]
_0811C18E:
	movs r5, 0
	lsls r7, r3, 16
_0811C192:
	lsrs r0, r4, 8
	asrs r1, r7, 16
	bl Sin
	ldr r1, _0811C224 @ =gUnknown_03004DE0
	lsls r2, r5, 1
	adds r2, r1
	ldr r1, _0811C21C @ =0x0200c000
	ldrh r1, [r1, 0x16]
	adds r0, r1
	strh r0, [r2]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r8
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r5, 0x9F
	bls _0811C192
	ldrh r0, [r6, 0xE]
	adds r0, 0x1
	strh r0, [r6, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x51
	bne _0811C1E0
	ldrh r0, [r6, 0x10]
	adds r0, 0x1
	strh r0, [r6, 0x10]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x2
	negs r1, r1
	movs r2, 0
	str r2, [sp]
	movs r3, 0x10
	bl BeginNormalPaletteFade
_0811C1E0:
	movs r5, 0x10
	ldrsh r0, [r6, r5]
	cmp r0, 0
	beq _0811C202
	ldr r0, _0811C228 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0811C202
	ldr r0, _0811C22C @ =sub_811BCBC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811C202:
	ldr r0, _0811C21C @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C21C: .4byte 0x0200c000
_0811C220: .4byte 0x1fff0000
_0811C224: .4byte gUnknown_03004DE0
_0811C228: .4byte gPaletteFade
_0811C22C: .4byte sub_811BCBC
	thumb_func_end sub_811BD60

	thumb_func_start sub_811BE3C
sub_811BE3C: @ 811C230
	push {lr}
	bl sub_811D67C
	ldr r0, _0811C258 @ =0x0200c000
	ldrb r0, [r0]
	cmp r0, 0
	beq _0811C252
	ldr r1, _0811C25C @ =0x040000d4
	ldr r0, _0811C260 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811C264 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C252:
	pop {r0}
	bx r0
	.align 2, 0
_0811C258: .4byte 0x0200c000
_0811C25C: .4byte 0x040000d4
_0811C260: .4byte gUnknown_03004DE0
_0811C264: .4byte 0x800000a0
	thumb_func_end sub_811BE3C

	thumb_func_start sub_811BE74
sub_811BE74: @ 811C268
	ldr r1, _0811C288 @ =gUnknown_03004DE0
	ldr r0, _0811C28C @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811C290 @ =0x04000016
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811C288: .4byte gUnknown_03004DE0
_0811C28C: .4byte 0x04000006
_0811C290: .4byte 0x04000016
	thumb_func_end sub_811BE74

	thumb_func_start sub_811BEA0
sub_811BEA0: @ 811C294
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811C2C4 @ =gUnknown_083FD81C
	ldr r2, _0811C2C8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811C2A6:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811C2A6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C2C4: .4byte gUnknown_083FD81C
_0811C2C8: .4byte gTasks
	thumb_func_end sub_811BEA0

	thumb_func_start sub_811BED8
sub_811BED8: @ 811C2CC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811C314 @ =0x0200c000
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xF0
	strh r0, [r1, 0x6]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811C318 @ =gUnknown_03005560
	movs r2, 0xF2
_0811C2F0:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _0811C2F0
	ldr r0, _0811C31C @ =sub_811C004
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C314: .4byte 0x0200c000
_0811C318: .4byte gUnknown_03005560
_0811C31C: .4byte sub_811C004
	thumb_func_end sub_811BED8

	thumb_func_start sub_811BF2C
sub_811BF2C: @ 811C320
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	ldr r1, _0811C3B0 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _0811C3B4 @ =gUnknown_03004DE0
	ldrh r0, [r4, 0xC]
	ldrb r5, [r4, 0xC]
	adds r0, 0x10
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	adds r0, 0x8
	strh r0, [r4, 0xA]
	movs r6, 0
	movs r0, 0x1
	mov r8, r0
_0811C346:
	adds r0, r5, 0
	movs r1, 0x28
	bl Sin
	ldrh r1, [r4, 0xA]
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r0, 0
	bge _0811C35C
	movs r1, 0
_0811C35C:
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811C366
	movs r1, 0xF0
_0811C366:
	lsls r0, r1, 16
	asrs r0, 16
	lsls r1, r0, 8
	movs r2, 0xF1
	orrs r1, r2
	strh r1, [r7]
	cmp r0, 0xEF
	bgt _0811C37A
	movs r0, 0
	mov r8, r0
_0811C37A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, 0x2
	cmp r6, 0x9F
	bls _0811C346
	mov r1, r8
	cmp r1, 0
	beq _0811C398
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C398:
	ldr r0, _0811C3B0 @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C3B0: .4byte 0x0200c000
_0811C3B4: .4byte gUnknown_03004DE0
	thumb_func_end sub_811BF2C

	thumb_func_start sub_811BFC4
sub_811BFC4: @ 811C3B8
	push {lr}
	ldr r1, _0811C3E8 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C3EC @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C3F0 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811C3F4 @ =sub_811BEA0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811C3E8: .4byte 0x040000b0
_0811C3EC: .4byte 0x0000c5ff
_0811C3F0: .4byte 0x00007fff
_0811C3F4: .4byte sub_811BEA0
	thumb_func_end sub_811BFC4

	thumb_func_start sub_811C004
sub_811C004: @ 811C3F8
	push {r4,lr}
	ldr r4, _0811C454 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C458 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811C45C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811C460 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811C42E
	ldr r1, _0811C464 @ =0x040000d4
	ldr r0, _0811C468 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811C46C @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811C42E:
	ldr r1, _0811C470 @ =0x04000048
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r0, _0811C474 @ =gUnknown_03005560
	str r0, [r4]
	ldr r0, _0811C478 @ =0x04000040
	str r0, [r4, 0x4]
	ldr r0, _0811C47C @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811C454: .4byte 0x040000b0
_0811C458: .4byte 0x0000c5ff
_0811C45C: .4byte 0x00007fff
_0811C460: .4byte 0x0200c000
_0811C464: .4byte 0x040000d4
_0811C468: .4byte gUnknown_03004DE0
_0811C46C: .4byte 0x800000a0
_0811C470: .4byte 0x04000048
_0811C474: .4byte gUnknown_03005560
_0811C478: .4byte 0x04000040
_0811C47C: .4byte 0xa2400001
	thumb_func_end sub_811C004

	thumb_func_start sub_811C08C
sub_811C08C: @ 811C480
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C49C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C49C: .4byte gTasks
	thumb_func_end sub_811C08C

	thumb_func_start sub_811C0AC
sub_811C0AC: @ 811C4A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C4BC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C4BC: .4byte gTasks
	thumb_func_end sub_811C0AC

	thumb_func_start sub_811C0CC
sub_811C0CC: @ 811C4C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C4DC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x2
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C4DC: .4byte gTasks
	thumb_func_end sub_811C0CC

	thumb_func_start sub_811C0EC
sub_811C0EC: @ 811C4E0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C4FC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x3
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C4FC: .4byte gTasks
	thumb_func_end sub_811C0EC

	thumb_func_start sub_811C10C
sub_811C10C: @ 811C500
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811C51C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x4
	strh r2, [r1, 0x26]
	bl sub_811C12C
	pop {r0}
	bx r0
	.align 2, 0
_0811C51C: .4byte gTasks
	thumb_func_end sub_811C10C

	thumb_func_start sub_811C12C
sub_811C12C: @ 811C520
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811C550 @ =gUnknown_083FD828
	ldr r2, _0811C554 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811C532:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811C532
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811C550: .4byte gUnknown_083FD828
_0811C554: .4byte gTasks
	thumb_func_end sub_811C12C

	thumb_func_start sub_811C164
sub_811C164: @ 811C558
	push {r4,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	adds r0, r4, 0
	bl sub_811C7B0
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0xC]
	movs r0, 0xEF
	strh r0, [r4, 0xE]
	ldr r1, _0811C5B0 @ =0x0200c000
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	movs r0, 0x3E
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r3, _0811C5B4 @ =gUnknown_03005560
	ldr r2, _0811C5B8 @ =0x0000f0f1
_0811C58A:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9F
	bls _0811C58A
	ldr r0, _0811C5BC @ =sub_811C670
	bl SetVBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C5B0: .4byte 0x0200c000
_0811C5B4: .4byte gUnknown_03005560
_0811C5B8: .4byte 0x0000f0f1
_0811C5BC: .4byte sub_811C670
	thumb_func_end sub_811C164

	thumb_func_start sub_811C1CC
sub_811C1CC: @ 811C5C0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	mov r8, r0
	ldr r6, _0811C678 @ =gUnknown_083FDFF4
	add r1, sp, 0x4
	mov r0, sp
	bl sub_811D6A8
	ldr r0, _0811C67C @ =gUnknown_083FC348
	ldr r1, [sp, 0x4]
	movs r2, 0xF0
	bl CpuSet
	ldr r1, _0811C680 @ =gUnknown_083FDB00
	mov r2, r8
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0811C684 @ =gUnknown_083FDB14
	ldr r0, _0811C688 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xFA
	movs r2, 0xC
	bl LoadPalette
	movs r1, 0
	ldr r5, [sp]
	ldr r0, _0811C68C @ =sub_811C77C
	mov r12, r0
	movs r2, 0xF0
	lsls r2, 8
	adds r7, r2, 0
_0811C616:
	movs r0, 0
	lsls r3, r1, 16
	asrs r4, r3, 11
_0811C61C:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r4, r2
	lsls r1, 1
	adds r1, r5
	ldrh r0, [r6]
	orrs r0, r7
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	adds r6, 0x2
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x1F
	ble _0811C61C
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0811C616
	ldr r2, _0811C690 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811C694 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	mov r0, r12
	bl SetHBlankCallback
	mov r2, r8
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C678: .4byte gUnknown_083FDFF4
_0811C67C: .4byte gUnknown_083FC348
_0811C680: .4byte gUnknown_083FDB00
_0811C684: .4byte gUnknown_083FDB14
_0811C688: .4byte gSaveBlock2
_0811C68C: .4byte sub_811C77C
_0811C690: .4byte 0x04000200
_0811C694: .4byte 0x04000004
	thumb_func_end sub_811C1CC

	thumb_func_start sub_811C2A4
sub_811C2A4: @ 811C698
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r1, _0811C778 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldr r7, _0811C77C @ =gUnknown_03004DE0
	ldrh r0, [r4, 0xA]
	ldrb r5, [r4, 0xA]
	adds r0, 0x10
	strh r0, [r4, 0xA]
	movs r6, 0
_0811C6B0:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xC]
	adds r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bge _0811C6C6
	movs r2, 0x1
_0811C6C6:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811C6D0
	movs r2, 0xF0
_0811C6D0:
	strh r2, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x4F
	bls _0811C6B0
	cmp r6, 0x9F
	bhi _0811C728
_0811C6EA:
	adds r0, r5, 0
	movs r1, 0x10
	bl Sin
	ldrh r1, [r4, 0xE]
	subs r1, r0
	lsls r1, 16
	lsrs r2, r1, 16
	cmp r1, 0
	bge _0811C700
	movs r2, 0
_0811C700:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xEF
	ble _0811C70A
	movs r2, 0xEF
_0811C70A:
	lsls r0, r2, 16
	asrs r0, 8
	movs r1, 0xF0
	orrs r0, r1
	strh r0, [r7]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r7, 0x2
	adds r0, r5, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r6, 0x9F
	bls _0811C6EA
_0811C728:
	ldrh r1, [r4, 0xC]
	adds r1, 0x8
	strh r1, [r4, 0xC]
	ldrh r0, [r4, 0xE]
	subs r0, 0x8
	strh r0, [r4, 0xE]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0xF0
	ble _0811C740
	movs r0, 0xF0
	strh r0, [r4, 0xC]
_0811C740:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _0811C74C
	movs r0, 0
	strh r0, [r4, 0xE]
_0811C74C:
	ldr r0, [r4, 0xC]
	cmp r0, 0xF0
	bne _0811C758
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C758:
	ldr r1, _0811C778 @ =0x0200c000
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r2, [r1]
	strb r0, [r1]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C778: .4byte 0x0200c000
_0811C77C: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C2A4

	thumb_func_start sub_811C38C
sub_811C38C: @ 811C780
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _0811C7EC @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	ldr r2, _0811C7F0 @ =gUnknown_03004DE0
	adds r5, r0, 0
	movs r3, 0xF0
_0811C792:
	strh r3, [r2]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, 0x2
	cmp r1, 0x9F
	bls _0811C792
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	strh r1, [r4, 0xE]
	ldrh r0, [r5, 0x18]
	subs r0, 0x8
	strh r0, [r5, 0x18]
	ldrh r0, [r5, 0x1A]
	adds r0, 0x8
	strh r0, [r5, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	movs r1, 0
	bl sub_811CA10
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	movs r1, 0x1
	bl sub_811CA10
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_811CA28
	movs r0, 0x68
	bl PlaySE
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811C7EC: .4byte 0x0200c000
_0811C7F0: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C38C

	thumb_func_start sub_811C400
sub_811C400: @ 811C7F4
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811C82C @ =0x0200c000
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	bl sub_811CA44
	lsls r0, 16
	cmp r0, 0
	beq _0811C822
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x24
	ldrsh r0, [r4, r1]
	bl sub_811CA28
_0811C822:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811C82C: .4byte 0x0200c000
	thumb_func_end sub_811C400

	thumb_func_start sub_811C43C
sub_811C43C: @ 811C830
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	ldr r7, _0811C8C4 @ =0x0200c000
	ldrh r0, [r7, 0x18]
	subs r0, 0x8
	movs r1, 0
	mov r8, r1
	strh r0, [r7, 0x18]
	ldrh r0, [r7, 0x1A]
	adds r0, 0x8
	strh r0, [r7, 0x1A]
	movs r1, 0x24
	ldrsh r0, [r6, r1]
	bl sub_811CA44
	lsls r0, 16
	cmp r0, 0
	beq _0811C8B8
	ldrb r0, [r7]
	movs r0, 0
	strb r0, [r7]
	movs r0, 0
	bl SetVBlankCallback
	ldr r1, _0811C8C8 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C8CC @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811C8D0 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	ldr r4, _0811C8D4 @ =gUnknown_03004DE0
	movs r5, 0xA0
	lsls r5, 1
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	movs r0, 0xF0
	lsls r0, 3
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	ldr r1, _0811C8D8 @ =0x04000040
	movs r0, 0xF0
	strh r0, [r1]
	ldr r0, _0811C8DC @ =0x04000054
	mov r1, r8
	strh r1, [r0]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	strh r1, [r6, 0xE]
	strh r1, [r6, 0x10]
	movs r0, 0xBF
	strh r0, [r7, 0xE]
	ldr r0, _0811C8E0 @ =sub_811C700
	bl SetVBlankCallback
_0811C8B8:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C8C4: .4byte 0x0200c000
_0811C8C8: .4byte 0x040000b0
_0811C8CC: .4byte 0x0000c5ff
_0811C8D0: .4byte 0x00007fff
_0811C8D4: .4byte gUnknown_03004DE0
_0811C8D8: .4byte 0x04000040
_0811C8DC: .4byte 0x04000054
_0811C8E0: .4byte sub_811C700
	thumb_func_end sub_811C43C

	thumb_func_start sub_811C4F0
sub_811C4F0: @ 811C8E4
	push {r4-r7,lr}
	adds r4, r0, 0
	ldr r1, _0811C9A0 @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	movs r6, 0x1
	ldrh r0, [r1, 0x18]
	subs r0, 0x8
	strh r0, [r1, 0x18]
	ldrh r0, [r1, 0x1A]
	adds r0, 0x8
	strh r0, [r1, 0x1A]
	ldrh r2, [r4, 0x10]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	adds r7, r1, 0
	cmp r0, 0x4F
	bgt _0811C90E
	adds r0, r2, 0x2
	strh r0, [r4, 0x10]
_0811C90E:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0x50
	ble _0811C91A
	movs r0, 0x50
	strh r0, [r4, 0x10]
_0811C91A:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	movs r1, 0x1
	ands r0, r1
	ldrh r2, [r4, 0x10]
	cmp r0, 0
	beq _0811C980
	movs r3, 0
	lsls r0, r2, 16
	movs r6, 0
	cmp r0, 0
	blt _0811C980
	movs r2, 0x50
	mov r12, r2
	ldr r5, _0811C9A4 @ =gUnknown_03004DE0
_0811C93A:
	lsls r0, r3, 16
	asrs r2, r0, 16
	mov r3, r12
	subs r1, r3, r2
	adds r0, r2, 0
	adds r0, 0x50
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	asrs r1, 15
	adds r1, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _0811C95C
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_0811C95C:
	lsls r0, r3, 16
	asrs r0, 15
	adds r1, r0, r5
	ldrh r0, [r1]
	cmp r0, 0xF
	bhi _0811C96E
	movs r6, 0x1
	adds r0, 0x1
	strh r0, [r1]
_0811C96E:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, 0x10]
	cmp r0, r1
	ble _0811C93A
_0811C980:
	cmp r2, 0x50
	bne _0811C98E
	cmp r6, 0
	bne _0811C98E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811C98E:
	ldrb r0, [r7]
	adds r0, 0x1
	ldrb r1, [r7]
	strb r0, [r7]
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811C9A0: .4byte 0x0200c000
_0811C9A4: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C4F0

	thumb_func_start sub_811C5B4
sub_811C5B4: @ 811C9A8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _0811C9D4 @ =0x0200c000
	ldrb r0, [r4]
	movs r6, 0
	strb r6, [r4]
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0811C9D8 @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	movs r0, 0xFF
	strh r0, [r4, 0xE]
	strh r6, [r5, 0xE]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811C9D4: .4byte 0x0200c000
_0811C9D8: .4byte 0x00007fff
	thumb_func_end sub_811C5B4

	thumb_func_start sub_811C5E8
sub_811C5E8: @ 811C9DC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0811CA1C @ =0x0200c000
	ldrb r0, [r5]
	movs r0, 0
	strb r0, [r5]
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	ldr r0, _0811CA20 @ =gUnknown_03004DE0
	movs r2, 0xE
	ldrsh r1, [r4, r2]
	movs r2, 0xA0
	lsls r2, 1
	bl memset
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	ble _0811CA0A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811CA0A:
	ldrb r0, [r5]
	adds r0, 0x1
	ldrb r1, [r5]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811CA1C: .4byte 0x0200c000
_0811CA20: .4byte gUnknown_03004DE0
	thumb_func_end sub_811C5E8

	thumb_func_start sub_811C630
sub_811C630: @ 811CA24
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0811CA58 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CA5C @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811CA60 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, [r4]
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811CA58: .4byte 0x040000b0
_0811CA5C: .4byte 0x0000c5ff
_0811CA60: .4byte 0x00007fff
	thumb_func_end sub_811C630

	thumb_func_start sub_811C670
sub_811C670: @ 811CA64
	push {r4,lr}
	ldr r4, _0811CAC8 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CACC @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CAD0 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811CAD4 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811CA9A
	ldr r1, _0811CAD8 @ =0x040000d4
	ldr r0, _0811CADC @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811CAE0 @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811CA9A:
	ldr r1, _0811CAE4 @ =0x04000012
	ldrh r0, [r2, 0x1C]
	strh r0, [r1]
	adds r1, 0x36
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r0, _0811CAE8 @ =gUnknown_03005560
	str r0, [r4]
	ldr r0, _0811CAEC @ =0x04000040
	str r0, [r4, 0x4]
	ldr r0, _0811CAF0 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811CAC8: .4byte 0x040000b0
_0811CACC: .4byte 0x0000c5ff
_0811CAD0: .4byte 0x00007fff
_0811CAD4: .4byte 0x0200c000
_0811CAD8: .4byte 0x040000d4
_0811CADC: .4byte gUnknown_03004DE0
_0811CAE0: .4byte 0x800000a0
_0811CAE4: .4byte 0x04000012
_0811CAE8: .4byte gUnknown_03005560
_0811CAEC: .4byte 0x04000040
_0811CAF0: .4byte 0xa2400001
	thumb_func_end sub_811C670

	thumb_func_start sub_811C700
sub_811C700: @ 811CAF4
	push {r4,lr}
	ldr r4, _0811CB44 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CB48 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811CB4C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811CB50 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811CB2A
	ldr r1, _0811CB54 @ =0x040000d4
	ldr r0, _0811CB58 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811CB5C @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811CB2A:
	ldr r1, _0811CB60 @ =0x04000050
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	ldr r0, _0811CB64 @ =gUnknown_03005560
	str r0, [r4]
	ldr r0, _0811CB68 @ =0x04000054
	str r0, [r4, 0x4]
	ldr r0, _0811CB6C @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811CB44: .4byte 0x040000b0
_0811CB48: .4byte 0x0000c5ff
_0811CB4C: .4byte 0x00007fff
_0811CB50: .4byte 0x0200c000
_0811CB54: .4byte 0x040000d4
_0811CB58: .4byte gUnknown_03004DE0
_0811CB5C: .4byte 0x800000a0
_0811CB60: .4byte 0x04000050
_0811CB64: .4byte gUnknown_03005560
_0811CB68: .4byte 0x04000054
_0811CB6C: .4byte 0xa2400001
	thumb_func_end sub_811C700

	thumb_func_start sub_811C77C
sub_811C77C: @ 811CB70
	push {lr}
	ldr r0, _0811CB84 @ =0x04000006
	ldrh r0, [r0]
	cmp r0, 0x4F
	bhi _0811CB90
	ldr r0, _0811CB88 @ =0x04000010
	ldr r1, _0811CB8C @ =0x0200c000
	ldrh r1, [r1, 0x18]
	b _0811CB96
	.align 2, 0
_0811CB84: .4byte 0x04000006
_0811CB88: .4byte 0x04000010
_0811CB8C: .4byte 0x0200c000
_0811CB90:
	ldr r0, _0811CB9C @ =0x04000010
	ldr r1, _0811CBA0 @ =0x0200c000
	ldrh r1, [r1, 0x1A]
_0811CB96:
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0811CB9C: .4byte 0x04000010
_0811CBA0: .4byte 0x0200c000
	thumb_func_end sub_811C77C

	thumb_func_start sub_811C7B0
sub_811C7B0: @ 811CBA4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _0811CCE0 @ =gUnknown_083FD850
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	mov r8, r1
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _0811CCE4 @ =gUnknown_083FD86A
	lsls r1, 2
	mov r8, r1
	adds r1, r2
	ldrh r1, [r1]
	subs r1, 0x20
	lsls r1, 16
	asrs r1, 16
	adds r2, 0x2
	add r2, r8
	ldrh r2, [r2]
	adds r2, 0x2A
	lsls r2, 16
	asrs r2, 16
	ldr r5, _0811CCE8 @ =0x0200c03c
	str r5, [sp]
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	ldr r0, _0811CCEC @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	movs r1, 0x88
	lsls r1, 1
	str r5, [sp]
	movs r2, 0x6A
	movs r3, 0
	bl CreateTrainerSprite_BirchSpeech
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x24]
	movs r3, 0x22
	ldrsh r0, [r4, r3]
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	ldr r1, _0811CCF0 @ =gSprites
	adds r5, r1
	movs r2, 0x24
	ldrsh r0, [r4, r2]
	lsls r6, r0, 4
	adds r6, r0
	lsls r6, 2
	adds r6, r1
	ldr r0, _0811CCF4 @ =sub_811C90C
	str r0, [r5, 0x1C]
	str r0, [r6, 0x1C]
	ldrb r0, [r5, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	orrs r0, r1
	strb r0, [r6, 0x1]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1F
	mov r9, r3
	mov r4, r9
	ands r0, r4
	lsls r0, 1
	ldrb r2, [r5, 0x3]
	movs r4, 0x3F
	negs r4, r4
	adds r1, r4, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, 0x3]
	bl AllocOamMatrix
	lsls r0, 24
	lsrs r0, 24
	mov r1, r9
	ands r0, r1
	lsls r0, 1
	ldrb r1, [r6, 0x3]
	ands r4, r1
	orrs r4, r0
	strb r4, [r6, 0x3]
	ldrb r2, [r5, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r2
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r5, 0x1]
	ldrb r0, [r6, 0x1]
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, 0x1]
	ldrb r0, [r5, 0x3]
	movs r1, 0xC0
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r0, [r6, 0x3]
	orrs r0, r1
	strb r0, [r6, 0x3]
	adds r0, r5, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	adds r0, r6, 0
	movs r1, 0x1
	movs r2, 0x3
	movs r3, 0x3
	bl CalcCenterToCornerVec
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r2, _0811CCF8 @ =gUnknown_083FD856
	mov r3, r8
	adds r1, r3, r2
	movs r4, 0
	ldrsh r1, [r1, r4]
	adds r2, 0x2
	add r8, r2
	mov r3, r8
	movs r4, 0
	ldrsh r2, [r3, r4]
	movs r3, 0
	bl SetOamMatrixRotationScaling
	ldrb r0, [r6, 0x3]
	lsls r0, 26
	lsrs r0, 27
	ldr r1, _0811CCFC @ =0xfffffe00
	movs r2, 0x80
	lsls r2, 2
	movs r3, 0
	bl SetOamMatrixRotationScaling
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811CCE0: .4byte gUnknown_083FD850
_0811CCE4: .4byte gUnknown_083FD86A
_0811CCE8: .4byte 0x0200c03c
_0811CCEC: .4byte gSaveBlock2
_0811CCF0: .4byte gSprites
_0811CCF4: .4byte sub_811C90C
_0811CCF8: .4byte gUnknown_083FD856
_0811CCFC: .4byte 0xfffffe00
	thumb_func_end sub_811C7B0

	thumb_func_start sub_811C90C
sub_811C90C: @ 811CD00
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0811CD24 @ =gUnknown_083FD880
_0811CD06:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811CD06
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811CD24: .4byte gUnknown_083FD880
	thumb_func_end sub_811C90C

	thumb_func_start sub_811C934
sub_811C934: @ 811CD28
	movs r0, 0
	bx lr
	thumb_func_end sub_811C934

	thumb_func_start sub_811C938
sub_811C938: @ 811CD2C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r1, _0811CD70 @ =gUnknown_083FD89C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0x4
	ldr r1, _0811CD74 @ =gUnknown_083FD8A0
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x30]
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	lsls r0, 1
	adds r4, r0
	ldrh r0, [r4]
	strh r0, [r5, 0x32]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811CD70: .4byte gUnknown_083FD89C
_0811CD74: .4byte gUnknown_083FD8A0
	thumb_func_end sub_811C938

	thumb_func_start sub_811C984
sub_811C984: @ 811CD78
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x30]
	ldrh r3, [r1, 0x20]
	adds r2, r0, r3
	strh r2, [r1, 0x20]
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0811CD96
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x84
	bgt _0811CDA4
	b _0811CD9E
_0811CD96:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x67
	ble _0811CDA4
_0811CD9E:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
_0811CDA4:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C984

	thumb_func_start sub_811C9B8
sub_811C9B8: @ 811CDAC
	push {lr}
	adds r2, r0, 0
	ldrh r3, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	adds r1, r3, r0
	strh r1, [r2, 0x30]
	ldrh r0, [r2, 0x20]
	adds r0, r1
	strh r0, [r2, 0x20]
	lsls r1, 16
	cmp r1, 0
	bne _0811CDD2
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	negs r0, r3
	strh r0, [r2, 0x32]
	movs r0, 0x1
	strh r0, [r2, 0x3A]
_0811CDD2:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C9B8

	thumb_func_start sub_811C9E4
sub_811C9E4: @ 811CDD8
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x30]
	adds r0, r1
	strh r0, [r2, 0x30]
	ldrh r1, [r2, 0x20]
	adds r1, r0
	strh r1, [r2, 0x20]
	adds r1, 0x1F
	lsls r1, 16
	movs r0, 0x97
	lsls r0, 17
	cmp r1, r0
	bls _0811CDFC
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
_0811CDFC:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_811C9E4

	thumb_func_start sub_811CA10
sub_811CA10: @ 811CE04
	ldr r3, _0811CE18 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	strh r1, [r2, 0x3C]
	bx lr
	.align 2, 0
_0811CE18: .4byte gSprites
	thumb_func_end sub_811CA10

	thumb_func_start sub_811CA28
sub_811CA28: @ 811CE1C
	ldr r2, _0811CE34 @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	bx lr
	.align 2, 0
_0811CE34: .4byte gSprites
	thumb_func_end sub_811CA28

	thumb_func_start sub_811CA44
sub_811CA44: @ 811CE38
	ldr r2, _0811CE4C @ =gSprites
	lsls r0, 16
	asrs r0, 16
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x3A
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0811CE4C: .4byte gSprites
	thumb_func_end sub_811CA44

	thumb_func_start sub_811CA5C
sub_811CA5C: @ 811CE50
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811CE80 @ =gUnknown_083FD8A4
	ldr r2, _0811CE84 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811CE62:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811CE62
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811CE80: .4byte gUnknown_083FD8A4
_0811CE84: .4byte gTasks
	thumb_func_end sub_811CA5C

	thumb_func_start sub_811CA94
sub_811CA94: @ 811CE88
	push {r4-r6,lr}
	adds r4, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	movs r2, 0
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r4, 0xC]
	movs r0, 0x1
	strh r0, [r4, 0xE]
	ldr r1, _0811CEFC @ =0x0200c000
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	ldr r3, _0811CF00 @ =gUnknown_03005560
	adds r6, r1, 0
	movs r5, 0xF0
_0811CEB2:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r6, 0x14]
	strh r1, [r0]
	adds r0, r2, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r3
	strh r5, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x9F
	bls _0811CEB2
	ldr r2, _0811CF04 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811CF08 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0811CF0C @ =sub_811CC28
	bl SetVBlankCallback
	ldr r0, _0811CF10 @ =sub_811CCB0
	bl SetHBlankCallback
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811CEFC: .4byte 0x0200c000
_0811CF00: .4byte gUnknown_03005560
_0811CF04: .4byte 0x04000200
_0811CF08: .4byte 0x04000004
_0811CF0C: .4byte sub_811CC28
_0811CF10: .4byte sub_811CCB0
	thumb_func_end sub_811CA94

	thumb_func_start sub_811CB20
sub_811CB20: @ 811CF14
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r2, r0, 0
	ldr r1, _0811CF8C @ =0x0200c000
	ldrb r0, [r1]
	movs r0, 0
	strb r0, [r1]
	ldrh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 24
	ldrh r3, [r2, 0xA]
	adds r0, r3
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	mov r12, r1
	cmp r0, 0xF0
	ble _0811CF3E
	movs r0, 0xF0
	strh r0, [r2, 0xA]
_0811CF3E:
	ldrh r4, [r2, 0xC]
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	ldr r0, _0811CF90 @ =0x00000fff
	ldrh r3, [r2, 0xE]
	cmp r1, r0
	bgt _0811CF50
	adds r0, r4, r3
	strh r0, [r2, 0xC]
_0811CF50:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x7F
	bgt _0811CF5C
	lsls r0, r3, 1
	strh r0, [r2, 0xE]
_0811CF5C:
	movs r5, 0
	ldr r7, _0811CF94 @ =gUnknown_03004DE0
	movs r1, 0xA0
	lsls r1, 1
	adds r1, r7
	mov r8, r1
	mov r6, r12
_0811CF6A:
	lsls r0, r5, 1
	adds r3, r0, r7
	mov r1, r8
	adds r4, r0, r1
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _0811CF98
	ldrh r0, [r2, 0xA]
	ldrh r1, [r6, 0x14]
	adds r0, r1
	strh r0, [r3]
	ldrh r1, [r2, 0xA]
	movs r0, 0xF0
	subs r0, r1
	b _0811CFA8
	.align 2, 0
_0811CF8C: .4byte 0x0200c000
_0811CF90: .4byte 0x00000fff
_0811CF94: .4byte gUnknown_03004DE0
_0811CF98:
	ldrh r0, [r6, 0x14]
	ldrh r1, [r2, 0xA]
	subs r0, r1
	strh r0, [r3]
	ldrh r0, [r2, 0xA]
	lsls r0, 8
	movs r1, 0xF1
	orrs r0, r1
_0811CFA8:
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x9F
	bls _0811CF6A
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	cmp r0, 0xEF
	ble _0811CFC2
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_0811CFC2:
	mov r1, r12
	ldrb r0, [r1]
	adds r0, 0x1
	ldrb r1, [r1]
	mov r2, r12
	strb r0, [r2]
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811CB20

	thumb_func_start sub_811CBE8
sub_811CBE8: @ 811CFDC
	push {lr}
	ldr r1, _0811D00C @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D010 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D014 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811D018 @ =sub_811CA5C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811D00C: .4byte 0x040000b0
_0811D010: .4byte 0x0000c5ff
_0811D014: .4byte 0x00007fff
_0811D018: .4byte sub_811CA5C
	thumb_func_end sub_811CBE8

	thumb_func_start sub_811CC28
sub_811CC28: @ 811D01C
	push {r4,lr}
	ldr r4, _0811D078 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D07C @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D080 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811D084 @ =0x04000048
	ldr r1, _0811D088 @ =0x0200c000
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	subs r2, 0x6
	ldrh r0, [r1, 0x8]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811D064
	ldr r1, _0811D08C @ =0x040000d4
	ldr r0, _0811D090 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811D094 @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811D064:
	ldr r0, _0811D098 @ =gUnknown_030056A0
	str r0, [r4]
	ldr r0, _0811D09C @ =0x04000040
	str r0, [r4, 0x4]
	ldr r0, _0811D0A0 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D078: .4byte 0x040000b0
_0811D07C: .4byte 0x0000c5ff
_0811D080: .4byte 0x00007fff
_0811D084: .4byte 0x04000048
_0811D088: .4byte 0x0200c000
_0811D08C: .4byte 0x040000d4
_0811D090: .4byte gUnknown_03004DE0
_0811D094: .4byte 0x80000140
_0811D098: .4byte gUnknown_030056A0
_0811D09C: .4byte 0x04000040
_0811D0A0: .4byte 0xa2400001
	thumb_func_end sub_811CC28

	thumb_func_start sub_811CCB0
sub_811CCB0: @ 811D0A4
	ldr r1, _0811D0C4 @ =gUnknown_03004DE0
	ldr r0, _0811D0C8 @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r2, 0xF0
	lsls r2, 3
	adds r1, r2
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _0811D0CC @ =0x04000014
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811D0C4: .4byte gUnknown_03004DE0
_0811D0C8: .4byte 0x04000006
_0811D0CC: .4byte 0x04000014
	thumb_func_end sub_811CCB0

	thumb_func_start sub_811CCDC
sub_811CCDC: @ 811D0D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D100 @ =gUnknown_083FD8B0
	ldr r2, _0811D104 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D0E2:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D0E2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D100: .4byte gUnknown_083FD8B0
_0811D104: .4byte gTasks
	thumb_func_end sub_811CCDC

	thumb_func_start sub_811CD14
sub_811CD14: @ 811D108
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811D17C @ =0x0200c000
	movs r2, 0
	movs r0, 0xBF
	strh r0, [r1, 0xE]
	strh r2, [r1, 0x12]
	movs r0, 0x1E
	strh r0, [r1, 0x2]
	movs r0, 0x3F
	strh r0, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _0811D180 @ =gUnknown_03005560
	movs r4, 0
	movs r3, 0xF0
_0811D132:
	lsls r0, r1, 1
	adds r0, r2
	strh r4, [r0]
	adds r0, r1, 0
	adds r0, 0xA0
	lsls r0, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811D132
	ldr r2, _0811D184 @ =0x04000200
	ldrh r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0811D188 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0811D18C @ =sub_811CFAC
	bl SetHBlankCallback
	ldr r0, _0811D190 @ =sub_811CEE4
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811D17C: .4byte 0x0200c000
_0811D180: .4byte gUnknown_03005560
_0811D184: .4byte 0x04000200
_0811D188: .4byte 0x04000004
_0811D18C: .4byte sub_811CFAC
_0811D190: .4byte sub_811CEE4
	thumb_func_end sub_811CD14

	thumb_func_start sub_811CDA0
sub_811CDA0: @ 811D194
	push {r4-r6,lr}
	sub sp, 0x10
	adds r6, r0, 0
	ldr r1, _0811D1FC @ =gUnknown_083FD8C4
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	movs r5, 0
	movs r4, 0
_0811D1A8:
	ldr r0, _0811D200 @ =sub_811CFD0
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _0811D204 @ =gSprites
	adds r2, r1, r0
	movs r0, 0xF0
	strh r0, [r2, 0x20]
	strh r4, [r2, 0x22]
	lsls r1, r5, 16
	asrs r1, 16
	lsls r0, r1, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r2, 0x38]
	adds r1, 0x1
	lsls r1, 16
	lsls r0, r4, 16
	movs r3, 0xA0
	lsls r3, 13
	adds r0, r3
	lsrs r4, r0, 16
	lsrs r5, r1, 16
	asrs r1, 16
	cmp r1, 0x7
	ble _0811D1A8
	ldrh r0, [r2, 0x3A]
	adds r0, 0x1
	strh r0, [r2, 0x3A]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811D1FC: .4byte gUnknown_083FD8C4
_0811D200: .4byte sub_811CFD0
_0811D204: .4byte gSprites
	thumb_func_end sub_811CDA0

	thumb_func_start sub_811CE14
sub_811CE14: @ 811D208
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0811D238 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	movs r1, 0x20
	ldrsh r0, [r0, r1]
	cmp r0, 0x7
	ble _0811D22E
	movs r0, 0x1
	negs r0, r0
	ldr r2, _0811D23C @ =0x00007fff
	movs r1, 0x10
	bl BlendPalettes
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0811D22E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D238: .4byte 0x0200c000
_0811D23C: .4byte 0x00007fff
	thumb_func_end sub_811CE14

	thumb_func_start sub_811CE4C
sub_811CE4C: @ 811D240
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r4, _0811D290 @ =0x0200c000
	ldrb r0, [r4]
	movs r5, 0
	strb r5, [r4]
	ldr r1, _0811D294 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D298 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D29C @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r0, 0xF0
	strh r0, [r4, 0x6]
	strh r5, [r4, 0x12]
	movs r0, 0xFF
	strh r0, [r4, 0xE]
	movs r0, 0x3F
	strh r0, [r4, 0x2]
	ldr r0, _0811D2A0 @ =sub_811CF74
	bl SetVBlankCallback
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811D290: .4byte 0x0200c000
_0811D294: .4byte 0x040000b0
_0811D298: .4byte 0x0000c5ff
_0811D29C: .4byte 0x00007fff
_0811D2A0: .4byte sub_811CF74
	thumb_func_end sub_811CE4C

	thumb_func_start sub_811CEB0
sub_811CEB0: @ 811D2A4
	push {lr}
	ldr r1, _0811D2D0 @ =0x0200c000
	ldrh r0, [r1, 0x12]
	adds r0, 0x1
	strh r0, [r1, 0x12]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x10
	bls _0811D2C8
	bl sub_811D6D4
	ldr r0, _0811D2D4 @ =sub_811CCDC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811D2C8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811D2D0: .4byte 0x0200c000
_0811D2D4: .4byte sub_811CCDC
	thumb_func_end sub_811CEB0

	thumb_func_start sub_811CEE4
sub_811CEE4: @ 811D2D8
	push {r4,lr}
	ldr r4, _0811D33C @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D340 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D344 @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811D348 @ =0x04000050
	ldr r1, _0811D34C @ =0x0200c000
	ldrh r0, [r1, 0xE]
	strh r0, [r2]
	subs r2, 0x8
	ldrh r0, [r1, 0x2]
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r1, 0x4]
	strh r0, [r2]
	subs r2, 0x6
	ldrh r0, [r1, 0x6]
	strh r0, [r2]
	ldrb r0, [r1]
	cmp r0, 0
	beq _0811D326
	ldr r1, _0811D350 @ =0x040000d4
	ldr r0, _0811D354 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r2, 0xF0
	lsls r2, 3
	adds r0, r2
	str r0, [r1, 0x4]
	ldr r0, _0811D358 @ =0x80000140
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811D326:
	ldr r0, _0811D35C @ =gUnknown_030056A0
	str r0, [r4]
	ldr r0, _0811D360 @ =0x04000040
	str r0, [r4, 0x4]
	ldr r0, _0811D364 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D33C: .4byte 0x040000b0
_0811D340: .4byte 0x0000c5ff
_0811D344: .4byte 0x00007fff
_0811D348: .4byte 0x04000050
_0811D34C: .4byte 0x0200c000
_0811D350: .4byte 0x040000d4
_0811D354: .4byte gUnknown_03004DE0
_0811D358: .4byte 0x80000140
_0811D35C: .4byte gUnknown_030056A0
_0811D360: .4byte 0x04000040
_0811D364: .4byte 0xa2400001
	thumb_func_end sub_811CEE4

	thumb_func_start sub_811CF74
sub_811CF74: @ 811D368
	push {lr}
	bl sub_811D67C
	ldr r1, _0811D398 @ =0x04000054
	ldr r2, _0811D39C @ =0x0200c000
	ldrh r0, [r2, 0x12]
	strh r0, [r1]
	subs r1, 0x4
	ldrh r0, [r2, 0xE]
	strh r0, [r1]
	subs r1, 0x8
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0xA
	ldrh r0, [r2, 0x6]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0811D398: .4byte 0x04000054
_0811D39C: .4byte 0x0200c000
	thumb_func_end sub_811CF74

	thumb_func_start sub_811CFAC
sub_811CFAC: @ 811D3A0
	ldr r2, _0811D3B8 @ =0x04000054
	ldr r1, _0811D3BC @ =gUnknown_03004DE0
	ldr r0, _0811D3C0 @ =0x04000006
	ldrh r0, [r0]
	lsls r0, 1
	movs r3, 0xF0
	lsls r3, 3
	adds r1, r3
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	bx lr
	.align 2, 0
_0811D3B8: .4byte 0x04000054
_0811D3BC: .4byte gUnknown_03004DE0
_0811D3C0: .4byte 0x04000006
	thumb_func_end sub_811CFAC

	thumb_func_start sub_811CFD0
sub_811CFD0: @ 811D3C4
	push {r4-r6,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0x38]
	movs r2, 0x38
	ldrsh r0, [r3, r2]
	cmp r0, 0
	beq _0811D3EC
	subs r0, r1, 0x1
	strh r0, [r3, 0x38]
	movs r1, 0x3A
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0811D49E
	ldr r0, _0811D3E8 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
	b _0811D49E
	.align 2, 0
_0811D3E8: .4byte 0x0200c000
_0811D3EC:
	movs r2, 0x22
	ldrsh r1, [r3, r2]
	lsls r1, 1
	ldr r0, _0811D4A4 @ =gUnknown_03004DE0
	adds r6, r1, r0
	movs r2, 0xA0
	lsls r2, 1
	adds r0, r2
	adds r5, r1, r0
	movs r4, 0
_0811D400:
	lsls r1, r4, 1
	adds r2, r1, r6
	ldrh r0, [r3, 0x2E]
	lsls r0, 16
	asrs r0, 24
	strh r0, [r2]
	adds r1, r5
	ldrh r0, [r3, 0x20]
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _0811D400
	movs r1, 0x20
	ldrsh r0, [r3, r1]
	ldrh r2, [r3, 0x20]
	cmp r0, 0
	bne _0811D43A
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	movs r0, 0x80
	lsls r0, 5
	cmp r1, r0
	bne _0811D43A
	movs r0, 0x1
	strh r0, [r3, 0x30]
_0811D43A:
	adds r1, r2, 0
	subs r1, 0x10
	strh r1, [r3, 0x20]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x80
	strh r0, [r3, 0x2E]
	lsls r1, 16
	cmp r1, 0
	bge _0811D450
	movs r0, 0
	strh r0, [r3, 0x20]
_0811D450:
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	movs r1, 0x80
	lsls r1, 5
	cmp r0, r1
	ble _0811D45E
	strh r1, [r3, 0x2E]
_0811D45E:
	movs r0, 0x3A
	ldrsh r2, [r3, r0]
	cmp r2, 0
	beq _0811D46E
	ldr r0, _0811D4A8 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0x1
	strb r1, [r0]
_0811D46E:
	movs r1, 0x30
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0811D49E
	ldr r4, _0811D4A8 @ =0x0200c000
	cmp r2, 0
	beq _0811D492
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0x6
	ble _0811D49E
	ldrh r0, [r3, 0x32]
	adds r1, r0, 0x1
	strh r1, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _0811D49E
_0811D492:
	ldrh r0, [r4, 0x20]
	adds r0, 0x1
	strh r0, [r4, 0x20]
	adds r0, r3, 0
	bl DestroySprite
_0811D49E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D4A4: .4byte gUnknown_03004DE0
_0811D4A8: .4byte 0x0200c000
	thumb_func_end sub_811CFD0

	thumb_func_start sub_811D0B8
sub_811D0B8: @ 811D4AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D4DC @ =gUnknown_083FD8D4
	ldr r2, _0811D4E0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D4BE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D4BE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D4DC: .4byte gUnknown_083FD8D4
_0811D4E0: .4byte gTasks
	thumb_func_end sub_811D0B8

	thumb_func_start sub_811D0F0
sub_811D0F0: @ 811D4E4
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	add r0, sp, 0x4
	add r1, sp, 0x8
	bl sub_811D6A8
	ldr r0, _0811D52C @ =gUnknown_083FD528
	ldr r1, [sp, 0x8]
	movs r2, 0x10
	bl CpuSet
	mov r1, sp
	movs r2, 0xF0
	lsls r2, 8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, [sp, 0x4]
	ldr r2, _0811D530 @ =0x01000400
	mov r0, sp
	bl CpuSet
	ldr r0, _0811D534 @ =gFieldEffectObjectPalette10
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D52C: .4byte gUnknown_083FD528
_0811D530: .4byte 0x01000400
_0811D534: .4byte gFieldEffectObjectPalette10
	thumb_func_end sub_811D0F0

	thumb_func_start sub_811D144
sub_811D144: @ 811D538
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0811D57A
	mov r0, sp
	bl sub_811D690
	movs r0, 0x3
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 5
	ldr r1, _0811D58C @ =gUnknown_083FD528
	adds r0, r1
	ldr r1, [sp]
	movs r2, 0x10
	bl CpuSet
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0xD
	ble _0811D57A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x10
	strh r0, [r4, 0xA]
_0811D57A:
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D58C: .4byte gUnknown_083FD528
	thumb_func_end sub_811D144

	thumb_func_start sub_811D19C
sub_811D19C: @ 811D590
	push {lr}
	ldrh r1, [r0, 0xA]
	subs r1, 0x1
	strh r1, [r0, 0xA]
	lsls r1, 16
	cmp r1, 0
	bne _0811D5B0
	bl sub_811D6D4
	ldr r0, _0811D5B8 @ =sub_811D0B8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0811D5B0:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811D5B8: .4byte sub_811D0B8
	thumb_func_end sub_811D19C

	thumb_func_start sub_811D1C8
sub_811D1C8: @ 811D5BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D5EC @ =gUnknown_083FD8E0
	ldr r2, _0811D5F0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D5CE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D5CE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D5EC: .4byte gUnknown_083FD8E0
_0811D5F0: .4byte gTasks
	thumb_func_end sub_811D1C8

	thumb_func_start sub_811D200
sub_811D200: @ 811D5F4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_811D658
	bl dp12_8087EA4
	ldr r1, _0811D648 @ =0x0200c000
	movs r2, 0
	movs r0, 0x3F
	strh r0, [r1, 0x2]
	strh r2, [r1, 0x4]
	movs r0, 0xA0
	strh r0, [r1, 0x8]
	movs r1, 0
	ldr r2, _0811D64C @ =gUnknown_03004DE0
	movs r3, 0xF0
	adds r4, r2, 0
_0811D616:
	lsls r0, r1, 1
	adds r0, r2
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9F
	bls _0811D616
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r4, r0
	adds r0, r4, 0
	movs r2, 0xA0
	bl CpuSet
	ldr r0, _0811D650 @ =sub_811D438
	bl SetVBlankCallback
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0811D648: .4byte 0x0200c000
_0811D64C: .4byte gUnknown_03004DE0
_0811D650: .4byte sub_811D438
	thumb_func_end sub_811D200

	thumb_func_start sub_811D260
sub_811D260: @ 811D654
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0xC
	mov r8, r0
	ldr r0, _0811D6C4 @ =0x0200c024
	ldr r6, _0811D6C8 @ =gUnknown_083FD8F4
	mov r2, r8
	movs r3, 0xA
	ldrsh r1, [r2, r3]
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 1
	adds r1, r4, r6
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r2, r6, 0x2
	adds r2, r4, r2
	movs r3, 0
	ldrsh r2, [r2, r3]
	adds r3, r6, 0x4
	adds r3, r4, r3
	movs r5, 0
	ldrsh r3, [r3, r5]
	adds r5, r6, 0x6
	adds r4, r5
	movs r5, 0
	ldrsh r4, [r4, r5]
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	bl sub_811D8FC
	mov r0, r8
	movs r2, 0xA
	ldrsh r1, [r0, r2]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 1
	adds r6, 0x8
	adds r0, r6
	ldrh r0, [r0]
	mov r3, r8
	strh r0, [r3, 0xC]
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
	movs r0, 0x1
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811D6C4: .4byte 0x0200c024
_0811D6C8: .4byte gUnknown_083FD8F4
	thumb_func_end sub_811D260

	thumb_func_start sub_811D2D8
sub_811D2D8: @ 811D6CC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	ldr r0, _0811D718 @ =0x0200c000
	ldrb r1, [r0]
	movs r1, 0
	strb r1, [r0]
	mov r8, r1
	mov r12, r1
	adds r6, r0, 0
	ldr r0, _0811D71C @ =gUnknown_03004DE0
	mov r9, r0
_0811D6E8:
	ldr r1, _0811D71C @ =gUnknown_03004DE0
	movs r2, 0x2A
	ldrsh r0, [r6, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsrs r3, r0, 8
	movs r4, 0xFF
	ands r4, r0
	movs r1, 0xC
	ldrsh r0, [r7, r1]
	cmp r0, 0
	bne _0811D720
	movs r2, 0x28
	ldrsh r0, [r6, r2]
	cmp r3, r0
	bge _0811D70C
	ldrh r3, [r6, 0x28]
_0811D70C:
	lsls r0, r3, 16
	lsls r1, r4, 16
	cmp r0, r1
	ble _0811D738
	lsrs r3, r1, 16
	b _0811D738
	.align 2, 0
_0811D718: .4byte 0x0200c000
_0811D71C: .4byte gUnknown_03004DE0
_0811D720:
	lsls r0, r4, 16
	asrs r0, 16
	movs r2, 0x28
	ldrsh r1, [r6, r2]
	cmp r0, r1
	ble _0811D72E
	ldrh r4, [r6, 0x28]
_0811D72E:
	lsls r0, r4, 16
	lsls r1, r3, 16
	cmp r0, r1
	bgt _0811D738
	lsrs r4, r1, 16
_0811D738:
	ldr r5, _0811D75C @ =0x0200c000
	movs r0, 0x2A
	ldrsh r2, [r5, r0]
	lsls r2, 1
	add r2, r9
	lsls r1, r3, 16
	asrs r1, 8
	lsls r0, r4, 16
	asrs r0, 16
	orrs r0, r1
	strh r0, [r2]
	mov r1, r12
	cmp r1, 0
	beq _0811D760
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	b _0811D786
	.align 2, 0
_0811D75C: .4byte 0x0200c000
_0811D760:
	adds r0, r5, 0
	adds r0, 0x24
	movs r1, 0x1
	movs r2, 0x1
	bl sub_811D978
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	mov r2, r8
	lsls r0, r2, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r2, r0, 16
	mov r8, r2
	asrs r0, 16
	cmp r0, 0xF
	ble _0811D6E8
_0811D786:
	ldr r0, _0811D7A0 @ =0x0200c000
	ldrb r1, [r0]
	adds r1, 0x1
	ldrb r2, [r0]
	strb r1, [r0]
	movs r0, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0811D7A0: .4byte 0x0200c000
	thumb_func_end sub_811D2D8

	thumb_func_start sub_811D3B0
sub_811D3B0: @ 811D7A4
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0xA]
	adds r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _0811D7F0
	ldr r1, _0811D7E0 @ =0x040000b0
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D7E4 @ =0x0000c5ff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r2, [r1, 0xA]
	ldr r0, _0811D7E8 @ =0x00007fff
	ands r0, r2
	strh r0, [r1, 0xA]
	ldrh r0, [r1, 0xA]
	bl sub_811D6D4
	ldr r0, _0811D7EC @ =sub_811D1C8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	b _0811D808
	.align 2, 0
_0811D7E0: .4byte 0x040000b0
_0811D7E4: .4byte 0x0000c5ff
_0811D7E8: .4byte 0x00007fff
_0811D7EC: .4byte sub_811D1C8
_0811D7F0:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	ldr r1, _0811D80C @ =gUnknown_083FD93A
	movs r3, 0xA
	ldrsh r0, [r2, r3]
	subs r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2, 0xE]
	movs r0, 0x1
_0811D808:
	pop {r1}
	bx r1
	.align 2, 0
_0811D80C: .4byte gUnknown_083FD93A
	thumb_func_end sub_811D3B0

	thumb_func_start sub_811D41C
sub_811D41C: @ 811D810
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0xE]
	subs r0, 0x1
	strh r0, [r1, 0xE]
	lsls r0, 16
	cmp r0, 0
	beq _0811D824
	movs r0, 0
	b _0811D828
_0811D824:
	movs r0, 0x1
	strh r0, [r1, 0x8]
_0811D828:
	pop {r1}
	bx r1
	thumb_func_end sub_811D41C

	thumb_func_start sub_811D438
sub_811D438: @ 811D82C
	push {r4,lr}
	ldr r4, _0811D894 @ =0x040000b0
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D898 @ =0x0000c5ff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r1, [r4, 0xA]
	ldr r0, _0811D89C @ =0x00007fff
	ands r0, r1
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xA]
	bl sub_811D67C
	ldr r2, _0811D8A0 @ =0x0200c000
	ldrb r0, [r2]
	cmp r0, 0
	beq _0811D862
	ldr r1, _0811D8A4 @ =0x040000d4
	ldr r0, _0811D8A8 @ =gUnknown_03004DE0
	str r0, [r1]
	movs r3, 0xF0
	lsls r3, 3
	adds r0, r3
	str r0, [r1, 0x4]
	ldr r0, _0811D8AC @ =0x800000a0
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
_0811D862:
	ldr r1, _0811D8B0 @ =0x04000048
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r2, 0x4]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2, 0x8]
	strh r0, [r1]
	ldr r2, _0811D8B4 @ =0x04000040
	ldr r0, _0811D8A8 @ =gUnknown_03004DE0
	movs r1, 0xF0
	lsls r1, 3
	adds r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	str r0, [r4]
	str r2, [r4, 0x4]
	ldr r0, _0811D8B8 @ =0xa2400001
	str r0, [r4, 0x8]
	ldr r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811D894: .4byte 0x040000b0
_0811D898: .4byte 0x0000c5ff
_0811D89C: .4byte 0x00007fff
_0811D8A0: .4byte 0x0200c000
_0811D8A4: .4byte 0x040000d4
_0811D8A8: .4byte gUnknown_03004DE0
_0811D8AC: .4byte 0x800000a0
_0811D8B0: .4byte 0x04000048
_0811D8B4: .4byte 0x04000040
_0811D8B8: .4byte 0xa2400001
	thumb_func_end sub_811D438

	thumb_func_start sub_811D4C8
sub_811D4C8: @ 811D8BC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	mov r8, r0
	adds r4, r1, 0
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r3, [sp, 0x18]
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	lsrs r3, 16
	ldr r0, _0811D918 @ =sub_811D54C
	movs r1, 0x3
	str r3, [sp]
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811D91C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r0, r8
	strh r0, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r5, [r1, 0xE]
	strh r6, [r1, 0x10]
	ldr r3, [sp]
	strh r3, [r1, 0x12]
	strh r0, [r1, 0x14]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0811D918: .4byte sub_811D54C
_0811D91C: .4byte gTasks
	thumb_func_end sub_811D4C8

	thumb_func_start sub_811D52C
sub_811D52C: @ 811D920
	push {lr}
	ldr r0, _0811D934 @ =sub_811D54C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0811D938
	movs r0, 0
	b _0811D93A
	.align 2, 0
_0811D934: .4byte sub_811D54C
_0811D938:
	movs r0, 0x1
_0811D93A:
	pop {r1}
	bx r1
	thumb_func_end sub_811D52C

	thumb_func_start sub_811D54C
sub_811D54C: @ 811D940
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0811D970 @ =gUnknown_083FD948
	ldr r2, _0811D974 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0811D952:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0811D952
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0811D970: .4byte gUnknown_083FD948
_0811D974: .4byte gTasks
	thumb_func_end sub_811D54C

	thumb_func_start sub_811D584
sub_811D584: @ 811D978
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D990
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811D9B4
_0811D990:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0x16]
	adds r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	ble _0811D9A8
	movs r0, 0x10
	strh r0, [r4, 0x16]
_0811D9A8:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811D9D0 @ =0x00002d6b
	bl BlendPalettes
_0811D9B4:
	movs r2, 0x16
	ldrsh r0, [r4, r2]
	cmp r0, 0xF
	ble _0811D9C6
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
_0811D9C6:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0811D9D0: .4byte 0x00002d6b
	thumb_func_end sub_811D584

	thumb_func_start sub_811D5E0
sub_811D5E0: @ 811D9D4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x14]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0811D9EC
	subs r0, r1, 0x1
	strh r0, [r4, 0x14]
	lsls r0, 16
	cmp r0, 0
	bne _0811DA0E
_0811D9EC:
	ldrh r0, [r4, 0xC]
	strh r0, [r4, 0x14]
	ldrh r0, [r4, 0x16]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r4, 0x16]
	lsls r0, 16
	cmp r0, 0
	bge _0811DA02
	movs r0, 0
	strh r0, [r4, 0x16]
_0811DA02:
	movs r0, 0x1
	negs r0, r0
	ldrb r1, [r4, 0x16]
	ldr r2, _0811DA34 @ =0x00002d6b
	bl BlendPalettes
_0811DA0E:
	movs r0, 0x16
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _0811DA42
	ldrh r0, [r4, 0xE]
	subs r0, 0x1
	strh r0, [r4, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0811DA3C
	ldr r0, _0811DA38 @ =sub_811D54C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _0811DA42
	.align 2, 0
_0811DA34: .4byte 0x00002d6b
_0811DA38: .4byte sub_811D54C
_0811DA3C:
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x8]
_0811DA42:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_811D5E0

	thumb_func_start sub_811D658
sub_811D658: @ 811DA4C
	push {lr}
	ldr r0, _0811DA68 @ =gUnknown_083FD708
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0x3C
	bl memset
	ldr r0, _0811DA6C @ =0x0200c014
	adds r1, r0, 0x2
	bl sub_8057B14
	pop {r0}
	bx r0
	.align 2, 0
_0811DA68: .4byte gUnknown_083FD708
_0811DA6C: .4byte 0x0200c014
	thumb_func_end sub_811D658

	thumb_func_start sub_811D67C
sub_811D67C: @ 811DA70
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_811D67C

	thumb_func_start sub_811D690
sub_811D690: @ 811DA84
	ldr r1, _0811DA98 @ =0x04000008
	ldrh r1, [r1]
	lsrs r1, 2
	lsls r1, 30
	lsrs r1, 16
	movs r2, 0xC0
	lsls r2, 19
	adds r1, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0811DA98: .4byte 0x04000008
	thumb_func_end sub_811D690

	thumb_func_start sub_811D6A8
sub_811D6A8: @ 811DA9C
	push {r4,lr}
	ldr r3, _0811DAC4 @ =0x04000008
	ldrh r2, [r3]
	lsrs r2, 8
	ldrh r3, [r3]
	lsrs r3, 2
	lsls r2, 27
	lsrs r2, 16
	lsls r3, 30
	lsrs r3, 16
	movs r4, 0xC0
	lsls r4, 19
	adds r2, r4
	str r2, [r0]
	adds r3, r4
	str r3, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0811DAC4: .4byte 0x04000008
	thumb_func_end sub_811D6A8

	thumb_func_start sub_811D6D4
sub_811D6D4: @ 811DAC8
	push {lr}
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	pop {r0}
	bx r0
	thumb_func_end sub_811D6D4

	thumb_func_start sub_811D6E8
sub_811D6E8: @ 811DADC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	ldr r0, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r4, 16
	movs r6, 0
	lsrs r5, r4, 16
	cmp r4, 0
	ble _0811DB44
	lsls r0, r7, 16
	asrs r0, 16
	mov r9, r0
	lsls r1, 16
	mov r8, r1
	lsls r0, r3, 16
	asrs r7, r0, 16
_0811DB14:
	lsls r4, r2, 16
	asrs r4, 16
	movs r0, 0xFF
	ands r0, r4
	mov r2, r8
	asrs r1, r2, 16
	bl Sin
	lsls r1, r6, 1
	add r1, r10
	add r0, r9
	strh r0, [r1]
	lsls r1, r5, 16
	ldr r0, _0811DB54 @ =0xffff0000
	adds r1, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r7
	lsls r4, 16
	lsrs r2, r4, 16
	lsrs r5, r1, 16
	cmp r1, 0
	bgt _0811DB14
_0811DB44:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811DB54: .4byte 0xffff0000
	thumb_func_end sub_811D6E8

	thumb_func_start sub_811D764
sub_811D764: @ 811DB58
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r9, r0
	adds r5, r2, 0
	adds r4, r3, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	movs r2, 0xA0
	lsls r2, 1
	movs r1, 0xA
	bl memset
	movs r1, 0
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
_0811DB90:
	lsls r5, r1, 16
	asrs r0, r5, 16
	mov r10, r0
	ldr r1, [sp, 0x4]
	bl Sin
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r10
	ldr r1, [sp, 0x4]
	bl Cos
	ldr r2, [sp]
	lsls r1, r2, 16
	asrs r1, 16
	lsls r4, 16
	asrs r4, 16
	subs r2, r1, r4
	lsls r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r0, 16
	asrs r0, 16
	ldr r3, [sp, 0x8]
	subs r1, r3, r0
	lsls r1, 16
	lsrs r7, r1, 16
	adds r0, r3, r0
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsrs r1, r2, 16
	str r5, [sp, 0x10]
	cmp r2, 0
	bge _0811DBDC
	movs r1, 0
_0811DBDC:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xF0
	ble _0811DBE6
	movs r6, 0xF0
_0811DBE6:
	lsls r0, r7, 16
	cmp r0, 0
	bge _0811DBEE
	movs r7, 0
_0811DBEE:
	mov r2, r8
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811DBFC
	movs r3, 0x9F
	mov r8, r3
_0811DBFC:
	lsls r0, r1, 24
	lsrs r0, 16
	orrs r6, r0
	lsls r0, r7, 16
	asrs r0, 16
	str r0, [sp, 0xC]
	lsls r0, 1
	add r0, r9
	strh r6, [r0]
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r4, 15
	add r0, r9
	strh r6, [r0]
	mov r0, r10
	adds r0, 0x1
	lsls r0, 16
	asrs r0, 16
	ldr r1, [sp, 0x4]
	bl Cos
	lsls r0, 16
	asrs r0, 16
	ldr r2, [sp, 0x8]
	subs r1, r2, r0
	lsls r1, 16
	adds r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsrs r3, r1, 16
	cmp r1, 0
	bge _0811DC3E
	movs r3, 0
_0811DC3E:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x9F
	ble _0811DC48
	movs r2, 0x9F
_0811DC48:
	lsls r0, r3, 16
	asrs r1, r0, 16
	adds r3, r0, 0
	lsls r5, r2, 16
	ldr r0, [sp, 0xC]
	cmp r0, r1
	ble _0811DC6C
	adds r2, r1, 0
_0811DC58:
	lsls r1, r7, 16
	ldr r0, _0811DCEC @ =0xffff0000
	adds r1, r0
	asrs r0, r1, 15
	add r0, r9
	strh r6, [r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r1, r2
	bgt _0811DC58
_0811DC6C:
	lsls r1, r7, 16
	asrs r0, r3, 16
	cmp r1, r3
	bge _0811DC8A
	adds r2, r0, 0
_0811DC76:
	movs r3, 0x80
	lsls r3, 9
	adds r0, r1, r3
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r1, r0, 0
	asrs r0, r1, 16
	cmp r0, r2
	blt _0811DC76
_0811DC8A:
	asrs r0, r5, 16
	cmp r4, r5
	ble _0811DCA8
	adds r1, r0, 0
_0811DC92:
	ldr r2, _0811DCEC @ =0xffff0000
	adds r0, r4, r2
	lsrs r3, r0, 16
	mov r8, r3
	asrs r0, 15
	add r0, r9
	strh r6, [r0]
	lsls r4, r3, 16
	asrs r0, r4, 16
	cmp r0, r1
	bgt _0811DC92
_0811DCA8:
	mov r0, r8
	lsls r4, r0, 16
	asrs r0, r5, 16
	cmp r4, r5
	bge _0811DCC8
	adds r2, r0, 0
_0811DCB4:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	asrs r1, r0, 15
	add r1, r9
	strh r6, [r1]
	adds r4, r0, 0
	asrs r0, r4, 16
	cmp r0, r2
	blt _0811DCB4
_0811DCC8:
	ldr r2, [sp, 0x10]
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x3F
	bgt _0811DCDA
	b _0811DB90
_0811DCDA:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0811DCEC: .4byte 0xffff0000
	thumb_func_end sub_811D764

	thumb_func_start sub_811D8FC
sub_811D8FC: @ 811DCF0
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r4, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	lsrs r0, 16
	adds r7, r0, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r4, 16
	lsrs r4, 16
	strh r1, [r6]
	strh r2, [r6, 0x2]
	strh r1, [r6, 0x4]
	strh r2, [r6, 0x6]
	strh r3, [r6, 0x8]
	strh r7, [r6, 0xA]
	strh r5, [r6, 0xC]
	strh r4, [r6, 0xE]
	lsls r3, 16
	asrs r3, 16
	lsls r1, 16
	asrs r1, 16
	subs r3, r1
	strh r3, [r6, 0x10]
	lsls r0, r3, 16
	cmp r0, 0
	bge _0811DD42
	negs r0, r3
	strh r0, [r6, 0x10]
	lsls r0, r5, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xC]
_0811DD42:
	lsls r0, r7, 16
	asrs r0, 16
	lsls r1, r2, 16
	asrs r1, 16
	subs r1, r0, r1
	strh r1, [r6, 0x12]
	lsls r0, r1, 16
	cmp r0, 0
	bge _0811DD60
	negs r0, r1
	strh r0, [r6, 0x12]
	lsls r0, r4, 16
	asrs r0, 16
	negs r0, r0
	strh r0, [r6, 0xE]
_0811DD60:
	movs r0, 0
	strh r0, [r6, 0x14]
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_811D8FC

	thumb_func_start sub_811D978
sub_811D978: @ 811DD6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	ldrh r0, [r3, 0x10]
	mov r8, r0
	movs r1, 0x10
	ldrsh r6, [r3, r1]
	ldrh r2, [r3, 0x12]
	mov r12, r2
	movs r4, 0x12
	ldrsh r5, [r3, r4]
	cmp r6, r5
	ble _0811DDBC
	ldrh r0, [r3, 0xC]
	ldrh r2, [r3, 0x4]
	adds r1, r0, r2
	strh r1, [r3, 0x4]
	ldrh r2, [r3, 0x14]
	add r2, r12
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	adds r4, r0, 0
	ldrh r7, [r3, 0xE]
	cmp r1, r6
	ble _0811DDE2
	ldrh r1, [r3, 0x6]
	adds r0, r7, r1
	strh r0, [r3, 0x6]
	mov r1, r8
	b _0811DDDE
_0811DDBC:
	ldrh r0, [r3, 0xE]
	ldrh r2, [r3, 0x6]
	adds r1, r0, r2
	strh r1, [r3, 0x6]
	ldrh r2, [r3, 0x14]
	add r2, r8
	strh r2, [r3, 0x14]
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r4, [r3, 0xC]
	adds r7, r0, 0
	cmp r1, r5
	ble _0811DDE2
	ldrh r1, [r3, 0x4]
	adds r0, r4, r1
	strh r0, [r3, 0x4]
	mov r1, r12
_0811DDDE:
	subs r0, r2, r1
	strh r0, [r3, 0x14]
_0811DDE2:
	movs r5, 0
	lsls r0, r4, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _0811DDFA
	movs r4, 0x4
	ldrsh r1, [r3, r4]
	movs r4, 0x8
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bge _0811DE0C
_0811DDFA:
	cmp r2, 0
	bge _0811DE1A
	movs r0, 0x4
	ldrsh r1, [r3, r0]
	movs r2, 0x8
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0x8]
	cmp r1, r0
	bgt _0811DE1A
_0811DE0C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	cmp r0, 0
	beq _0811DE1A
	strh r4, [r3, 0x4]
_0811DE1A:
	lsls r0, r7, 16
	asrs r2, r0, 16
	cmp r2, 0
	ble _0811DE30
	movs r4, 0x6
	ldrsh r1, [r3, r4]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bge _0811DE42
_0811DE30:
	cmp r2, 0
	bge _0811DE50
	movs r0, 0x6
	ldrsh r1, [r3, r0]
	movs r2, 0xA
	ldrsh r0, [r3, r2]
	ldrh r4, [r3, 0xA]
	cmp r1, r0
	bgt _0811DE50
_0811DE42:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r10
	cmp r0, 0
	beq _0811DE50
	strh r4, [r3, 0x6]
_0811DE50:
	cmp r5, 0x2
	beq _0811DE58
	movs r0, 0
	b _0811DE5A
_0811DE58:
	movs r0, 0x1
_0811DE5A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_811D978

	.align 2, 0 @ Don't pad with nop.
