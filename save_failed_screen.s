	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start fullscreen_save_activate
fullscreen_save_activate: @ 81471C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _081471E0
	bl SetMainCallback2
	ldr r0, _081471E4
	strh r4, [r0]
	ldr r1, _081471E8
	movs r0, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081471E0: .4byte sub_8146E50
_081471E4: .4byte gUnknown_0203933C
_081471E8: .4byte gUnknown_0203933E
	thumb_func_end fullscreen_save_activate

	thumb_func_start sub_8146E3C
sub_8146E3C: @ 81471EC
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_8146E3C

	thumb_func_start sub_8146E50
sub_8146E50: @ 8147200
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	ldr r0, _08147360
	ldr r1, _08147364
	adds r7, r0, r1
	ldrb r0, [r7]
	cmp r0, 0
	beq _0814721C
	cmp r0, 0x1
	bne _0814721C
	b _081473CC
_0814721C:
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	mov r9, r0
	movs r1, 0
	strh r1, [r0]
	ldr r6, _08147368
	strh r1, [r6]
	adds r0, 0xC
	mov r8, r0
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	ldr r5, _0814736C
	strh r1, [r5]
	adds r0, 0x12
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	add r0, sp, 0x4
	strh r1, [r0]
	ldr r2, _08147370
	str r0, [r2]
	movs r1, 0xC0
	lsls r1, 19
	str r1, [r2, 0x4]
	ldr r0, _08147374
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r4, 0
	str r4, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r2]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _08147378
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r2, 0x4]
	ldr r0, _0814737C
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r0, _08147380
	bl LZ77UnCompVram
	ldr r0, _08147384
	ldr r1, _08147388
	bl LZ77UnCompVram
	ldr r0, _0814738C
	ldr r1, _08147390
	bl LZ77UnCompVram
	ldr r0, _08147394
	ldr r1, _08147398
	bl LZ77UnCompVram
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r0, _0814739C
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _081473A0
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _081473A4
	bl SetUpWindowConfig
	ldr r0, _081473A8
	bl InitMenuWindow
	movs r0, 0xD
	movs r1, 0x6
	movs r2, 0x10
	movs r3, 0x9
	bl MenuDrawTextWindow
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081473AC
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r3, _081473B0
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _081473B4
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _081473B8
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _081473BC
	bl SetVBlankCallback
	ldr r1, _081473C0
	adds r0, r1, 0
	strh r0, [r6]
	ldr r1, _081473C4
	adds r0, r1, 0
	mov r1, r8
	strh r0, [r1]
	ldr r1, _081473C8
	adds r0, r1, 0
	strh r0, [r5]
	movs r1, 0xEA
	lsls r1, 5
	adds r0, r1, 0
	mov r1, r9
	strh r0, [r1]
	ldrb r0, [r7]
	adds r0, 0x1
	strb r0, [r7]
	b _081473E2
	.align 2, 0
_08147360: .4byte gMain
_08147364: .4byte 0x0000043c
_08147368: .4byte 0x0400000e
_0814736C: .4byte 0x04000008
_08147370: .4byte 0x040000d4
_08147374: .4byte 0x8100c000
_08147378: .4byte 0x85000100
_0814737C: .4byte 0x81000200
_08147380: .4byte gBirchHelpGfx
_08147384: .4byte gBirchBagTilemap
_08147388: .4byte 0x06003000
_0814738C: .4byte gBirchGrassTilemap
_08147390: .4byte 0x06003800
_08147394: .4byte gSaveFailedClockGfx
_08147398: .4byte 0x06010020
_0814739C: .4byte gBirchBagGrassPal
_081473A0: .4byte gSaveFailedClockPal
_081473A4: .4byte gWindowConfig_81E6C3C
_081473A8: .4byte gWindowConfig_81E6CE4
_081473AC: .4byte gSystemText_SaveFailedBackupCheck
_081473B0: .4byte 0x04000208
_081473B4: .4byte 0x04000200
_081473B8: .4byte 0x04000004
_081473BC: .4byte sub_8146E3C
_081473C0: .4byte 0x00000703
_081473C4: .4byte 0x00000602
_081473C8: .4byte 0x00001f08
_081473CC:
	bl UpdatePaletteFade
	lsls r0, 24
	cmp r0, 0
	bne _081473E2
	ldr r0, _081473F0
	bl SetMainCallback2
	ldr r0, _081473F4
	bl SetVBlankCallback
