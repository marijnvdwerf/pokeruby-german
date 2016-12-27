	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BA0A8
sub_80BA0A8: @ 80BA23C
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80BA0A8

	thumb_func_start sub_80BA0C0
sub_80BA0C0: @ 80BA254
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r0, _080BA27C @ =gUnknown_020387B0
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BA276
	bl m4aSoundMain
	bl m4aSoundMain
	bl m4aSoundMain
_080BA276:
	pop {r0}
	bx r0
	.align 2, 0
_080BA27C: .4byte gUnknown_020387B0
	thumb_func_end sub_80BA0C0

	thumb_func_start unref_sub_80BA0EC
unref_sub_80BA0EC: @ 80BA280
	push {r4-r6,lr}
	sub sp, 0xC
	movs r0, 0
	bl SetVBlankCallback
	movs r6, 0x80
	lsls r6, 19
	movs r5, 0
	strh r5, [r6]
	ldr r0, _080BA3A0 @ =0x0400000c
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	subs r0, 0x2
	strh r5, [r0]
	adds r0, 0x10
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r0, 0x6
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r0, 0x6
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	add r0, sp, 0x4
	strh r5, [r0]
	ldr r1, _080BA3A4 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080BA3A8 @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r4, 0
	str r4, [sp, 0x8]
	add r0, sp, 0x8
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080BA3AC @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r1]
	movs r0, 0xA0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _080BA3B0 @ =0x81000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	bl ResetTasks
	bl ResetSpriteData
	ldr r0, _080BA3B4 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _080BA3B8 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	movs r0, 0x1
	negs r0, r0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080BA3BC @ =0x04000040
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	subs r0, 0x2
	strh r4, [r0]
	adds r0, 0x4
	strh r4, [r0]
	ldr r1, _080BA3C0 @ =0x04000048
	ldr r2, _080BA3C4 @ =0x00001111
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x31
	strh r0, [r1]
	adds r1, 0x6
	movs r0, 0xE1
	strh r0, [r1]
	ldr r0, _080BA3C8 @ =0x04000052
	strh r4, [r0]
	adds r1, 0x4
	movs r0, 0x7
	strh r0, [r1]
	ldr r1, _080BA3CC @ =0x04000200
	movs r2, 0x1
	strh r2, [r1]
	ldrh r0, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r2, _080BA3D0 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080BA3D4 @ =sub_80BA0C0
	bl SetVBlankCallback
	ldr r0, _080BA3D8 @ =sub_80BA0A8
	bl SetMainCallback2
	ldr r1, _080BA3DC @ =0x00007140
	adds r0, r1, 0
	strh r0, [r6]
	ldr r0, _080BA3E0 @ =sub_80BA258
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BA3E4 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	strh r4, [r1, 0xA]
	strh r4, [r1, 0xC]
	strh r4, [r1, 0xE]
	ldr r0, _080BA3E8 @ =gUnknown_020387B0
	strb r5, [r0]
	strh r4, [r1, 0xE]
	bl m4aSoundInit
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BA3A0: .4byte 0x0400000c
_080BA3A4: .4byte 0x040000d4
_080BA3A8: .4byte 0x8100c000
_080BA3AC: .4byte 0x85000100
_080BA3B0: .4byte 0x81000200
_080BA3B4: .4byte gWindowConfig_81E6C3C
_080BA3B8: .4byte gWindowConfig_81E6CE4
_080BA3BC: .4byte 0x04000040
_080BA3C0: .4byte 0x04000048
_080BA3C4: .4byte 0x00001111
_080BA3C8: .4byte 0x04000052
_080BA3CC: .4byte 0x04000200
_080BA3D0: .4byte 0x04000004
_080BA3D4: .4byte sub_80BA0C0
_080BA3D8: .4byte sub_80BA0A8
_080BA3DC: .4byte 0x00007140
_080BA3E0: .4byte sub_80BA258
_080BA3E4: .4byte gTasks
_080BA3E8: .4byte gUnknown_020387B0
	thumb_func_end unref_sub_80BA0EC

	thumb_func_start sub_80BA258
sub_80BA258: @ 80BA3EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x40
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080BA4E8 @ =gDebugText_SoundCheckJap
	mov r0, sp
	movs r2, 0x9
	bl memcpy
	add r7, sp, 0xC
	ldr r1, _080BA4EC @ =gDebugText_BGM
	adds r0, r7, 0
	movs r2, 0x4
	bl memcpy
	add r0, sp, 0x10
	mov r8, r0
	ldr r1, _080BA4F0 @ =gDebugText_SE
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x14
	ldr r1, _080BA4F4 @ =gUnknown_083D02D9
	adds r0, r5, 0
	movs r2, 0xD
	bl memcpy
	add r4, sp, 0x24
	ldr r1, _080BA4F8 @ =gDebugText_UpDown
	adds r0, r4, 0
	movs r2, 0xC
	bl memcpy
	add r6, sp, 0x30
	ldr r1, _080BA4FC @ =gDebugText_DriverTest
	adds r0, r6, 0
	movs r2, 0xE
	bl memcpy
	ldr r0, _080BA500 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BA4D8
	movs r0, 0x2
	movs r1, 0
	movs r2, 0x1B
	movs r3, 0x3
	bl MenuDrawTextWindow
	movs r0, 0x2
	movs r1, 0x5
	movs r2, 0x1B
	movs r3, 0xA
	bl MenuDrawTextWindow
	movs r0, 0x2
	movs r1, 0xC
	movs r2, 0x1B
	movs r3, 0x11
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x4
	movs r2, 0x1
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0xE
	movs r2, 0x1
	bl MenuPrint
	adds r0, r7, 0
	movs r1, 0x4
	movs r2, 0x6
	bl MenuPrint
	adds r0, r4, 0
	movs r1, 0xE
	movs r2, 0x6
	bl MenuPrint
	mov r0, r8
	movs r1, 0x4
	movs r2, 0xD
	bl MenuPrint
	adds r0, r4, 0
	movs r1, 0xE
	movs r2, 0xD
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0xE
	movs r2, 0x12
	bl MenuPrint
	ldr r1, _080BA504 @ =gTasks
	mov r2, r9
	lsls r0, r2, 2
	add r0, r9
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BA508 @ =sub_80BA384
	str r1, [r0]
	ldr r1, _080BA50C @ =0x04000040
	ldr r2, _080BA510 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA514 @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
