	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start nullsub_89
nullsub_89: @ 80AB2FC
	bx lr
	thumb_func_end nullsub_89

	thumb_func_start sub_80AB1B0
sub_80AB1B0: @ 80AB300
	ldr r1, _080AB308
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080AB308: .4byte gUnknown_0203869A
	thumb_func_end sub_80AB1B0

	thumb_func_start sub_80AB1BC
sub_80AB1BC: @ 80AB30C
	push {r4-r6,lr}
	movs r6, 0x80
	lsls r6, 19
	movs r0, 0x40
	strh r0, [r6]
	ldr r4, _080AB3B0
	ldrh r3, [r4]
	movs r2, 0
	strh r2, [r4]
	ldr r5, _080AB3B4
	ldrh r0, [r5]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r5]
	strh r3, [r4]
	ldr r1, _080AB3B8
	movs r0, 0x8
	strh r0, [r1]
	adds r1, 0x4
	movs r3, 0x98
	lsls r3, 8
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080AB3BC
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	movs r3, 0x9C
	lsls r3, 8
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _080AB3C0
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _080AB3C4
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	subs r0, 0xC
	ldr r3, _080AB3C8
	adds r1, r3, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldrh r0, [r6]
	movs r3, 0xFE
	lsls r3, 7
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _080AB3CC
	strh r2, [r0]
	ldr r0, _080AB3D0
	strh r2, [r0]
	ldr r0, _080AB3D4
	strh r2, [r0]
	ldr r0, _080AB3D8
	strh r2, [r0]
	ldr r0, _080AB3DC
	strh r2, [r0]
	ldr r0, _080AB3E0
	strh r2, [r0]
	ldr r0, _080AB3E4
	strh r2, [r0]
	ldr r0, _080AB3E8
	strh r2, [r0]
	ldr r0, _080AB3EC
	strh r2, [r0]
	ldr r0, _080AB3F0
	strh r2, [r0]
	ldr r0, _080AB3F4
	strh r2, [r0]
	ldr r0, _080AB3F8
	strh r2, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB3B0: .4byte 0x04000208
_080AB3B4: .4byte 0x04000200
_080AB3B8: .4byte 0x04000004
_080AB3BC: .4byte 0x00009e09
_080AB3C0: .4byte 0x00003a03
_080AB3C4: .4byte 0x04000050
_080AB3C8: .4byte 0x00003f3f
_080AB3CC: .4byte gUnknown_030042A4
_080AB3D0: .4byte gUnknown_030042A0
_080AB3D4: .4byte gUnknown_030042C0
_080AB3D8: .4byte gUnknown_030041B4
_080AB3DC: .4byte gUnknown_03004288
_080AB3E0: .4byte gUnknown_03004280
_080AB3E4: .4byte gUnknown_030041B0
_080AB3E8: .4byte gUnknown_030041B8
_080AB3EC: .4byte gUnknown_030042C4
_080AB3F0: .4byte gUnknown_03004240
_080AB3F4: .4byte gUnknown_03004200
_080AB3F8: .4byte gUnknown_03004244
	thumb_func_end sub_80AB1BC

	thumb_func_start sub_80AB2AC
sub_80AB2AC: @ 80AB3FC
	push {r4,r5,lr}
	ldr r0, _080AB450
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	ldr r0, _080AB454
	ldr r1, _080AB458
	bl LZDecompressVram
	ldr r0, _080AB45C
	ldr r1, _080AB460
	bl LZDecompressVram
	ldr r0, _080AB464
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadCompressedPalette
	bl sub_80AB350
	movs r4, 0
	movs r5, 0xA0
_080AB42C:
	ldr r0, _080AB468
	adds r0, r5, r0
	ldr r1, _080AB46C
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, 0x5
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	adds r5, 0x20
	adds r4, 0x1
	cmp r4, 0x3
	ble _080AB42C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB450: .4byte gContestMiscGfx
_080AB454: .4byte gContestAudienceGfx
_080AB458: .4byte 0x06002000
_080AB45C: .4byte gUnknown_08D1725C
_080AB460: .4byte 0x0600d000
_080AB464: .4byte gUnknown_08D17144
_080AB468: .4byte 0x02018004
_080AB46C: .4byte gUnknown_02038696
	thumb_func_end sub_80AB2AC

	thumb_func_start sub_80AB320
sub_80AB320: @ 80AB470
	push {r4,lr}
	ldr r4, _080AB490
	adds r0, r4, 0
	bl SetUpWindowConfig
	ldr r0, _080AB494
	adds r1, r4, 0
	bl InitWindowFromConfig
	ldr r0, _080AB498
	ldr r1, _080AB49C
	bl InitWindowFromConfig
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB490: .4byte gWindowConfig_81E6FD8
_080AB494: .4byte gUnknown_03004210
_080AB498: .4byte gMenuWindow
_080AB49C: .4byte gWindowConfig_81E6FF4
	thumb_func_end sub_80AB320

	thumb_func_start sub_80AB350
sub_80AB350: @ 80AB4A0
	push {r4,lr}
	ldr r0, _080AB4DC
	bl LoadFontDefaultPalette
	movs r0, 0
	movs r1, 0
	movs r2, 0x2
	bl FillPalette
	movs r4, 0xA
_080AB4B4:
	adds r1, r4, 0
	adds r1, 0xF0
	ldr r0, _080AB4E0
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xD
	bls _080AB4B4
	ldr r0, _080AB4E4
	movs r1, 0xF3
	movs r2, 0x2
	bl FillPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB4DC: .4byte gWindowConfig_81E6FD8
_080AB4E0: .4byte 0x0202ecaa
_080AB4E4: .4byte 0x00007e3f
	thumb_func_end sub_80AB350

	thumb_func_start sub_80AB398
sub_80AB398: @ 80AB4E8
	push {r4-r6,lr}
	ldr r4, _080AB5B8
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x5C
	bl memset
	movs r5, 0
	adds r4, 0x2
	movs r2, 0xFF
_080AB4FC:
	adds r1, r5, r4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r5, 0x1
	cmp r5, 0x3
	ble _080AB4FC
	ldr r4, _080AB5BC
	movs r5, 0x3
_080AB50E:
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x1C
	bl memset
	adds r4, 0x1C
	subs r5, 0x1
	cmp r5, 0
	bge _080AB50E
	ldr r4, _080AB5C0
	movs r6, 0x4
	negs r6, r6
	movs r3, 0xFF
	adds r2, r4, 0
	subs r2, 0x65
	movs r5, 0x3
_080AB52E:
	ldrb r1, [r2]
	adds r0, r6, 0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r2, 0x8]
	orrs r0, r3
	strb r0, [r2, 0x8]
	ldrb r0, [r2, 0x9]
	orrs r0, r3
	strb r0, [r2, 0x9]
	adds r2, 0x1C
	subs r5, 0x1
	cmp r5, 0
	bge _080AB52E
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x14
	bl memset
	adds r0, r4, 0
	adds r0, 0x14
	movs r1, 0
	movs r2, 0x44
	bl memset
	adds r0, r4, 0
	adds r0, 0x58
	movs r1, 0
	movs r2, 0x4
	bl memset
	adds r0, r4, 0
	adds r0, 0x68
	movs r1, 0
	movs r2, 0x10
	bl memset
	ldr r0, _080AB5C4
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080AB58A
	movs r0, 0
	bl sub_80B0F28
_080AB58A:
	movs r5, 0
	movs r6, 0xFF
	adds r3, r4, 0
	subs r3, 0xB8
	adds r2, r4, 0
	subs r2, 0x57
	ldr r4, _080AB5C8
_080AB598:
	ldrb r0, [r2]
	orrs r0, r6
	strb r0, [r2]
	adds r1, r3, r5
	adds r0, r5, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r2, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080AB598
	bl sub_80B159C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AB5B8: .4byte 0x02019204
_080AB5BC: .4byte 0x02019260
_080AB5C0: .4byte 0x020192d0
_080AB5C4: .4byte gUnknown_0203869A
_080AB5C8: .4byte gUnknown_02038696
	thumb_func_end sub_80AB398

	thumb_func_start sub_80AB47C
sub_80AB47C: @ 80AB5CC
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r0, _080AB5E8
	ldr r1, _080AB5EC
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _080AB6A4
	cmp r0, 0x1
	bgt _080AB5F0
	cmp r0, 0
	beq _080AB5FA
	b _080AB6FE
	.align 2, 0
_080AB5E8: .4byte gMain
_080AB5EC: .4byte 0x0000043c
_080AB5F0:
	cmp r0, 0x2
	beq _080AB6AA
	cmp r0, 0x3
	beq _080AB6C8
	b _080AB6FE