_081473E2:
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081473F0: .4byte sub_8147048
_081473F4: .4byte sub_8147218
	thumb_func_end sub_8146E50

	thumb_func_start sub_8147048
sub_8147048: @ 81473F8
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _08147484
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _08147488
	ldr r0, [r1]
	cmp r0, 0
	beq _08147462
	adds r5, r1, 0
_0814740C:
	ldr r0, [r5]
	bl sub_814737C
	lsls r0, 24
	cmp r0, 0
	bne _081474C8
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0814748C
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _08147490
	ldrb r0, [r0]
	bl sub_8125C3C
	ldr r0, [r5]
	cmp r0, 0
	beq _08147452
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08147494
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
_08147452:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, [r5]
	cmp r0, 0
	beq _08147462
	cmp r4, 0x2
	bls _0814740C
_08147462:
	cmp r4, 0x3
	bne _081474A0
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08147498
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _0814749C
	bl SetMainCallback2
	b _081474FA
	.align 2, 0
_08147484: .4byte gUnknown_0203933E
_08147488: .4byte gUnknown_03005EA8
_0814748C: .4byte gSystemText_CheckCompleteSaveAttempt
_08147490: .4byte gUnknown_0203933C
_08147494: .4byte gSystemText_SaveFailedBackupCheck
_08147498: .4byte gSystemText_BackupDamagedGameContinue
_0814749C: .4byte sub_81471A4
_081474A0:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081474C0
	ldr r0, [r0]
	cmp r0, 0
	bne _081474F0
	ldr r0, _081474C4
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	b _081474FA
	.align 2, 0
_081474C0: .4byte gUnknown_03005EBC
_081474C4: .4byte gSystemText_SaveCompletedGameEnd
_081474C8:
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _081474E8
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _081474EC
	bl SetMainCallback2
	b _08147500
	.align 2, 0
_081474E8: .4byte gSystemText_BackupDamagedGameContinue
_081474EC: .4byte sub_8147154
_081474F0:
	ldr r0, _08147508
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
_081474FA:
	ldr r0, _0814750C
	bl SetMainCallback2
_08147500:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147508: .4byte gSystemText_SaveCompletedPressA
_0814750C: .4byte sub_81471A4
	thumb_func_end sub_8147048

	thumb_func_start sub_8147154
sub_8147154: @ 8147510
	push {lr}
	ldr r1, _0814754C
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08147550
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08147546
	movs r0, 0x1
	movs r1, 0xA
	movs r2, 0x1C
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08147554
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _08147558
	bl SetVBlankCallback
	ldr r0, _0814755C
	bl SetMainCallback2
_08147546:
	pop {r0}
	bx r0
	.align 2, 0
_0814754C: .4byte gUnknown_0203933E
_08147550: .4byte gMain
_08147554: .4byte gSystemText_GameplayEnded
_08147558: .4byte sub_8146E3C
_0814755C: .4byte sub_81471A4
	thumb_func_end sub_8147154

	thumb_func_start sub_81471A4
sub_81471A4: @ 8147560
	push {lr}
	sub sp, 0x4
	ldr r0, _08147598
	movs r2, 0
	strh r2, [r0]
	ldr r0, _0814759C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08147590
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _081475A0
	bl SetVBlankCallback
	ldr r0, _081475A4
	bl SetMainCallback2
_08147590:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08147598: .4byte gUnknown_0203933E
_0814759C: .4byte gMain
_081475A0: .4byte sub_8146E3C
_081475A4: .4byte sub_81471EC
	thumb_func_end sub_81471A4

	thumb_func_start sub_81471EC
sub_81471EC: @ 81475A8
	push {r4,r5,lr}
	bl UpdatePaletteFade
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _081475CE
	ldr r5, _081475C4
	ldr r0, [r5]
	cmp r0, 0
	bne _081475C8
	bl DoSoftReset
	b _081475CE
	.align 2, 0
_081475C4: .4byte gUnknown_03005EBC
_081475C8:
	bl SetMainCallback2
	str r4, [r5]
_081475CE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81471EC

	thumb_func_start sub_8147218