_080BA4D8:
	add sp, 0x40
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BA4E8: .4byte gDebugText_SoundCheckJap
_080BA4EC: .4byte gDebugText_BGM
_080BA4F0: .4byte gDebugText_SE
_080BA4F4: .4byte gUnknown_083D02D9
_080BA4F8: .4byte gDebugText_UpDown
_080BA4FC: .4byte gDebugText_DriverTest
_080BA500: .4byte gPaletteFade
_080BA504: .4byte gTasks
_080BA508: .4byte sub_80BA384
_080BA50C: .4byte 0x04000040
_080BA510: .4byte 0x000011df
_080BA514: .4byte 0x0000011f
	thumb_func_end sub_80BA258

	thumb_func_start sub_80BA384
sub_80BA384: @ 80BA518
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BA580 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	ldrb r0, [r4, 0x8]
	bl sub_80BA6B8
	ldr r1, _080BA584 @ =0x0000015d
	adds r0, r1, 0
	ldrh r2, [r4, 0xA]
	adds r0, r2
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	movs r2, 0x8
	bl sub_80BA700
	ldr r1, _080BA588 @ =gBGMNames
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xB
	movs r2, 0x8
	bl sub_80BA79C
	ldrh r0, [r4, 0xC]
	movs r1, 0x7
	movs r2, 0xF
	bl sub_80BA700
	ldr r1, _080BA58C @ =gSENames
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0xB
	movs r2, 0xF
	bl sub_80BA79C
	ldr r0, _080BA590 @ =sub_80BA65C
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA580: .4byte gTasks
_080BA584: .4byte 0x0000015d
_080BA588: .4byte gBGMNames
_080BA58C: .4byte gSENames
_080BA590: .4byte sub_80BA65C
	thumb_func_end sub_80BA384

	thumb_func_start sub_80BA400
sub_80BA400: @ 80BA594
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080BA5BC @ =gMain
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BA5C8
	ldr r0, _080BA5C0 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA5C4 @ =sub_80BA800
	str r0, [r1]
	b _080BA7E0
	.align 2, 0
_080BA5BC: .4byte gMain
_080BA5C0: .4byte gTasks
_080BA5C4: .4byte sub_80BA800
_080BA5C8:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080BA5EC
	ldr r0, _080BA5E4 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA5E8 @ =sub_80BAF84
	str r0, [r1]
	b _080BA7E0
	.align 2, 0
_080BA5E4: .4byte gTasks
_080BA5E8: .4byte sub_80BAF84
_080BA5EC:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080BA60C
	ldr r0, _080BA604 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA608 @ =sub_80BB25C
	str r0, [r1]
	b _080BA7E0
	.align 2, 0
_080BA604: .4byte gTasks
_080BA608: .4byte sub_80BB25C
_080BA60C:
	movs r6, 0x1
	movs r5, 0x1
	ands r5, r1
	cmp r5, 0
	beq _080BA6CC
	ldr r0, _080BA640 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r5, r1, r0
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080BA664
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080BA64E
	movs r3, 0xC
	ldrsh r4, [r5, r3]
	cmp r4, 0
	beq _080BA644
	ldrh r0, [r5, 0x10]
	bl m4aSongNumStop
	b _080BA658
	.align 2, 0
_080BA640: .4byte gTasks
_080BA644:
	ldrh r0, [r5, 0x10]
	bl m4aSongNumStop
	strh r4, [r5, 0x10]
	b _080BA7E0
_080BA64E:
	movs r4, 0xC
	ldrsh r0, [r5, r4]
	cmp r0, 0
	bne _080BA658
	b _080BA7E0
_080BA658:
	ldrh r0, [r5, 0xC]
	bl m4aSongNumStart
	ldrh r0, [r5, 0xC]
	strh r0, [r5, 0x10]
	b _080BA7E0
_080BA664:
	ldrh r1, [r5, 0xE]
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	beq _080BA6A8
	movs r3, 0xA
	ldrsh r4, [r5, r3]
	cmp r4, 0
	beq _080BA694
	ldr r0, _080BA690 @ =0x0000015d
	adds r4, r0, 0
	adds r0, r1, r4
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStop
	ldrh r1, [r5, 0xA]
	adds r4, r1
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	b _080BA6BC
	.align 2, 0
_080BA690: .4byte 0x0000015d
_080BA694:
	ldr r2, _080BA6A4 @ =0x0000015d
	adds r0, r1, r2
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStop
	strh r4, [r5, 0xE]
	b _080BA7E0
	.align 2, 0
_080BA6A4: .4byte 0x0000015d
_080BA6A8:
	ldrh r1, [r5, 0xA]
	movs r3, 0xA
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _080BA6B4
	b _080BA7E0
_080BA6B4:
	ldr r4, _080BA6C8 @ =0x0000015d
	adds r0, r1, r4
	lsls r0, 16
	lsrs r0, 16
_080BA6BC:
	bl m4aSongNumStart
	ldrh r0, [r5, 0xA]
	strh r0, [r5, 0xE]
	b _080BA7E0
	.align 2, 0
_080BA6C8: .4byte 0x0000015d
_080BA6CC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BA704
	movs r0, 0x5
	bl m4aSongNumStart
	movs r0, 0x1
	negs r0, r0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080BA6FC @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BA700 @ =sub_80BA68C
	str r1, [r0]
	b _080BA7E0
	.align 2, 0
_080BA6FC: .4byte gTasks
_080BA700: .4byte sub_80BA68C
_080BA704:
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080BA716
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BA730
_080BA716:
	ldr r0, _080BA72C @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	eors r0, r6
	strh r0, [r1, 0x8]
_080BA726:
	movs r0, 0x1
	b _080BA7E2
	.align 2, 0
_080BA72C: .4byte gTasks
_080BA730:
	movs r0, 0x10
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080BA77E
	ldr r0, _080BA760 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080BA76A
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080BA764
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080BA726
	.align 2, 0
_080BA760: .4byte gTasks
_080BA764:
	movs r0, 0xF7
	strh r0, [r1, 0xC]
	b _080BA726
_080BA76A:
	ldrh r2, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0
	ble _080BA778
	subs r0, r2, 0x1
	b _080BA77A
_080BA778:
	movs r0, 0x75
_080BA77A:
	strh r0, [r1, 0xA]
	b _080BA726
_080BA77E:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BA7C4
	ldr r1, _080BA7A8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x8
	ldrsh r2, [r1, r0]
	cmp r2, 0
	beq _080BA7B0
	ldrh r2, [r1, 0xC]
	movs r4, 0xC
	ldrsh r0, [r1, r4]
	cmp r0, 0xF6
	bgt _080BA7AC
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080BA726
	.align 2, 0
_080BA7A8: .4byte gTasks
_080BA7AC:
	strh r3, [r1, 0xC]
	b _080BA726