_080AB5FA:
	movs r0, 0
	bl SetVBlankCallback
	bl sub_80AB320
	bl sub_80AB1BC
	bl dp12_8087EA4
	bl ResetPaletteFade
	ldr r0, _080AB688
	ldrb r1, [r0, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	movs r5, 0
	ldr r1, _080AB68C
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080AB690
	movs r7, 0x85
	lsls r7, 24
_080AB630:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080AB630
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	ldr r1, _080AB694
	movs r0, 0x4
	strb r0, [r1]
	ldr r0, _080AB698
	movs r1, 0xC0
	lsls r1, 9
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	bl sub_8040710
	bl sub_80AB398
	ldr r1, _080AB69C
	ldr r0, _080AB6A0
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080AB6FE
	.align 2, 0
_080AB688: .4byte gPaletteFade
_080AB68C: .4byte 0x040000d4
_080AB690: .4byte 0x85000400
_080AB694: .4byte gReservedSpritePaletteCount
_080AB698: .4byte 0x02000000
_080AB69C: .4byte gMain
_080AB6A0: .4byte 0x0000043c
_080AB6A4:
	bl sub_80AB350
	b _080AB6BC
_080AB6AA:
	ldr r5, _080AB6C4
	adds r0, r5, 0
	bl sub_80AB70C
	lsls r0, 24
	cmp r0, 0
	beq _080AB6FE
	movs r0, 0
	strb r0, [r5]
_080AB6BC:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _080AB6FE
	.align 2, 0
_080AB6C4: .4byte 0x0201925d
_080AB6C8:
	bl sub_80B2184
	ldr r0, _080AB708
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AB70C
	strh r1, [r0]
	movs r0, 0x2
	bl BeginFastPaletteFade
	ldr r2, _080AB710
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _080AB714
	bl SetVBlankCallback
	ldr r0, _080AB718
	movs r1, 0xA
	bl CreateTask
	ldr r1, _080AB71C
	strb r0, [r1, 0x8]
	ldr r0, _080AB720
	bl SetMainCallback2
_080AB6FE:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB708: .4byte gUnknown_030042C0
_080AB70C: .4byte gUnknown_030041B4
_080AB710: .4byte gPaletteFade
_080AB714: .4byte sub_80ABAC4
_080AB718: .4byte sub_80AB5D4
_080AB71C: .4byte 0x02019204
_080AB720: .4byte sub_80ABAAC
	thumb_func_end sub_80AB47C

	thumb_func_start sub_80AB5D4
sub_80AB5D4: @ 80AB724
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080AB748
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080AB744
	ldr r0, _080AB74C
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AB750
	str r0, [r1]
_080AB744:
	pop {r0}
	bx r0
	.align 2, 0
_080AB748: .4byte gPaletteFade
_080AB74C: .4byte gTasks
_080AB750: .4byte sub_80AB604
	thumb_func_end sub_80AB5D4

	thumb_func_start sub_80AB604
sub_80AB604: @ 80AB754
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080AB798
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AB7AC
	ldr r2, _080AB79C
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080AB7BA
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	bl sub_80AF860
	ldr r0, _080AB7A0
	movs r1, 0
	bl CreateTask
	ldr r1, _080AB7A4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080AB7A8
	str r1, [r0]
	b _080AB7BA
	.align 2, 0
_080AB798: .4byte gUnknown_0203869A
_080AB79C: .4byte gPaletteFade
_080AB7A0: .4byte sub_80AB678
_080AB7A4: .4byte gTasks
_080AB7A8: .4byte nullsub_89
_080AB7AC:
	ldr r0, _080AB7C0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AB7C4
	str r0, [r1]
_080AB7BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB7C0: .4byte gTasks
_080AB7C4: .4byte sub_80AB960
	thumb_func_end sub_80AB604

	thumb_func_start sub_80AB678
sub_80AB678: @ 80AB7C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080AB7DC
	ldr r2, _080AB7E0
	bl SetTaskFuncWithFollowupFunc
	pop {r0}
	bx r0
	.align 2, 0
_080AB7DC: .4byte sub_80C89DC
_080AB7E0: .4byte sub_80AB694
	thumb_func_end sub_80AB678

	thumb_func_start sub_80AB694
sub_80AB694: @ 80AB7E4
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	ldr r2, _080AB7FC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r3, [r1, 0x8]
	ldr r0, _080AB800
	str r0, [r1]
	bx lr
	.align 2, 0
_080AB7FC: .4byte gTasks
_080AB800: .4byte sub_80AB6B4
	thumb_func_end sub_80AB694

	thumb_func_start sub_80AB6B4
sub_80AB6B4: @ 80AB804
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _080AB848
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r5
	ldrh r1, [r0, 0x8]
	subs r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	cmp r1, 0
	bgt _080AB842
	bl GetMultiplayerId
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _080AB84C
	ldrb r1, [r0, 0x8]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r5
	ldr r1, _080AB850
	str r1, [r0]
	ldr r1, _080AB854
	ldr r0, _080AB858
	ldr r0, [r0]
	str r0, [r1]
_080AB842:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AB848: .4byte gTasks
_080AB84C: .4byte 0x02019204
_080AB850: .4byte sub_80AB960
_080AB854: .4byte gRngValue
_080AB858: .4byte gUnknown_03005D28
	thumb_func_end sub_80AB6B4

	thumb_func_start sub_80AB70C
sub_80AB70C: @ 80AB85C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x44
	mov r10, r0
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _080AB872
	b _080ABA8C
_080AB872:
	lsls r0, 2
	ldr r1, _080AB87C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AB87C: .4byte _080AB880
	.align 2, 0
_080AB880:
	.4byte _080AB89C
	.4byte _080AB8F0
	.4byte _080AB900
	.4byte _080AB950
	.4byte _080AB964
	.4byte _080AB994
	.4byte _080ABA1C
_080AB89C:
	ldr r0, _080AB8E4
	ldrb r1, [r0, 0x8]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	add r5, sp, 0x40
	movs r6, 0
	ldr r1, _080AB8E8
	movs r4, 0x80
	lsls r4, 5
	mov r8, r5
	ldr r7, _080AB8EC
	movs r0, 0x85
	lsls r0, 24
	mov r9, r0
_080AB8C2:
	str r6, [sp, 0x40]
	mov r0, r8
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080AB8C2
	str r6, [sp, 0x40]
	str r5, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r9
	orrs r0, r2
	b _080AB936
	.align 2, 0
_080AB8E4: .4byte gPaletteFade
_080AB8E8: .4byte 0x040000d4
_080AB8EC: .4byte 0x85000400
_080AB8F0:
	ldr r0, _080AB8FC
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
	b _080ABA96
	.align 2, 0
_080AB8FC: .4byte gContestMiscGfx
_080AB900:
	ldr r0, _080AB93C
	ldr r4, _080AB940
	adds r1, r4, 0
	bl LZDecompressVram
	ldr r3, _080AB944
	movs r5, 0x80
	lsls r5, 6
	ldr r1, _080AB948
	ldr r6, _080AB94C
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x84
	lsls r7, 24
_080AB91C:
	str r4, [r1]
	str r3, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, r2
	adds r3, r2
	subs r5, r2
	cmp r5, r2
	bhi _080AB91C
	str r4, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r5, 2
	orrs r0, r7
_080AB936:
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _080ABA96
	.align 2, 0
_080AB93C: .4byte gContestAudienceGfx
_080AB940: .4byte 0x06002000
_080AB944: .4byte 0x02015800
_080AB948: .4byte 0x040000d4
_080AB94C: .4byte 0x84000400
_080AB950:
	ldr r0, _080AB95C
	ldr r1, _080AB960
	bl LZDecompressVram
	b _080ABA96
	.align 2, 0
_080AB95C: .4byte gUnknown_08D1725C
_080AB960: .4byte 0x0600d000
_080AB964:
	ldr r0, _080AB980
	ldr r4, _080AB984
	adds r1, r4, 0
	bl LZDecompressVram
	ldr r1, _080AB988
	ldr r0, _080AB98C
	str r4, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080AB990
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080ABA96
	.align 2, 0
_080AB980: .4byte gUnknown_08D17424
_080AB984: .4byte 0x0600e000
_080AB988: .4byte 0x02018a04
_080AB98C: .4byte 0x040000d4
_080AB990: .4byte 0x84000200
_080AB994:
	ldr r0, _080AB9FC
	movs r2, 0x80
	lsls r2, 2
	movs r1, 0
	bl LoadCompressedPalette
	ldr r5, _080ABA00
	ldr r6, _080ABA04
	adds r0, r5, 0
	mov r1, sp
	adds r2, r6, 0
	bl CpuSet
	ldr r0, _080ABA08
	mov r9, r0
	ldrb r0, [r0]
	adds r0, 0x5
	lsls r0, 5
	ldr r1, _080ABA0C
	adds r1, r5
	mov r8, r1
	add r0, r8
	add r4, sp, 0x20
	adds r1, r4, 0
	adds r2, r6, 0
	bl CpuSet
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl CpuSet
	mov r2, r9
	ldrb r1, [r2]
	adds r1, 0x5
	lsls r1, 5
	add r1, r8
	mov r0, sp
	adds r2, r6, 0
	bl CpuSet
	ldr r1, _080ABA10
	ldr r0, _080ABA14
	mov r2, r8
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080ABA18
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	bl sub_80AB350
	b _080ABA96
	.align 2, 0
_080AB9FC: .4byte gUnknown_08D17144
_080ABA00: .4byte 0x0202ebc8
_080ABA04: .4byte 0x04000008
_080ABA08: .4byte gContestPlayerMonIndex
_080ABA0C: .4byte 0xffffff00
_080ABA10: .4byte 0x02018004
_080ABA14: .4byte 0x040000d4
_080ABA18: .4byte 0x84000080
_080ABA1C:
	bl sub_80B1118
	bl sub_80AFA5C
	bl sub_80AEB30
	bl sub_80AE8B4
	ldr r1, _080ABA74
	movs r4, 0
	strb r0, [r1, 0x12]
	bl sub_80AFE30
	bl sub_80B0034
	bl sub_80B00C8
	bl sub_80B0324
	bl sub_80B0518
	ldr r1, _080ABA78
	strb r4, [r1]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	movs r3, 0x3
	strb r3, [r1, 0x2]
	movs r2, 0x2
	strb r2, [r1, 0x3]
	ldr r0, _080ABA7C
	strh r4, [r0]
	ldr r4, _080ABA80
	strb r2, [r4]
	ldr r0, _080ABA84
	strb r3, [r0]
	bl sub_80AE858
	ldr r2, _080ABA88
	ldrb r1, [r4]
	adds r1, r2
	strb r0, [r1]
	bl sub_80B292C
	b _080ABA96
	.align 2, 0
_080ABA74: .4byte 0x02019204
_080ABA78: .4byte gUnknown_02024A72
_080ABA7C: .4byte gUnknown_020239F8
_080ABA80: .4byte gUnknown_02024C07
_080ABA84: .4byte gUnknown_02024C08
_080ABA88: .4byte gUnknown_02024BE0
_080ABA8C:
	movs r0, 0
	mov r1, r10
	strb r0, [r1]
	movs r0, 0x1
	b _080ABAA0
_080ABA96:
	mov r2, r10
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r0, 0
_080ABAA0:
	add sp, 0x44
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80AB70C

	thumb_func_start sub_80AB960
sub_80AB960: @ 80ABAB0
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080ABAE4
	ldrb r2, [r1, 0x8]
	movs r0, 0x7F
	ands r0, r2
	strb r0, [r1, 0x8]
	ldrb r1, [r1, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _080ABAE0
	ldr r0, _080ABAE8
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	ldr r0, _080ABAEC
	str r0, [r1]
_080ABAE0:
	pop {r0}
	bx r0
	.align 2, 0
_080ABAE4: .4byte gPaletteFade
_080ABAE8: .4byte gTasks
_080ABAEC: .4byte sub_80AB9A0
	thumb_func_end sub_80AB960

	thumb_func_start sub_80AB9A0
sub_80AB9A0: @ 80ABAF0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080ABB14
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r2, r1, 0
	cmp r0, 0x4
	bhi _080ABBCC
	lsls r0, 2
	ldr r1, _080ABB18
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ABB14: .4byte gTasks
_080ABB18: .4byte _080ABB1C
	.align 2, 0
_080ABB1C:
	.4byte _080ABB30
	.4byte _080ABB5A
	.4byte _080ABB78
	.4byte _080ABB94
	.4byte _080ABBCC
_080ABB30:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r4, r0, r2
	ldrh r0, [r4, 0xA]
	adds r1, r0, 0x1
	strh r1, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3C
	ble _080ABBEC
	movs r0, 0
	strh r0, [r4, 0xA]
	movs r0, 0x61
	movs r1, 0
	bl PlaySE12WithPanning
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080ABBEC
_080ABB5A:
	ldr r1, _080ABB74
	ldrh r0, [r1]
	adds r0, 0x7
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA0
	ble _080ABBEC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	b _080ABBB8
	.align 2, 0
_080ABB74: .4byte gUnknown_030041B4
_080ABB78:
	bl sub_80B2280
	ldr r0, _080ABB90
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	b _080ABBEC
	.align 2, 0
_080ABB90: .4byte gTasks
_080ABB94:
	ldr r3, _080ABBC0
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _080ABBC4
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	bl sub_80B1B14
	ldr r1, _080ABBC8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
_080ABBB8:
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	b _080ABBEC
	.align 2, 0
_080ABBC0: .4byte 0x04000008
_080ABBC4: .4byte 0x0400000c
_080ABBC8: .4byte gTasks
_080ABBCC:
	ldr r0, _080ABBF4
	ldrb r1, [r0, 0x6]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080ABBEC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r2
	strh r1, [r0, 0x8]
	strh r1, [r0, 0xA]
	ldr r1, _080ABBF8
	str r1, [r0]
_080ABBEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABBF4: .4byte 0x02019204
_080ABBF8: .4byte sub_80ABB70
	thumb_func_end sub_80AB9A0

	thumb_func_start sub_80ABAAC
sub_80ABAAC: @ 80ABBFC
	push {lr}
	bl AnimateSprites
	bl RunTasks
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80ABAAC

	thumb_func_start sub_80ABAC4
sub_80ABAC4: @ 80ABC14
	push {lr}
	ldr r1, _080ABC8C
	ldr r0, _080ABC90
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080ABC94
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080ABC98
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080ABC9C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080ABCA0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080ABCA4
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080ABCA8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	ldr r0, _080ABCAC
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x22
	ldr r0, _080ABCB0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080ABCB4
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, 0x2
	ldr r0, _080ABCB8
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	ldr r0, _080ABCBC
	ldrh r0, [r0]
	strh r0, [r1]
	bl TransferPlttBuffer
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_8089668
	pop {r0}
	bx r0
	.align 2, 0
_080ABC8C: .4byte 0x04000010
_080ABC90: .4byte gUnknown_030042A4
_080ABC94: .4byte gUnknown_030042A0
_080ABC98: .4byte gUnknown_030042C0
_080ABC9C: .4byte gUnknown_030041B4
_080ABCA0: .4byte gUnknown_03004288
_080ABCA4: .4byte gUnknown_03004280
_080ABCA8: .4byte gUnknown_030041B0
_080ABCAC: .4byte gUnknown_030041B8
_080ABCB0: .4byte gUnknown_030042C4
_080ABCB4: .4byte gUnknown_03004240
_080ABCB8: .4byte gUnknown_03004200
_080ABCBC: .4byte gUnknown_03004244
	thumb_func_end sub_80ABAC4

	thumb_func_start sub_80ABB70
sub_80ABB70: @ 80ABCC0
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080ABD00
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080ABD04
	strh r1, [r0]
	bl sub_80B0D7C
	ldr r1, _080ABD08
	ldr r2, _080ABD0C
	ldr r0, _080ABD10
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080ABD14
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080ABD18
	ldrb r0, [r0]
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080ABD24
	ldr r0, _080ABD1C
	ldr r1, _080ABD20
	bl StringCopy
	b _080ABD2C
	.align 2, 0
_080ABD00: .4byte gUnknown_030042A0
_080ABD04: .4byte gUnknown_03004280
_080ABD08: .4byte gPlttBufferUnfaded
_080ABD0C: .4byte 0x02018204
_080ABD10: .4byte 0x040000d4
_080ABD14: .4byte 0x84000100
_080ABD18: .4byte gContestPlayerMonIndex
_080ABD1C: .4byte gUnknown_020238CC
_080ABD20: .4byte gUnknown_083CAF84
_080ABD24:
	ldr r0, _080ABD70
	ldr r1, _080ABD74
	bl StringCopy
_080ABD2C:
	ldr r5, _080ABD70
	ldr r0, _080ABD78
	ldrb r1, [r0, 0x1]
	adds r1, 0x1
	adds r0, r5, 0
	bl sub_80AE020
	bl sub_80AF138
	ldr r4, _080ABD7C
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringExpandPlaceholders
	ldr r0, _080ABD80
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080ABD84
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _080ABD88
	str r1, [r0]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ABD70: .4byte gUnknown_020238CC
_080ABD74: .4byte gUnknown_083CAFAE
_080ABD78: .4byte 0x02019204
_080ABD7C: .4byte gStringVar4
_080ABD80: .4byte gMenuWindow
_080ABD84: .4byte gTasks
_080ABD88: .4byte sub_80ABC3C
	thumb_func_end sub_80ABB70

	thumb_func_start sub_80ABC3C
sub_80ABC3C: @ 80ABD8C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080ABDB4
	bl sub_80037A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080ABDAE
	ldr r0, _080ABDB8
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080ABDBC
	str r0, [r1]
_080ABDAE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABDB4: .4byte gMenuWindow
_080ABDB8: .4byte gTasks
_080ABDBC: .4byte sub_80ABC70
	thumb_func_end sub_80ABC3C

	thumb_func_start sub_80ABC70
sub_80ABC70: @ 80ABDC0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	ldr r0, _080ABE00
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080ABDD8
	cmp r1, 0x2
	bne _080ABE1E
_080ABDD8:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080ABE04
	ldrb r0, [r0]
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080ABE10
	movs r0, 0x1
	bl sub_80AFFE0
	ldr r0, _080ABE08
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080ABE0C
	b _080ABE1C
	.align 2, 0
_080ABE00: .4byte gMain
_080ABE04: .4byte gContestPlayerMonIndex
_080ABE08: .4byte gTasks
_080ABE0C: .4byte sub_80ABCDC
_080ABE10:
	ldr r0, _080ABE24
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080ABE28
_080ABE1C:
	str r0, [r1]
_080ABE1E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ABE24: .4byte gTasks
_080ABE28: .4byte sub_80AC0C8
	thumb_func_end sub_80ABC70

	thumb_func_start sub_80ABCDC
sub_80ABCDC: @ 80ABE2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x2C
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x28]
	ldr r0, _080ABED0
	movs r1, 0xA0
	strh r1, [r0]
	ldr r0, _080ABED4
	strh r1, [r0]
	ldr r5, _080ABED8
	ldr r4, _080ABEDC
	ldrb r2, [r4]
	ldrb r3, [r4, 0x1]
	ldrb r0, [r4, 0x2]
	str r0, [sp]
	ldrb r0, [r4, 0x3]
	str r0, [sp, 0x4]
	adds r0, r5, 0
	movs r1, 0
	bl FillWindowRect_DefaultPalette
	movs r6, 0
	ldr r0, _080ABEE0
	mov r8, r0
	ldr r7, _080ABEE4
	mov r9, r5
	mov r10, r4
_080ABE6C:
	lsls r1, r6, 1
	mov r3, r8
	ldrb r2, [r3]
	lsls r0, r2, 6
	adds r1, r0
	ldr r0, _080ABEE8
	adds r1, r0
	ldrh r4, [r1]
	add r5, sp, 0x8
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r7
	ldrh r0, [r0, 0x8]
	cmp r0, 0
	beq _080ABEF0
	adds r0, r2, 0
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _080ABEF0
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrh r0, [r0, 0x8]
	adds r1, r4, 0
	bl AreMovesContestCombo
	lsls r0, 24
	cmp r0, 0
	beq _080ABEF0
	mov r3, r8
	ldrb r1, [r3]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r1, [r0, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080ABEF0
	add r0, sp, 0x8
	ldr r1, _080ABEEC
	b _080ABF16
	.align 2, 0
_080ABED0: .4byte gUnknown_030042A0
_080ABED4: .4byte gUnknown_03004280
_080ABED8: .4byte gUnknown_03004210
_080ABEDC: .4byte gUnknown_083CA340
_080ABEE0: .4byte gContestPlayerMonIndex
_080ABEE4: .4byte 0x02019260
_080ABEE8: .4byte gUnknown_0203858E
_080ABEEC: .4byte gUnknownText_UnknownFormatting2
_080ABEF0:
	cmp r4, 0
	beq _080ABF1C
	mov r1, r8
	ldrb r0, [r1]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r7
	ldrh r0, [r1, 0x8]
	cmp r0, r4
	bne _080ABF1C
	ldr r0, _080ABFC4
	lsls r1, r4, 3
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0x3
	beq _080ABF1C
	add r0, sp, 0x8
	ldr r1, _080ABFC8
_080ABF16:
	bl StringCopy
	adds r5, r0, 0
_080ABF1C:
	movs r0, 0xD
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _080ABFCC
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	lsls r1, r6, 2
	adds r2, r1, r6
	lsls r2, 18
	movs r3, 0xC2
	lsls r3, 18
	adds r2, r3
	lsrs r2, 16
	mov r3, r10
	adds r0, r1, r3
	ldrb r3, [r0]
	lsls r3, 3
	adds r3, 0x4
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _080ABFD0
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 3
	str r0, [sp]
	movs r0, 0x1
	str r0, [sp, 0x4]
	mov r0, r9
	add r1, sp, 0x8
	bl sub_8002E4C
	mov r0, r9
	bl sub_8002F44
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _080ABF70
	b _080ABE6C
_080ABF70:
	ldr r1, _080ABFD4
	ldr r3, _080ABFD8
	movs r0, 0x48
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	ldr r4, _080ABFDC
	movs r0, 0
	ldrsb r0, [r4, r0]
	bl sub_80AC0AC
	ldr r2, _080ABFE0
	ldrb r1, [r4]
	lsls r1, 1
	ldr r0, _080ABFE4
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	bl sub_80AEBEC
	ldr r1, _080ABFE8
	ldr r2, [sp, 0x28]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r1, _080ABFEC
	str r1, [r0]
	add sp, 0x2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABFC4: .4byte gContestMoves
_080ABFC8: .4byte gUnknownText_UnknownFormatting3
_080ABFCC: .4byte gMoveNames
_080ABFD0: .4byte 0x083d61b9
_080ABFD4: .4byte 0x0000ffff
_080ABFD8: .4byte 0x00002d9f
_080ABFDC: .4byte 0x02019204
_080ABFE0: .4byte gContestMons
_080ABFE4: .4byte gContestPlayerMonIndex
_080ABFE8: .4byte gTasks
_080ABFEC: .4byte sub_80ABEA0
	thumb_func_end sub_80ABCDC

	thumb_func_start sub_80ABEA0
sub_80ABEA0: @ 80ABFF0
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r3, _080AC044
	ldr r1, _080AC048
	ldr r0, _080AC04C
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, 0x1E
	adds r1, r0, r1
	movs r2, 0x3
_080AC00A:
	ldrh r0, [r1]
	cmp r0, 0
	beq _080AC016
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_080AC016:
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080AC00A
	ldrh r0, [r3, 0x2E]
	movs r5, 0x1
	ands r5, r0
	cmp r5, 0
	beq _080AC058
	bl sub_814A7FC
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080AC050
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AC054
	str r0, [r1]
	b _080AC1E8
	.align 2, 0
_080AC044: .4byte gMain
_080AC048: .4byte gContestMons
_080AC04C: .4byte gContestPlayerMonIndex
_080AC050: .4byte gTasks
_080AC054: .4byte sub_80AC0C8
_080AC058:
	ldrh r0, [r3, 0x30]
	cmp r0, 0x20
	bne _080AC060
	b _080AC1E8
_080AC060:
	cmp r0, 0x20
	bgt _080AC06A
	cmp r0, 0x2
	beq _080AC076
	b _080AC1E8
_080AC06A:
	cmp r0, 0x40
	beq _080AC13C
	cmp r0, 0x80
	bne _080AC074
	b _080AC198
_080AC074:
	b _080AC1E8
_080AC076:
	bl sub_814A904
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	bl sub_80AFFE0
	ldr r0, _080AC0B4
	ldr r1, _080AC0B8
	ldrb r2, [r1]
	ldrb r3, [r1, 0x1]
	ldrb r4, [r1, 0x2]
	str r4, [sp]
	ldrb r1, [r1, 0x3]
	str r1, [sp, 0x4]
	movs r1, 0
	bl FillWindowRect_DefaultPalette
	ldr r0, _080AC0BC
	ldrb r0, [r0]
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080AC0C8
	ldr r0, _080AC0C0
	ldr r1, _080AC0C4
	bl StringCopy
	b _080AC0D0
	.align 2, 0
_080AC0B4: .4byte gUnknown_03004210
_080AC0B8: .4byte gUnknown_083CA340
_080AC0BC: .4byte gContestPlayerMonIndex
_080AC0C0: .4byte gUnknown_020238CC
_080AC0C4: .4byte gUnknown_083CAF84
_080AC0C8:
	ldr r0, _080AC118
	ldr r1, _080AC11C
	bl StringCopy
_080AC0D0:
	ldr r5, _080AC118
	ldr r0, _080AC120
	ldrb r1, [r0, 0x1]
	adds r1, 0x1
	adds r0, r5, 0
	bl sub_80AE020
	bl sub_80AF138
	ldr r4, _080AC124
	adds r0, r4, 0
	adds r1, r5, 0
	bl StringExpandPlaceholders
	ldr r0, _080AC128
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8003460
	ldr r0, _080AC12C
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AC130
	strh r1, [r0]
	ldr r1, _080AC134
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _080AC138
	str r1, [r0]
	b _080AC1E8
	.align 2, 0
_080AC118: .4byte gUnknown_020238CC
_080AC11C: .4byte gUnknown_083CAFAE
_080AC120: .4byte 0x02019204
_080AC124: .4byte gStringVar4
_080AC128: .4byte gMenuWindow
_080AC12C: .4byte gUnknown_030042A0
_080AC130: .4byte gUnknown_03004280
_080AC134: .4byte gTasks
_080AC138: .4byte sub_80ABC70
_080AC13C:
	ldr r4, _080AC150
	movs r0, 0
	ldrsb r0, [r4, r0]
	bl nullsub_17
	ldrb r0, [r4]
	cmp r0, 0
	bne _080AC154
	subs r0, r6, 0x1
	b _080AC156
	.align 2, 0
_080AC150: .4byte 0x02019204
_080AC154:
	subs r0, 0x1
_080AC156:
	strb r0, [r4]
	ldr r4, _080AC18C
	movs r0, 0
	ldrsb r0, [r4, r0]
	bl sub_80AC0AC
	bl sub_80AED58
	ldr r2, _080AC190
	ldrb r1, [r4]
	lsls r1, 1
	ldr r0, _080AC194
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	bl sub_80AEBEC
	cmp r6, 0x1
	bls _080AC1E8
	movs r0, 0x5
	bl PlaySE
	b _080AC1E8
	.align 2, 0
_080AC18C: .4byte 0x02019204
_080AC190: .4byte gContestMons
_080AC194: .4byte gContestPlayerMonIndex
_080AC198:
	ldr r4, _080AC1B0
	movs r0, 0
	ldrsb r0, [r4, r0]
	bl nullsub_17
	ldrb r1, [r4]
	subs r0, r6, 0x1
	cmp r1, r0
	bne _080AC1B4
	strb r5, [r4]
	b _080AC1B8
	.align 2, 0
_080AC1B0: .4byte 0x02019204
_080AC1B4:
	adds r0, r1, 0x1
	strb r0, [r4]
_080AC1B8:
	ldr r4, _080AC1F0
	movs r0, 0
	ldrsb r0, [r4, r0]
	bl sub_80AC0AC
	bl sub_80AED58
	ldr r2, _080AC1F4
	ldrb r1, [r4]
	lsls r1, 1
	ldr r0, _080AC1F8
	ldrb r0, [r0]
	lsls r0, 6
	adds r1, r0
	adds r2, 0x1E
	adds r1, r2
	ldrh r0, [r1]
	bl sub_80AEBEC
	cmp r6, 0x1
	bls _080AC1E8
	movs r0, 0x5
	bl PlaySE
_080AC1E8:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC1F0: .4byte 0x02019204
_080AC1F4: .4byte gContestMons
_080AC1F8: .4byte gContestPlayerMonIndex
	thumb_func_end sub_80ABEA0

	thumb_func_start sub_80AC0AC
sub_80AC0AC: @ 80AC1FC
	push {lr}
	adds r1, r0, 0
	lsls r1, 28
	movs r0, 0xB0
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0x4
	bl sub_814A880
	pop {r0}
	bx r0
	thumb_func_end sub_80AC0AC

	thumb_func_start nullsub_17
nullsub_17: @ 80AC214
	bx lr
	thumb_func_end nullsub_17

	thumb_func_start sub_80AC0C8
sub_80AC0C8: @ 80AC218
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080AC270
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AC28C
	ldr r4, _080AC274
	ldrb r0, [r4]
	bl sub_80AF15C
	ldrb r2, [r4]
	lsls r1, r2, 3
	subs r1, r2
	lsls r1, 2
	ldr r2, _080AC278
	adds r1, r2
	strh r0, [r1, 0x6]
	ldr r4, _080AC27C
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AC280
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080AC284
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080AC288
	str r1, [r0]
	bl sub_80AF860
	movs r0, 0
	bl sub_80AFFE0
	b _080AC29E
	.align 2, 0
_080AC270: .4byte gUnknown_0203869A
_080AC274: .4byte gContestPlayerMonIndex
_080AC278: .4byte 0x02019260
_080AC27C: .4byte sub_80C8A38
_080AC280: .4byte sub_80AC15C
_080AC284: .4byte gTasks
_080AC288: .4byte nullsub_89
_080AC28C:
	bl sub_80AF1B8
	ldr r0, _080AC2A4
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AC2A8
	str r0, [r1]
_080AC29E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC2A4: .4byte gTasks
_080AC2A8: .4byte sub_80AC188
	thumb_func_end sub_80AC0C8

	thumb_func_start sub_80AC15C
sub_80AC15C: @ 80AC2AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	ldr r2, _080AC2CC
	ldr r0, _080AC2D0
	ldrb r1, [r0, 0x8]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080AC2D4
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080AC2CC: .4byte gTasks
_080AC2D0: .4byte 0x02019204
_080AC2D4: .4byte sub_80AC188
	thumb_func_end sub_80AC15C

	thumb_func_start sub_80AC188
sub_80AC188: @ 80AC2D8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl sub_80AF138
	ldr r0, _080AC334
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AC338
	strh r1, [r0]
	movs r0, 0
	bl sub_80AFFE0
	ldr r1, _080AC33C
	ldr r0, _080AC340
	movs r2, 0x80
	lsls r2, 3
	ldr r4, _080AC344
	str r1, [r4]
	str r0, [r4, 0x4]
	lsrs r1, r2, 2
	movs r3, 0x84
	lsls r3, 24
	orrs r1, r3
	str r1, [r4, 0x8]
	ldr r1, [r4, 0x8]
	ldr r1, _080AC348
	adds r0, r1
	movs r1, 0
	bl LoadPalette
	ldr r1, _080AC34C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	strh r1, [r0, 0xA]
	ldr r1, _080AC350
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AC334: .4byte gUnknown_030042A0
_080AC338: .4byte gUnknown_03004280
_080AC33C: .4byte gPlttBufferFaded
_080AC340: .4byte 0x02018604
_080AC344: .4byte 0x040000d4
_080AC348: .4byte 0xfffffc00
_080AC34C: .4byte gTasks
_080AC350: .4byte sub_80AC204
	thumb_func_end sub_80AC188

	thumb_func_start sub_80AC204
sub_80AC204: @ 80AC354
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AC398
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080AC392
	movs r0, 0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	bne _080AC392
	bl sub_80B1BDC
	movs r0, 0x1
	bl sub_80B25E4
	ldr r0, _080AC39C
	str r0, [r4]
_080AC392:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AC398: .4byte gTasks
_080AC39C: .4byte sub_80AC250
	thumb_func_end sub_80AC204

	thumb_func_start sub_80AC250
sub_80AC250: @ 80AC3A0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080AC3C8
	ldrh r1, [r0, 0x6]
	movs r0, 0x90
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	bne _080AC3C2
	ldr r0, _080AC3CC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AC3D0
	str r0, [r1]
_080AC3C2:
	pop {r0}
	bx r0
	.align 2, 0
_080AC3C8: .4byte 0x02019204
_080AC3CC: .4byte gTasks
_080AC3D0: .4byte sub_80AC284
	thumb_func_end sub_80AC250

	thumb_func_start sub_80AC284
sub_80AC284: @ 80AC3D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AC40C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r2, r1, r2
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080AC406
	ldr r1, _080AC410
	movs r0, 0
	strb r0, [r1, 0x10]
	ldr r0, _080AC414
	ldr r0, [r0]
	str r0, [r1, 0x18]
	movs r0, 0
	strh r0, [r2, 0x8]
	ldr r0, _080AC418
	str r0, [r2]
_080AC406:
	pop {r0}
	bx r0
	.align 2, 0
_080AC40C: .4byte gTasks
_080AC410: .4byte 0x02019204
_080AC414: .4byte gRngValue
_080AC418: .4byte sub_80AC2CC
	thumb_func_end sub_80AC284

	thumb_func_start sub_80AC2CC
sub_80AC2CC: @ 80AC41C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _080AC458
	ldrb r7, [r2, 0x11]
	ldr r1, _080AC45C
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	adds r6, r2, 0
	mov r12, r1
	cmp r0, 0x3B
	bls _080AC44C
	bl _080ADA1A
_080AC44C:
	lsls r0, 2
	ldr r1, _080AC460
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AC458: .4byte 0x02019204
_080AC45C: .4byte gTasks
_080AC460: .4byte _080AC464
	.align 2, 0
_080AC464:
	.4byte _080AC554
	.4byte _080AC604
	.4byte _080AC624
	.4byte _080AC684
	.4byte _080AC738
	.4byte _080AC788
	.4byte _080AC848
	.4byte _080AC880
	.4byte _080AC8CC
	.4byte _080AC944
	.4byte _080AD8A0
	.4byte _080AD8CC
	.4byte _080ACADC
	.4byte _080ACB10
	.4byte _080AD010
	.4byte _080AD124
	.4byte _080AD190
	.4byte _080AD1C0
	.4byte _080AD2B8
	.4byte _080AD26A
	.4byte _080AD908
	.4byte _080AD9B8
	.4byte _080AD9DC
	.4byte _080AC96E
	.4byte _080ACA1C
	.4byte _080ACC28
	.4byte _080ACC3E
	.4byte _080ACD00
	.4byte _080ACD2C
	.4byte _080ACD94
	.4byte _080ACE7A
	.4byte _080AD938
	.4byte _080AD990
	.4byte _080AD798
	.4byte _080AD828
	.4byte _080ACB3C
	.4byte _080ACB74
	.4byte _080ACB94
	.4byte _080ACBD4
	.4byte _080ACDE8
	.4byte _080ACE50
	.4byte _080AD2F4
	.4byte _080ADA1A
	.4byte _080AD664
	.4byte _080ADA1A
	.4byte _080AD0F8
	.4byte _080AD24A
	.4byte _080ACABC
	.4byte _080ACA48
	.4byte _080ACA9C
	.4byte _080ACBFE
	.4byte _080ACF18
	.4byte _080ACFB4
	.4byte _080AD466
	.4byte _080AD520
	.4byte _080AD850
	.4byte _080AD86C
	.4byte _080AD68C
	.4byte _080AD720
	.4byte _080AD774
_080AC554:
	bl sub_80B0D7C
	movs r6, 0
	ldr r0, _080AC5D4
	adds r1, r0, 0
	adds r1, 0xCC
	ldrb r0, [r0, 0x10]
	mov r4, r8
	lsls r4, 2
	mov r9, r4
	ldrb r5, [r1]
	cmp r0, r5
	beq _080AC57C
	adds r2, r1, 0
	adds r1, r0, 0
_080AC572:
	adds r6, 0x1
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _080AC572
_080AC57C:
	ldr r4, _080AC5D4
	strb r6, [r4, 0x11]
	ldrb r7, [r4, 0x11]
	ldr r0, _080AC5D8
	ldrb r1, [r0]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080AC5E8
	ldrb r0, [r4, 0x7]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x7]
	bl sub_80AE074
	lsls r0, 24
	cmp r0, 0
	beq _080AC5A8
	ldrb r0, [r4, 0x11]
	bl sub_80B114C
_080AC5A8:
	ldr r4, _080AC5DC
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AC5E0
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl sub_80AF860
	ldr r1, _080AC5E4
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC5D4: .4byte 0x02019204
_080AC5D8: .4byte gUnknown_0203869A
_080AC5DC: .4byte sub_80C8C80
_080AC5E0: .4byte sub_80AD8DC
_080AC5E4: .4byte gTasks
_080AC5E8:
	adds r0, r7, 0
	bl sub_80B114C
	ldr r0, _080AC600
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x2
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC600: .4byte gTasks
_080AC604:
	ldrb r1, [r6, 0x7]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080AC612
	bl _080ADA1A
_080AC612:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x2
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080AC624:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080AC658
	adds r2, r0, r1
	ldrb r1, [r2, 0xC]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080AC646
	ldrb r1, [r2, 0xB]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _080AC65C
_080AC646:
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x1F
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC658: .4byte 0x02019260
_080AC65C:
	bl sub_80AF138
	adds r0, r7, 0
	movs r1, 0
	bl sub_80B0CDC
	ldr r0, _080AC680
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	strh r6, [r1, 0x1C]
	movs r0, 0x3
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC680: .4byte gTasks
_080AC684:
	mov r4, r8
	lsls r4, 2
	mov r9, r4
	ldr r4, _080AC714
	ldr r1, _080AC718
	movs r2, 0
	adds r0, r1, 0x3
_080AC692:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080AC692
	movs r6, 0x4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x14
	bl memset
	ldr r5, _080AC71C
	adds r7, r4, r5
	ldrb r0, [r7, 0x11]
	bl sub_80B28F0
	ldr r3, _080AC720
	ldrb r2, [r7, 0x11]
	lsls r2, 6
	adds r0, r2, r3
	ldrh r0, [r0]
	adds r1, r3, 0
	adds r1, 0x3C
	adds r1, r2, r1
	ldr r1, [r1]
	adds r3, 0x38
	adds r2, r3
	ldr r2, [r2]
	bl sub_80AE9FC
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080AC724
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r3, r0, r2
	movs r1, 0x78
	strh r1, [r3, 0x24]
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _080AC728
	str r1, [r0]
	ldr r0, _080AC72C
	mov r4, r9
	add r4, r8
	lsls r4, 3
	adds r4, r0
	strh r5, [r4, 0xC]
	ldr r1, _080AC730
	ldr r0, _080AC734
	ldrb r0, [r0]
	adds r0, r1
	strb r5, [r0]
	ldrb r0, [r7, 0x11]
	bl sub_80B09E4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0
	bl sub_80B0BC4
	strh r6, [r4, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC714: .4byte 0x02019348
_080AC718: .4byte gUnknown_02024E84
_080AC71C: .4byte 0xfffffebc
_080AC720: .4byte gContestMons
_080AC724: .4byte gSprites
_080AC728: .4byte sub_80AD8FC
_080AC72C: .4byte gTasks
_080AC730: .4byte gUnknown_02024BE0
_080AC734: .4byte gUnknown_02024C07
_080AC738:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	mov r3, r12
	adds r2, r0, r3
	ldrb r5, [r2, 0xC]
	ldr r1, _080AC77C
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _080AC780
	cmp r1, r0
	beq _080AC75E
	bl _080ADA1A
_080AC75E:
	lsls r0, r7, 2
	ldr r1, _080AC784
	adds r0, r1
	ldrb r1, [r0, 0x2]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080AC772
	bl _080ADA1A
_080AC772:
	movs r0, 0x5
	strh r0, [r2, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC77C: .4byte gSprites
_080AC780: .4byte SpriteCallbackDummy
_080AC784: .4byte 0x02019338
_080AC788:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080AC7B0
	adds r5, r0, r1
	ldrb r1, [r5, 0xC]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AC7B4
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x21
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC7B0: .4byte 0x02019260
_080AC7B4:
	bl sub_80AF138
	ldr r0, _080AC7E0
	lsls r1, r7, 6
	ldr r2, _080AC7E4
	adds r1, r2
	bl StringCopy
	ldrh r1, [r5, 0x6]
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bhi _080AC7F0
	ldr r0, _080AC7E8
	adds r2, r1, 0
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080AC7EC
	adds r1, r2
	bl StringCopy
	b _080AC800
	.align 2, 0
_080AC7E0: .4byte gStringVar1
_080AC7E4: .4byte 0x02038572
_080AC7E8: .4byte gStringVar2
_080AC7EC: .4byte gMoveNames
_080AC7F0:
	ldr r0, _080AC830
	ldr r2, _080AC834
	ldrb r1, [r5, 0xA]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
_080AC800:
	ldr r4, _080AC838
	ldr r1, _080AC83C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080AC840
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080AC844
	mov r5, r8
	lsls r0, r5, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x6
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC830: .4byte gStringVar2
_080AC834: .4byte gUnknown_083CC330
_080AC838: .4byte gStringVar4
_080AC83C: .4byte gUnknown_083CAFD7
_080AC840: .4byte gMenuWindow
_080AC844: .4byte gTasks
_080AC848:
	ldr r0, _080AC874
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AC858
	bl _080ADA1A
_080AC858:
	ldr r0, _080AC878
	adds r0, 0x5A
	movs r1, 0
	strb r1, [r0]
	ldr r1, _080AC87C
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x7
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC874: .4byte gMenuWindow
_080AC878: .4byte 0x02019204
_080AC87C: .4byte gTasks
_080AC880:
	ldrb r1, [r6, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r1, r6, 0
	adds r1, 0x5C
	adds r0, r1
	ldrh r0, [r0, 0x6]
	bl sub_80B2760
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldrb r0, [r6, 0x11]
	bl sub_80B2790
	ldrb r0, [r6, 0x11]
	bl sub_80B28F0
	adds r0, r4, 0
	bl sub_80B29B4
	adds r0, r4, 0
	bl move_anim_start_t1
	ldr r1, _080AC8C8
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x8
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC8C8: .4byte gTasks
_080AC8CC:
	ldr r0, _080AC908
	ldr r0, [r0]
	bl _call_via_r0
	ldr r0, _080AC90C
	ldrb r4, [r0]
	cmp r4, 0
	beq _080AC8E0
	bl _080ADA1A
_080AC8E0:
	adds r0, r7, 0
	bl sub_80B28CC
	ldr r1, _080AC910
	adds r0, r1, 0
	adds r0, 0x5A
	ldrb r0, [r0]
	cmp r0, 0
	beq _080AC918
	ldr r0, _080AC914
	mov r5, r8
	lsls r1, r5, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	strh r4, [r1, 0x1C]
	movs r0, 0x9
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC908: .4byte gUnknown_0202F7AC
_080AC90C: .4byte gUnknown_0202F7B1
_080AC910: .4byte 0x02019204
_080AC914: .4byte gTasks
_080AC918:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	adds r1, 0x5C
	adds r0, r1
	ldrb r1, [r0, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080AC932
	adds r0, r7, 0
	bl sub_80B03A8
_080AC932:
	bl sub_80B20C4
	ldr r0, _080AC940
	mov r2, r8
	lsls r1, r2, 2
	b _080ACA32
	.align 2, 0
_080AC940: .4byte gTasks
_080AC944:
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	mov r4, r12
	adds r2, r0, r4
	ldrh r0, [r2, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r2, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1E
	bgt _080AC962
	bl _080ADA1A
_080AC962:
	movs r0, 0
	strh r0, [r2, 0x1C]
	movs r0, 0x7
	strh r0, [r2, 0x8]
	bl _080ADA1A
_080AC96E:
	mov r5, r8
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	mov r1, r12
	adds r4, r0, r1
	movs r0, 0
	strh r0, [r4, 0xA]
	lsls r2, r7, 3
	subs r0, r2, r7
	lsls r0, 2
	ldr r1, _080AC9A8
	adds r6, r0, r1
	ldrb r0, [r6, 0x13]
	mov r9, r3
	mov r10, r2
	adds r3, r1, 0
	cmp r0, 0xFF
	beq _080AC9AC
	adds r1, r0, 0
	adds r0, r7, 0
	bl sub_80B146C
	movs r0, 0xFF
	strb r0, [r6, 0x13]
	movs r0, 0x18
	strh r0, [r4, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AC9A8: .4byte 0x02019260
_080AC9AC:
	ldrb r0, [r6, 0x14]
	cmp r0, 0xFF
	beq _080ACA14
	movs r6, 0
	cmp r6, r7
	beq _080AC9BE
	ldrb r0, [r3, 0x13]
	cmp r0, 0xFF
	bne _080AC9D6
_080AC9BE:
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080AC9D6
	cmp r6, r7
	beq _080AC9BE
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x13]
	cmp r0, 0xFF
	beq _080AC9BE
_080AC9D6:
	cmp r6, 0x4
	bne _080ACA04
	mov r2, r10
	subs r4, r2, r7
	lsls r4, 2
	adds r4, r3
	ldrb r1, [r4, 0x14]
	adds r0, r7, 0
	bl sub_80B146C
	movs r0, 0xFF
	strb r0, [r4, 0x14]
	ldr r1, _080ACA00
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x18
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACA00: .4byte gTasks
_080ACA04:
	mov r0, r9
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x30
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080ACA14:
	movs r0, 0x30
	strh r0, [r4, 0x8]
	bl _080ADA1A
_080ACA1C:
	ldr r0, _080ACA40
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080ACA2C
	bl _080ADA1A
_080ACA2C:
	ldr r0, _080ACA44
	mov r3, r8
	lsls r1, r3, 2
_080ACA32:
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x17
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACA40: .4byte gMenuWindow
_080ACA44: .4byte gTasks
_080ACA48:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080ACA64
	adds r0, r1
	ldrb r0, [r0, 0x11]
	movs r3, 0x3
	ands r3, r0
	cmp r3, 0x1
	bne _080ACA68
	movs r0, 0x5
	bl sub_80B1710
	b _080ACA84
	.align 2, 0
_080ACA64: .4byte 0x02019260
_080ACA68:
	cmp r3, 0x2
	bne _080ACA74
	movs r0, 0x6
	bl sub_80B1710
	b _080ACA84
_080ACA74:
	cmp r3, 0x3
	beq _080ACA7E
	mov r4, r8
	lsls r0, r4, 2
	b _080ACAAE
_080ACA7E:
	movs r0, 0x7
	bl sub_80B1710
_080ACA84:
	ldr r0, _080ACA98
	mov r5, r8
	lsls r1, r5, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x31
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACA98: .4byte gTasks
_080ACA9C:
	ldrb r1, [r6, 0x6]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080ACAAA
	bl _080ADA1A
_080ACAAA:
	mov r1, r8
	lsls r0, r1, 2
_080ACAAE:
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x2F
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080ACABC:
	movs r0, 0x1
	bl sub_80B1FD0
	ldr r0, _080ACAD8
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0xC
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACAD8: .4byte gTasks
_080ACADC:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080ACB08
	adds r0, r1
	movs r3, 0x2
	ldrsh r1, [r0, r3]
	movs r0, 0
	adds r2, r7, 0
	bl sub_80AFBA0
	ldr r1, _080ACB0C
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0xD
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACB08: .4byte 0x02019260
_080ACB0C: .4byte gTasks
_080ACB10:
	ldrb r0, [r6, 0x11]
	lsls r0, 2
	movs r5, 0x9A
	lsls r5, 1
	adds r1, r6, r5
	adds r0, r1
	ldrb r1, [r0, 0x2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080ACB2A
	bl _080ADA1A
_080ACB2A:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x23
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080ACB3C:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080ACB6C
	adds r0, r1
	ldrb r1, [r0, 0x10]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0x10
	bne _080ACB56
	movs r0, 0x8
	bl sub_80B1710
_080ACB56:
	ldr r0, _080ACB70
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x24
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACB6C: .4byte 0x02019260
_080ACB70: .4byte gTasks
_080ACB74:
	ldrb r1, [r6, 0x6]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080ACB82
	bl _080ADA1A
_080ACB82:
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x25
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080ACB94:
	adds r0, r7, 0
	movs r1, 0x1
	bl sub_80AEE54
	lsls r0, 24
	cmp r0, 0
	beq _080ACBC0
	ldr r1, _080ACBBC
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	movs r1, 0x26
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACBBC: .4byte gTasks
_080ACBC0:
	ldr r0, _080ACBD0
	mov r5, r8
	lsls r1, r5, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	b _080ACBF6
	.align 2, 0
_080ACBD0: .4byte gTasks
_080ACBD4:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bgt _080ACBF2
	bl _080ADA1A
_080ACBF2:
	movs r0, 0
	strh r0, [r1, 0x1C]
_080ACBF6:
	movs r0, 0x32
	strh r0, [r1, 0x8]
	bl _080ADA1A
_080ACBFE:
	adds r0, r7, 0
	bl sub_80AF038
	lsls r0, 24
	cmp r0, 0
	beq _080ACC10
	movs r0, 0x63
	bl PlaySE
_080ACC10:
	ldr r0, _080ACC24
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x19
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACC24: .4byte gTasks
_080ACC28:
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0
	strh r1, [r0, 0xA]
	movs r1, 0x1A
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080ACC3E:
	movs r2, 0
	movs r4, 0
	mov r5, r8
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	add r0, r12
	movs r3, 0xA
	ldrsh r6, [r0, r3]
	mov r9, r1
	cmp r6, 0x3
	bgt _080ACCA8
	ldr r3, _080ACC74
	ldr r1, _080ACC78
_080ACC5A:
	movs r4, 0
	movs r2, 0
	cmp r4, r7
	beq _080ACC7C
	ldrb r0, [r3]
	cmp r0, r6
	bne _080ACC7C
	ldrb r0, [r1, 0x13]
	cmp r0, 0xFF
	beq _080ACC7C
	movs r4, 0x1
	b _080ACCB0
	.align 2, 0
_080ACC74: .4byte gUnknown_02038696
_080ACC78: .4byte 0x02019260
_080ACC7C:
	adds r2, 0x1
	cmp r2, 0x3
	bgt _080ACC9E
	cmp r2, r7
	beq _080ACC7C
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, r6
	bne _080ACC7C
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x13]
	cmp r0, 0xFF
	beq _080ACC7C
	movs r4, 0x1
_080ACC9E:
	cmp r4, 0
	bne _080ACCB0
	adds r6, 0x1
	cmp r6, 0x3
	ble _080ACC5A
_080ACCA8:
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _080ACCE8
_080ACCB0:
	mov r5, r9
	add r5, r8
	lsls r5, 3
	add r5, r12
	ldr r0, _080ACCE0
	adds r0, r2, r0
	ldrb r0, [r0]
	strh r0, [r5, 0xA]
	lsls r0, r2, 24
	lsrs r0, 24
	lsls r4, r2, 3
	subs r4, r2
	lsls r4, 2
	ldr r1, _080ACCE4
	adds r4, r1
	ldrb r1, [r4, 0x13]
	bl sub_80B146C
	movs r0, 0xFF
	strb r0, [r4, 0x13]
	movs r0, 0x1B
	strh r0, [r5, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACCE0: .4byte gUnknown_02038696
_080ACCE4: .4byte 0x02019260
_080ACCE8:
	mov r0, r9
	add r0, r8
	lsls r0, 3
	add r0, r12
	strh r1, [r0, 0xA]
	strh r1, [r0, 0x1C]
	movs r1, 0x33
	strh r1, [r0, 0x8]
	bl sub_80AF120
	bl _080ADA1A
_080ACD00:
	ldr r0, _080ACD24
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080ACD10
	bl _080ADA1A
_080ACD10:
	ldr r0, _080ACD28
	mov r4, r8
	lsls r1, r4, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1C
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACD24: .4byte gMenuWindow
_080ACD28: .4byte gTasks
_080ACD2C:
	movs r6, 0
	mov r5, r8
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	add r1, r12
	movs r3, 0xA
	ldrsh r2, [r1, r3]
	ldr r1, _080ACD88
	mov r9, r0
	ldr r3, _080ACD8C
	adds r5, r1, 0
	ldrb r4, [r5]
	cmp r2, r4
	beq _080ACD58
	adds r1, r2, 0
	adds r2, r5, 0
_080ACD4E:
	adds r6, 0x1
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _080ACD4E
_080ACD58:
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r0, r3
	ldrb r1, [r0, 0xE]
	ldrh r0, [r0, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	negs r1, r1
	lsls r2, r6, 24
	lsrs r2, 24
	bl sub_80AFBA0
	ldr r1, _080ACD90
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1D
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACD88: .4byte gUnknown_02038696
_080ACD8C: .4byte 0x02019260
_080ACD90: .4byte gTasks
_080ACD94:
	movs r6, 0
	mov r5, r8
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	add r1, r12
	movs r2, 0xA
	ldrsh r3, [r1, r2]
	ldr r1, _080ACDE0
	mov r9, r0
	ldr r2, _080ACDE4
	adds r5, r1, 0
	ldrb r4, [r5]
	cmp r3, r4
	beq _080ACDBC
_080ACDB2:
	adds r6, 0x1
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r3, r0
	bne _080ACDB2
_080ACDBC:
	lsls r0, r6, 2
	adds r0, r2
	ldrb r1, [r0, 0x2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080ACDCE
	bl _080ADA1A
_080ACDCE:
	mov r0, r9
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x27
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACDE0: .4byte gUnknown_02038696
_080ACDE4: .4byte 0x02019338
_080ACDE8:
	movs r6, 0
	mov r5, r8
	lsls r0, r5, 2
	adds r1, r0, r5
	lsls r1, 3
	add r1, r12
	movs r3, 0xA
	ldrsh r2, [r1, r3]
	ldr r1, _080ACE38
	mov r9, r0
	adds r5, r1, 0
	ldrb r4, [r5]
	cmp r2, r4
	beq _080ACE12
	adds r1, r2, 0
	adds r2, r5, 0
_080ACE08:
	adds r6, 0x1
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r1, r0
	bne _080ACE08
_080ACE12:
	lsls r0, r6, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_80AEE54
	lsls r0, 24
	cmp r0, 0
	beq _080ACE40
	ldr r1, _080ACE3C
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	movs r1, 0x28
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACE38: .4byte gUnknown_02038696
_080ACE3C: .4byte gTasks
_080ACE40:
	ldr r0, _080ACE4C
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	b _080ACE72
	.align 2, 0
_080ACE4C: .4byte gTasks
_080ACE50:
	mov r5, r8
	lsls r0, r5, 2
	add r0, r8
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	bgt _080ACE6E
	bl _080ADA1A
_080ACE6E:
	movs r0, 0
	strh r0, [r1, 0x1C]
_080ACE72:
	movs r0, 0x1E
	strh r0, [r1, 0x8]
	bl _080ADA1A
_080ACE7A:
	movs r6, 0
	ldr r2, _080ACEC8
	ldrb r3, [r2]
	mov r4, r8
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	mov r5, r12
	adds r4, r0, r5
	movs r5, 0xA
	ldrsh r0, [r4, r5]
	mov r9, r1
	adds r5, r2, 0
	cmp r3, r0
	beq _080ACEAE
	adds r3, r5, 0
	adds r2, r4, 0
_080ACE9C:
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080ACEAE
	adds r0, r6, r3
	ldrb r1, [r0]
	movs r4, 0xA
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _080ACE9C
_080ACEAE:
	lsls r4, r6, 24
	lsrs r0, r4, 24
	bl sub_80AF038
	lsls r0, 24
	adds r5, r4, 0
	cmp r0, 0
	beq _080ACECC
	movs r0, 0x63
	bl PlaySE
	b _080ACED2
	.align 2, 0
_080ACEC8: .4byte gUnknown_02038696
_080ACECC:
	movs r0, 0x64
	bl PlaySE
_080ACED2:
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	ldr r1, _080ACF10
	adds r4, r0, r1
	ldrb r1, [r4, 0x15]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080ACEF6
	lsrs r0, r5, 24
	bl sub_80B03A8
	ldrb r1, [r4, 0x15]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x15]
_080ACEF6:
	ldr r0, _080ACF14
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	movs r0, 0x1A
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACF10: .4byte 0x02019260
_080ACF14: .4byte gTasks
_080ACF18:
	mov r5, r8
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	mov r1, r12
	adds r3, r0, r1
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	mov r9, r2
	cmp r0, 0x9
	bgt _080ACF38
	bl _080ADA1A
_080ACF38:
	movs r0, 0
	strh r0, [r3, 0x1C]
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080ACF98
	adds r2, r0, r1
	ldrb r1, [r2, 0xC]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080ACF5A
	ldrb r1, [r2, 0x11]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080ACF86
_080ACF5A:
	bl sub_80AF138
	ldr r0, _080ACF9C
	lsls r1, r7, 6
	ldr r2, _080ACFA0
	adds r1, r2
	bl StringCopy
	ldr r4, _080ACFA4
	ldr r1, _080ACFA8
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080ACFAC
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
_080ACF86:
	ldr r0, _080ACFB0
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x34
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACF98: .4byte 0x02019260
_080ACF9C: .4byte gStringVar1
_080ACFA0: .4byte 0x02038572
_080ACFA4: .4byte gStringVar4
_080ACFA8: .4byte gUnknown_083CC103
_080ACFAC: .4byte gMenuWindow
_080ACFB0: .4byte gTasks
_080ACFB4:
	ldr r0, _080ACFEC
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080ACFC4
	bl _080ADA1A
_080ACFC4:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080ACFF0
	adds r0, r1
	ldrb r1, [r0, 0x15]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080ACFF8
	ldr r0, _080ACFF4
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x11
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080ACFEC: .4byte gMenuWindow
_080ACFF0: .4byte 0x02019260
_080ACFF4: .4byte gTasks
_080ACFF8:
	ldr r0, _080AD00C
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0xE
	strh r0, [r1, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AD00C: .4byte gTasks
_080AD010:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080AD034
	adds r0, r1
	ldrb r4, [r0, 0x16]
	lsls r4, 24
	lsrs r5, r4, 24
	cmp r5, 0
	beq _080AD098
	bl sub_80AF138
	asrs r0, r4, 24
	cmp r0, 0x1
	bne _080AD040
	ldr r0, _080AD038
	ldr r1, _080AD03C
	b _080AD048
	.align 2, 0
_080AD034: .4byte 0x02019260
_080AD038: .4byte gMenuWindow
_080AD03C: .4byte gUnknown_083CBD79
_080AD040:
	cmp r0, 0x2
	bne _080AD060
	ldr r0, _080AD058
	ldr r1, _080AD05C
_080AD048:
	movs r2, 0xC2
	lsls r2, 2
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x1
	bl sub_8002EB0
	b _080AD072
	.align 2, 0
_080AD058: .4byte gMenuWindow
_080AD05C: .4byte gUnknown_083CBD9D
_080AD060:
	ldr r0, _080AD08C
	ldr r1, _080AD090
	movs r2, 0xC2
	lsls r2, 2
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x1
	bl sub_8002EB0
_080AD072:
	movs r0, 0x3
	bl sub_80B1710
	ldr r1, _080AD094
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	b _080AD0D8
	.align 2, 0
_080AD08C: .4byte gMenuWindow
_080AD090: .4byte gUnknown_083CBDC6
_080AD094: .4byte gTasks
_080AD098:
	bl sub_80AF138
	ldr r0, _080AD0E0
	lsls r1, r7, 6
	ldr r2, _080AD0E4
	adds r1, r2
	bl StringCopy
	ldr r4, _080AD0E8
	ldr r1, _080AD0EC
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080AD0F0
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	movs r0, 0x2
	bl sub_80B1710
	ldr r1, _080AD0F4
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0x1C]
_080AD0D8:
	movs r1, 0x2D
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AD0E0: .4byte gStringVar1
_080AD0E4: .4byte 0x02038572
_080AD0E8: .4byte gStringVar4
_080AD0EC: .4byte gUnknown_083CBD52
_080AD0F0: .4byte gMenuWindow
_080AD0F4: .4byte gTasks
_080AD0F8:
	ldrb r1, [r6, 0x6]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AD106
	bl _080ADA1A
_080AD106:
	ldrb r0, [r6, 0x11]
	bl sub_80B09B0
	ldr r1, _080AD120
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0xF
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AD120: .4byte gTasks
_080AD124:
	ldr r0, _080AD184
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AD134
	bl _080ADA1A
_080AD134:
	ldr r1, _080AD188
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x32
	bgt _080AD152
	bl _080ADA1A
_080AD152:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080AD18C
	adds r6, r0, r1
	ldrb r1, [r6, 0x15]
	movs r5, 0x10
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	bne _080AD17C
	movs r1, 0x2
	ldrsh r0, [r6, r1]
	ldrb r1, [r6, 0x17]
	adds r2, r7, 0
	bl sub_80AFBA0
	ldrh r0, [r6, 0x2]
	ldrb r2, [r6, 0x17]
	adds r0, r2
	strh r0, [r6, 0x2]
_080AD17C:
	strh r5, [r4, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AD184: .4byte gMenuWindow
_080AD188: .4byte gTasks
_080AD18C: .4byte 0x02019260
_080AD190:
	lsls r0, r7, 2
	ldr r1, _080AD1BC
	adds r0, r1
	ldrb r1, [r0, 0x2]
	movs r0, 0x4
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080AD1A8
	bl _080ADA1A
_080AD1A8:
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	strh r1, [r0, 0x1C]
	movs r1, 0x11
	strh r1, [r0, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AD1BC: .4byte 0x02019338
_080AD1C0:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080AD21C
	adds r0, r1
	ldrb r1, [r0, 0x15]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD238
	bl sub_80AF138
	ldr r0, _080AD220
	lsls r1, r7, 6
	ldr r2, _080AD224
	adds r1, r2
	bl StringCopy
	ldr r4, _080AD228
	ldr r1, _080AD22C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080AD230
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r0, _080AD234
	mov r5, r8
	lsls r4, r5, 2
	add r4, r8
	lsls r4, 3
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x1C]
	bl sub_80B1710
	movs r0, 0x2E
	strh r0, [r4, 0x8]
	bl _080ADA1A
	.align 2, 0
_080AD21C: .4byte 0x02019260
_080AD220: .4byte gStringVar1
_080AD224: .4byte 0x02038572
_080AD228: .4byte gStringVar4
_080AD22C: .4byte gUnknown_083CC075
_080AD230: .4byte gMenuWindow
_080AD234: .4byte gTasks
_080AD238:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x29
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080AD24A:
	ldrb r1, [r6, 0x6]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AD258
	bl _080ADA1A
_080AD258:
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x13
	strh r1, [r0, 0x8]
	bl _080ADA1A
_080AD26A:
	ldr r0, _080AD2AC
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AD27A
	bl _080ADA1A
_080AD27A:
	lsls r4, r7, 3
	subs r4, r7
	lsls r4, 2
	ldr r0, _080AD2B0
	adds r4, r0
	movs r3, 0x2
	ldrsh r0, [r4, r3]
	ldrb r1, [r4, 0x18]
	negs r1, r1
	adds r2, r7, 0
	bl sub_80AFBA0
	ldrb r1, [r4, 0x18]
	ldrh r0, [r4, 0x2]
	subs r0, r1
	strh r0, [r4, 0x2]
	ldr r1, _080AD2B4
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x12
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD2AC: .4byte gMenuWindow
_080AD2B0: .4byte 0x02019260
_080AD2B4: .4byte gTasks
_080AD2B8:
	bl sub_80B0D7C
	lsls r0, r7, 2
	ldr r1, _080AD2EC
	adds r0, r1
	ldrb r1, [r0, 0x2]
	movs r0, 0x4
	ands r0, r1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _080AD2D2
	b _080ADA1A
_080AD2D2:
	ldr r0, _080AD2F0
	mov r5, r8
	lsls r4, r5, 2
	add r4, r8
	lsls r4, 3
	adds r4, r0
	strh r6, [r4, 0x1C]
	bl sub_80AF138
	movs r0, 0x29
	strh r0, [r4, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD2EC: .4byte 0x02019338
_080AD2F0: .4byte gTasks
_080AD2F4:
	ldr r2, _080AD31C
	ldrb r1, [r2, 0x1]
	movs r0, 0x1
	ands r0, r1
	adds r1, r2, 0
	cmp r0, 0
	beq _080AD320
	ldr r0, [r1]
	lsls r0, 20
	lsrs r0, 29
	cmp r7, r0
	beq _080AD320
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	movs r1, 0x39
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD31C: .4byte 0x02019328
_080AD320:
	ldrb r4, [r1]
	lsls r2, r7, 3
	subs r0, r2, r7
	lsls r0, 2
	subs r1, 0xC8
	adds r5, r0, r1
	ldrb r1, [r5, 0x11]
	movs r0, 0x10
	ands r0, r1
	mov r10, r2
	cmp r0, 0
	beq _080AD354
	movs r4, 0x1
	ldr r0, _080AD34C
	ldrh r2, [r5, 0x6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080AD350
	adds r1, r2
	bl StringCopy
	b _080AD36E
	.align 2, 0
_080AD34C: .4byte gStringVar3
_080AD350: .4byte gMoveNames
_080AD354:
	ldr r0, _080AD3C0
	ldr r3, _080AD3C4
	ldr r2, _080AD3C8
	ldrh r1, [r5, 0x6]
	lsls r1, 3
	adds r1, r2
	ldrb r1, [r1, 0x1]
	lsls r1, 29
	lsrs r1, 27
	adds r1, r3
	ldr r1, [r1]
	bl StringCopy
_080AD36E:
	lsls r0, r4, 24
	cmp r0, 0
	ble _080AD38A
	mov r2, r10
	subs r0, r2, r7
	lsls r0, 2
	ldr r1, _080AD3CC
	adds r0, r1
	ldrb r1, [r0, 0x15]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD38A
	movs r4, 0
_080AD38A:
	bl sub_80AF138
	ldr r0, _080AD3D0
	lsls r1, r7, 6
	ldr r2, _080AD3D4
	adds r1, r2
	bl StringCopy
	ldr r3, _080AD3D8
	ldrb r0, [r3, 0x13]
	lsls r1, r4, 24
	asrs r2, r1, 24
	adds r0, r2, r0
	strb r0, [r3, 0x13]
	lsls r0, 24
	adds r4, r1, 0
	cmp r0, 0
	bge _080AD3B2
	movs r0, 0
	strb r0, [r3, 0x13]
_080AD3B2:
	cmp r2, 0
	bne _080AD3E0
	ldr r0, _080AD3DC
	mov r3, r8
	lsls r1, r3, 2
	b _080AD83C
	.align 2, 0
_080AD3C0: .4byte gStringVar3
_080AD3C4: .4byte gUnknown_083CC2D8
_080AD3C8: .4byte gContestMoves
_080AD3CC: .4byte 0x02019260
_080AD3D0: .4byte gStringVar1
_080AD3D4: .4byte 0x02038572
_080AD3D8: .4byte 0x02019204
_080AD3DC: .4byte gTasks
_080AD3E0:
	cmp r2, 0
	bge _080AD3F8
	ldr r0, _080AD3F0
	ldr r1, _080AD3F4
	bl StringExpandPlaceholders
	b _080AD420
	.align 2, 0
_080AD3F0: .4byte gStringVar4
_080AD3F4: .4byte gUnknown_083CC0BC
_080AD3F8:
	cmp r2, 0
	ble _080AD418
	movs r0, 0x13
	ldrsb r0, [r3, r0]
	cmp r0, 0x4
	bgt _080AD418
	ldr r0, _080AD410
	ldr r1, _080AD414
	bl StringExpandPlaceholders
	b _080AD420
	.align 2, 0
_080AD410: .4byte gStringVar4
_080AD414: .4byte gUnknown_083CC0A0
_080AD418:
	ldr r0, _080AD450
	ldr r1, _080AD454
	bl StringExpandPlaceholders
_080AD420:
	ldr r0, _080AD458
	ldr r1, _080AD450
	movs r2, 0xC2
	lsls r2, 2
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080AD45C
	mov r5, r8
	lsls r0, r5, 2
	add r0, r8
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0
	strh r0, [r1, 0x1C]
	strh r0, [r1, 0x1E]
	cmp r4, 0
	bge _080AD460
	movs r0, 0x35
	strh r0, [r1, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD450: .4byte gStringVar4
_080AD454: .4byte gUnknown_083CC0E3
_080AD458: .4byte gMenuWindow
_080AD45C: .4byte gTasks
_080AD460:
	movs r0, 0x36
	strh r0, [r1, 0x8]
	b _080ADA1A
_080AD466:
	mov r1, r8
	lsls r0, r1, 2
	add r0, r8
	lsls r0, 3
	mov r2, r12
	adds r4, r0, r2
	movs r3, 0x1C
	ldrsh r2, [r4, r3]
	cmp r2, 0x1
	beq _080AD4A4
	cmp r2, 0x1
	bgt _080AD484
	cmp r2, 0
	beq _080AD48E
	b _080ADA1A
_080AD484:
	cmp r2, 0x2
	beq _080AD4CC
	cmp r2, 0x3
	beq _080AD500
	b _080ADA1A
_080AD48E:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x1
	bl sub_80B1EA8
	ldr r0, _080AD4A0
	bl PlayFanfare
	b _080AD4F8
	.align 2, 0
_080AD4A0: .4byte 0x00000187
_080AD4A4:
	ldrb r0, [r6, 0x7]
	ands r2, r0
	cmp r2, 0
	beq _080AD4AE
	b _080ADA1A
_080AD4AE:
	ldr r0, _080AD4C8
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AD4BC
	b _080ADA1A
_080AD4BC:
	movs r0, 0x1
	negs r0, r0
	bl sub_80B1CBC
	b _080AD4F8
	.align 2, 0
_080AD4C8: .4byte gMenuWindow
_080AD4CC:
	ldrb r1, [r6, 0x6]
	movs r0, 0x20
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080AD4DC
	b _080ADA1A
_080AD4DC:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	bgt _080AD4EC
	b _080ADA1A
_080AD4EC:
	strh r2, [r4, 0x1E]
	movs r1, 0x1
	negs r1, r1
	adds r0, r1, 0
	bl sub_80B1EA8
_080AD4F8:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	b _080ADA1A
_080AD500:
	ldr r0, _080AD51C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080AD512
	b _080ADA1A
_080AD512:
	strh r0, [r4, 0x1C]
	strh r0, [r4, 0x1E]
	movs r0, 0x2B
	strh r0, [r4, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD51C: .4byte gPaletteFade
_080AD520:
	mov r4, r8
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	add r0, r12
	movs r5, 0x1C
	ldrsh r0, [r0, r5]
	mov r9, r1
	cmp r0, 0x4
	bls _080AD536
	b _080ADA1A
_080AD536:
	lsls r0, 2
	ldr r1, _080AD540
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AD540: .4byte _080AD544
	.align 2, 0
_080AD544:
	.4byte _080AD558
	.4byte _080AD570
	.4byte _080AD58E
	.4byte _080AD5F0
	.4byte _080AD63C
_080AD558:
	ldr r0, _080AD56C
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AD566
	b _080ADA1A
_080AD566:
	movs r0, 0x1
	movs r1, 0x1
	b _080AD618
	.align 2, 0
_080AD56C: .4byte gMenuWindow
_080AD570:
	ldrb r1, [r6, 0x7]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AD57C
	b _080ADA1A
_080AD57C:
	bl sub_80B1DDC
	movs r0, 0xDF
	bl PlaySE
	movs r0, 0x1
	bl sub_80B1CBC
	b _080AD61C
_080AD58E:
	ldrb r1, [r6, 0x6]
	movs r0, 0x20
	ands r0, r1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080AD59E
	b _080ADA1A
_080AD59E:
	mov r0, r9
	add r0, r8
	lsls r0, 3
	mov r1, r12
	adds r3, r0, r1
	ldrh r0, [r3, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	bgt _080AD5B8
	b _080ADA1A
_080AD5B8:
	strh r2, [r3, 0x1E]
	lsls r4, r7, 3
	subs r4, r7
	lsls r4, 2
	adds r0, r6, 0
	adds r0, 0x5C
	adds r4, r0
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	movs r1, 0x92
	lsls r1, 1
	adds r5, r6, r1
	movs r1, 0x2
	ldrsb r1, [r5, r1]
	adds r2, r7, 0
	str r3, [sp, 0x4]
	bl sub_80AFBA0
	movs r0, 0x2
	ldrsb r0, [r5, r0]
	ldrh r2, [r4, 0x2]
	adds r0, r2
	strh r0, [r4, 0x2]
	ldr r3, [sp, 0x4]
	ldrh r0, [r3, 0x1C]
	adds r0, 0x1
	strh r0, [r3, 0x1C]
	b _080ADA1A
_080AD5F0:
	lsls r0, r7, 2
	ldr r2, _080AD630
	adds r0, r2
	ldrb r1, [r0, 0x2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080AD602
	b _080ADA1A
_080AD602:
	ldr r3, _080AD634
	adds r0, r2, r3
	ldrb r1, [r0, 0x6]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080AD612
	b _080ADA1A
_080AD612:
	movs r1, 0x1
	negs r1, r1
	movs r0, 0x1
_080AD618:
	bl sub_80B1EA8
_080AD61C:
	ldr r0, _080AD638
	mov r1, r9
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
	b _080ADA1A
	.align 2, 0
_080AD630: .4byte 0x02019338
_080AD634: .4byte 0xfffffecc
_080AD638: .4byte gTasks
_080AD63C:
	ldr r0, _080AD660
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080AD64E
	b _080ADA1A
_080AD64E:
	mov r0, r9
	add r0, r8
	lsls r0, 3
	add r0, r12
	strh r1, [r0, 0x1C]
	strh r1, [r0, 0x1E]
	movs r1, 0x2B
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD660: .4byte gPaletteFade
_080AD664:
	lsls r0, r7, 2
	ldr r1, _080AD684
	adds r0, r1
	ldrb r1, [r0, 0x2]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080AD676
	b _080ADA1A
_080AD676:
	bl sub_80AF138
	ldr r0, _080AD688
	mov r4, r8
	lsls r1, r4, 2
	b _080AD83C
	.align 2, 0
_080AD684: .4byte 0x02019338
_080AD688: .4byte gTasks
_080AD68C:
	bl sub_80AF138
	ldr r0, _080AD6F8
	ldr r4, _080AD6FC
	ldr r1, [r4]
	lsls r1, 20
	lsrs r1, 29
	lsls r1, 6
	ldr r5, _080AD700
	adds r1, r5
	bl StringCopy
	ldr r0, _080AD704
	lsls r1, r7, 6
	adds r1, r5
	bl StringCopy
	ldr r0, _080AD708
	lsls r1, r7, 3
	subs r1, r7
	lsls r1, 2
	subs r4, 0xC8
	adds r1, r4
	ldrh r2, [r1, 0x6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080AD70C
	adds r1, r2
	bl StringCopy
	ldr r4, _080AD710
	ldr r1, _080AD714
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080AD718
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080AD71C
	mov r5, r8
	lsls r0, r5, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3A
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD6F8: .4byte gStringVar3
_080AD6FC: .4byte 0x02019328
_080AD700: .4byte 0x02038572
_080AD704: .4byte gStringVar1
_080AD708: .4byte gStringVar2
_080AD70C: .4byte gMoveNames
_080AD710: .4byte gStringVar4
_080AD714: .4byte gUnknown_083CC14A
_080AD718: .4byte gMenuWindow
_080AD71C: .4byte gTasks
_080AD720:
	ldr r5, _080AD764
	adds r0, r5, 0
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AD730
	b _080ADA1A
_080AD730:
	bl sub_80AF138
	ldr r4, _080AD768
	ldr r1, _080AD76C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	movs r2, 0xC2
	lsls r2, 2
	movs r0, 0xF
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080AD770
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x3B
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD764: .4byte gMenuWindow
_080AD768: .4byte gStringVar4
_080AD76C: .4byte gUnknown_083CC16E
_080AD770: .4byte gTasks
_080AD774:
	ldr r0, _080AD790
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AD782
	b _080ADA1A
_080AD782:
	bl sub_80AF138
	ldr r0, _080AD794
	mov r3, r8
	lsls r1, r3, 2
	b _080AD83C
	.align 2, 0
_080AD790: .4byte gMenuWindow
_080AD794: .4byte gTasks
_080AD798:
	lsls r0, r7, 3
	subs r0, r7
	lsls r0, 2
	ldr r1, _080AD804
	adds r4, r0, r1
	ldrb r1, [r4, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080AD7B4
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x15]
_080AD7B4:
	adds r0, r7, 0
	bl sub_80B09B0
	ldr r0, _080AD808
	lsls r1, r7, 6
	ldr r2, _080AD80C
	adds r1, r2
	bl StringCopy
	ldr r0, _080AD810
	ldrh r2, [r4, 0x6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080AD814
	adds r1, r2
	bl StringCopy
	ldr r4, _080AD818
	ldr r1, _080AD81C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080AD820
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080AD824
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x22
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD804: .4byte 0x02019260
_080AD808: .4byte gStringVar1
_080AD80C: .4byte 0x02038572
_080AD810: .4byte gStringVar2
_080AD814: .4byte gMoveNames
_080AD818: .4byte gStringVar4
_080AD81C: .4byte gUnknown_083CBF60
_080AD820: .4byte gMenuWindow
_080AD824: .4byte gTasks
_080AD828:
	ldr r0, _080AD848
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	bne _080AD836
	b _080ADA1A
_080AD836:
	ldr r0, _080AD84C
	mov r5, r8
	lsls r1, r5, 2
_080AD83C:
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x37
	strh r0, [r1, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD848: .4byte gMenuWindow
_080AD84C: .4byte gTasks
_080AD850:
	bl sub_80B1BDC
	ldr r0, _080AD868
	mov r2, r8
	lsls r1, r2, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x38
	strh r0, [r1, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD868: .4byte gTasks
_080AD86C:
	ldrb r1, [r6, 0x6]
	movs r0, 0x40
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _080AD87C
	b _080ADA1A
_080AD87C:
	movs r0, 0x13
	ldrsb r0, [r6, r0]
	cmp r0, 0x4
	ble _080AD88A
	strb r1, [r6, 0x13]
	bl sub_80B1928
_080AD88A:
	ldr r0, _080AD89C
	mov r3, r8
	lsls r1, r3, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0xA
	strh r0, [r1, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD89C: .4byte gTasks
_080AD8A0:
	mov r4, r8
	lsls r2, r4, 2
	add r2, r8
	lsls r2, 3
	add r2, r12
	ldrb r5, [r2, 0xC]
	ldr r1, _080AD8C4
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080AD8C8
	str r1, [r0]
	movs r0, 0xB
	strh r0, [r2, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD8C4: .4byte gSprites
_080AD8C8: .4byte sub_80AD92C
_080AD8CC:
	mov r5, r8
	lsls r0, r5, 2
	add r0, r8
	lsls r0, 3
	mov r1, r12
	adds r4, r0, r1
	ldrb r5, [r4, 0xC]
	ldr r1, _080AD904
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r6, r0, r1
	adds r0, r6, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	blt _080AD8F2
	b _080ADA1A
_080AD8F2:
	adds r0, r6, 0
	bl FreeSpriteOamMatrix
	adds r0, r6, 0
	bl DestroySprite
	movs r0, 0x14
	strh r0, [r4, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD904: .4byte gSprites
_080AD908:
	movs r6, 0
	mov r2, r8
	lsls r2, 2
	mov r9, r2
_080AD910:
	lsls r0, r6, 24
	lsrs r0, 24
	movs r1, 0x1
	bl sub_80B0CDC
	adds r6, 0x1
	cmp r6, 0x3
	ble _080AD910
	ldr r1, _080AD934
	mov r0, r9
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x1C]
	movs r1, 0x15
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD934: .4byte gTasks
_080AD938:
	bl sub_80AF138
	ldr r0, _080AD978
	lsls r1, r7, 6
	ldr r2, _080AD97C
	adds r1, r2
	bl StringCopy
	ldr r4, _080AD980
	ldr r1, _080AD984
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080AD988
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080AD98C
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	movs r1, 0x20
	strh r1, [r0, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD978: .4byte gStringVar1
_080AD97C: .4byte 0x02038572
_080AD980: .4byte gStringVar4
_080AD984: .4byte gUnknown_083CB00D
_080AD988: .4byte gMenuWindow
_080AD98C: .4byte gTasks
_080AD990:
	ldr r0, _080AD9B0
	bl sub_80037A0
	lsls r0, 24
	cmp r0, 0
	beq _080ADA1A
	ldr r0, _080AD9B4
	mov r4, r8
	lsls r1, r4, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	movs r0, 0x15
	strh r0, [r1, 0x8]
	b _080ADA1A
	.align 2, 0
_080AD9B0: .4byte gMenuWindow
_080AD9B4: .4byte gTasks
_080AD9B8:
	mov r5, r8
	lsls r0, r5, 2
	add r0, r8
	lsls r0, 3
	mov r2, r12
	adds r1, r0, r2
	ldrh r0, [r1, 0x1C]
	adds r0, 0x1
	strh r0, [r1, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080ADA1A
	movs r0, 0
	strh r0, [r1, 0x1C]
	movs r0, 0x16
	strh r0, [r1, 0x8]
	b _080ADA1A
_080AD9DC:
	ldrb r0, [r6, 0x10]
	adds r0, 0x1
	movs r1, 0
	strb r0, [r6, 0x10]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _080ADA08
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	strh r1, [r0, 0x8]
	strh r1, [r0, 0xA]
	strh r1, [r0, 0xC]
	ldr r1, _080ADA04
	str r1, [r0]
	b _080ADA14
	.align 2, 0
_080ADA04: .4byte sub_80AD960
_080ADA08:
	mov r4, r8
	lsls r0, r4, 2
	add r0, r8
	lsls r0, 3
	add r0, r12
	strh r1, [r0, 0x8]
_080ADA14:
	movs r0, 0
	bl nullsub_18
_080ADA1A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80AC2CC

	thumb_func_start sub_80AD8DC
sub_80AD8DC: @ 80ADA2C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080ADA48
	ldrb r2, [r3, 0x7]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r3, 0x7]
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_080ADA48: .4byte 0x02019204
	thumb_func_end sub_80AD8DC

	thumb_func_start sub_80AD8FC
sub_80AD8FC: @ 80ADA4C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0x24]
	movs r3, 0x24
	ldrsh r2, [r1, r3]
	cmp r2, 0
	beq _080ADA60
	subs r0, 0x2
	strh r0, [r1, 0x24]
	b _080ADA74
_080ADA60:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1F
	bne _080ADA74
	strh r2, [r1, 0x2E]
	ldr r0, _080ADA78
	str r0, [r1, 0x1C]
_080ADA74:
	pop {r0}
	bx r0
	.align 2, 0
_080ADA78: .4byte SpriteCallbackDummy
	thumb_func_end sub_80AD8FC

	thumb_func_start sub_80AD92C
sub_80AD92C: @ 80ADA7C
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x24]
	subs r0, 0x6
	strh r0, [r2, 0x24]
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	movs r3, 0x24
	ldrsh r1, [r2, r3]
	adds r0, r1
	movs r1, 0x20
	negs r1, r1
	cmp r0, r1
	bge _080ADAA6
	ldr r0, _080ADAAC
	str r0, [r2, 0x1C]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
_080ADAA6:
	pop {r0}
	bx r0
	.align 2, 0
_080ADAAC: .4byte SpriteCallbackDummy
	thumb_func_end sub_80AD92C

	thumb_func_start sub_80AD960
sub_80AD960: @ 80ADAB0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ADAD4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r5, r1, r2
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080ADB42
	cmp r0, 0x1
	bgt _080ADAD8
	cmp r0, 0
	beq _080ADADE
	b _080ADB60
	.align 2, 0
_080ADAD4: .4byte gTasks
_080ADAD8:
	cmp r0, 0x2
	beq _080ADB58
	b _080ADB60
_080ADADE:
	ldr r0, _080ADB28
	ldrb r1, [r0]
	movs r6, 0x1
	adds r0, r6, 0
	ands r0, r1
	cmp r0, 0
	beq _080ADB38
	ldr r2, _080ADB2C
	ldrb r0, [r2, 0x7]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x7]
	bl sub_80AE074
	lsls r0, 24
	cmp r0, 0
	beq _080ADB08
	bl sub_80AF2FC
	bl sub_80AF3C0
_080ADB08:
	ldr r4, _080ADB30
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ADB34
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl sub_80AF860
	strh r6, [r5, 0x8]
	b _080ADB60
	.align 2, 0
_080ADB28: .4byte gUnknown_0203869A
_080ADB2C: .4byte 0x02019204
_080ADB30: .4byte sub_80C8C80
_080ADB34: .4byte sub_80AD8DC
_080ADB38:
	bl sub_80AF2FC
	bl sub_80AF3C0
	b _080ADB4E
_080ADB42:
	ldr r0, _080ADB54
	ldrb r1, [r0, 0x7]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080ADB60
_080ADB4E:
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080ADB60
	.align 2, 0
_080ADB54: .4byte 0x02019204
_080ADB58:
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080ADB68
	str r0, [r5]
_080ADB60:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADB68: .4byte sub_80ADA1C
	thumb_func_end sub_80AD960

	thumb_func_start sub_80ADA1C
sub_80ADA1C: @ 80ADB6C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80B1FD0
	ldr r1, _080ADB94
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	strh r1, [r0, 0xA]
	ldr r1, _080ADB98
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADB94: .4byte gTasks
_080ADB98: .4byte sub_80ADA4C
	thumb_func_end sub_80ADA1C

	thumb_func_start sub_80ADA4C
sub_80ADA4C: @ 80ADB9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ADBC0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0x1
	beq _080ADBE2
	cmp r5, 0x1
	bgt _080ADBC4
	cmp r5, 0
	beq _080ADBCA
	b _080ADC1E
	.align 2, 0
_080ADBC0: .4byte gTasks
_080ADBC4:
	cmp r5, 0x2
	beq _080ADC10
	b _080ADC1E
_080ADBCA:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080ADC1E
	movs r0, 0x2
	bl sub_80B25E4
	strh r5, [r4, 0xA]
	b _080ADC02
_080ADBE2:
	ldr r0, _080ADC0C
	ldrb r1, [r0, 0x7]
	movs r0, 0x2
	ands r0, r1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _080ADC1E
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080ADC1E
	strh r1, [r4, 0xA]
_080ADC02:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080ADC1E
	.align 2, 0
_080ADC0C: .4byte 0x02019204
_080ADC10:
	bl sub_80AFF10
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	ldr r0, _080ADC24
	str r0, [r4]
_080ADC1E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC24: .4byte sub_80ADAD8
	thumb_func_end sub_80ADA4C

	thumb_func_start sub_80ADAD8
sub_80ADAD8: @ 80ADC28
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80AFF28
	lsls r0, 24
	cmp r0, 0
	beq _080ADC46
	ldr r0, _080ADC4C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080ADC50
	str r0, [r1]
_080ADC46:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC4C: .4byte gTasks
_080ADC50: .4byte sub_80ADB04
	thumb_func_end sub_80ADAD8

	thumb_func_start sub_80ADB04
sub_80ADB04: @ 80ADC54
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ADC80
	ldr r3, _080ADC84
	ldr r1, _080ADC88
	str r2, [r1]
	str r3, [r1, 0x4]
	ldr r2, _080ADC8C
	str r2, [r1, 0x8]
	ldr r1, [r1, 0x8]
	ldr r2, _080ADC90
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x2
	strh r0, [r1, 0xA]
	ldr r0, _080ADC94
	str r0, [r1]
	bx lr
	.align 2, 0
_080ADC80: .4byte 0x02018204
_080ADC84: .4byte gPlttBufferUnfaded
_080ADC88: .4byte 0x040000d4
_080ADC8C: .4byte 0x84000100
_080ADC90: .4byte gTasks
_080ADC94: .4byte sub_80ADB48
	thumb_func_end sub_80ADB04

	thumb_func_start sub_80ADB48
sub_80ADB48: @ 80ADC98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ADCD0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080ADCCA
	movs r0, 0
	strh r0, [r1, 0x8]
	ldrh r0, [r1, 0xA]
	subs r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	cmp r0, 0
	bne _080ADCCA
	ldr r0, _080ADCD4
	str r0, [r1]
_080ADCCA:
	pop {r0}
	bx r0
	.align 2, 0
_080ADCD0: .4byte gTasks
_080ADCD4: .4byte sub_80ADB88
	thumb_func_end sub_80ADB48

	thumb_func_start sub_80ADB88
sub_80ADB88: @ 80ADCD8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _080ADD3C
	ldrb r1, [r6]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _080ADD40
	adds r0, r1
	ldrb r4, [r0, 0x1A]
	bl sub_80AF138
	ldr r0, _080ADD44
	ldrb r1, [r6]
	lsls r1, 6
	ldr r2, _080ADD48
	adds r1, r2
	bl StringCopy
	ldr r6, _080ADD4C
	ldr r0, _080ADD50
	lsls r4, 2
	adds r4, r0
	ldr r1, [r4]
	adds r0, r6, 0
	bl StringExpandPlaceholders
	ldr r0, _080ADD54
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r6, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080ADD58
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080ADD5C
	str r1, [r0]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD3C: .4byte gContestPlayerMonIndex
_080ADD40: .4byte 0x02019260
_080ADD44: .4byte gStringVar1
_080ADD48: .4byte 0x02038572
_080ADD4C: .4byte gStringVar4
_080ADD50: .4byte gUnknown_083CB2F0
_080ADD54: .4byte gMenuWindow
_080ADD58: .4byte gTasks
_080ADD5C: .4byte sub_80ADC10
	thumb_func_end sub_80ADB88

	thumb_func_start sub_80ADC10
sub_80ADC10: @ 80ADD60
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080ADD90
	bl sub_80037A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080ADD8A
	ldr r1, _080ADD94
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080ADD98
	str r1, [r0]
	bl sub_80B0D7C
_080ADD8A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADD90: .4byte gMenuWindow
_080ADD94: .4byte gTasks
_080ADD98: .4byte sub_80ADC4C
	thumb_func_end sub_80ADC10

	thumb_func_start sub_80ADC4C
sub_80ADC4C: @ 80ADD9C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080ADDCC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080ADDC6
	movs r0, 0
	strh r0, [r4, 0x8]
	bl sub_80AFF10
	ldr r0, _080ADDD0
	str r0, [r4]
_080ADDC6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADDCC: .4byte gTasks
_080ADDD0: .4byte sub_80ADC84
	thumb_func_end sub_80ADC4C

	thumb_func_start sub_80ADC84
sub_80ADC84: @ 80ADDD4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_80AFF28
	lsls r0, 24
	cmp r0, 0
	beq _080ADDF6
	ldr r1, _080ADDFC
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080ADE00
	str r1, [r0]
_080ADDF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADDFC: .4byte gTasks
_080ADE00: .4byte sub_80ADCB4
	thumb_func_end sub_80ADC84

	thumb_func_start sub_80ADCB4
sub_80ADCB4: @ 80ADE04
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B2184
	ldr r1, _080ADE24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080ADE28
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE24: .4byte gTasks
_080ADE28: .4byte sub_80B237C
	thumb_func_end sub_80ADCB4

	thumb_func_start sub_80ADCDC
sub_80ADCDC: @ 80ADE2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_80B2280
	ldr r1, _080ADE4C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080ADE50
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADE4C: .4byte gTasks
_080ADE50: .4byte sub_80ADD04
	thumb_func_end sub_80ADCDC

	thumb_func_start sub_80ADD04
sub_80ADD04: @ 80ADE54
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, _080ADE90
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	strb r0, [r3]
	ldr r2, _080ADE94
	ldrb r0, [r2]
	ands r1, r0
	strb r1, [r2]
	ldr r1, _080ADE98
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _080ADEA4
	ldr r0, _080ADE9C
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080ADEA0
	b _080ADEB4
	.align 2, 0
_080ADE90: .4byte 0x04000008
_080ADE94: .4byte 0x0400000c
_080ADE98: .4byte 0x02019204
_080ADE9C: .4byte gTasks
_080ADEA0: .4byte sub_80ADDA4
_080ADEA4:
	bl sub_80B1B14
	ldr r0, _080ADEBC
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _080ADEC0
_080ADEB4:
	str r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADEBC: .4byte gTasks
_080ADEC0: .4byte sub_80ADD74
	thumb_func_end sub_80ADD04

	thumb_func_start sub_80ADD74
sub_80ADD74: @ 80ADEC4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080ADEE8
	ldrb r1, [r0, 0x6]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080ADEE4
	ldr r0, _080ADEEC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080ADEF0
	str r0, [r1]
_080ADEE4:
	pop {r0}
	bx r0
	.align 2, 0
_080ADEE8: .4byte 0x02019204
_080ADEEC: .4byte gTasks
_080ADEF0: .4byte sub_80ABB70
	thumb_func_end sub_80ADD74

	thumb_func_start sub_80ADDA4
sub_80ADDA4: @ 80ADEF4
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080ADF74
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080ADF78
	strh r1, [r0]
	ldr r3, _080ADF7C
	ldr r2, _080ADF80
	movs r1, 0x3
_080ADF0C:
	ldrh r0, [r3, 0x4]
	strh r0, [r2]
	adds r3, 0x1C
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bge _080ADF0C
	movs r5, 0
	bl sub_80AF668
	bl sub_80AF138
	ldr r0, _080ADF84
	ldrb r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _080ADF7C
	adds r0, r1
	ldrh r0, [r0, 0x8]
	bl sub_80BE23C
	ldr r1, _080ADF88
	ldr r0, _080ADF8C
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, _080ADF90
	ldr r1, _080ADF94
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _080ADF98
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	ldr r1, _080ADF9C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r5, [r0, 0xC]
	ldr r1, _080ADFA0
	str r1, [r0]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADF74: .4byte gUnknown_030042A0
_080ADF78: .4byte gUnknown_03004280
_080ADF7C: .4byte 0x02019260
_080ADF80: .4byte gUnknown_02038680
_080ADF84: .4byte gContestPlayerMonIndex
_080ADF88: .4byte gUnknown_03005D28
_080ADF8C: .4byte gRngValue
_080ADF90: .4byte gStringVar4
_080ADF94: .4byte gUnknown_083CB02C
_080ADF98: .4byte gMenuWindow
_080ADF9C: .4byte gTasks
_080ADFA0: .4byte sub_80ADE54
	thumb_func_end sub_80ADDA4

	thumb_func_start sub_80ADE54
sub_80ADE54: @ 80ADFA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080ADFE8
	bl sub_80037A0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080ADFE2
	bl sub_80B2184
	ldr r1, _080ADFEC
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080ADFF0
	movs r0, 0xA0
	strh r0, [r1]
	movs r0, 0x62
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r1, _080ADFF4
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x8]
	ldr r1, _080ADFF8
	str r1, [r0]
_080ADFE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ADFE8: .4byte gMenuWindow
_080ADFEC: .4byte gUnknown_030042C0
_080ADFF0: .4byte gUnknown_030041B4
_080ADFF4: .4byte gTasks
_080ADFF8: .4byte sub_80ADEAC
	thumb_func_end sub_80ADE54

	thumb_func_start sub_80ADEAC
sub_80ADEAC: @ 80ADFFC
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080AE030
	ldrh r0, [r1]
	subs r0, 0x7
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _080AE014
	movs r0, 0
	strh r0, [r1]
_080AE014:
	ldrh r2, [r1]
	cmp r2, 0
	bne _080AE02A
	ldr r0, _080AE034
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldr r0, _080AE038
	str r0, [r1]
	strh r2, [r1, 0x8]
_080AE02A:
	pop {r0}
	bx r0
	.align 2, 0
_080AE030: .4byte gUnknown_030041B4
_080AE034: .4byte gTasks
_080AE038: .4byte sub_80ADEEC
	thumb_func_end sub_80ADEAC

	thumb_func_start sub_80ADEEC
sub_80ADEEC: @ 80AE03C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AE070
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x31
	ble _080AE090
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r0, _080AE074
	ldrb r0, [r0]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _080AE07C
	ldr r0, _080AE078
	b _080AE08E
	.align 2, 0
_080AE070: .4byte gTasks
_080AE074: .4byte gUnknown_0203869A
_080AE078: .4byte sub_80ADF4C
_080AE07C:
	movs r0, 0x1
	negs r0, r0
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080AE098
_080AE08E:
	str r0, [r4]
_080AE090:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE098: .4byte sub_80ADFD8
	thumb_func_end sub_80ADEEC

	thumb_func_start sub_80ADF4C
sub_80ADF4C: @ 80AE09C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080AE0D8
	adds r0, r5, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080AE0DC
	adds r1, r5, 0
	bl SetTaskFuncWithFollowupFunc
	ldr r1, _080AE0E0
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080AE0E4
	str r1, [r0]
	bl sub_80AF860
	movs r0, 0
	bl sub_80AFFE0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AE0D8: .4byte sub_80C8AD0
_080AE0DC: .4byte sub_80ADF98
_080AE0E0: .4byte gTasks
_080AE0E4: .4byte nullsub_89
	thumb_func_end sub_80ADF4C

	thumb_func_start sub_80ADF98
sub_80ADF98: @ 80AE0E8
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r2, _080AE11C
	ldr r0, _080AE120
	ldrb r1, [r0, 0x8]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldr r1, _080AE124
	str r1, [r0]
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080AE11C: .4byte gTasks
_080AE120: .4byte 0x02019204
_080AE124: .4byte sub_80ADFD8
	thumb_func_end sub_80ADF98

	thumb_func_start sub_80ADFD8
sub_80ADFD8: @ 80AE128
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _080AE150
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080AE14C
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _080AE154
	ldr r1, _080AE158
	str r1, [r0]
	ldr r0, _080AE15C
	bl SetMainCallback2
_080AE14C:
	pop {r0}
	bx r0
	.align 2, 0
_080AE150: .4byte gPaletteFade
_080AE154: .4byte gUnknown_0300485C
_080AE158: .4byte sub_80AE010
_080AE15C: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end sub_80ADFD8

	thumb_func_start sub_80AE010
sub_80AE010: @ 80AE160
	push {lr}
	bl ScriptContext2_Disable
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_80AE010

	thumb_func_start sub_80AE020
sub_80AE020: @ 80AE170
	push {r4,lr}
	adds r4, r0, 0
	b _080AE178
_080AE176:
	adds r4, 0x1
_080AE178:
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080AE19C
	cmp r0, 0xFC
	bne _080AE176
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080AE176
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0x1
	bl ConvertIntToDecimalStringN
	movs r1, 0xFF
	strb r1, [r0]
	adds r1, r4, 0x2
	bl StringAppend
_080AE19C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AE020

	thumb_func_start sub_80AE054
sub_80AE054: @ 80AE1A4
	push {lr}
	ldr r0, _080AE1BC
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080AE1B8
	ldr r1, _080AE1C0
	movs r0, 0x3
	strb r0, [r1]
_080AE1B8:
	pop {r0}
	bx r0
	.align 2, 0
_080AE1BC: .4byte gUnknown_0203869A
_080AE1C0: .4byte gContestPlayerMonIndex
	thumb_func_end sub_80AE054

	thumb_func_start sub_80AE074
sub_80AE074: @ 80AE1C4
	push {lr}
	ldr r0, _080AE1D8
	ldr r1, _080AE1DC
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080AE1E0
	movs r0, 0
	b _080AE1E2
	.align 2, 0
_080AE1D8: .4byte gContestPlayerMonIndex
_080AE1DC: .4byte gUnknown_0203869B
_080AE1E0:
	movs r0, 0x1
_080AE1E2:
	pop {r1}
	bx r1
	thumb_func_end sub_80AE074

	thumb_func_start sub_80AE098
sub_80AE098: @ 80AE1E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r6, _080AE240
	mov r0, sp
	adds r1, r6, 0
	bl StringCopy
	mov r0, sp
	bl StripExtCtrlCodes
	ldr r0, _080AE244
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AE21E
	mov r0, sp
	ldrb r2, [r0, 0x5]
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	mov r0, sp
	strb r2, [r0, 0x7]
_080AE21E:
	ldr r5, _080AE248
	ldrb r0, [r5]
	lsls r0, 6
	ldr r4, _080AE24C
	adds r0, r4
	mov r1, sp
	movs r2, 0x8
	bl memcpy
	ldrb r0, [r6, 0x8]
	cmp r0, 0
	bne _080AE250
	ldrb r0, [r5]
	lsls r0, 6
	adds r0, r4, r0
	movs r1, 0xD8
	b _080AE258
	.align 2, 0
_080AE240: .4byte gSaveBlock2
_080AE244: .4byte gUnknown_0203869A
_080AE248: .4byte gContestPlayerMonIndex
_080AE24C: .4byte gUnknown_0203857D
_080AE250:
	ldrb r0, [r5]
	lsls r0, 6
	adds r0, r4, r0
	movs r1, 0xD9
_080AE258:
	strb r1, [r0, 0x8]
	ldr r5, _080AE2CC
	ldr r4, _080AE2D0
	ldrb r0, [r4]
	lsls r0, 6
	adds r1, r5, 0
	adds r1, 0x18
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	ldrb r0, [r4]
	lsls r0, 6
	adds r0, r5
	adds r0, 0x2C
	strb r1, [r0]
	movs r0, 0x64
	adds r1, r7, 0
	muls r1, r0
	ldr r0, _080AE2D4
	adds r6, r1, r0
	adds r0, r6, 0
	movs r1, 0xB
	bl GetMonData
	ldrb r1, [r4]
	lsls r1, 6
	adds r1, r5
	strh r0, [r1]
	adds r0, r6, 0
	movs r1, 0x2
	mov r2, sp
	bl GetMonData
	mov r0, sp
	bl StringGetEnd10
	ldr r0, _080AE2D8
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AE2EA
	mov r0, sp
	bl StripExtCtrlCodes
	adds r0, r6, 0
	movs r1, 0x3
	bl GetMonData
	cmp r0, 0x1
	bne _080AE2DC
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	movs r0, 0xFC
	strb r0, [r1, 0xA]
	b _080AE2EA
	.align 2, 0
_080AE2CC: .4byte gContestMons
_080AE2D0: .4byte gContestPlayerMonIndex
_080AE2D4: .4byte gPlayerParty
_080AE2D8: .4byte gUnknown_0203869A
_080AE2DC:
	mov r0, sp
	ldrb r2, [r0, 0x5]
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1, 0x5]
	mov r0, sp
	strb r2, [r0, 0xA]
_080AE2EA:
	ldr r5, _080AE414
	ldrb r0, [r5]
	lsls r0, 6
	ldr r1, _080AE418
	mov r8, r1
	add r0, r8
	mov r1, sp
	movs r2, 0xB
	bl memcpy
	movs r0, 0x64
	adds r4, r7, 0
	muls r4, r0
	ldr r0, _080AE41C
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x16
	bl GetMonData
	mov r6, r8
	subs r6, 0x2
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	adds r1, 0x26
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x17
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	adds r1, 0x27
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x18
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	adds r1, 0x28
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x21
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	adds r1, 0x29
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x2F
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	adds r1, 0x2A
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0x30
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	adds r1, 0x2B
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0xD
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	strh r0, [r1, 0x1E]
	adds r0, r4, 0
	movs r1, 0xE
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	strh r0, [r1, 0x20]
	adds r0, r4, 0
	movs r1, 0xF
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	strh r0, [r1, 0x22]
	adds r0, r4, 0
	movs r1, 0x10
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	adds r1, r6
	strh r0, [r1, 0x24]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	mov r2, r8
	adds r2, 0x36
	adds r1, r2
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	ldrb r1, [r5]
	lsls r1, 6
	movs r2, 0x3A
	add r8, r2
	add r1, r8
	str r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r2, r0, 16
	mov r8, r2
	ldrb r0, [r5]
	lsls r0, 6
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x26
	ldrb r3, [r0]
	adds r0, 0x1
	ldrb r4, [r0]
	adds r0, 0x1
	ldrb r5, [r0]
	adds r0, 0x1
	ldrb r6, [r0]
	adds r0, 0x1
	ldrb r7, [r0]
	cmp r2, 0xFE
	bne _080AE420
	adds r3, 0x14
	b _080AE46E
	.align 2, 0
_080AE414: .4byte gContestPlayerMonIndex
_080AE418: .4byte 0x02038572
_080AE41C: .4byte gPlayerParty
_080AE420:
	cmp r2, 0xFF
	bne _080AE430
	lsls r0, r4, 16
	movs r1, 0xA0
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
	b _080AE46E
_080AE430:
	movs r0, 0x80
	lsls r0, 1
	cmp r2, r0
	bne _080AE444
	lsls r0, r5, 16
	movs r2, 0xA0
	lsls r2, 13
	adds r0, r2
	lsrs r5, r0, 16
	b _080AE46E
_080AE444:
	ldr r0, _080AE458
	cmp r2, r0
	bne _080AE45C
	lsls r0, r6, 16
	movs r1, 0xA0
	lsls r1, 13
	adds r0, r1
	lsrs r6, r0, 16
	b _080AE46E
	.align 2, 0
_080AE458: .4byte 0x00000101
_080AE45C:
	movs r0, 0x81
	lsls r0, 1
	cmp r8, r0
	bne _080AE46E
	lsls r0, r7, 16
	movs r2, 0xA0
	lsls r2, 13
	adds r0, r2
	lsrs r7, r0, 16
_080AE46E:
	cmp r3, 0xFF
	ble _080AE474
	movs r3, 0xFF
_080AE474:
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080AE47E
	movs r4, 0xFF
_080AE47E:
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080AE488
	movs r5, 0xFF
_080AE488:
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080AE492
	movs r6, 0xFF
_080AE492:
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, 0xFF
	ble _080AE49C
	movs r7, 0xFF
_080AE49C:
	ldr r2, _080AE4E0
	ldr r1, _080AE4E4
	ldrb r0, [r1]
	lsls r0, 6
	adds r0, r2
	adds r0, 0x26
	strb r3, [r0]
	ldrb r0, [r1]
	lsls r0, 6
	adds r0, r2
	adds r0, 0x27
	strb r4, [r0]
	ldrb r0, [r1]
	lsls r0, 6
	adds r0, r2
	adds r0, 0x28
	strb r5, [r0]
	ldrb r0, [r1]
	lsls r0, 6
	adds r0, r2
	adds r0, 0x29
	strb r6, [r0]
	ldrb r0, [r1]
	lsls r0, 6
	adds r0, r2
	adds r0, 0x2A
	strb r7, [r0]
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE4E0: .4byte gContestMons
_080AE4E4: .4byte gContestPlayerMonIndex
	thumb_func_end sub_80AE098

	thumb_func_start sub_80AE398
sub_80AE398: @ 80AE4E8
	push {r4-r7,lr}
	sub sp, 0x40
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r6, 0
	bl sub_80AE054
	movs r5, 0
	ldr r2, _080AE5C0
_080AE4FE:
	ldrb r1, [r2, 0x1C]
	lsls r0, r1, 30
	lsrs r0, 30
	cmp r7, r0
	bne _080AE54E
	cmp r4, 0
	bne _080AE512
	lsls r0, r1, 29
	cmp r0, 0
	blt _080AE542
_080AE512:
	cmp r4, 0x1
	bne _080AE51E
	ldrb r0, [r2, 0x1C]
	lsls r0, 28
	cmp r0, 0
	blt _080AE542
_080AE51E:
	cmp r4, 0x2
	bne _080AE52A
	ldrb r0, [r2, 0x1C]
	lsls r0, 27
	cmp r0, 0
	blt _080AE542
_080AE52A:
	cmp r4, 0x3
	bne _080AE536
	ldrb r0, [r2, 0x1C]
	lsls r0, 26
	cmp r0, 0
	blt _080AE542
_080AE536:
	cmp r4, 0x4
	bne _080AE54E
	ldrb r0, [r2, 0x1C]
	lsls r0, 25
	cmp r0, 0
	bge _080AE54E
_080AE542:
	adds r0, r6, 0
	adds r1, r0, 0x1
	lsls r1, 24
	lsrs r6, r1, 24
	add r0, sp
	strb r5, [r0]
_080AE54E:
	adds r2, 0x40
	adds r5, 0x1
	cmp r5, 0x3B
	ble _080AE4FE
	mov r0, sp
	adds r1, r0, r6
	movs r0, 0xFF
	strb r0, [r1]
	movs r5, 0
	ldr r7, _080AE5C0
_080AE562:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080AE5C4
	lsls r2, r5, 6
	adds r2, r1
	mov r1, sp
	adds r4, r1, r0
	ldrb r1, [r4]
	lsls r1, 6
	adds r1, r7
	adds r0, r2, 0
	movs r2, 0x40
	bl memcpy
	ldrb r0, [r4]
	adds r2, r5, 0x1
	subs r1, r6, 0x1
	cmp r0, 0xFF
	beq _080AE5A4
	adds r3, r4, 0
_080AE598:
	ldrb r0, [r3, 0x1]
	strb r0, [r3]
	adds r3, 0x1
	ldrb r0, [r3]
	cmp r0, 0xFF
	bne _080AE598
_080AE5A4:
	lsls r0, r1, 24
	lsrs r6, r0, 24
	adds r5, r2, 0
	cmp r5, 0x2
	ble _080AE562
	ldr r0, _080AE5C8
	ldrb r0, [r0]
	bl sub_80AE098
	add sp, 0x40
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE5C0: .4byte gUnknown_083C9408
_080AE5C4: .4byte gContestMons
_080AE5C8: .4byte gUnknown_02038694
	thumb_func_end sub_80AE398

	thumb_func_start sub_80AE47C
sub_80AE47C: @ 80AE5CC
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _080AE5DE
	movs r0, 0x3
	b _080AE65A
_080AE5DE:
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080AE5EE
	movs r0, 0x4
	b _080AE65A
_080AE5EE:
	ldr r0, _080AE600
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080AE642
	lsls r0, 2
	ldr r1, _080AE604
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE600: .4byte gScriptContestCategory
_080AE604: .4byte _080AE608
	.align 2, 0
_080AE608:
	.4byte _080AE61C
	.4byte _080AE622
	.4byte _080AE628
	.4byte _080AE62E
	.4byte _080AE634
_080AE61C:
	adds r0, r4, 0
	movs r1, 0x32
	b _080AE638
_080AE622:
	adds r0, r4, 0
	movs r1, 0x33
	b _080AE638
_080AE628:
	adds r0, r4, 0
	movs r1, 0x34
	b _080AE638
_080AE62E:
	adds r0, r4, 0
	movs r1, 0x35
	b _080AE638
_080AE634:
	adds r0, r4, 0
	movs r1, 0x36
_080AE638:
	bl GetMonData
	lsls r0, 24
	lsrs r1, r0, 24
	b _080AE646
_080AE642:
	movs r0, 0
	b _080AE65A
_080AE646:
	ldr r0, _080AE660
	adds r2, r1, 0
	ldrh r1, [r0]
	movs r0, 0x2
	cmp r2, r1
	bhi _080AE65A
	movs r0, 0
	cmp r2, r1
	bcc _080AE65A
	movs r0, 0x1
_080AE65A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080AE660: .4byte gScriptContestRank
	thumb_func_end sub_80AE47C

	thumb_func_start sub_80AE514
sub_80AE514: @ 80AE664
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r5, 0
	ldr r7, _080AE6D8
	adds r0, r7, 0x1
	mov r9, r0
	ldr r6, _080AE6DC
	adds r3, r6, 0x1
	mov r8, r3
_080AE67C:
	ldr r4, _080AE6E0
	adds r4, r5, r4
	ldrb r0, [r4]
	lsls r0, 1
	adds r1, r0, r7
	ldrb r2, [r1]
	mov r3, r9
	adds r1, r0, r3
	ldrb r3, [r1]
	adds r0, r6
	ldrb r0, [r0]
	adds r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	ldrb r0, [r4]
	lsls r0, 1
	add r0, r8
	ldrb r0, [r0]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _080AE6E4
	movs r1, 0
	bl FillWindowRect_DefaultPalette
	adds r0, r5, 0
	bl sub_80AE5BC
	adds r0, r5, 0
	bl sub_80AE6CC
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080AE67C
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE6D8: .4byte gUnknown_083CA308
_080AE6DC: .4byte gUnknown_083CA310
_080AE6E0: .4byte gUnknown_02038696
_080AE6E4: .4byte gUnknown_03004210
	thumb_func_end sub_80AE514

	thumb_func_start sub_80AE598
sub_80AE598: @ 80AE6E8
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r1, _080AE708
	bl StringCopy
	strb r4, [r0]
	adds r0, 0x1
	adds r1, r5, 0
	bl StringCopy
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AE708: .4byte gUnknown_083CC59C
	thumb_func_end sub_80AE598

	thumb_func_start sub_80AE5BC
sub_80AE5BC: @ 80AE70C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r0, r1, 24
	movs r2, 0xA0
	lsls r2, 20
	adds r1, r2
	lsrs r1, 24
	bl sub_80AE5D4
	pop {r0}
	bx r0
	thumb_func_end sub_80AE5BC

	thumb_func_start sub_80AE5D4
sub_80AE5D4: @ 80AE724
	push {r4-r7,lr}
	sub sp, 0x8
	adds r2, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080AE7B0
	ldr r1, _080AE7B4
	adds r0, r3, 0
	bl sub_80AE598
	adds r3, r0, 0
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x6
	strb r0, [r3, 0x1]
	movs r0, 0x4
	strb r0, [r3, 0x2]
	adds r3, 0x3
	movs r0, 0xBA
	strb r0, [r3]
	adds r3, 0x1
	ldr r0, _080AE7B8
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080AE7CC
	ldr r1, _080AE7BC
	lsls r0, r4, 3
	subs r0, r4
	lsls r2, r0, 2
	adds r0, r2, r1
	ldrh r6, [r0, 0x1A]
	cmp r6, 0x1
	bne _080AE7CC
	adds r1, 0x8
	adds r1, r2, r1
	adds r0, r3, 0
	bl StringCopy
	ldr r0, _080AE7C0
	ldr r1, _080AE7B0
	ldr r2, _080AE7C4
	adds r2, r4, r2
	ldrb r4, [r2]
	movs r2, 0x16
	muls r2, r4
	movs r3, 0x94
	lsls r3, 2
	adds r2, r3
	ldr r5, _080AE7C8
	lsls r4, 1
	adds r3, r4, r5
	ldrb r3, [r3]
	lsls r3, 27
	movs r7, 0xFB
	lsls r7, 24
	adds r3, r7
	lsrs r3, 24
	adds r5, 0x1
	adds r4, r5
	ldrb r4, [r4]
	lsls r4, 3
	str r4, [sp]
	str r6, [sp, 0x4]
	bl sub_8004D04
	b _080AE800
	.align 2, 0
_080AE7B0: .4byte gUnknown_020238CC
_080AE7B4: .4byte gEmptyString_81E72B0
_080AE7B8: .4byte gUnknown_0203869A
_080AE7BC: .4byte gLinkPlayers
_080AE7C0: .4byte gUnknown_03004210
_080AE7C4: .4byte gUnknown_02038696
_080AE7C8: .4byte gUnknown_083CA310
_080AE7CC:
	lsls r1, r4, 6
	ldr r0, _080AE808
	adds r1, r0
	adds r0, r3, 0
	bl StringCopy
	ldr r0, _080AE80C
	ldr r1, _080AE810
	ldr r2, _080AE814
	adds r2, r4, r2
	ldrb r4, [r2]
	movs r2, 0x16
	muls r2, r4
	movs r3, 0x94
	lsls r3, 2
	adds r2, r3
	ldr r5, _080AE818
	lsls r4, 1
	adds r3, r4, r5
	ldrb r3, [r3]
	adds r5, 0x1
	adds r4, r5
	ldrb r4, [r4]
	str r4, [sp]
	bl sub_8003460
_080AE800:
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AE808: .4byte gUnknown_0203857D
_080AE80C: .4byte gUnknown_03004210
_080AE810: .4byte gUnknown_020238CC
_080AE814: .4byte gUnknown_02038696
_080AE818: .4byte gUnknown_083CA310
	thumb_func_end sub_80AE5D4

	thumb_func_start sub_80AE6CC
sub_80AE6CC: @ 80AE81C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r0, r1, 24
	movs r2, 0xA0
	lsls r2, 20
	adds r1, r2
	lsrs r1, 24
	bl sub_80AE6E4
	pop {r0}
	bx r0
	thumb_func_end sub_80AE6CC

	thumb_func_start sub_80AE6E4
sub_80AE6E4: @ 80AE834
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r2, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _080AE8AC
	movs r0, 0xFC
	strb r0, [r3]
	movs r0, 0x6
	strb r0, [r3, 0x1]
	movs r0, 0x4
	strb r0, [r3, 0x2]
	adds r3, 0x3
	lsls r1, r4, 6
	ldr r0, _080AE8B0
	adds r1, r0
	adds r0, r3, 0
	bl sub_80AE598
	adds r3, r0, 0
	movs r0, 0xFF
	strb r0, [r3]
	ldr r0, _080AE8B4
	ldr r1, _080AE8AC
	ldr r2, _080AE8B8
	adds r4, r2
	ldrb r4, [r4]
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 18
	movs r3, 0x80
	lsls r3, 18
	adds r2, r3
	lsrs r2, 16
	ldr r5, _080AE8BC
	lsls r4, 1
	adds r3, r4, r5
	ldrb r3, [r3]
	lsls r3, 27
	movs r6, 0xFD
	lsls r6, 24
	adds r3, r6
	lsrs r3, 24
	adds r5, 0x1
	adds r4, r5
	ldrb r4, [r4]
	lsls r4, 3
	str r4, [sp]
	movs r4, 0x1
	str r4, [sp, 0x4]
	bl sub_8004D04
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE8AC: .4byte gUnknown_020238CC
_080AE8B0: .4byte 0x02038572
_080AE8B4: .4byte gUnknown_03004210
_080AE8B8: .4byte gUnknown_02038696
_080AE8BC: .4byte gUnknown_083CA308
	thumb_func_end sub_80AE6E4

	thumb_func_start sub_80AE770
sub_80AE770: @ 80AE8C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x4
	bhi _080AE94C
	lsls r0, 2
	ldr r1, _080AE8D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE8D8: .4byte _080AE8DC
	.align 2, 0
_080AE8DC:
	.4byte _080AE8F0
	.4byte _080AE908
	.4byte _080AE920
	.4byte _080AE930
	.4byte _080AE94C
_080AE8F0:
	ldr r0, _080AE904
	lsls r2, 6
	adds r1, r2, r0
	adds r3, r1, 0
	adds r3, 0x26
	ldrb r5, [r3]
	adds r3, 0x4
	ldrb r4, [r3]
	adds r1, 0x27
	b _080AE95E
	.align 2, 0
_080AE904: .4byte gContestMons
_080AE908:
	ldr r0, _080AE91C
	lsls r2, 6
	adds r1, r2, r0
	adds r3, r1, 0
	adds r3, 0x27
	ldrb r5, [r3]
	subs r3, 0x1
	ldrb r4, [r3]
	adds r1, 0x28
	b _080AE95E
	.align 2, 0
_080AE91C: .4byte gContestMons
_080AE920:
	ldr r1, _080AE92C
	lsls r2, 6
	adds r3, r2, r1
	adds r0, r3, 0
	adds r0, 0x28
	b _080AE93A
	.align 2, 0
_080AE92C: .4byte gContestMons
_080AE930:
	ldr r1, _080AE948
	lsls r2, 6
	adds r3, r2, r1
	adds r0, r3, 0
	adds r0, 0x29
_080AE93A:
	ldrb r5, [r0]
	subs r0, 0x1
	ldrb r4, [r0]
	adds r0, 0x2
	ldrb r3, [r0]
	adds r0, r1, 0
	b _080AE960
	.align 2, 0
_080AE948: .4byte gContestMons
_080AE94C:
	ldr r0, _080AE978
	lsls r2, 6
	adds r1, r2, r0
	adds r3, r1, 0
	adds r3, 0x2A
	ldrb r5, [r3]
	subs r3, 0x1
	ldrb r4, [r3]
	adds r1, 0x26
_080AE95E:
	ldrb r3, [r1]
_080AE960:
	adds r1, r2, r0
	adds r1, 0x2B
	adds r0, r4, r3
	ldrb r1, [r1]
	adds r0, r1
	asrs r0, 1
	adds r0, r5, r0
	lsls r0, 16
	lsrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AE978: .4byte gContestMons
	thumb_func_end sub_80AE770

	thumb_func_start sub_80AE82C
sub_80AE82C: @ 80AE97C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080AE9A4
_080AE986:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80AE770
	lsls r1, r4, 1
	adds r1, r6
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AE986
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AE9A4: .4byte gUnknown_02038670
	thumb_func_end sub_80AE82C

	thumb_func_start sub_80AE858
sub_80AE858: @ 80AE9A8
	push {r4,r5,lr}
	ldr r0, _080AE9F0
	bl LoadCompressedObjectPic
	ldr r0, _080AE9F4
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	ldr r0, _080AE9F8
	movs r1, 0x70
	movs r2, 0x24
	movs r3, 0x1E
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _080AE9FC
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r5, r2, r4
	ldrb r3, [r5, 0x5]
	movs r1, 0xF
	ands r1, r3
	movs r3, 0x10
	orrs r1, r3
	strb r1, [r5, 0x5]
	adds r4, 0x1C
	adds r2, r4
	ldr r1, _080AEA00
	str r1, [r2]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AE9F0: .4byte gUnknown_083CA4BC
_080AE9F4: .4byte gContest2Pal
_080AE9F8: .4byte gSpriteTemplate_83CA4A4
_080AE9FC: .4byte gSprites
_080AEA00: .4byte SpriteCallbackDummy
	thumb_func_end sub_80AE858

	thumb_func_start sub_80AE8B4
sub_80AE8B4: @ 80AEA04
	push {lr}
	ldr r0, _080AEA48
	bl LoadCompressedObjectPic
	ldr r0, _080AEA4C
	bl LoadCompressedObjectPalette
	ldr r0, _080AEA50
	movs r1, 0x60
	movs r2, 0xA
	movs r3, 0x1D
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080AEA54
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	movs r1, 0x3E
	adds r1, r2
	mov r12, r1
	ldrb r1, [r1]
	movs r3, 0x4
	orrs r1, r3
	mov r3, r12
	strb r1, [r3]
	ldrh r1, [r2, 0x4]
	lsls r1, 22
	lsrs r1, 22
	strh r1, [r2, 0x2E]
	pop {r1}
	bx r1
	.align 2, 0
_080AEA48: .4byte gUnknown_083CA4C4
_080AEA4C: .4byte gUnknown_083CA4CC
_080AEA50: .4byte gUnknown_083CA4D4
_080AEA54: .4byte gSprites
	thumb_func_end sub_80AE8B4

	thumb_func_start unref_sub_80AE908
unref_sub_80AE908: @ 80AEA58
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	ldr r0, _080AEB24
	mov r9, r0
	ldr r1, _080AEB28
	mov r8, r1
	ldrb r0, [r1]
	lsls r0, 6
	add r0, r9
	ldrh r5, [r0]
	lsls r6, r5, 3
	ldr r0, _080AEB2C
	adds r0, r6, r0
	ldr r2, _080AEB30
	mov r10, r2
	lsls r2, r5, 2
	add r2, r10
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _080AEB34
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r5, [sp, 0x4]
	bl DecompressPicFromTable_2
	ldr r0, _080AEB38
	adds r6, r0
	ldr r0, [r6]
	movs r1, 0x88
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, 6
	add r0, r9
	ldrh r0, [r0]
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080AEB3C
	mov r2, r8
	ldrb r1, [r2]
	lsls r1, 6
	add r1, r9
	ldrh r1, [r1]
	lsls r1, 2
	add r1, r10
	ldrb r1, [r1]
	movs r2, 0x8
	subs r2, r1
	lsls r2, 18
	movs r1, 0xA0
	lsls r1, 15
	adds r2, r1
	asrs r2, 16
	movs r1, 0x70
	movs r3, 0x1E
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080AEB40
	lsls r3, r4, 4
	adds r3, r4
	lsls r3, 2
	adds r0, r3, r5
	ldrb r2, [r0, 0x5]
	movs r1, 0xF
	ands r1, r2
	movs r2, 0x10
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r1, r5, 0
	adds r1, 0x1C
	adds r1, r3, r1
	ldr r2, _080AEB44
	str r2, [r1]
	adds r5, 0x10
	adds r3, r5
	ldr r1, _080AEB48
	str r1, [r3]
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r0, r4, 0
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080AEB24: .4byte gContestMons
_080AEB28: .4byte gContestPlayerMonIndex
_080AEB2C: .4byte gMonFrontPicTable
_080AEB30: .4byte gMonFrontPicCoords
_080AEB34: .4byte gUnknown_081FAF4C
_080AEB38: .4byte gMonPaletteTable
_080AEB3C: .4byte gUnknown_02024E8C
_080AEB40: .4byte gSprites
_080AEB44: .4byte SpriteCallbackDummy
_080AEB48: .4byte gSpriteAffineAnimTable_81E7C18
	thumb_func_end unref_sub_80AE908

	thumb_func_start sub_80AE9FC
sub_80AE9FC: @ 80AEB4C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xC
	mov r8, r1
	adds r6, r2, 0
	lsls r0, 16
	lsrs r0, 16
	bl sub_80B2778
	mov r9, r0
	mov r5, r9
	lsls r0, r5, 3
	ldr r1, _080AEC1C
	adds r0, r1
	ldr r1, _080AEC20
	lsls r2, r5, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	movs r3, 0x80
	lsls r3, 18
	ldr r4, _080AEC24
	ldr r4, [r4]
	str r4, [sp]
	str r5, [sp, 0x4]
	str r6, [sp, 0x8]
	bl sub_800D334
	adds r0, r5, 0
	mov r1, r8
	adds r2, r6, 0
	bl species_and_otid_get_pal
	movs r1, 0x90
	lsls r1, 1
	movs r2, 0x20
	bl LoadCompressedPalette
	adds r0, r5, 0
	movs r1, 0
	bl GetMonSpriteTemplate_803C56C
	ldr r4, _080AEC28
	movs r0, 0x2
	adds r1, r5, 0
	movs r2, 0
	bl sub_8077E44
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	movs r1, 0x70
	movs r3, 0x1E
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _080AEC2C
	mov r8, r0
	lsls r0, r7, 4
	adds r0, r7
	lsls r6, r0, 2
	mov r0, r8
	adds r4, r6, r0
	ldrb r1, [r4, 0x5]
	movs r0, 0xF
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	movs r1, 0xD
	negs r1, r1
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x5]
	movs r0, 0x2
	bl sub_8079E90
	adds r1, r4, 0
	adds r1, 0x43
	strb r0, [r1]
	mov r0, r8
	adds r0, 0x1C
	adds r0, r6, r0
	ldr r1, _080AEC30
	str r1, [r0]
	ldrb r0, [r4, 0x5]
	lsrs r0, 4
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x32]
	adds r0, r5, 0
	bl sub_80AEB1C
	lsls r0, 24
	cmp r0, 0
	beq _080AEC38
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _080AEC34
	b _080AEC40
	.align 2, 0
_080AEC1C: .4byte gMonBackPicTable
_080AEC20: .4byte gMonBackPicCoords
_080AEC24: .4byte gUnknown_081FAF4C
_080AEC28: .4byte gUnknown_02024E8C
_080AEC2C: .4byte gSprites
_080AEC30: .4byte SpriteCallbackDummy
_080AEC34: .4byte gSpriteAffineAnimTable_81E7C18
_080AEC38:
	mov r0, r8
	adds r0, 0x10
	adds r0, r6, r0
	ldr r1, _080AEC64
_080AEC40:
	str r1, [r0]
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _080AEC68
	adds r0, r1
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r0, r7, 0
	add sp, 0xC
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AEC64: .4byte gSpriteAffineAnimTable_81E7BEC
_080AEC68: .4byte gSprites
	thumb_func_end sub_80AE9FC

	thumb_func_start sub_80AEB1C
sub_80AEB1C: @ 80AEC6C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xC9
	beq _080AEC7A
	movs r0, 0x1
	b _080AEC7C
_080AEC7A:
	movs r0, 0
_080AEC7C:
	pop {r1}
	bx r1
	thumb_func_end sub_80AEB1C

	thumb_func_start sub_80AEB30
sub_80AEB30: @ 80AEC80
	push {lr}
	ldr r0, _080AEC94
	bl sub_80AEB4C
	ldr r0, _080AEC98
	bl sub_80AEB4C
	pop {r0}
	bx r0
	.align 2, 0
_080AEC94: .4byte 0x0600c000
_080AEC98: .4byte 0x0600e000
	thumb_func_end sub_80AEB30

	thumb_func_start sub_80AEB4C
sub_80AEB4C: @ 80AEC9C
	movs r1, 0xA0
	lsls r1, 3
	adds r2, r0, r1
	ldr r1, _080AECB0
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _080AECB4
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bx lr
	.align 2, 0
_080AECB0: .4byte 0x040000d4
_080AECB4: .4byte 0x80000140
	thumb_func_end sub_80AEB4C

	thumb_func_start sub_80AEB68
sub_80AEB68: @ 80AECB8
	push {lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r2, _080AECE0
	ldr r1, _080AECE4
	lsrs r0, 13
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x8
	bhi _080AED20
	lsls r0, 2
	ldr r1, _080AECE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AECE0: .4byte gContestEffects
_080AECE4: .4byte gContestMoves
_080AECE8: .4byte _080AECEC
	.align 2, 0
_080AECEC:
	.4byte _080AED10
	.4byte _080AED10
	.4byte _080AED18
	.4byte _080AED18
	.4byte _080AED20
	.4byte _080AED20
	.4byte _080AED20
	.4byte _080AED20
	.4byte _080AED10
_080AED10:
	ldr r0, _080AED14
	b _080AED22
	.align 2, 0
_080AED14: .4byte 0x00009082
_080AED18:
	ldr r0, _080AED1C
	b _080AED22
	.align 2, 0
_080AED1C: .4byte 0x00009088
_080AED20:
	ldr r0, _080AED38
_080AED22:
	lsls r1, r3, 12
	movs r2, 0x90
	lsls r2, 8
	adds r1, r2
	lsls r0, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080AED38: .4byte 0x00009086
	thumb_func_end sub_80AEB68

	thumb_func_start sub_80AEBEC
sub_80AEBEC: @ 80AED3C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _080AEDC4
	movs r1, 0x10
	str r1, [sp]
	movs r1, 0x22
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x1F
	bl FillWindowRect_DefaultPalette
	ldr r1, _080AEDC8
	lsls r0, r4, 3
	adds r0, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	ldr r1, _080AEDCC
	cmp r0, 0
	beq _080AED84
	adds r1, 0x5
	cmp r0, 0x1
	beq _080AED84
	adds r1, 0x5
	cmp r0, 0x2
	beq _080AED84
	adds r1, 0x40
	cmp r0, 0x3
	bne _080AED84
	subs r1, 0x20
_080AED84:
	ldr r0, _080AEDC4
	mov r8, r0
	ldr r6, _080AEDC8
	lsls r5, r4, 3
	ldr r7, _080AEDD0
	ldr r0, _080AEDD4
	mov r9, r0
	ldr r4, _080AEDD8
	ldr r3, _080AEDDC
	movs r2, 0x4
_080AED98:
	strh r1, [r3]
	adds r0, r1, 0
	adds r0, 0x10
	strh r0, [r4]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	adds r4, 0x2
	adds r3, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _080AED98
	adds r0, r5, r6
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0, r7
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	bne _080AEDE0
	movs r0, 0
	b _080AEDEC
	.align 2, 0
_080AEDC4: .4byte gUnknown_03004210
_080AEDC8: .4byte gContestMoves
_080AEDCC: .4byte 0x00004040
_080AEDD0: .4byte gContestEffects
_080AEDD4: .4byte gUnknown_083CADD4
_080AEDD8: .4byte 0x0600c816
_080AEDDC: .4byte 0x0600c7d6
_080AEDE0:
	ldrb r0, [r1, 0x1]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
_080AEDEC:
	cmp r0, 0x8
	bls _080AEDF2
	movs r0, 0x8
_080AEDF2:
	movs r2, 0
	ldr r1, _080AEE08
	adds r4, r1, 0
	adds r1, 0x23
	adds r3, r1, 0
	ldr r1, _080AEE0C
_080AEDFE:
	cmp r2, r0
	bge _080AEE10
	strh r4, [r1]
	b _080AEE12
	.align 2, 0
_080AEE08: .4byte 0x00005012
_080AEE0C: .4byte 0x0600c7ea
_080AEE10:
	strh r3, [r1]
_080AEE12:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _080AEDFE
	adds r0, r5, r6
	ldrb r0, [r0]
	lsls r0, 2
	adds r1, r0, r7
	ldrb r0, [r1, 0x2]
	cmp r0, 0xFF
	bne _080AEE2C
	movs r0, 0
	b _080AEE38
_080AEE2C:
	ldrb r0, [r1, 0x2]
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
_080AEE38:
	cmp r0, 0x8
	bls _080AEE3E
	movs r0, 0x8
_080AEE3E:
	movs r2, 0
	ldr r1, _080AEE54
	adds r4, r1, 0
	adds r1, 0x22
	adds r3, r1, 0
	ldr r1, _080AEE58
_080AEE4A:
	cmp r2, r0
	bge _080AEE5C
	strh r4, [r1]
	b _080AEE5E
	.align 2, 0
_080AEE54: .4byte 0x00005014
_080AEE58: .4byte 0x0600c82a
_080AEE5C:
	strh r3, [r1]
_080AEE5E:
	adds r1, 0x2
	adds r2, 0x1
	cmp r2, 0x7
	ble _080AEE4A
	adds r0, r5, r6
	ldrb r0, [r0]
	lsls r0, 2
	add r0, r9
	ldr r1, [r0]
	movs r2, 0xD9
	lsls r2, 2
	movs r0, 0x23
	str r0, [sp]
	mov r0, r8
	movs r3, 0xB
	bl sub_8003460
	ldr r1, _080AEEA0
	ldr r2, _080AEEA4
	movs r0, 0x1F
	str r0, [sp]
	mov r0, r8
	movs r3, 0x10
	bl sub_8003460
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AEEA0: .4byte gUnknown_083CC5A2
_080AEEA4: .4byte 0x00000362
	thumb_func_end sub_80AEBEC

	thumb_func_start sub_80AED58
sub_80AED58: @ 80AEEA8
	push {lr}
	sub sp, 0x8
	ldr r0, _080AEEC8
	movs r1, 0x1C
	str r1, [sp]
	movs r1, 0x28
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x23
	bl FillWindowRect_DefaultPalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080AEEC8: .4byte gUnknown_03004210
	thumb_func_end sub_80AED58

	thumb_func_start sub_80AED7C
sub_80AED7C: @ 80AEECC
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _080AEF28
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080AEF3C
	cmp r6, 0
	beq _080AEF3C
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80AEB68
	lsls r0, 16
	lsrs r0, 16
	lsls r3, r5, 6
	ldr r1, _080AEF2C
	adds r1, r3, r1
	strh r0, [r1]
	ldr r1, _080AEF30
	adds r1, r3, r1
	adds r2, r0, 0x1
	strh r2, [r1]
	ldr r1, _080AEF34
	adds r2, r3, r1
	adds r1, r0, 0
	adds r1, 0x10
	strh r1, [r2]
	ldr r1, _080AEF38
	adds r3, r1
	adds r0, 0x11
	strh r0, [r3]
	b _080AEF58
	.align 2, 0
_080AEF28: .4byte gUnknown_02038696
_080AEF2C: .4byte 0x0600c028
_080AEF30: .4byte 0x0600c02a
_080AEF34: .4byte 0x0600c068
_080AEF38: .4byte 0x0600c06a
_080AEF3C:
	lsls r1, r5, 6
	ldr r0, _080AEF60
	adds r0, r1, r0
	movs r2, 0
	strh r2, [r0]
	ldr r0, _080AEF64
	adds r0, r1, r0
	strh r2, [r0]
	ldr r3, _080AEF68
	adds r0, r1, r3
	strh r2, [r0]
	ldr r0, _080AEF6C
	adds r1, r0
	strh r2, [r1]
_080AEF58:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF60: .4byte 0x0600c028
_080AEF64: .4byte 0x0600c02a
_080AEF68: .4byte 0x0600c068
_080AEF6C: .4byte 0x0600c06a
	thumb_func_end sub_80AED7C

	thumb_func_start unref_sub_80AEE20
unref_sub_80AEE20: @ 80AEF70
	push {r4,lr}
	movs r4, 0
_080AEF74:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _080AEF98
	adds r0, r1
	ldrh r0, [r0, 0x6]
	adds r1, r4, 0
	bl sub_80AED7C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AEF74
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AEF98: .4byte 0x02019260
	thumb_func_end unref_sub_80AEE20

	thumb_func_start sub_80AEE4C
sub_80AEE4C: @ 80AEF9C
	ldr r0, _080AEFA0
	bx lr
	.align 2, 0
_080AEFA0: .4byte 0x00002034
	thumb_func_end sub_80AEE4C

	thumb_func_start sub_80AEE54
sub_80AEE54: @ 80AEFA4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r5, r7, 3
	subs r0, r5, r7
	lsls r0, 2
	ldr r1, _080AEFD4
	adds r0, r1
	ldrb r0, [r0, 0x10]
	movs r2, 0x30
	ands r2, r0
	mov r10, r1
	cmp r2, 0
	bne _080AEFD8
	movs r0, 0
	b _080AF08C
	.align 2, 0
_080AEFD4: .4byte 0x02019260
_080AEFD8:
	ldr r0, _080AF000
	adds r0, r7, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	cmp r2, 0x10
	bne _080AF040
	adds r0, r7, 0
	bl sub_80AEE4C
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	movs r4, 0
	adds r6, r5, 0
	b _080AF014
	.align 2, 0
_080AF000: .4byte gUnknown_02038696
_080AF004:
	mov r1, r9
	adds r0, r1, r4
	lsls r0, 6
	ldr r1, _080AF038
	adds r0, r1
	mov r1, r8
	strh r1, [r0]
	adds r4, 0x1
_080AF014:
	subs r0, r6, r7
	lsls r0, 2
	ldr r1, _080AF03C
	adds r5, r0, r1
	movs r0, 0xD
	ldrsb r0, [r5, r0]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	cmp r0, r4
	bgt _080AF004
	ldr r0, [sp]
	cmp r0, 0
	beq _080AF08A
	movs r0, 0x5B
	b _080AF07C
	.align 2, 0
_080AF038: .4byte 0x0600c026
_080AF03C: .4byte 0x02019260
_080AF040:
	movs r1, 0
	mov r8, r1
	movs r4, 0x3
	adds r6, r5, 0
	b _080AF05A
_080AF04A:
	mov r1, r9
	adds r0, r1, r4
	lsls r0, 6
	ldr r1, _080AF09C
	adds r0, r1
	mov r1, r8
	strh r1, [r0]
	subs r4, 0x1
_080AF05A:
	subs r0, r6, r7
	lsls r0, 2
	mov r1, r10
	adds r5, r0, r1
	movs r0, 0xD
	ldrsb r0, [r5, r0]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	cmp r0, r4
	blt _080AF04A
	ldr r0, [sp]
	cmp r0, 0
	beq _080AF08A
	movs r0, 0x26
_080AF07C:
	bl PlaySE
	ldrb r1, [r5, 0x10]
	movs r0, 0x31
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x10]
_080AF08A:
	movs r0, 0x1
_080AF08C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AF09C: .4byte 0x0600bfe6
	thumb_func_end sub_80AEE54

	thumb_func_start sub_80AEF50
sub_80AEF50: @ 80AF0A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r5, 0
_080AF0AA:
	ldr r0, _080AF0D0
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x2
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80AEE4C
	lsls r0, 16
	lsrs r6, r0, 16
	movs r4, 0
	lsls r7, r5, 3
	adds r2, r5, 0x1
	b _080AF0E2
	.align 2, 0
_080AF0D0: .4byte gUnknown_02038696
_080AF0D4:
	mov r1, r8
	adds r0, r1, r4
	lsls r0, 6
	ldr r3, _080AF130
	adds r0, r3
	strh r6, [r0]
	adds r4, 0x1
_080AF0E2:
	subs r0, r7, r5
	lsls r0, 2
	ldr r1, _080AF134
	adds r0, r1
	ldrb r0, [r0, 0xD]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0xA
	str r2, [sp]
	bl __divsi3
	lsls r0, 24
	asrs r0, 24
	ldr r2, [sp]
	cmp r4, r0
	blt _080AF0D4
	movs r6, 0
	cmp r4, 0x2
	bgt _080AF11E
	lsls r0, r4, 6
	ldr r1, _080AF130
	adds r0, r1
	mov r3, r8
	lsls r1, r3, 6
	adds r0, r1
_080AF114:
	strh r6, [r0]
	adds r0, 0x40
	adds r4, 0x1
	cmp r4, 0x2
	ble _080AF114
_080AF11E:
	adds r5, r2, 0
	cmp r5, 0x3
	ble _080AF0AA
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF130: .4byte 0x0600c026
_080AF134: .4byte 0x02019260
	thumb_func_end sub_80AEF50

	thumb_func_start sub_80AEFE8
sub_80AEFE8: @ 80AF138
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0
	cmp r1, 0x4
	bhi _080AF17A
	lsls r0, r1, 2
	ldr r1, _080AF150
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AF150: .4byte _080AF154
	.align 2, 0
_080AF154:
	.4byte _080AF168
	.4byte _080AF16C
	.4byte _080AF170
	.4byte _080AF174
	.4byte _080AF178
_080AF168:
	movs r0, 0x80
	b _080AF17A
_080AF16C:
	movs r0, 0x84
	b _080AF17A
_080AF170:
	movs r0, 0x86
	b _080AF17A
_080AF174:
	movs r0, 0x88
	b _080AF17A
_080AF178:
	movs r0, 0x82
_080AF17A:
	movs r1, 0x90
	lsls r1, 8
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_80AEFE8

	thumb_func_start sub_80AF038
sub_80AF038: @ 80AF188
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r5, 0x1
	movs r4, 0
	ldr r0, _080AF1C4
	adds r0, r3, r0
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, 0x2
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r3, 3
	subs r0, r3
	lsls r0, 2
	ldr r1, _080AF1C8
	adds r2, r0, r1
	ldr r0, [r2, 0x10]
	ldr r1, _080AF1CC
	ands r0, r1
	cmp r0, 0
	bne _080AF1BC
	ldrb r0, [r2, 0xF]
	cmp r0, 0
	beq _080AF1D0
_080AF1BC:
	adds r0, r3, 0
	movs r1, 0
	b _080AF1F6
	.align 2, 0
_080AF1C4: .4byte gUnknown_02038696
_080AF1C8: .4byte 0x02019260
_080AF1CC: .4byte 0x00ff0003
_080AF1D0:
	ldrb r1, [r2, 0xC]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080AF1E0
	adds r0, r3, 0
	movs r1, 0x1
	b _080AF1F6
_080AF1E0:
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080AF1F2
	ldrb r1, [r2, 0xB]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080AF200
_080AF1F2:
	adds r0, r3, 0
	movs r1, 0x2
_080AF1F6:
	bl sub_80AEFE8
	lsls r0, 16
	lsrs r4, r0, 16
	b _080AF202
_080AF200:
	movs r5, 0
_080AF202:
	cmp r5, 0
	beq _080AF23C
	lsls r2, r6, 6
	ldr r0, _080AF22C
	adds r0, r2, r0
	strh r4, [r0]
	ldr r0, _080AF230
	adds r0, r2, r0
	adds r1, r4, 0x1
	strh r1, [r0]
	ldr r0, _080AF234
	adds r1, r2, r0
	adds r0, r4, 0
	adds r0, 0x10
	strh r0, [r1]
	ldr r0, _080AF238
	adds r2, r0
	adds r0, r4, 0
	adds r0, 0x11
	strh r0, [r2]
	b _080AF256
	.align 2, 0
_080AF22C: .4byte 0x0600c028
_080AF230: .4byte 0x0600c02a
_080AF234: .4byte 0x0600c068
_080AF238: .4byte 0x0600c06a
_080AF23C:
	lsls r1, r6, 6
	ldr r0, _080AF260
	adds r0, r1, r0
	strh r5, [r0]
	ldr r0, _080AF264
	adds r0, r1, r0
	strh r5, [r0]
	ldr r2, _080AF268
	adds r0, r1, r2
	strh r5, [r0]
	ldr r0, _080AF26C
	adds r1, r0
	strh r5, [r1]
_080AF256:
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080AF260: .4byte 0x0600c028
_080AF264: .4byte 0x0600c02a
_080AF268: .4byte 0x0600c068
_080AF26C: .4byte 0x0600c06a
	thumb_func_end sub_80AF038

	thumb_func_start sub_80AF120
sub_80AF120: @ 80AF270
	push {r4,lr}
	movs r4, 0
_080AF274:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80AF038
	adds r4, 0x1
	cmp r4, 0x3
	ble _080AF274
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF120

	thumb_func_start sub_80AF138
sub_80AF138: @ 80AF288
	push {lr}
	sub sp, 0x8
	ldr r0, _080AF2A8
	movs r1, 0x11
	str r1, [sp]
	movs r1, 0x12
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x1
	movs r3, 0xF
	bl FillWindowRect_DefaultPalette
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_080AF2A8: .4byte gUnknown_03004210
	thumb_func_end sub_80AF138

	thumb_func_start sub_80AF15C
sub_80AF15C: @ 80AF2AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	adds r0, r4, 0
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	beq _080AF2C4
	movs r0, 0
	b _080AF2FA
_080AF2C4:
	ldr r0, _080AF2E0
	ldrb r0, [r0]
	cmp r4, r0
	beq _080AF2E8
	adds r0, r4, 0
	bl sub_81288F4
	bl sub_8128944
	lsls r0, 24
	ldr r2, _080AF2E4
	lsrs r0, 23
	lsls r1, r4, 6
	b _080AF2F2
	.align 2, 0
_080AF2E0: .4byte gContestPlayerMonIndex
_080AF2E4: .4byte gContestMons
_080AF2E8:
	ldr r2, _080AF300
	ldr r0, _080AF304
	ldrb r0, [r0]
	lsls r0, 1
	lsls r1, r5, 6
_080AF2F2:
	adds r0, r1
	adds r2, 0x1E
	adds r0, r2
	ldrh r0, [r0]
_080AF2FA:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AF300: .4byte gContestMons
_080AF304: .4byte 0x02019204
	thumb_func_end sub_80AF15C

	thumb_func_start sub_80AF1B8
sub_80AF1B8: @ 80AF308
	push {r4,lr}
	movs r4, 0
_080AF30C:
	adds r0, r4, 0
	bl sub_80AF15C
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _080AF330
	adds r1, r2
	strh r0, [r1, 0x6]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AF30C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF330: .4byte 0x02019260
	thumb_func_end sub_80AF1B8

	thumb_func_start sub_80AF1E4
sub_80AF1E4: @ 80AF334
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	cmp r1, 0
	bne _080AF34C
	adds r0, r5, 0
	adds r0, 0xA
	lsls r0, 24
	lsrs r3, r0, 24
	b _080AF34E
_080AF34C:
	movs r3, 0xE
_080AF34E:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	ldr r1, _080AF36C
	adds r1, r0, r1
	ldrh r0, [r1, 0x6]
	cmp r0, 0
	bne _080AF378
	ldr r0, _080AF370
	ldr r1, _080AF374
	adds r2, r3, 0
	bl sub_80AE598
	b _080AF38A
	.align 2, 0
_080AF36C: .4byte 0x02019260
_080AF370: .4byte gUnknown_020238CC
_080AF374: .4byte gUnknownText_MissedTurn
_080AF378:
	ldr r0, _080AF3C0
	ldrh r2, [r1, 0x6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080AF3C4
	adds r1, r2
	adds r2, r3, 0
	bl sub_80AE598
_080AF38A:
	adds r0, r5, 0
	bl sub_80AF2A0
	ldr r0, _080AF3C8
	ldr r1, _080AF3C0
	lsls r2, r5, 2
	adds r2, r5
	lsls r2, 18
	movs r3, 0xAE
	lsls r3, 18
	adds r2, r3
	lsrs r2, 16
	ldr r4, _080AF3CC
	lsls r5, 1
	adds r3, r5, r4
	ldrb r3, [r3]
	adds r4, 0x1
	adds r5, r4
	ldrb r4, [r5]
	str r4, [sp]
	bl sub_8003460
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AF3C0: .4byte gUnknown_020238CC
_080AF3C4: .4byte gMoveNames
_080AF3C8: .4byte gUnknown_03004210
_080AF3CC: .4byte gUnknown_083CA318
	thumb_func_end sub_80AF1E4

	thumb_func_start unref_sub_80AF280
unref_sub_80AF280: @ 80AF3D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
_080AF3D8:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80AF1E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AF3D8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80AF280

	thumb_func_start sub_80AF2A0
sub_80AF2A0: @ 80AF3F0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	ldr r4, _080AF428
	ldr r1, _080AF42C
	lsrs r0, 23
	adds r2, r0, r1
	ldrb r2, [r2]
	adds r1, 0x1
	adds r0, r1
	ldrb r3, [r0]
	adds r0, r2, 0x7
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	adds r0, r4, 0
	movs r1, 0
	bl FillWindowRect_DefaultPalette
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF428: .4byte gUnknown_03004210
_080AF42C: .4byte gUnknown_083CA318
	thumb_func_end sub_80AF2A0

	thumb_func_start unref_sub_80AF2E0
unref_sub_80AF2E0: @ 80AF430
	push {r4,lr}
	movs r4, 0
_080AF434:
	adds r0, r4, 0
	bl sub_80AF2A0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AF434
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80AF2E0

	thumb_func_start sub_80AF2FC
sub_80AF2FC: @ 80AF44C
	push {r4-r7,lr}
	sub sp, 0x8
	movs r4, 0
	ldr r2, _080AF4E8
_080AF454:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r2
	ldrh r1, [r0, 0x2]
	ldrh r3, [r0, 0x4]
	adds r1, r3
	strh r1, [r0, 0x4]
	lsls r0, r4, 1
	add r0, sp
	strh r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AF454
	movs r4, 0
_080AF476:
	movs r2, 0x3
	cmp r2, r4
	bls _080AF4A4
_080AF47C:
	subs r5, r2, 0x1
	lsls r0, r5, 1
	mov r7, sp
	adds r3, r7, r0
	lsls r0, r2, 1
	adds r2, r7, r0
	ldrh r6, [r3]
	movs r0, 0
	ldrsh r1, [r3, r0]
	movs r7, 0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080AF49C
	ldrh r0, [r2]
	strh r6, [r2]
	strh r0, [r3]
_080AF49C:
	lsls r0, r5, 24
	lsrs r2, r0, 24
	cmp r2, r4
	bhi _080AF47C
_080AF4A4:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _080AF476
	movs r4, 0
	ldr r0, _080AF4E8
	mov r12, r0
	movs r7, 0x4
	negs r7, r7
	movs r6, 0x3
_080AF4BA:
	movs r2, 0
	lsls r0, r4, 3
	adds r5, r4, 0x1
	subs r0, r4
	lsls r0, 2
	mov r1, r12
	adds r3, r0, r1
	movs r4, 0x4
	ldrsh r1, [r3, r4]
_080AF4CC:
	lsls r0, r2, 1
	add r0, sp
	movs r4, 0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	bne _080AF4EC
	ands r2, r6
	ldrb r1, [r3, 0xB]
	adds r0, r7, 0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0xB]
	b _080AF4F6
	.align 2, 0
_080AF4E8: .4byte 0x02019260
_080AF4EC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080AF4CC
_080AF4F6:
	lsls r0, r5, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AF4BA
	movs r0, 0x1
	bl sub_80B0F28
	bl sub_80B159C
	add sp, 0x8
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF2FC

	thumb_func_start sub_80AF3C0
sub_80AF3C0: @ 80AF510
	push {lr}
	ldr r2, _080AF520
	adds r3, r2, 0
_080AF516:
	ldrh r0, [r2, 0x6]
	cmp r0, 0
	bne _080AF524
	movs r1, 0x5
	b _080AF542
	.align 2, 0
_080AF520: .4byte 0x02019260
_080AF524:
	movs r1, 0x2
	ldrsh r0, [r2, r1]
	movs r1, 0
	cmp r0, 0
	ble _080AF542
	movs r1, 0x1
	cmp r0, 0x1D
	ble _080AF542
	movs r1, 0x2
	cmp r0, 0x3B
	ble _080AF542
	movs r1, 0x4
	cmp r0, 0x4F
	bgt _080AF542
	movs r1, 0x3
_080AF542:
	strb r1, [r2, 0x1A]
	adds r2, 0x1C
	adds r0, r3, 0
	adds r0, 0x54
	cmp r2, r0
	ble _080AF516
	pop {r0}
	bx r0
	thumb_func_end sub_80AF3C0

	thumb_func_start sub_80AF404
sub_80AF404: @ 80AF554
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080AF57C
	adds r2, r1, r0
	ldrb r1, [r2, 0xC]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080AF578
	ldrb r1, [r2, 0xB]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080AF580
_080AF578:
	movs r0, 0
	b _080AF582
	.align 2, 0
_080AF57C: .4byte 0x02019260
_080AF580:
	movs r0, 0x1
_080AF582:
	pop {r1}
	bx r1
	thumb_func_end sub_80AF404

	thumb_func_start sub_80AF438
sub_80AF438: @ 80AF588
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r0, _080AF6E4
	mov r10, r0
	movs r1, 0
	mov r12, r1
	movs r0, 0x7
	negs r0, r0
	mov r9, r0
	movs r1, 0x2
	negs r1, r1
	mov r8, r1
_080AF5A8:
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	mov r1, r10
	adds r3, r0, r1
	movs r0, 0
	strh r0, [r3, 0x2]
	strh r0, [r3]
	mov r0, r12
	strb r0, [r3, 0x12]
	ldrb r2, [r3, 0xC]
	movs r0, 0x6
	ands r0, r2
	cmp r0, 0
	beq _080AF5DA
	lsls r0, r2, 29
	lsrs r0, 30
	subs r0, 0x1
	movs r1, 0x3
	ands r0, r1
	lsls r0, 1
	mov r1, r9
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0xC]
_080AF5DA:
	mov r1, r12
	strb r1, [r3, 0xE]
	ldrb r0, [r3, 0x10]
	mov r1, r8
	ands r1, r0
	mov r0, r12
	strb r0, [r3, 0xF]
	movs r0, 0x3
	negs r0, r0
	ands r1, r0
	movs r6, 0x5
	negs r6, r6
	ands r1, r6
	movs r7, 0x9
	negs r7, r7
	ands r1, r7
	ldrb r0, [r3, 0xC]
	mov r4, r8
	ands r4, r0
	strb r4, [r3, 0xC]
	movs r0, 0xFF
	strb r0, [r3, 0x13]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r3, 0x14]
	subs r0, 0x30
	ands r1, r0
	strb r1, [r3, 0x10]
	ldrb r2, [r3, 0x15]
	lsls r1, r2, 31
	lsrs r1, 31
	lsls r1, 2
	adds r0, r6, 0
	ands r0, r2
	orrs r0, r1
	mov r1, r8
	ands r0, r1
	strb r0, [r3, 0x15]
	ldrb r0, [r3, 0x11]
	movs r2, 0x4
	negs r2, r2
	ands r2, r0
	movs r0, 0x21
	negs r0, r0
	ands r2, r0
	strb r2, [r3, 0x11]
	movs r0, 0x4
	ands r0, r2
	cmp r0, 0
	beq _080AF650
	adds r0, r4, 0
	mov r1, r9
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3, 0xC]
	adds r0, r2, 0
	ands r0, r6
	strb r0, [r3, 0x11]
_080AF650:
	ldrb r2, [r3, 0x11]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _080AF668
	ldrb r0, [r3, 0xB]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r3, 0xB]
	adds r0, r7, 0
	ands r0, r2
	strb r0, [r3, 0x11]
_080AF668:
	ldrb r0, [r3, 0x11]
	movs r1, 0x11
	negs r1, r1
	ands r1, r0
	strb r1, [r3, 0x11]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080AF5A8
	movs r5, 0
	mov r6, r10
	mov r9, r5
	adds r7, r6, 0
	subs r7, 0x5C
	movs r0, 0x18
	negs r0, r0
	adds r0, r6
	mov r8, r0
_080AF68E:
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	adds r4, r6
	ldrh r2, [r4, 0x6]
	strh r2, [r4, 0x8]
	lsls r1, r5, 1
	ldrb r0, [r7, 0x1]
	lsls r0, 3
	adds r1, r0
	adds r0, r6, 0
	subs r0, 0x40
	adds r0, r1
	strh r2, [r0]
	ldrh r0, [r4, 0x6]
	bl contest_get_move_excitement
	ldrb r1, [r7, 0x1]
	lsls r1, 2
	adds r1, r5, r1
	add r1, r8
	strb r0, [r1]
	mov r1, r9
	strh r1, [r4, 0x6]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080AF68E
	ldr r2, _080AF6E8
	ldrb r1, [r2, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF6E4: .4byte 0x02019260
_080AF6E8: .4byte 0x02019328
	thumb_func_end sub_80AF438

	thumb_func_start sub_80AF59C
sub_80AF59C: @ 80AF6EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080AF714
	adds r2, r1, r0
	ldrb r1, [r2, 0xC]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	bne _080AF710
	ldrb r1, [r2, 0xB]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080AF718
_080AF710:
	movs r0, 0x1
	b _080AF71A
	.align 2, 0
_080AF714: .4byte 0x02019260
_080AF718:
	movs r0, 0
_080AF71A:
	pop {r1}
	bx r1
	thumb_func_end sub_80AF59C

	thumb_func_start unref_sub_80AF5D0
unref_sub_80AF5D0: @ 80AF720
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	ldr r1, _080AF738
	ldrb r1, [r1]
	cmp r0, r1
	beq _080AF750
_080AF732:
	movs r0, 0x1
	b _080AF776
	.align 2, 0
_080AF738: .4byte gContestPlayerMonIndex
_080AF73C:
	ldrb r0, [r4, 0x6]
	movs r1, 0x1
	b _080AF746
_080AF742:
	ldrb r0, [r4, 0x6]
	movs r1, 0x2
_080AF746:
	orrs r0, r1
	strb r0, [r4, 0x6]
	b _080AF732
_080AF74C:
	strb r3, [r2]
	b _080AF732
_080AF750:
	movs r0, 0
	ldr r4, _080AF77C
	adds r5, r4, 0x2
_080AF756:
	cmp r3, 0x3
	beq _080AF73C
	cmp r3, 0x4
	beq _080AF742
	adds r2, r0, r5
	ldrb r1, [r2]
	cmp r1, r3
	beq _080AF732
	cmp r1, 0xFF
	beq _080AF74C
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080AF756
	movs r0, 0
_080AF776:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080AF77C: .4byte 0x02019204
	thumb_func_end unref_sub_80AF5D0

	thumb_func_start sub_80AF630
sub_80AF630: @ 80AF780
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80AF688
	ldr r1, _080AF7AC
	lsls r4, 1
	adds r1, r4, r1
	strh r0, [r1]
	ldr r2, _080AF7B0
	adds r2, r4, r2
	ldr r1, _080AF7B4
	adds r4, r1
	ldrh r4, [r4]
	adds r0, r4
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AF7AC: .4byte gUnknown_02038688
_080AF7B0: .4byte gUnknown_02038678
_080AF7B4: .4byte gUnknown_02038670
	thumb_func_end sub_80AF630

	thumb_func_start sub_80AF668
sub_80AF668: @ 80AF7B8
	push {r4,lr}
	movs r4, 0
_080AF7BC:
	adds r0, r4, 0
	bl sub_80AF630
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080AF7BC
	bl sub_80AF6A0
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF668

	thumb_func_start sub_80AF688
sub_80AF688: @ 80AF7D8
	lsls r0, 24
	ldr r1, _080AF7EC
	lsrs r0, 23
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	lsls r0, 17
	asrs r0, 16
	bx lr
	.align 2, 0
_080AF7EC: .4byte gUnknown_02038680
	thumb_func_end sub_80AF688

	thumb_func_start sub_80AF6A0
sub_80AF6A0: @ 80AF7F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x70
	mov r0, sp
	movs r1, 0
	movs r2, 0x8
	bl memset
	movs r0, 0
	mov r9, r0
	mov r1, sp
	adds r1, 0x8
	str r1, [sp, 0x64]
	mov r3, sp
	adds r3, 0xC
	str r3, [sp, 0x68]
	mov r6, sp
	adds r6, 0x14
	str r6, [sp, 0x6C]
	mov r4, sp
_080AF81E:
	bl Random
	strh r0, [r4]
	movs r2, 0
	cmp r2, r9
	bge _080AF85C
	mov r1, sp
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r1]
	cmp r0, r1
	bne _080AF840
	subs r4, 0x2
	movs r7, 0x1
	negs r7, r7
	add r9, r7
	b _080AF85C
_080AF840:
	adds r2, 0x1
	cmp r2, r9
	bge _080AF85C
	lsls r0, r2, 1
	mov r3, sp
	adds r1, r3, r0
	ldrh r0, [r4]
	ldrh r1, [r1]
	cmp r0, r1
	bne _080AF840
	subs r4, 0x2
	movs r6, 0x1
	negs r6, r6
	add r9, r6
_080AF85C:
	adds r4, 0x2
	movs r7, 0x1
	add r9, r7
	mov r0, r9
	cmp r0, 0x3
	ble _080AF81E
	movs r1, 0
	mov r9, r1
	mov r4, sp
	ldr r6, _080AF96C
	ldr r2, [sp, 0x64]
	ldr r5, _080AF970
	ldr r3, [sp, 0x68]
_080AF876:
	mov r7, r9
	lsls r1, r7, 4
	movs r7, 0
	ldrsh r0, [r6, r7]
	str r0, [r2]
	movs r7, 0
	ldrsh r0, [r5, r7]
	str r0, [r3]
	ldrh r0, [r4]
	str r0, [r2, 0x8]
	ldr r0, [sp, 0x6C]
	adds r1, r0, r1
	mov r7, r9
	str r7, [r1]
	adds r4, 0x2
	adds r6, 0x2
	adds r2, 0x10
	adds r5, 0x2
	adds r3, 0x10
	movs r0, 0x1
	add r9, r0
	mov r1, r9
	cmp r1, 0x3
	ble _080AF876
	movs r3, 0
	mov r9, r3
_080AF8AA:
	movs r4, 0x3
	cmp r4, r9
	ble _080AF934
	add r7, sp, 0x48
	ldr r6, [sp, 0x68]
	str r6, [sp, 0x58]
	ldr r0, [sp, 0x64]
	adds r0, 0x8
	str r0, [sp, 0x5C]
	ldr r1, [sp, 0x6C]
	str r1, [sp, 0x60]
_080AF8C0:
	subs r3, r4, 0x1
	mov r10, r3
	mov r0, r10
	adds r1, r4, 0
	ldr r2, [sp, 0x64]
	bl sub_80AF828
	lsls r0, 24
	cmp r0, 0
	beq _080AF92E
	mov r6, r10
	lsls r2, r6, 4
	ldr r0, [sp, 0x64]
	adds r3, r0, r2
	ldr r0, [r3]
	str r0, [sp, 0x48]
	ldr r1, [sp, 0x58]
	adds r6, r1, r2
	ldr r0, [r6]
	str r0, [r7, 0x4]
	ldr r0, [sp, 0x5C]
	adds r0, r2
	mov r8, r0
	ldr r0, [r0]
	str r0, [r7, 0x8]
	ldr r1, [sp, 0x60]
	adds r2, r1, r2
	ldr r0, [r2]
	str r0, [r7, 0xC]
	lsls r1, r4, 4
	ldr r0, [sp, 0x64]
	adds r5, r0, r1
	ldr r0, [r5]
	str r0, [r3]
	ldr r3, [sp, 0x58]
	adds r4, r3, r1
	ldr r0, [r4]
	str r0, [r6]
	ldr r6, [sp, 0x5C]
	adds r3, r6, r1
	ldr r0, [r3]
	mov r6, r8
	str r0, [r6]
	ldr r0, [sp, 0x60]
	adds r1, r0, r1
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, [sp, 0x48]
	str r0, [r5]
	ldr r0, [r7, 0x4]
	str r0, [r4]
	ldr r0, [r7, 0x8]
	str r0, [r3]
	ldr r0, [r7, 0xC]
	str r0, [r1]
_080AF92E:
	mov r4, r10
	cmp r4, r9
	bgt _080AF8C0
_080AF934:
	movs r1, 0x1
	add r9, r1
	mov r3, r9
	cmp r3, 0x2
	ble _080AF8AA
	movs r6, 0
	mov r9, r6
	ldr r2, _080AF974
	ldr r1, [sp, 0x6C]
_080AF946:
	ldr r0, [r1]
	adds r0, r2
	mov r7, r9
	strb r7, [r0]
	adds r1, 0x10
	movs r0, 0x1
	add r9, r0
	mov r3, r9
	cmp r3, 0x3
	ble _080AF946
	add sp, 0x70
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF96C: .4byte gUnknown_02038678
_080AF970: .4byte gUnknown_02038670
_080AF974: .4byte gUnknown_02038690
	thumb_func_end sub_80AF6A0

	thumb_func_start sub_80AF828
sub_80AF828: @ 80AF978
	push {lr}
	lsls r0, 4
	adds r0, r2
	lsls r1, 4
	adds r3, r1, r2
	ldr r2, [r0]
	ldr r1, [r3]
	cmp r2, r1
	blt _080AF9A8
	cmp r2, r1
	bgt _080AF99A
	ldr r2, [r0, 0x4]
	ldr r1, [r3, 0x4]
	cmp r2, r1
	blt _080AF9A8
	cmp r2, r1
	ble _080AF99E
_080AF99A:
	movs r2, 0
	b _080AF9AA
_080AF99E:
	ldr r1, [r0, 0x8]
	ldr r0, [r3, 0x8]
	movs r2, 0
	cmp r1, r0
	bge _080AF9AA
_080AF9A8:
	movs r2, 0x1
_080AF9AA:
	adds r0, r2, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80AF828

	thumb_func_start sub_80AF860
sub_80AF860: @ 80AF9B0
	push {lr}
	sub sp, 0x4
	ldr r0, _080AF9DC
	movs r1, 0
	strh r1, [r0]
	ldr r0, _080AF9E0
	strh r1, [r0]
	bl sub_80AF138
	ldr r0, _080AF9E4
	ldr r1, _080AF9E8
	movs r2, 0xC2
	lsls r2, 2
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x1
	bl sub_8003460
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080AF9DC: .4byte gUnknown_030042A0
_080AF9E0: .4byte gUnknown_03004280
_080AF9E4: .4byte gMenuWindow
_080AF9E8: .4byte gUnknownText_LinkStandbyAndWinner
	thumb_func_end sub_80AF860

	thumb_func_start unref_sub_80AF89C
unref_sub_80AF89C: @ 80AF9EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r4, 16
	lsrs r4, 16
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r3, 24
	lsrs r3, 24
	mov r9, r3
	lsls r2, r3, 2
	ldr r0, _080AFA90
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldr r0, _080AFA94
	movs r1, 0x14
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80AFB74
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	asrs r6, 16
	adds r4, r6
	lsls r4, 16
	asrs r4, 16
	adds r0, r4, 0
	bl sub_80AFB74
	adds r4, r0, 0
	subs r4, r5
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	bl sub_80AFB40
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080AFA98
	lsls r1, r7, 2
	adds r1, r7
	lsls r1, 3
	adds r1, r2
	strh r5, [r1, 0x8]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0xA]
	add r0, r8
	strh r0, [r1, 0xC]
	mov r0, r9
	strh r0, [r1, 0xE]
	cmp r6, 0
	bge _080AFA82
	mov r0, r9
	bl nullsub_19
_080AFA82:
	adds r0, r7, 0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AFA90: .4byte 0x02019338
_080AFA94: .4byte sub_80AF94C
_080AFA98: .4byte gTasks
	thumb_func_end unref_sub_80AF89C

	thumb_func_start sub_80AF94C
sub_80AF94C: @ 80AFA9C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080AFAD8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	ldrb r5, [r2, 0xE]
	ldrh r3, [r2, 0xA]
	movs r0, 0xA
	ldrsh r1, [r2, r0]
	cmp r1, 0
	bne _080AFAE0
	adds r0, r5, 0
	bl nullsub_19
	adds r0, r4, 0
	bl DestroyTask
	lsls r1, r5, 2
	ldr r0, _080AFADC
	adds r1, r0
	ldrb r2, [r1, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x2]
	b _080AFBA6
	.align 2, 0
_080AFAD8: .4byte gTasks
_080AFADC: .4byte 0x02019338
_080AFAE0:
	ldrh r0, [r2, 0x1C]
	adds r0, 0x1
	strh r0, [r2, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1D
	ble _080AFBA6
	movs r0, 0
	strh r0, [r2, 0x1C]
	cmp r1, 0
	bge _080AFB0C
	ldrh r0, [r2, 0x8]
	subs r1, r0, 0x1
	strh r1, [r2, 0x8]
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r3, 0x1
	strh r0, [r2, 0xA]
	movs r0, 0x16
	bl PlaySE
	b _080AFB20
_080AFB0C:
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 24
	lsrs r6, r0, 24
	subs r0, r3, 0x1
	strh r0, [r2, 0xA]
	movs r0, 0x15
	bl PlaySE
_080AFB20:
	ldr r3, _080AFB50
	lsls r0, r4, 2
	adds r0, r4
	lsls r2, r0, 3
	adds r0, r2, r3
	ldrh r1, [r0, 0xC]
	ldr r0, _080AFB54
	cmp r1, r0
	beq _080AFB88
	adds r0, r3, r2
	adds r0, 0xC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 5
	adds r1, 0x93
	adds r1, r6, r1
	lsls r1, 1
	ldr r2, _080AFB58
	adds r1, r2
	movs r2, 0x2
	bl RequestSpriteCopy
	b _080AFBA6
	.align 2, 0
_080AFB50: .4byte gTasks
_080AFB54: .4byte 0x0000ffff
_080AFB58: .4byte 0x0600c000
_080AFB5C:
	adds r0, r2, r3
	lsls r1, 1
	adds r1, 0xE
	adds r0, r1
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 5
	adds r1, 0x93
	adds r1, r6, r1
	lsls r1, 1
	ldr r7, _080AFB84
	adds r1, r7
	movs r2, 0x2
	bl RequestSpriteCopy
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080AFBA6
	.align 2, 0
_080AFB84: .4byte 0x0600c000
_080AFB88:
	movs r1, 0
	adds r3, 0x8
_080AFB8C:
	adds r0, r1, 0x4
	lsls r0, 1
	adds r0, r2
	adds r4, r0, r3
	movs r7, 0
	ldrsh r0, [r4, r7]
	cmp r0, 0
	blt _080AFB5C
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _080AFB8C
_080AFBA6:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80AF94C

	thumb_func_start sub_80AFA5C
sub_80AFA5C: @ 80AFBAC
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	ldr r0, _080AFBFC
	mov r12, r0
	mov r4, sp
	movs r6, 0
	ldr r2, _080AFC00
	ldr r5, _080AFC04
_080AFBBE:
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 5
	adds r0, r1, 0
	adds r0, 0x56
	lsls r0, 1
	add r0, r12
	strh r6, [r4]
	mov r7, sp
	str r7, [r2]
	str r0, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r1, 0x76
	lsls r1, 1
	add r1, r12
	strh r6, [r4]
	str r7, [r2]
	str r1, [r2, 0x4]
	str r5, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080AFBBE
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFBFC: .4byte 0x0600c000
_080AFC00: .4byte 0x040000d4
_080AFC04: .4byte 0x81000008
	thumb_func_end sub_80AFA5C

	thumb_func_start unref_sub_80AFAB8
unref_sub_80AFAB8: @ 80AFC08
	push {r4-r6,lr}
	sub sp, 0x14
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r0, 16
	asrs r0, 16
	bl sub_80AFB74
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080AFC44
	cmp r4, 0
	beq _080AFC30
	ldr r2, _080AFC48
	cmp r4, 0x1
	beq _080AFC30
	ldr r2, _080AFC4C
	cmp r4, 0x2
	bne _080AFC30
	ldr r2, _080AFC50
_080AFC30:
	movs r1, 0
	lsls r3, r4, 2
	movs r6, 0
_080AFC36:
	cmp r1, r5
	bcs _080AFC54
	lsls r0, r1, 1
	add r0, sp
	strh r2, [r0]
	b _080AFC5A
	.align 2, 0
_080AFC44: .4byte 0x000050a2
_080AFC48: .4byte 0x000060a2
_080AFC4C: .4byte 0x000080a2
_080AFC50: .4byte 0x000070a2
_080AFC54:
	lsls r0, r1, 1
	add r0, sp
	strh r6, [r0]
_080AFC5A:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x8
	bls _080AFC36
	adds r0, r3, r4
	lsls r0, 6
	ldr r1, _080AFC84
	adds r0, r1
	ldr r1, _080AFC88
	mov r2, sp
	str r2, [r1]
	str r0, [r1, 0x4]
	ldr r0, _080AFC8C
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x14
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AFC84: .4byte 0x0600c128
_080AFC88: .4byte 0x040000d4
_080AFC8C: .4byte 0x80000009
	thumb_func_end unref_sub_80AFAB8

	thumb_func_start sub_80AFB40
sub_80AFB40: @ 80AFC90
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080AFCB4
	cmp r0, 0
	beq _080AFCAA
	ldr r1, _080AFCB8
	cmp r0, 0x1
	beq _080AFCAA
	ldr r1, _080AFCBC
	cmp r0, 0x2
	bne _080AFCAA
	ldr r1, _080AFCC0
_080AFCAA:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_080AFCB4: .4byte 0x00005011
_080AFCB8: .4byte 0x00006011
_080AFCBC: .4byte 0x00008011
_080AFCC0: .4byte 0x00007011
	thumb_func_end sub_80AFB40

	thumb_func_start sub_80AFB74
sub_80AFB74: @ 80AFCC4
	push {lr}
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xA
	bl __divsi3
	lsls r0, 24
	lsrs r1, r0, 24
	asrs r2, r0, 24
	cmp r2, 0x10
	ble _080AFCDE
	movs r1, 0x10
	b _080AFCE8
_080AFCDE:
	movs r0, 0x10
	negs r0, r0
	cmp r2, r0
	bge _080AFCE8
	movs r1, 0xF0
_080AFCE8:
	lsls r0, r1, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80AFB74

	thumb_func_start sub_80AFBA0
sub_80AFBA0: @ 80AFCF0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r2, r7, 2
	ldr r0, _080AFD80
	adds r2, r0
	ldrb r0, [r2, 0x2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldr r0, _080AFD84
	movs r1, 0x14
	bl CreateTask
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r5, 16
	asrs r5, 16
	adds r0, r5, 0
	bl sub_80AFB74
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	adds r5, r0
	lsls r5, 16
	asrs r5, 16
	adds r0, r5, 0
	bl sub_80AFB74
	lsls r4, 24
	asrs r4, 24
	subs r0, r4
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r7, 0
	bl sub_80AFB40
	ldr r2, _080AFD88
	lsls r3, r6, 2
	adds r0, r3, r6
	lsls r0, 3
	adds r1, r0, r2
	adds r0, r4, 0
	cmp r4, 0
	bge _080AFD64
	negs r0, r4
_080AFD64:
	strh r0, [r1, 0x8]
	lsls r0, r5, 24
	asrs r0, 24
	strh r0, [r1, 0xA]
	cmp r4, 0
	bgt _080AFD78
	cmp r4, 0
	bne _080AFD8C
	cmp r0, 0
	ble _080AFD8C
_080AFD78:
	movs r0, 0x1
	strh r0, [r1, 0xC]
	b _080AFD9A
	.align 2, 0
_080AFD80: .4byte 0x02019338
_080AFD84: .4byte sub_80AFC74
_080AFD88: .4byte gTasks
_080AFD8C:
	ldr r2, _080AFDBC
	lsls r3, r6, 2
	adds r0, r3, r6
	lsls r0, 3
	adds r0, r2
	ldr r1, _080AFDC0
	strh r1, [r0, 0xC]
_080AFD9A:
	adds r0, r3, r6
	lsls r0, 3
	adds r0, r2
	strh r7, [r0, 0xE]
	mov r1, r8
	lsls r0, r1, 16
	cmp r0, 0
	bge _080AFDB0
	adds r0, r7, 0
	bl nullsub_19
_080AFDB0:
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080AFDBC: .4byte gTasks
_080AFDC0: .4byte 0x0000ffff
	thumb_func_end sub_80AFBA0

	thumb_func_start sub_80AFC74
sub_80AFC74: @ 80AFDC4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r1, _080AFE24
	lsls r0, 2
	add r0, r8
	lsls r0, 3
	adds r4, r0, r1
	ldrb r7, [r4, 0xE]
	ldrh r3, [r4, 0x8]
	ldrh r1, [r4, 0xA]
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xE
	bgt _080AFDF6
	b _080AFF6C
_080AFDF6:
	movs r0, 0
	strh r0, [r4, 0x1C]
	ldrh r2, [r4, 0xA]
	movs r5, 0xA
	ldrsh r0, [r4, r5]
	cmp r0, 0
	bne _080AFE2C
	adds r0, r7, 0
	bl nullsub_19
	mov r0, r8
	bl DestroyTask
	lsls r1, r7, 2
	ldr r0, _080AFE28
	adds r1, r0
	ldrb r2, [r1, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x2]
	b _080AFF6C
	.align 2, 0
_080AFE24: .4byte gTasks
_080AFE28: .4byte 0x02019338
_080AFE2C:
	cmp r3, 0
	bne _080AFE78
	lsls r0, r1, 16
	mov r9, r0
	cmp r0, 0
	bge _080AFE4A
	adds r0, r7, 0
	bl sub_80AFB40
	adds r0, 0x2
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	b _080AFE58
_080AFE4A:
	adds r0, r7, 0
	bl sub_80AFB40
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
_080AFE58:
	strh r0, [r4, 0xA]
	ldr r1, _080AFE74
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x8]
	adds r2, r1, 0x1
	strh r2, [r0, 0x8]
	lsls r1, 24
	lsrs r5, r1, 24
	b _080AFEE4
	.align 2, 0
_080AFE74: .4byte gTasks
_080AFE78:
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	cmp r0, 0
	bge _080AFEB2
	lsls r0, r1, 16
	mov r9, r0
	cmp r0, 0
	bge _080AFEA0
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r2, 0x1
	strh r0, [r4, 0xA]
	adds r0, r7, 0
	bl sub_80AFB40
	adds r0, 0x2
	b _080AFEE0
_080AFEA0:
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	subs r0, r2, 0x1
	strh r0, [r4, 0xA]
	b _080AFEE4
_080AFEB2:
	lsls r0, r1, 16
	mov r9, r0
	cmp r0, 0
	bge _080AFECC
	ldrh r0, [r4, 0x8]
	subs r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 24
	lsrs r5, r0, 24
	movs r6, 0
	adds r0, r2, 0x1
	strh r0, [r4, 0xA]
	b _080AFEE4
_080AFECC:
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	lsls r0, 24
	lsrs r5, r0, 24
	subs r0, r2, 0x1
	strh r0, [r4, 0xA]
	adds r0, r7, 0
	bl sub_80AFB40
_080AFEE0:
	lsls r0, 16
	lsrs r6, r0, 16
_080AFEE4:
	mov r10, r5
	cmp r5, 0x7
	bls _080AFEF2
	adds r0, r5, 0
	adds r0, 0x18
	lsls r0, 24
	lsrs r5, r0, 24
_080AFEF2:
	mov r0, sp
	strh r6, [r0]
	ldr r0, _080AFF38
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, 0x56
	adds r1, r5, r1
	lsls r1, 1
	ldr r0, _080AFF3C
	adds r1, r0
	ldr r2, _080AFF40
	mov r0, sp
	bl CpuSet
	mov r2, r9
	cmp r2, 0
	ble _080AFF4C
	movs r0, 0x60
	bl PlaySE
	ldr r4, _080AFF44
	adds r0, r4, 0
	bl m4aMPlayImmInit
	ldr r1, _080AFF48
	mov r3, r10
	lsls r2, r3, 24
	asrs r2, 16
	adds r0, r4, 0
	bl m4aMPlayPitchControl
	b _080AFF52
	.align 2, 0
_080AFF38: .4byte gUnknown_02038696
_080AFF3C: .4byte 0x0600c000
_080AFF40: .4byte 0x01000001
_080AFF44: .4byte gMPlay_SE1
_080AFF48: .4byte 0x0000ffff
_080AFF4C:
	movs r0, 0x16
	bl PlaySE
_080AFF52:
	cmp r5, 0
	bne _080AFF6C
	cmp r6, 0
	bne _080AFF6C
	ldr r0, _080AFF7C
	mov r5, r8
	lsls r1, r5, 2
	add r1, r8
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	negs r0, r0
	strh r0, [r1, 0xC]
_080AFF6C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFF7C: .4byte gTasks
	thumb_func_end sub_80AFC74

	thumb_func_start sub_80AFE30
sub_80AFE30: @ 80AFF80
	push {r4,r5,lr}
	ldr r0, _080AFFB4
	bl LoadSpriteSheet
	movs r4, 0
	ldr r5, _080AFFB8
_080AFF8C:
	ldr r0, _080AFFBC
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, r5
	ldrb r2, [r0]
	ldr r0, _080AFFC0
	movs r1, 0xB4
	movs r3, 0x1
	bl CreateSprite
	lsls r1, r4, 2
	ldr r2, _080AFFC4
	adds r1, r2
	strb r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080AFF8C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AFFB4: .4byte gUnknown_083CA350
_080AFFB8: .4byte gUnknown_083CA338
_080AFFBC: .4byte gUnknown_02038696
_080AFFC0: .4byte gSpriteTemplate_83CA3AC
_080AFFC4: .4byte 0x02019338
	thumb_func_end sub_80AFE30

	thumb_func_start sub_80AFE78
sub_80AFE78: @ 80AFFC8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r2, r6, 2
	ldr r3, _080B0000
	adds r2, r3
	ldrb r0, [r2, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x2]
	ldrb r7, [r2]
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	subs r3, 0xD8
	adds r0, r3
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	movs r1, 0xA
	bl __divsi3
	lsls r0, 17
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x38
	ble _080B0004
	movs r5, 0x38
	b _080B000A
	.align 2, 0
_080B0000: .4byte 0x02019338
_080B0004:
	cmp r0, 0
	bge _080B000A
	movs r5, 0
_080B000A:
	ldr r2, _080B003C
	lsls r3, r7, 4
	adds r0, r3, r7
	lsls r0, 2
	adds r4, r0, r2
	movs r0, 0x3E
	adds r0, r4
	mov r12, r0
	ldrb r1, [r0]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	mov r1, r12
	strb r0, [r1]
	strh r6, [r4, 0x2E]
	strh r5, [r4, 0x30]
	lsls r0, r5, 16
	asrs r0, 16
	movs r5, 0x24
	ldrsh r1, [r4, r5]
	cmp r0, r1
	ble _080B0040
	movs r0, 0x1
	b _080B0042
	.align 2, 0
_080B003C: .4byte gSprites
_080B0040:
	ldr r0, _080B0058
_080B0042:
	strh r0, [r4, 0x32]
	adds r0, r3, r7
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r0, r1
	ldr r1, _080B005C
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0058: .4byte 0x0000ffff
_080B005C: .4byte sub_80AFF60
	thumb_func_end sub_80AFE78

	thumb_func_start sub_80AFF10
sub_80AFF10: @ 80B0060
	push {r4,lr}
	movs r4, 0
_080B0064:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80AFE78
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B0064
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AFF10

	thumb_func_start sub_80AFF28
sub_80AFF28: @ 80B0078
	push {r4,lr}
	movs r3, 0
	ldr r2, _080B00A4
	ldrb r1, [r2, 0x2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B009C
	movs r4, 0x1
_080B008A:
	adds r2, 0x4
	adds r3, 0x1
	cmp r3, 0x3
	bgt _080B009C
	ldrb r1, [r2, 0x2]
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _080B008A
_080B009C:
	cmp r3, 0x4
	beq _080B00A8
	movs r0, 0
	b _080B00AA
	.align 2, 0
_080B00A4: .4byte 0x02019338
_080B00A8:
	movs r0, 0x1
_080B00AA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80AFF28

	thumb_func_start sub_80AFF60
sub_80AFF60: @ 80B00B0
	push {r4,lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x24]
	movs r0, 0x24
	ldrsh r1, [r3, r0]
	movs r4, 0x30
	ldrsh r0, [r3, r4]
	cmp r1, r0
	bne _080B00E4
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r1, 2
	ldr r0, _080B00DC
	adds r1, r0
	ldrb r2, [r1, 0x2]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x2]
	ldr r0, _080B00E0
	str r0, [r3, 0x1C]
	b _080B00EA
	.align 2, 0
_080B00DC: .4byte 0x02019338
_080B00E0: .4byte SpriteCallbackDummy
_080B00E4:
	ldrh r0, [r3, 0x32]
	adds r0, r2, r0
	strh r0, [r3, 0x24]
_080B00EA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80AFF60

	thumb_func_start sub_80AFFA0
sub_80AFFA0: @ 80B00F0
	push {r4-r6,lr}
	movs r2, 0
	ldr r6, _080B0120
	ldr r5, _080B0124
	ldr r3, _080B0128
	ldr r4, _080B012C
_080B00FC:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r0, r5
	ldrb r0, [r0]
	strh r0, [r1, 0x22]
	adds r3, 0x4
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B00FC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0120: .4byte gSprites
_080B0124: .4byte gUnknown_083CA338
_080B0128: .4byte 0x02019338
_080B012C: .4byte gUnknown_02038696
	thumb_func_end sub_80AFFA0

	thumb_func_start sub_80AFFE0
sub_80AFFE0: @ 80B0130
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r6, _080B0158
	ldr r4, _080B015C
	ldr r2, _080B0160
_080B013E:
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _080B0174
	cmp r5, 0
	bne _080B0164
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r0, 0xB4
	b _080B0172
	.align 2, 0
_080B0158: .4byte gUnknown_02038696
_080B015C: .4byte gSprites
_080B0160: .4byte 0x02019338
_080B0164:
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r0, 0x80
	lsls r0, 1
_080B0172:
	strh r0, [r1, 0x20]
_080B0174:
	adds r2, 0x4
	adds r3, 0x1
	cmp r3, 0x3
	ble _080B013E
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80AFFE0

	thumb_func_start sub_80B0034
sub_80B0034: @ 80B0184
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080B01F8
	bl LoadSpritePalette
	movs r5, 0
	ldr r0, _080B01FC
	mov r8, r0
	ldr r7, _080B0200
	movs r6, 0
_080B019A:
	lsls r0, r5, 3
	ldr r1, _080B0204
	adds r0, r1
	bl LoadCompressedObjectPic
	ldr r0, _080B0208
	adds r0, r6, r0
	ldr r1, _080B020C
	adds r1, r5, r1
	ldrb r1, [r1]
	add r1, r8
	ldrb r2, [r1]
	movs r1, 0xCC
	movs r3, 0
	bl CreateSprite
	lsls r4, r5, 2
	ldr r1, _080B0210
	adds r4, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldr r1, _080B0214
	bl SetSubspriteTables
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r6, 0x18
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B019A
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B01F8: .4byte gUnknown_083CA3E4
_080B01FC: .4byte gUnknown_083CA33C
_080B0200: .4byte gSprites
_080B0204: .4byte gUnknown_083CA3C4
_080B0208: .4byte gSpriteTemplate_83CA3F4
_080B020C: .4byte gUnknown_02038696
_080B0210: .4byte 0x02019338
_080B0214: .4byte gUnknown_083CA464
	thumb_func_end sub_80B0034

	thumb_func_start sub_80B00C8
sub_80B00C8: @ 80B0218
	push {lr}
	ldr r0, _080B0254
	bl LoadCompressedObjectPic
	ldr r0, _080B0258
	bl LoadSpritePalette
	ldr r0, _080B025C
	movs r1, 0x1E
	movs r2, 0x2C
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B0260
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	ldr r1, _080B0264
	adds r1, 0x58
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B0254: .4byte gUnknown_083CA46C
_080B0258: .4byte gUnknown_083CA474
_080B025C: .4byte gSpriteTemplate_83CA484
_080B0260: .4byte gSprites
_080B0264: .4byte 0x02019204
	thumb_func_end sub_80B00C8

	thumb_func_start nullsub_18
nullsub_18: @ 80B0268
	bx lr
	thumb_func_end nullsub_18

	thumb_func_start unref_sub_80B011C
unref_sub_80B011C: @ 80B026C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _080B02E8
	bl LoadCompressedObjectPic
	movs r4, 0
	ldr r5, _080B02EC
_080B027C:
	lsls r0, r4, 3
	adds r0, r5
	bl LoadCompressedObjectPalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B027C
	movs r4, 0
	ldr r5, _080B02F0
	adds r0, r5, 0x1
	mov r8, r0
	ldr r7, _080B02F4
	ldr r6, _080B02F8
_080B029A:
	lsls r2, r4, 1
	adds r0, r2, r4
	lsls r0, 3
	ldr r1, _080B02FC
	adds r0, r1
	adds r1, r2, r5
	ldrb r1, [r1]
	add r2, r8
	ldrb r2, [r2]
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	movs r2, 0x3E
	adds r2, r1
	mov r12, r2
	ldrb r2, [r2]
	movs r3, 0x4
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	strh r4, [r1, 0x2E]
	adds r1, r4, r6
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B029A
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B02E8: .4byte gUnknown_083CC3AC
_080B02EC: .4byte gUnknown_083CC3B4
_080B02F0: .4byte gUnknown_083CA330
_080B02F4: .4byte gSprites
_080B02F8: .4byte 0x0201920d
_080B02FC: .4byte gSpriteTemplate_83CC454
	thumb_func_end unref_sub_80B011C

	thumb_func_start unref_sub_80B01B0
unref_sub_80B01B0: @ 80B0300
	push {r4,r5,lr}
	movs r2, 0
	ldr r5, _080B0324
	ldr r4, _080B0328
	ldr r3, _080B032C
_080B030A:
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	str r3, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B030A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0324: .4byte 0x0201920d
_080B0328: .4byte 0x02020020
_080B032C: .4byte sub_80B0238
	thumb_func_end unref_sub_80B01B0

	thumb_func_start unref_sub_80B01E0
unref_sub_80B01E0: @ 80B0330
	push {r4,r5,lr}
	movs r3, 0
	ldr r2, _080B0374
	ldr r4, _080B0378
	ldrb r1, [r4, 0x9]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, [r0]
	ldr r0, _080B037C
	cmp r1, r0
	bne _080B036A
	adds r5, r4, 0
	adds r5, 0x9
	adds r4, r1, 0
_080B0352:
	adds r3, 0x1
	cmp r3, 0x3
	bgt _080B036A
	adds r0, r3, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	cmp r0, r4
	beq _080B0352
_080B036A:
	cmp r3, 0x4
	beq _080B0380
	movs r0, 0
	b _080B0382
	.align 2, 0
_080B0374: .4byte gSprites
_080B0378: .4byte 0x02019204
_080B037C: .4byte SpriteCallbackDummy
_080B0380:
	movs r0, 0x1
_080B0382:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80B01E0

	thumb_func_start sub_80B0238
sub_80B0238: @ 80B0388
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _080B03B8
	ldr r0, _080B03B4
	b _080B03C2
	.align 2, 0
_080B03B4: .4byte sub_80B02A8
_080B03B8:
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	ldr r0, _080B03CC
_080B03C2:
	str r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B03CC: .4byte sub_80B0280
	thumb_func_end sub_80B0238

	thumb_func_start sub_80B0280
sub_80B0280: @ 80B03D0
	push {lr}
	adds r3, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B03F0
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080B03F4
	str r0, [r3, 0x1C]
_080B03F0:
	pop {r0}
	bx r0
	.align 2, 0
_080B03F4: .4byte sub_80B02A8
	thumb_func_end sub_80B0280

	thumb_func_start sub_80B02A8
sub_80B02A8: @ 80B03F8
	push {r4,lr}
	adds r4, r0, 0
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	ldr r1, _080B043C
	adds r0, r1
	ldrb r1, [r0, 0xB]
	lsls r1, 30
	lsrs r1, 30
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0x2
	bl StartSpriteAffineAnim
	ldr r0, _080B0440
	str r0, [r4, 0x1C]
	movs r0, 0x18
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B043C: .4byte 0x02019260
_080B0440: .4byte sub_80B02F4
	thumb_func_end sub_80B02A8

	thumb_func_start sub_80B02F4
sub_80B02F4: @ 80B0444
	push {r4,lr}
	adds r4, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B0468
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x1]
	ldr r0, _080B0470
	str r0, [r4, 0x1C]
_080B0468:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0470: .4byte SpriteCallbackDummy
	thumb_func_end sub_80B02F4

	thumb_func_start sub_80B0324
sub_80B0324: @ 80B0474
	push {r4,lr}
	ldr r0, _080B04AC
	movs r1, 0x1E
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B04B0
	strb r0, [r1, 0xD]
	movs r2, 0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r4, _080B04B4
	movs r3, 0xFF
_080B0492:
	lsls r0, r2, 3
	adds r0, r1
	adds r0, r4
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080B0492
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B04AC: .4byte sub_80B0458
_080B04B0: .4byte 0x02019204
_080B04B4: .4byte 0x03004b38
	thumb_func_end sub_80B0324

	thumb_func_start sub_80B0368
sub_80B0368: @ 80B04B8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080B04F0
	ldr r5, _080B04F4
	ldrb r2, [r5, 0xD]
	lsls r1, r2, 2
	adds r1, r2
	adds r1, r0
	lsls r1, 3
	adds r3, 0x8
	adds r1, r3
	movs r4, 0
	strh r4, [r1]
	lsls r0, 2
	adds r0, 0x1
	lsls r0, 1
	ldrb r2, [r5, 0xD]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r0, r1
	adds r0, r3
	strh r4, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B04F0: .4byte gTasks
_080B04F4: .4byte 0x02019204
	thumb_func_end sub_80B0368

	thumb_func_start sub_80B03A8
sub_80B03A8: @ 80B04F8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B0520
	movs r1, 0x1F
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B0524
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0520: .4byte sub_80B03D8
_080B0524: .4byte gTasks
	thumb_func_end sub_80B03A8

	thumb_func_start sub_80B03D8
sub_80B03D8: @ 80B0528
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r2, _080B059C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x8]
	adds r4, r0, 0
	ldr r6, _080B05A0
	ldrb r1, [r6, 0xD]
	lsls r0, r1, 2
	adds r0, r1
	adds r0, r4
	lsls r0, 3
	adds r7, r2, 0
	adds r7, 0x8
	adds r1, r0, r7
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _080B055C
	cmp r0, 0xFF
	bne _080B0594
_080B055C:
	movs r3, 0
	movs r0, 0xFF
	strh r0, [r1]
	lsls r1, r4, 2
	adds r1, 0x1
	lsls r1, 1
	ldrb r2, [r6, 0xD]
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r7
	strh r3, [r1]
	adds r0, r6, 0
	adds r0, 0x14
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r0, 0x5
	lsls r0, 4
	adds r0, 0x6
	ldr r3, _080B05A4
	movs r1, 0x2
	movs r2, 0
	bl BlendPalette
	adds r0, r5, 0
	bl DestroyTask
_080B0594:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B059C: .4byte gTasks
_080B05A0: .4byte 0x02019204
_080B05A4: .4byte 0x00004bff
	thumb_func_end sub_80B03D8

	thumb_func_start sub_80B0458
sub_80B0458: @ 80B05A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	lsls r1, r0, 2
	adds r1, r0
	mov r9, r1
	lsls r7, r1, 3
	ldr r0, _080B05F8
	mov r8, r0
	movs r1, 0x8
	negs r1, r1
	add r1, r8
	mov r10, r1
_080B05CC:
	lsls r0, r6, 26
	lsrs r3, r0, 24
	lsls r0, r3, 1
	adds r0, r7
	mov r4, r8
	adds r2, r0, r4
	ldrh r4, [r2]
	movs r5, 0
	ldrsh r0, [r2, r5]
	cmp r0, 0xFF
	beq _080B0646
	adds r0, r3, 0x1
	lsls r1, r0, 1
	adds r1, r7
	add r1, r8
	movs r5, 0
	ldrsh r1, [r1, r5]
	adds r5, r0, 0
	cmp r1, 0
	bne _080B05FC
	adds r0, r4, 0x1
	b _080B05FE
	.align 2, 0
_080B05F8: .4byte 0x03004b38
_080B05FC:
	subs r0, r4, 0x1
_080B05FE:
	strh r0, [r2]
	lsls r1, r3, 1
	mov r0, r9
	lsls r2, r0, 3
	adds r0, r1, r2
	mov r3, r10
	adds r3, 0x8
	adds r0, r3
	movs r4, 0
	ldrsh r0, [r0, r4]
	adds r4, r1, 0
	cmp r0, 0x10
	beq _080B061C
	cmp r0, 0
	bne _080B062A
_080B061C:
	lsls r0, r5, 1
	adds r0, r2
	adds r0, r3
	ldrh r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strh r1, [r0]
_080B062A:
	ldr r0, _080B0660
	adds r0, 0x14
	adds r0, r6, r0
	ldrb r0, [r0]
	adds r0, 0x5
	lsls r0, 4
	adds r0, 0x6
	adds r1, r4, r7
	add r1, r8
	ldrb r2, [r1]
	movs r1, 0x2
	ldr r3, _080B0664
	bl BlendPalette
_080B0646:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bls _080B05CC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0660: .4byte 0x02019204
_080B0664: .4byte 0x00004bff
	thumb_func_end sub_80B0458

	thumb_func_start sub_80B0518
sub_80B0518: @ 80B0668
	push {r4,lr}
	ldr r0, _080B0690
	movs r1, 0x1E
	bl CreateTask
	ldr r1, _080B0694
	strb r0, [r1, 0xE]
	movs r4, 0
_080B0678:
	adds r0, r4, 0
	bl sub_80B0548
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B0678
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0690: .4byte sub_80B05FC
_080B0694: .4byte 0x02019204
	thumb_func_end sub_80B0518

	thumb_func_start sub_80B0548
sub_80B0548: @ 80B0698
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _080B06D0
	ldr r4, _080B06D4
	ldrb r2, [r4, 0xE]
	lsls r1, r2, 2
	adds r1, r2
	adds r1, r0
	lsls r1, 3
	adds r3, 0x8
	adds r1, r3
	movs r5, 0
	movs r2, 0xFF
	strh r2, [r1]
	lsls r0, 2
	adds r0, 0x1
	lsls r0, 1
	ldrb r2, [r4, 0xE]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r0, r1
	adds r0, r3
	strh r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B06D0: .4byte gTasks
_080B06D4: .4byte 0x02019204
	thumb_func_end sub_80B0548

	thumb_func_start sub_80B0588
sub_80B0588: @ 80B06D8
	push {r4,lr}
	movs r4, 0
_080B06DC:
	adds r0, r4, 0
	bl sub_80B05A4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B06DC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B0588

	thumb_func_start sub_80B05A4
sub_80B05A4: @ 80B06F4
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80B0548
	adds r0, r4, 0x5
	lsls r2, r0, 5
	ldr r3, _080B0738
	adds r6, r2, r3
	ldr r5, _080B073C
	adds r2, r5
	ldr r1, _080B0740
	str r6, [r1]
	str r2, [r1, 0x4]
	ldr r2, _080B0744
	str r2, [r1, 0x8]
	ldr r6, [r1, 0x8]
	lsls r0, 4
	adds r4, 0xC
	adds r0, r4
	lsls r0, 1
	subs r3, 0x14
	adds r3, r0, r3
	subs r5, 0x14
	adds r0, r5
	str r3, [r1]
	str r0, [r1, 0x4]
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0738: .4byte 0x0202eadc
_080B073C: .4byte 0x0202eedc
_080B0740: .4byte 0x040000d4
_080B0744: .4byte 0x80000001
	thumb_func_end sub_80B05A4

	thumb_func_start nullsub_19
nullsub_19: @ 80B0748
	bx lr
	thumb_func_end nullsub_19

	thumb_func_start sub_80B05FC
sub_80B05FC: @ 80B074C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	movs r7, 0
	lsls r1, r0, 2
	adds r1, r0
	mov r9, r1
	lsls r6, r1, 3
	ldr r0, _080B07B4
	mov r8, r0
	ldr r1, _080B07B8
	mov r10, r1
_080B076C:
	lsls r0, r7, 26
	lsrs r3, r0, 24
	lsls r0, r3, 1
	adds r0, r6
	mov r4, r8
	adds r2, r0, r4
	movs r5, 0
	ldrsh r0, [r2, r5]
	cmp r0, 0xFF
	beq _080B0812
	adds r0, r3, 0x2
	lsls r0, 1
	adds r0, r6
	adds r1, r0, r4
	ldrh r0, [r1]
	adds r0, 0x1
	movs r4, 0
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B0812
	strh r4, [r1]
	adds r0, r3, 0x1
	lsls r1, r0, 1
	adds r1, r6
	add r1, r8
	movs r4, 0
	ldrsh r1, [r1, r4]
	adds r4, r0, 0
	cmp r1, 0
	bne _080B07BC
	ldrh r0, [r2]
	adds r0, 0x1
	b _080B07C0
	.align 2, 0
_080B07B4: .4byte 0x03004b38
_080B07B8: .4byte 0x00004bff
_080B07BC:
	ldrh r0, [r2]
	subs r0, 0x1
_080B07C0:
	strh r0, [r2]
	lsls r1, r3, 1
	mov r5, r9
	lsls r2, r5, 3
	adds r0, r1, r2
	ldr r3, _080B082C
	adds r3, 0x8
	adds r0, r3
	movs r5, 0
	ldrsh r0, [r0, r5]
	adds r5, r1, 0
	cmp r0, 0x10
	beq _080B07DE
	cmp r0, 0
	bne _080B07EC
_080B07DE:
	lsls r0, r4, 1
	adds r0, r2
	adds r0, r3
	ldrh r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strh r1, [r0]
_080B07EC:
	adds r4, r7, 0x5
	lsls r4, 4
	adds r0, r4, 0
	adds r0, 0xA
	adds r5, r6
	add r5, r8
	ldrb r2, [r5]
	movs r1, 0x1
	mov r3, r10
	bl BlendPalette
	adds r4, 0xC
	adds r4, r7
	ldrb r2, [r5]
	adds r0, r4, 0
	movs r1, 0x1
	mov r3, r10
	bl BlendPalette
_080B0812:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _080B076C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B082C: .4byte gTasks
	thumb_func_end sub_80B05FC

	thumb_func_start unref_sub_80B06E0
unref_sub_80B06E0: @ 80B0830
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	ldr r0, _080B088C
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r0, _080B0890
	mov r8, r0
	ldr r1, _080B0894
	mov r12, r1
_080B0854:
	lsls r4, r3, 2
	lsls r0, r3, 26
	lsrs r0, 23
	adds r0, r6
	add r0, r8
	adds r2, r7, r3
	ldrb r1, [r2]
	strh r1, [r0]
	ldrb r0, [r2]
	cmp r0, 0
	beq _080B0876
	mov r1, r12
	adds r0, r4, r1
	ldrb r1, [r0, 0x2]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r0, 0x2]
_080B0876:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _080B0854
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B088C: .4byte sub_80B0748
_080B0890: .4byte 0x03004b38
_080B0894: .4byte 0x02019338
	thumb_func_end unref_sub_80B06E0

	thumb_func_start sub_80B0748
sub_80B0748: @ 80B0898
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x20
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	movs r0, 0
	str r0, [sp, 0x4]
	ldr r2, _080B0944
	movs r1, 0x8
	adds r1, r2
	mov r10, r1
	ldr r3, [sp]
	lsls r3, 2
	str r3, [sp, 0x1C]
	ldr r1, [sp]
	adds r0, r3, r1
	lsls r0, 3
	str r0, [sp, 0xC]
_080B08C4:
	ldr r0, _080B0948
	ldr r3, [sp, 0x4]
	adds r0, r3, r0
	ldrb r4, [r0]
	lsls r0, r4, 26
	lsrs r1, r0, 24
	lsls r0, r1, 1
	str r0, [sp, 0x8]
	ldr r3, [sp]
	lsls r0, r3, 2
	adds r0, r3
	lsls r6, r0, 3
	ldr r3, [sp, 0x8]
	adds r0, r3, r6
	add r0, r10
	mov r9, r0
	ldrb r7, [r0]
	cmp r7, 0
	bne _080B08EC
	b _080B0A60
_080B08EC:
	adds r3, r1, 0x1
	lsls r0, r3, 1
	adds r0, r6
	add r0, r10
	ldrb r0, [r0]
	mov r8, r0
	adds r2, r1, 0x2
	lsls r0, r2, 1
	adds r0, r6
	add r0, r10
	ldrb r5, [r0]
	adds r1, 0x3
	lsls r0, r1, 1
	adds r0, r6
	add r0, r10
	ldrb r6, [r0]
	str r3, [sp, 0x10]
	str r2, [sp, 0x14]
	str r1, [sp, 0x18]
	cmp r7, 0x1
	bne _080B0968
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x1
	beq _080B0922
	b _080B0A3A
_080B0922:
	movs r6, 0
	adds r0, r4, 0x5
	lsls r0, 4
	adds r0, 0x1
	movs r1, 0x3
	adds r2, r5, 0
	ldr r3, _080B094C
	bl BlendPalette
	cmp r5, 0
	bne _080B0950
	mov r0, r8
	cmp r0, 0x4
	bne _080B0950
	mov r1, r9
	strh r6, [r1]
	b _080B0A3A
	.align 2, 0
_080B0944: .4byte gTasks
_080B0948: .4byte gUnknown_02038696
_080B094C: .4byte 0x00007fff
_080B0950:
	adds r0, r5, 0x2
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xD
	bls _080B0A3A
	movs r5, 0
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	b _080B0A3A
_080B0968:
	cmp r7, 0x2
	beq _080B0970
	cmp r7, 0x4
	bne _080B09E6
_080B0970:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bne _080B0A3A
	movs r6, 0
	adds r0, r4, 0x5
	lsls r0, 4
	adds r0, 0x1
	ldr r2, _080B09A4
	lsls r1, r4, 1
	adds r1, r2
	ldrh r3, [r1]
	movs r1, 0x3
	adds r2, r5, 0
	bl BlendPalette
	cmp r5, 0
	bne _080B09A8
	mov r2, r8
	cmp r2, 0x2
	bne _080B09A8
	mov r3, r9
	strh r6, [r3]
	b _080B0A3A
	.align 2, 0
_080B09A4: .4byte gUnknown_083CC5A4
_080B09A8:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xE
	bne _080B0A3A
	movs r5, 0
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r7, 0x4
	bne _080B0A3A
	cmp r0, 0x1
	bne _080B0A3A
	adds r4, 0x9
	lsls r4, 4
	adds r0, r4, 0x2
	movs r1, 0x1
	movs r2, 0x4
	movs r3, 0
	bl BlendPalette
	adds r4, 0x5
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0x4
	movs r3, 0
	bl BlendPalette
	b _080B0A3A
_080B09E6:
	cmp r7, 0x3
	bne _080B0A3A
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xC
	bne _080B0A3A
	movs r6, 0
	adds r0, r4, 0x5
	lsls r0, 4
	adds r4, r0, 0x1
	adds r0, r4, 0
	movs r1, 0x3
	adds r2, r5, 0
	movs r3, 0
	bl BlendPalette
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bne _080B0A3A
	ldr r0, _080B0A80
	lsls r1, r4, 1
	adds r0, r1, r0
	ldrh r2, [r0]
	ldr r0, _080B0A84
	adds r1, r0
	ldrh r0, [r1]
	ldr r1, _080B0A88
	str r2, [r1]
	str r0, [r1, 0x4]
	movs r0, 0x80
	lsls r0, 24
	orrs r7, r0
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, [sp, 0x8]
	ldr r2, [sp, 0xC]
	adds r0, r1, r2
	add r0, r10
	strh r6, [r0]
_080B0A3A:
	ldr r3, [sp, 0x10]
	lsls r0, r3, 1
	ldr r1, [sp, 0xC]
	adds r0, r1
	add r0, r10
	mov r2, r8
	strh r2, [r0]
	ldr r3, [sp, 0x14]
	lsls r0, r3, 1
	adds r0, r1
	add r0, r10
	strh r5, [r0]
	ldr r1, [sp, 0x18]
	lsls r0, r1, 1
	ldr r2, [sp, 0xC]
	adds r0, r2
	add r0, r10
	strh r6, [r0]
	ldr r2, _080B0A8C
_080B0A60:
	ldr r0, [sp, 0x4]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	cmp r0, 0x3
	bhi _080B0A70
	b _080B08C4
_080B0A70:
	movs r4, 0
	ldr r3, [sp, 0x1C]
	ldr r1, [sp]
	adds r0, r3, r1
	lsls r1, r0, 3
	adds r2, 0x8
	adds r0, r1, r2
	b _080B0AA0
	.align 2, 0
_080B0A80: .4byte gPlttBufferFaded
_080B0A84: .4byte gPlttBufferUnfaded
_080B0A88: .4byte 0x040000d4
_080B0A8C: .4byte gTasks
_080B0A90:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bhi _080B0AA8
	lsls r0, r4, 3
	adds r0, r1
	adds r0, r2
_080B0AA0:
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r0, 0
	beq _080B0A90
_080B0AA8:
	cmp r4, 0x4
	bne _080B0AD0
	movs r4, 0
	ldr r3, _080B0AE0
	movs r5, 0x3
	negs r5, r5
_080B0AB4:
	lsls r1, r4, 2
	adds r1, r3
	ldrb r2, [r1, 0x2]
	adds r0, r5, 0
	ands r0, r2
	strb r0, [r1, 0x2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B0AB4
	ldr r0, [sp]
	bl DestroyTask
_080B0AD0:
	add sp, 0x20
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0AE0: .4byte 0x02019338
	thumb_func_end sub_80B0748

	thumb_func_start unref_sub_80B0994
unref_sub_80B0994: @ 80B0AE4
	push {lr}
	lsls r0, 24
	cmp r0, 0
	beq _080B0AF6
	ldr r0, _080B0AFC
	ldrb r1, [r0, 0x6]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x6]
_080B0AF6:
	pop {r0}
	bx r0
	.align 2, 0
_080B0AFC: .4byte 0x02019204
	thumb_func_end unref_sub_80B0994

	thumb_func_start sub_80B09B0
sub_80B09B0: @ 80B0B00
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	ldr r1, _080B0B24
	adds r0, r1
	ldrb r1, [r0, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B0B28
	adds r0, r2, 0
	bl sub_80B0368
	b _080B0B2E
	.align 2, 0
_080B0B24: .4byte 0x02019260
_080B0B28:
	adds r0, r2, 0
	bl sub_80B03A8
_080B0B2E:
	pop {r0}
	bx r0
	thumb_func_end sub_80B09B0

	thumb_func_start sub_80B09E4
sub_80B09E4: @ 80B0B34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	mov r9, r0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _080B0C7C
	mov r1, r9
	adds r7, r1, r0
	ldrb r0, [r7]
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 27
	movs r2, 0x80
	lsls r2, 22
	adds r5, r2
	lsrs r5, 24
	lsls r4, r1, 3
	ldr r0, _080B0C80
	adds r0, r4, r0
	bl LoadCompressedObjectPic
	ldr r0, _080B0C84
	adds r4, r0
	adds r0, r4, 0
	bl LoadSpritePalette
	mov r3, r9
	lsls r4, r3, 1
	add r4, r9
	lsls r4, 3
	ldr r0, _080B0C88
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB8
	adds r2, r5, 0
	movs r3, 0x1D
	bl CreateSprite
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r4, 0
	movs r1, 0xF8
	adds r2, r5, 0
	movs r3, 0x1D
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080B0C8C
	mov r10, r1
	lsls r5, r6, 4
	adds r5, r6
	lsls r5, 2
	add r5, r10
	ldrh r2, [r5, 0x4]
	lsls r1, r2, 22
	lsrs r1, 22
	adds r1, 0x40
	ldr r3, _080B0C90
	adds r0, r3, 0
	ands r1, r0
	ldr r0, _080B0C94
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, 0x4]
	ldrb r0, [r7]
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 6
	ldr r0, _080B0C98
	adds r3, r0
	mov r1, r8
	lsls r4, r1, 4
	add r4, r8
	lsls r4, 2
	add r4, r10
	ldrh r0, [r4, 0x4]
	lsls r0, 22
	lsrs r0, 17
	ldr r2, _080B0C9C
	mov r10, r2
	add r0, r10
	str r0, [sp]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0xC0
	lsls r2, 19
	bl sub_8040F80
	ldrb r0, [r7]
	lsls r3, r0, 2
	adds r3, r0
	lsls r3, 6
	ldr r7, _080B0CA0
	adds r3, r7
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r0, 17
	add r0, r10
	str r0, [sp]
	movs r0, 0
	movs r1, 0x3
	movs r2, 0xC0
	lsls r2, 19
	bl sub_8040F80
	ldrh r0, [r4, 0x4]
	lsls r0, 22
	lsrs r0, 17
	movs r1, 0xA0
	lsls r1, 3
	adds r0, r1
	add r0, r10
	movs r2, 0
	str r2, [sp, 0x8]
	ldr r1, _080B0CA4
	add r3, sp, 0x8
	mov r12, r3
	str r3, [r1]
	str r0, [r1, 0x4]
	ldr r3, _080B0CA8
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add r0, sp, 0x4
	strb r2, [r0]
	strb r2, [r0]
	ldrh r0, [r5, 0x4]
	lsls r0, 22
	lsrs r0, 17
	movs r7, 0xA0
	lsls r7, 3
	adds r0, r7
	add r0, r10
	str r2, [sp, 0x8]
	mov r2, r12
	str r2, [r1]
	str r0, [r1, 0x4]
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	strh r6, [r4, 0x2E]
	mov r3, r8
	strh r3, [r5, 0x2E]
	mov r7, r9
	strh r7, [r4, 0x30]
	mov r0, r9
	strh r0, [r5, 0x30]
	mov r0, r8
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B0C7C: .4byte gUnknown_02038696
_080B0C80: .4byte gUnknown_083CC4B4
_080B0C84: .4byte gUnknown_083CC4D4
_080B0C88: .4byte gSpriteTemplate_83CC53C
_080B0C8C: .4byte gSprites
_080B0C90: .4byte 0x000003ff
_080B0C94: .4byte 0xfffffc00
_080B0C98: .4byte 0x0600e026
_080B0C9C: .4byte 0x06010000
_080B0CA0: .4byte 0x0600e036
_080B0CA4: .4byte 0x040000d4
_080B0CA8: .4byte 0x850000c0
	thumb_func_end sub_80B09E4

	thumb_func_start sub_80B0B5C
sub_80B0B5C: @ 80B0CAC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080B0CE4
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	adds r5, r1
	ldrh r0, [r5, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	adds r0, r4, 0
	bl FreeSpriteOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	adds r0, r5, 0
	bl DestroySpriteAndFreeResources
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B0CE4: .4byte gSprites
	thumb_func_end sub_80B0B5C

	thumb_func_start sub_80B0B98
sub_80B0B98: @ 80B0CE8
	ldr r1, _080B0CFC
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _080B0D00
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080B0CFC: .4byte 0x04000050
_080B0D00: .4byte 0x00000907
	thumb_func_end sub_80B0B98

	thumb_func_start sub_80B0BB4
sub_80B0BB4: @ 80B0D04
	ldr r0, _080B0D10
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_080B0D10: .4byte 0x04000050
	thumb_func_end sub_80B0BB4

	thumb_func_start sub_80B0BC4
sub_80B0BC4: @ 80B0D14
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r4, r0, 0
	mov r9, r1
	lsls r4, 24
	lsrs r4, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	bl sub_80B0B98
	ldr r1, _080B0D88
	mov r8, r1
	lsls r6, r4, 4
	adds r6, r4
	lsls r6, 2
	adds r0, r6, r1
	movs r1, 0x30
	ldrsh r2, [r0, r1]
	lsls r2, 2
	ldr r1, _080B0D8C
	adds r2, r1
	ldrb r1, [r2, 0x2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2, 0x2]
	ldrh r5, [r0, 0x2E]
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x1
	bl StartSpriteAffineAnim
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	mov r1, r8
	adds r0, r4, r1
	movs r1, 0x1
	bl StartSpriteAffineAnim
	movs r0, 0x1C
	add r8, r0
	add r6, r8
	ldr r0, _080B0D90
	str r0, [r6]
	add r4, r8
	ldr r0, _080B0D94
	str r0, [r4]
	mov r1, r9
	cmp r1, 0
	bne _080B0D98
	movs r0, 0x65
	bl PlaySE
	b _080B0D9E
	.align 2, 0
_080B0D88: .4byte gSprites
_080B0D8C: .4byte 0x02019338
_080B0D90: .4byte sub_80B0C5C
_080B0D94: .4byte SpriteCallbackDummy
_080B0D98:
	movs r0, 0x2
	bl PlaySE
_080B0D9E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80B0BC4

	thumb_func_start sub_80B0C5C
sub_80B0C5C: @ 80B0DAC
	push {lr}
	mov r12, r0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B0DF4
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _080B0DF8
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080B0DF4
	mov r3, r12
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _080B0DFC
	mov r1, r12
	str r0, [r1, 0x1C]
_080B0DF4:
	pop {r0}
	bx r0
	.align 2, 0
_080B0DF8: .4byte gSprites
_080B0DFC: .4byte sub_80B0CB0
	thumb_func_end sub_80B0C5C

	thumb_func_start sub_80B0CB0
sub_80B0CB0: @ 80B0E00
	push {lr}
	movs r1, 0x30
	ldrsh r2, [r0, r1]
	lsls r2, 2
	ldr r1, _080B0E28
	adds r2, r1
	ldrb r3, [r2, 0x2]
	movs r1, 0x3
	negs r1, r1
	ands r1, r3
	strb r1, [r2, 0x2]
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	bl sub_80B0B5C
	bl sub_80B0BB4
	pop {r0}
	bx r0
	.align 2, 0
_080B0E28: .4byte 0x02019338
	thumb_func_end sub_80B0CB0

	thumb_func_start sub_80B0CDC
sub_80B0CDC: @ 80B0E2C
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _080B0E40
	adds r0, r1
	ldrb r2, [r0, 0x2]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0, 0x2]
	bx lr
	.align 2, 0
_080B0E40: .4byte 0x02019338
	thumb_func_end sub_80B0CDC

	thumb_func_start unref_sub_80B0CF4
unref_sub_80B0CF4: @ 80B0E44
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	ldr r0, _080B0EAC
	movs r1, 0xC0
	lsls r1, 9
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	cmp r1, 0
	bne _080B0EBC
	movs r4, 0
	ldr r6, _080B0EB0
	adds r3, r6, 0x1
	mov r8, r3
	ldr r5, _080B0EB4
	adds r7, r5, 0x1
_080B0E6C:
	lsls r1, r4, 1
	adds r0, r1, r6
	ldrb r2, [r0]
	mov r3, r8
	adds r0, r1, r3
	ldrb r3, [r0]
	adds r0, r1, r5
	ldrb r0, [r0]
	adds r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r1, r7
	ldrb r0, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _080B0EB8
	movs r1, 0
	bl FillWindowRect_DefaultPalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B0E6C
	bl sub_80AE514
	bl sub_80AEB30
	b _080B0EC0
	.align 2, 0
_080B0EAC: .4byte 0x02000000
_080B0EB0: .4byte gUnknown_083CA308
_080B0EB4: .4byte gUnknown_083CA310
_080B0EB8: .4byte gUnknown_03004210
_080B0EBC:
	bl sub_80B0D7C
_080B0EC0:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80B0CF4

	thumb_func_start sub_80B0D7C
sub_80B0D7C: @ 80B0ECC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	movs r5, 0
	ldr r0, _080B1020
	movs r1, 0xC0
	lsls r1, 9
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B0EE8
	b _080B1012
_080B0EE8:
	movs r4, 0
	ldr r7, _080B1024
	adds r3, r7, 0x1
	mov r9, r3
	ldr r6, _080B1028
	adds r0, r6, 0x1
	mov r8, r0
_080B0EF6:
	lsls r1, r4, 1
	adds r0, r1, r7
	ldrb r2, [r0]
	mov r3, r9
	adds r0, r1, r3
	ldrb r3, [r0]
	adds r0, r1, r6
	ldrb r0, [r0]
	adds r0, 0x5
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	add r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	ldr r0, _080B102C
	movs r1, 0
	bl FillWindowRect_DefaultPalette
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B0EF6
	movs r4, 0
	ldr r6, _080B1028
	adds r7, r6, 0x1
_080B0F32:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _080B1030
	adds r0, r1
	ldrh r2, [r0, 0x4]
	movs r1, 0x4
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _080B0F58
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
	add r1, sp, 0x8
	movs r0, 0xAE
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080B0F58:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	lsls r1, r2, 16
	asrs r1, 16
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, _080B1034
	adds r0, r4, r0
	ldrb r0, [r0]
	movs r1, 0x16
	adds r2, r0, 0
	muls r2, r1
	movs r3, 0x94
	lsls r3, 2
	adds r2, r3
	lsls r0, 1
	adds r1, r0, r6
	ldrb r3, [r1]
	adds r0, r7
	ldrb r0, [r0]
	str r0, [sp]
	ldr r0, _080B102C
	add r1, sp, 0x8
	bl sub_8003460
	movs r5, 0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B0F32
	movs r4, 0
	ldr r6, _080B1024
	adds r7, r6, 0x1
_080B0FA2:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _080B1030
	adds r0, r1
	ldrh r2, [r0, 0x2]
	movs r1, 0x2
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _080B0FC8
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
	add r1, sp, 0x8
	movs r0, 0xAE
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080B0FC8:
	mov r0, sp
	adds r0, r5
	adds r0, 0x8
	lsls r1, r2, 16
	asrs r1, 16
	movs r2, 0
	movs r3, 0x4
	bl ConvertIntToDecimalStringN
	ldr r0, _080B1034
	adds r0, r4, r0
	ldrb r1, [r0]
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 18
	movs r3, 0x80
	lsls r3, 18
	adds r2, r3
	lsrs r2, 16
	lsls r1, 1
	adds r0, r1, r6
	ldrb r3, [r0]
	adds r1, r7
	ldrb r0, [r1]
	str r0, [sp]
	ldr r0, _080B102C
	add r1, sp, 0x8
	bl sub_8003460
	movs r5, 0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _080B0FA2
	bl sub_80AEB30
_080B1012:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1020: .4byte 0x02000000
_080B1024: .4byte gUnknown_083CA308
_080B1028: .4byte gUnknown_083CA310
_080B102C: .4byte gUnknown_03004210
_080B1030: .4byte 0x02019260
_080B1034: .4byte gUnknown_02038696
	thumb_func_end sub_80B0D7C

	thumb_func_start unref_sub_80B0EE8
unref_sub_80B0EE8: @ 80B1038
	push {r4-r7,lr}
	adds r7, r0, 0
	movs r4, 0
	subs r0, r1, 0x1
	cmp r4, r0
	bge _080B1070
	adds r6, r0, 0
_080B1046:
	adds r3, r0, 0
	adds r5, r4, 0x1
	cmp r0, r4
	ble _080B1068
	lsls r0, 2
	subs r0, 0x4
	adds r0, r7
_080B1054:
	ldr r1, [r0]
	ldr r2, [r0, 0x4]
	cmp r1, r2
	ble _080B1060
	str r1, [r0, 0x4]
	str r2, [r0]
_080B1060:
	subs r0, 0x4
	subs r3, 0x1
	cmp r3, r4
	bgt _080B1054
_080B1068:
	adds r4, r5, 0
	adds r0, r6, 0
	cmp r4, r0
	blt _080B1046
_080B1070:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_80B0EE8

	thumb_func_start sub_80B0F28
sub_80B0F28: @ 80B1078
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	add r4, sp, 0x4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x8
	bl memset
	movs r5, 0
	add r4, sp, 0x4
	adds r6, r4, 0
	movs r7, 0
_080B109E:
	bl Random
	adds r1, r0, 0
	mov r0, sp
	adds r0, r7
	adds r0, 0x4
	strh r1, [r0]
	movs r2, 0
	cmp r2, r5
	bge _080B10D6
	lsls r0, r1, 16
	lsrs r0, 16
	mov r1, sp
	ldrh r1, [r1, 0x4]
	cmp r0, r1
	beq _080B10D0
_080B10BE:
	adds r2, 0x1
	cmp r2, r5
	bge _080B10D6
	lsls r0, r2, 1
	adds r0, r4, r0
	ldrh r1, [r6]
	ldrh r0, [r0]
	cmp r1, r0
	bne _080B10BE
_080B10D0:
	subs r6, 0x2
	subs r7, 0x2
	subs r5, 0x1
_080B10D6:
	adds r6, 0x2
	adds r7, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B109E
	mov r2, r8
	cmp r2, 0
	bne _080B11A0
	movs r5, 0
	ldr r3, _080B1158
	mov r8, r3
_080B10EC:
	mov r6, r8
	strb r5, [r6]
	movs r4, 0
	cmp r4, r5
	bge _080B1168
	ldr r7, _080B115C
	mov r9, r7
	lsls r0, r5, 1
	adds r1, r0, 0
	add r1, r9
	mov r12, r1
	mov r2, sp
	adds r2, 0x4
	str r2, [sp, 0xC]
	add r0, sp
	adds r0, 0x4
	str r0, [sp, 0x10]
	ldr r3, _080B1158
	adds r6, r3, 0
	mov r10, r6
_080B1114:
	ldrb r0, [r3]
	lsls r2, r0, 1
	mov r7, r9
	adds r0, r2, r7
	movs r6, 0
	ldrsh r1, [r0, r6]
	mov r7, r12
	movs r6, 0
	ldrsh r0, [r7, r6]
	cmp r1, r0
	blt _080B113C
	cmp r1, r0
	bne _080B1160
	ldr r7, [sp, 0xC]
	adds r0, r7, r2
	ldrh r0, [r0]
	ldr r1, [sp, 0x10]
	ldrh r1, [r1]
	cmp r0, r1
	bcs _080B1160
_080B113C:
	adds r2, r5, 0
	cmp r5, r4
	ble _080B1154
	subs r0, r5, 0x1
	mov r6, r10
	adds r1, r0, r6
_080B1148:
	ldrb r0, [r1]
	strb r0, [r1, 0x1]
	subs r1, 0x1
	subs r2, 0x1
	cmp r2, r4
	bgt _080B1148
_080B1154:
	strb r5, [r3]
	b _080B1168
	.align 2, 0
_080B1158: .4byte gUnknown_02038696
_080B115C: .4byte gUnknown_02038670
_080B1160:
	adds r3, 0x1
	adds r4, 0x1
	cmp r4, r5
	blt _080B1114
_080B1168:
	cmp r4, r5
	bne _080B1170
	mov r7, r8
	strb r5, [r7]
_080B1170:
	movs r0, 0x1
	add r8, r0
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B10EC
	ldr r4, _080B119C
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0x4
	bl memcpy
	movs r5, 0
_080B1188:
	mov r1, sp
	adds r0, r1, r5
	ldrb r0, [r0]
	adds r0, r4
	strb r5, [r0]
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B1188
	b _080B124C
	.align 2, 0
_080B119C: .4byte gUnknown_02038696
_080B11A0:
	mov r0, sp
	movs r1, 0xFF
	movs r2, 0x4
	bl memset
	movs r5, 0
	ldr r3, _080B11C0
	movs r6, 0
_080B11B0:
	ldr r0, _080B11C4
	adds r0, r6, r0
	ldrb r0, [r0, 0xB]
	lsls r0, 30
	lsrs r2, r0, 30
	mov r7, sp
	adds r1, r7, r2
	b _080B11D2
	.align 2, 0
_080B11C0: .4byte gUnknown_02038696
_080B11C4: .4byte 0x02019260
_080B11C8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	mov r0, sp
	adds r1, r0, r2
_080B11D2:
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _080B11C8
	strb r5, [r1]
	strb r2, [r3]
	adds r3, 0x1
	adds r6, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B11B0
	movs r5, 0
_080B11E8:
	movs r4, 0x3
	adds r1, r5, 0x1
	mov r10, r1
	cmp r4, r5
	ble _080B1246
	mov r9, r4
	ldr r2, _080B125C
	mov r8, r2
	add r3, sp, 0x4
	mov r12, r3
_080B11FC:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r6, _080B1260
	adds r1, r0, r6
	ldrb r2, [r1, 0xB]
	ldr r7, _080B1264
	adds r0, r7
	ldrb r3, [r0, 0xB]
	mov r1, r9
	ands r1, r2
	mov r0, r9
	ands r0, r3
	subs r3, r4, 0x1
	cmp r1, r0
	bne _080B1240
	mov r0, r8
	adds r7, r3, r0
	adds r2, r4, r0
	ldrb r6, [r7]
	ldrb r1, [r2]
	cmp r6, r1
	bcs _080B1240
	lsls r0, r3, 1
	add r0, r12
	lsls r1, r4, 1
	add r1, r12
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bcs _080B1240
	ldrb r0, [r2]
	strb r6, [r2]
	strb r0, [r7]
_080B1240:
	adds r4, r3, 0
	cmp r4, r5
	bgt _080B11FC
_080B1246:
	mov r5, r10
	cmp r5, 0x2
	ble _080B11E8
_080B124C:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B125C: .4byte gUnknown_02038696
_080B1260: .4byte 0x02019244
_080B1264: .4byte 0x02019260
	thumb_func_end sub_80B0F28

	thumb_func_start sub_80B1118
sub_80B1118: @ 80B1268
	push {r4,r5,lr}
	movs r4, 0
	movs r5, 0xA0
_080B126E:
	ldr r0, _080B1294
	adds r0, r5, r0
	ldr r1, _080B1298
	adds r1, r4, r1
	ldrb r1, [r1]
	adds r1, 0x5
	lsls r1, 4
	movs r2, 0x20
	bl LoadPalette
	adds r5, 0x20
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B126E
	bl sub_80AE514
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1294: .4byte 0x02018004
_080B1298: .4byte gUnknown_02038696
	thumb_func_end sub_80B1118

	thumb_func_start sub_80B114C
sub_80B114C: @ 80B129C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r7, r6, 3
	subs r0, r7, r6
	lsls r0, 2
	ldr r4, _080B1308
	adds r5, r0, r4
	movs r0, 0
	strh r0, [r5, 0x2]
	strh r0, [r5]
	adds r0, r6, 0
	bl sub_80AF404
	lsls r0, 24
	mov r8, r4
	cmp r0, 0
	bne _080B12C6
	b _080B152C
_080B12C6:
	ldrh r0, [r5, 0x6]
	ldr r1, _080B130C
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0]
	mov r12, r1
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	lsrs r0, 29
	strb r0, [r5, 0xA]
	ldrh r0, [r5, 0x6]
	ldrh r1, [r5, 0x8]
	cmp r0, r1
	bne _080B1310
	cmp r0, 0
	beq _080B1310
	ldrb r0, [r5, 0x15]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r5, 0x15]
	ldrb r2, [r5, 0xB]
	lsls r1, r2, 25
	lsrs r1, 29
	adds r1, 0x1
	movs r0, 0x7
	ands r1, r0
	lsls r1, 4
	movs r0, 0x71
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0xB]
	b _080B1328
	.align 2, 0
_080B1308: .4byte 0x02019260
_080B130C: .4byte gContestMoves
_080B1310:
	lsls r4, r6, 3
	subs r1, r4, r6
	lsls r1, 2
	ldr r3, _080B13B4
	adds r1, r3
	ldrb r2, [r1, 0xB]
	movs r0, 0x71
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0xB]
	adds r7, r4, 0
	mov r8, r3
_080B1328:
	subs r0, r7, r6
	lsls r0, 2
	add r0, r8
	ldr r2, _080B13B8
	mov r1, r12
	lsls r3, r1, 2
	adds r2, r3, r2
	ldrb r1, [r2, 0x1]
	strh r1, [r0]
	strh r1, [r0, 0x2]
	mov r0, r8
	adds r0, 0x70
	ldrb r1, [r2, 0x2]
	strh r1, [r0, 0x4]
	strh r1, [r0, 0x6]
	strb r6, [r0, 0x11]
	movs r2, 0
	adds r4, r3, 0
	movs r1, 0
	mov r5, r8
	adds r5, 0x7D
	mov r3, r8
_080B1354:
	strb r1, [r3, 0xE]
	adds r0, r5, r2
	strb r1, [r0]
	adds r3, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B1354
	subs r0, r7, r6
	lsls r0, 2
	ldr r1, _080B13B4
	adds r5, r0, r1
	ldrb r1, [r5, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B138C
	ldrh r0, [r5, 0x8]
	ldrh r1, [r5, 0x6]
	bl AreMovesContestCombo
	lsls r0, 24
	cmp r0, 0
	bne _080B138C
	ldrb r1, [r5, 0x15]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x15]
_080B138C:
	ldr r0, _080B13BC
	adds r0, r4, r0
	ldr r0, [r0]
	bl _call_via_r0
	subs r0, r7, r6
	lsls r0, 2
	ldr r1, _080B13B4
	adds r2, r0, r1
	ldrb r1, [r2, 0x10]
	movs r0, 0x30
	ands r0, r1
	cmp r0, 0x10
	bne _080B13C0
	ldrh r1, [r2, 0x2]
	subs r1, 0xA
	movs r0, 0xD
	ldrsb r0, [r2, r0]
	b _080B13DA
	.align 2, 0
_080B13B4: .4byte 0x02019260
_080B13B8: .4byte gContestEffects
_080B13BC: .4byte gContestEffectFuncs
_080B13C0:
	ldrb r1, [r2, 0x11]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080B13D4
	movs r1, 0xD
	ldrsb r1, [r2, r1]
	lsls r0, r1, 1
	adds r0, r1
	b _080B13D8
_080B13D4:
	movs r0, 0xD
	ldrsb r0, [r2, r0]
_080B13D8:
	ldrh r1, [r2, 0x2]
_080B13DA:
	adds r0, r1
	strh r0, [r2, 0x2]
	subs r0, r7, r6
	lsls r0, 2
	ldr r1, _080B1438
	adds r4, r0, r1
	movs r0, 0
	strb r0, [r4, 0x16]
	ldrb r1, [r4, 0x15]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r4, 0x15]
	adds r0, r6, 0
	bl sub_80B214C
	lsls r0, 24
	cmp r0, 0
	beq _080B1472
	ldrh r0, [r4, 0x8]
	ldrh r1, [r4, 0x6]
	bl AreMovesContestCombo
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _080B143C
	ldrb r1, [r4, 0x15]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B143C
	strb r2, [r4, 0x16]
	movs r0, 0x40
	orrs r1, r0
	movs r0, 0x11
	negs r0, r0
	ands r1, r0
	movs r0, 0
	ldrsh r2, [r4, r0]
	ldrb r0, [r4, 0x16]
	muls r0, r2
	strb r0, [r4, 0x17]
	movs r0, 0x8
	orrs r1, r0
	strb r1, [r4, 0x15]
	b _080B1472
	.align 2, 0
_080B1438: .4byte 0x02019260
_080B143C:
	ldr r2, _080B1460
	subs r0, r7, r6
	lsls r0, 2
	ldr r1, _080B1464
	adds r3, r0, r1
	ldrh r0, [r3, 0x6]
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x2]
	cmp r0, 0
	beq _080B1468
	ldrb r0, [r3, 0x15]
	movs r1, 0x10
	orrs r0, r1
	movs r1, 0x40
	orrs r0, r1
	b _080B1470
	.align 2, 0
_080B1460: .4byte gContestMoves
_080B1464: .4byte 0x02019260
_080B1468:
	ldrb r1, [r3, 0x15]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
_080B1470:
	strb r0, [r3, 0x15]
_080B1472:
	subs r0, r7, r6
	lsls r0, 2
	ldr r1, _080B14EC
	mov r8, r1
	adds r4, r0, r1
	ldrb r1, [r4, 0x15]
	movs r5, 0x1
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080B1498
	ldrb r0, [r4, 0xB]
	lsls r0, 25
	lsrs r0, 29
	adds r0, 0x1
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 1
	strb r1, [r4, 0x18]
_080B1498:
	ldrb r1, [r4, 0xC]
	adds r0, r5, 0
	ands r0, r1
	cmp r0, 0
	beq _080B14B2
	ldrb r0, [r4, 0x15]
	movs r1, 0x11
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x15]
	movs r0, 0
	strh r0, [r4, 0x2]
	strh r0, [r4]
_080B14B2:
	ldrh r0, [r4, 0x6]
	bl contest_get_move_excitement
	mov r2, r8
	adds r2, 0xC8
	strb r0, [r2]
	ldrb r1, [r4, 0x11]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080B14CA
	strb r5, [r2]
_080B14CA:
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0
	ble _080B14F4
	mov r0, r8
	subs r0, 0x5C
	ldrb r0, [r0, 0x13]
	lsls r0, 24
	asrs r0, 24
	movs r1, 0
	ldrsb r1, [r2, r1]
	adds r0, r1
	cmp r0, 0x4
	ble _080B14F0
	movs r0, 0x3C
	b _080B14F6
	.align 2, 0
_080B14EC: .4byte 0x02019260
_080B14F0:
	movs r0, 0xA
	b _080B14F6
_080B14F4:
	movs r0, 0
_080B14F6:
	strb r0, [r2, 0x2]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	b _080B151A
_080B150E:
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
_080B1514:
	adds r2, 0x1
	cmp r2, 0x3
	bgt _080B1522
_080B151A:
	cmp r2, r6
	beq _080B1514
	cmp r0, 0
	bne _080B150E
_080B1522:
	subs r0, r7, r6
	lsls r0, 2
	ldr r1, _080B1538
	adds r0, r1
	strb r2, [r0, 0x1B]
_080B152C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1538: .4byte 0x02019260
	thumb_func_end sub_80B114C

	thumb_func_start sub_80B13EC
sub_80B13EC: @ 80B153C
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, _080B1550
	adds r2, r0
	strb r1, [r2, 0x13]
	bx lr
	.align 2, 0
_080B1550: .4byte 0x02019260
	thumb_func_end sub_80B13EC

	thumb_func_start sub_80B1404
sub_80B1404: @ 80B1554
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 3
	subs r2, r0
	lsls r2, 2
	ldr r0, _080B1568
	adds r2, r0
	strb r1, [r2, 0x14]
	bx lr
	.align 2, 0
_080B1568: .4byte 0x02019260
	thumb_func_end sub_80B1404

	thumb_func_start sub_80B141C
sub_80B141C: @ 80B156C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x3B
	bls _080B1586
	movs r1, 0x35
	bl sub_80B13EC
	b _080B15B6
_080B1586:
	cmp r1, 0x27
	bls _080B1592
	movs r1, 0x34
	bl sub_80B13EC
	b _080B15B6
_080B1592:
	cmp r1, 0x1D
	bls _080B159E
	movs r1, 0x33
	bl sub_80B13EC
	b _080B15B6
_080B159E:
	cmp r1, 0x13
	bls _080B15AA
	movs r1, 0x32
	bl sub_80B13EC
	b _080B15B6
_080B15AA:
	cmp r2, 0x9
	bls _080B15B6
	adds r0, r3, 0
	movs r1, 0x31
	bl sub_80B13EC
_080B15B6:
	pop {r0}
	bx r0
	thumb_func_end sub_80B141C

	thumb_func_start sub_80B146C
sub_80B146C: @ 80B15BC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080B1618
	lsls r1, r4, 6
	ldr r2, _080B161C
	adds r1, r2
	bl StringCopy
	ldr r0, _080B1620
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r4, _080B1624
	adds r1, r4
	ldrh r2, [r1, 0x6]
	movs r1, 0xD
	muls r1, r2
	ldr r2, _080B1628
	adds r1, r2
	bl StringCopy
	ldr r2, _080B162C
	adds r0, r4, 0
	adds r0, 0x70
	ldrb r1, [r0, 0x11]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	adds r0, r4
	ldrh r0, [r0, 0x6]
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x1]
	lsls r1, r0, 29
	cmp r1, 0
	bne _080B1638
	ldr r0, _080B1630
	ldr r1, _080B1634
	bl StringCopy
	b _080B1688
	.align 2, 0
