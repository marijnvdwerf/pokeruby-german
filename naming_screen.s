	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start DoNamingScreen
DoNamingScreen: @ 80B5B74
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x14]
	ldr r5, [sp, 0x18]
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 16
	lsrs r3, 16
	str r4, [sp]
	str r5, [sp, 0x4]
	bl AddNamingScreenTask
	ldr r0, _080B5BA0
	bl SetMainCallback2
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5BA0: .4byte C2_NamingScreen
	thumb_func_end DoNamingScreen

	thumb_func_start C2_NamingScreen
C2_NamingScreen: @ 80B5BA4
	push {lr}
	ldr r0, _080B5BBC
	ldr r1, _080B5BC0
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x7
	bhi _080B5C3E
	lsls r0, 2
	ldr r1, _080B5BC4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B5BBC: .4byte gMain
_080B5BC0: .4byte 0x0000043c
_080B5BC4: .4byte _080B5BC8
	.align 2, 0
_080B5BC8:
	.4byte _080B5BE8
	.4byte _080B5BF2
	.4byte _080B5BF8
	.4byte _080B5BFE
	.4byte _080B5C04
	.4byte _080B5C0A
	.4byte _080B5C10
	.4byte _080B5C2C
_080B5BE8:
	bl NamingScreen_TurnOffScreen
	bl NamingScreen_Init
	b _080B5C14
_080B5BF2:
	bl NamingScreen_ClearVram
	b _080B5C14
_080B5BF8:
	bl NamingScreen_ClearOam
	b _080B5C14
_080B5BFE:
	bl NamingScreen_SetUpVideoRegs
	b _080B5C14
_080B5C04:
	bl sub_80B5DC8
	b _080B5C14
_080B5C0A:
	bl NamingScreen_ResetObjects
	b _080B5C14
_080B5C10:
	bl sub_80B5DFC
_080B5C14:
	ldr r1, _080B5C24
	ldr r0, _080B5C28
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080B5C3E
	.align 2, 0
_080B5C24: .4byte gMain
_080B5C28: .4byte 0x0000043c
_080B5C2C:
	bl sub_80B5E20
	bl sub_80B5E3C
	bl sub_80B5C04
	ldr r0, _080B5C44
	bl SetMainCallback2
_080B5C3E:
	pop {r0}
	bx r0
	.align 2, 0
_080B5C44: .4byte sub_80B5AA0
	thumb_func_end C2_NamingScreen

	thumb_func_start sub_80B5AA0
sub_80B5AA0: @ 80B5C48
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80B5AA0

	thumb_func_start sub_80B5AB8
sub_80B5AB8: @ 80B5C60
	push {r4,lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _080B5CA8
	ldr r4, _080B5CAC
	ldrh r0, [r4, 0x4]
	strh r0, [r1]
	adds r1, 0x4
	ldrh r0, [r4, 0x6]
	strh r0, [r1]
	ldr r2, _080B5CB0
	ldrh r1, [r2]
	ldr r3, _080B5CB4
	adds r0, r3, 0
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	ldrh r1, [r4, 0x8]
	orrs r0, r1
	strh r0, [r2]
	adds r2, 0x2
	ldrh r0, [r2]
	ands r3, r0
	strh r3, [r2]
	ldrh r0, [r2]
	ldrh r1, [r4, 0xA]
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5CA8: .4byte 0x04000016
_080B5CAC: .4byte 0x02000000
_080B5CB0: .4byte 0x0400000a
_080B5CB4: .4byte 0x0000fffc
	thumb_func_end sub_80B5AB8

	thumb_func_start AddNamingScreenTask
AddNamingScreenTask: @ 80B5CB8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r0
	mov r9, r1
	adds r5, r2, 0
	adds r6, r3, 0
	ldr r7, [sp, 0x1C]
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r5, 16
	lsrs r5, 16
	lsls r6, 16
	lsrs r6, 16
	ldr r0, _080B5D1C
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _080B5D20
	adds r4, r0
	mov r0, r8
	strh r0, [r4, 0x8]
	strh r5, [r4, 0xA]
	strh r6, [r4, 0xC]
	lsrs r0, r7, 16
	strh r0, [r4, 0xE]
	strh r7, [r4, 0x10]
	adds r0, r4, 0
	adds r0, 0x12
	mov r1, r9
	bl StoreWordInTwoHalfwords
	adds r4, 0x16
	adds r0, r4, 0
	ldr r1, [sp, 0x20]
	bl StoreWordInTwoHalfwords
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D1C: .4byte NamingScreenDummyTask
_080B5D20: .4byte gTasks
	thumb_func_end AddNamingScreenTask

	thumb_func_start GetNamingScreenParameters
GetNamingScreenParameters: @ 80B5D24
	push {r4-r6,lr}
	ldr r0, _080B5D80
	bl FindTaskIdByFunc
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080B5D84
	adds r4, r0
	ldr r6, _080B5D88
	ldrh r0, [r4, 0x8]
	strb r0, [r6, 0x1]
	ldrh r0, [r4, 0xA]
	strh r0, [r6, 0x3E]
	ldrh r1, [r4, 0xC]
	adds r0, r6, 0
	adds r0, 0x40
	strh r1, [r0]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	lsls r0, 16
	ldrh r1, [r4, 0x10]
	orrs r0, r1
	str r0, [r6, 0x44]
	adds r0, r4, 0
	adds r0, 0x12
	adds r1, r6, 0
	adds r1, 0x38
	bl LoadWordFromTwoHalfwords
	adds r4, 0x16
	adds r1, r6, 0
	adds r1, 0x48
	adds r0, r4, 0
	bl LoadWordFromTwoHalfwords
	adds r0, r5, 0
	bl DestroyTask
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5D80: .4byte NamingScreenDummyTask
_080B5D84: .4byte gTasks
_080B5D88: .4byte 0x02000000
	thumb_func_end GetNamingScreenParameters

	thumb_func_start NamingScreenDummyTask
NamingScreenDummyTask: @ 80B5D8C
	bx lr
	thumb_func_end NamingScreenDummyTask

	thumb_func_start NamingScreen_TurnOffScreen
NamingScreen_TurnOffScreen: @ 80B5D90
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	thumb_func_end NamingScreen_TurnOffScreen

	thumb_func_start sub_80B5C04
sub_80B5C04: @ 80B5DAC
	push {r4,lr}
	ldr r0, _080B5DE4
	bl SetVBlankCallback
	ldr r3, _080B5DE8
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _080B5DEC
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _080B5DF0
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DE4: .4byte sub_80B5AB8
_080B5DE8: .4byte 0x04000208
_080B5DEC: .4byte 0x04000200
_080B5DF0: .4byte 0x04000004
	thumb_func_end sub_80B5C04

	thumb_func_start NamingScreen_ClearVram
NamingScreen_ClearVram: @ 80B5DF4
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	ldr r1, _080B5E40
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _080B5E44
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_080B5E12:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _080B5E12
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5E40: .4byte 0x040000d4
_080B5E44: .4byte 0x81000800
	thumb_func_end NamingScreen_ClearVram

	thumb_func_start NamingScreen_ClearOam
NamingScreen_ClearOam: @ 80B5E48
	sub sp, 0x4
	movs r2, 0xE0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _080B5E64
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080B5E68
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_080B5E64: .4byte 0x040000d4
_080B5E68: .4byte 0x81000200
	thumb_func_end NamingScreen_ClearOam

	thumb_func_start NamingScreen_SetUpVideoRegs
NamingScreen_SetUpVideoRegs: @ 80B5E6C
	push {r4,r5,lr}
	ldr r5, _080B5ED4
	movs r1, 0
	strh r1, [r5]
	ldr r2, _080B5ED8
	strh r1, [r2]
	ldr r3, _080B5EDC
	strh r1, [r3]
	ldr r4, _080B5EE0
	strh r1, [r4]
	ldr r0, _080B5EE4
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
	movs r1, 0xF8
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r5]
	ldr r1, _080B5EE8
	adds r0, r1, 0
	strh r0, [r2]
	ldr r2, _080B5EEC
	adds r0, r2, 0
	strh r0, [r3]
	ldr r1, _080B5EF0
	adds r0, r1, 0
	strh r0, [r4]
	ldr r1, _080B5EF4
	movs r2, 0xC8
	lsls r2, 3
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080B5EF8
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5ED4: .4byte 0x04000008
_080B5ED8: .4byte 0x0400000a
_080B5EDC: .4byte 0x0400000c
_080B5EE0: .4byte 0x0400000e
_080B5EE4: .4byte 0x04000010
_080B5EE8: .4byte 0x00001c01
_080B5EEC: .4byte 0x00001d0a
_080B5EF0: .4byte 0x00001e03
_080B5EF4: .4byte 0x04000050
_080B5EF8: .4byte 0x0000080c
	thumb_func_end NamingScreen_SetUpVideoRegs

	thumb_func_start NamingScreen_Init