sub_8147218: @ 81475D4
	push {r4,r5,lr}
	ldr r0, _0814764C
	mov r12, r0
	ldr r0, [r0, 0x24]
	lsrs r4, r0, 3
	movs r0, 0x7
	ands r4, r0
	ldr r0, _08147650
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	mov r2, r12
	str r0, [r2, 0x3C]
	str r1, [r2, 0x40]
	ldrh r1, [r2, 0x3E]
	ldr r0, _08147654
	ands r0, r1
	movs r1, 0x70
	orrs r0, r1
	strh r0, [r2, 0x3E]
	mov r1, r12
	adds r1, 0x3C
	movs r0, 0x38
	strb r0, [r1]
	ldr r0, _08147658
	ldrh r0, [r0]
	cmp r0, 0
	beq _08147664
	ldr r3, _0814765C
	lsls r2, r4, 1
	adds r2, r4
	adds r0, r2, r3
	mov r4, r12
	adds r4, 0x40
	ldrb r5, [r0]
	ldrh r1, [r4]
	ldr r0, _08147660
	ands r0, r1
	orrs r0, r5
	strh r0, [r4]
	adds r0, r3, 0x2
	adds r0, r2, r0
	ldrb r1, [r0]
	lsls r1, 4
	adds r3, 0x1
	adds r2, r3
	ldrb r0, [r2]
	lsls r0, 3
	orrs r1, r0
	mov r3, r12
	adds r3, 0x3F
	movs r0, 0x1F
	ands r1, r0
	lsls r1, 1
	ldrb r2, [r3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08147674
	.align 2, 0
_0814764C: .4byte gMain
_08147650: .4byte gUnknown_08411940
_08147654: .4byte 0xfffffe00
_08147658: .4byte gUnknown_0203933E
_0814765C: .4byte gUnknown_08411948
_08147660: .4byte 0xfffffc00
_08147664:
	mov r2, r12
	adds r2, 0x40
	ldrh r1, [r2]
	ldr r0, _08147694
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
_08147674:
	ldr r0, _08147698
	movs r1, 0xE0
	lsls r1, 19
	movs r2, 0x1
	bl CpuFastSet
	ldr r1, _0814769C
	ldrh r0, [r1, 0x2]
	cmp r0, 0
	beq _0814768C
	subs r0, 0x1
	strh r0, [r1, 0x2]
_0814768C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08147694: .4byte 0xfffffc00
_08147698: .4byte 0x030017ac
_0814769C: .4byte gUnknown_0203933E
	thumb_func_end sub_8147218

	thumb_func_start sub_81472E4
sub_81472E4: @ 81476A0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _081476C4
	movs r3, 0x80
	lsls r3, 5
	movs r1, 0
	adds r2, r4, 0
	bl ReadFlash
	movs r1, 0
	ldr r2, _081476C8
_081476B8:
	ldr r0, [r4]
	cmp r0, 0
	beq _081476CC
	movs r0, 0x1
	b _081476DA
	.align 2, 0
_081476C4: .4byte 0x02000000
_081476C8: .4byte 0x000003ff
_081476CC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, 0x4
	cmp r1, r2
	bls _081476B8
	movs r0, 0
_081476DA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81472E4

	thumb_func_start sub_8147324
sub_8147324: @ 81476E0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0
	ldr r1, _08147730
	mov r8, r1
	ldr r7, _08147734
_081476F2:
	movs r4, 0
	adds r5, r0, 0x1
_081476F6:
	ldr r3, [r7]
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl _call_via_r3
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r8
	bls _081476F6
	adds r0, r6, 0
	bl sub_81472E4
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r5, 16
	lsrs r0, 16
	cmp r1, 0
	beq _08147722
	cmp r0, 0x81
	bls _081476F2
_08147722:
	adds r0, r1, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08147730: .4byte 0x00000fff
_08147734: .4byte ProgramFlashByte
	thumb_func_end sub_8147324

	thumb_func_start sub_814737C
sub_814737C: @ 8147738
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r6, 0
_0814773E:
	movs r4, 0x1
	lsls r4, r6
	adds r0, r5, 0
	ands r0, r4
	cmp r0, 0
	beq _08147758
	adds r0, r6, 0
	bl sub_8147324
	lsls r0, 24
	cmp r0, 0
	bne _08147758
	bics r5, r4
_08147758:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x1F
	bls _0814773E
	cmp r5, 0
	beq _0814776A
	movs r0, 0x1
	b _0814776C
_0814776A:
	movs r0, 0
_0814776C:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_814737C

	.align 2, 0 @ Don't pad with nop.