_080B1618: .4byte gStringVar1
_080B161C: .4byte 0x02038572
_080B1620: .4byte gStringVar2
_080B1624: .4byte 0x02019260
_080B1628: .4byte gMoveNames
_080B162C: .4byte gContestMoves
_080B1630: .4byte gStringVar3
_080B1634: .4byte gUnknown_083CC280
_080B1638:
	lsrs r0, r1, 29
	cmp r0, 0x1
	bne _080B1650
	ldr r0, _080B1648
	ldr r1, _080B164C
	bl StringCopy
	b _080B1688
	.align 2, 0
_080B1648: .4byte gStringVar3
_080B164C: .4byte gUnknown_083CC288
_080B1650:
	lsrs r0, r1, 29
	cmp r0, 0x2
	bne _080B1668
	ldr r0, _080B1660
	ldr r1, _080B1664
	bl StringCopy
	b _080B1688
	.align 2, 0
_080B1660: .4byte gStringVar3
_080B1664: .4byte gUnknown_083CC290
_080B1668:
	lsrs r0, r1, 29
	cmp r0, 0x3
	bne _080B1680
	ldr r0, _080B1678
	ldr r1, _080B167C
	bl StringCopy
	b _080B1688
	.align 2, 0
_080B1678: .4byte gStringVar3
_080B167C: .4byte gUnknown_083CC299
_080B1680:
	ldr r0, _080B16B8
	ldr r1, _080B16BC
	bl StringCopy