_080BA7B0:
	ldrh r3, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0x74
	bgt _080BA7C0
	adds r0, r3, 0x1
	strh r0, [r1, 0xA]
	b _080BA726
_080BA7C0:
	strh r2, [r1, 0xA]
	b _080BA726
_080BA7C4:
	ldrh r1, [r2, 0x2C]
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080BA7DC
	ldr r0, _080BA7D8 @ =gUnknown_020387B0
	strb r6, [r0]
	b _080BA7E0
	.align 2, 0
_080BA7D8: .4byte gUnknown_020387B0
_080BA7DC:
	ldr r0, _080BA7EC @ =gUnknown_020387B0
	strb r1, [r0]
_080BA7E0:
	movs r0, 0
_080BA7E2:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BA7EC: .4byte gUnknown_020387B0
	thumb_func_end sub_80BA400

	thumb_func_start sub_80BA65C
sub_80BA65C: @ 80BA7F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80BA400
	lsls r0, 24
	cmp r0, 0
	beq _080BA810
	ldr r0, _080BA818 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080BA81C @ =sub_80BA384
	str r0, [r1]
_080BA810:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BA818: .4byte gTasks
_080BA81C: .4byte sub_80BA384
	thumb_func_end sub_80BA65C

	thumb_func_start sub_80BA68C
sub_80BA68C: @ 80BA820
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080BA844 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BA83E
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080BA848 @ =CB2_InitTitleScreen
	bl SetMainCallback2
_080BA83E:
	pop {r0}
	bx r0
	.align 2, 0
_080BA844: .4byte gPaletteFade
_080BA848: .4byte CB2_InitTitleScreen
	thumb_func_end sub_80BA68C

	thumb_func_start sub_80BA6B8
sub_80BA6B8: @ 80BA84C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080BA85A
	cmp r0, 0x1
	beq _080BA874
_080BA85A:
	ldr r1, _080BA868 @ =0x04000042
	ldr r2, _080BA86C @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA870 @ =0x00002957
	b _080BA880
	.align 2, 0
_080BA868: .4byte 0x04000042
_080BA86C: .4byte 0x000011df
_080BA870: .4byte 0x00002957
_080BA874:
	ldr r1, _080BA888 @ =0x04000042
	ldr r2, _080BA88C @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BA890 @ =0x0000618f
_080BA880:
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BA888: .4byte 0x04000042
_080BA88C: .4byte 0x000011df
_080BA890: .4byte 0x0000618f
	thumb_func_end sub_80BA6B8

	thumb_func_start sub_80BA700
sub_80BA700: @ 80BA894
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	movs r1, 0
	movs r2, 0
_080BA8A8:
	mov r3, sp
	adds r0, r3, r1
	strb r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _080BA8A8
	mov r1, sp
	movs r0, 0xB0
	strb r0, [r1, 0x3]
	movs r0, 0xFF
	strb r0, [r1, 0x4]
	movs r4, 0
	adds r0, r5, 0
	movs r1, 0x64
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080BA8DC
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1]
	movs r4, 0x1
_080BA8DC:
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _080BA8FA
	cmp r4, 0
	beq _080BA900
_080BA8FA:
	mov r1, sp
	adds r0, 0xA1
	strb r0, [r1, 0x1]
_080BA900:
	mov r4, sp
	adds r0, r5, 0
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r0, 0xA1
	strb r0, [r4, 0x2]
	lsls r1, r6, 24
	lsrs r1, 24
	lsls r2, r7, 24
	lsrs r2, 24
	mov r0, sp
	bl MenuPrint
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA700

	thumb_func_start sub_80BA79C
sub_80BA79C: @ 80BA930
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	movs r3, 0
	movs r1, 0
_080BA942:
	mov r2, sp
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bls _080BA942
	mov r0, sp
	movs r1, 0xFF
	strb r1, [r0, 0xA]
	movs r3, 0
	ldrb r0, [r4]
	lsls r2, r6, 24
	lsls r5, 24
	cmp r0, 0xFF
	beq _080BA980
_080BA964:
	mov r0, sp
	adds r1, r0, r3
	adds r0, r4, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _080BA980
	cmp r3, 0x9
	bls _080BA964
_080BA980:
	lsrs r1, r2, 24
	lsrs r2, r5, 24
	mov r0, sp
	bl MenuPrint
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BA79C

	thumb_func_start sub_80BA800