NamingScreen_Init: @ 80B5EFC
	push {r4-r6,lr}
	bl GetNamingScreenParameters
	ldr r4, _080B5F64
	movs r0, 0
	strb r0, [r4]
	movs r2, 0
	strh r0, [r4, 0x4]
	strh r0, [r4, 0x6]
	movs r1, 0x1
	movs r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x2
	strh r0, [r4, 0xA]
	strb r2, [r4, 0xC]
	strb r1, [r4, 0xD]
	ldr r1, _080B5F68
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	str r0, [r4, 0x34]
	ldrb r1, [r0, 0x4]
	strb r1, [r4, 0xE]
	ldrb r1, [r0, 0x1]
	lsrs r1, 1
	movs r0, 0xE
	subs r0, r1
	strh r0, [r4, 0x2]
	ldr r6, _080B5F6C
	ldrh r0, [r6]
	strh r0, [r4, 0x3C]
	adds r5, r4, 0
	adds r5, 0x11
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x10
	bl memset
	ldr r0, [r4, 0x34]
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B5F5A
	ldr r1, [r4, 0x38]
	adds r0, r5, 0
	bl StringCopy
_080B5F5A:
	movs r0, 0x10
	strh r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5F64: .4byte 0x02000000
_080B5F68: .4byte gUnknown_083CE398
_080B5F6C: .4byte gKeyRepeatStartDelay
	thumb_func_end NamingScreen_Init

	thumb_func_start sub_80B5DC8
sub_80B5DC8: @ 80B5F70
	push {r4,lr}
	ldr r4, _080B5F88
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5F88: .4byte gWindowConfig_81E6E88
	thumb_func_end sub_80B5DC8

	thumb_func_start NamingScreen_ResetObjects
NamingScreen_ResetObjects: @ 80B5F8C
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	pop {r0}
	bx r0
	thumb_func_end NamingScreen_ResetObjects

	thumb_func_start sub_80B5DFC
sub_80B5DFC: @ 80B5FA4
	push {lr}
	bl sub_80B7558
	bl sub_80B753C
	bl sub_80B7680
	bl sub_80B75C4
	bl sub_80B7794
	bl sub_80B78A8
	bl sub_80B7960
	pop {r0}
	bx r0
	thumb_func_end sub_80B5DFC

	thumb_func_start sub_80B5E20
sub_80B5E20: @ 80B5FC8
	push {lr}
	bl sub_80B6774
	bl sub_80B6A80
	bl sub_80B6CA8
	bl sub_80B6D04
	bl sub_80B6E44
	pop {r0}
	bx r0
	thumb_func_end sub_80B5E20

	thumb_func_start sub_80B5E3C
sub_80B5E3C: @ 80B5FE4
	push {lr}
	bl sub_80B61D8
	bl sub_80B6438
	bl sub_80B5E50
	pop {r0}
	bx r0
	thumb_func_end sub_80B5E3C

	thumb_func_start sub_80B5E50
sub_80B5E50: @ 80B5FF8
	push {r4,lr}
	ldr r4, _080B6014
	adds r0, r4, 0
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6014: .4byte sub_80B5E70
	thumb_func_end sub_80B5E50

	thumb_func_start sub_80B5E70
sub_80B5E70: @ 80B6018
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _080B6044
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r6, _080B6048
	ldr r5, _080B604C
_080B602A:
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r4, r5
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B602A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6044: .4byte gUnknown_083CE218
_080B6048: .4byte 0x02000000
_080B604C: .4byte gTasks
	thumb_func_end sub_80B5E70

	thumb_func_start sub_80B5EA8
sub_80B5EA8: @ 80B6050
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r1, _080B6074
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080B6074: .4byte 0x02000000
	thumb_func_end sub_80B5EA8

	thumb_func_start sub_80B5ED0
sub_80B5ED0: @ 80B6078
	push {lr}
	ldr r0, _080B60A0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B609A
	movs r0, 0x1
	bl sub_80B6210
	movs r0, 0x1
	bl sub_80B68D8
	ldr r1, _080B60A4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080B609A:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B60A0: .4byte gPaletteFade
_080B60A4: .4byte 0x02000000
	thumb_func_end sub_80B5ED0

	thumb_func_start sub_80B5F00
sub_80B5F00: @ 80B60A8
	push {lr}
	bl sub_80B60B8
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80B5F00

	thumb_func_start sub_80B5F10
sub_80B5F10: @ 80B60B8
	push {lr}
	bl sub_80B6938
	lsls r0, 24
	cmp r0, 0
	beq _080B60D4
	movs r0, 0x1
	bl sub_80B6210
	bl sub_80B6878
	ldr r1, _080B60DC
	movs r0, 0x2
	strb r0, [r1]
_080B60D4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B60DC: .4byte 0x02000000
	thumb_func_end sub_80B5F10

	thumb_func_start sub_80B5F38
sub_80B5F38: @ 80B60E0
	push {lr}
	movs r0, 0
	bl sub_80B6210
	bl sub_80B6B14
	bl sub_80B65F0
	movs r0, 0x1
	bl sub_80B6888
	movs r0, 0
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
	movs r0, 0x6
	bl PlaySE
	ldr r1, _080B6114
	movs r0, 0x5
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6114: .4byte 0x02000000
	thumb_func_end sub_80B5F38

	thumb_func_start sub_80B5F70
sub_80B5F70: @ 80B6118
	push {r4,r5,lr}
	sub sp, 0x4
	bl sub_80B6610
	lsls r0, 24
	cmp r0, 0
	beq _080B6184
	ldr r4, _080B6190
	movs r0, 0x2
	strb r0, [r4]
	ldrb r0, [r4, 0xE]
	adds r0, 0x1
	strb r0, [r4, 0xE]
	ldrb r0, [r4, 0xE]
	movs r1, 0x3
	bl __umodsi3
	strb r0, [r4, 0xE]
	bl sub_80B7614
	bl sub_80B77F8
	movs r0, 0x1
	bl sub_80B6210
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl sub_80B6858
	ldrb r0, [r4, 0xE]
	cmp r0, 0x2
	bne _080B6170
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080B6170
	mov r1, sp
	movs r0, 0x6
	strh r0, [r1]
_080B6170:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80B680C
	movs r0, 0
	bl sub_80B6888
_080B6184:
	movs r0, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6190: .4byte 0x02000000
	thumb_func_end sub_80B5F70

	thumb_func_start pokemon_store
pokemon_store: @ 80B6194
	push {r4,lr}
	bl sub_80B74B0
	movs r0, 0
	bl sub_80B6210
	movs r0, 0
	bl sub_80B68D8
	movs r0, 0x3
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
	ldr r0, _080B61D8
	ldr r4, _080B61DC
	ldrh r1, [r4, 0x3C]
	strh r1, [r0]
	ldrb r0, [r4, 0x1]
	cmp r0, 0x2
	bne _080B61E0
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _080B61E0
	bl sub_80B74FC
	movs r0, 0x7
	strb r0, [r4]
	movs r0, 0
	b _080B61E8
	.align 2, 0
_080B61D8: .4byte gKeyRepeatStartDelay
_080B61DC: .4byte 0x02000000
_080B61E0:
	ldr r1, _080B61F0
	movs r0, 0x8
	strb r0, [r1]
	movs r0, 0x1
_080B61E8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B61F0: .4byte 0x02000000
	thumb_func_end pokemon_store

	thumb_func_start sub_80B604C
sub_80B604C: @ 80B61F4
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _080B6208
	ldr r1, _080B6210
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_080B6208:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6210: .4byte 0x02000000
	thumb_func_end sub_80B604C

	thumb_func_start sub_80B606C