_080B1688:
	ldr r4, _080B16C0
	ldr r1, _080B16C4
	lsls r0, r5, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringExpandPlaceholders
	bl sub_80AF138
	ldr r0, _080B16C8
	movs r2, 0xC2
	lsls r2, 2
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8002EB0
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B16B8: .4byte gStringVar3
_080B16BC: .4byte gUnknown_083CC2A3
_080B16C0: .4byte gStringVar4
_080B16C4: .4byte gUnknown_083CC188
_080B16C8: .4byte gMenuWindow
	thumb_func_end sub_80B146C

	thumb_func_start sub_80B157C
sub_80B157C: @ 80B16CC
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080B16E8
	adds r1, r0
	ldrb r0, [r1, 0xC]
	movs r2, 0x1
	orrs r0, r2
	strb r0, [r1, 0xC]
	movs r0, 0
	strh r0, [r1, 0x6]
	bx lr
	.align 2, 0
_080B16E8: .4byte 0x02019260
	thumb_func_end sub_80B157C

	thumb_func_start sub_80B159C
sub_80B159C: @ 80B16EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	movs r4, 0
	ldr r1, _080B1750
	mov r9, r1
	add r2, sp, 0x4
	mov r6, r9
	movs r5, 0
	adds r3, r2, 0