sub_80BA800: @ 80BA994
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xCC
	lsls r0, 24
	str r0, [sp, 0xB0]
	lsrs r2, r0, 24
	str r2, [sp, 0xAC]
	ldr r1, _080BAB7C @ =gUnknown_083D0312
	mov r0, sp
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0xC
	str r0, [sp, 0xB4]
	ldr r1, _080BAB80 @ =gUnknown_083D031C
	movs r2, 0xB
	bl memcpy
	mov r2, sp
	adds r2, 0x18
	str r2, [sp, 0xB8]
	ldr r1, _080BAB84 @ =gDebugText_Voice
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0x24
	str r0, [sp, 0xBC]
	ldr r1, _080BAB88 @ =gDebugText_Volume
	movs r2, 0xA
	bl memcpy
	mov r2, sp
	adds r2, 0x30
	str r2, [sp, 0xC0]
	ldr r1, _080BAB8C @ =gDebugText_Panpot
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	mov r0, sp
	adds r0, 0x3C
	str r0, [sp, 0xC4]
	ldr r1, _080BAB90 @ =gDebugText_Pitch
	movs r2, 0xA
	bl memcpy
	mov r2, sp
	adds r2, 0x48
	str r2, [sp, 0xC8]
	ldr r1, _080BAB94 @ =gDebugText_Length
	adds r0, r2, 0
	movs r2, 0xA
	bl memcpy
	add r4, sp, 0x54
	ldr r1, _080BAB98 @ =gDebugText_Release
	adds r0, r4, 0
	movs r2, 0xA
	bl memcpy
	add r7, sp, 0x60
	ldr r1, _080BAB9C @ =gDebugText_Progress
	adds r0, r7, 0
	movs r2, 0xA
	bl memcpy
	add r0, sp, 0x6C
	mov r10, r0
	ldr r1, _080BABA0 @ =gDebugText_Chorus
	movs r2, 0xA
	bl memcpy
	add r2, sp, 0x78
	mov r9, r2
	ldr r1, _080BABA4 @ =gDebugText_Priority
	mov r0, r9
	movs r2, 0xA
	bl memcpy
	add r0, sp, 0x84
	mov r8, r0
	ldr r1, _080BABA8 @ =gUnknown_083D0381
	movs r2, 0x9
	bl memcpy
	add r6, sp, 0x90
	ldr r1, _080BABAC @ =gUnknown_083D038A
	adds r0, r6, 0
	movs r2, 0x9
	bl memcpy
	add r5, sp, 0x9C
	ldr r1, _080BABB0 @ =gUnknown_083D0393
	adds r0, r5, 0
	movs r2, 0x9
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x13
	movs r2, 0x4
	bl MenuPrint
	ldr r0, [sp, 0xB4]
	movs r1, 0x13
	movs r2, 0x2
	bl MenuPrint
	ldr r0, [sp, 0xB8]
	movs r1, 0x2
	movs r2, 0x1
	bl MenuPrint
	ldr r0, [sp, 0xBC]
	movs r1, 0x2
	movs r2, 0x3
	bl MenuPrint
	ldr r0, [sp, 0xC0]
	movs r1, 0x2
	movs r2, 0x5
	bl MenuPrint
	ldr r0, [sp, 0xC4]
	movs r1, 0x2
	movs r2, 0x7
	bl MenuPrint
	ldr r0, [sp, 0xC8]
	movs r1, 0x2
	movs r2, 0x9
	bl MenuPrint
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xB
	bl MenuPrint
	adds r0, r7, 0
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	mov r0, r10
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	mov r0, r9
	movs r1, 0x2
	movs r2, 0x11
	bl MenuPrint
	mov r0, r8
	movs r1, 0x13
	movs r2, 0x10
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x13
	movs r2, 0xE
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x13
	movs r2, 0xC
	bl MenuPrint
	ldr r1, _080BABB4 @ =0x04000040
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	ldr r0, _080BABB8 @ =gUnknown_020387B3
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080BABBC @ =gUnknown_020387B1
	strb r1, [r0]
	ldr r0, _080BABC0 @ =gUnknown_020387B2
	strb r1, [r0]
	ldr r0, _080BABC4 @ =gUnknown_03005D30
	movs r2, 0
	str r2, [r0]
	ldr r0, _080BABC8 @ =gUnknown_020387D8
	strb r2, [r0]
	ldr r1, _080BABCC @ =gUnknown_020387D9
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080BABD0 @ =gUnknown_020387B4
	str r2, [r0]
	movs r1, 0x78
	str r1, [r0, 0x4]
	str r2, [r0, 0x8]
	movs r1, 0xF0
	lsls r1, 6
	str r1, [r0, 0xC]
	movs r1, 0xB4
	str r1, [r0, 0x10]
	str r2, [r0, 0x18]
	str r2, [r0, 0x14]
	str r2, [r0, 0x1C]
	movs r1, 0x2
	str r1, [r0, 0x20]
	bl sub_80BAD5C
	movs r0, 0
	movs r1, 0
	bl sub_80BAE10
	ldr r1, _080BABD4 @ =gTasks
	ldr r2, [sp, 0xAC]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BABD8 @ =sub_80BAA48
	str r1, [r0]
	add sp, 0xCC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BAB7C: .4byte gUnknown_083D0312
_080BAB80: .4byte gUnknown_083D031C
_080BAB84: .4byte gDebugText_Voice
_080BAB88: .4byte gDebugText_Volume
_080BAB8C: .4byte gDebugText_Panpot
_080BAB90: .4byte gDebugText_Pitch
_080BAB94: .4byte gDebugText_Length
_080BAB98: .4byte gDebugText_Release
_080BAB9C: .4byte gDebugText_Progress
_080BABA0: .4byte gDebugText_Chorus
_080BABA4: .4byte gDebugText_Priority
_080BABA8: .4byte gUnknown_083D0381
_080BABAC: .4byte gUnknown_083D038A
_080BABB0: .4byte gUnknown_083D0393
_080BABB4: .4byte 0x04000040
_080BABB8: .4byte gUnknown_020387B3
_080BABBC: .4byte gUnknown_020387B1
_080BABC0: .4byte gUnknown_020387B2
_080BABC4: .4byte gUnknown_03005D30
_080BABC8: .4byte gUnknown_020387D8
_080BABCC: .4byte gUnknown_020387D9
_080BABD0: .4byte gUnknown_020387B4
_080BABD4: .4byte gTasks
_080BABD8: .4byte sub_80BAA48
	thumb_func_end sub_80BA800

	thumb_func_start sub_80BAA48
sub_80BAA48: @ 80BABDC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BAC24 @ =gMain
	ldrh r2, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _080BAC3C
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BAC28 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BAC2C @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BAC30 @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BAC34 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BAC38 @ =sub_80BA258
	str r1, [r0]
	b _080BAE5A
	.align 2, 0
_080BAC24: .4byte gMain
_080BAC28: .4byte 0x00007140
_080BAC2C: .4byte 0x000011df
_080BAC30: .4byte 0x0000011f
_080BAC34: .4byte gTasks
_080BAC38: .4byte sub_80BA258
_080BAC3C:
	ldrh r1, [r1, 0x30]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0
	beq _080BAC64
	ldr r1, _080BAC60 @ =gUnknown_020387B3
	ldrb r2, [r1]
	subs r0, r2, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _080BAC7E
	movs r0, 0x8
	strb r0, [r1]
	b _080BAC7E
	.align 2, 0
_080BAC60: .4byte gUnknown_020387B3
_080BAC64:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BAC8C
	ldr r1, _080BAC88 @ =gUnknown_020387B3
	ldrb r2, [r1]
	adds r0, r2, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x8
	ble _080BAC7E
	strb r3, [r1]
_080BAC7E:
	ldrb r1, [r1]
	adds r0, r2, 0
	bl sub_80BAE10
	b _080BAE5A
	.align 2, 0
_080BAC88: .4byte gUnknown_020387B3
_080BAC8C:
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080BACA8
	ldr r0, _080BACA4 @ =gUnknown_020387D8
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	bl sub_80BAD5C
	b _080BAE5A
	.align 2, 0
_080BACA4: .4byte gUnknown_020387D8
_080BACA8:
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _080BACCC
	ldr r4, _080BACC8 @ =gUnknown_020387D9
	ldrb r0, [r4]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r4]
	bl sub_80BAD5C
	ldrb r0, [r4]
	bl SetPokemonCryStereo
	b _080BAE5A
	.align 2, 0
_080BACC8: .4byte gUnknown_020387D9
_080BACCC:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BACDA
	movs r0, 0xA
	b _080BAD02
_080BACDA:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _080BACEA
	movs r0, 0xA
	negs r0, r0
	b _080BAD02