sub_80B606C: @ 80B6214
	push {lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080B6238
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	add sp, 0x4
	pop {r1}
	bx r1
	.align 2, 0
_080B6238: .4byte 0x02000000
	thumb_func_end sub_80B606C

	thumb_func_start sub_80B6094
sub_80B6094: @ 80B623C
	push {lr}
	ldr r0, _080B6258
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B6252
	ldr r0, _080B625C
	ldr r0, [r0, 0x48]
	bl SetMainCallback2
_080B6252:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6258: .4byte gPaletteFade
_080B625C: .4byte 0x02000000
	thumb_func_end sub_80B6094

	thumb_func_start sub_80B60B8
sub_80B60B8: @ 80B6260
	push {r4,r5,lr}
	bl sub_80B61EC
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_80B6958
	lsls r0, 24
	lsrs r0, 24
	cmp r4, 0x8
	bne _080B627E
	bl sub_80B61C8
	b _080B629A
_080B627E:
	cmp r4, 0x6
	bne _080B6288
	bl sub_80B6FBC
	b _080B62A8
_080B6288:
	cmp r5, 0x7
	beq _080B62A4
	ldr r1, _080B62A0
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
_080B629A:
	lsls r0, 24
	lsrs r0, 24
	b _080B62AA
	.align 2, 0
_080B62A0: .4byte gUnknown_083CE240
_080B62A4:
	bl sub_80B7090
_080B62A8:
	movs r0, 0
_080B62AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B60B8

	thumb_func_start sub_80B6108
sub_80B6108: @ 80B62B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x3
	movs r1, 0
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	bne _080B62E4
	bl sub_80B7004
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B6914
	cmp r4, 0
	beq _080B62E4
	movs r0, 0
	bl sub_80B6210
	ldr r1, _080B62EC
	movs r0, 0x3
	strb r0, [r1]
_080B62E4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B62EC: .4byte 0x02000000
	thumb_func_end sub_80B6108

	thumb_func_start sub_80B6148
sub_80B6148: @ 80B62F0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	beq _080B630A
	movs r0, 0
	b _080B6312
_080B630A:
	bl sub_80B61C8
	lsls r0, 24
	lsrs r0, 24
_080B6312:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6148

	thumb_func_start sub_80B6170
sub_80B6170: @ 80B6318
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	bne _080B6332
	bl sub_80B6FBC
_080B6332:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6170

	thumb_func_start sub_80B6194
sub_80B6194: @ 80B633C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0
	bl sub_80B6460
	cmp r4, 0x5
	beq _080B6356
	movs r0, 0
	b _080B6364
_080B6356:
	movs r0, 0x5
	bl PlaySE
	ldr r1, _080B636C
	movs r0, 0x6
	strb r0, [r1]
	movs r0, 0x1
_080B6364:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B636C: .4byte 0x02000000
	thumb_func_end sub_80B6194

	thumb_func_start sub_80B61C8
sub_80B61C8: @ 80B6370
	ldr r1, _080B637C
	movs r0, 0x4
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	.align 2, 0
_080B637C: .4byte 0x02000000
	thumb_func_end sub_80B61C8

	thumb_func_start sub_80B61D8
sub_80B61D8: @ 80B6380
	push {lr}
	ldr r0, _080B6390
	movs r1, 0x1
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B6390: .4byte sub_80B623C
	thumb_func_end sub_80B61D8

	thumb_func_start sub_80B61EC
sub_80B61EC: @ 80B6394
	push {lr}
	ldr r0, _080B63B0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B63B4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrb r0, [r1, 0xA]
	pop {r1}
	bx r1
	.align 2, 0
_080B63B0: .4byte sub_80B623C
_080B63B4: .4byte gTasks
	thumb_func_end sub_80B61EC

	thumb_func_start sub_80B6210
sub_80B6210: @ 80B63B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B63DC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B63E0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B63DC: .4byte sub_80B623C
_080B63E0: .4byte gTasks
	thumb_func_end sub_80B6210

	thumb_func_start sub_80B623C
sub_80B623C: @ 80B63E4
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _080B640C
	ldr r2, _080B6410
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080B640C: .4byte gUnknown_083CE250
_080B6410: .4byte gTasks
	thumb_func_end sub_80B623C

	thumb_func_start sub_80B626C
sub_80B626C: @ 80B6414
	movs r1, 0
	strh r1, [r0, 0xA]
	bx lr
	thumb_func_end sub_80B626C

	thumb_func_start sub_80B6274
sub_80B6274: @ 80B641C
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2, 0xA]
	ldr r0, _080B6438
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B643C
	movs r0, 0x5
	strh r0, [r2, 0xA]
	b _080B6470
	.align 2, 0
_080B6438: .4byte gMain
_080B643C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B644A
	movs r0, 0x6
	strh r0, [r2, 0xA]
	b _080B6470
_080B644A:
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B6458
	movs r0, 0x8
	strh r0, [r2, 0xA]
	b _080B6470
_080B6458:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080B646A
	movs r0, 0x9
	strh r0, [r2, 0xA]
	bl sub_80B6878
	b _080B6470
_080B646A:
	adds r0, r2, 0
	bl sub_80B62CC
_080B6470:
	pop {r0}
	bx r0
	thumb_func_end sub_80B6274

	thumb_func_start sub_80B62CC
sub_80B62CC: @ 80B6474
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80B6858
	ldr r0, _080B651C
	ldrh r2, [r0, 0x30]
	movs r0, 0x40
	ands r0, r2
	lsls r0, 16
	lsrs r0, 16
	negs r0, r0
	lsrs r1, r0, 31
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080B64A0
	movs r1, 0x2
_080B64A0:
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080B64AA
	movs r1, 0x3
_080B64AA:
	movs r0, 0x10
	ands r0, r2
	cmp r0, 0
	beq _080B64B4
	movs r1, 0x4
_080B64B4:
	mov r0, sp
	ldrh r6, [r0]
	mov r2, sp
	ldr r0, _080B6520
	lsls r1, 1
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r0, r6, r3
	strh r0, [r2]
	ldr r0, _080B6524
	adds r1, r0
	ldrh r0, [r1]
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _080B64E2
	mov r1, sp
	movs r0, 0x9
	strh r0, [r1]
_080B64E2:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x9
	ble _080B64F2
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
_080B64F2:
	lsls r0, r3, 16
	asrs r1, r0, 16
	cmp r1, 0
	beq _080B6572
	ldr r0, _080B6528
	ldrb r0, [r0, 0xE]
	cmp r0, 0x2
	bne _080B6532
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _080B6532
	cmp r1, 0
	ble _080B652C
	mov r1, sp
	movs r0, 0x9
	b _080B6530
	.align 2, 0
_080B651C: .4byte gMain
_080B6520: .4byte gUnknown_083CE258
_080B6524: .4byte gUnknown_083CE262
_080B6528: .4byte 0x02000000
_080B652C:
	mov r1, sp
	movs r0, 0x5
_080B6530:
	strh r0, [r1]
_080B6532:
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0x9
	bne _080B6554
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	ldr r1, _080B6550
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	b _080B6570
	.align 2, 0
_080B6550: .4byte gUnknown_083CE26C
_080B6554:
	cmp r6, 0x9
	bne _080B6572
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	bne _080B6564
	ldrh r0, [r5, 0xC]
	b _080B6570
_080B6564:
	ldr r0, _080B65A4
	movs r2, 0
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
_080B6570:
	strh r0, [r4]
_080B6572:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x9
	bne _080B65B0
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _080B6588
	movs r0, 0x2
	strh r0, [r4]
_080B6588:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	ble _080B6594
	movs r0, 0
	strh r0, [r4]
_080B6594:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B65A8
	movs r0, 0x1
	strh r0, [r5, 0xC]
	b _080B65C8
	.align 2, 0
_080B65A4: .4byte gUnknown_083CE274
_080B65A8:
	cmp r0, 0x2
	bne _080B65C8
	strh r0, [r5, 0xC]
	b _080B65C8
_080B65B0:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bge _080B65BC
	movs r0, 0x3
	strh r0, [r4]
_080B65BC:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	ble _080B65C8
	movs r0, 0
	strh r0, [r4]
_080B65C8:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl sub_80B680C
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B62CC

	thumb_func_start sub_80B6438
sub_80B6438: @ 80B65E0
	push {lr}
	ldr r0, _080B6600
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B6604
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x3
	strh r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_080B6600: .4byte sub_80B64D4
_080B6604: .4byte gTasks
	thumb_func_end sub_80B6438

	thumb_func_start sub_80B6460
sub_80B6460: @ 80B6608
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _080B6640
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B6644
	adds r4, r1, r0
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r5, r0
	bne _080B6648
	cmp r6, 0
	bne _080B6648
	strh r7, [r4, 0xA]
	movs r0, 0x1
	strh r0, [r4, 0xC]
	b _080B6674
	.align 2, 0
_080B6640: .4byte sub_80B64D4
_080B6644: .4byte gTasks
_080B6648:
	cmp r5, 0x3
	bne _080B6658
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _080B6658
	cmp r6, 0
	beq _080B6674
_080B6658:
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	beq _080B666A
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80B65AC
_080B666A:
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl sub_80B65D4
_080B6674:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B6460

	thumb_func_start sub_80B64D4
sub_80B64D4: @ 80B667C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080B66F0
	adds r4, r1, r0
	ldrh r1, [r4, 0x8]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	cmp r0, 0x3
	beq _080B66E8
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B66E8
	lsls r0, r1, 24
	lsrs r0, 24
	bl sub_80B654C
	lsls r0, 16
	lsrs r0, 16
	ldrb r3, [r4, 0xE]
	adds r1, r3, 0
	adds r2, r3, 0
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r1, [r4, 0x12]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B66C8
	subs r0, r1, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	cmp r0, 0
	bne _080B66E8
_080B66C8:
	movs r0, 0x2
	strh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	ldrh r2, [r4, 0xE]
	adds r0, r1, r2
	strh r0, [r4, 0xE]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080B66E4
	cmp r0, 0
	bne _080B66E8
	ldrh r0, [r4, 0xA]
	strh r0, [r4, 0xC]
_080B66E4:
	negs r0, r1
	strh r0, [r4, 0x10]
_080B66E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B66F0: .4byte gTasks
	thumb_func_end sub_80B64D4

	thumb_func_start sub_80B654C
sub_80B654C: @ 80B66F4
	push {r4-r6,lr}
	sub sp, 0x10
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x4
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x87
	lsls r1, 1
	adds r5, r1, 0
	adds r0, r5
	add r6, sp, 0x8
	strh r0, [r6]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	movs r1, 0x86
	lsls r1, 1
	adds r0, r1
	mov r1, sp
	adds r1, 0xA
	strh r0, [r1]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 20
	adds r0, r5
	add r1, sp, 0xC
	strh r0, [r1]
	mov r0, sp
	adds r1, r6, 0
	movs r2, 0x6
	bl memcpy
	lsls r4, 1
	mov r1, sp
	adds r0, r1, r4
	ldrh r0, [r0]
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80B654C

	thumb_func_start sub_80B65AC