_080B1708:
	mov r0, sp
	adds r1, r0, r4
	adds r0, r4, r6
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, r4
	strb r5, [r0]
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B1708
	movs r4, 0
	ldr r7, _080B1754
	adds r5, r2, 0
	movs r1, 0x1
	mov r8, r1
_080B1726:
	movs r2, 0
	adds r1, r7, 0
_080B172A:
	ldrb r0, [r1, 0x19]
	cmp r0, r4
	beq _080B1758
	adds r1, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B172A
_080B1738:
	cmp r2, 0x4
	bne _080B17D0
	movs r2, 0
	ldrb r0, [r5]
	cmp r0, 0
	bne _080B1766
	ldrb r0, [r7, 0x19]
	cmp r0, 0xFF
	bne _080B1766
	mov r12, r2
	movs r2, 0x1
	b _080B178A
	.align 2, 0
_080B1750: .4byte gUnknown_02038696
_080B1754: .4byte 0x02019260
_080B1758:
	mov r1, sp
	adds r0, r1, r2
	strb r4, [r0]
	adds r0, r5, r2
	mov r1, r8
	strb r1, [r0]
	b _080B1738
_080B1766:
	adds r2, 0x1
	cmp r2, 0x3
	bgt _080B17C2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B1766
	lsls r0, r2, 3
	subs r0, r2
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x19]
	cmp r0, 0xFF
	bne _080B1766
	lsls r0, r2, 24
	lsrs r0, 24
	mov r12, r0
	adds r2, 0x1