_080BACEA:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BACF8
	movs r0, 0x1
	negs r0, r0
	b _080BAD02
_080BACF8:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080BAD0C
	movs r0, 0x1
_080BAD02:
	bl sub_80BACDC
	bl sub_80BAD5C
	b _080BAE5A
_080BAD0C:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	bne _080BAD16
	b _080BAE36
_080BAD16:
	ldr r4, _080BAD78 @ =gUnknown_020387B4
	ldrb r0, [r4, 0x4]
	bl SetPokemonCryVolume
	movs r0, 0x8
	ldrsb r0, [r4, r0]
	bl SetPokemonCryPanpot
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	bl SetPokemonCryPitch
	ldrh r0, [r4, 0x10]
	bl SetPokemonCryLength
	ldr r0, [r4, 0x18]
	bl SetPokemonCryProgress
	ldrb r0, [r4, 0x14]
	bl SetPokemonCryRelease
	movs r0, 0x1C
	ldrsb r0, [r4, r0]
	bl SetPokemonCryChorus
	ldr r0, [r4, 0x20]
	lsls r0, 24
	lsrs r0, 24
	bl SetPokemonCryPriority
	ldr r4, [r4]
	adds r0, r4, 0
	cmp r4, 0
	bge _080BAD5C
	adds r0, 0x7F
_080BAD5C:
	asrs r2, r0, 7
	lsls r0, r2, 7
	subs r0, r4, r0
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r2, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BADB0
	cmp r0, 0x1
	bgt _080BAD7C
	cmp r0, 0
	beq _080BAD86
	b _080BAE36
	.align 2, 0
_080BAD78: .4byte gUnknown_020387B4
_080BAD7C:
	cmp r0, 0x2
	beq _080BADDC
	cmp r0, 0x3
	beq _080BAE08
	b _080BAE36
_080BAD86:
	ldr r0, _080BAD98 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BADA0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAD9C @ =voicegroup_84537C0
	b _080BAE2C
	.align 2, 0
_080BAD98: .4byte gUnknown_020387D8
_080BAD9C: .4byte voicegroup_84537C0
_080BADA0:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BADAC @ =voicegroup_8452590
	b _080BAE2C
	.align 2, 0
_080BADAC: .4byte voicegroup_8452590
_080BADB0:
	ldr r0, _080BADC4 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BADCC
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BADC8 @ =voicegroup_8453DC0
	b _080BAE2C
	.align 2, 0
_080BADC4: .4byte gUnknown_020387D8
_080BADC8: .4byte voicegroup_8453DC0
_080BADCC:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BADD8 @ =voicegroup_8452B90
	b _080BAE2C
	.align 2, 0
_080BADD8: .4byte voicegroup_8452B90
_080BADDC:
	ldr r0, _080BADF0 @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BADF8
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BADF4 @ =voicegroup_84543C0
	b _080BAE2C
	.align 2, 0
_080BADF0: .4byte gUnknown_020387D8
_080BADF4: .4byte voicegroup_84543C0
_080BADF8:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAE04 @ =voicegroup_8453190
	b _080BAE2C
	.align 2, 0
_080BAE04: .4byte voicegroup_8453190
_080BAE08:
	ldr r0, _080BAE1C @ =gUnknown_020387D8
	ldrb r0, [r0]
	cmp r0, 0
	beq _080BAE24
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAE20 @ =voicegroup_84549C0
	b _080BAE2C
	.align 2, 0
_080BAE1C: .4byte gUnknown_020387D8
_080BAE20: .4byte voicegroup_84549C0
_080BAE24:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BAE60 @ =voicegroup_8453790
_080BAE2C:
	adds r0, r1
	bl SetPokemonCryTone
	ldr r1, _080BAE64 @ =gUnknown_03005D30
	str r0, [r1]
_080BAE36:
	ldr r0, _080BAE64 @ =gUnknown_03005D30
	ldr r0, [r0]
	cmp r0, 0
	beq _080BAE5A
	ldr r5, _080BAE68 @ =gUnknown_020387B1
	bl IsPokemonCryPlaying
	strb r0, [r5]
	ldr r4, _080BAE6C @ =gUnknown_020387B2
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r4]
	cmp r0, r2
	beq _080BAE56
	bl sub_80BAD5C
_080BAE56:
	ldrb r0, [r5]
	strb r0, [r4]
_080BAE5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BAE60: .4byte voicegroup_8453790
_080BAE64: .4byte gUnknown_03005D30
_080BAE68: .4byte gUnknown_020387B1
_080BAE6C: .4byte gUnknown_020387B2
	thumb_func_end sub_80BAA48

	thumb_func_start sub_80BACDC
sub_80BACDC: @ 80BAE70
	push {r4-r6,lr}
	sub sp, 0x40
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080BAEE4 @ =gUnknown_083D039C
	mov r0, sp
	movs r2, 0x40
	bl memcpy
	ldr r6, _080BAEE8 @ =gUnknown_020387B4
	ldr r5, _080BAEEC @ =gUnknown_020387B3
	movs r1, 0
	ldrsb r1, [r5, r1]
	lsls r1, 2
	adds r1, r6
	lsls r4, 24
	asrs r4, 24
	ldr r0, [r1]
	adds r0, r4
	str r0, [r1]
	movs r2, 0
	ldrsb r2, [r5, r2]
	lsls r0, r2, 2
	adds r3, r0, r6
	lsls r0, r2, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	ble _080BAEBA
	lsls r0, r2, 3
	add r0, sp
	ldr r0, [r0]
	str r0, [r3]
_080BAEBA:
	movs r2, 0
	ldrsb r2, [r5, r2]
	lsls r0, r2, 2
	adds r3, r0, r6
	lsls r0, r2, 3
	add r0, sp
	ldr r1, [r3]
	ldr r0, [r0]
	cmp r1, r0
	bge _080BAEDA
	lsls r0, r2, 1
	adds r0, 0x1
	lsls r0, 2
	add r0, sp
	ldr r0, [r0]
	str r0, [r3]
_080BAEDA:
	add sp, 0x40
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BAEE4: .4byte gUnknown_083D039C
_080BAEE8: .4byte gUnknown_020387B4
_080BAEEC: .4byte gUnknown_020387B3
	thumb_func_end sub_80BACDC

	thumb_func_start sub_80BAD5C