sub_80B65AC: @ 80B6754
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80B654C
	lsls r0, 16
	ldr r2, _080B6774
	lsrs r0, 15
	adds r2, r0, r2
	ldr r1, _080B6778
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080B6774: .4byte gPlttBufferFaded
_080B6778: .4byte gPlttBufferUnfaded
	thumb_func_end sub_80B65AC

	thumb_func_start sub_80B65D4
sub_80B65D4: @ 80B677C
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	movs r2, 0x1
	strh r2, [r0, 0xC]
	movs r1, 0xF
	strh r1, [r0, 0xE]
	strh r2, [r0, 0x10]
	strh r3, [r0, 0x12]
	bx lr
	thumb_func_end sub_80B65D4

	thumb_func_start sub_80B65F0
sub_80B65F0: @ 80B6798
	push {r4,lr}
	ldr r4, _080B67B4
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B67B4: .4byte sub_80B6630
	thumb_func_end sub_80B65F0

	thumb_func_start sub_80B6610
sub_80B6610: @ 80B67B8
	push {lr}
	ldr r0, _080B67CC
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _080B67D0
	movs r0, 0
	b _080B67D2
	.align 2, 0
_080B67CC: .4byte sub_80B6630
_080B67D0:
	movs r0, 0x1
_080B67D2:
	pop {r1}
	bx r1
	thumb_func_end sub_80B6610

	thumb_func_start sub_80B6630
sub_80B6630: @ 80B67D8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080B6808
	ldr r2, _080B680C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_080B67EA:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B67EA
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6808: .4byte gUnknown_083CE27C
_080B680C: .4byte gTasks
	thumb_func_end sub_80B6630

	thumb_func_start sub_80B6668
sub_80B6668: @ 80B6810
	ldr r2, _080B6824
	movs r1, 0
	strh r1, [r2, 0x4]
	strh r1, [r2, 0x6]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	movs r0, 0
	bx lr
	.align 2, 0
_080B6824: .4byte 0x02000000
	thumb_func_end sub_80B6668

	thumb_func_start sub_80B6680
sub_80B6680: @ 80B6828
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _080B688C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl Sin
	ldr r5, _080B6890
	ldrb r1, [r5, 0xC]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, 0xA]
	adds r0, 0x80
	movs r1, 0xFF
	ands r0, r1
	movs r1, 0x28
	bl Sin
	ldrb r1, [r5, 0xD]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x3F
	ble _080B6882
	ldrb r1, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B6882:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B688C: .4byte gUnknown_083CE28C
_080B6890: .4byte 0x02000000
	thumb_func_end sub_80B6680

	thumb_func_start sub_80B66EC
sub_80B66EC: @ 80B6894
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r0, _080B68F8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldrh r0, [r4, 0xA]
	adds r0, 0x4
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r1, 0x28
	bl Sin
	ldr r5, _080B68FC
	ldrb r1, [r5, 0xC]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	ldrh r0, [r4, 0xA]
	adds r0, 0x80
	movs r1, 0xFF
	ands r0, r1
	movs r1, 0x28
	bl Sin
	ldrb r1, [r5, 0xD]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	strh r0, [r1]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0x7F
	ble _080B68EE
	ldrb r1, [r5, 0xC]
	ldrb r0, [r5, 0xD]
	strb r0, [r5, 0xC]
	strb r1, [r5, 0xD]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_080B68EE:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B68F8: .4byte gUnknown_083CE28C
_080B68FC: .4byte 0x02000000
	thumb_func_end sub_80B66EC

	thumb_func_start sub_80B6758
sub_80B6758: @ 80B6900
	push {lr}
	ldr r0, _080B6918
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B6918: .4byte sub_80B6630
	thumb_func_end sub_80B6758

	thumb_func_start sub_80B6774
sub_80B6774: @ 80B691C
	push {r4,r5,lr}
	ldr r0, _080B6988
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	ldr r4, _080B698C
	strb r0, [r4, 0xF]
	ldr r5, _080B6990
	ldrb r0, [r4, 0xF]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r3
	movs r3, 0x4
	orrs r0, r3
	strb r0, [r1, 0x5]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r1, [r0, 0x1]
	ands r2, r1
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x1
	strh r1, [r0, 0x3A]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x2
	strh r1, [r0, 0x3A]
	movs r0, 0
	movs r1, 0
	bl sub_80B680C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6988: .4byte gSpriteTemplate_83CE640
_080B698C: .4byte 0x02000000
_080B6990: .4byte gSprites
	thumb_func_end sub_80B6774

	thumb_func_start sub_80B67EC
sub_80B67EC: @ 80B6994
	ldr r3, _080B69AC
	lsls r0, 16
	asrs r0, 16
	ldr r1, _080B69B0
	ldrb r2, [r1, 0xE]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 1
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B69AC: .4byte gUnknown_083CE294
_080B69B0: .4byte 0x02000000
	thumb_func_end sub_80B67EC

	thumb_func_start sub_80B680C