_080B178A:
	cmp r2, 0x3
	bgt _080B17C2
	ldr r6, _080B1818
	lsls r0, r2, 3
	subs r0, r2
	lsls r3, r0, 2
_080B1796:
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B17BA
	adds r0, r3, r7
	ldrb r0, [r0, 0x19]
	cmp r0, 0xFF
	bne _080B17BA
	mov r1, r12
	adds r0, r1, r6
	adds r1, r2, r6
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080B17BA
	lsls r0, r2, 24
	lsrs r0, 24
	mov r12, r0
_080B17BA:
	adds r3, 0x1C
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B1796
_080B17C2:
	mov r0, sp
	add r0, r12
	strb r4, [r0]
	mov r1, r12
	adds r0, r5, r1
	mov r1, r8
	strb r1, [r0]
_080B17D0:
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B1726
	movs r4, 0
	ldr r5, _080B181C
	adds r3, r5, 0
	subs r3, 0x60
	movs r6, 0xFF
	movs r7, 0x3F
_080B17E2:
	adds r1, r4, r5
	mov r0, sp
	adds r2, r0, r4
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r3, 0x9]
	orrs r0, r6
	strb r0, [r3, 0x9]
	ldrb r1, [r3]
	adds r0, r7, 0
	ands r0, r1
	strb r0, [r3]
	mov r0, r9
	adds r1, r4, r0
	ldrb r0, [r2]
	strb r0, [r1]
	adds r3, 0x1C
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B17E2
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1818: .4byte gUnknown_02038696
_080B181C: .4byte 0x020192d0
	thumb_func_end sub_80B159C

	thumb_func_start sub_80B16D0