sub_80BAD5C: @ 80BAEF0
	push {r4,lr}
	ldr r4, _080BAF94 @ =gUnknown_020387B4
	ldr r0, [r4]
	adds r0, 0x1
	movs r1, 0xB
	movs r2, 0x1
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x4]
	movs r1, 0xB
	movs r2, 0x3
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x8]
	movs r1, 0xB
	movs r2, 0x5
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0xC]
	movs r1, 0xB
	movs r2, 0x7
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x10]
	movs r1, 0xB
	movs r2, 0x9
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x14]
	movs r1, 0xB
	movs r2, 0xB
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x18]
	movs r1, 0xB
	movs r2, 0xD
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x1C]
	movs r1, 0xB
	movs r2, 0xF
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, [r4, 0x20]
	movs r1, 0xB
	movs r2, 0x11
	movs r3, 0x5
	bl sub_80BAE78
	ldr r0, _080BAF98 @ =gUnknown_020387B1
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0x10
	movs r3, 0x1
	bl sub_80BAE78
	ldr r0, _080BAF9C @ =gUnknown_020387D8
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0xE
	movs r3, 0x1
	bl sub_80BAE78
	ldr r0, _080BAFA0 @ =gUnknown_020387D9
	ldrb r0, [r0]
	movs r1, 0x1B
	movs r2, 0xC
	movs r3, 0x1
	bl sub_80BAE78
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BAF94: .4byte gUnknown_020387B4
_080BAF98: .4byte gUnknown_020387B1
_080BAF9C: .4byte gUnknown_020387D8
_080BAFA0: .4byte gUnknown_020387D9
	thumb_func_end sub_80BAD5C

	thumb_func_start sub_80BAE10
sub_80BAE10: @ 80BAFA4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _080BB000 @ =gUnknown_083D03DC
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _080BB004 @ =gUnknown_083D03DE
	movs r2, 0x2
	bl memcpy
	ldr r6, _080BB008 @ =gUnknown_083D0300
	lsls r4, 1
	adds r0, r4, r6
	ldrb r1, [r0]
	adds r4, 0x1
	adds r4, r6
	ldrb r2, [r4]
	mov r0, r8
	bl MenuPrint
	lsls r5, 1
	adds r0, r5, r6
	ldrb r1, [r0]
	adds r5, 0x1
	adds r5, r6
	ldrb r2, [r5]
	mov r0, sp
	bl MenuPrint
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB000: .4byte gUnknown_083D03DC
_080BB004: .4byte gUnknown_083D03DE
_080BB008: .4byte gUnknown_083D0300
	thumb_func_end sub_80BAE10

	thumb_func_start sub_80BAE78
sub_80BAE78: @ 80BB00C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	mov r8, r0
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	mov r1, sp
	ldr r0, _080BB114 @ =gUnknown_083D03E0
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	ldm r0!, {r3-r5}
	stm r1!, {r3-r5}
	movs r5, 0
	add r0, sp, 0x18
	mov r9, r0
	cmp r5, r7
	bgt _080BB054
	mov r4, r9
	movs r3, 0
_080BB040:
	lsls r0, r5, 24
	asrs r0, 24
	adds r1, r4, r0
	strb r3, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	asrs r0, 24
	cmp r0, r7
	ble _080BB040
_080BB054:
	adds r0, r7, 0x1
	add r0, r9
	movs r1, 0xFF
	strb r1, [r0]
	movs r1, 0
	mov r3, r8
	cmp r3, 0
	bge _080BB06A
	negs r3, r3
	mov r8, r3
	movs r1, 0x1
_080BB06A:
	movs r4, 0
	mov r10, r4
	cmp r7, 0x1
	bne _080BB076
	movs r5, 0x1
	mov r10, r5
_080BB076:
	subs r0, r7, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 24
	lsls r6, 24
	str r6, [sp, 0x24]
	lsls r2, 24
	str r2, [sp, 0x28]
	cmp r0, 0
	blt _080BB0F6
	str r1, [sp, 0x20]
_080BB08C:
	asrs r6, r0, 24
	lsls r0, r6, 2
	add r0, sp
	ldr r1, [r0]
	mov r0, r8
	bl __divsi3
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r0, 0
	bne _080BB0AE
	mov r0, r10
	cmp r0, 0
	bne _080BB0AE
	lsls r4, r5, 24
	cmp r6, 0
	bne _080BB0DA
_080BB0AE:
	lsls r4, r5, 24
	ldr r3, [sp, 0x20]
	cmp r3, 0
	beq _080BB0C8
	mov r5, r10
	cmp r5, 0
	bne _080BB0C8
	asrs r0, r4, 24
	subs r0, r7, r0
	subs r0, 0x1
	add r0, r9
	movs r1, 0xAE
	strb r1, [r0]
_080BB0C8:
	asrs r1, r4, 24
	subs r1, r7, r1
	add r1, r9
	lsls r0, r2, 24
	asrs r0, 24
	subs r0, 0x5F
	strb r0, [r1]
	movs r0, 0x1
	mov r10, r0
_080BB0DA:
	asrs r4, 24
	lsls r0, r4, 2
	add r0, sp
	ldr r1, [r0]
	mov r0, r8
	bl __modsi3
	mov r8, r0
	subs r4, 0x1
	lsls r4, 24
	lsrs r5, r4, 24
	lsls r0, r5, 24
	cmp r0, 0
	bge _080BB08C
_080BB0F6:
	ldr r3, [sp, 0x24]
	lsrs r1, r3, 24
	ldr r4, [sp, 0x28]
	lsrs r2, r4, 24
	mov r0, r9
	bl MenuPrint
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB114: .4byte gUnknown_083D03E0
	thumb_func_end sub_80BAE78

	thumb_func_start sub_80BAF84
sub_80BAF84: @ 80BB118
	push {r4-r6,lr}
	sub sp, 0x14
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080BB1B0 @ =gOtherText_SE
	mov r0, sp
	movs r2, 0x3
	bl memcpy
	add r6, sp, 0x4
	ldr r1, _080BB1B4 @ =gOtherText_Pan
	adds r0, r6, 0
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _080BB1B8 @ =gUnknown_083D0381
	adds r0, r5, 0
	movs r2, 0x9
	bl memcpy
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xC5
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x3
	movs r2, 0x2
	bl MenuPrint
	adds r0, r6, 0
	movs r1, 0x3
	movs r2, 0x4
	bl MenuPrint
	adds r0, r5, 0
	movs r1, 0x3
	movs r2, 0x8
	bl MenuPrint
	ldr r1, _080BB1BC @ =0x04000040
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x4
	movs r0, 0xA0
	strh r0, [r1]
	ldr r1, _080BB1C0 @ =gUnknown_020387B4
	movs r0, 0x1
	str r0, [r1]
	movs r0, 0
	str r0, [r1, 0x8]
	str r0, [r1, 0x1C]
	str r0, [r1, 0x18]
	str r0, [r1, 0x14]
	bl sub_80BB1D4
	ldr r1, _080BB1C4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB1C8 @ =sub_80BB038
	str r1, [r0]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB1B0: .4byte gOtherText_SE