sub_80B680C: @ 80B69B4
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r1, _080B69F8
	ldrb r1, [r1, 0xF]
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r1, _080B69FC
	adds r4, r1
	lsrs r6, r0, 16
	asrs r0, 16
	bl sub_80B67EC
	lsls r0, 24
	lsrs r0, 21
	adds r0, 0x1B
	strh r0, [r4, 0x20]
	lsls r0, r5, 16
	asrs r0, 12
	adds r0, 0x50
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x2E]
	strh r0, [r4, 0x32]
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x34]
	strh r6, [r4, 0x2E]
	strh r5, [r4, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B69F8: .4byte 0x02000000
_080B69FC: .4byte gSprites
	thumb_func_end sub_80B680C

	thumb_func_start sub_80B6858
sub_80B6858: @ 80B6A00
	ldr r2, _080B6A18
	ldrb r3, [r2, 0xF]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _080B6A1C
	adds r2, r3
	ldrh r3, [r2, 0x2E]
	strh r3, [r0]
	ldrh r0, [r2, 0x30]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080B6A18: .4byte 0x02000000
_080B6A1C: .4byte gSprites
	thumb_func_end sub_80B6858

	thumb_func_start sub_80B6878
sub_80B6878: @ 80B6A20
	push {lr}
	movs r0, 0x9
	movs r1, 0x2
	bl sub_80B680C
	pop {r0}
	bx r0
	thumb_func_end sub_80B6878

	thumb_func_start sub_80B6888
sub_80B6888: @ 80B6A30
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _080B6A74
	ldr r4, _080B6A78
	ldrb r1, [r4, 0xF]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	ldr r1, _080B6A7C
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4, 0xF]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	ldrb r1, [r4, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6A74: .4byte gSprites
_080B6A78: .4byte 0x02000000
_080B6A7C: .4byte 0xffffff00
	thumb_func_end sub_80B6888

	thumb_func_start sub_80B68D8
sub_80B68D8: @ 80B6A80
	push {r4,r5,lr}
	lsls r0, 24
	ldr r5, _080B6AB4
	ldr r4, _080B6AB8
	ldrb r1, [r4, 0xF]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	adds r2, r5
	ldrh r3, [r2, 0x36]
	movs r1, 0xFF
	ands r1, r3
	strh r1, [r2, 0x36]
	ldrb r2, [r4, 0xF]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	lsrs r0, 16
	ldrh r2, [r1, 0x36]
	orrs r0, r2
	strh r0, [r1, 0x36]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6AB4: .4byte gSprites
_080B6AB8: .4byte 0x02000000
	thumb_func_end sub_80B68D8

	thumb_func_start sub_80B6914
sub_80B6914: @ 80B6ABC
	push {lr}
	ldr r0, _080B6AD8
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6ADC
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	pop {r0}
	bx r0
	.align 2, 0
_080B6AD8: .4byte 0x02000000
_080B6ADC: .4byte gSprites
	thumb_func_end sub_80B6914

	thumb_func_start sub_80B6938
sub_80B6938: @ 80B6AE0
	ldr r2, _080B6AF8
	ldr r0, _080B6AFC
	ldrb r1, [r0, 0xF]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 27
	lsrs r0, 31
	bx lr
	.align 2, 0
_080B6AF8: .4byte gSprites
_080B6AFC: .4byte 0x02000000
	thumb_func_end sub_80B6938

	thumb_func_start sub_80B6958
sub_80B6958: @ 80B6B00
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r1, _080B6B30
	mov r0, sp
	movs r2, 0x3
	bl memcpy
	add r4, sp, 0x4
	mov r5, sp
	adds r5, 0x6
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B6858
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _080B6B34
	movs r1, 0
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r0, [r0]
	b _080B6B36
	.align 2, 0
_080B6B30: .4byte gUnknown_083CE2AF
_080B6B34:
	movs r0, 0
_080B6B36:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6958

	thumb_func_start sub_80B6998
sub_80B6998: @ 80B6B40
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B6B58
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_080B6B58:
	ldrh r1, [r4, 0x36]
	movs r0, 0xFF
	ands r0, r1
	adds r3, r4, 0
	adds r3, 0x3E
	movs r1, 0x1
	ands r0, r1
	lsls r0, 2
	ldrb r1, [r3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r3]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	bne _080B6B82
	movs r0, 0x4
	orrs r2, r0
	strb r2, [r3]
_080B6B82:
	ldrb r1, [r3]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080B6BB2
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6BB2
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	movs r2, 0x32
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B6BB2
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r1, r0
	beq _080B6BBE
_080B6BB2:
	movs r0, 0
	strh r0, [r4, 0x38]
	movs r0, 0x1
	strh r0, [r4, 0x3A]
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6BBE:
	ldrh r0, [r4, 0x3C]
	subs r0, 0x1
	strh r0, [r4, 0x3C]
	lsls r0, 16
	cmp r0, 0
	bne _080B6BE6
	ldrh r1, [r4, 0x3A]
	ldrh r2, [r4, 0x38]
	adds r0, r1, r2
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x10
	beq _080B6BDE
	cmp r0, 0
	bne _080B6BE2
_080B6BDE:
	negs r0, r1
	strh r0, [r4, 0x3A]
_080B6BE2:
	movs r0, 0x2
	strh r0, [r4, 0x3C]
_080B6BE6:
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	movs r1, 0xFF
	lsls r1, 8
	ands r0, r1
	cmp r0, 0
	beq _080B6C1C
	ldrh r4, [r4, 0x38]
	lsls r5, r4, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 17
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r2, _080B6C24
	adds r0, r2
	lsrs r0, 16
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r5, 0
	bl MultiplyInvertedPaletteRGBComponents
_080B6C1C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6C24: .4byte 0x01010000
	thumb_func_end sub_80B6998

	thumb_func_start sub_80B6A80
sub_80B6A80: @ 80B6C28
	push {r4,r5,lr}
	ldr r0, _080B6CA0
	movs r1, 0xCC
	movs r2, 0x50
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B6CA4
	strb r0, [r1, 0x10]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _080B6CA8
	adds r4, r5
	ldr r1, _080B6CAC
	adds r0, r4, 0
	bl SetSubspriteTables
	ldr r0, _080B6CB0
	movs r1, 0xCC
	movs r2, 0x4C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x3A]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r1, _080B6CB4
	adds r0, r2, 0
	bl SetSubspriteTables
	ldr r0, _080B6CB8
	movs r1, 0xCC
	movs r2, 0x4B
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	ands r2, r3
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1, 0x5]
	strh r0, [r4, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6CA0: .4byte gSpriteTemplate_83CE5C8
_080B6CA4: .4byte 0x02000000
_080B6CA8: .4byte gSprites
_080B6CAC: .4byte gUnknown_083CE558
_080B6CB0: .4byte gSpriteTemplate_83CE5F8
_080B6CB4: .4byte gUnknown_083CE560
_080B6CB8: .4byte gSpriteTemplate_83CE5E0
	thumb_func_end sub_80B6A80

	thumb_func_start sub_80B6B14
sub_80B6B14: @ 80B6CBC
	ldr r2, _080B6CD4
	ldrb r1, [r2, 0x10]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6CD8
	adds r0, r1
	movs r1, 0x2
	strh r1, [r0, 0x2E]
	ldrb r1, [r2, 0xE]
	strh r1, [r0, 0x30]
	bx lr
	.align 2, 0
_080B6CD4: .4byte 0x02000000
_080B6CD8: .4byte gSprites
	thumb_func_end sub_80B6B14

	thumb_func_start sub_80B6B34
sub_80B6B34: @ 80B6CDC
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _080B6D00
_080B6CE2:
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080B6CE2
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6D00: .4byte gUnknown_083CE2B4
	thumb_func_end sub_80B6B34

	thumb_func_start sub_80B6B5C
sub_80B6B5C: @ 80B6D04
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r3, _080B6D38
	adds r1, r3
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r3
	ldr r0, _080B6D3C
	ldrb r0, [r0, 0xE]
	bl sub_80B6C48
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6D38: .4byte gSprites
_080B6D3C: .4byte 0x02000000
	thumb_func_end sub_80B6B5C

	thumb_func_start sub_80B6B98
sub_80B6B98: @ 80B6D40
	movs r0, 0
	bx lr
	thumb_func_end sub_80B6B98

	thumb_func_start sub_80B6B9C
sub_80B6B9C: @ 80B6D44
	push {r4,r5,lr}
	adds r3, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r2, _080B6DA8
	adds r4, r0, r2
	movs r0, 0x3C
	ldrsh r1, [r3, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r2
	ldrh r0, [r4, 0x26]
	adds r0, 0x1
	strh r0, [r4, 0x26]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _080B6DA0
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	ldr r0, _080B6DAC
	strh r0, [r4, 0x26]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80B6C48
_080B6DA0:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B6DA8: .4byte gSprites
_080B6DAC: .4byte 0x0000fffc
	thumb_func_end sub_80B6B9C

	thumb_func_start sub_80B6C08
sub_80B6C08: @ 80B6DB0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3A
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B6DEC
	adds r2, r0, r1
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x26]
	adds r0, 0x1
	strh r0, [r2, 0x26]
	lsls r0, 16
	cmp r0, 0
	blt _080B6DE4
	movs r0, 0
	strh r0, [r2, 0x26]
	movs r0, 0x1
	strh r0, [r4, 0x2E]
_080B6DE4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B6DEC: .4byte gSprites
	thumb_func_end sub_80B6C08

	thumb_func_start sub_80B6C48
sub_80B6C48: @ 80B6DF0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B6E48
	lsls r4, r5, 1
	adds r0, r4, r0
	ldrh r0, [r0]
	bl IndexOfSpritePaletteTag
	lsls r0, 4
	mov r1, r8
	ldrb r2, [r1, 0x5]
	movs r1, 0xF
	ands r1, r2
	orrs r1, r0
	mov r0, r8
	strb r1, [r0, 0x5]
	ldr r0, _080B6E4C
	adds r4, r0
	ldrh r0, [r4]
	bl GetSpriteTileStartByTag
	adds r1, r6, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r6, 0x42
	movs r1, 0x3F
	ands r1, r5
	ldrb r2, [r6]
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E48: .4byte gUnknown_083CE2C4
_080B6E4C: .4byte gUnknown_083CE2CA
	thumb_func_end sub_80B6C48

	thumb_func_start sub_80B6CA8
sub_80B6CA8: @ 80B6E50
	push {r4,r5,lr}
	ldr r0, _080B6E9C
	movs r1, 0xCC
	movs r2, 0x6C
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _080B6EA0
	adds r0, r4
	ldr r5, _080B6EA4
	adds r1, r5, 0
	bl SetSubspriteTables
	ldr r0, _080B6EA8
	movs r1, 0xCC
	movs r2, 0x84
	movs r3, 0
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r1, r5, 0
	bl SetSubspriteTables
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B6E9C: .4byte gSpriteTemplate_83CE610
_080B6EA0: .4byte gSprites
_080B6EA4: .4byte gUnknown_083CE578
_080B6EA8: .4byte gSpriteTemplate_83CE628
	thumb_func_end sub_80B6CA8

	thumb_func_start sub_80B6D04
sub_80B6D04: @ 80B6EAC
	push {r4-r6,lr}
	ldr r4, _080B6F34
	ldrh r1, [r4, 0x2]
	subs r1, 0x1
	lsls r1, 3
	adds r1, 0x4
	ldr r0, _080B6F38
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x28
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r3, _080B6F3C
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrh r0, [r4, 0x2]
	lsls r0, 3
	adds r0, 0x4
	lsls r0, 16
	lsrs r1, r0, 16
	movs r5, 0
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcs _080B6F2E
	adds r6, r3, 0
_080B6EF2:
	lsls r4, r1, 16
	asrs r4, 16
	ldr r0, _080B6F40
	adds r1, r4, 0
	movs r2, 0x2C
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	strh r5, [r0, 0x2E]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, 0x8
	lsls r4, 16
	lsrs r1, r4, 16
	ldr r0, _080B6F34
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r5, r0
	bcc _080B6EF2
_080B6F2E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6F34: .4byte 0x02000000
_080B6F38: .4byte gSpriteTemplate_83CE658
_080B6F3C: .4byte gSprites
_080B6F40: .4byte gSpriteTemplate_83CE670
	thumb_func_end sub_80B6D04

	thumb_func_start sub_80B6D9C
sub_80B6D9C: @ 80B6F44
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6F8C
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080B6F68
	subs r0, r1, 0x1
	strh r0, [r4, 0x2E]
	lsls r0, 16
	cmp r0, 0
	bne _080B6F76
_080B6F68:
	movs r0, 0x8
	strh r0, [r4, 0x2E]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
_080B6F76:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B6F8C: .4byte gUnknown_083CE2D0
	thumb_func_end sub_80B6D9C

	thumb_func_start sub_80B6DE8
sub_80B6DE8: @ 80B6F90
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _080B6FB8
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	bl sub_80B6F44
	lsls r0, 24
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	cmp r0, r1
	beq _080B6FBC
	movs r0, 0
	strh r0, [r4, 0x26]
	strh r0, [r4, 0x30]
	b _080B6FE2
	.align 2, 0
_080B6FB8: .4byte gUnknown_083CE2D8
_080B6FBC:
	movs r1, 0x30
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _080B6FE4
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r1, 0x3
	ands r0, r1
	strh r0, [r4, 0x30]
	movs r0, 0
_080B6FE2:
	strh r0, [r4, 0x32]
_080B6FE4:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B6DE8

	thumb_func_start sub_80B6E44
sub_80B6E44: @ 80B6FEC
	push {lr}
	ldr r1, _080B7004
	ldr r0, _080B7008
	ldr r0, [r0, 0x34]
	ldrb r0, [r0, 0x2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_080B7004: .4byte gUnknown_083CE2E0
_080B7008: .4byte 0x02000000
	thumb_func_end sub_80B6E44

	thumb_func_start nullsub_40
nullsub_40: @ 80B700C
	bx lr
	thumb_func_end nullsub_40

	thumb_func_start sub_80B6E68
sub_80B6E68: @ 80B7010
	push {lr}
	sub sp, 0x4
	ldr r0, _080B7058
	ldrh r1, [r0, 0x3E]
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B705C
	movs r2, 0
	str r2, [sp]
	movs r2, 0x38
	movs r3, 0x18
	bl AddPseudoFieldObject
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080B7060
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	movs r1, 0x4
	bl StartSpriteAnim
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B7058: .4byte 0x02000000
_080B705C: .4byte SpriteCallbackDummy
_080B7060: .4byte gSprites
	thumb_func_end sub_80B6E68

	thumb_func_start sub_80B6EBC
sub_80B6EBC: @ 80B7064
	push {r4,lr}
	ldr r0, _080B7098
	movs r1, 0x34
	movs r2, 0x18
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080B709C
	adds r4, r0
	ldr r1, _080B70A0
	adds r0, r4, 0
	bl SetSubspriteTables
	ldrb r0, [r4, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r4, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7098: .4byte gSpriteTemplate_83CE688
_080B709C: .4byte gSprites
_080B70A0: .4byte gUnknown_083CE580
	thumb_func_end sub_80B6EBC

	thumb_func_start sub_80B6EFC
sub_80B6EFC: @ 80B70A4
	push {lr}
	sub sp, 0x8
	bl sub_809D51C
	ldr r3, _080B70E0
	ldrh r0, [r3, 0x3E]
	ldr r1, _080B70E4
	movs r2, 0
	str r2, [sp]
	ldr r2, [r3, 0x44]
	str r2, [sp, 0x4]
	movs r2, 0x34
	movs r3, 0x18
	bl sub_809D2FC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B70E8
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B70E0: .4byte 0x02000000
_080B70E4: .4byte SpriteCallbackDummy
_080B70E8: .4byte gSprites
	thumb_func_end sub_80B6EFC

	thumb_func_start sub_80B6F44
sub_80B6F44: @ 80B70EC
	push {r4,lr}
	movs r2, 0
	ldr r1, _080B710C
	ldr r0, [r1, 0x34]
	ldrb r0, [r0, 0x1]
	adds r4, r1, 0
	cmp r2, r0
	bcs _080B711A
	adds r1, 0x11
	adds r3, r0, 0
_080B7100:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080B7110
	adds r0, r2, 0
	b _080B7124
	.align 2, 0
_080B710C: .4byte 0x02000000
_080B7110:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _080B7100
_080B711A:
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080B7124:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F44

	thumb_func_start sub_80B6F84
sub_80B6F84: @ 80B712C
	push {lr}
	ldr r2, _080B7150
	ldr r0, [r2, 0x34]
	ldrb r0, [r0, 0x1]
	subs r0, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	ble _080B715C
	adds r3, r2, 0
	adds r3, 0x11
_080B7140:
	asrs r2, r1, 24
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080B7154
	lsrs r0, r1, 24
	b _080B715E
	.align 2, 0
_080B7150: .4byte 0x02000000
_080B7154:
	subs r0, r2, 0x1
	lsls r1, r0, 24
	cmp r1, 0
	bgt _080B7140
_080B715C:
	movs r0, 0
_080B715E:
	pop {r1}
	bx r1
	thumb_func_end sub_80B6F84

	thumb_func_start sub_80B6FBC
sub_80B6FBC: @ 80B7164
	push {r4,lr}
	bl sub_80B6F84
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B71A8
	adds r0, 0x11
	adds r4, r0
	movs r0, 0
	strb r0, [r4]
	bl sub_80B7960
	movs r0, 0xFF
	strb r0, [r4]
	bl sub_80B6958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080B7192
	cmp r0, 0x2
	bne _080B719C
_080B7192:
	movs r0, 0x1
	movs r1, 0
	movs r2, 0x1
	bl sub_80B6460
_080B719C:
	movs r0, 0x17
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B71A8: .4byte 0x02000000
	thumb_func_end sub_80B6FBC

	thumb_func_start sub_80B7004
sub_80B7004: @ 80B71AC
	push {r4,r5,lr}
	sub sp, 0x4
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl sub_80B6858
	mov r4, sp
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	bl sub_80B67EC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80B7768
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	movs r4, 0x1
	cmp r0, 0xFF
	bne _080B71EE
	bl sub_80B7104
	b _080B71F6
_080B71EE:
	cmp r0, 0xFE
	bne _080B71FC
	bl sub_80B713C
_080B71F6:
	lsls r0, 24
	lsrs r4, r0, 24
	b _080B7202
_080B71FC:
	adds r0, r1, 0
	bl sub_80B7174
_080B7202:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	cmp r4, 0
	beq _080B722C
	bl sub_80B6F84
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B7228
	ldr r1, [r1, 0x34]
	ldrb r1, [r1, 0x1]
	subs r1, 0x1
	cmp r0, r1
	bne _080B722C
	movs r0, 0x1
	b _080B722E
	.align 2, 0
_080B7228: .4byte 0x02000000
_080B722C:
	movs r0, 0
_080B722E:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7004

	thumb_func_start sub_80B7090
sub_80B7090: @ 80B7238
	push {r4-r7,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	adds r7, r5, 0
	ldr r0, _080B7270
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r6, r4, 0
	adds r0, r4, 0
	bl sub_80B7198
	lsls r0, 24
	cmp r0, 0
	beq _080B727E
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	beq _080B7274
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	b _080B729C
	.align 2, 0
_080B7270: .4byte 0x02000000
_080B7274:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B73CC
	b _080B729C
_080B727E:
	adds r0, r4, 0
	bl sub_80B71E4
	lsls r0, 24
	cmp r0, 0
	beq _080B7294
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7474
	b _080B729C
_080B7294:
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_80B72A4
_080B729C:
	bl sub_80B7960
	movs r0, 0x5
	bl PlaySE
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B7090

	thumb_func_start sub_80B7104
sub_80B7104: @ 80B72AC
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B72D0
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B720C
	lsls r0, 24
	cmp r0, 0
	bne _080B72D4
	movs r0, 0
	b _080B72DE
	.align 2, 0
_080B72D0: .4byte 0x02000000
_080B72D4:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B72A4
	movs r0, 0x1
_080B72DE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B7104

	thumb_func_start sub_80B713C
sub_80B713C: @ 80B72E4
	push {r4,r5,lr}
	bl sub_80B6F84
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B7308
	adds r0, 0x11
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r0, r4, 0
	bl sub_80B7264
	lsls r0, 24
	cmp r0, 0
	bne _080B730C
	movs r0, 0
	b _080B7316
	.align 2, 0
_080B7308: .4byte 0x02000000
_080B730C:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80B7370
	movs r0, 0x1
_080B7316:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80B713C

	thumb_func_start sub_80B7174
sub_80B7174: @ 80B731C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B6F44
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B733C
	adds r1, 0x11
	adds r0, r1
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B733C: .4byte 0x02000000
	thumb_func_end sub_80B7174

	thumb_func_start sub_80B7198
sub_80B7198: @ 80B7340
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC9
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x13
	bls _080B7382
	adds r0, r1, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7382
	adds r0, r1, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7382
	adds r0, r1, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7382
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7386
_080B7382:
	movs r0, 0x1
	b _080B7388
_080B7386:
	movs r0, 0
_080B7388:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7198

	thumb_func_start sub_80B71E4
sub_80B71E4: @ 80B738C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xB5
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B73AA
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B73AE
_080B73AA:
	movs r0, 0x1
	b _080B73B0
_080B73AE:
	movs r0, 0
_080B73B0:
	pop {r1}
	bx r1
	thumb_func_end sub_80B71E4

	thumb_func_start sub_80B720C
sub_80B720C: @ 80B73B4
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFA
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B7402
	adds r0, r1, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7402
	adds r0, r1, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7402
	adds r0, r1, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE
	bls _080B7402
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7402
	adds r0, r1, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7406
_080B7402:
	movs r0, 0x1
	b _080B7408
_080B7406:
	movs r0, 0
_080B7408:
	pop {r1}
	bx r1
	thumb_func_end sub_80B720C

	thumb_func_start sub_80B7264
sub_80B7264: @ 80B740C
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xE6
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7442
	adds r0, r1, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7442
	adds r0, r1, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7442
	adds r0, r1, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7446
_080B7442:
	movs r0, 0x1
	b _080B7448
_080B7446:
	movs r0, 0
_080B7448:
	pop {r1}
	bx r1
	thumb_func_end sub_80B7264

	thumb_func_start sub_80B72A4
sub_80B72A4: @ 80B744C
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xFA
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7468
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7502
_080B7468:
	adds r0, r2, 0
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B747A
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7502
_080B747A:
	adds r0, r2, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B748C
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7502
_080B748C:
	adds r0, r2, 0
	subs r0, 0x1A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B749E
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B7502
_080B749E:
	adds r0, r2, 0
	subs r0, 0x4B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B74FE
	adds r0, r2, 0
	subs r0, 0x56
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B74BC
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7502
_080B74BC:
	adds r0, r2, 0
	subs r0, 0x5B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B74CE
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7502
_080B74CE:
	adds r0, r2, 0
	subs r0, 0x60
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B74E0
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7502
_080B74E0:
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B74F2
	adds r0, r2, 0
	adds r0, 0x2C
	b _080B7502
_080B74F2:
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7506
_080B74FE:
	adds r0, r2, 0
	adds r0, 0xFB
_080B7502:
	lsls r0, 24
	lsrs r2, r0, 24
_080B7506:
	ldr r0, _080B7514
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B7514: .4byte 0x02000000
	thumb_func_end sub_80B72A4

	thumb_func_start sub_80B7370
sub_80B7370: @ 80B7518
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xE6
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7534
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7560
_080B7534:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B755E
	adds r0, r2, 0
	subs r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7552
	adds r0, r2, 0
	adds r0, 0x31
	b _080B7560
_080B7552:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7564
_080B755E:
	adds r0, r2, 0x5
_080B7560:
	lsls r0, 24
	lsrs r2, r0, 24
_080B7564:
	ldr r0, _080B7570
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B7570: .4byte 0x02000000
	thumb_func_end sub_80B7370

	thumb_func_start sub_80B73CC
sub_80B73CC: @ 80B7574
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xC9
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7590
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B7606
_080B7590:
	adds r0, r2, 0
	subs r0, 0x3C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B75A2
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B7606
_080B75A2:
	adds r0, r2, 0
	subs r0, 0x41
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B75B4
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B7606
_080B75B4:
	adds r0, r2, 0
	subs r0, 0x46
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B7602
	adds r0, r2, 0
	adds r0, 0x79
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B75D2
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B7606
_080B75D2:
	adds r0, r2, 0
	adds r0, 0x74
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B75E4
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B7606
_080B75E4:
	adds r0, r2, 0
	adds r0, 0x6F
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B75F6
	adds r0, r2, 0
	adds r0, 0xCF
	b _080B7606
_080B75F6:
	adds r0, r2, 0
	adds r0, 0x6A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B760A
_080B7602:
	adds r0, r2, 0
	adds r0, 0xD4
_080B7606:
	lsls r0, 24
	lsrs r2, r0, 24
_080B760A:
	ldr r0, _080B7618
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B7618: .4byte 0x02000000
	thumb_func_end sub_80B73CC

	thumb_func_start sub_80B7474
sub_80B7474: @ 80B761C
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsrs r2, r0, 24
	movs r3, 0xB5
	lsls r3, 24
	adds r0, r3
	lsrs r0, 24
	cmp r0, 0x4
	bls _080B763E
	adds r0, r2, 0
	adds r0, 0x65
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080B7646
_080B763E:
	adds r0, r2, 0
	adds r0, 0xCF
	lsls r0, 24
	lsrs r2, r0, 24
_080B7646:
	ldr r0, _080B7654
	adds r0, 0x11
	adds r0, r1, r0
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080B7654: .4byte 0x02000000
	thumb_func_end sub_80B7474

	thumb_func_start sub_80B74B0
sub_80B74B0: @ 80B7658
	push {r4,lr}
	movs r1, 0
	ldr r3, _080B768C
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcs _080B769E
	adds r2, r3, 0
	adds r4, r3, 0
	adds r4, 0x11
_080B766C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B7690
	cmp r0, 0xFF
	beq _080B7690
	ldr r0, [r2, 0x38]
	ldr r1, [r2, 0x34]
	ldrb r2, [r1, 0x1]
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r1, r4, 0
	bl StringCopyN
	b _080B769E
	.align 2, 0
_080B768C: .4byte 0x02000000
_080B7690:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, [r3, 0x34]
	ldrb r0, [r0, 0x1]
	cmp r1, r0
	bcc _080B766C
_080B769E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B74B0

	thumb_func_start sub_80B74FC
sub_80B74FC: @ 80B76A4
	push {r4,lr}
	ldr r0, _080B76D0
	ldr r1, _080B76D4
	ldr r1, [r1, 0x38]
	bl StringCopy
	ldr r4, _080B76D8
	ldr r1, _080B76DC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080B76E0
	bl BasicInitMenuWindow
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	bl sub_8072044
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B76D0: .4byte gStringVar1
_080B76D4: .4byte 0x02000000
_080B76D8: .4byte gStringVar4
_080B76DC: .4byte gOtherText_SentToPC
_080B76E0: .4byte gWindowConfig_81E6E88
	thumb_func_end sub_80B74FC

	thumb_func_start sub_80B753C
sub_80B753C: @ 80B76E4
	push {lr}
	ldr r0, _080B76F8
	bl LoadSpriteSheets
	ldr r0, _080B76FC
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_080B76F8: .4byte gUnknown_083CE6A0
_080B76FC: .4byte gUnknown_083CE708
	thumb_func_end sub_80B753C

	thumb_func_start sub_80B7558
sub_80B7558: @ 80B7700
	push {lr}
	bl sub_80B7568
	bl sub_80B75B0
	pop {r0}
	bx r0
	thumb_func_end sub_80B7558

	thumb_func_start sub_80B7568
sub_80B7568: @ 80B7710
	push {r4,lr}
	ldr r4, _080B7744
	ldr r3, _080B7748
	ldrh r0, [r3]
	lsls r0, 5
	movs r1, 0xC0
	lsls r1, 19
	adds r0, r1
	ldr r1, _080B774C
	str r4, [r1]
	str r0, [r1, 0x4]
	ldr r2, _080B7750
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldrh r0, [r3]
	lsls r0, 5
	ldr r3, _080B7754
	adds r0, r3
	str r4, [r1]
	str r0, [r1, 0x4]
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7744: .4byte gNamingScreenMenu_Gfx
_080B7748: .4byte gMenuMessageBoxContentTileOffset
_080B774C: .4byte 0x040000d4
_080B7750: .4byte 0x80000400
_080B7754: .4byte 0x06008000
	thumb_func_end sub_80B7568

	thumb_func_start sub_80B75B0
sub_80B75B0: @ 80B7758
	push {lr}
	ldr r0, _080B7768
	movs r1, 0
	movs r2, 0x80
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_080B7768: .4byte gNamingScreenPalettes
	thumb_func_end sub_80B75B0

	thumb_func_start sub_80B75C4
sub_80B75C4: @ 80B776C
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080B77B0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r4, _080B77B4
	ldr r5, _080B77B8
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r1, r4
	ldrb r0, [r5, 0xC]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r5, 0xE]
	lsls r1, 3
	adds r4, 0x4
	adds r1, r4
	ldrb r0, [r5, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B77B0: .4byte gUnknown_083CE308
_080B77B4: .4byte gUnknown_083CE2F0
_080B77B8: .4byte 0x02000000
	thumb_func_end sub_80B75C4

	thumb_func_start sub_80B7614
sub_80B7614: @ 80B77BC
	push {lr}
	sub sp, 0x8
	ldr r0, _080B77EC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r0, _080B77F0
	ldr r2, _080B77F4
	ldrb r1, [r2, 0xE]
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldrb r0, [r2, 0xD]
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080B77EC: .4byte gUnknown_083CE308
_080B77F0: .4byte gUnknown_083CE2F0
_080B77F4: .4byte 0x02000000
	thumb_func_end sub_80B7614

	thumb_func_start sub_80B7650
sub_80B7650: @ 80B77F8
	push {lr}
	ldr r1, _080B7804
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B7804: .4byte gUnknown_083CE748
	thumb_func_end sub_80B7650

	thumb_func_start sub_80B7660
sub_80B7660: @ 80B7808
	push {lr}
	ldr r1, _080B7814
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B7814: .4byte gUnknown_083CEBF8
	thumb_func_end sub_80B7660

	thumb_func_start sub_80B7670
sub_80B7670: @ 80B7818
	push {lr}
	ldr r1, _080B7824
	bl sub_80B7698
	pop {r0}
	bx r0
	.align 2, 0
_080B7824: .4byte gUnknown_083CF0A8
	thumb_func_end sub_80B7670

	thumb_func_start sub_80B7680
sub_80B7680: @ 80B7828
	push {lr}
	ldr r0, _080B7838
	ldr r1, _080B783C
	bl sub_80B76E0
	pop {r0}
	bx r0
	.align 2, 0
_080B7838: .4byte 0x0600f000
_080B783C: .4byte gUnknown_08E86258
	thumb_func_end sub_80B7680

	thumb_func_start sub_80B7698
sub_80B7698: @ 80B7840
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B7884
	ldrh r6, [r0]
_080B784C:
	movs r1, 0
	lsls r4, 16
	asrs r5, r4, 11
_080B7852:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r5, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B7852
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B784C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7884: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B7698

	thumb_func_start sub_80B76E0
sub_80B76E0: @ 80B7888
	push {r4-r7,lr}
	mov r12, r0
	adds r3, r1, 0
	movs r4, 0
	ldr r0, _080B78D0
	ldrh r6, [r0]
_080B7894:
	movs r1, 0
	lsls r5, r4, 16
	asrs r4, r5, 11
_080B789A:
	lsls r0, r1, 16
	asrs r0, 16
	adds r1, r4, r0
	lsls r1, 1
	add r1, r12
	ldrh r7, [r3]
	adds r2, r6, r7
	strh r2, [r1]
	adds r0, 0x1
	lsls r0, 16
	adds r3, 0x2
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080B789A
	adds r3, 0x4
	movs r1, 0x80
	lsls r1, 9
	adds r0, r5, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080B7894
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B78D0: .4byte gMenuMessageBoxContentTileOffset
	thumb_func_end sub_80B76E0

	thumb_func_start sub_80B772C
sub_80B772C: @ 80B78D4
	push {lr}
	ldr r1, _080B78E4
	ldrb r0, [r1, 0xE]
	ldrb r1, [r1, 0xC]
	bl nullsub_20
	pop {r0}
	bx r0
	.align 2, 0
_080B78E4: .4byte 0x02000000
	thumb_func_end sub_80B772C

	thumb_func_start sub_80B7740
sub_80B7740: @ 80B78E8
	push {r4,lr}
	ldr r4, _080B7908
	ldrb r0, [r4, 0xE]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r4, 0xD]
	bl nullsub_20
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7908: .4byte 0x02000000
	thumb_func_end sub_80B7740

	thumb_func_start nullsub_20
nullsub_20: @ 80B790C
	bx lr
	thumb_func_end nullsub_20

	thumb_func_start sub_80B7768
sub_80B7768: @ 80B7910
	ldr r3, _080B7934
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 2
	adds r0, r2
	ldr r1, _080B7938
	ldrb r2, [r1, 0xE]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 4
	adds r0, r1
	adds r0, r3
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B7934: .4byte gUnknown_083CE3A8
_080B7938: .4byte 0x02000000
	thumb_func_end sub_80B7768

	thumb_func_start sub_80B7794
sub_80B7794: @ 80B793C
	push {r4-r6,lr}
	ldr r6, _080B7994
	ldr r4, _080B7998
	ldrb r0, [r4, 0xC]
	lsls r0, 2
	ldrb r1, [r4, 0xE]
	lsls r1, 4
	adds r0, r1
	adds r0, r6
	ldr r0, [r0]
	bl BasicInitMenuWindow
	ldr r5, _080B799C
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r6, 0x8
	adds r1, r6
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r5, 0x4
	adds r0, r5
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B772C
	bl sub_80B7740
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7994: .4byte gUnknown_083CE328
_080B7998: .4byte 0x02000000
_080B799C: .4byte gUnknown_083CE310
	thumb_func_end sub_80B7794

	thumb_func_start sub_80B77F8
sub_80B77F8: @ 80B79A0
	push {r4,lr}
	ldr r2, _080B79D4
	ldr r4, _080B79D8
	ldrb r1, [r4, 0xD]
	lsls r1, 2
	ldrb r0, [r4, 0xE]
	lsls r0, 4
	adds r1, r0
	adds r2, 0x8
	adds r1, r2
	ldr r0, [r1]
	bl BasicInitMenuWindow
	ldr r1, _080B79DC
	ldrb r0, [r4, 0xE]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	bl sub_80B7740
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B79D4: .4byte gUnknown_083CE328
_080B79D8: .4byte 0x02000000
_080B79DC: .4byte gUnknown_083CE310
	thumb_func_end sub_80B77F8

	thumb_func_start sub_80B7838
sub_80B7838: @ 80B79E0
	push {lr}
	movs r0, 0x1
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7838

	thumb_func_start sub_80B7844
sub_80B7844: @ 80B79EC
	push {lr}
	movs r0, 0
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7844

	thumb_func_start sub_80B7850
sub_80B7850: @ 80B79F8
	push {lr}
	movs r0, 0x2
	bl sub_80B785C
	pop {r0}
	bx r0
	thumb_func_end sub_80B7850

	thumb_func_start sub_80B785C
sub_80B785C: @ 80B7A04
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	movs r5, 0x9
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 4
_080B7A14:
	lsls r4, r2, 16
	asrs r4, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	ldr r1, _080B7A4C
	adds r0, r1
	adds r0, r6, r0
	lsls r2, r5, 24
	lsrs r2, 24
	movs r1, 0x3
	bl MenuPrint
	adds r4, 0x1
	lsls r4, 16
	lsls r0, r5, 16
	movs r1, 0x80
	lsls r1, 10
	adds r0, r1
	lsrs r5, r0, 16
	lsrs r2, r4, 16
	asrs r4, 16
	cmp r4, 0x3
	ble _080B7A14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7A4C: .4byte gUnknown_083CE3A8
	thumb_func_end sub_80B785C

	thumb_func_start sub_80B78A8
sub_80B78A8: @ 80B7A50
	push {r4,lr}
	ldr r0, _080B7A8C
	bl BasicInitMenuWindow
	ldr r1, _080B7A90
	ldr r4, _080B7A94
	ldrb r0, [r4, 0x1]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _080B7A98
	ldr r0, [r4, 0x34]
	ldrb r0, [r0, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, [r4, 0x34]
	ldr r0, [r0, 0x8]
	movs r1, 0x9
	movs r2, 0x2
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7A8C: .4byte gWindowConfig_81E6F4C
_080B7A90: .4byte gUnknown_083CE358
_080B7A94: .4byte 0x02000000
_080B7A98: .4byte gUnknown_083CE368
	thumb_func_end sub_80B78A8

	thumb_func_start nullsub_61
nullsub_61: @ 80B7A9C
	bx lr
	thumb_func_end nullsub_61

	thumb_func_start sub_80B78F8
sub_80B78F8: @ 80B7AA0
	push {lr}
	ldr r0, _080B7ABC
	ldr r1, _080B7AC0
	movs r3, 0x3E
	ldrsh r2, [r1, r3]
	movs r1, 0xB
	muls r1, r2
	ldr r2, _080B7AC4
	adds r1, r2
	bl StringCopy
	pop {r0}
	bx r0
	.align 2, 0
_080B7ABC: .4byte gStringVar1
_080B7AC0: .4byte 0x02000000
_080B7AC4: .4byte gSpeciesNames
	thumb_func_end sub_80B78F8

	thumb_func_start nullsub_62
nullsub_62: @ 80B7AC8
	bx lr
	thumb_func_end nullsub_62

	thumb_func_start sub_80B7924
sub_80B7924: @ 80B7ACC
	push {lr}
	sub sp, 0x4
	ldr r1, _080B7B00
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	ldr r0, _080B7B04
	adds r0, 0x40
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0xFF
	beq _080B7AFA
	cmp r0, 0xFE
	bne _080B7AF0
	mov r1, sp
	movs r0, 0xB6
	strb r0, [r1]
_080B7AF0:
	mov r0, sp
	movs r1, 0x14
	movs r2, 0x4
	bl MenuPrint
_080B7AFA:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B7B00: .4byte gUnknown_083CE370
_080B7B04: .4byte 0x02000000
	thumb_func_end sub_80B7924

	thumb_func_start sub_80B7960
sub_80B7960: @ 80B7B08
	push {r4,lr}
	ldr r0, _080B7B44
	movs r2, 0xFC
	strb r2, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x8
	strb r1, [r0, 0x2]
	strb r2, [r0, 0x3]
	movs r1, 0x11
	strb r1, [r0, 0x4]
	movs r1, 0x1
	strb r1, [r0, 0x5]
	adds r0, 0x6
	ldr r4, _080B7B48
	adds r1, r4, 0
	bl StringCopy
	ldr r0, _080B7B4C
	bl BasicInitMenuWindow
	ldr r0, _080B7B44
	subs r4, 0x11
	ldrb r1, [r4, 0x2]
	movs r2, 0x4
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B7B44: .4byte gStringVar1
_080B7B48: .4byte 0x02000011
_080B7B4C: .4byte gWindowConfig_81E6F4C
	thumb_func_end sub_80B7960

	.align 2, 0 @ Don't pad with nop.