sub_80B16D0: @ 80B1820
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x30]
	adds r1, r0, 0x1
	strh r1, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x54
	ble _080B1852
	movs r0, 0
	strh r0, [r2, 0x30]
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080B1858
	str r0, [r2, 0x1C]
	ldr r2, _080B185C
	ldrb r1, [r2, 0x6]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x6]
_080B1852:
	pop {r0}
	bx r0
	.align 2, 0
_080B1858: .4byte SpriteCallbackDummy
_080B185C: .4byte 0x02019204
	thumb_func_end sub_80B16D0

	thumb_func_start sub_80B1710
sub_80B1710: @ 80B1860
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080B187C
	ldrb r5, [r0, 0x12]
	cmp r1, 0x8
	bls _080B1870
	b _080B1A10
_080B1870:
	lsls r0, r1, 2
	ldr r1, _080B1880
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B187C: .4byte 0x02019204
_080B1880: .4byte _080B1884
	.align 2, 0
_080B1884:
	.4byte _080B18A8
	.4byte _080B18A8
	.4byte _080B18D8
	.4byte _080B190C
	.4byte _080B1940
	.4byte _080B1974
	.4byte _080B19A8
	.4byte _080B1A10
	.4byte _080B19DC
_080B18A8:
	ldr r0, _080B18CC
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2E]
	ldr r2, _080B18D0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B18D4
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0x20
	bl PlaySE
	b _080B1A34
	.align 2, 0
_080B18CC: .4byte gSprites
_080B18D0: .4byte 0x000003ff
_080B18D4: .4byte 0xfffffc00
_080B18D8:
	ldr r0, _080B1900
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x2E]
	adds r2, 0x4
	ldr r3, _080B1904
	adds r0, r3, 0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B1908
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0x1F
	bl PlaySE
	b _080B1A34
	.align 2, 0
_080B1900: .4byte gSprites
_080B1904: .4byte 0x000003ff
_080B1908: .4byte 0xfffffc00
_080B190C:
	ldr r0, _080B1934
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x2E]
	adds r2, 0x8
	ldr r3, _080B1938
	adds r0, r3, 0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B193C
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0x1F
	bl PlaySE
	b _080B1A34
	.align 2, 0
_080B1934: .4byte gSprites
_080B1938: .4byte 0x000003ff
_080B193C: .4byte 0xfffffc00
_080B1940:
	ldr r0, _080B1968
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x2E]
	adds r2, 0xC
	ldr r3, _080B196C
	adds r0, r3, 0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B1970
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0x2D
	bl PlaySE
	b _080B1A34
	.align 2, 0
_080B1968: .4byte gSprites
_080B196C: .4byte 0x000003ff
_080B1970: .4byte 0xfffffc00
_080B1974:
	ldr r0, _080B199C
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x2E]
	adds r2, 0xC
	ldr r3, _080B19A0
	adds r0, r3, 0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B19A4
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0x2D
	bl PlaySE
	b _080B1A34
	.align 2, 0
_080B199C: .4byte gSprites
_080B19A0: .4byte 0x000003ff
_080B19A4: .4byte 0xfffffc00
_080B19A8:
	ldr r0, _080B19D0
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x2E]
	adds r2, 0x10
	ldr r3, _080B19D4
	adds r0, r3, 0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B19D8
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0x2D
	bl PlaySE
	b _080B1A34
	.align 2, 0
_080B19D0: .4byte gSprites
_080B19D4: .4byte 0x000003ff
_080B19D8: .4byte 0xfffffc00
_080B19DC:
	ldr r0, _080B1A04
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x2E]
	adds r2, 0x18
	ldr r3, _080B1A08
	adds r0, r3, 0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B1A0C
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0xC3
	bl PlaySE
	b _080B1A34
	.align 2, 0
_080B1A04: .4byte gSprites
_080B1A08: .4byte 0x000003ff
_080B1A0C: .4byte 0xfffffc00
_080B1A10:
	ldr r0, _080B1A64
	lsls r4, r5, 4
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x2E]
	adds r2, 0x14
	ldr r3, _080B1A68
	adds r0, r3, 0
	ands r2, r0
	ldrh r3, [r1, 0x4]
	ldr r0, _080B1A6C
	ands r0, r3
	orrs r0, r2
	strh r0, [r1, 0x4]
	movs r0, 0x2D
	bl PlaySE
_080B1A34:
	adds r2, r4, 0
	ldr r4, _080B1A64
	adds r2, r5
	lsls r2, 2
	adds r1, r2, r4
	movs r0, 0
	strh r0, [r1, 0x30]
	adds r1, 0x3E
	ldrb r3, [r1]
	subs r0, 0x5
	ands r0, r3
	strb r0, [r1]
	adds r4, 0x1C
	adds r2, r4
	ldr r0, _080B1A70
	str r0, [r2]
	ldr r2, _080B1A74
	ldrb r0, [r2, 0x6]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r2, 0x6]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1A64: .4byte gSprites
_080B1A68: .4byte 0x000003ff
_080B1A6C: .4byte 0xfffffc00
_080B1A70: .4byte sub_80B16D0
_080B1A74: .4byte 0x02019204
	thumb_func_end sub_80B1710

	thumb_func_start sub_80B1928
sub_80B1928: @ 80B1A78
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r5, 0
	ldr r6, _080B1B0C
	ldr r0, _080B1B10
	mov r10, r0
	movs r1, 0x58
	adds r1, r6
	mov r9, r1
	ldr r0, _080B1B14
	mov r8, r0
	ldr r7, _080B1B18
_080B1A96:
	movs r0, 0x13
	ldrsb r0, [r6, r0]
	ldr r4, _080B1B1C
	cmp r5, r0
	bge _080B1AA2
	adds r4, 0x40
_080B1AA2:
	mov r0, r9
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r10
	ldrh r1, [r0, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r0, r5, 0
	adds r0, 0x11
	adds r1, r0
	lsls r1, 5
	add r1, r8
	adds r0, r4, 0
	adds r2, r7, 0
	bl CpuSet
	adds r0, r4, 0
	adds r0, 0x20
	mov r1, r9
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r10
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 22
	adds r2, r5, 0
	adds r2, 0x19
	adds r1, r2
	lsls r1, 5
	add r1, r8
	adds r2, r7, 0
	bl CpuSet
	movs r0, 0x13
	ldrsb r0, [r6, r0]
	cmp r0, 0x4
	ble _080B1AF8
	bl sub_80B1A2C
_080B1AF8:
	adds r5, 0x1
	cmp r5, 0x4
	ble _080B1A96
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1B0C: .4byte 0x02019204
_080B1B10: .4byte gSprites
_080B1B14: .4byte 0x06010000
_080B1B18: .4byte 0x04000008
_080B1B1C: .4byte gContestApplauseMeterGfx
	thumb_func_end sub_80B1928

	thumb_func_start unref_sub_80B19D0
unref_sub_80B19D0: @ 80B1B20
	push {lr}
	sub sp, 0x18
	ldr r1, _080B1B44
	add r0, sp, 0x4
	bl StringCopy
	ldr r0, _080B1B48
	movs r2, 0xAA
	lsls r2, 2
	movs r1, 0
	str r1, [sp]
	add r1, sp, 0x4
	movs r3, 0
	bl sub_8003460
	add sp, 0x18
	pop {r0}
	bx r0
	.align 2, 0
_080B1B44: .4byte gUnknown_083CC2EC
_080B1B48: .4byte gUnknown_03004210
	thumb_func_end unref_sub_80B19D0

	thumb_func_start contest_get_move_excitement
contest_get_move_excitement: @ 80B1B4C
	lsls r0, 16
	ldr r3, _080B1B70
	ldr r1, _080B1B74
	lsrs r0, 13
	adds r0, r1
	ldrb r1, [r0, 0x1]
	lsls r1, 29
	lsrs r1, 29
	ldr r0, _080B1B78
	ldrh r2, [r0]
	lsls r0, r2, 2
	adds r0, r2
	adds r1, r0
	adds r1, r3
	movs r0, 0
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_080B1B70: .4byte gContestExcitementTable
_080B1B74: .4byte gContestMoves
_080B1B78: .4byte gScriptContestCategory
	thumb_func_end contest_get_move_excitement

	thumb_func_start sub_80B1A2C
sub_80B1A2C: @ 80B1B7C
	push {r4,r5,lr}
	ldr r0, _080B1BB0
	movs r1, 0xA
	bl CreateTask
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _080B1BB4
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r0
	movs r0, 0x1
	strh r0, [r4, 0xA]
	ldr r0, _080B1BB8
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B1BB0: .4byte c3_08130B10
_080B1BB4: .4byte gTasks
_080B1BB8: .4byte 0x0000abe2
	thumb_func_end sub_80B1A2C

	thumb_func_start c3_08130B10
c3_08130B10: @ 80B1BBC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080B1BEC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	bne _080B1C56
	movs r0, 0
	strh r0, [r2, 0x8]
	movs r3, 0xE
	ldrsh r0, [r2, r3]
	cmp r0, 0
	bne _080B1BF0
	ldrh r0, [r2, 0x10]
	adds r0, 0x1
	b _080B1BF4
	.align 2, 0
_080B1BEC: .4byte gTasks
_080B1BF0:
	ldrh r0, [r2, 0x10]
	subs r0, 0x1
_080B1BF4:
	strh r0, [r2, 0x10]
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	lsls r0, 4
	movs r3, 0x84
	lsls r3, 1
	adds r6, r3, 0
	adds r0, r6
	lsls r0, 16
	lsrs r0, 16
	ldrb r2, [r4, 0x10]
	ldr r3, _080B1C5C
	movs r1, 0x1
	bl BlendPalette
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080B1C26
	cmp r0, 0x10
	bne _080B1C56
_080B1C26:
	ldrh r0, [r4, 0xE]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0xE]
	ldr r0, _080B1C60
	ldrb r0, [r0, 0x13]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x4
	bgt _080B1C56
	movs r3, 0xC
	ldrsh r0, [r4, r3]
	lsls r0, 4
	adds r0, r6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x1F
	bl BlendPalette
	adds r0, r5, 0
	bl DestroyTask
_080B1C56:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1C5C: .4byte 0x00007fff
_080B1C60: .4byte 0x02019204
	thumb_func_end c3_08130B10

	thumb_func_start sub_80B1B14
sub_80B1B14: @ 80B1C64
	push {r4,lr}
	ldr r0, _080B1CA8
	movs r1, 0xA
	bl CreateTask
	ldr r4, _080B1CAC
	ldr r3, _080B1CB0
	adds r2, r3, 0
	adds r2, 0x58
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r1, _080B1CB4
	strh r1, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrb r0, [r3, 0x6]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r3, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1CA8: .4byte sub_80B1B68
_080B1CAC: .4byte gSprites
_080B1CB0: .4byte 0x02019204
_080B1CB4: .4byte 0x0000ffba
	thumb_func_end sub_80B1B14

	thumb_func_start sub_80B1B68
sub_80B1B68: @ 80B1CB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	ldr r4, _080B1D20
	adds r0, r4, 0
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B1D24
	adds r2, r0, r1
	ldr r0, _080B1D28
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	movs r5, 0xD0
	lsls r5, 3
	adds r0, r5, 0
	ldrh r5, [r1, 0x1C]
	adds r0, r5
	strh r0, [r1, 0x1C]
	lsls r0, 16
	asrs r0, 24
	ldrh r5, [r2, 0x24]
	adds r0, r5
	strh r0, [r2, 0x24]
	ldrb r0, [r1, 0x1C]
	strh r0, [r1, 0x1C]
	movs r1, 0x24
	ldrsh r0, [r2, r1]
	cmp r0, 0
	ble _080B1D02
	movs r0, 0
	strh r0, [r2, 0x24]
_080B1D02:
	movs r5, 0x24
	ldrsh r0, [r2, r5]
	cmp r0, 0
	bne _080B1D1A
	ldrb r1, [r4, 0x6]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x6]
	adds r0, r3, 0
	bl DestroyTask
_080B1D1A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D20: .4byte 0x02019204
_080B1D24: .4byte gSprites
_080B1D28: .4byte gTasks
	thumb_func_end sub_80B1B68

	thumb_func_start sub_80B1BDC
sub_80B1BDC: @ 80B1D2C
	push {r4-r6,lr}
	ldr r6, _080B1D54
	ldr r4, _080B1D58
	adds r5, r4, 0
	adds r5, 0x58
	ldrb r0, [r5]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	adds r1, 0x3E
	ldrb r0, [r1]
	lsls r0, 29
	cmp r0, 0
	bge _080B1D5C
	ldrb r1, [r4, 0x6]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	b _080B1D78
	.align 2, 0
_080B1D54: .4byte gSprites
_080B1D58: .4byte 0x02019204
_080B1D5C:
	ldr r0, _080B1D80
	movs r1, 0xA
	bl CreateTask
	ldrb r1, [r5]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0
	strh r1, [r0, 0x24]
	ldrb r0, [r4, 0x6]
	movs r1, 0x40
	orrs r0, r1
_080B1D78:
	strb r0, [r4, 0x6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1D80: .4byte sub_80B1C34
	thumb_func_end sub_80B1BDC

	thumb_func_start sub_80B1C34
sub_80B1C34: @ 80B1D84
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r5, _080B1DFC
	adds r0, r5, 0
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B1E00
	adds r3, r0, r1
	ldr r0, _080B1E04
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	adds r2, r0
	movs r1, 0xD0
	lsls r1, 3
	adds r0, r1, 0
	ldrh r1, [r2, 0x1C]
	adds r0, r1
	strh r0, [r2, 0x1C]
	lsls r0, 16
	asrs r0, 24
	ldrh r1, [r3, 0x24]
	subs r1, r0
	strh r1, [r3, 0x24]
	ldrb r0, [r2, 0x1C]
	strh r0, [r2, 0x1C]
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	movs r1, 0x46
	negs r1, r1
	cmp r0, r1
	bge _080B1DD2
	ldr r0, _080B1E08
	strh r0, [r3, 0x24]
_080B1DD2:
	movs r2, 0x24
	ldrsh r0, [r3, r2]
	cmp r0, r1
	bne _080B1DF6
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r5, 0x6]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x6]
	adds r0, r4, 0
	bl DestroyTask
_080B1DF6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1DFC: .4byte 0x02019204
_080B1E00: .4byte gSprites
_080B1E04: .4byte gTasks
_080B1E08: .4byte 0x0000ffba
	thumb_func_end sub_80B1C34

	thumb_func_start sub_80B1CBC
sub_80B1CBC: @ 80B1E0C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B1E40
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B1E44
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r4, 24
	asrs r4, 24
	strh r4, [r1, 0x8]
	ldr r2, _080B1E48
	ldrb r0, [r2, 0x6]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r2, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B1E40: .4byte sub_80B1CFC
_080B1E44: .4byte gTasks
_080B1E48: .4byte 0x02019204
	thumb_func_end sub_80B1CBC

	thumb_func_start sub_80B1CFC
sub_80B1CFC: @ 80B1E4C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080B1E70
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x1C
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080B1E80
	cmp r0, 0x1
	bgt _080B1E74
	cmp r0, 0
	beq _080B1E7A
	b _080B1EC8
	.align 2, 0