_080BB1B4: .4byte gOtherText_Pan
_080BB1B8: .4byte gUnknown_083D0381
_080BB1BC: .4byte 0x04000040
_080BB1C0: .4byte gUnknown_020387B4
_080BB1C4: .4byte gTasks
_080BB1C8: .4byte sub_80BB038
	thumb_func_end sub_80BAF84

	thumb_func_start sub_80BB038
sub_80BB038: @ 80BB1CC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_80BB1D4
	ldr r2, _080BB1EC @ =gUnknown_020387B4
	ldr r0, [r2, 0x18]
	cmp r0, 0
	beq _080BB236
	ldr r0, [r2, 0x14]
	cmp r0, 0
	beq _080BB1F0
	subs r0, 0x1
	str r0, [r2, 0x14]
	b _080BB236
	.align 2, 0
_080BB1EC: .4byte gUnknown_020387B4
_080BB1F0:
	ldr r0, _080BB21C @ =gUnknown_083D03F8
	ldr r1, [r2, 0x8]
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB220
	cmp r1, 0x7F
	bne _080BB236
	ldr r0, [r2, 0x1C]
	adds r0, 0x2
	str r0, [r2, 0x1C]
	cmp r0, 0x3E
	bgt _080BB236
	lsls r0, 24
	asrs r0, 24
	bl SE12PanpotControl
	b _080BB236
	.align 2, 0
_080BB21C: .4byte gUnknown_083D03F8
_080BB220:
	ldr r0, [r2, 0x1C]
	subs r1, r0, 0x2
	str r1, [r2, 0x1C]
	movs r0, 0x40
	negs r0, r0
	cmp r1, r0
	ble _080BB236
	lsls r0, r1, 24
	asrs r0, 24
	bl SE12PanpotControl
_080BB236:
	ldr r1, _080BB280 @ =gMain
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r1, 0
	cmp r4, 0
	beq _080BB298
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BB284 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BB288 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BB28C @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BB290 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB294 @ =sub_80BA258
	str r1, [r0]
	b _080BB35C
	.align 2, 0
_080BB280: .4byte gMain
_080BB284: .4byte 0x00007140
_080BB288: .4byte 0x000011df
_080BB28C: .4byte 0x0000011f
_080BB290: .4byte gTasks
_080BB294: .4byte sub_80BA258
_080BB298:
	movs r6, 0x1
	adds r2, r6, 0
	ands r2, r3
	cmp r2, 0
	beq _080BB2F2
	ldr r0, _080BB2CC @ =gUnknown_083D03F8
	ldr r5, _080BB2D0 @ =gUnknown_020387B4
	ldr r1, [r5, 0x8]
	adds r1, r0
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB2D4
	cmp r1, 0x7F
	bne _080BB2E8
	ldrh r0, [r5]
	movs r4, 0x40
	negs r4, r4
	adds r1, r4, 0
	bl PlaySE12WithPanning
	str r4, [r5, 0x1C]
	b _080BB2E0
	.align 2, 0
_080BB2CC: .4byte gUnknown_083D03F8
_080BB2D0: .4byte gUnknown_020387B4
_080BB2D4:
	ldrh r0, [r5]
	movs r1, 0x3F
	bl PlaySE12WithPanning
	movs r0, 0x3F
	str r0, [r5, 0x1C]
_080BB2E0:
	str r6, [r5, 0x18]
	movs r0, 0x1E
	str r0, [r5, 0x14]
	b _080BB35C
_080BB2E8:
	ldrh r0, [r5]
	bl PlaySE12WithPanning
	str r4, [r5, 0x18]
	b _080BB35C
_080BB2F2:
	movs r0, 0x80
	lsls r0, 2
	ands r0, r3
	cmp r0, 0
	beq _080BB30A
	ldr r1, _080BB340 @ =gUnknown_020387B4
	ldr r0, [r1, 0x8]
	adds r0, 0x1
	str r0, [r1, 0x8]
	cmp r0, 0x4
	ble _080BB30A
	str r2, [r1, 0x8]
_080BB30A:
	ldrh r1, [r7, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BB326
	ldr r1, _080BB340 @ =gUnknown_020387B4
	ldr r0, [r1, 0x8]
	subs r0, 0x1
	str r0, [r1, 0x8]
	cmp r0, 0
	bge _080BB326
	movs r0, 0x4
	str r0, [r1, 0x8]
_080BB326:
	ldrh r1, [r7, 0x30]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080BB344
	ldr r1, _080BB340 @ =gUnknown_020387B4
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xF7
	ble _080BB35C
	movs r0, 0
	b _080BB35A
	.align 2, 0
_080BB340: .4byte gUnknown_020387B4
_080BB344:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080BB35C
	ldr r1, _080BB364 @ =gUnknown_020387B4
	ldr r0, [r1]
	subs r0, 0x1
	str r0, [r1]
	cmp r0, 0
	bge _080BB35C
	movs r0, 0xF7
_080BB35A:
	str r0, [r1]
_080BB35C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BB364: .4byte gUnknown_020387B4
	thumb_func_end sub_80BB038

	thumb_func_start sub_80BB1D4
sub_80BB1D4: @ 80BB368
	push {r4,r5,lr}
	sub sp, 0x10
	ldr r1, _080BB3AC @ =gOtherText_LR
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _080BB3B0 @ =gOtherText_RL
	adds r0, r5, 0
	movs r2, 0x5
	bl memcpy
	ldr r4, _080BB3B4 @ =gUnknown_020387B4
	ldr r0, [r4]
	movs r1, 0x7
	movs r2, 0x2
	movs r3, 0x3
	bl sub_80BAE78
	ldr r1, _080BB3B8 @ =gUnknown_083D03F8
	ldr r0, [r4, 0x8]
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x80
	negs r0, r0
	cmp r1, r0
	beq _080BB3BC
	cmp r1, 0x7F
	bne _080BB3C8
	mov r0, sp
	b _080BB3BE
	.align 2, 0
_080BB3AC: .4byte gOtherText_LR
_080BB3B0: .4byte gOtherText_RL
_080BB3B4: .4byte gUnknown_020387B4
_080BB3B8: .4byte gUnknown_083D03F8
_080BB3BC:
	adds r0, r5, 0
_080BB3BE:
	movs r1, 0x7
	movs r2, 0x4
	bl MenuPrint
	b _080BB3D4
_080BB3C8:
	adds r0, r1, 0
	movs r1, 0x7
	movs r2, 0x4
	movs r3, 0x3
	bl sub_80BAE78
_080BB3D4:
	bl IsSEPlaying
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0xC
	movs r2, 0x8
	movs r3, 0x1
	bl sub_80BAE78
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB1D4

	thumb_func_start sub_80BB25C
sub_80BB25C: @ 80BB3F0
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BB508 @ =gWindowConfig_81E6C3C
	bl SetUpWindowConfig
	ldr r0, _080BB50C @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	ldr r1, _080BB510 @ =gUnknown_03005D34
	movs r0, 0x1
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	ldr r1, _080BB514 @ =0xffff0000
	ldr r0, [sp, 0x4]
	ands r0, r1
	movs r1, 0x80
	lsls r1, 6
	orrs r0, r1
	ldr r1, _080BB518 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xE8
	lsls r1, 13
	orrs r0, r1
	ldr r1, _080BB51C @ =0x00ffffff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0x4]
	ldr r1, _080BB520 @ =0xffff00ff
	ldr r0, [sp, 0x8]
	ands r0, r1
	movs r1, 0xF0
	lsls r1, 5
	orrs r0, r1
	ldr r1, _080BB524 @ =0xffffff00
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	str r0, [sp, 0x8]
	movs r1, 0
	ldr r0, _080BB528 @ =gUnknown_03005E98
	strb r1, [r0]
	add r4, sp, 0xC
_080BB452:
	add r0, sp, 0x4
	movs r1, 0x3
	bl sub_8119E3C
	lsls r0, 24
	cmp r0, 0
	beq _080BB452
	ldr r1, _080BB514 @ =0xffff0000
	ldr r0, [sp, 0xC]
	ands r0, r1
	ldr r1, _080BB518 @ =0xff00ffff
	ands r0, r1
	movs r1, 0xF0
	lsls r1, 12
	orrs r0, r1
	ldr r1, _080BB51C @ =0x00ffffff
	ands r0, r1
	movs r1, 0xD0
	lsls r1, 20
	orrs r0, r1
	str r0, [sp, 0xC]
	ldr r1, _080BB524 @ =0xffffff00
	ldr r0, [r4, 0x4]
	ands r0, r1
	movs r1, 0xC
	orrs r0, r1
	ldr r1, _080BB520 @ =0xffff00ff
	ands r0, r1
	movs r1, 0xC0
	lsls r1, 4
	orrs r0, r1
	str r0, [r4, 0x4]
	movs r1, 0
	ldr r0, _080BB528 @ =gUnknown_03005E98
	strb r1, [r0]
	lsls r5, r6, 2
_080BB49A:
	adds r0, r4, 0
	movs r1, 0x2
	bl ShowPokedexCryScreen
	lsls r0, 24
	cmp r0, 0
	beq _080BB49A
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x5
	movs r3, 0x13
	bl MenuDrawTextWindow
	bl sub_80BB494
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _080BB52C @ =0x04000018
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _080BB530 @ =0x0400000c
	ldr r2, _080BB534 @ =0x00000f01
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080BB538 @ =0x00001d03
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xE
	adds r2, 0x3D
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _080BB53C @ =gMPlay_BGM
	movs r1, 0x2
	bl m4aMPlayFadeOutTemporarily
	ldr r1, _080BB540 @ =gTasks
	adds r0, r5, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB544 @ =sub_80BB3B4
	str r1, [r0]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BB508: .4byte gWindowConfig_81E6C3C
_080BB50C: .4byte gWindowConfig_81E6CE4
_080BB510: .4byte gUnknown_03005D34
_080BB514: .4byte 0xffff0000
_080BB518: .4byte 0xff00ffff
_080BB51C: .4byte 0x00ffffff
_080BB520: .4byte 0xffff00ff
_080BB524: .4byte 0xffffff00
_080BB528: .4byte gUnknown_03005E98
_080BB52C: .4byte 0x04000018
_080BB530: .4byte 0x0400000c
_080BB534: .4byte 0x00000f01
_080BB538: .4byte 0x00001d03
_080BB53C: .4byte gMPlay_BGM
_080BB540: .4byte gTasks
_080BB544: .4byte sub_80BB3B4
	thumb_func_end sub_80BB25C

	thumb_func_start sub_80BB3B4
sub_80BB3B4: @ 80BB548
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x3
	bl sub_8119F88
	ldr r4, _080BB60C @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BB568
	ldr r0, _080BB610 @ =gUnknown_03005D34
	ldrh r0, [r0]
	bl sub_811A050
_080BB568:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _080BB578
	bl StopCryAndClearCrySongs
_080BB578:
	ldrh r1, [r4, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BB59C
	ldr r1, _080BB610 @ =gUnknown_03005D34
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bne _080BB598
	movs r2, 0xC0
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
_080BB598:
	bl sub_80BB494
_080BB59C:
	ldr r0, _080BB60C @ =gMain
	ldrh r1, [r0, 0x30]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BB5C2
	ldr r2, _080BB610 @ =gUnknown_03005D34
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	lsls r0, 16
	movs r1, 0xC0
	lsls r1, 17
	cmp r0, r1
	bls _080BB5BE
	movs r0, 0x1
	strh r0, [r2]
_080BB5BE:
	bl sub_80BB494
_080BB5C2:
	ldr r0, _080BB60C @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BB606
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _080BB614 @ =0x00007140
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x40
	ldr r2, _080BB618 @ =0x000011df
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x4
	ldr r2, _080BB61C @ =0x0000011f
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _080BB620 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BB624 @ =sub_80BA258
	str r1, [r0]
	bl DestroyCryMeterNeedleSprite
_080BB606:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB60C: .4byte gMain
_080BB610: .4byte gUnknown_03005D34
_080BB614: .4byte 0x00007140
_080BB618: .4byte 0x000011df
_080BB61C: .4byte 0x0000011f
_080BB620: .4byte gTasks
_080BB624: .4byte sub_80BA258
	thumb_func_end sub_80BB3B4

	thumb_func_start sub_80BB494
sub_80BB494: @ 80BB628
	push {lr}
	ldr r0, _080BB63C @ =gUnknown_03005D34
	ldrh r0, [r0]
	movs r1, 0x1
	movs r2, 0x11
	movs r3, 0x3
	bl sub_80BAE78
	pop {r0}
	bx r0
	.align 2, 0
_080BB63C: .4byte gUnknown_03005D34
	thumb_func_end sub_80BB494

	.align 2, 0 @ Don't pad with nop.