_080B1E70: .4byte gTasks
_080B1E74:
	cmp r0, 0x2
	beq _080B1EA0
	b _080B1EC8
_080B1E7A:
	bl sub_80B1B14
	b _080B1E94
_080B1E80:
	ldr r0, _080B1E9C
	ldrb r1, [r0, 0x6]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	bne _080B1EC8
	movs r0, 0x8
	ldrsb r0, [r4, r0]
	bl nullsub_18
_080B1E94:
	ldrh r0, [r4, 0x1C]
	adds r0, 0x1
	strh r0, [r4, 0x1C]
	b _080B1EC8
	.align 2, 0
_080B1E9C: .4byte 0x02019204
_080B1EA0:
	ldrh r0, [r4, 0x1E]
	adds r1, r0, 0x1
	strh r1, [r4, 0x1E]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _080B1EC8
	movs r0, 0
	strh r0, [r4, 0x1E]
	bl sub_80B1928
	ldr r2, _080B1ED0
	ldrb r1, [r2, 0x6]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x6]
	adds r0, r5, 0
	bl DestroyTask
_080B1EC8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B1ED0: .4byte 0x02019204
	thumb_func_end sub_80B1CFC

	thumb_func_start unref_sub_80B1D84
unref_sub_80B1D84: @ 80B1ED4
	ldr r3, _080B1F00
	ldr r2, _080B1F04
	adds r2, 0x58
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	movs r1, 0
	strh r1, [r0, 0x24]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080B1F00: .4byte gSprites
_080B1F04: .4byte 0x02019204
	thumb_func_end unref_sub_80B1D84

	thumb_func_start unref_sub_80B1DB8
unref_sub_80B1DB8: @ 80B1F08
	ldr r2, _080B1F24
	ldr r0, _080B1F28
	adds r0, 0x58
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_080B1F24: .4byte gSprites
_080B1F28: .4byte 0x02019204
	thumb_func_end unref_sub_80B1DB8

	thumb_func_start sub_80B1DDC
sub_80B1DDC: @ 80B1F2C
	push {lr}
	ldr r0, _080B1F44
	movs r1, 0xF
	bl CreateTask
	ldr r2, _080B1F48
	ldrb r0, [r2, 0x6]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x6]
	pop {r0}
	bx r0
	.align 2, 0
_080B1F44: .4byte sub_80B1DFC
_080B1F48: .4byte 0x02019204
	thumb_func_end sub_80B1DDC

	thumb_func_start sub_80B1DFC
sub_80B1DFC: @ 80B1F4C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080B1F8C
	lsls r4, r5, 2
	adds r0, r4, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	asrs r0, 16
	adds r6, r2, 0
	cmp r0, 0x6
	ble _080B1FDE
	movs r0, 0
	strh r0, [r3, 0x1C]
	movs r1, 0x1E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _080B1FA0
	ldr r1, _080B1F90
	ldr r2, _080B1F94
	ldr r0, _080B1F98
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080B1F9C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	b _080B1FB6
	.align 2, 0
_080B1F8C: .4byte gTasks
_080B1F90: .4byte 0x02016800
_080B1F94: .4byte 0x06002000
_080B1F98: .4byte 0x040000d4
_080B1F9C: .4byte 0x84000400
_080B1FA0:
	ldr r1, _080B1FE4
	ldr r2, _080B1FE8
	ldr r0, _080B1FEC
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _080B1FF0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldrh r0, [r3, 0x20]
	adds r0, 0x1
	strh r0, [r3, 0x20]
_080B1FB6:
	adds r0, r4, 0
	adds r0, r5
	lsls r0, 3
	adds r0, r6
	ldrh r1, [r0, 0x1E]
	movs r2, 0x1
	eors r1, r2
	strh r1, [r0, 0x1E]
	movs r1, 0x20
	ldrsh r0, [r0, r1]
	cmp r0, 0x9
	bne _080B1FDE
	ldr r2, _080B1FF4
	ldrb r1, [r2, 0x6]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x6]
	adds r0, r5, 0
	bl DestroyTask
_080B1FDE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B1FE4: .4byte 0x02015800
_080B1FE8: .4byte 0x06002000
_080B1FEC: .4byte 0x040000d4
_080B1FF0: .4byte 0x84000400
_080B1FF4: .4byte 0x02019204
	thumb_func_end sub_80B1DFC

	thumb_func_start sub_80B1EA8
sub_80B1EA8: @ 80B1FF8
	push {r4-r7,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _080B2034
	movs r1, 0xA
	bl CreateTask
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r4, 24
	cmp r4, 0
	ble _080B2058
	ldr r7, _080B2038
	lsls r0, r5, 24
	adds r4, r0, 0
	cmp r4, 0
	ble _080B2040
	movs r5, 0
	ldr r2, _080B203C
	movs r1, 0x13
	ldrsb r1, [r2, r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	b _080B206E
	.align 2, 0
_080B2034: .4byte sub_80B1F4C
_080B2038: .4byte 0x0000237e
_080B203C: .4byte 0x02019204
_080B2040:
	ldr r2, _080B2054
	movs r1, 0x13
	ldrsb r1, [r2, r1]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	b _080B206E
	.align 2, 0
_080B2054: .4byte 0x02019204
_080B2058:
	movs r7, 0
	lsls r0, r5, 24
	adds r4, r0, 0
	cmp r4, 0
	ble _080B2068
	movs r5, 0
	movs r3, 0xC
	b _080B206C
_080B2068:
	movs r5, 0xC
	movs r3, 0
_080B206C:
	ldr r2, _080B2094
_080B206E:
	ldr r1, _080B2098
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	strh r7, [r0, 0x8]
	strh r5, [r0, 0xA]
	asrs r1, r4, 24
	strh r1, [r0, 0xC]
	strh r3, [r0, 0xE]
	ldrb r1, [r2, 0x7]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x7]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2094: .4byte 0x02019204
_080B2098: .4byte gTasks
	thumb_func_end sub_80B1EA8

	thumb_func_start sub_80B1F4C
sub_80B1F4C: @ 80B209C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _080B20CC
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r2
	ldrh r0, [r3, 0x1C]
	adds r1, r0, 0x1
	strh r1, [r3, 0x1C]
	lsls r0, 16
	cmp r0, 0
	blt _080B2114
	movs r0, 0
	strh r0, [r3, 0x1C]
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0
	ble _080B20D0
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	b _080B20D4
	.align 2, 0
_080B20CC: .4byte gTasks
_080B20D0:
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
_080B20D4:
	strh r0, [r3, 0xA]
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	adds r4, r2
	ldrb r2, [r4, 0xA]
	ldrh r3, [r4, 0x8]
	movs r0, 0x11
	movs r1, 0x1
	bl BlendPalette
	ldrb r2, [r4, 0xA]
	ldrh r3, [r4, 0x8]
	movs r0, 0x1A
	movs r1, 0x1
	bl BlendPalette
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0xE
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080B2114
	adds r0, r5, 0
	bl DestroyTask
	ldr r2, _080B211C
	ldrb r1, [r2, 0x7]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x7]
_080B2114:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B211C: .4byte 0x02019204
	thumb_func_end sub_80B1F4C

	thumb_func_start sub_80B1FD0
sub_80B1FD0: @ 80B2120
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r5, 0
	ldr r0, _080B219C
	ldr r6, _080B21A0
	adds r4, r0, 0
	adds r4, 0xD8
	adds r7, r0, 0
_080B2138:
	ldrb r1, [r7, 0x10]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _080B21B4
	mov r0, r8
	cmp r0, 0
	beq _080B21B4
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80B208C
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r6
	ldrh r1, [r1, 0x4]
	lsls r1, 22
	lsrs r1, 17
	ldr r2, _080B21A4
	adds r1, r2
	ldr r2, _080B21A8
	bl CpuSet
	ldrb r0, [r4, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldr r2, _080B21AC
	ldr r0, _080B21B0
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	strh r0, [r1, 0x22]
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r3, 0x5
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	b _080B21C6
	.align 2, 0
_080B219C: .4byte 0x02019260
_080B21A0: .4byte gSprites
_080B21A4: .4byte 0x060100a0
_080B21A8: .4byte 0x04000010
_080B21AC: .4byte gUnknown_083CA33C
_080B21B0: .4byte gUnknown_02038696
_080B21B4:
	ldrb r1, [r4, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
_080B21C6:
	strb r1, [r0]
	adds r4, 0x4
	adds r7, 0x1C
	adds r5, 0x1
	cmp r5, 0x3
	ble _080B2138
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B1FD0

	thumb_func_start sub_80B208C
sub_80B208C: @ 80B21DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080B2200
	adds r2, r1, r0
	ldrb r1, [r2, 0x10]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _080B2208
	ldrb r0, [r2, 0x19]
	lsls r0, 6
	ldr r1, _080B2204
	adds r0, r1
	b _080B220A
	.align 2, 0
_080B2200: .4byte 0x02019260
_080B2204: .4byte gContestNextTurnNumbersGfx
_080B2208:
	ldr r0, _080B2210
_080B220A:
	pop {r1}
	bx r1
	.align 2, 0
_080B2210: .4byte gContestNextTurnRandomGfx
	thumb_func_end sub_80B208C

	thumb_func_start sub_80B20C4
sub_80B20C4: @ 80B2214
	push {r4-r7,lr}
	movs r6, 0
	ldr r7, _080B2284
_080B221A:
	adds r0, r6, r7
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B2276
	lsls r0, r6, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl sub_80AF59C
	lsls r0, 24
	cmp r0, 0
	bne _080B2276
	ldr r0, _080B2288
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	adds r4, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_80AEFE8
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 6
	ldr r2, _080B228C
	adds r1, r4, r2
	strh r0, [r1]
	ldr r1, _080B2290
	adds r2, r4, r1
	adds r1, r0, 0x1
	strh r1, [r2]
	ldr r1, _080B2294
	adds r2, r4, r1
	adds r1, r0, 0
	adds r1, 0x10
	strh r1, [r2]
	ldr r2, _080B2298
	adds r4, r2
	adds r0, 0x11
	strh r0, [r4]
	movs r0, 0x63
	bl PlaySE
_080B2276:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B221A
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2284: .4byte 0x020192dd
_080B2288: .4byte gUnknown_02038696
_080B228C: .4byte 0x0600c028
_080B2290: .4byte 0x0600c02a
_080B2294: .4byte 0x0600c068
_080B2298: .4byte 0x0600c06a
	thumb_func_end sub_80B20C4

	thumb_func_start sub_80B214C
sub_80B214C: @ 80B229C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080B22C8
	adds r2, r1, r0
	ldrb r1, [r2, 0x15]
	movs r3, 0x1
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	bne _080B22C2
	ldrb r1, [r2, 0xC]
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _080B22CC
_080B22C2:
	movs r0, 0
	b _080B22CE
	.align 2, 0
_080B22C8: .4byte 0x02019260
_080B22CC:
	movs r0, 0x1
_080B22CE:
	pop {r1}
	bx r1
	thumb_func_end sub_80B214C

	thumb_func_start sub_80B2184
sub_80B2184: @ 80B22D4
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _080B23A0
	ldrb r1, [r4]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _080B23A4
	movs r2, 0xF0
	strh r2, [r0]
	ldr r0, _080B23A8
	movs r1, 0xA0
	strh r1, [r0]
	ldr r0, _080B23AC
	strh r2, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _080B23B0
	movs r0, 0
	str r0, [sp]
	ldr r0, _080B23B4
	mov r2, sp
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r2, _080B23B8
	str r2, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080B23BC
	bl LZDecompressVram
	ldrb r1, [r4]
	movs r2, 0xD
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	strb r0, [r4]
	movs r4, 0
	ldr r6, _080B23C0
	adds r7, r2, 0
	movs r5, 0x4
	ldr r3, _080B23C4
_080B233E:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	ldrb r0, [r3, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r2, [r1, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, 0x5]
	adds r3, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B233E
	ldr r3, _080B23C8
	ldrb r2, [r3]
	movs r1, 0x4
	negs r1, r1
	adds r0, r1, 0
	ands r0, r2
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r3]
	ldr r2, _080B23CC
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r4
	strb r1, [r2]
	adds r2, 0x2
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x1]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B23A0: .4byte 0x0400000a
_080B23A4: .4byte gUnknown_030042C0
_080B23A8: .4byte gUnknown_030041B4
_080B23AC: .4byte 0x04000014
_080B23B0: .4byte 0x0600f000
_080B23B4: .4byte 0x040000d4
_080B23B8: .4byte 0x85000400
_080B23BC: .4byte gUnknown_08D17C3C
_080B23C0: .4byte gSprites
_080B23C4: .4byte 0x02019338
_080B23C8: .4byte 0x0400000c
_080B23CC: .4byte 0x04000008
	thumb_func_end sub_80B2184

	thumb_func_start sub_80B2280
sub_80B2280: @ 80B23D0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r2, _080B24A8
	movs r3, 0x80
	lsls r3, 6
	ldr r0, _080B24AC
	mov r12, r0
	ldr r0, _080B24B0
	mov r8, r0
	movs r5, 0
	ldr r1, _080B24B4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _080B24B8
	movs r7, 0x85
	lsls r7, 24
_080B23F4:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _080B23F4
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _080B24BC
	movs r2, 0
	str r2, [sp]
	ldr r0, _080B24B4
	mov r3, sp
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080B24B8
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	strh r2, [r0]
	mov r3, r8
	strh r2, [r3]
	ldr r2, _080B24C0
	ldrb r1, [r2]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2]
	movs r3, 0xD
	negs r3, r3
	adds r0, r3, 0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2]
	movs r4, 0
	ldr r5, _080B24C4
	adds r6, r3, 0
	ldr r3, _080B24C8
_080B246E:
	ldrb r0, [r3]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1, 0x5]
	ldrb r0, [r3, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	ldrb r2, [r1, 0x5]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1, 0x5]
	adds r3, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B246E
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B24A8: .4byte 0x06008000
_080B24AC: .4byte gUnknown_030042C0
_080B24B0: .4byte gUnknown_030041B4
_080B24B4: .4byte 0x040000d4
_080B24B8: .4byte 0x85000400
_080B24BC: .4byte 0x0600f000
_080B24C0: .4byte 0x0400000a
_080B24C4: .4byte gSprites
_080B24C8: .4byte 0x02019338
	thumb_func_end sub_80B2280

	thumb_func_start sub_80B237C
sub_80B237C: @ 80B24CC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080B24FC
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080B2500
	movs r0, 0xA0
	strh r0, [r1]
	movs r0, 0x62
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r1, _080B2504
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B2508
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B24FC: .4byte gUnknown_030042C0
_080B2500: .4byte gUnknown_030041B4
_080B2504: .4byte gTasks
_080B2508: .4byte sub_80B23BC
	thumb_func_end sub_80B237C

	thumb_func_start sub_80B23BC
sub_80B23BC: @ 80B250C
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _080B2544
	ldrh r0, [r1]
	subs r0, 0x7
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	bge _080B2524
	movs r0, 0
	strh r0, [r1]
_080B2524:
	ldrh r2, [r1]
	cmp r2, 0
	bne _080B253E
	ldr r0, _080B2548
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	strh r2, [r1, 0x8]
	strh r2, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldr r0, _080B254C
	str r0, [r1]
_080B253E:
	pop {r0}
	bx r0
	.align 2, 0
_080B2544: .4byte gUnknown_030041B4
_080B2548: .4byte gTasks
_080B254C: .4byte sub_80B2400
	thumb_func_end sub_80B23BC

	thumb_func_start sub_80B2400
sub_80B2400: @ 80B2550
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080B2574
	lsls r3, r4, 2
	adds r0, r3, r4
	lsls r0, 3
	adds r5, r0, r1
	movs r0, 0x8
	ldrsh r1, [r5, r0]
	cmp r1, 0x1
	beq _080B25CC
	cmp r1, 0x1
	bgt _080B2578
	cmp r1, 0
	beq _080B2582
	b _080B264C
	.align 2, 0
_080B2574: .4byte gTasks
_080B2578:
	cmp r1, 0x2
	beq _080B2626
	cmp r1, 0x3
	beq _080B263C
	b _080B264C
_080B2582:
	movs r2, 0
	adds r6, r3, 0
	ldr r5, _080B25C0
	ldr r3, _080B25C4
_080B258A:
	adds r0, r2, r5
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _080B258A
	bl sub_80AFA5C
	bl sub_80B0588
	bl sub_80AEF50
	bl sub_80B1118
	movs r0, 0x1
	bl sub_80B1FD0
	bl sub_80AFFA0
	ldr r0, _080B25C8
	adds r1, r6, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0x8]
	b _080B264C
	.align 2, 0
_080B25C0: .4byte 0x02019218
_080B25C4: .4byte gUnknown_02038696
_080B25C8: .4byte gTasks
_080B25CC:
	ldr r0, _080B2610
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, 0
	beq _080B2620
	ldr r2, _080B2614
	ldrb r0, [r2, 0x7]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2, 0x7]
	bl sub_80AE074
	lsls r0, 24
	cmp r0, 0
	beq _080B25EE
	bl sub_80AF438
_080B25EE:
	ldr r4, _080B2618
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B261C
	adds r1, r4, 0
	bl SetTaskFuncWithFollowupFunc
	bl sub_80AF860
	movs r0, 0x2
	strh r0, [r5, 0x8]
	b _080B264C
	.align 2, 0
_080B2610: .4byte gUnknown_0203869A
_080B2614: .4byte 0x02019204
_080B2618: .4byte sub_80C8C80
_080B261C: .4byte sub_80AD8DC
_080B2620:
	bl sub_80AF438
	b _080B2632
_080B2626:
	ldr r0, _080B2638
	ldrb r1, [r0, 0x7]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _080B264C
_080B2632:
	movs r0, 0x3
	strh r0, [r5, 0x8]
	b _080B264C
	.align 2, 0
_080B2638: .4byte 0x02019204
_080B263C:
	bl sub_80AF120
	bl sub_80AEB30
	movs r0, 0
	strh r0, [r5, 0x8]
	ldr r0, _080B2654
	str r0, [r5]
_080B264C:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2654: .4byte sub_80B253C
	thumb_func_end sub_80B2400

	thumb_func_start sub_80B2508
sub_80B2508: @ 80B2658
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _080B2680
	ldrh r0, [r1]
	adds r0, 0x7
	strh r0, [r1]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xA0
	ble _080B267C
	ldr r0, _080B2684
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldr r0, _080B2688
	str r0, [r1]
_080B267C:
	pop {r0}
	bx r0
	.align 2, 0
_080B2680: .4byte gUnknown_030041B4
_080B2684: .4byte gTasks
_080B2688: .4byte sub_80ADCDC
	thumb_func_end sub_80B2508

	thumb_func_start sub_80B253C
sub_80B253C: @ 80B268C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B26AC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0x9
	bgt _080B26B0
	adds r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _080B26EC
	.align 2, 0
_080B26AC: .4byte gTasks
_080B26B0:
	ldrh r3, [r1, 0xA]
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bne _080B26CE
	ldrh r2, [r1, 0x8]
	movs r4, 0x8
	ldrsh r0, [r1, r4]
	cmp r0, 0x10
	bne _080B26CA
	adds r0, r3, 0x1
	strh r0, [r1, 0xA]
	b _080B26EC
_080B26CA:
	adds r0, r2, 0x1
	b _080B26EA
_080B26CE:
	ldrh r0, [r1, 0x8]
	movs r3, 0x8
	ldrsh r2, [r1, r3]
	cmp r2, 0
	bne _080B26E8
	strh r2, [r1, 0xA]
	strh r2, [r1, 0xC]
	ldr r0, _080B26E4
	str r0, [r1]
	b _080B26EC
	.align 2, 0
_080B26E4: .4byte sub_80B25A4
_080B26E8:
	subs r0, 0x1
_080B26EA:
	strh r0, [r1, 0x8]
_080B26EC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B253C

	thumb_func_start sub_80B25A4
sub_80B25A4: @ 80B26F4
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2714
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xC]
	movs r2, 0xC
	ldrsh r0, [r4, r2]
	cmp r0, 0x9
	bgt _080B2718
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	b _080B2728
	.align 2, 0
_080B2714: .4byte gTasks
_080B2718:
	movs r0, 0
	strh r0, [r4, 0xC]
	movs r0, 0x61
	movs r1, 0
	bl PlaySE12WithPanning
	ldr r0, _080B2730
	str r0, [r4]
_080B2728:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2730: .4byte sub_80B2508
	thumb_func_end sub_80B25A4

	thumb_func_start sub_80B25E4
sub_80B25E4: @ 80B2734
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	movs r6, 0
	ldr r5, _080B2804
_080B2746:
	bl AllocOamMatrix
	lsls r1, r6, 2
	ldr r2, _080B2808
	mov r8, r2
	adds r4, r1, r2
	ldrb r1, [r4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1F
	ands r0, r1
	lsls r0, 1
	ldrb r1, [r3, 0x3]
	movs r7, 0x3F
	negs r7, r7
	adds r2, r7, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, 0x3]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	ldrb r2, [r0, 0x1]
	movs r3, 0x4
	negs r3, r3
	adds r1, r3, 0
	ands r2, r1
	movs r1, 0x1
	orrs r2, r1
	strb r2, [r0, 0x1]
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r9
	bl StartSpriteAffineAnim
	mov r7, r9
	cmp r7, 0x2
	bne _080B27CA
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	bl AnimateSprite
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r3, 0x5
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	strb r1, [r0]
_080B27CA:
	adds r6, 0x1
	cmp r6, 0x3
	ble _080B2746
	ldr r0, _080B280C
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B2810
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	mov r7, r9
	strh r7, [r1, 0x8]
	ldr r2, _080B2814
	add r2, r8
	ldrb r0, [r2, 0x7]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2, 0x7]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2804: .4byte gSprites
_080B2808: .4byte 0x02019338
_080B280C: .4byte sub_80B26C8
_080B2810: .4byte gTasks
_080B2814: .4byte 0xfffffecc
	thumb_func_end sub_80B25E4

	thumb_func_start sub_80B26C8
sub_80B26C8: @ 80B2818
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r2, _080B28A0
	ldr r4, _080B28A4
	ldrb r1, [r4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080B289A
	ldr r0, _080B28A8
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	cmp r0, 0x1
	bne _080B2868
	adds r5, r2, 0
	movs r3, 0x4
	adds r2, r4, 0
	movs r4, 0x3
_080B284E:
	ldrb r0, [r2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	adds r1, 0x3E
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, 0x4
	subs r4, 0x1
	cmp r4, 0
	bge _080B284E
_080B2868:
	movs r4, 0
_080B286A:
	lsls r0, r4, 2
	ldr r5, _080B28A4
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B28A0
	adds r0, r1
	bl FreeSpriteOamMatrix
	adds r4, 0x1
	cmp r4, 0x3
	ble _080B286A
	ldr r0, _080B28AC
	adds r2, r5, r0
	ldrb r1, [r2, 0x7]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0x7]
	adds r0, r6, 0
	bl DestroyTask
_080B289A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B28A0: .4byte gSprites
_080B28A4: .4byte 0x02019338
_080B28A8: .4byte gTasks
_080B28AC: .4byte 0xfffffecc
	thumb_func_end sub_80B26C8

	thumb_func_start sub_80B2760
sub_80B2760: @ 80B28B0
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0xB1
	lsls r0, 1
	cmp r1, r0
	bls _080B28C0
	movs r1, 0x1
_080B28C0:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80B2760

	thumb_func_start sub_80B2778
sub_80B2778: @ 80B28C8
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080B28DC
	cmp r1, r0
	bls _080B28D6
	movs r1, 0
_080B28D6:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080B28DC: .4byte 0x0000019b
	thumb_func_end sub_80B2778

	thumb_func_start sub_80B2790
sub_80B2790: @ 80B28E0
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	ldr r4, _080B2940
	adds r0, r4
	ldrh r0, [r0, 0x6]
	bl sub_80B2760
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r1, _080B2944
	lsls r0, r6, 6
	adds r0, r1
	ldrh r0, [r0]
	bl sub_80B2778
	lsls r0, 16
	lsrs r7, r0, 16
	adds r4, 0xE8
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x14
	bl memset
	bl sub_8075624
	ldr r1, _080B2948
	movs r2, 0
	adds r0, r1, 0x3
_080B2920:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _080B2920
	cmp r5, 0x90
	beq _080B2998
	cmp r5, 0x90
	bgt _080B2956
	cmp r5, 0x4C
	beq _080B29E8
	cmp r5, 0x4C
	bgt _080B294C
	cmp r5, 0xD
	beq _080B29E8
	b _080B2A0E
	.align 2, 0
_080B2940: .4byte 0x02019260
_080B2944: .4byte gContestMons
_080B2948: .4byte gUnknown_02024E84
_080B294C:
	cmp r5, 0x82
	beq _080B29E8
	cmp r5, 0x8F
	beq _080B29E8
	b _080B2A0E
_080B2956:
	cmp r5, 0xD8
	beq _080B29D0
	cmp r5, 0xD8
	bgt _080B2964
	cmp r5, 0xAE
	beq _080B2972
	b _080B2A0E
_080B2964:
	cmp r5, 0xDA
	beq _080B29DC
	movs r0, 0x88
	lsls r0, 1
	cmp r5, r0
	beq _080B2998
	b _080B2A0E
_080B2972:
	ldr r0, _080B2990
	lsls r1, r7, 3
	subs r1, r7
	lsls r1, 2
	adds r1, r0
	ldrb r0, [r1, 0x6]
	cmp r0, 0x7
	beq _080B2988
	ldrb r0, [r1, 0x7]
	cmp r0, 0x7
	bne _080B2A08
_080B2988:
	ldr r1, _080B2994
	movs r0, 0
	b _080B2A0C
	.align 2, 0
_080B2990: .4byte gBaseStats
_080B2994: .4byte gUnknown_0202F7C4
_080B2998:
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	ldr r4, _080B29C8
	adds r0, r4
	ldrb r5, [r0, 0x1B]
	ldr r6, _080B29CC
	lsls r5, 6
	adds r0, r5, r6
	ldrh r0, [r0]
	bl sub_80B2778
	adds r4, 0xE8
	strh r0, [r4, 0x2]
	adds r6, 0x38
	adds r5, r6
	ldr r0, [r5]
	str r0, [r4, 0x10]
	ldrb r0, [r4, 0x4]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x4]
	b _080B2A0E
	.align 2, 0
_080B29C8: .4byte 0x02019260
_080B29CC: .4byte gContestMons
_080B29D0:
	ldr r1, _080B29D8
	movs r0, 0xFF
	b _080B2A0C
	.align 2, 0
_080B29D8: .4byte gUnknown_0202F7BE
_080B29DC:
	ldr r1, _080B29E4
	movs r0, 0
	b _080B2A0C
	.align 2, 0
_080B29E4: .4byte gUnknown_0202F7BE
_080B29E8:
	ldr r0, _080B2A00
	adds r2, r0, 0
	adds r2, 0x5A
	ldrb r1, [r2]
	cmp r1, 0
	bne _080B2A08
	movs r0, 0x2
	strb r0, [r2]
	ldr r0, _080B2A04
	strb r1, [r0]
	b _080B2A0E
	.align 2, 0
_080B2A00: .4byte 0x02019204
_080B2A04: .4byte gUnknown_0202F7C4
_080B2A08:
	ldr r1, _080B2A18
	movs r0, 0x1
_080B2A0C:
	strb r0, [r1]
_080B2A0E:
	bl sub_80B2968
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A18: .4byte gUnknown_0202F7C4
	thumb_func_end sub_80B2790

	thumb_func_start sub_80B28CC
sub_80B28CC: @ 80B2A1C
	push {r4,lr}
	ldr r4, _080B2A3C
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x14
	bl memset
	subs r4, 0xEA
	ldrb r0, [r4]
	cmp r0, 0
	beq _080B2A36
	subs r0, 0x1
	strb r0, [r4]
_080B2A36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A3C: .4byte 0x02019348
	thumb_func_end sub_80B28CC

	thumb_func_start sub_80B28F0
sub_80B28F0: @ 80B2A40
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r6, _080B2A74
	strb r4, [r6, 0x5]
	ldr r5, _080B2A78
	lsls r4, 6
	adds r0, r4, r5
	ldrh r0, [r0]
	bl sub_80B2778
	strh r0, [r6]
	adds r0, r5, 0
	adds r0, 0x38
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r6, 0x8]
	adds r5, 0x3C
	adds r4, r5
	ldr r0, [r4]
	str r0, [r6, 0xC]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B2A74: .4byte 0x02019348
_080B2A78: .4byte gContestMons
	thumb_func_end sub_80B28F0

	thumb_func_start sub_80B292C
sub_80B292C: @ 80B2A7C
	push {lr}
	ldr r0, _080B2AA8
	bl object_new_hidden_with_callback
	ldr r1, _080B2AAC
	strb r0, [r1, 0x3]
	ldr r0, _080B2AB0
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080B2AB4
	adds r0, r1
	bl InitSpriteAffineAnim
	bl sub_80B2968
	pop {r0}
	bx r0
	.align 2, 0
_080B2AA8: .4byte SpriteCallbackDummy
_080B2AAC: .4byte gUnknown_02024BE0
_080B2AB0: .4byte gUnknown_02024C08
_080B2AB4: .4byte gSprites
	thumb_func_end sub_80B292C

	thumb_func_start sub_80B2968
sub_80B2968: @ 80B2AB8
	push {r4,lr}
	ldr r0, _080B2AFC
	ldrb r0, [r0, 0x3]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _080B2B00
	adds r4, r0
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	movs r0, 0x3
	movs r1, 0
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x20]
	movs r0, 0x3
	movs r1, 0x1
	bl sub_8077ABC
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x22]
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2AFC: .4byte gUnknown_02024BE0
_080B2B00: .4byte gSprites
	thumb_func_end sub_80B2968

	thumb_func_start sub_80B29B4
sub_80B29B4: @ 80B2B04
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080B2B24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x6]
	cmp r0, 0x20
	bhi _080B2BBC
	lsls r0, 2
	ldr r1, _080B2B28
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2B24: .4byte gBattleMoves
_080B2B28: .4byte _080B2B2C
	.align 2, 0
_080B2B2C:
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BB0
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BB0
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
	.4byte _080B2BBC
_080B2BB0:
	ldr r1, _080B2BB8
	movs r0, 0x2
	b _080B2BC0
	.align 2, 0
_080B2BB8: .4byte gUnknown_02024C08
_080B2BBC:
	ldr r1, _080B2BC8
	movs r0, 0x3
_080B2BC0:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B2BC8: .4byte gUnknown_02024C08
	thumb_func_end sub_80B29B4

	thumb_func_start sub_80B2A7C
sub_80B2A7C: @ 80B2BCC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 24
	lsrs r7, r0, 24
	movs r6, 0
	ldr r1, _080B2C18
	ldrb r0, [r1]
	cmp r0, 0
	beq _080B2C06
_080B2BF8:
	adds r6, 0x1
	cmp r6, 0x2
	bgt _080B2C06
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _080B2BF8
_080B2C06:
	mov r0, r9
	cmp r0, 0xFF
	bne _080B2C20
	ldr r0, _080B2C1C
	ldrb r0, [r0]
	cmp r6, r0
	beq _080B2C20
	movs r0, 0
	b _080B2D88
	.align 2, 0
_080B2C18: .4byte gUnknown_02038690
_080B2C1C: .4byte gContestPlayerMonIndex
_080B2C20:
	ldr r0, _080B2C34
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080B2C66
	lsls r0, 2
	ldr r1, _080B2C38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2C34: .4byte gScriptContestCategory
_080B2C38: .4byte _080B2C3C
	.align 2, 0
_080B2C3C:
	.4byte _080B2C66
	.4byte _080B2C50
	.4byte _080B2C54
	.4byte _080B2C58
	.4byte _080B2C5E
_080B2C50:
	adds r0, r7, 0x3
	b _080B2C62
_080B2C54:
	adds r0, r7, 0x6
	b _080B2C62
_080B2C58:
	adds r0, r7, 0
	adds r0, 0x9
	b _080B2C62
_080B2C5E:
	adds r0, r7, 0
	adds r0, 0xC
_080B2C62:
	lsls r0, 24
	lsrs r7, r0, 24
_080B2C66:
	mov r1, r9
	cmp r1, 0xFE
	beq _080B2D14
	mov r0, r9
	movs r1, 0x1
	bl sub_80B2C4C
	adds r4, r0, 0
	lsls r4, 24
	ldr r2, _080B2CE8
	lsrs r4, 19
	ldr r0, _080B2CEC
	adds r1, r2, r0
	adds r1, r4, r1
	ldr r5, _080B2CF0
	lsls r6, 6
	adds r0, r5, 0
	adds r0, 0x38
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r4, r2
	mov r8, r1
	adds r0, r6, r5
	ldrh r1, [r0]
	ldr r0, _080B2CF4
	add r0, r8
	strh r1, [r0]
	movs r0, 0xB8
	lsls r0, 6
	adds r1, r2, r0
	adds r1, r4, r1
	adds r0, r5, 0
	adds r0, 0x3C
	adds r0, r6, r0
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _080B2CF8
	adds r0, r2, r1
	adds r0, r4, r0
	adds r1, r5, 0x2
	adds r1, r6, r1
	str r2, [sp]
	bl StringCopy
	ldr r2, [sp]
	ldr r0, _080B2CFC
	adds r2, r0
	adds r4, r2
	adds r5, 0xD
	adds r6, r5
	adds r0, r4, 0
	adds r1, r6, 0
	bl StringCopy
	mov r1, r9
	cmp r1, 0xFF
	beq _080B2D08
	ldr r0, _080B2D00
	ldrh r1, [r0]
	ldr r0, _080B2D04
	add r0, r8
	strb r1, [r0]
	b _080B2D86
	.align 2, 0
_080B2CE8: .4byte gSaveBlock1
_080B2CEC: .4byte 0x00002dfc
_080B2CF0: .4byte gContestMons
_080B2CF4: .4byte 0x00002e04
_080B2CF8: .4byte 0x00002e07
_080B2CFC: .4byte 0x00002e12
_080B2D00: .4byte gScriptContestCategory
_080B2D04: .4byte 0x00002e06
_080B2D08:
	ldr r0, _080B2D10
	add r0, r8
	strb r7, [r0]
	b _080B2D86
	.align 2, 0
_080B2D10: .4byte 0x00002e06
_080B2D14:
	ldr r5, _080B2D64
	ldr r2, _080B2D68
	lsls r4, r6, 6
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r5]
	adds r0, r2, 0
	adds r0, 0x3C
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r5, 0x4]
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	adds r0, r5, 0
	adds r0, 0xB
	adds r1, r2, 0x2
	adds r1, r4, r1
	str r2, [sp]
	bl StringCopy
	ldr r0, _080B2D6C
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	ldr r2, [sp]
	cmp r0, 0
	beq _080B2D74
	adds r0, r5, 0
	adds r0, 0x16
	lsls r1, r6, 3
	subs r1, r6
	lsls r1, 2
	ldr r2, _080B2D70
	adds r1, r2
	bl StringCopy
	b _080B2D82
	.align 2, 0
_080B2D64: .4byte 0x02015de0
_080B2D68: .4byte gContestMons
_080B2D6C: .4byte gUnknown_0203869A
_080B2D70: .4byte 0x03002988
_080B2D74:
	adds r0, r5, 0
	adds r0, 0x16
	adds r1, r2, 0
	adds r1, 0xD
	adds r1, r4, r1
	bl StringCopy
_080B2D82:
	ldr r0, _080B2D98
	strb r7, [r0, 0xA]
_080B2D86:
	movs r0, 0x1
_080B2D88:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B2D98: .4byte 0x02015de0
	thumb_func_end sub_80B2A7C

	thumb_func_start sub_80B2C4C
sub_80B2C4C: @ 80B2D9C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r1, 24
	lsrs r1, 24
	cmp r0, 0x2
	beq _080B2DBE
	cmp r0, 0x2
	ble _080B2DB6
	cmp r0, 0x3
	beq _080B2DF0
	b _080B2E24
_080B2DB6:
	cmp r2, 0
	blt _080B2E24
	adds r0, r2, 0
	b _080B2E66
_080B2DBE:
	cmp r1, 0
	beq _080B2DE8
	movs r2, 0x4
	ldr r0, _080B2DEC
	adds r4, r0, 0
	adds r4, 0x60
	adds r3, r0, 0
	adds r3, 0x80
_080B2DCE:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	subs r4, 0x20
	subs r3, 0x20
	subs r2, 0x1
	cmp r2, 0x2
	bgt _080B2DCE
_080B2DE8:
	movs r0, 0x2
	b _080B2E66
	.align 2, 0
_080B2DEC: .4byte 0x02028530
_080B2DF0:
	cmp r1, 0
	beq _080B2E1A
	movs r2, 0x7
	ldr r0, _080B2E20
	adds r4, r0, 0
	adds r4, 0xC0
	adds r3, r0, 0
	adds r3, 0xE0
_080B2E00:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r7}
	stm r1!, {r5,r7}
	subs r4, 0x20
	subs r3, 0x20
	subs r2, 0x1
	cmp r2, 0x5
	bgt _080B2E00
_080B2E1A:
	movs r0, 0x5
	b _080B2E66
	.align 2, 0
_080B2E20: .4byte 0x02028530
_080B2E24:
	ldr r0, _080B2E38
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080B2E64
	lsls r0, 2
	ldr r1, _080B2E3C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B2E38: .4byte gScriptContestCategory
_080B2E3C: .4byte _080B2E40
	.align 2, 0
_080B2E40:
	.4byte _080B2E54
	.4byte _080B2E58
	.4byte _080B2E5C
	.4byte _080B2E60
	.4byte _080B2E64
_080B2E54:
	movs r0, 0x8
	b _080B2E66
_080B2E58:
	movs r0, 0x9
	b _080B2E66
_080B2E5C:
	movs r0, 0xA
	b _080B2E66
_080B2E60:
	movs r0, 0xB
	b _080B2E66
_080B2E64:
	movs r0, 0xC
_080B2E66:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80B2C4C

	thumb_func_start sub_80B2D1C
sub_80B2D1C: @ 80B2E6C
	push {r4-r7,lr}
	ldr r0, _080B2E98
	ldr r4, _080B2E9C
	ldr r1, _080B2EA0
	adds r3, r0, r1
	movs r2, 0x7
_080B2E78:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	adds r4, 0x20
	adds r3, 0x20
	subs r2, 0x1
	cmp r2, 0
	bge _080B2E78
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2E98: .4byte gSaveBlock1
_080B2E9C: .4byte gUnknown_083CC5D0
_080B2EA0: .4byte 0x00002dfc
	thumb_func_end sub_80B2D1C

	.align 2, 0 @ Don't pad with nop.
