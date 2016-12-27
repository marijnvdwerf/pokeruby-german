	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_804E290
sub_804E290: @ 804E5FC
	push {lr}
	ldr r0, _0804E61C
	ldr r1, _0804E620
	ldr r2, _0804E624
	ldr r2, [r2]
	adds r2, 0x56
	movs r3, 0
	ldrsh r2, [r2, r3]
	subs r2, 0x80
	lsls r2, 17
	asrs r2, 16
	bl m4aMPlayPitchControl
	pop {r0}
	bx r0
	.align 2, 0
_0804E61C: .4byte gMPlay_SE2
_0804E620: .4byte 0x0000ffff
_0804E624: .4byte gUnknown_03004854
	thumb_func_end sub_804E290

	thumb_func_start sub_804E2BC
sub_804E2BC: @ 804E628
	push {lr}
	bl sub_80514A4
	bl sub_80514F0
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804E2BC

	thumb_func_start sub_804E2D8
sub_804E2D8: @ 804E644
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_804E2D8

	thumb_func_start sub_804E2EC
sub_804E2EC: @ 804E658
	push {r4-r7,lr}
	ldr r1, _0804E674
	ldr r0, [r1]
	ldrb r0, [r0, 0x1]
	mov r12, r1
	cmp r0, 0x9
	bls _0804E668
	b _0804E860
_0804E668:
	lsls r0, 2
	ldr r1, _0804E678
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E674: .4byte gUnknown_03004854
_0804E678: .4byte _0804E67C
	.align 2, 0
_0804E67C:
	.4byte _0804E6A4
	.4byte _0804E6B8
	.4byte _0804E6EC
	.4byte _0804E730
	.4byte _0804E744
	.4byte _0804E758
	.4byte _0804E77C
	.4byte _0804E7A0
	.4byte _0804E7F8
	.4byte _0804E828
_0804E6A4:
	ldr r0, _0804E6B0
	ldr r1, _0804E6B4
	bl sub_800D238
	b _0804E80A
	.align 2, 0
_0804E6B0: .4byte gUnknown_08E6C100
_0804E6B4: .4byte 0x02010000
_0804E6B8:
	ldr r1, _0804E6D8
	ldr r2, _0804E6DC
	ldr r0, _0804E6E0
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E6E4
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _0804E6E8
	movs r2, 0x80
	lsls r2, 1
	movs r1, 0
	bl LoadPalette
	b _0804E80A
	.align 2, 0
_0804E6D8: .4byte gUnknown_08215C2C
_0804E6DC: .4byte 0x06004000
_0804E6E0: .4byte 0x040000d4
_0804E6E4: .4byte 0x80000200
_0804E6E8: .4byte gUnknown_08215C0C
_0804E6EC:
	ldr r3, _0804E724
	movs r4, 0xC0
	lsls r4, 19
	movs r5, 0x80
	lsls r5, 6
	ldr r1, _0804E728
	ldr r6, _0804E72C
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_0804E702:
	str r3, [r1]
	str r4, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r2
	adds r4, r2
	subs r5, r2
	cmp r5, r2
	bhi _0804E702
	str r3, [r1]
	str r4, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, r12
	b _0804E80C
	.align 2, 0
_0804E724: .4byte 0x02010000
_0804E728: .4byte 0x040000d4
_0804E72C: .4byte 0x80000800
_0804E730:
	ldr r0, _0804E73C
	ldr r1, _0804E740
	bl sub_800D238
	b _0804E80A
	.align 2, 0
_0804E73C: .4byte gUnknown_08E6C920
_0804E740: .4byte 0x02010000
_0804E744:
	ldr r0, _0804E750
	ldr r1, _0804E754
	bl sub_800D238
	b _0804E80A
	.align 2, 0
_0804E750: .4byte gUnknown_08E6D354
_0804E754: .4byte 0x02013000
_0804E758:
	ldr r1, _0804E76C
	ldr r2, _0804E770
	ldr r0, _0804E774
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E778
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	b _0804E80C
	.align 2, 0
_0804E76C: .4byte 0x02010000
_0804E770: .4byte 0x0600e000
_0804E774: .4byte 0x040000d4
_0804E778: .4byte 0x80000800
_0804E77C:
	ldr r1, _0804E790
	ldr r2, _0804E794
	ldr r0, _0804E798
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0804E79C
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	mov r0, r12
	b _0804E80C
	.align 2, 0
_0804E790: .4byte 0x02011000
_0804E794: .4byte 0x0600f000
_0804E798: .4byte 0x040000d4
_0804E79C: .4byte 0x80000800
_0804E7A0:
	ldr r3, _0804E7E0
	movs r2, 0
	adds r6, r3, 0
	ldr r7, _0804E7E4
	movs r0, 0x80
	lsls r0, 1
	adds r5, r0, 0
	ldr r4, _0804E7E8
_0804E7B0:
	lsls r0, r2, 1
	adds r0, r3
	ldrh r1, [r0]
	orrs r1, r5
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r4
	bls _0804E7B0
	ldr r1, _0804E7EC
	ldr r0, _0804E7F0
	str r6, [r0]
	str r1, [r0, 0x4]
	ldr r1, _0804E7F4
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	adds r0, r7, 0
	movs r1, 0x80
	movs r2, 0x20
	bl LoadPalette
	b _0804E80A
	.align 2, 0
_0804E7E0: .4byte 0x02013000
_0804E7E4: .4byte gUnknown_0821602C
_0804E7E8: .4byte 0x0000027f
_0804E7EC: .4byte 0x06006000
_0804E7F0: .4byte 0x040000d4
_0804E7F4: .4byte 0x80000280
_0804E7F8:
	ldr r0, _0804E818
	bl LoadSpriteSheet
	ldr r0, _0804E81C
	bl LoadSpriteSheet
	ldr r0, _0804E820
	bl LoadSpriteSheet
_0804E80A:
	ldr r0, _0804E824
_0804E80C:
	ldr r1, [r0]
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	strb r0, [r1, 0x1]
	b _0804E860
	.align 2, 0
_0804E818: .4byte gUnknown_082163DC
_0804E81C: .4byte gUnknown_082164F4
_0804E820: .4byte gUnknown_08216454
_0804E824: .4byte gUnknown_03004854
_0804E828:
	ldr r0, _0804E84C
	bl LoadSpriteSheet
	ldr r0, _0804E850
	bl LoadSpriteSheet
	ldr r0, _0804E854
	bl LoadSpritePalette
	ldr r0, _0804E858
	bl LoadSpritePalette
	ldr r0, _0804E85C
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1]
	movs r0, 0x1
	b _0804E862
	.align 2, 0
_0804E84C: .4byte gUnknown_08216540
_0804E850: .4byte gUnknown_08216574
_0804E854: .4byte gUnknown_082163EC
_0804E858: .4byte gUnknown_082163E4
_0804E85C: .4byte gUnknown_03004854
_0804E860:
	movs r0, 0
_0804E862:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_804E2EC

	thumb_func_start sub_804E4FC
sub_804E4FC: @ 804E868
	movs r1, 0x80
	lsls r1, 19
	ldr r2, _0804E898
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0xC
	movs r2, 0x91
	lsls r2, 7
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0804E89C
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804E8A0
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0804E898: .4byte 0x00001341
_0804E89C: .4byte 0x00000c0d
_0804E8A0: .4byte 0x04000010
	thumb_func_end sub_804E4FC

	thumb_func_start sub_804E538
sub_804E538: @ 804E8A4
	push {lr}
	ldr r1, _0804E8C8
	ldr r0, _0804E8CC
	str r0, [r1]
	adds r2, r0, 0
	adds r2, 0x6F
	movs r1, 0
	strb r1, [r0]
	strb r1, [r2]
	ldr r0, _0804E8D0
	ldrb r0, [r0]
	bl sub_804E884
	ldr r0, _0804E8D4
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0804E8C8: .4byte gUnknown_03004854
_0804E8CC: .4byte 0x02018000
_0804E8D0: .4byte gSpecialVar_0x8004
_0804E8D4: .4byte sub_804E56C
	thumb_func_end sub_804E538

	thumb_func_start sub_804E56C
sub_804E56C: @ 804E8D8
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r0, _0804E8F4
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0x6
	bls _0804E8E8
	b _0804EA86
_0804E8E8:
	lsls r0, 2
	ldr r1, _0804E8F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E8F4: .4byte gUnknown_03004854
_0804E8F8: .4byte _0804E8FC
	.align 2, 0
_0804E8FC:
	.4byte _0804E918
	.4byte _0804E980
	.4byte _0804E9E8
	.4byte _0804E9FE
	.4byte _0804EA14
	.4byte _0804EA40
	.4byte _0804EA6C
_0804E918:
	movs r0, 0x80
	lsls r0, 19
	movs r5, 0
	strh r5, [r0]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	movs r0, 0
	bl SetVBlankCallback
	ldr r4, _0804E978
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r3, _0804E97C
	ldr r2, [r3]
	ldrb r0, [r2]
	adds r0, 0x1
	movs r1, 0
	strb r0, [r2]
	ldr r2, [r3]
	movs r3, 0xA0
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	subs r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0xA1
	lsls r0, 1
	adds r3, r2, r0
	movs r0, 0x50
	strh r0, [r3]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	strb r5, [r2, 0x1]
	bl sub_8051474
	b _0804EA86
	.align 2, 0
_0804E978: .4byte gWindowConfig_81E6F68
_0804E97C: .4byte gUnknown_03004854
_0804E980:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804E98C
	b _0804EA86
_0804E98C:
	movs r4, 0
	ldr r5, _0804E9D4
	ldr r6, _0804E9D8
_0804E992:
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	ldr r0, _0804E9DC
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x5C
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x5C
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804E9E0
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804E992
	ldr r0, _0804E9E4
	bl SetVBlankCallback
	b _0804EA2A
	.align 2, 0
_0804E9D4: .4byte gUnknown_082162E4
_0804E9D8: .4byte gUnknown_03004854
_0804E9DC: .4byte gSpriteTemplate_82163F4
_0804E9E0: .4byte gSprites
_0804E9E4: .4byte sub_804E2BC
_0804E9E8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sub_8051474
	b _0804EA2A
_0804E9FE:
	bl sub_804E4FC
	ldr r0, _0804EA10
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804EA86
	b _0804EA2A
	.align 2, 0
_0804EA10: .4byte gPaletteFade
_0804EA14:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804EA38
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
_0804EA2A:
	ldr r0, _0804EA3C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804EA86
	.align 2, 0
_0804EA38: .4byte gOtherText_BlenderChooseBerry
_0804EA3C: .4byte gUnknown_03004854
_0804EA40:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0804EA86
	ldr r0, _0804EA68
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	b _0804EA86
	.align 2, 0
_0804EA68: .4byte gUnknown_03004854
_0804EA6C:
	ldr r0, _0804EA9C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0804EA86
	bl sub_80A6978
	ldr r0, _0804EAA0
	ldr r0, [r0]
	strb r4, [r0]
_0804EA86:
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EA9C: .4byte gPaletteFade
_0804EAA0: .4byte gUnknown_03004854
	thumb_func_end sub_804E56C

	thumb_func_start sub_804E738
sub_804E738: @ 804EAA4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x30]
	adds r0, r1
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x32]
	ldrh r2, [r4, 0x36]
	subs r1, r2
	ldrh r0, [r4, 0x3C]
	adds r1, r0
	strh r1, [r4, 0x32]
	ldrh r3, [r4, 0x2E]
	adds r0, r3
	strh r0, [r4, 0x2E]
	subs r2, 0x1
	strh r2, [r4, 0x36]
	lsls r0, 16
	lsls r1, 16
	cmp r0, r1
	bge _0804EAF2
	ldrh r0, [r4, 0x34]
	subs r0, 0x1
	strh r0, [r4, 0x36]
	strh r0, [r4, 0x34]
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _0804EAEC
	adds r0, r4, 0
	bl DestroySprite
	b _0804EAF2
_0804EAEC:
	movs r0, 0x74
	bl PlaySE
_0804EAF2:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x32]
	strh r0, [r4, 0x22]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_804E738

	thumb_func_start sub_804E794
sub_804E794: @ 804EB00
	push {r4-r6,lr}
	ldr r5, [sp, 0x10]
	ldr r6, [sp, 0x14]
	lsls r2, 16
	lsrs r2, 16
	movs r4, 0
	strh r2, [r0, 0x2E]
	strh r1, [r0, 0x30]
	strh r2, [r0, 0x32]
	strh r3, [r0, 0x34]
	movs r1, 0xA
	strh r1, [r0, 0x36]
	strh r4, [r0, 0x38]
	strh r5, [r0, 0x3A]
	strh r6, [r0, 0x3C]
	ldr r1, _0804EB28
	str r1, [r0, 0x1C]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EB28: .4byte sub_804E738
	thumb_func_end sub_804E794

	thumb_func_start sub_804E7C0
sub_804E7C0: @ 804EB2C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r1, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r0, 24
	movs r1, 0xF6
	lsls r1, 23
	adds r0, r1
	lsrs r0, 24
	movs r3, 0x1
	ands r3, r6
	movs r1, 0
	movs r2, 0x50
	bl sub_80A7DEC
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	mov r8, r2
	add r8, r0
	mov r3, r8
	lsls r3, 2
	mov r8, r3
	ldr r0, _0804EBA8
	add r8, r0
	ldr r5, _0804EBAC
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 1
	adds r0, r4, r5
	movs r6, 0
	ldrsh r1, [r0, r6]
	adds r0, r5, 0x2
	adds r0, r4, r0
	movs r3, 0
	ldrsh r2, [r0, r3]
	adds r0, r5, 0x4
	adds r0, r4, r0
	movs r6, 0
	ldrsh r3, [r0, r6]
	adds r0, r5, 0x6
	adds r0, r4, r0
	movs r6, 0
	ldrsh r0, [r0, r6]
	str r0, [sp]
	adds r5, 0x8
	adds r4, r5
	movs r5, 0
	ldrsh r0, [r4, r5]
	str r0, [sp, 0x4]
	mov r0, r8
	bl sub_804E794
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EBA8: .4byte gSprites
_0804EBAC: .4byte gUnknown_08216594
	thumb_func_end sub_804E7C0

	thumb_func_start sub_804E844
sub_804E844: @ 804EBB0
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r5, r1, 16
	lsrs r5, 16
	adds r0, r5, 0
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r4, r0, 0
	strh r5, [r6]
	adds r0, r6, 0x2
	adds r1, r4, 0
	bl StringCopy
	ldrb r0, [r4, 0x15]
	strb r0, [r6, 0x9]
	ldrb r0, [r4, 0x16]
	strb r0, [r6, 0xA]
	ldrb r0, [r4, 0x17]
	strb r0, [r6, 0xB]
	ldrb r0, [r4, 0x18]
	strb r0, [r6, 0xC]
	ldrb r0, [r4, 0x19]
	strb r0, [r6, 0xD]
	ldrb r0, [r4, 0x1A]
	strb r0, [r6, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_804E844

	thumb_func_start sub_804E884
sub_804E884: @ 804EBF0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	beq _0804EC0A
	ldr r2, _0804EC18
	movs r3, 0x5
	adds r0, r2, 0
	adds r0, 0x54
_0804EC02:
	strh r3, [r0, 0x1A]
	subs r0, 0x1C
	cmp r0, r2
	bge _0804EC02
_0804EC0A:
	cmp r1, 0x1
	beq _0804EC30
	cmp r1, 0x1
	bgt _0804EC1C
	cmp r1, 0
	beq _0804EC26
	b _0804ECE0
	.align 2, 0
_0804EC18: .4byte gLinkPlayers
_0804EC1C:
	cmp r1, 0x2
	beq _0804EC64
	cmp r1, 0x3
	beq _0804ECA8
	b _0804ECE0
_0804EC26:
	ldr r0, _0804EC2C
	strb r1, [r0]
	b _0804ECE0
	.align 2, 0
_0804EC2C: .4byte gUnknown_03004834
_0804EC30:
	ldr r0, _0804EC50
	strb r1, [r0]
	ldr r0, _0804EC54
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x2
	strb r1, [r0]
	ldr r4, _0804EC58
	ldr r1, _0804EC5C
	adds r0, r4, 0
	bl StringCopy
	adds r4, 0x1C
	ldr r0, _0804EC60
	ldr r1, [r0]
	b _0804EC8C
	.align 2, 0
_0804EC50: .4byte gUnknown_03004834
_0804EC54: .4byte gUnknown_03004854
_0804EC58: .4byte 0x03002988
_0804EC5C: .4byte gSaveBlock2
_0804EC60: .4byte gUnknown_082162B8
_0804EC64:
	ldr r0, _0804EC94
	strb r1, [r0]
	ldr r0, _0804EC98
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x3
	strb r1, [r0]
	ldr r4, _0804EC9C
	ldr r1, _0804ECA0
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x1C
	ldr r5, _0804ECA4
	ldr r1, [r5]
	bl StringCopy
	adds r4, 0x38
	ldr r1, [r5, 0x4]
_0804EC8C:
	adds r0, r4, 0
	bl StringCopy
	b _0804ECE0
	.align 2, 0
_0804EC94: .4byte gUnknown_03004834
_0804EC98: .4byte gUnknown_03004854
_0804EC9C: .4byte 0x03002988
_0804ECA0: .4byte gSaveBlock2
_0804ECA4: .4byte gUnknown_082162B8
_0804ECA8:
	ldr r0, _0804ECE8
	strb r1, [r0]
	ldr r0, _0804ECEC
	ldr r0, [r0]
	adds r0, 0x88
	movs r1, 0x4
	strb r1, [r0]
	ldr r4, _0804ECF0
	ldr r1, _0804ECF4
	adds r0, r4, 0
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x1C
	ldr r5, _0804ECF8
	ldr r1, [r5]
	bl StringCopy
	adds r0, r4, 0
	adds r0, 0x38
	ldr r1, [r5, 0x4]
	bl StringCopy
	adds r4, 0x54
	ldr r1, [r5, 0x8]
	adds r0, r4, 0
	bl StringCopy
_0804ECE0:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804ECE8: .4byte gUnknown_03004834
_0804ECEC: .4byte gUnknown_03004854
_0804ECF0: .4byte 0x03002988
_0804ECF4: .4byte gSaveBlock2
_0804ECF8: .4byte gUnknown_082162B8
	thumb_func_end sub_804E884

	thumb_func_start sub_804E990
sub_804E990: @ 804ECFC
	push {r4,r5,lr}
	movs r0, 0x80
	lsls r0, 19
	movs r2, 0
	strh r2, [r0]
	ldr r3, _0804ED44
	ldr r0, _0804ED48
	str r0, [r3]
	movs r1, 0
	strb r2, [r0]
	movs r2, 0x9A
	lsls r2, 1
	adds r0, r2
	str r1, [r0]
	movs r2, 0
	ldr r5, _0804ED4C
	adds r4, r3, 0
	movs r3, 0
_0804ED20:
	ldr r0, [r4]
	lsls r1, r2, 1
	adds r0, 0x80
	adds r0, r1
	strh r3, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _0804ED20
	ldrb r0, [r5]
	bl sub_804E884
	ldrh r0, [r5]
	cmp r0, 0
	bne _0804ED54
	ldr r0, _0804ED50
	bl SetMainCallback2
	b _0804ED5A
	.align 2, 0
_0804ED44: .4byte gUnknown_03004854
_0804ED48: .4byte 0x02018000
_0804ED4C: .4byte gSpecialVar_0x8004
_0804ED50: .4byte sub_804E9F8
_0804ED54:
	ldr r0, _0804ED60
	bl SetMainCallback2
_0804ED5A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED60: .4byte sub_804F378
	thumb_func_end sub_804E990

	thumb_func_start sub_804E9F8
sub_804E9F8: @ 804ED64
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _0804ED84
	ldr r0, [r1]
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0x66
	bls _0804ED7A
	b _0804F43A
_0804ED7A:
	lsls r0, 2
	ldr r1, _0804ED88
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804ED84: .4byte gUnknown_03004854
_0804ED88: .4byte _0804ED8C
	.align 2, 0
_0804ED8C:
	.4byte _0804EF28
	.4byte _0804EFE0
	.4byte _0804F000
	.4byte _0804F054
	.4byte _0804F066
	.4byte _0804F080
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F0B4
	.4byte _0804F100
	.4byte _0804F124
	.4byte _0804F1B2
	.4byte _0804F20C
	.4byte _0804F282
	.4byte _0804F2A0
	.4byte _0804F344
	.4byte _0804F378
	.4byte _0804F43A
	.4byte _0804F38C
	.4byte _0804F390
	.4byte _0804F396
	.4byte _0804F3A6
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F43A
	.4byte _0804F3F0
	.4byte _0804F40C
	.4byte _0804F428
_0804EF28:
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0804EFCC
	bl SetVBlankCallback
	ldr r4, _0804EFD0
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _0804EFD4
	ldr r2, _0804EFD8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r3, _0804EFDC
	ldr r1, [r3]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r2, 0
	strb r0, [r1]
	ldr r0, [r3]
	adds r4, r0, 0
	adds r4, 0x4E
	movs r1, 0
	strh r2, [r4]
	adds r0, 0x7E
	strb r1, [r0]
	ldr r1, [r3]
	movs r4, 0xA2
	lsls r4, 1
	adds r0, r1, r4
	strh r2, [r0]
	adds r4, 0x2
	adds r0, r1, r4
	strh r2, [r0]
	movs r5, 0
	movs r6, 0
	mov r8, r3
	movs r7, 0xA6
	lsls r7, 1
_0804EF84:
	ldr r0, [r3]
	lsls r1, r5, 1
	adds r0, 0x70
	adds r0, r1
	strh r6, [r0]
	adds r4, r5, 0x1
	adds r1, r5
	lsls r1, 1
	movs r2, 0x2
_0804EF96:
	ldr r0, [r3]
	adds r0, r7
	adds r0, r1
	strh r6, [r0]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804EF96
	adds r5, r4, 0
	cmp r5, 0x3
	ble _0804EF84
	mov r0, r8
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x7C
	movs r2, 0
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x26
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	strb r2, [r3, 0x1]
	b _0804F43A
	.align 2, 0
_0804EFCC: .4byte sub_804E2BC
_0804EFD0: .4byte gWindowConfig_81E6F68
_0804EFD4: .4byte gLinkType
_0804EFD8: .4byte 0x00004422
_0804EFDC: .4byte gUnknown_03004854
_0804EFE0:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804EFEC
	b _0804F43A
_0804EFEC:
	ldr r0, _0804EFFC
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8051474
	b _0804F43A
	.align 2, 0
_0804EFFC: .4byte gUnknown_03004854
_0804F000:
	movs r5, 0
	ldr r4, _0804F044
	ldr r6, _0804F048
_0804F006:
	ldrb r1, [r4]
	ldrb r2, [r4, 0x1]
	ldr r0, _0804F04C
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x60
	adds r1, r5
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x60
	adds r0, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804F050
	adds r0, r1
	adds r1, r5, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r4, 0x2
	adds r5, 0x1
	cmp r5, 0x3
	ble _0804F006
	b _0804F416
	.align 2, 0
_0804F044: .4byte gUnknown_082162E4
_0804F048: .4byte gUnknown_03004854
_0804F04C: .4byte gSpriteTemplate_82163F4
_0804F050: .4byte gSprites
_0804F054:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	b _0804F416
_0804F066:
	bl sub_804E4FC
	ldr r0, _0804F07C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804F078
	b _0804F43A
_0804F078:
	b _0804F416
	.align 2, 0
_0804F07C: .4byte gPaletteFade
_0804F080:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804F0AC
	movs r1, 0x1
	movs r2, 0xE
	bl MenuPrint
	ldr r2, _0804F0B0
	ldr r1, [r2]
	movs r3, 0
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	str r3, [r0]
	b _0804F43A
	.align 2, 0
_0804F0AC: .4byte gOtherText_LinkStandby3
_0804F0B0: .4byte gUnknown_03004854
_0804F0B4:
	mov r2, r8
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	movs r5, 0
	strb r0, [r1]
	ldr r0, [r2]
	movs r3, 0x9E
	lsls r3, 1
	adds r0, r3
	strb r5, [r0]
	ldr r0, [r2]
	movs r4, 0xBE
	lsls r4, 1
	adds r0, r4
	ldr r1, _0804F0F8
	ldrh r1, [r1]
	bl sub_804E844
	ldr r0, _0804F0FC
	mov r2, r8
	ldr r1, [r2]
	adds r1, r4
	movs r2, 0x10
	bl memcpy
	bl sub_80084A4
	mov r3, r8
	ldr r0, [r3]
	subs r4, 0x4C
	adds r0, r4
	str r5, [r0]
	b _0804F43A
	.align 2, 0
_0804F0F8: .4byte gScriptItemId
_0804F0FC: .4byte gBlockSendBuffer
_0804F100:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804F10C
	b _0804F43A
_0804F10C:
	bl ResetBlockReceivedFlags
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _0804F11C
	b _0804F416
_0804F11C:
	movs r0, 0x4
	bl sub_8007E9C
	b _0804F416
_0804F124:
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bgt _0804F13A
	b _0804F43A
_0804F13A:
	bl MenuZeroFillScreen
	bl GetBlockReceivedStatus
	adds r4, r0, 0
	bl sub_8008198
	lsls r4, 24
	lsls r0, 24
	cmp r4, r0
	beq _0804F152
	b _0804F43A
_0804F152:
	movs r5, 0
	mov r7, r8
	movs r6, 0xBE
	lsls r6, 1
	b _0804F184
_0804F15C:
	ldr r0, [r7]
	lsls r4, r5, 4
	adds r0, r4, r0
	adds r0, r6
	lsls r1, r5, 8
	ldr r2, _0804F198
	adds r1, r2
	movs r2, 0x10
	bl memcpy
	ldr r0, [r7]
	lsls r2, r5, 1
	adds r1, r0, 0
	adds r1, 0x80
	adds r1, r2
	adds r0, r4
	adds r0, r6
	ldrh r0, [r0]
	strh r0, [r1]
	adds r5, 0x1
_0804F184:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	blt _0804F15C
	bl ResetBlockReceivedFlags
	b _0804F416
	.align 2, 0
_0804F198: .4byte gBlockRecvBuffer
_0804F19C:
	ldrb r1, [r4]
	lsls r1, 1
	adds r0, r2, 0
	adds r0, 0x80
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r5, 24
	lsrs r1, 24
	bl sub_804E7C0
	b _0804F1E6
_0804F1B2:
	bl GetLinkPlayerCount
	ldr r2, _0804F204
	ldr r1, [r2]
	adds r1, 0x88
	strb r0, [r1]
	movs r5, 0
	ldr r2, [r2]
	movs r3, 0x9E
	lsls r3, 1
	adds r4, r2, r3
	ldr r1, _0804F208
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	ldrb r3, [r4]
	adds r0, r1
_0804F1D8:
	ldrb r1, [r0]
	cmp r3, r1
	beq _0804F19C
	adds r0, 0x1
	adds r5, 0x1
	cmp r5, 0x3
	ble _0804F1D8
_0804F1E6:
	ldr r3, _0804F204
	ldr r1, [r3]
	movs r4, 0x98
	lsls r4, 1
	adds r2, r1, r4
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r3]
	movs r0, 0x9E
	lsls r0, 1
	adds r1, r0
	b _0804F41A
	.align 2, 0
_0804F204: .4byte gUnknown_03004854
_0804F208: .4byte gUnknown_082162EC
_0804F20C:
	mov r1, r8
	ldr r2, [r1]
	movs r3, 0x98
	lsls r3, 1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _0804F222
	b _0804F43A
_0804F222:
	movs r4, 0x9E
	lsls r4, 1
	adds r0, r2, r4
	adds r1, r2, 0
	adds r1, 0x88
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bcc _0804F26C
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r0, r8
	ldr r2, [r0]
	ldr r3, _0804F260
	ldr r1, _0804F264
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r3
	ldr r3, _0804F268
	adds r1, r3, 0
	ldrh r0, [r0]
	adds r1, r0
	adds r2, 0x54
	strh r1, [r2]
	b _0804F272
	.align 2, 0
_0804F260: .4byte gUnknown_082162F8
_0804F264: .4byte gUnknown_08216300
_0804F268: .4byte 0xffffa800
_0804F26C:
	ldrb r0, [r2]
	subs r0, 0x1
	strb r0, [r2]
_0804F272:
	mov r4, r8
	ldr r0, [r4]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	str r1, [r0]
	b _0804F43A
_0804F282:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _0804F28E
	b _0804F43A
_0804F28E:
	ldr r2, _0804F29C
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	b _0804F328
	.align 2, 0
_0804F29C: .4byte gUnknown_03004854
_0804F2A0:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	mov r4, r8
	ldr r2, [r4]
	adds r1, r2, 0
	adds r1, 0x54
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r4, [r1]
	adds r0, r4
	strh r0, [r1]
	movs r0, 0xA1
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x4
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _0804F324
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0xA1
	lsls r2, 1
	adds r1, r3, r2
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r2, _0804F334
	ldr r1, _0804F338
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldr r1, _0804F33C
	ldr r4, _0804F340
	adds r0, r4, 0
	strh r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	str r0, [r1]
	bl sub_804F238
	bl BuyMenuDrawFieldObjects
_0804F324:
	mov r1, r8
	ldr r0, [r1]
_0804F328:
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2
	bl sub_8051414
	b _0804F43A
	.align 2, 0
_0804F334: .4byte gUnknown_082162F8
_0804F338: .4byte gUnknown_08216300
_0804F33C: .4byte 0x0400000c
_0804F340: .4byte 0x00004882
_0804F344:
	bl sub_8051B8C
	lsls r0, 24
	cmp r0, 0
	beq _0804F362
	ldr r0, _0804F374
	ldr r1, [r0]
	movs r3, 0x98
	lsls r3, 1
	adds r2, r1, r3
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804F362:
	ldr r0, _0804F374
	ldr r0, [r0]
	movs r4, 0xB4
	lsls r4, 1
	adds r0, r4
	bl sub_8051414
	b _0804F43A
	.align 2, 0
_0804F374: .4byte gUnknown_03004854
_0804F378:
	ldr r0, _0804F388
	movs r2, 0x10
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x3
	bl CreateSprite
	b _0804F416
	.align 2, 0
_0804F388: .4byte gSpriteTemplate_8216548
_0804F38C:
	mov r0, r8
	b _0804F418
_0804F390:
	bl sub_80084A4
	b _0804F416
_0804F396:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _0804F43A
	bl sub_8007E24
	b _0804F416
_0804F3A6:
	mov r1, r8
	ldr r3, [r1]
	adds r2, r3, 0
	adds r2, 0x56
	movs r1, 0
	movs r0, 0x80
	strh r0, [r2]
	movs r2, 0x96
	lsls r2, 1
	adds r0, r3, r2
	str r1, [r0]
	ldr r0, _0804F3E8
	bl SetMainCallback2
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0804F3EC
	cmp r0, r4
	beq _0804F3E0
	bl GetCurrentMapMusic
	mov r3, r8
	ldr r1, [r3]
	movs r2, 0xBC
	lsls r2, 1
	adds r1, r2
	strh r0, [r1]
_0804F3E0:
	adds r0, r4, 0
	bl PlayBGM
	b _0804F43A
	.align 2, 0
_0804F3E8: .4byte sub_80501FC
_0804F3EC: .4byte 0x00000193
_0804F3F0:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _0804F408
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _0804F416
	.align 2, 0
_0804F408: .4byte gOtherText_LinkNotFound
_0804F40C:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0804F43A
_0804F416:
	ldr r0, _0804F424
_0804F418:
	ldr r1, [r0]
_0804F41A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804F43A
	.align 2, 0
_0804F424: .4byte gUnknown_03004854
_0804F428:
	ldr r0, _0804F458
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0804F43A
	ldr r0, _0804F45C
	bl SetMainCallback2
_0804F43A:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F458: .4byte gPaletteFade
_0804F45C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_804E9F8

	thumb_func_start sub_804F0F4
sub_804F0F4: @ 804F460
	push {r4,lr}
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0804F4C4
	bl SetVBlankCallback
	ldr r4, _0804F4C8
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r1, _0804F4CC
	ldr r2, _0804F4D0
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0804F4D4
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0x4E
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x8
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x6
	strh r1, [r0]
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F4C4: .4byte sub_804E2BC
_0804F4C8: .4byte gWindowConfig_81E6F68
_0804F4CC: .4byte gLinkType
_0804F4D0: .4byte 0x00004422
_0804F4D4: .4byte gUnknown_03004854
	thumb_func_end sub_804F0F4

	thumb_func_start task_tutorial_oak_boy_girl
task_tutorial_oak_boy_girl: @ 804F4D8
	push {lr}
	lsls r0, 16
	lsls r1, 24
	lsrs r0, 24
	adds r2, r0, 0
	adds r2, 0x18
	ldr r0, _0804F514
	ldr r0, [r0]
	lsrs r1, 23
	adds r0, 0xA2
	adds r0, r1
	ldrb r0, [r0]
	ldr r1, _0804F518
	adds r0, r1
	ldrb r1, [r0]
	cmp r2, r1
	bcc _0804F520
	adds r0, r1, 0
	adds r0, 0x30
	cmp r2, r0
	bcs _0804F520
	subs r0, 0x1C
	cmp r2, r0
	bcc _0804F51C
	adds r0, 0x8
	cmp r2, r0
	bcs _0804F51C
	movs r0, 0x2
	b _0804F522
	.align 2, 0
_0804F514: .4byte gUnknown_03004854
_0804F518: .4byte gUnknown_08216303
_0804F51C:
	movs r0, 0x1
	b _0804F522
_0804F520:
	movs r0, 0
_0804F522:
	pop {r1}
	bx r1
	thumb_func_end task_tutorial_oak_boy_girl

	thumb_func_start sub_804F1BC
sub_804F1BC: @ 804F528
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	movs r4, 0
	cmp r0, 0xAF
	bne _0804F55A
	movs r3, 0
	subs r5, r1, 0x1
	adds r2, 0x9
_0804F53E:
	adds r0, r2, r4
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _0804F54C
	adds r4, r3, 0
_0804F54C:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x4
	bls _0804F53E
	adds r0, r4, 0x5
	b _0804F570
_0804F55A:
	subs r0, 0x85
	lsls r0, 16
	lsrs r4, r0, 16
	subs r5, r1, 0x1
	cmp r4, 0x4
	bls _0804F574
	adds r0, r4, 0
	movs r1, 0x5
	bl __umodsi3
	adds r0, 0x5
_0804F570:
	lsls r0, 16
	lsrs r4, r0, 16
_0804F574:
	movs r3, 0
	cmp r3, r5
	bge _0804F59A
	ldr r7, _0804F5A0
	lsls r0, r4, 1
	adds r6, r0, r4
_0804F580:
	adds r4, r3, 0x1
	lsls r0, r4, 24
	lsrs r0, 24
	adds r1, r3, r6
	adds r1, r7
	ldrb r1, [r1]
	adds r1, 0x85
	bl sub_80516C4
	lsls r4, 16
	lsrs r3, r4, 16
	cmp r3, r5
	blt _0804F580
_0804F59A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F5A0: .4byte gUnknown_082165BC
	thumb_func_end sub_804F1BC

	thumb_func_start sub_804F238
sub_804F238: @ 804F5A4
	push {r4-r7,lr}
	movs r4, 0
	ldr r7, _0804F60C
	movs r6, 0xFF
	ldr r5, _0804F610
_0804F5AE:
	ldr r3, [r7]
	lsls r2, r4, 1
	adds r0, r3, 0
	adds r0, 0xA2
	adds r0, r2
	strh r6, [r0]
	adds r1, r3, 0
	adds r1, 0x9A
	adds r1, r2
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	adds r0, r4, r0
	adds r0, r5
	ldrb r0, [r0]
	strh r0, [r1]
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F5AE
	movs r3, 0
	ldr r7, _0804F60C
_0804F5DC:
	movs r4, 0
	adds r6, r3, 0x1
	lsls r5, r3, 1
_0804F5E2:
	ldr r2, [r7]
	lsls r0, r4, 1
	adds r1, r2, 0
	adds r1, 0x9A
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, r3
	bne _0804F5FA
	adds r0, r2, 0
	adds r0, 0xA2
	adds r0, r5
	strh r4, [r0]
_0804F5FA:
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F5E2
	adds r3, r6, 0
	cmp r3, 0x3
	ble _0804F5DC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F60C: .4byte gUnknown_03004854
_0804F610: .4byte gUnknown_082162EC
	thumb_func_end sub_804F238

	thumb_func_start BuyMenuDrawFieldObjects
BuyMenuDrawFieldObjects: @ 804F614
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r7, _0804F6CC
	ldr r0, _0804F6D0
	mov r8, r0
_0804F622:
	ldr r2, [r7]
	lsls r4, r6, 1
	adds r0, r2, 0
	adds r0, 0x9A
	adds r3, r0, r4
	ldrh r0, [r3]
	cmp r0, 0xFF
	beq _0804F6B6
	ldr r5, _0804F6D4
	adds r1, r2, 0
	adds r1, 0x5C
	ldrh r3, [r3]
	adds r1, r3
	adds r0, r2, 0
	adds r0, 0x60
	adds r0, r6
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r7]
	adds r1, r0, 0
	adds r1, 0x9A
	adds r1, r4
	adds r0, 0x5C
	ldrh r1, [r1]
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804F6D8
	adds r0, r1
	lsls r1, r6, 24
	lsrs r1, 24
	bl StartSpriteAnim
	bl GetMultiplayerId
	lsls r0, 24
	ldr r1, [r7]
	adds r1, 0x9A
	adds r1, r4
	lsrs r0, 24
	ldrh r1, [r1]
	cmp r0, r1
	bne _0804F686
	adds r0, r5, 0
	ldr r1, _0804F6DC
	bl StringCopy
	adds r5, r0, 0
_0804F686:
	ldr r0, [r7]
	adds r0, 0x9A
	adds r0, r4
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _0804F6E0
	adds r1, r0
	adds r0, r5, 0
	bl StringCopy
	mov r0, r8
	ldrb r1, [r0]
	lsls r1, 3
	adds r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0x1]
	lsls r2, 3
	ldr r0, _0804F6D4
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_0804F6B6:
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	cmp r6, 0x3
	ble _0804F622
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F6CC: .4byte gUnknown_03004854
_0804F6D0: .4byte gUnknown_082162D4
_0804F6D4: .4byte gStringVar1
_0804F6D8: .4byte gSprites
_0804F6DC: .4byte gUnknown_082162C4
_0804F6E0: .4byte 0x03002988
	thumb_func_end BuyMenuDrawFieldObjects

	thumb_func_start sub_804F378
sub_804F378: @ 804F6E4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r1, _0804F704
	ldr r0, [r1]
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, 0x15
	bls _0804F6FA
	b _0804FB52
_0804F6FA:
	lsls r0, 2
	ldr r1, _0804F708
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804F704: .4byte gUnknown_03004854
_0804F708: .4byte _0804F70C
	.align 2, 0
_0804F70C:
	.4byte _0804F764
	.4byte _0804F7E0
	.4byte _0804F800
	.4byte _0804F858
	.4byte _0804F884
	.4byte _0804FB52
	.4byte _0804FB52
	.4byte _0804FB52
	.4byte _0804F8B8
	.4byte _0804FB52
	.4byte _0804FB52
	.4byte _0804F8E4
	.4byte _0804F934
	.4byte _0804F9A2
	.4byte _0804F9BC
	.4byte _0804FA64
	.4byte _0804FA8C
	.4byte _0804FB52
	.4byte _0804FAA8
	.4byte _0804FAAE
	.4byte _0804FAB4
	.4byte _0804FAC0
_0804F764:
	bl sub_804F0F4
	ldr r4, _0804F7D8
	ldrh r1, [r4]
	movs r0, 0
	bl sub_80516C4
	ldr r5, _0804F7DC
	ldr r0, [r5]
	movs r6, 0xBE
	lsls r6, 1
	adds r0, r6
	ldrh r1, [r4]
	bl sub_804E844
	ldrh r0, [r4]
	ldr r2, [r5]
	adds r1, r2, 0
	adds r1, 0x88
	ldrb r1, [r1]
	adds r2, r6
	bl sub_804F1BC
	movs r4, 0
	movs r6, 0
	mov r8, r5
	movs r7, 0xA6
	lsls r7, 1
_0804F79C:
	ldr r0, [r5]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	strh r6, [r0]
	adds r3, r4, 0x1
	adds r1, r4
	lsls r1, 1
	movs r2, 0x2
_0804F7AE:
	ldr r0, [r5]
	adds r0, r7
	adds r0, r1
	strh r6, [r0]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804F7AE
	adds r4, r3, 0
	cmp r4, 0x3
	ble _0804F79C
	mov r0, r8
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x7C
	movs r2, 0
	movs r0, 0
	strh r0, [r1]
	strb r2, [r3, 0x1]
	b _0804FB52
	.align 2, 0
_0804F7D8: .4byte gScriptItemId
_0804F7DC: .4byte gUnknown_03004854
_0804F7E0:
	bl sub_804E2EC
	lsls r0, 24
	cmp r0, 0
	bne _0804F7EC
	b _0804FB52
_0804F7EC:
	ldr r0, _0804F7FC
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_8051474
	b _0804FB52
	.align 2, 0
_0804F7FC: .4byte gUnknown_03004854
_0804F800:
	movs r4, 0
	ldr r5, _0804F848
	ldr r6, _0804F84C
_0804F806:
	ldrb r1, [r5]
	ldrb r2, [r5, 0x1]
	ldr r0, _0804F850
	movs r3, 0x1
	bl CreateSprite
	ldr r1, [r6]
	adds r1, 0x60
	adds r1, r4
	strb r0, [r1]
	ldr r0, [r6]
	adds r0, 0x60
	adds r0, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0804F854
	adds r0, r1
	adds r1, r4, 0
	adds r1, 0x8
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	adds r5, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F806
	ldr r0, _0804F84C
	ldr r1, [r0]
	b _0804FAB8
	.align 2, 0
_0804F848: .4byte gUnknown_082162E4
_0804F84C: .4byte gUnknown_03004854
_0804F850: .4byte gSpriteTemplate_82163F4
_0804F854: .4byte gSprites
_0804F858:
	movs r0, 0x1
	negs r0, r0
	movs r4, 0
	str r4, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0804F880
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	str r4, [r0]
	b _0804FB52
	.align 2, 0
_0804F880: .4byte gUnknown_03004854
_0804F884:
	mov r2, r8
	ldr r1, [r2]
	movs r3, 0x98
	lsls r3, 1
	adds r1, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x2
	bne _0804F89C
	bl sub_804E4FC
_0804F89C:
	ldr r0, _0804F8B4
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0804F8AA
	b _0804FB52
_0804F8AA:
	mov r5, r8
	ldr r1, [r5]
	movs r0, 0x8
	strb r0, [r1]
	b _0804FB52
	.align 2, 0
_0804F8B4: .4byte gPaletteFade
_0804F8B8:
	mov r0, r8
	ldr r1, [r0]
	movs r2, 0
	movs r0, 0xB
	strb r0, [r1]
	mov r1, r8
	ldr r0, [r1]
	movs r3, 0x9E
	lsls r3, 1
	adds r0, r3
	strb r2, [r0]
	b _0804FB52
_0804F8D0:
	lsls r1, 1
	adds r0, r3, 0
	adds r0, 0x80
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_804E7C0
	b _0804F90E
_0804F8E4:
	movs r4, 0
	ldr r2, _0804F92C
	ldr r0, _0804F930
	ldr r3, [r0]
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 2
	movs r5, 0x9E
	lsls r5, 1
	adds r1, r3, r5
	ldrb r1, [r1]
	adds r0, r2
_0804F900:
	ldrb r2, [r0]
	cmp r1, r2
	beq _0804F8D0
	adds r0, 0x1
	adds r4, 0x1
	cmp r4, 0x3
	ble _0804F900
_0804F90E:
	ldr r3, _0804F930
	ldr r1, [r3]
	movs r5, 0x98
	lsls r5, 1
	adds r2, r1, r5
	movs r0, 0
	str r0, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r1, [r3]
	movs r0, 0x9E
	lsls r0, 1
	adds r1, r0
	b _0804FAB8
	.align 2, 0
_0804F92C: .4byte gUnknown_082162EC
_0804F930: .4byte gUnknown_03004854
_0804F934:
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r3, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _0804F94A
	b _0804FB52
_0804F94A:
	movs r5, 0x9E
	lsls r5, 1
	adds r0, r3, r5
	adds r4, r3, 0
	adds r4, 0x88
	ldrb r0, [r0]
	ldrb r1, [r4]
	cmp r0, r1
	bcc _0804F98C
	ldr r2, _0804F980
	ldr r1, _0804F984
	ldrb r0, [r4]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldr r2, _0804F988
	adds r1, r2, 0
	ldrh r0, [r0]
	adds r1, r0
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldrb r0, [r3]
	adds r0, 0x1
	b _0804F990
	.align 2, 0
_0804F980: .4byte gUnknown_082162F8
_0804F984: .4byte gUnknown_08216300
_0804F988: .4byte 0xffffa800
_0804F98C:
	ldrb r0, [r3]
	subs r0, 0x1
_0804F990:
	strb r0, [r3]
	mov r3, r8
	ldr r0, [r3]
	movs r5, 0x98
	lsls r5, 1
	adds r0, r5
	movs r1, 0
	str r1, [r0]
	b _0804FB52
_0804F9A2:
	mov r1, r8
	ldr r0, [r1]
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	bl sub_804F238
	movs r0, 0x2B
	bl PlaySE
	mov r2, r8
	ldr r0, [r2]
	b _0804FA7C
_0804F9BC:
	movs r2, 0x80
	lsls r2, 19
	ldrh r0, [r2]
	movs r5, 0x80
	lsls r5, 3
	adds r1, r5, 0
	orrs r0, r1
	strh r0, [r2]
	mov r0, r8
	ldr r2, [r0]
	adds r1, r2, 0
	adds r1, 0x54
	movs r3, 0x80
	lsls r3, 2
	adds r0, r3, 0
	ldrh r5, [r1]
	adds r0, r5
	strh r0, [r1]
	movs r0, 0xA1
	lsls r0, 1
	adds r1, r2, r0
	ldrh r0, [r1]
	adds r0, 0x4
	strh r0, [r1]
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0xFF
	bls _0804FA42
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	mov r1, r8
	ldr r3, [r1]
	movs r2, 0xA1
	lsls r2, 1
	adds r1, r3, r2
	movs r0, 0x80
	lsls r0, 1
	strh r0, [r1]
	ldr r2, _0804FA54
	ldr r1, _0804FA58
	adds r0, r3, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 1
	adds r0, r2
	ldrh r1, [r0]
	adds r0, r3, 0
	adds r0, 0x54
	strh r1, [r0]
	ldr r1, _0804FA5C
	ldr r5, _0804FA60
	adds r0, r5, 0
	strh r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r3, r0
	movs r0, 0
	str r0, [r1]
	movs r0, 0x34
	bl PlaySE
	bl BuyMenuDrawFieldObjects
_0804FA42:
	mov r1, r8
	ldr r0, [r1]
	movs r2, 0xB4
	lsls r2, 1
	adds r0, r2
	bl sub_8051414
	b _0804FB52
	.align 2, 0
_0804FA54: .4byte gUnknown_082162F8
_0804FA58: .4byte gUnknown_08216300
_0804FA5C: .4byte 0x0400000c
_0804FA60: .4byte 0x00004882
_0804FA64:
	bl sub_8051B8C
	lsls r0, 24
	cmp r0, 0
	beq _0804FA78
	ldr r0, _0804FA88
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_0804FA78:
	ldr r0, _0804FA88
	ldr r0, [r0]
_0804FA7C:
	movs r3, 0xB4
	lsls r3, 1
	adds r0, r3
	bl sub_8051414
	b _0804FB52
	.align 2, 0
_0804FA88: .4byte gUnknown_03004854
_0804FA8C:
	ldr r0, _0804FAA0
	movs r2, 0x10
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x3
	bl CreateSprite
	ldr r0, _0804FAA4
	ldr r1, [r0]
	b _0804FAB8
	.align 2, 0
_0804FAA0: .4byte gSpriteTemplate_8216548
_0804FAA4: .4byte gUnknown_03004854
_0804FAA8:
	mov r5, r8
	ldr r1, [r5]
	b _0804FAB8
_0804FAAE:
	mov r0, r8
	ldr r1, [r0]
	b _0804FAB8
_0804FAB4:
	mov r2, r8
	ldr r1, [r2]
_0804FAB8:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0804FB52
_0804FAC0:
	bl sub_804F81C
	ldr r3, _0804FB70
	ldr r4, [r3]
	adds r5, r4, 0
	adds r5, 0x56
	movs r2, 0
	movs r1, 0
	movs r0, 0x80
	strh r0, [r5]
	movs r5, 0x96
	lsls r5, 1
	adds r0, r4, r5
	str r1, [r0]
	ldr r1, _0804FB74
	adds r0, r4, r1
	strb r2, [r0]
	ldr r0, [r3]
	adds r0, 0x7E
	strb r2, [r0]
	ldr r0, _0804FB78
	bl SetMainCallback2
	movs r4, 0
	ldr r0, _0804FB7C
	ldrh r0, [r0]
	cmp r4, r0
	bge _0804FB24
	movs r5, 0xA0
	lsls r5, 20
	ldr r6, _0804FB80
_0804FAFE:
	ldm r6!, {r0}
	lsrs r1, r5, 24
	bl CreateTask
	ldr r1, _0804FB70
	ldr r1, [r1]
	movs r2, 0xA4
	lsls r2, 1
	adds r1, r2
	adds r1, r4
	strb r0, [r1]
	movs r3, 0x80
	lsls r3, 17
	adds r5, r3
	adds r4, 0x1
	ldr r0, _0804FB7C
	ldrh r0, [r0]
	cmp r4, r0
	blt _0804FAFE
_0804FB24:
	bl GetCurrentMapMusic
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _0804FB84
	cmp r0, r4
	beq _0804FB42
	bl GetCurrentMapMusic
	ldr r1, _0804FB70
	ldr r1, [r1]
	movs r5, 0xBC
	lsls r5, 1
	adds r1, r5
	strh r0, [r1]
_0804FB42:
	adds r0, r4, 0
	bl PlayBGM
	movs r0, 0x35
	bl PlaySE
	bl sub_804E290
_0804FB52:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804FB70: .4byte gUnknown_03004854
_0804FB74: .4byte 0x0000014b
_0804FB78: .4byte sub_80501FC
_0804FB7C: .4byte gSpecialVar_0x8004
_0804FB80: .4byte gUnknown_08216308
_0804FB84: .4byte 0x00000193
	thumb_func_end sub_804F378

	thumb_func_start sub_804F81C
sub_804F81C: @ 804FB88
	push {lr}
	ldr r3, _0804FBA8
	movs r0, 0
	ldr r1, _0804FBAC
	movs r2, 0x3
_0804FB92:
	strh r0, [r3]
	strh r0, [r3, 0x4]
	strh r0, [r1]
	strh r0, [r1, 0x10]
	adds r1, 0x2
	subs r2, 0x1
	cmp r2, 0
	bge _0804FB92
	pop {r0}
	bx r0
	.align 2, 0
_0804FBA8: .4byte gSendCmd
_0804FBAC: .4byte gRecvCmds
	thumb_func_end sub_804F81C

	thumb_func_start sub_804F844
sub_804F844: @ 804FBB0
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0804FBF0
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	lsls r0, 16
	asrs r0, 16
	movs r4, 0xA
	ldrsh r1, [r2, r4]
	cmp r0, r1
	ble _0804FBE8
	ldr r0, _0804FBF4
	movs r4, 0xC
	ldrsh r1, [r2, r4]
	lsls r1, 1
	adds r0, 0x10
	adds r1, r0
	ldr r0, _0804FBF8
	strh r0, [r1]
	adds r0, r3, 0
	bl DestroyTask
_0804FBE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FBF0: .4byte gTasks
_0804FBF4: .4byte gRecvCmds
_0804FBF8: .4byte 0x00002345
	thumb_func_end sub_804F844

	thumb_func_start sub_804F890
sub_804F890: @ 804FBFC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0804FC2C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0804FC30
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FC2C: .4byte sub_804F844
_0804FC30: .4byte gTasks
	thumb_func_end sub_804F890

	thumb_func_start sub_804F8C8
sub_804F8C8: @ 804FC34
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _0804FCA0
	ldr r0, [r4]
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0x1
	bl task_tutorial_oak_boy_girl
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _0804FC52
	b _0804FD48
_0804FC52:
	ldr r2, _0804FCA4
	lsls r1, r5, 2
	adds r0, r1, r5
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r0, [r0, r2]
	adds r6, r1, 0
	cmp r0, 0
	beq _0804FC68
	b _0804FD56
_0804FC68:
	ldr r0, [r4]
	ldr r1, _0804FCA8
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FD2A
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804FCAC
	bl __udivsi3
	lsls r0, 24
	lsrs r1, r0, 24
	adds r3, r1, 0
	ldr r0, [r4]
	adds r0, 0x56
	movs r4, 0
	ldrsh r2, [r0, r4]
	ldr r0, _0804FCB0
	cmp r2, r0
	bgt _0804FCD0
	cmp r1, 0x4B
	bls _0804FCBC
	ldr r1, _0804FCB4
	ldr r0, _0804FCB8
	b _0804FCC0
	.align 2, 0
_0804FCA0: .4byte gUnknown_03004854
_0804FCA4: .4byte gTasks
_0804FCA8: .4byte 0x0000014b
_0804FCAC: .4byte 0x0000028f
_0804FCB0: .4byte 0x000001f3
_0804FCB4: .4byte gRecvCmds
_0804FCB8: .4byte 0x00004523
_0804FCBC:
	ldr r1, _0804FCC8
	ldr r0, _0804FCCC
_0804FCC0:
	strh r0, [r1, 0x12]
	ldr r0, _0804FCCC
	b _0804FD2E
	.align 2, 0
_0804FCC8: .4byte gRecvCmds
_0804FCCC: .4byte 0x00005432
_0804FCD0:
	ldr r0, _0804FCEC
	cmp r2, r0
	bgt _0804FCFE
	cmp r1, 0x50
	bhi _0804FD2A
	adds r0, r1, 0
	subs r0, 0x15
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	bhi _0804FCF8
	ldr r1, _0804FCF0
	ldr r0, _0804FCF4
	b _0804FD2E
	.align 2, 0
_0804FCEC: .4byte 0x000005db
_0804FCF0: .4byte gRecvCmds
_0804FCF4: .4byte 0x00005432
_0804FCF8:
	cmp r1, 0x9
	bhi _0804FD30
	b _0804FD20
_0804FCFE:
	cmp r1, 0x5A
	bhi _0804FD2A
	adds r0, r1, 0
	subs r0, 0x47
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _0804FD1C
	ldr r1, _0804FD14
	ldr r0, _0804FD18
	b _0804FD2E
	.align 2, 0
_0804FD14: .4byte gRecvCmds
_0804FD18: .4byte 0x00005432
_0804FD1C:
	cmp r3, 0x1D
	bhi _0804FD30
_0804FD20:
	movs r0, 0x1
	movs r1, 0x5
	bl sub_804F890
	b _0804FD30
_0804FD2A:
	ldr r1, _0804FD3C
	ldr r0, _0804FD40
_0804FD2E:
	strh r0, [r1, 0x12]
_0804FD30:
	ldr r0, _0804FD44
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804FD54
	.align 2, 0
_0804FD3C: .4byte gRecvCmds
_0804FD40: .4byte 0x00004523
_0804FD44: .4byte gTasks
_0804FD48:
	ldr r0, _0804FD5C
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804FD54:
	strh r0, [r1, 0x8]
_0804FD56:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD5C: .4byte gTasks
	thumb_func_end sub_804F8C8

	thumb_func_start sub_804F9F4
sub_804F9F4: @ 804FD60
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _0804FDE4
	ldr r3, [r6]
	adds r0, r3, 0
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804FDE8
	ands r0, r1
	adds r1, r3, 0
	adds r1, 0xA6
	ldrb r1, [r1]
	lsrs r2, r0, 8
	ldr r0, _0804FDEC
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r1, 0
	adds r0, 0x14
	cmp r2, r0
	bls _0804FE70
	adds r0, 0x14
	cmp r2, r0
	bcs _0804FE70
	ldr r2, _0804FDF0
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r2
	movs r5, 0x8
	ldrsh r0, [r2, r5]
	adds r5, r1, 0
	cmp r0, 0
	bne _0804FE7E
	ldr r1, _0804FDF4
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FE5C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804FDF8
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	adds r3, r2, 0
	ldr r0, [r6]
	adds r0, 0x56
	movs r6, 0
	ldrsh r1, [r0, r6]
	ldr r0, _0804FDFC
	cmp r1, r0
	bgt _0804FE18
	cmp r2, 0x42
	bls _0804FE08
	ldr r1, _0804FE00
	ldr r0, _0804FE04
	strh r0, [r1, 0x14]
	b _0804FE40
	.align 2, 0
_0804FDE4: .4byte gUnknown_03004854
_0804FDE8: .4byte 0x0000ffff
_0804FDEC: .4byte gUnknown_08216303
_0804FDF0: .4byte gTasks
_0804FDF4: .4byte 0x0000014b
_0804FDF8: .4byte 0x0000028f
_0804FDFC: .4byte 0x000001f3
_0804FE00: .4byte gRecvCmds
_0804FE04: .4byte 0x00004523
_0804FE08:
	ldr r1, _0804FE10
	ldr r0, _0804FE14
	strh r0, [r1, 0x14]
	b _0804FE40
	.align 2, 0
_0804FE10: .4byte gRecvCmds
_0804FE14: .4byte 0x00005432
_0804FE18:
	cmp r2, 0x41
	bls _0804FE22
	ldr r1, _0804FE4C
	ldr r0, _0804FE50
	strh r0, [r1, 0x14]
_0804FE22:
	adds r0, r2, 0
	subs r0, 0x29
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	bhi _0804FE34
	ldr r1, _0804FE4C
	ldr r0, _0804FE54
	strh r0, [r1, 0x14]
_0804FE34:
	cmp r3, 0x9
	bhi _0804FE40
	movs r0, 0x2
	movs r1, 0x5
	bl sub_804F890
_0804FE40:
	ldr r0, _0804FE58
	adds r1, r5, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804FE7C
	.align 2, 0
_0804FE4C: .4byte gRecvCmds
_0804FE50: .4byte 0x00004523
_0804FE54: .4byte 0x00005432
_0804FE58: .4byte gTasks
_0804FE5C:
	ldr r0, _0804FE68
	ldr r1, _0804FE6C
	strh r1, [r0, 0x14]
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _0804FE7E
	.align 2, 0
_0804FE68: .4byte gRecvCmds
_0804FE6C: .4byte 0x00004523
_0804FE70:
	ldr r0, _0804FE84
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804FE7C:
	strh r0, [r1, 0x8]
_0804FE7E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE84: .4byte gTasks
	thumb_func_end sub_804F9F4

	thumb_func_start sub_804FB1C
sub_804FB1C: @ 804FE88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r5, _0804FF08
	ldr r3, [r5]
	adds r0, r3, 0
	adds r0, 0x54
	ldrh r0, [r0]
	movs r1, 0xC0
	lsls r1, 5
	adds r0, r1
	ldr r1, _0804FF0C
	ands r0, r1
	adds r1, r3, 0
	adds r1, 0xA8
	ldrb r1, [r1]
	lsrs r2, r0, 8
	ldr r0, _0804FF10
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r1, 0
	adds r0, 0x14
	cmp r2, r0
	bls _0804FF9C
	adds r0, 0x14
	cmp r2, r0
	bcs _0804FF9C
	ldr r2, _0804FF14
	lsls r1, r4, 2
	adds r0, r1, r4
	lsls r0, 3
	adds r2, r0, r2
	movs r6, 0x8
	ldrsh r0, [r2, r6]
	adds r6, r1, 0
	cmp r0, 0
	bne _0804FFAA
	ldr r1, _0804FF18
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0804FF88
	bl Random
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0804FF1C
	bl __udivsi3
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, [r5]
	adds r0, 0x56
	movs r3, 0
	ldrsh r1, [r0, r3]
	ldr r0, _0804FF20
	cmp r1, r0
	bgt _0804FF3C
	cmp r2, 0x58
	bls _0804FF2C
	ldr r1, _0804FF24
	ldr r0, _0804FF28
	strh r0, [r1, 0x16]
	b _0804FF6E
	.align 2, 0
_0804FF08: .4byte gUnknown_03004854
_0804FF0C: .4byte 0x0000ffff
_0804FF10: .4byte gUnknown_08216303
_0804FF14: .4byte gTasks
_0804FF18: .4byte 0x0000014b
_0804FF1C: .4byte 0x0000028f
_0804FF20: .4byte 0x000001f3
_0804FF24: .4byte gRecvCmds
_0804FF28: .4byte 0x00004523
_0804FF2C:
	ldr r1, _0804FF34
	ldr r0, _0804FF38
	strh r0, [r1, 0x16]
	b _0804FF6E
	.align 2, 0
_0804FF34: .4byte gRecvCmds
_0804FF38: .4byte 0x00005432
_0804FF3C:
	cmp r2, 0x3C
	bls _0804FF50
	ldr r1, _0804FF48
	ldr r0, _0804FF4C
	b _0804FF60
	.align 2, 0
_0804FF48: .4byte gRecvCmds
_0804FF4C: .4byte 0x00004523
_0804FF50:
	adds r0, r2, 0
	subs r0, 0x38
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0804FF62
	ldr r1, _0804FF7C
	ldr r0, _0804FF80
_0804FF60:
	strh r0, [r1, 0x16]
_0804FF62:
	cmp r2, 0x4
	bhi _0804FF6E
	movs r0, 0x3
	movs r1, 0x5
	bl sub_804F890
_0804FF6E:
	ldr r0, _0804FF84
	adds r1, r6, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	b _0804FFA8
	.align 2, 0
_0804FF7C: .4byte gRecvCmds
_0804FF80: .4byte 0x00005432
_0804FF84: .4byte gTasks
_0804FF88:
	ldr r0, _0804FF94
	ldr r1, _0804FF98
	strh r1, [r0, 0x16]
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _0804FFAA
	.align 2, 0
_0804FF94: .4byte gRecvCmds
_0804FF98: .4byte 0x00004523
_0804FF9C:
	ldr r0, _0804FFB0
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	movs r0, 0
_0804FFA8:
	strh r0, [r1, 0x8]
_0804FFAA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804FFB0: .4byte gTasks
	thumb_func_end sub_804FB1C

	thumb_func_start sub_804FC48
sub_804FC48: @ 804FFB4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	mov r8, r7
	lsls r1, 24
	ldr r0, _08050028
	ldr r4, _0805002C
	lsrs r1, 23
	adds r2, r1, r4
	ldrb r6, [r2]
	ldr r5, _08050030
	adds r2, r1, r5
	movs r3, 0
	ldrsb r3, [r2, r3]
	lsls r2, r3, 2
	adds r2, r3
	lsls r2, 1
	subs r6, r2
	adds r4, 0x1
	adds r4, r1, r4
	ldrb r2, [r4]
	adds r5, 0x1
	adds r1, r5
	movs r3, 0
	ldrsb r3, [r1, r3]
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 1
	subs r2, r1
	adds r1, r6, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _08050034
	cmp r7, r0
	bne _08050040
	lsls r4, r1, 4
	adds r4, r1
	lsls r4, 2
	ldr r5, _08050038
	adds r0, r4, r5
	movs r1, 0x2
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _0805003C
	str r0, [r4]
	movs r0, 0x28
	bl PlaySE
	b _08050084
	.align 2, 0
_08050028: .4byte gSpriteTemplate_821645C
_0805002C: .4byte gUnknown_082162E4
_08050030: .4byte gUnknown_082162CC
_08050034: .4byte 0x00004523
_08050038: .4byte gSprites
_0805003C: .4byte sub_8051684
_08050040:
	ldr r0, _08050060
	cmp r7, r0
	bne _08050068
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08050064
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	movs r0, 0x1F
	bl PlaySE
	b _08050084
	.align 2, 0
_08050060: .4byte 0x00005432
_08050064: .4byte gSprites
_08050068:
	ldr r0, _08050094
	cmp r8, r0
	bne _08050084
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	ldr r1, _08050098
	adds r0, r1
	movs r1, 0x1
	bl StartSpriteAnim
	movs r0, 0x20
	bl PlaySE
_08050084:
	bl sub_805156C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050094: .4byte 0x00002345
_08050098: .4byte gSprites
	thumb_func_end sub_804FC48

	thumb_func_start sub_804FD30
sub_804FD30: @ 805009C
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r5, r4, 0
	bl sub_804E290
	ldr r0, _080500BC
	cmp r4, r0
	beq _080500D0
	cmp r4, r0
	bgt _080500C4
	ldr r0, _080500C0
	cmp r4, r0
	beq _080501A0
	b _080501CC
	.align 2, 0
_080500BC: .4byte 0x00004523
_080500C0: .4byte 0x00002345
_080500C4:
	ldr r0, _080500CC
	cmp r5, r0
	beq _08050168
	b _080501CC
	.align 2, 0
_080500CC: .4byte 0x00005432
_080500D0:
	ldr r7, _08050100
	ldr r4, [r7]
	adds r5, r4, 0
	adds r5, 0x56
	ldrh r6, [r5]
	movs r0, 0
	ldrsh r1, [r5, r0]
	ldr r0, _08050104
	cmp r1, r0
	bgt _0805010C
	ldr r1, _08050108
	adds r0, r4, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0xC0
	lsls r0, 1
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	b _080501CC
	.align 2, 0
_08050100: .4byte gUnknown_03004854
_08050104: .4byte 0x000005db
_08050108: .4byte gUnknown_082165DA
_0805010C:
	ldr r1, _08050164
	adds r0, r4, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	bl __divsi3
	adds r0, r6, r0
	strh r0, [r5]
	movs r1, 0xA2
	lsls r1, 1
	adds r4, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	subs r1, 0xA
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8051AC8
	ldr r0, [r7]
	movs r1, 0xA3
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	subs r1, 0xA
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_8051AC8
	b _080501CC
	.align 2, 0
_08050164: .4byte gUnknown_082165DA
_08050168:
	ldr r0, _08050194
	ldr r2, [r0]
	adds r4, r2, 0
	adds r4, 0x56
	ldrh r5, [r4]
	movs r0, 0
	ldrsh r1, [r4, r0]
	ldr r0, _08050198
	cmp r1, r0
	bgt _080501CC
	ldr r1, _0805019C
	adds r0, r2, 0
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	bl __divsi3
	adds r0, r5, r0
	b _080501CA
	.align 2, 0
_08050194: .4byte gUnknown_03004854
_08050198: .4byte 0x000005db
_0805019C: .4byte gUnknown_082165DA
_080501A0:
	ldr r0, _080501D4
	ldr r0, [r0]
	adds r4, r0, 0
	adds r4, 0x56
	ldr r1, _080501D8
	adds r0, 0x88
	ldrb r0, [r0]
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x80
	lsls r0, 1
	bl __divsi3
	ldrh r1, [r4]
	subs r1, r0
	strh r1, [r4]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x7F
	bgt _080501CC
	movs r0, 0x80
_080501CA:
	strh r0, [r4]
_080501CC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080501D4: .4byte gUnknown_03004854
_080501D8: .4byte gUnknown_082165DA
	thumb_func_end sub_804FD30

	thumb_func_start sub_804FE70
sub_804FE70: @ 80501DC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080502AC
	ldrh r0, [r0]
	cmp r0, 0
	beq _08050222
	ldr r3, _080502B0
	ldrh r0, [r3, 0x4]
	ldr r2, _080502B4
	cmp r0, 0
	beq _08050204
	movs r1, 0
	strh r0, [r2, 0x10]
	ldr r0, _080502B8
	strh r0, [r2]
	strh r1, [r3, 0x4]
_08050204:
	ldr r0, _080502B4
	ldr r3, _080502B8
	adds r1, r2, 0x2
	adds r2, r0, 0
	adds r2, 0x12
	movs r6, 0x2
_08050210:
	ldrh r0, [r2]
	cmp r0, 0
	beq _08050218
	strh r3, [r1]
_08050218:
	adds r1, 0x2
	adds r2, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050210
_08050222:
	movs r6, 0
	ldr r7, _080502BC
	adds r1, r7, 0
	ldr r0, [r1]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	blt _08050234
	b _080503C8
_08050234:
	movs r2, 0
	str r2, [sp]
	mov r9, r2
	ldr r0, _080502B4
	adds r0, 0x10
	mov r8, r0
	ldr r1, _080502C0
	mov r10, r1
_08050244:
	ldr r2, [sp]
	ldr r1, _080502B4
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, _080502B8
	cmp r1, r0
	beq _08050254
	b _080503AA
_08050254:
	ldr r0, [r7]
	adds r0, 0xA2
	adds r0, r2
	ldrh r5, [r0]
	mov r2, r8
	ldrh r4, [r2]
	ldr r0, _080502C4
	cmp r4, r0
	bne _080502CC
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0x9F
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x37
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, 16
	ldr r0, _080502C8
	cmp r1, r0
	bls _08050292
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4]
_08050292:
	lsls r1, r5, 24
	lsrs r1, 24
	ldr r0, _080502C4
	bl sub_804FC48
	ldr r1, [r7]
	movs r0, 0xA6
	lsls r0, 1
	adds r1, r0
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _08050336
	.align 2, 0
_080502AC: .4byte gSpecialVar_0x8004
_080502B0: .4byte gSendCmd
_080502B4: .4byte gRecvCmds
_080502B8: .4byte 0x00004444
_080502BC: .4byte gUnknown_03004854
_080502C0: .4byte 0x00005432
_080502C4: .4byte 0x00004523
_080502C8: .4byte 0x03e70000
_080502CC:
	cmp r4, r10
	bne _0805030A
	mov r0, r10
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0x9F
	lsls r1, 1
	adds r4, r0, r1
	adds r0, 0x56
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x46
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r0
	strh r1, [r4]
	lsls r1, r5, 24
	lsrs r1, 24
	mov r0, r10
	bl sub_804FC48
	ldr r1, [r7]
	movs r0, 0xA7
	lsls r0, 1
	adds r1, r0
	add r1, r9
	ldrh r0, [r1]
	adds r0, 0x1
	b _08050336
_0805030A:
	ldr r0, _08050384
	cmp r4, r0
	bne _08050342
	lsls r1, r5, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_804FC48
	adds r0, r4, 0
	bl sub_804FD30
	ldr r0, [r7]
	movs r1, 0xA8
	lsls r1, 1
	adds r0, r1
	mov r2, r9
	adds r1, r0, r2
	ldrh r2, [r1]
	ldr r0, _08050388
	cmp r2, r0
	bhi _08050338
	adds r0, r2, 0x1
_08050336:
	strh r0, [r1]
_08050338:
	mov r0, r8
	ldrh r1, [r0]
	ldr r0, _08050384
	cmp r1, r0
	beq _08050350
_08050342:
	mov r1, r8
	ldrh r0, [r1]
	ldr r2, _0805038C
	cmp r0, r2
	beq _08050350
	cmp r0, r10
	bne _080503AA
_08050350:
	ldr r0, _08050390
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0x56
	movs r0, 0
	ldrsh r1, [r2, r0]
	ldr r0, _08050394
	cmp r1, r0
	ble _080503A0
	adds r0, r1, 0
	ldr r2, _08050398
	adds r0, r2
	movs r1, 0x14
	bl __divsi3
	adds r1, r0, 0
	movs r0, 0x80
	lsls r0, 1
	adds r1, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _0805039C
	bl m4aMPlayTempoControl
	b _080503AA
	.align 2, 0
_08050384: .4byte 0x00002345
_08050388: .4byte 0x000003e6
_0805038C: .4byte 0x00004523
_08050390: .4byte gUnknown_03004854
_08050394: .4byte 0x000005dc
_08050398: .4byte 0xfffffd12
_0805039C: .4byte gMPlay_BGM
_080503A0:
	ldr r0, _08050404
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
_080503AA:
	ldr r1, [sp]
	adds r1, 0x2
	str r1, [sp]
	movs r2, 0x6
	add r9, r2
	movs r0, 0x2
	add r8, r0
	adds r6, 0x1
	ldr r7, _08050408
	ldr r0, [r7]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bge _080503C8
	b _08050244
_080503C8:
	ldr r0, _0805040C
	ldrh r0, [r0]
	cmp r0, 0
	beq _080503F4
	movs r6, 0
	ldr r3, _08050408
	ldr r0, [r3]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bge _080503F4
	movs r2, 0
	ldr r1, _08050410
_080503E2:
	strh r2, [r1]
	strh r2, [r1, 0x10]
	adds r1, 0x2
	adds r6, 0x1
	ldr r0, [r3]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	blt _080503E2
_080503F4:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050404: .4byte gMPlay_BGM
_08050408: .4byte gUnknown_03004854
_0805040C: .4byte gSpecialVar_0x8004
_08050410: .4byte gRecvCmds
	thumb_func_end sub_804FE70

	thumb_func_start sub_80500A8
sub_80500A8: @ 8050414
	push {r4-r6,lr}
	movs r6, 0
	ldr r5, _08050458
	ldr r4, [r5]
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 23
	adds r4, 0xA2
	adds r4, r0
	ldrb r3, [r4]
	ldr r0, [r5]
	adds r0, 0x6F
	ldrb r0, [r0]
	cmp r0, 0
	bne _080504F6
	ldr r0, _0805045C
	ldrb r0, [r0, 0x13]
	cmp r0, 0x2
	bne _08050468
	ldr r2, _08050460
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08050476
	ldrh r0, [r2, 0x28]
	ldr r1, _08050464
	bics r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r6, r0, 31
	b _08050476
	.align 2, 0
_08050458: .4byte gUnknown_03004854
_0805045C: .4byte gSaveBlock2
_08050460: .4byte gMain
_08050464: .4byte 0x00000201
_08050468:
	ldr r0, _080504C8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08050476
	movs r6, 0x1
_08050476:
	cmp r6, 0
	beq _080504F6
	ldr r4, _080504CC
	ldr r1, [r4]
	lsls r2, r3, 1
	adds r0, r1, 0
	adds r0, 0x9A
	adds r0, r2
	adds r1, 0x5C
	ldrh r0, [r0]
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080504D0
	adds r0, r1
	adds r1, r3, 0x4
	lsls r1, 24
	lsrs r1, 24
	bl StartSpriteAnim
	ldr r0, [r4]
	adds r0, 0x54
	ldrh r4, [r0]
	bl GetMultiplayerId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl task_tutorial_oak_boy_girl
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _080504DC
	ldr r1, _080504D4
	ldr r0, _080504D8
	b _080504F4
	.align 2, 0
_080504C8: .4byte gMain
_080504CC: .4byte gUnknown_03004854
_080504D0: .4byte gSprites
_080504D4: .4byte gSendCmd
_080504D8: .4byte 0x00004523
_080504DC:
	cmp r0, 0x1
	bne _080504F0
	ldr r1, _080504E8
	ldr r0, _080504EC
	b _080504F4
	.align 2, 0
_080504E8: .4byte gSendCmd
_080504EC: .4byte 0x00005432
_080504F0:
	ldr r1, _08050550
	ldr r0, _08050554
_080504F4:
	strh r0, [r1, 0x4]
_080504F6:
	ldr r2, _08050558
	ldr r1, [r2]
	adds r1, 0x7E
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bls _08050526
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x56
	ldrh r3, [r1]
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0x80
	ble _0805051E
	subs r0, r3, 0x1
	strh r0, [r1]
_0805051E:
	ldr r0, [r2]
	adds r0, 0x7E
	movs r1, 0
	strb r1, [r0]
_08050526:
	ldr r0, _0805055C
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805054A
	ldr r0, _08050560
	ldrh r1, [r0, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _0805054A
	ldr r0, [r2]
	ldr r1, _08050564
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, 0x1
	eors r0, r1
	strb r0, [r2]
_0805054A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050550: .4byte gSendCmd
_08050554: .4byte 0x00002345
_08050558: .4byte gUnknown_03004854
_0805055C: .4byte gUnknown_020297ED
_08050560: .4byte gMain
_08050564: .4byte 0x0000014b
	thumb_func_end sub_80500A8

	thumb_func_start sub_80501FC
sub_80501FC: @ 8050568
	push {r4-r6,lr}
	bl sub_8051474
	ldr r4, _08050600
	ldr r0, [r4]
	movs r1, 0x96
	lsls r1, 1
	adds r2, r0, r1
	ldr r1, [r2]
	ldr r0, _08050604
	cmp r1, r0
	bhi _08050584
	adds r0, r1, 0x1
	str r0, [r2]
_08050584:
	bl sub_80500A8
	ldr r1, [r4]
	adds r0, r1, 0
	adds r0, 0x56
	ldrh r0, [r0]
	movs r5, 0x9F
	lsls r5, 1
	adds r1, r5
	ldrh r1, [r1]
	bl SetLinkDebugValues
	bl sub_804FE70
	ldr r0, [r4]
	adds r0, r5
	ldrh r0, [r0]
	movs r6, 0xFA
	lsls r6, 2
	adds r1, r6, 0
	bl sub_805194C
	ldr r0, [r4]
	adds r0, 0x56
	ldrh r0, [r0]
	bl sub_8051A3C
	bl sub_8051B18
	bl sub_805123C
	ldr r2, [r4]
	adds r3, r2, 0
	adds r3, 0x6F
	ldrb r0, [r3]
	cmp r0, 0
	bne _080505EA
	movs r1, 0xA0
	lsls r1, 1
	adds r0, r2, r1
	ldrh r1, [r0]
	ldr r0, _08050608
	cmp r1, r0
	bls _080505EA
	adds r0, r2, r5
	strh r6, [r0]
	movs r0, 0x1
	strb r0, [r3]
	ldr r0, _0805060C
	bl SetMainCallback2
_080505EA:
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050600: .4byte gUnknown_03004854
_08050604: .4byte 0x00057e03
_08050608: .4byte 0x000003e7
_0805060C: .4byte sub_8050954
	thumb_func_end sub_80501FC

	thumb_func_start help_system_is_not_first_time
help_system_is_not_first_time: @ 8050610
	push {r4,r5,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r1, 20
	adds r4, r1, r0
	lsrs r2, 20
	adds r5, r2, r0
	ldrh r0, [r4]
	ldrh r1, [r5]
	cmp r0, r1
	bne _0805064E
	adds r0, r4, 0x2
	adds r1, r5, 0x2
	bl StringCompare
	cmp r0, 0
	bne _0805065C
	ldr r0, [r4, 0x8]
	ldr r2, _08050654
	ands r0, r2
	ldr r1, [r5, 0x8]
	ands r1, r2
	cmp r0, r1
	bne _0805065C
	ldr r0, [r4, 0xC]
	ldr r2, _08050658
	ands r0, r2
	ldr r1, [r5, 0xC]
	ands r1, r2
	cmp r0, r1
	bne _0805065C
_0805064E:
	movs r0, 0x1
	b _0805065E
	.align 2, 0
_08050654: .4byte 0xffffff00
_08050658: .4byte 0x00ffffff
_0805065C:
	movs r0, 0
_0805065E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end help_system_is_not_first_time

	thumb_func_start sub_80502F8
sub_80502F8: @ 8050664
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	mov r10, r0
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0x10]
	lsls r3, 24
	lsrs r3, 24
	mov r2, sp
	movs r4, 0x5
_08050680:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08050680
	movs r6, 0
	mov r1, sp
	movs r4, 0x4
_08050694:
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0805069E
	adds r6, 0x1
_0805069E:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08050694
	cmp r6, 0x5
	beq _080506F2
	cmp r3, 0x3
	bhi _080506F2
	movs r4, 0
	ldr r3, [sp, 0x10]
	cmp r4, r3
	bge _0805070A
	mov r3, r10
_080506B8:
	movs r6, 0
	ldr r7, [sp, 0x10]
	cmp r6, r7
	bge _08050700
	mov r9, r3
	mov r5, r10
	lsls r0, r4, 24
	mov r8, r0
_080506C8:
	mov r1, r9
	ldrh r0, [r1]
	ldrh r2, [r5]
	cmp r0, r2
	bne _080506F6
	cmp r4, r6
	beq _080506F6
	cmp r0, 0xAF
	bne _080506F2
	lsls r2, r6, 24
	lsrs r2, 24
	mov r0, r10
	mov r7, r8
	lsrs r1, r7, 24
	str r3, [sp, 0xC]
	bl help_system_is_not_first_time
	lsls r0, 24
	ldr r3, [sp, 0xC]
	cmp r0, 0
	beq _080506F6
_080506F2:
	movs r0, 0xC
	b _0805084A
_080506F6:
	adds r5, 0x10
	adds r6, 0x1
	ldr r0, [sp, 0x10]
	cmp r6, r0
	blt _080506C8
_08050700:
	adds r3, 0x10
	adds r4, 0x1
	ldr r1, [sp, 0x10]
	cmp r4, r1
	blt _080506B8
_0805070A:
	movs r2, 0
	mov r1, sp
	movs r4, 0x4
_08050710:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _0805071E
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_0805071E:
	adds r1, 0x2
	subs r4, 0x1
	cmp r4, 0
	bge _08050710
	cmp r2, 0x3
	bls _0805072E
	movs r0, 0xD
	b _0805084A
_0805072E:
	cmp r2, 0x3
	bne _08050736
	movs r0, 0xB
	b _0805084A
_08050736:
	movs r4, 0
	mov r1, sp
_0805073A:
	movs r7, 0
	ldrsh r0, [r1, r7]
	cmp r0, 0x32
	ble _08050744
	b _08050844
_08050744:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _0805073A
	cmp r2, 0x1
	bne _08050796
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	ble _0805075E
	movs r0, 0x1
	b _0805084A
_0805075E:
	mov r0, sp
	ldrh r0, [r0, 0x2]
	lsls r0, 16
	cmp r0, 0
	ble _0805076C
	movs r0, 0x2
	b _0805084A
_0805076C:
	mov r0, sp
	movs r3, 0x4
	ldrsh r0, [r0, r3]
	cmp r0, 0
	ble _0805077A
	movs r0, 0x3
	b _0805084A
_0805077A:
	mov r0, sp
	movs r4, 0x6
	ldrsh r0, [r0, r4]
	cmp r0, 0
	ble _08050788
	movs r0, 0x4
	b _0805084A
_08050788:
	mov r0, sp
	movs r7, 0x8
	ldrsh r0, [r0, r7]
	cmp r0, 0
	ble _08050796
	movs r0, 0x5
	b _0805084A
_08050796:
	cmp r2, 0x2
	bne _08050848
	movs r4, 0
	ldr r5, _080507E0
	mov r1, sp
	adds r2, r5, 0
_080507A2:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _080507AE
	strh r4, [r2]
	adds r2, 0x2
_080507AE:
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x4
	ble _080507A2
	movs r4, 0
	ldrsh r3, [r5, r4]
	lsls r0, r3, 1
	mov r7, sp
	adds r1, r7, r0
	movs r0, 0x2
	ldrsh r2, [r5, r0]
	lsls r0, r2, 1
	add r0, sp
	movs r4, 0
	ldrsh r1, [r1, r4]
	movs r7, 0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	blt _08050804
	adds r0, r3, 0
	cmp r0, 0
	bne _080507E4
	lsls r0, r2, 16
	b _0805080E
	.align 2, 0
_080507E0: .4byte gUnknown_03000520
_080507E4:
	cmp r0, 0x1
	bne _080507EC
	lsls r0, r2, 16
	b _0805081A
_080507EC:
	cmp r0, 0x2
	bne _080507F4
	lsls r0, r2, 16
	b _08050826
_080507F4:
	cmp r0, 0x3
	bne _080507FC
	lsls r0, r2, 16
	b _08050832
_080507FC:
	cmp r0, 0x4
	bne _08050848
	lsls r0, r2, 16
	b _0805083E
_08050804:
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _08050814
	lsls r0, r3, 16
_0805080E:
	movs r1, 0x6
	orrs r0, r1
	b _0805084A
_08050814:
	cmp r0, 0x1
	bne _08050820
	lsls r0, r3, 16
_0805081A:
	movs r1, 0x7
	orrs r0, r1
	b _0805084A
_08050820:
	cmp r0, 0x2
	bne _0805082C
	lsls r0, r3, 16
_08050826:
	movs r1, 0x8
	orrs r0, r1
	b _0805084A
_0805082C:
	cmp r0, 0x3
	bne _08050838
	lsls r0, r3, 16
_08050832:
	movs r1, 0x9
	orrs r0, r1
	b _0805084A
_08050838:
	cmp r0, 0x4
	bne _08050848
	lsls r0, r3, 16
_0805083E:
	movs r1, 0xA
	orrs r0, r1
	b _0805084A
_08050844:
	movs r0, 0xE
	b _0805084A
_08050848:
	movs r0, 0
_0805084A:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80502F8

	thumb_func_start sub_80504F0
sub_80504F0: @ 805085C
	ldr r1, _08050864
	strh r0, [r1]
	bx lr
	.align 2, 0
_08050864: .4byte gUnknown_0300052C
	thumb_func_end sub_80504F0

	thumb_func_start unref_sub_80504FC
unref_sub_80504FC: @ 8050868
	ldr r0, _08050870
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08050870: .4byte gUnknown_0300052C
	thumb_func_end unref_sub_80504FC

	thumb_func_start sub_8050508
sub_8050508: @ 8050874
	ldr r1, _0805087C
	strh r0, [r1]
	bx lr
	.align 2, 0
_0805087C: .4byte gUnknown_0300052E
	thumb_func_end sub_8050508

	thumb_func_start unref_sub_8050514
unref_sub_8050514: @ 8050880
	ldr r0, _08050888
	movs r1, 0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_08050888: .4byte gUnknown_0300052E
	thumb_func_end unref_sub_8050514

	thumb_func_start sub_8050520
sub_8050520: @ 805088C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	str r0, [sp]
	mov r8, r1
	str r3, [sp, 0x4]
	ldr r0, [sp, 0x30]
	lsls r2, 24
	lsrs r2, 24
	mov r9, r2
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldr r7, _08050948
	adds r2, r7, 0
	movs r1, 0
	adds r0, r7, 0
	adds r0, 0xA
_080508B6:
	strh r1, [r0]
	subs r0, 0x2
	cmp r0, r2
	bge _080508B6
	movs r6, 0
	cmp r6, r9
	bge _080508EC
	ldr r0, _08050948
	mov r12, r0
	ldr r5, [sp]
	adds r5, 0x9
_080508CC:
	movs r3, 0
	adds r4, r5, 0
	mov r2, r12
_080508D2:
	adds r1, r4, r3
	ldrh r0, [r2]
	ldrb r1, [r1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	adds r3, 0x1
	cmp r3, 0x5
	ble _080508D2
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r9
	blt _080508CC
_080508EC:
	movs r1, 0
	ldrsh r3, [r7, r1]
	ldrh r0, [r7]
	ldrh r1, [r7, 0x2]
	subs r0, r1
	strh r0, [r7]
	ldrh r0, [r7, 0x4]
	subs r1, r0
	strh r1, [r7, 0x2]
	ldrh r1, [r7, 0x6]
	subs r0, r1
	strh r0, [r7, 0x4]
	ldrh r0, [r7, 0x8]
	subs r1, r0
	strh r1, [r7, 0x6]
	subs r0, r3
	strh r0, [r7, 0x8]
	movs r3, 0
	movs r2, 0
	adds r1, r7, 0
	movs r6, 0x4
_08050916:
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, 0
	bge _08050922
	strh r2, [r1]
	adds r3, 0x1
_08050922:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050916
	lsls r0, r3, 24
	lsrs r0, 24
	mov r10, r0
	movs r4, 0
	ldr r1, _08050948
	movs r6, 0x4
_08050936:
	ldrh r2, [r1]
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0
	ble _08050950
	cmp r0, r3
	bge _0805094C
	strh r4, [r1]
	b _08050950
	.align 2, 0
_08050948: .4byte gUnknown_03000510
_0805094C:
	subs r0, r2, r3
	strh r0, [r1]
_08050950:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050936
	ldr r1, _08050A30
	ldr r2, _08050A34
	movs r6, 0x4
_0805095E:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _0805095E
	ldr r1, _08050A38
	ldr r0, [sp, 0x8]
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	adds r3, 0x64
	ldr r4, _08050A3C
	str r3, [r4]
	movs r6, 0x4
_08050982:
	movs r0, 0
	ldrsh r5, [r7, r0]
	adds r0, r5, 0
	muls r0, r3
	movs r1, 0xA
	str r3, [sp, 0xC]
	bl __divsi3
	adds r5, r0, 0
	movs r1, 0xA
	bl __modsi3
	adds r4, r0, 0
	adds r0, r5, 0
	movs r1, 0xA
	bl __divsi3
	adds r5, r0, 0
	ldr r3, [sp, 0xC]
	cmp r4, 0x4
	ble _080509AE
	adds r5, 0x1
_080509AE:
	strh r5, [r7]
	adds r7, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050982
	ldr r1, _08050A30
	ldr r2, _08050A40
	movs r6, 0x4
_080509BE:
	movs r3, 0
	ldrsh r0, [r1, r3]
	stm r2!, {r0}
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080509BE
	ldr r4, _08050A30
	ldr r0, [sp]
	adds r1, r4, 0
	mov r2, r9
	mov r3, r10
	bl sub_80502F8
	mov r5, r8
	strb r0, [r5]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	mov r1, r9
	bl __divsi3
	mov r3, r9
	subs r0, r3
	strh r0, [r4, 0xA]
	lsls r0, 16
	cmp r0, 0
	bge _080509F8
	movs r0, 0
	strh r0, [r4, 0xA]
_080509F8:
	mov r5, r8
	ldrb r0, [r5]
	cmp r0, 0xC
	bne _08050A52
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r3, r0, 16
	movs r6, 0
	ldr r0, _08050A44
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, r4, 0
	movs r4, 0x1
	movs r3, 0x2
_08050A20:
	adds r2, r0, 0
	asrs r2, r6
	ands r2, r4
	cmp r2, 0
	beq _08050A48
	strh r3, [r1]
	b _08050A4A
	.align 2, 0
_08050A30: .4byte gUnknown_03000510
_08050A34: .4byte gUnknown_03000530
_08050A38: .4byte 0x0000014d
_08050A3C: .4byte gUnknown_0300055C
_08050A40: .4byte gUnknown_03000548
_08050A44: .4byte gUnknown_082165DF
_08050A48:
	strh r2, [r1]
_08050A4A:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x4
	ble _08050A20
_08050A52:
	ldr r7, _08050AAC
	movs r2, 0xFF
	adds r1, r7, 0
	movs r6, 0x5
_08050A5A:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0xFF
	ble _08050A64
	strh r2, [r1]
_08050A64:
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _08050A5A
	ldrh r0, [r7]
	mov r4, r8
	strb r0, [r4, 0x1]
	ldrh r0, [r7, 0x2]
	strb r0, [r4, 0x2]
	ldrh r0, [r7, 0x4]
	strb r0, [r4, 0x3]
	ldrh r0, [r7, 0x6]
	strb r0, [r4, 0x4]
	ldrh r0, [r7, 0x8]
	strb r0, [r4, 0x5]
	ldrh r0, [r7, 0xA]
	strb r0, [r4, 0x6]
	movs r6, 0
	adds r2, r7, 0
_08050A8A:
	ldr r5, [sp, 0x4]
	adds r1, r5, r6
	ldrh r0, [r2]
	strb r0, [r1]
	adds r2, 0x2
	adds r6, 0x1
	cmp r6, 0x5
	ble _08050A8A
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050AAC: .4byte gUnknown_03000510
	thumb_func_end sub_8050520

	thumb_func_start sub_8050744
sub_8050744: @ 8050AB0
	push {r4,lr}
	sub sp, 0x4
	ldr r4, [sp, 0xC]
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 16
	lsrs r4, 16
	str r4, [sp]
	bl sub_8050520
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8050744

	thumb_func_start sub_8050760
sub_8050760: @ 8050ACC
	push {r4-r6,lr}
	ldr r0, _08050AEC
	ldr r0, [r0]
	movs r2, 0x96
	lsls r2, 1
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, 0x5A
	ldrh r4, [r0]
	movs r2, 0
	ldr r5, _08050AF0
	cmp r1, r5
	bhi _08050AF4
	movs r2, 0x5
	b _08050B46
	.align 2, 0
_08050AEC: .4byte gUnknown_03004854
_08050AF0: .4byte 0x00000383
_08050AF4:
	ldr r3, _08050B08
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	ldr r3, _08050B0C
	cmp r0, r3
	bhi _08050B10
	movs r2, 0x4
	b _08050B46
	.align 2, 0
_08050B08: .4byte 0xfffffc7c
_08050B0C: .4byte 0x00000257
_08050B10:
	ldr r6, _08050B20
	adds r0, r1, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r3
	bhi _08050B24
	movs r2, 0x3
	b _08050B46
	.align 2, 0
_08050B20: .4byte 0xfffffa24
_08050B24:
	ldr r3, _08050B34
	adds r0, r1, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, r5
	bhi _08050B38
	movs r2, 0x2
	b _08050B46
	.align 2, 0
_08050B34: .4byte 0xfffff7cc
_08050B38:
	ldr r6, _08050B64
	adds r0, r1, r6
	lsls r0, 16
	ldr r1, _08050B68
	cmp r0, r1
	bhi _08050B46
	movs r2, 0x1
_08050B46:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_8050508
	movs r2, 0
	cmp r4, 0x40
	bhi _08050C28
	adds r0, r4, 0
	subs r0, 0x32
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050B70
	ldr r2, _08050B6C
	b _08050C28
	.align 2, 0
_08050B64: .4byte 0xfffff31c
_08050B68: .4byte 0x012b0000
_08050B6C: .4byte 0x0000ffff
_08050B70:
	adds r0, r4, 0
	subs r0, 0x64
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050B84
	ldr r2, _08050B80
	b _08050C28
	.align 2, 0
_08050B80: .4byte 0x0000fffe
_08050B84:
	adds r0, r4, 0
	subs r0, 0x96
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050B98
	ldr r2, _08050B94
	b _08050C28
	.align 2, 0
_08050B94: .4byte 0x0000fffd
_08050B98:
	adds r0, r4, 0
	subs r0, 0xC8
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050BAC
	ldr r2, _08050BA8
	b _08050C28
	.align 2, 0
_08050BA8: .4byte 0x0000fffc
_08050BAC:
	adds r0, r4, 0
	subs r0, 0xFA
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050BC0
	ldr r2, _08050BBC
	b _08050C28
	.align 2, 0
_08050BBC: .4byte 0x0000fffb
_08050BC0:
	ldr r1, _08050BD0
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050BD8
	ldr r2, _08050BD4
	b _08050C28
	.align 2, 0
_08050BD0: .4byte 0xfffffea2
_08050BD4: .4byte 0x0000fffa
_08050BD8:
	ldr r3, _08050BE8
	adds r0, r4, r3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050BF0
	ldr r2, _08050BEC
	b _08050C28
	.align 2, 0
_08050BE8: .4byte 0xfffffe70
_08050BEC: .4byte 0x0000fff9
_08050BF0:
	ldr r6, _08050C00
	adds r0, r4, r6
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050C08
	ldr r2, _08050C04
	b _08050C28
	.align 2, 0
_08050C00: .4byte 0xfffffe0c
_08050C04: .4byte 0x0000fff8
_08050C08:
	ldr r1, _08050C18
	adds r0, r4, r1
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x31
	bhi _08050C20
	ldr r2, _08050C1C
	b _08050C28
	.align 2, 0
_08050C18: .4byte 0xfffffdda
_08050C1C: .4byte 0x0000fff7
_08050C20:
	ldr r0, _08050C38
	cmp r4, r0
	bls _08050C28
	ldr r2, _08050C3C
_08050C28:
	lsls r0, r2, 16
	asrs r0, 16
	bl sub_80504F0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050C38: .4byte 0x00000257
_08050C3C: .4byte 0x0000fff6
	thumb_func_end sub_8050760

	thumb_func_start sub_80508D4
sub_80508D4: @ 8050C40
	push {lr}
	ldr r2, _08050C64
	ldr r1, [r2]
	adds r1, 0xAA
	strb r0, [r1]
	ldr r0, [r2]
	adds r0, 0xAA
	ldrb r1, [r0]
	lsls r1, 28
	movs r0, 0x90
	lsls r0, 23
	adds r1, r0
	lsrs r1, 24
	movs r0, 0xC0
	bl sub_814A880
	pop {r0}
	bx r0
	.align 2, 0
_08050C64: .4byte gUnknown_03004854
	thumb_func_end sub_80508D4

	thumb_func_start sub_80508FC
sub_80508FC: @ 8050C68
	push {r4,lr}
	sub sp, 0x4
	ldr r4, _08050CB0
	ldr r0, [r4]
	adds r0, 0xAA
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r1, _08050CB4
	ldr r3, _08050CB8
	movs r0, 0x20
	str r0, [sp]
	movs r0, 0
	movs r2, 0xC
	bl sub_814A5C0
	ldr r0, _08050CBC
	movs r1, 0x18
	movs r2, 0x9
	bl MenuPrint
	ldr r0, [r4]
	adds r0, 0xAA
	ldrb r0, [r0]
	bl sub_80508D4
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050CB0: .4byte gUnknown_03004854
_08050CB4: .4byte 0x0000ffff
_08050CB8: .4byte 0x00002d9f
_08050CBC: .4byte gOtherText_YesNoTerminating
	thumb_func_end sub_80508FC

	thumb_func_start sub_8050954
sub_8050954: @ 8050CC0
	push {r4-r7,lr}
	bl sub_8051474
	bl GetMultiplayerId
	ldr r0, _08050CE4
	ldr r0, [r0]
	adds r0, 0x6F
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r0, 0xC
	bls _08050CDA
	b _08051022
_08050CDA:
	lsls r0, 2
	ldr r1, _08050CE8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050CE4: .4byte gUnknown_03004854
_08050CE8: .4byte _08050CEC
	.align 2, 0
_08050CEC:
	.4byte _08050D20
	.4byte _08050D64
	.4byte _08050DB8
	.4byte _08050E00
	.4byte _08050E3C
	.4byte _08050E4A
	.4byte _08050E74
	.4byte _08050EA0
	.4byte _08050EAE
	.4byte _08050EC4
	.4byte _08050F4C
	.4byte _08050FD0
	.4byte _08051004
_08050D20:
	bl ClearLinkCallback
	ldr r0, _08050D34
	movs r1, 0x80
	lsls r1, 1
	bl m4aMPlayTempoControl
	movs r4, 0
	b _08050D50
	.align 2, 0
_08050D34: .4byte gMPlay_BGM
_08050D38:
	ldr r0, _08050D5C
	ldr r0, [r0]
	movs r1, 0xA4
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrb r0, [r0]
	bl DestroyTask
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_08050D50:
	ldr r0, _08050D60
	ldrh r0, [r0]
	cmp r4, r0
	bcc _08050D38
	b _08050FEE
	.align 2, 0
_08050D5C: .4byte gUnknown_03004854
_08050D60: .4byte gSpecialVar_0x8004
_08050D64:
	ldr r1, _08050D90
	ldr r3, [r1]
	adds r2, r3, 0
	adds r2, 0x56
	ldrh r0, [r2]
	subs r0, 0x20
	strh r0, [r2]
	lsls r0, 16
	adds r4, r1, 0
	cmp r0, 0
	bgt _08050DAC
	movs r0, 0
	strh r0, [r2]
	ldr r0, _08050D94
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050D98
	adds r1, r3, 0
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	b _08050D9E
	.align 2, 0
_08050D90: .4byte gUnknown_03004854
_08050D94: .4byte gReceivedRemoteLinkPlayers
_08050D98:
	adds r1, r3, 0
	adds r1, 0x6F
	movs r0, 0x5
_08050D9E:
	strb r0, [r1]
	ldr r0, [r4]
	movs r1, 0
	strb r1, [r0]
	ldr r0, _08050DB4
	bl m4aMPlayStop
_08050DAC:
	bl sub_804E290
	b _08051022
	.align 2, 0
_08050DB4: .4byte gMPlay_SE2
_08050DB8:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _08050DC4
	b _08050FEE
_08050DC4:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	bne _08050DD0
	b _08051022
_08050DD0:
	ldr r4, _08050DFC
	ldr r3, [r4]
	movs r2, 0xDE
	lsls r2, 1
	adds r1, r3, r2
	movs r5, 0x96
	lsls r5, 1
	adds r0, r3, r5
	ldr r0, [r0]
	str r0, [r1]
	adds r0, r3, 0
	adds r0, 0x5A
	ldrh r2, [r0]
	adds r5, 0x94
	adds r0, r3, r5
	strh r2, [r0]
	movs r0, 0
	movs r2, 0x28
	bl SendBlock
	ldr r1, [r4]
	b _08050FF2
	.align 2, 0
_08050DFC: .4byte gUnknown_03004854
_08050E00:
	bl GetBlockReceivedStatus
	lsls r0, 24
	cmp r0, 0
	bne _08050E0C
	b _08051022
_08050E0C:
	ldr r2, _08050E34
	ldr r0, _08050E38
	ldr r3, [r0]
	ldrh r0, [r2, 0x4]
	adds r1, r3, 0
	adds r1, 0x5A
	strh r0, [r1]
	movs r0, 0x96
	lsls r0, 1
	adds r1, r3, r0
	ldr r0, [r2]
	str r0, [r1]
	adds r1, r3, 0
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl ResetBlockReceivedFlags
	b _08051022
	.align 2, 0
_08050E34: .4byte gBlockRecvBuffer
_08050E38: .4byte gUnknown_03004854
_08050E3C:
	bl sub_8052228
	lsls r0, 24
	cmp r0, 0
	bne _08050E48
	b _08051022
_08050E48:
	b _08050FEE
_08050E4A:
	bl sub_8051C58
	lsls r0, 24
	cmp r0, 0
	bne _08050E56
	b _08051022
_08050E56:
	ldr r0, _08050E68
	ldrb r0, [r0]
	cmp r0, 0
	bne _08050E6C
	movs r0, 0x22
	bl sav12_xor_increment
	b _08050FEE
	.align 2, 0
_08050E68: .4byte gUnknown_03004834
_08050E6C:
	movs r0, 0x21
	bl sav12_xor_increment
	b _08050FEE
_08050E74:
	ldr r0, _08050E98
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08050E9C
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _08051022
	.align 2, 0
_08050E98: .4byte gUnknown_03004854
_08050E9C: .4byte gOtherText_BlendAnotherBerryPrompt
_08050EA0:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08050EAC
	b _08051022
_08050EAC:
	b _08050FEE
_08050EAE:
	ldr r4, _08050EC0
	ldr r0, [r4]
	adds r0, 0xAA
	movs r1, 0
	strb r1, [r0]
	bl sub_80508FC
	ldr r1, [r4]
	b _08050FF2
	.align 2, 0
_08050EC0: .4byte gUnknown_03004854
_08050EC4:
	ldr r0, _08050EEC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08050EF4
	ldr r0, _08050EF0
	ldr r0, [r0]
	adds r0, 0xAA
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050EE2
	movs r0, 0x5
	bl PlaySE
_08050EE2:
	movs r0, 0
	bl sub_80508D4
	b _08051022
	.align 2, 0
_08050EEC: .4byte gMain
_08050EF0: .4byte gUnknown_03004854
_08050EF4:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08050F14
	ldr r0, _08050F10
	ldr r0, [r0]
	adds r0, 0xAA
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _08050F40
	movs r0, 0x5
	bl PlaySE
	b _08050F40
	.align 2, 0
_08050F10: .4byte gUnknown_03004854
_08050F14:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08050F24
	movs r0, 0x5
	bl PlaySE
	b _08050FEE
_08050F24:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08050F2E
	b _08051022
_08050F2E:
	movs r0, 0x5
	bl PlaySE
	ldr r0, _08050F48
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08050F40:
	movs r0, 0x1
	bl sub_80508D4
	b _08051022
	.align 2, 0
_08050F48: .4byte gUnknown_03004854
_08050F4C:
	ldr r6, _08050F7C
	movs r7, 0
	ldr r0, _08050F80
	strh r0, [r6]
	ldr r4, _08050F84
	ldr r2, [r4]
	adds r0, r2, 0
	adds r0, 0xAA
	ldrb r5, [r0]
	cmp r5, 0
	bne _08050FBC
	movs r0, 0x4
	bl IsBagPocketNonEmpty
	lsls r0, 24
	cmp r0, 0
	bne _08050F8C
	ldr r0, [r4]
	adds r0, 0x7C
	movs r1, 0x2
	strh r1, [r0]
	ldr r0, _08050F88
	b _08050FB4
	.align 2, 0
_08050F7C: .4byte gSendCmd
_08050F80: .4byte 0x00002fff
_08050F84: .4byte gUnknown_03004854
_08050F88: .4byte 0x00009999
_08050F8C:
	bl sub_810CA00
	lsls r0, 24
	asrs r0, 24
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08050FAC
	ldr r0, [r4]
	adds r0, 0x7C
	movs r1, 0x3
	strh r1, [r0]
	ldr r0, _08050FA8
	b _08050FB4
	.align 2, 0
_08050FA8: .4byte 0x0000aaaa
_08050FAC:
	ldr r0, [r4]
	adds r0, 0x7C
	strh r5, [r0]
	ldr r0, _08050FB8
_08050FB4:
	strh r0, [r6, 0x2]
	b _08050FEE
	.align 2, 0
_08050FB8: .4byte 0x00007779
_08050FBC:
	adds r1, r2, 0
	adds r1, 0x7C
	movs r0, 0x1
	strh r0, [r1]
	ldr r0, _08050FCC
	strh r0, [r6, 0x2]
	subs r1, 0xD
	b _08050FF4
	.align 2, 0
_08050FCC: .4byte 0x00008888
_08050FD0:
	ldr r0, _08050FDC
	ldrb r0, [r0]
	cmp r0, 0
	beq _08050FE4
	ldr r0, _08050FE0
	b _08051010
	.align 2, 0
_08050FDC: .4byte gUnknown_03004834
_08050FE0: .4byte sub_80510E8
_08050FE4:
	ldr r0, _08050FFC
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
_08050FEE:
	ldr r0, _08051000
	ldr r1, [r0]
_08050FF2:
	adds r1, 0x6F
_08050FF4:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08051022
	.align 2, 0
_08050FFC: .4byte gOtherText_LinkStandby3
_08051000: .4byte gUnknown_03004854
_08051004:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08051022
	ldr r0, _0805104C
_08051010:
	bl SetMainCallback2
	ldr r2, _08051050
	ldr r0, [r2]
	adds r0, 0x6F
	movs r1, 0
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0]
_08051022:
	bl sub_8051B18
	ldr r0, _08051050
	ldr r0, [r0]
	adds r0, 0x56
	ldrh r0, [r0]
	bl sub_8051A3C
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805104C: .4byte sub_8050E30
_08051050: .4byte gUnknown_03004854
	thumb_func_end sub_8050954

	thumb_func_start sub_8050CE8
sub_8050CE8: @ 8051054
	push {r4,lr}
	ldr r1, _08051074
	ldr r0, [r1]
	movs r2, 0xE2
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	adds r4, r1, 0
	cmp r0, 0x6
	bls _0805106A
	b _08051194
_0805106A:
	lsls r0, 2
	ldr r1, _08051078
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051074: .4byte gUnknown_03004854
_08051078: .4byte _0805107C
	.align 2, 0
_0805107C:
	.4byte _08051098
	.4byte _080510B0
	.4byte _080510DC
	.4byte _080510EC
	.4byte _08051112
	.4byte _08051158
	.4byte _08051172
_08051098:
	bl sub_80084A4
	ldr r0, _080510AC
	ldr r2, [r0]
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r2, r3
	movs r0, 0x1
	b _08051164
	.align 2, 0
_080510AC: .4byte gUnknown_03004854
_080510B0:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08051194
	ldr r0, _080510D4
	ldr r1, [r0]
	movs r2, 0xE2
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	ldr r1, _080510D8
	movs r0, 0x1
	strb r0, [r1]
	b _08051194
	.align 2, 0
_080510D4: .4byte gUnknown_03004854
_080510D8: .4byte gUnknown_3001BB4
_080510DC:
	bl sub_8125E2C
	ldr r0, _080510E8
	ldr r2, [r0]
	b _0805115A
	.align 2, 0
_080510E8: .4byte gUnknown_03004854
_080510EC:
	ldr r1, [r4]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0xA
	bne _08051194
	bl sub_80084A4
	ldr r1, [r4]
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r3
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	b _08051194
_08051112:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08051194
	bl sub_8125E6C
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _0805113C
	ldr r0, _08051138
	ldr r0, [r0]
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r1
	movs r1, 0x5
	str r1, [r0]
	b _08051194
	.align 2, 0
_08051138: .4byte gUnknown_03004854
_0805113C:
	ldr r0, _08051154
	ldr r1, [r0]
	movs r3, 0x98
	lsls r3, 1
	adds r0, r1, r3
	str r2, [r0]
	movs r0, 0xE2
	lsls r0, 1
	adds r1, r0
	movs r0, 0x3
	str r0, [r1]
	b _08051194
	.align 2, 0
_08051154: .4byte gUnknown_03004854
_08051158:
	ldr r2, [r4]
_0805115A:
	movs r3, 0xE2
	lsls r3, 1
	adds r1, r2, r3
	ldr r0, [r1]
	adds r0, 0x1
_08051164:
	str r0, [r1]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	movs r0, 0
	str r0, [r1]
	b _08051194
_08051172:
	ldr r1, [r4]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x5
	ble _08051194
	ldr r1, _08051190
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08051196
	.align 2, 0
_08051190: .4byte gUnknown_3001BB4
_08051194:
	movs r0, 0
_08051196:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8050CE8

	thumb_func_start sub_8050E30
sub_8050E30: @ 805119C
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r1, _080511BC
	ldr r0, [r1]
	adds r0, 0x6F
	ldrb r0, [r0]
	adds r5, r1, 0
	cmp r0, 0xC
	bls _080511B0
	b _08051418
_080511B0:
	lsls r0, 2
	ldr r1, _080511C0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080511BC: .4byte gUnknown_03004854
_080511C0: .4byte _080511C4
	.align 2, 0
_080511C4:
	.4byte _080511F8
	.4byte _08051244
	.4byte _0805126C
	.4byte _080512C0
	.4byte _080512E0
	.4byte _080512FE
	.4byte _08051328
	.4byte _08051358
	.4byte _08051374
	.4byte _08051384
	.4byte _080513A8
	.4byte _080513E8
	.4byte _0805140A
_080511F8:
	ldr r1, [r5]
	adds r0, r1, 0
	adds r0, 0x70
	ldrh r2, [r0]
	ldr r0, _08051224
	cmp r2, r0
	beq _080512F6
	ldr r0, _08051228
	cmp r2, r0
	beq _0805120E
	b _08051418
_0805120E:
	adds r0, r1, 0
	adds r0, 0x78
	ldrh r2, [r0]
	ldr r0, _0805122C
	cmp r2, r0
	bne _08051230
	adds r1, 0x6F
	movs r0, 0x2
	strb r0, [r1]
	b _08051418
	.align 2, 0
_08051224: .4byte 0x00002222
_08051228: .4byte 0x00001111
_0805122C: .4byte 0x00009999
_08051230:
	ldr r0, _08051240
	cmp r2, r0
	bne _080512F6
	adds r1, 0x6F
	movs r0, 0x1
	strb r0, [r1]
	b _08051418
	.align 2, 0
_08051240: .4byte 0x0000aaaa
_08051244:
	ldr r0, [r5]
	adds r0, 0x6F
	movs r1, 0x3
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _08051264
	ldr r1, _08051268
	b _0805128A
	.align 2, 0
_08051264: .4byte gStringVar4
_08051268: .4byte gOtherText_OtherCaseIsFull
_0805126C:
	ldr r1, [r5]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r4, _080512B4
	ldr r1, _080512B8
_0805128A:
	adds r0, r4, 0
	bl StringCopy
	ldr r0, [r5]
	adds r0, 0x7A
	ldrh r0, [r0]
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	ldr r0, _080512BC
	adds r1, r0
	adds r0, r4, 0
	bl de_sub_8073110
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _08051418
	.align 2, 0
_080512B4: .4byte gStringVar4
_080512B8: .4byte gOtherText_NoBerriesForBlend
_080512BC: .4byte 0x03002988
_080512C0:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _080512CC
	b _08051418
_080512CC:
	ldr r0, _080512DC
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08051400
	.align 2, 0
_080512DC: .4byte gUnknown_03004854
_080512E0:
	ldr r2, [r5]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x3C
	bgt _080512F4
	b _08051418
_080512F4:
	adds r1, r2, 0
_080512F6:
	adds r1, 0x6F
	movs r0, 0x5
	strb r0, [r1]
	b _08051418
_080512FE:
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08051320
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	bl sub_80084A4
	ldr r0, _08051324
	ldr r1, [r0]
	b _08051400
	.align 2, 0
_08051320: .4byte gMultiText_Saving
_08051324: .4byte gUnknown_03004854
_08051328:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08051418
	ldr r3, _08051354
	ldr r1, [r3]
	movs r2, 0x98
	lsls r2, 1
	adds r0, r1, r2
	movs r2, 0
	str r2, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r3]
	movs r1, 0xE2
	lsls r1, 1
	adds r0, r1
	str r2, [r0]
	b _08051418
	.align 2, 0
_08051354: .4byte gUnknown_03004854
_08051358:
	bl sub_8050CE8
	lsls r0, 24
	cmp r0, 0
	beq _08051418
	movs r0, 0x37
	bl PlaySE
	ldr r0, _08051370
	ldr r1, [r0]
	b _08051400
	.align 2, 0
_08051370: .4byte gUnknown_03004854
_08051374:
	ldr r1, [r5]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	bl sub_80084A4
	b _08051418
_08051384:
	bl sub_8007ECC
	lsls r0, 24
	cmp r0, 0
	beq _08051418
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _080513A4
	ldr r1, [r0]
	b _08051400
	.align 2, 0
_080513A4: .4byte gUnknown_03004854
_080513A8:
	ldr r0, _080513D0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0
	bne _08051418
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x70
	ldrh r1, [r0]
	ldr r0, _080513D4
	cmp r1, r0
	bne _080513DC
	ldr r0, _080513D8
	bl SetMainCallback2
	b _08051418
	.align 2, 0
_080513D0: .4byte gPaletteFade
_080513D4: .4byte 0x00002222
_080513D8: .4byte sub_804E538
_080513DC:
	movs r1, 0x98
	lsls r1, 1
	adds r0, r2, r1
	str r3, [r0]
	adds r1, r2, 0
	b _08051400
_080513E8:
	ldr r1, [r5]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x1E
	ble _08051418
	bl sub_800832C
	ldr r1, [r5]
_08051400:
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08051418
_0805140A:
	ldr r0, _08051434
	ldrb r0, [r0]
	cmp r0, 0
	bne _08051418
	ldr r0, _08051438
	bl SetMainCallback2
_08051418:
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051434: .4byte gReceivedRemoteLinkPlayers
_08051438: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_8050E30

	thumb_func_start sub_80510E8
sub_80510E8: @ 805143C
	push {lr}
	ldr r1, _08051458
	ldr r0, [r1]
	adds r0, 0x6F
	ldrb r0, [r0]
	adds r3, r1, 0
	cmp r0, 0xA
	bls _0805144E
	b _08051572
_0805144E:
	lsls r0, 2
	ldr r1, _0805145C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051458: .4byte gUnknown_03004854
_0805145C: .4byte _08051460
	.align 2, 0
_08051460:
	.4byte _0805148C
	.4byte _080514C2
	.4byte _080514E4
	.4byte _08051510
	.4byte _08051572
	.4byte _08051572
	.4byte _08051572
	.4byte _08051572
	.4byte _08051572
	.4byte _0805152C
	.4byte _08051544
_0805148C:
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0x1
	bhi _0805149E
	adds r1, 0x6F
	movs r0, 0x9
	strb r0, [r1]
_0805149E:
	ldr r2, [r3]
	adds r0, r2, 0
	adds r0, 0x7C
	ldrh r1, [r0]
	cmp r1, 0x2
	bne _080514AE
	subs r0, 0xD
	strb r1, [r0]
_080514AE:
	ldr r1, [r3]
	adds r0, r1, 0
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _08051572
	adds r1, 0x6F
	movs r0, 0x1
	strb r0, [r1]
	b _08051572
_080514C2:
	ldr r0, [r3]
	adds r0, 0x6F
	movs r1, 0x3
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080514E0
	b _08051500
	.align 2, 0
_080514E0: .4byte gOtherText_CaseIsFull
_080514E4:
	ldr r0, [r3]
	adds r0, 0x6F
	ldrb r1, [r0]
	adds r1, 0x1
	strb r1, [r0]
	bl sub_814A7FC
	movs r0, 0x17
	movs r1, 0x8
	movs r2, 0x1C
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _0805150C
_08051500:
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	b _08051572
	.align 2, 0
_0805150C: .4byte gOtherText_OutOfBerries
_08051510:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08051572
	ldr r0, _08051528
	ldr r0, [r0]
	adds r0, 0x6F
	movs r1, 0x9
	strb r1, [r0]
	b _08051572
	.align 2, 0
_08051528: .4byte gUnknown_03004854
_0805152C:
	movs r0, 0x3
	bl BeginFastPaletteFade
	ldr r0, _08051540
	ldr r1, [r0]
	adds r1, 0x6F
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08051572
	.align 2, 0
_08051540: .4byte gUnknown_03004854
_08051544:
	ldr r0, _08051564
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08051572
	ldr r0, [r3]
	adds r0, 0x7C
	ldrh r0, [r0]
	cmp r0, 0
	bne _0805156C
	ldr r0, _08051568
	bl SetMainCallback2
	b _08051572
	.align 2, 0
_08051564: .4byte gPaletteFade
_08051568: .4byte sub_804E538
_0805156C:
	ldr r0, _0805158C
	bl SetMainCallback2
_08051572:
	bl sub_805123C
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	.align 2, 0
_0805158C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80510E8

	thumb_func_start sub_805123C
sub_805123C: @ 8051590
	push {r4-r6,lr}
	ldr r0, _080515C0
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805159C
	b _08051758
_0805159C:
	ldr r4, _080515C4
	ldrh r1, [r4]
	ldr r0, _080515C8
	cmp r1, r0
	bne _0805161A
	ldrh r1, [r4, 0x8]
	ldr r0, _080515CC
	cmp r1, r0
	bne _0805160C
	ldrh r3, [r4, 0x10]
	ldr r0, _080515D0
	cmp r3, r0
	beq _080515EC
	cmp r3, r0
	bgt _080515D8
	ldr r0, _080515D4
	b _080515DA
	.align 2, 0
_080515C0: .4byte gReceivedRemoteLinkPlayers
_080515C4: .4byte gRecvCmds
_080515C8: .4byte 0x00002fff
_080515CC: .4byte 0x00001111
_080515D0: .4byte 0x00009999
_080515D4: .4byte 0x00008888
_080515D8:
	ldr r0, _080515E4
_080515DA:
	cmp r3, r0
	beq _080515EC
	ldr r2, _080515E8
	b _080515FC
	.align 2, 0
_080515E4: .4byte 0x0000aaaa
_080515E8: .4byte gUnknown_03004854
_080515EC:
	ldr r2, _08051604
	ldr r0, [r2]
	adds r1, r0, 0
	adds r1, 0x78
	strh r3, [r1]
	ldrh r1, [r4, 0x18]
	adds r0, 0x7A
	strh r1, [r0]
_080515FC:
	ldr r0, [r2]
	adds r0, 0x70
	ldr r1, _08051608
	b _08051618
	.align 2, 0
_08051604: .4byte gUnknown_03004854
_08051608: .4byte 0x00001111
_0805160C:
	ldr r0, _08051648
	cmp r1, r0
	bne _0805161A
	ldr r0, _0805164C
	ldr r0, [r0]
	adds r0, 0x70
_08051618:
	strh r1, [r0]
_0805161A:
	bl GetMultiplayerId
	lsls r0, 24
	cmp r0, 0
	beq _08051626
	b _08051758
_08051626:
	ldr r2, _0805164C
	ldr r0, [r2]
	adds r0, 0x70
	ldrh r1, [r0]
	ldr r0, _08051650
	cmp r1, r0
	bne _08051636
	b _08051758
_08051636:
	ldr r0, _08051648
	cmp r1, r0
	bne _0805163E
	b _08051758
_0805163E:
	movs r4, 0
	ldr r6, _08051654
	adds r5, r2, 0
	b _080516A2
	.align 2, 0
_08051648: .4byte 0x00002222
_0805164C: .4byte gUnknown_03004854
_08051650: .4byte 0x00001111
_08051654: .4byte 0x00002fff
_08051658:
	ldr r1, _0805167C
	lsls r2, r4, 1
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805169C
	adds r0, r1, 0
	adds r0, 0x8
	adds r0, r2, r0
	ldrh r1, [r0]
	ldr r0, _08051680
	cmp r1, r0
	beq _08051694
	cmp r1, r0
	bgt _08051688
	ldr r0, _08051684
	b _08051690
	.align 2, 0
_0805167C: .4byte gRecvCmds
_08051680: .4byte 0x00008888
_08051684: .4byte 0x00007779
_08051688:
	ldr r0, _080516B4
	cmp r1, r0
	beq _08051694
	ldr r0, _080516B8
_08051690:
	cmp r1, r0
	bne _0805169C
_08051694:
	ldr r0, [r5]
	adds r0, 0x70
	adds r0, r2
	strh r1, [r0]
_0805169C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080516A2:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08051658
	movs r4, 0
	b _080516C2
	.align 2, 0
_080516B4: .4byte 0x00009999
_080516B8: .4byte 0x0000aaaa
_080516BC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080516C2:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcs _080516DE
	ldr r0, _080516F0
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _080516BC
_080516DE:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08051758
	movs r4, 0
	ldr r5, _080516F4
	b _080516FE
	.align 2, 0
_080516F0: .4byte gUnknown_03004854
_080516F4: .4byte 0x00007779
_080516F8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080516FE:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcs _0805171A
	ldr r0, _08051734
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r5
	beq _080516F8
_0805171A:
	ldr r5, _08051738
	movs r6, 0
	ldr r0, _0805173C
	strh r0, [r5]
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _08051744
	ldr r0, _08051740
	strh r0, [r5, 0x2]
	b _08051758
	.align 2, 0
_08051734: .4byte gUnknown_03004854
_08051738: .4byte gSendCmd
_0805173C: .4byte 0x00002fff
_08051740: .4byte 0x00002222
_08051744:
	ldr r0, _08051760
	strh r0, [r5, 0x2]
	ldr r0, _08051764
	ldr r0, [r0]
	lsls r1, r4, 1
	adds r0, 0x70
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	strh r4, [r5, 0x6]
_08051758:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051760: .4byte 0x00001111
_08051764: .4byte gUnknown_03004854
	thumb_func_end sub_805123C

	thumb_func_start sub_8051414
sub_8051414: @ 8051768
	push {lr}
	sub sp, 0x14
	adds r1, r0, 0
	movs r0, 0xF0
	lsls r0, 7
	str r0, [sp]
	movs r0, 0xA0
	lsls r0, 7
	str r0, [sp, 0x4]
	mov r3, sp
	ldr r0, _080517C4
	ldr r0, [r0]
	mov r12, r0
	movs r0, 0xA2
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	movs r0, 0x78
	subs r0, r2
	strh r0, [r3, 0x8]
	movs r0, 0xA3
	lsls r0, 1
	add r0, r12
	ldrh r2, [r0]
	movs r0, 0x50
	subs r0, r2
	strh r0, [r3, 0xA]
	mov r2, sp
	movs r3, 0xA1
	lsls r3, 1
	add r3, r12
	ldrh r0, [r3]
	strh r0, [r2, 0xC]
	ldrh r0, [r3]
	strh r0, [r2, 0xE]
	mov r0, r12
	adds r0, 0x54
	ldrh r0, [r0]
	strh r0, [r2, 0x10]
	mov r0, sp
	movs r2, 0x1
	bl BgAffineSet
	add sp, 0x14
	pop {r0}
	bx r0
	.align 2, 0
_080517C4: .4byte gUnknown_03004854
	thumb_func_end sub_8051414

	thumb_func_start sub_8051474
sub_8051474: @ 80517C8
	push {lr}
	ldr r0, _080517F4
	ldr r3, [r0]
	adds r1, r3, 0
	adds r1, 0x54
	ldrh r2, [r1]
	adds r0, r3, 0
	adds r0, 0x58
	strh r2, [r0]
	subs r0, 0x2
	ldrh r0, [r0]
	ldrh r2, [r1]
	adds r0, r2
	strh r0, [r1]
	movs r1, 0xB4
	lsls r1, 1
	adds r0, r3, r1
	bl sub_8051414
	pop {r0}
	bx r0
	.align 2, 0
_080517F4: .4byte gUnknown_03004854
	thumb_func_end sub_8051474

	thumb_func_start sub_80514A4
sub_80514A4: @ 80517F8
	ldr r1, _0805183C
	ldr r0, _08051840
	ldr r2, [r0]
	movs r3, 0xB4
	lsls r3, 1
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r3, 0x2
	adds r0, r2, r3
	ldr r0, [r0]
	str r0, [r1]
	adds r1, 0x4
	adds r3, 0x4
	adds r0, r2, r3
	ldr r0, [r0]
	str r0, [r1]
	bx lr
	.align 2, 0
_0805183C: .4byte 0x04000020
_08051840: .4byte gUnknown_03004854
	thumb_func_end sub_80514A4

	thumb_func_start sub_80514F0
sub_80514F0: @ 8051844
	ldr r1, _08051870
	ldr r0, _08051874
	ldr r3, [r0]
	movs r0, 0xA2
	lsls r0, 1
	adds r2, r3, r0
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xA3
	lsls r0, 1
	adds r3, r0
	ldrh r0, [r3]
	strh r0, [r1]
	subs r1, 0x6
	ldrh r0, [r2]
	strh r0, [r1]
	adds r1, 0x2
	ldrh r0, [r3]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08051870: .4byte 0x04000014
_08051874: .4byte gUnknown_03004854
	thumb_func_end sub_80514F0

	thumb_func_start sub_8051524
sub_8051524: @ 8051878
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x32]
	adds r0, r1
	strh r0, [r2, 0x32]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x34]
	adds r0, r1
	strh r0, [r2, 0x34]
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _08051896
	adds r0, 0x7
_08051896:
	asrs r0, 3
	strh r0, [r2, 0x24]
	movs r1, 0x34
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bge _080518A4
	adds r0, 0x7
_080518A4:
	asrs r0, 3
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080518BC
	adds r0, r2, 0
	bl DestroySprite
_080518BC:
	pop {r0}
	bx r0
	thumb_func_end sub_8051524

	thumb_func_start sub_805156C
sub_805156C: @ 80518C0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl Random
	lsls r0, 16
	lsrs r1, r0, 16
	movs r0, 0x1
	ands r1, r0
	adds r0, r1, 0x1
	cmp r0, 0
	beq _0805197C
	ldr r0, _0805198C
	mov r9, r0
	ldr r2, _08051990
	mov r10, r2
	adds r6, r1, 0x1
	movs r3, 0x1F
	mov r8, r3
	movs r7, 0x10
_080518EC:
	bl Random
	ldr r1, _08051994
	ldr r4, [r1]
	adds r4, 0x54
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x14
	bl __umodsi3
	ldrh r1, [r4]
	adds r1, r0
	lsls r1, 16
	movs r0, 0xFF
	lsls r0, 16
	ands r0, r1
	lsrs r2, r0, 16
	adds r0, r2, 0
	adds r0, 0x40
	lsls r0, 1
	add r0, r9
	movs r3, 0
	ldrsh r1, [r0, r3]
	cmp r1, 0
	bge _08051920
	adds r1, 0x3
_08051920:
	asrs r1, 2
	lsls r0, r2, 1
	add r0, r9
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	bge _08051930
	adds r0, 0x3
_08051930:
	asrs r2, r0, 2
	adds r1, 0x78
	adds r2, 0x50
	ldr r0, _08051998
	movs r3, 0x1
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	mov r3, r10
	adds r4, r5, r3
	lsls r0, 16
	lsrs r0, 16
	mov r1, r8
	ands r0, r1
	subs r0, r7, r0
	strh r0, [r4, 0x2E]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r2, r8
	ands r0, r2
	subs r0, r7, r0
	strh r0, [r4, 0x30]
	ldr r3, _0805199C
	adds r5, r3
	ldr r0, _080519A0
	str r0, [r5]
	subs r6, 0x1
	cmp r6, 0
	bne _080518EC
_0805197C:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805198C: .4byte gSineTable
_08051990: .4byte gSprites
_08051994: .4byte gUnknown_03004854
_08051998: .4byte gSpriteTemplate_82164FC
_0805199C: .4byte 0x02020020
_080519A0: .4byte sub_8051524
	thumb_func_end sub_805156C

	thumb_func_start sub_8051650
sub_8051650: @ 80519A4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	bl __divsi3
	negs r0, r0
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080519D0
	adds r0, r4, 0
	bl DestroySprite
_080519D0:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8051650

	thumb_func_start sub_8051684
sub_8051684: @ 80519D8
	push {lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	lsls r0, 1
	negs r0, r0
	strh r0, [r2, 0x26]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0xC
	negs r1, r1
	cmp r0, r1
	bge _080519FC
	ldr r0, _08051A14
	strh r0, [r2, 0x26]
_080519FC:
	adds r0, r2, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08051A10
	adds r0, r2, 0
	bl DestroySprite
_08051A10:
	pop {r0}
	bx r0
	.align 2, 0
_08051A14: .4byte 0x0000fff4
	thumb_func_end sub_8051684

	thumb_func_start sub_80516C4
sub_80516C4: @ 8051A18
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08051A48
	ldr r3, [r2]
	lsls r4, r0, 1
	adds r2, r3, 0
	adds r2, 0x80
	adds r2, r4
	strh r1, [r2]
	lsls r0, 4
	movs r2, 0xBE
	lsls r2, 1
	adds r0, r2
	adds r3, r0
	adds r0, r3, 0
	bl sub_804E844
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051A48: .4byte gUnknown_03004854
	thumb_func_end sub_80516C4

	thumb_func_start unref_sub_80516F8
unref_sub_80516F8: @ 8051A4C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08051B0C
	adds r4, r0, r1
	ldr r6, _08051B10
	ldrb r0, [r6]
	cmp r0, 0
	beq _08051B60
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _08051B28
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _08051A84
	strh r1, [r4, 0x8]
_08051A84:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x64
	bne _08051AF4
	ldr r0, _08051B14
	ldr r0, [r0]
	adds r0, 0x4
	movs r1, 0x14
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl ZeroFillWindowRect
	movs r0, 0x4
	movs r1, 0x4
	movs r2, 0xA
	movs r3, 0xC
	bl MenuDrawTextWindow
	movs r2, 0
	ldr r6, _08051B18
_08051AB0:
	adds r4, r2, 0x1
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	cmp r0, 0
	beq _08051AD8
	ldr r1, _08051B1C
	lsls r0, r2, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r2, 25
	movs r1, 0xA0
	lsls r1, 19
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
_08051AD8:
	movs r0, 0
	movs r1, 0xD
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r0, _08051B20
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	adds r2, r4, 0
	cmp r2, 0x2
	ble _08051AB0
_08051AF4:
	ldr r0, _08051B24
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08051B60
	bl sub_8007E4C
	adds r0, r5, 0
	bl DestroyTask
	b _08051B60
	.align 2, 0
_08051B0C: .4byte gTasks
_08051B10: .4byte gReceivedRemoteLinkPlayers
_08051B14: .4byte gUnknown_03004854
_08051B18: .4byte 0x03002984
_08051B1C: .4byte gUnknown_08216284
_08051B20: .4byte gOtherText_PressAToStart
_08051B24: .4byte gMain
_08051B28:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0xA
	bne _08051B3A
	ldr r0, _08051B68
	movs r1, 0x3
	movs r2, 0xA
	bl MenuPrint
_08051B3A:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x78
	ble _08051B4C
	movs r0, 0
	strh r0, [r4, 0x8]
_08051B4C:
	ldr r0, _08051B6C
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _08051B60
	ldrb r0, [r6]
	cmp r0, 0x1
	bne _08051B60
	adds r0, r5, 0
	bl DestroyTask
_08051B60:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051B68: .4byte gOtherText_PleaseWait
_08051B6C: .4byte byte_3002A68
	thumb_func_end unref_sub_80516F8

	thumb_func_start sub_805181C
sub_805181C: @ 8051B70
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08051BAC
	cmp r0, 0x1
	bgt _08051B86
	cmp r0, 0
	beq _08051B8C
	b _08051C12
_08051B86:
	cmp r0, 0x2
	beq _08051BC6
	b _08051C12
_08051B8C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x58
	ble _08051C12
	movs r0, 0x58
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x38
	bl PlaySE
	b _08051C12
_08051BAC:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08051C12
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	strh r0, [r4, 0x32]
	b _08051C12
_08051BC6:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _08051C12
	ldrh r0, [r4, 0x34]
	adds r0, 0x1
	adds r1, r0, 0
	strh r0, [r4, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bne _08051C00
	adds r0, r4, 0
	bl DestroySprite
	ldr r0, _08051BFC
	movs r2, 0x14
	negs r2, r2
	movs r1, 0x78
	movs r3, 0x2
	bl CreateSprite
	b _08051C12
	.align 2, 0
_08051BFC: .4byte gSpriteTemplate_821657C
_08051C00:
	movs r0, 0
	strh r0, [r4, 0x2E]
	ldr r0, _08051C1C
	strh r0, [r4, 0x30]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_08051C12:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051C1C: .4byte 0x0000fff0
	thumb_func_end sub_805181C

	thumb_func_start sub_80518CC
sub_80518CC: @ 8051C20
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08051C5C
	cmp r0, 0x1
	bgt _08051C36
	cmp r0, 0
	beq _08051C3C
	b _08051C90
_08051C36:
	cmp r0, 0x2
	beq _08051C72
	b _08051C90
_08051C3C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x8
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5C
	ble _08051C90
	movs r0, 0x5C
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x15
	bl PlaySE
	b _08051C90
_08051C5C:
	ldrh r0, [r4, 0x32]
	adds r0, 0x1
	strh r0, [r4, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x14
	ble _08051C90
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08051C90
_08051C72:
	ldrh r0, [r4, 0x30]
	adds r0, 0x4
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB0
	ble _08051C90
	ldr r0, _08051C9C
	ldr r1, [r0]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0
	bl DestroySprite
_08051C90:
	ldrh r0, [r4, 0x30]
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051C9C: .4byte gUnknown_03004854
	thumb_func_end sub_80518CC

	thumb_func_start sub_805194C
sub_805194C: @ 8051CA0
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r3, r1, 16
	ldr r1, _08051CCC
	ldr r1, [r1]
	movs r2, 0xA0
	lsls r2, 1
	adds r1, r2
	ldrh r2, [r1]
	cmp r2, r0
	bcs _08051CC6
	adds r0, r2, 0x2
	strh r0, [r1]
	ldrh r0, [r1]
	adds r1, r3, 0
	bl sub_805197C
_08051CC6:
	pop {r0}
	bx r0
	.align 2, 0
_08051CCC: .4byte gUnknown_03004854
	thumb_func_end sub_805194C

	thumb_func_start sub_805197C
sub_805197C: @ 8051CD0
	push {r4-r7,lr}
	lsls r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r7, _08051D60
	lsrs r0, 10
	bl __divsi3
	adds r1, r0, 0
	cmp r1, 0
	bge _08051CE8
	adds r0, r1, 0x7
_08051CE8:
	asrs r4, r0, 3
	movs r3, 0
	cmp r3, r4
	bge _08051D10
	ldr r0, _08051D64
	adds r6, r0, 0
	adds r0, 0x10
	adds r5, r0, 0
	adds r2, r7, 0
	adds r2, 0x56
	adds r0, r7, 0
	adds r3, r4, 0
_08051D00:
	strh r6, [r0, 0x16]
	strh r5, [r2]
	adds r2, 0x2
	adds r0, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08051D00
	adds r3, r4, 0
_08051D10:
	adds r0, r1, 0
	cmp r1, 0
	bge _08051D18
	adds r0, r1, 0x7
_08051D18:
	asrs r2, r0, 3
	lsls r0, r2, 3
	subs r2, r1, r0
	cmp r2, 0
	beq _08051D36
	lsls r0, r3, 1
	adds r0, r7
	ldr r4, _08051D68
	adds r1, r2, r4
	strh r1, [r0, 0x16]
	adds r0, 0x56
	adds r4, 0x10
	adds r1, r2, r4
	strh r1, [r0]
	adds r3, 0x1
_08051D36:
	cmp r3, 0x7
	bgt _08051D5A
	ldr r0, _08051D6C
	adds r4, r0, 0
	adds r0, 0x10
	adds r2, r0, 0
	lsls r1, r3, 1
	adds r0, r1, 0
	adds r0, 0x56
	adds r0, r7
	adds r1, r7
_08051D4C:
	strh r4, [r1, 0x16]
	strh r2, [r0]
	adds r0, 0x2
	adds r1, 0x2
	adds r3, 0x1
	cmp r3, 0x7
	ble _08051D4C
_08051D5A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051D60: .4byte 0x06006000
_08051D64: .4byte 0x000081e9
_08051D68: .4byte 0xffff81e1
_08051D6C: .4byte 0x000081e1
	thumb_func_end sub_805197C

	thumb_func_start sub_8051A1C
sub_8051A1C: @ 8051D70
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08051D88
	muls r0, r1
	cmp r0, 0
	bge _08051D82
	ldr r1, _08051D8C
	adds r0, r1
_08051D82:
	asrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08051D88: .4byte 0x00057e40
_08051D8C: .4byte 0x0000ffff
	thumb_func_end sub_8051A1C

	thumb_func_start sub_8051A3C
sub_8051A3C: @ 8051D90
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 16
	lsrs r0, 16
	bl sub_8051A1C
	adds r5, r0, 0
	ldr r0, _08051E10
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0x5A
	ldrh r0, [r1]
	cmp r0, r5
	bcs _08051DAE
	strh r5, [r1]
_08051DAE:
	movs r6, 0
_08051DB0:
	mov r0, sp
	adds r4, r0, r6
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	strb r0, [r4]
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	adds r5, r0, 0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bls _08051DB0
	ldr r2, _08051E14
	mov r0, sp
	ldr r3, _08051E18
	adds r1, r3, 0
	ldrb r0, [r0, 0x4]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x3]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0, 0x2]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x4
	mov r0, sp
	ldrb r0, [r0, 0x1]
	adds r0, r1
	strh r0, [r2]
	adds r2, 0x2
	mov r0, sp
	ldrb r0, [r0]
	adds r1, r0
	strh r1, [r2]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08051E10: .4byte gUnknown_03004854
_08051E14: .4byte 0x06006458
_08051E18: .4byte 0x00008172
	thumb_func_end sub_8051A3C

	thumb_func_start sub_8051AC8
sub_8051AC8: @ 8051E1C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r4, r1, 16
	lsrs r5, r4, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0
	bne _08051E40
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __umodsi3
	lsrs r1, r4, 17
	subs r0, r1
	strh r0, [r6]
_08051E40:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8051AC8

	thumb_func_start sub_8051AF4
sub_8051AF4: @ 8051E48
	push {lr}
	adds r1, r0, 0
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	bge _08051E5A
	adds r0, r2, 0x1
	strh r0, [r1]
_08051E5A:
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	ble _08051E68
	subs r0, r2, 0x1
	strh r0, [r1]
_08051E68:
	pop {r0}
	bx r0
	thumb_func_end sub_8051AF4

	thumb_func_start sub_8051B18
sub_8051B18: @ 8051E6C
	push {r4,lr}
	ldr r4, _08051E90
	ldr r0, [r4]
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r1
	bl sub_8051AF4
	ldr r0, [r4]
	movs r1, 0xA3
	lsls r1, 1
	adds r0, r1
	bl sub_8051AF4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051E90: .4byte gUnknown_03004854
	thumb_func_end sub_8051B18

	thumb_func_start sub_8051B40
sub_8051B40: @ 8051E94
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r1, 16
	movs r5, 0x8
	cmp r1, 0x9
	bhi _08051EA4
	movs r5, 0x10
_08051EA4:
	ldrh r0, [r4]
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r1, 0
	bne _08051EC2
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r5, 0
	bl __modsi3
	lsrs r1, r5, 1
	subs r0, r1
	b _08051ED6
_08051EC2:
	cmp r1, 0
	bge _08051ECA
	adds r0, 0x1
	strh r0, [r4]
_08051ECA:
	ldrh r1, [r4]
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _08051ED8
	subs r0, r1, 0x1
_08051ED6:
	strh r0, [r4]
_08051ED8:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8051B40

	thumb_func_start sub_8051B8C
sub_8051B8C: @ 8051EE0
	push {r4,r5,lr}
	ldr r5, _08051F38
	ldr r2, [r5]
	movs r4, 0x98
	lsls r4, 1
	adds r0, r2, r4
	ldr r1, [r0]
	cmp r1, 0
	bne _08051F00
	movs r3, 0xA2
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	adds r3, 0x2
	adds r0, r2, r3
	strh r1, [r0]
_08051F00:
	ldr r0, [r5]
	adds r2, r0, r4
	ldr r1, [r2]
	adds r1, 0x1
	str r1, [r2]
	movs r2, 0xA2
	lsls r2, 1
	adds r0, r2
	lsls r1, 16
	lsrs r1, 16
	bl sub_8051B40
	ldr r1, [r5]
	movs r3, 0xA3
	lsls r3, 1
	adds r0, r1, r3
	adds r1, r4
	ldrh r1, [r1]
	bl sub_8051B40
	ldr r2, [r5]
	adds r0, r2, r4
	ldr r0, [r0]
	cmp r0, 0x14
	beq _08051F3C
	movs r0, 0
	b _08051F50
	.align 2, 0
_08051F38: .4byte gUnknown_03004854
_08051F3C:
	movs r1, 0xA2
	lsls r1, 1
	adds r0, r2, r1
	movs r1, 0
	strh r1, [r0]
	movs r3, 0xA3
	lsls r3, 1
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, 0x1
_08051F50:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8051B8C

	thumb_func_start sub_8051C04
sub_8051C04: @ 8051F58
	ldr r1, _08051F74
	ldr r2, [r1]
	movs r3, 0xA2
	lsls r3, 1
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x24]
	adds r3, 0x2
	adds r1, r2, r3
	ldrh r1, [r1]
	negs r1, r1
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_08051F74: .4byte gUnknown_03004854
	thumb_func_end sub_8051C04

	thumb_func_start sub_8051C24
sub_8051C24: @ 8051F78
	push {lr}
	ldr r2, _08051FA0
	ldr r0, _08051FA4
	ldr r1, [r0]
	adds r0, r1, 0
	adds r0, 0x88
	ldrb r0, [r0]
	subs r0, 0x2
	lsls r0, 1
	ldr r3, _08051FA8
	adds r2, r3
	adds r2, r0, r2
	adds r1, 0x5A
	ldrh r1, [r1]
	ldrh r0, [r2]
	cmp r0, r1
	bcs _08051F9C
	strh r1, [r2]
_08051F9C:
	pop {r0}
	bx r0
	.align 2, 0
_08051FA0: .4byte gSaveBlock1
_08051FA4: .4byte gUnknown_03004854
_08051FA8: .4byte 0x0000096c
	thumb_func_end sub_8051C24

	thumb_func_start sub_8051C58
sub_8051C58: @ 8051FAC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x34
	ldr r1, _08051FD0
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _08051FC6
	b _0805235A
_08051FC6:
	lsls r0, 2
	ldr r1, _08051FD4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08051FD0: .4byte gUnknown_03004854
_08051FD4: .4byte _08051FD8
	.align 2, 0
_08051FD8:
	.4byte _08051FF4
	.4byte _0805200A
	.4byte _08052024
	.4byte _08052074
	.4byte _08052294
	.4byte _080522A8
	.4byte _08052348
_08051FF4:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0x11
	str r1, [r0]
	b _0805235A
_0805200A:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _0805201E
	b _0805235A
_0805201E:
	movs r0, 0
	str r0, [r2]
	b _08052332
_08052024:
	ldr r1, [r2]
	movs r2, 0x98
	lsls r2, 1
	adds r1, r2
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	bgt _08052038
	b _0805235A
_08052038:
	movs r6, 0
_0805203A:
	ldr r4, _0805206C
	ldr r0, [r4]
	adds r0, 0x50
	adds r0, r6
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08052070
	adds r0, r1
	bl DestroySprite
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x2
	bls _0805203A
	ldr r1, [r4]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08052332
	.align 2, 0
_0805206C: .4byte gUnknown_03004854
_08052070: .4byte gSprites
_08052074:
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0x19
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _08052264
	movs r1, 0x5
	movs r2, 0x3
	movs r3, 0xA0
	bl sub_8072BD8
	movs r6, 0
	ldr r1, _08052268
	ldr r0, [r1]
	adds r0, 0x88
	add r2, sp, 0xC
	mov r9, r2
	mov r2, sp
	adds r2, 0x16
	str r2, [sp, 0x30]
	ldrb r0, [r0]
	cmp r6, r0
	bcs _08052158
	mov r8, r1
	ldr r0, _0805226C
	mov r10, r0
_080520AA:
	mov r1, r8
	ldr r2, [r1]
	movs r1, 0xB2
	lsls r1, 1
	adds r0, r2, r1
	adds r0, r6
	ldrb r5, [r0]
	mov r7, r9
	lsls r1, r5, 4
	adds r1, r2
	movs r2, 0xBF
	lsls r2, 1
	adds r1, r2
	adds r0, r7, 0
	bl StringCopy
	lsls r4, r5, 3
	subs r4, r5
	lsls r4, 2
	mov r1, r10
	adds r0, r4, r1
	ldrb r1, [r0, 0x1A]
	adds r0, r7, 0
	bl ConvertInternationalString
	adds r0, r7, 0
	ldr r1, _08052270
	bl de_sub_8073174
	mov r2, r8
	ldr r0, [r2]
	adds r7, r0, 0
	adds r7, 0xAB
	adds r5, r6, 0x1
	adds r0, r7, 0
	adds r1, r5, 0
	bl ConvertIntToDecimalString
	adds r7, r0, 0
	movs r1, 0
	strb r1, [r7]
	movs r0, 0xAD
	strb r0, [r7, 0x1]
	strb r1, [r7, 0x2]
	adds r7, 0x3
	ldr r0, _08052274
	adds r4, r0
	adds r0, r7, 0
	adds r1, r4, 0
	movs r2, 0x58
	movs r3, 0
	bl sub_8072C74
	adds r7, r0, 0
	add r1, sp, 0xC
	movs r2, 0x9D
	movs r3, 0
	bl sub_8072C74
	mov r2, r8
	ldr r1, [r2]
	adds r0, r1, 0
	adds r0, 0xAB
	ldr r3, _08052278
	adds r1, 0x88
	ldrb r2, [r1]
	adds r3, r2, r3
	ldr r1, _0805227C
	adds r2, r1
	ldrb r1, [r2]
	adds r2, r6, 0
	muls r2, r1
	ldrb r3, [r3]
	adds r2, r3
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
	lsls r5, 16
	lsrs r6, r5, 16
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r6, r0
	bcc _080520AA
_08052158:
	ldr r6, _08052268
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r7, r0, 0
	adds r7, 0xAB
	ldr r1, _08052280
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r0, [r6]
	adds r0, 0x5A
	ldrh r0, [r0]
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r7, 0
	movs r2, 0x79
	movs r3, 0x1
	bl sub_8072C14
	adds r7, r0, 0
	movs r0, 0xB8
	strb r0, [r7]
	adds r7, 0x1
	adds r0, r7, 0
	mov r1, r9
	movs r2, 0x88
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08052284
	bl StringCopy
	ldr r0, [r6]
	adds r0, 0xAB
	movs r1, 0x5
	movs r2, 0xD
	bl MenuPrint
	ldr r0, [r6]
	movs r2, 0x96
	lsls r2, 1
	adds r0, r2
	ldr r0, [r0]
	movs r1, 0x3C
	bl __udivsi3
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [sp, 0x30]
	adds r1, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, [r6]
	adds r7, r0, 0
	adds r7, 0xAB
	ldr r1, _08052288
	adds r0, r7, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x63
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _0805228C
	bl StringAppend
	adds r7, r0, 0
	ldr r1, [sp, 0x30]
	movs r2, 0x88
	movs r3, 0x1
	bl sub_8072C74
	adds r7, r0, 0
	ldr r1, _08052290
	bl StringCopy
	ldr r0, [r6]
	adds r0, 0xAB
	movs r1, 0x5
	movs r2, 0xF
	bl MenuPrint
	ldr r1, [r6]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _08052332
	.align 2, 0
_08052264: .4byte gOtherText_ResultsOfBlending
_08052268: .4byte gUnknown_03004854
_0805226C: .4byte gLinkPlayers
_08052270: .4byte gOtherText_Berry
_08052274: .4byte 0x03002988
_08052278: .4byte gUnknown_082165E9
_0805227C: .4byte gUnknown_082165EE
_08052280: .4byte gOtherText_MaxSpeed
_08052284: .4byte gOtherText_RPM
_08052288: .4byte gOtherText_RequiredTime
_0805228C: .4byte gOtherText_Min
_08052290: .4byte gOtherText_Sec
_08052294:
	ldr r0, _080522A4
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805235A
	ldr r1, [r2]
	b _08052332
	.align 2, 0
_080522A4: .4byte gMain
_080522A8:
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	movs r6, 0
	add r5, sp, 0x28
	ldr r0, _0805233C
	ldr r0, [r0]
	adds r3, r0, 0
	adds r3, 0x80
	add r2, sp, 0x20
_080522C6:
	lsls r1, r6, 1
	adds r0, r3, r1
	ldrh r0, [r0]
	cmp r0, 0
	beq _080522D6
	adds r1, r2, r1
	subs r0, 0x85
	strh r0, [r1]
_080522D6:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x3
	bls _080522C6
	bl sub_8050760
	ldr r4, _0805233C
	ldr r3, [r4]
	movs r1, 0xBE
	lsls r1, 1
	adds r0, r3, r1
	adds r1, r3, 0
	adds r1, 0x88
	ldrb r2, [r1]
	subs r1, 0x2E
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r5, 0
	add r3, sp, 0x4
	bl sub_8050520
	ldr r1, [r4]
	adds r1, 0xAB
	adds r0, r5, 0
	bl sub_805201C
	ldr r0, _08052340
	movs r1, 0x6
	bl CreateTask
	ldr r0, [r4]
	adds r0, 0xAB
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrintMessage
	ldr r0, _08052344
	ldrh r0, [r0]
	movs r1, 0x1
	bl RemoveBagItem
	adds r0, r5, 0
	bl sub_810CA34
	ldr r1, [r4]
_08052332:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0805235A
	.align 2, 0
_0805233C: .4byte gUnknown_03004854
_08052340: .4byte sub_8052BD0
_08052344: .4byte gScriptItemId
_08052348:
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805235A
	bl sub_8051C24
	movs r0, 0x1
	b _0805235C
_0805235A:
	movs r0, 0
_0805235C:
	add sp, 0x34
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8051C58

	thumb_func_start sub_805201C
sub_805201C: @ 805236C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	strb r0, [r6]
	ldr r1, _08052400
	ldrb r0, [r5]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	ldr r1, _08052404
	adds r0, r6, 0
	bl de_sub_8073174
	ldr r1, _08052408
	adds r0, r6, 0
	bl StringAppend
	adds r0, r5, 0
	bl sub_810C9B0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl sub_810C9E8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r1, _0805240C
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, _08052410
	adds r0, r6, 0
	bl StringAppend
	mov r0, sp
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	adds r0, r6, 0
	mov r1, sp
	bl StringAppend
	ldr r1, _08052414
	adds r0, r6, 0
	bl StringAppend
	ldr r1, _08052418
	adds r0, r6, 0
	bl StringAppend
	add sp, 0xC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052400: .4byte gPokeblockNames
_08052404: .4byte gOtherText_PokeBlockMade
_08052408: .4byte gUnknown_082162C8
_0805240C: .4byte gOtherText_BlockLevelIs
_08052410: .4byte gOtherText_BlockFeelIs
_08052414: .4byte gOtherText_Period
_08052418: .4byte gUnknown_08216249
	thumb_func_end sub_805201C

	thumb_func_start sub_80520CC
sub_80520CC: @ 805241C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	mov r12, r2
	lsls r1, 24
	lsrs r7, r1, 24
	movs r0, 0
	cmp r0, r7
	bge _08052468
_08052432:
	movs r5, 0
	adds r1, r0, 0x1
	mov r8, r1
	cmp r5, r7
	bge _08052462
	mov r1, r9
	adds r6, r1, r0
_08052440:
	ldrb r4, [r6]
	lsls r1, r4, 2
	add r1, r12
	mov r0, r9
	adds r2, r0, r5
	ldrb r3, [r2]
	lsls r0, r3, 2
	add r0, r12
	ldr r1, [r1]
	ldr r0, [r0]
	cmp r1, r0
	bls _0805245C
	strb r3, [r6]
	strb r4, [r2]
_0805245C:
	adds r5, 0x1
	cmp r5, r7
	blt _08052440
_08052462:
	mov r0, r8
	cmp r0, r7
	blt _08052432
_08052468:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80520CC

	thumb_func_start sub_8052124
sub_8052124: @ 8052474
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	movs r5, 0
	ldr r1, _08052494
	ldr r0, [r1]
	adds r0, 0x88
	mov r10, r1
	mov r2, sp
	adds r2, 0x4
	str r2, [sp, 0x14]
	b _080524A8
	.align 2, 0
_08052494: .4byte gUnknown_03004854
_08052498:
	mov r4, sp
	adds r0, r4, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r1]
	adds r0, 0x88
_080524A8:
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08052498
	movs r5, 0
	mov r1, r10
	ldr r0, [r1]
	adds r1, r0, 0
	adds r1, 0x88
	ldrb r2, [r1]
	cmp r5, r2
	bcs _08052526
	ldr r4, [sp, 0x14]
	mov r9, r4
	movs r2, 0xA6
	lsls r2, 1
	adds r2, r0
	mov r8, r2
	mov r12, r1
	movs r4, 0xA7
	lsls r4, 1
	adds r7, r0, r4
	movs r1, 0xA8
	lsls r1, 1
	adds r6, r0, r1
_080524D8:
	lsls r4, r5, 2
	add r4, r9
	lsls r3, r5, 1
	adds r3, r5
	lsls r3, 1
	mov r2, r8
	adds r0, r2, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r1, r0, 6
	subs r1, r0
	lsls r1, 3
	adds r1, r2
	lsls r1, 6
	str r1, [r4]
	adds r0, r7, r3
	ldrh r2, [r0]
	lsls r0, r2, 5
	subs r0, r2
	lsls r0, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	str r1, [r4]
	movs r0, 0xFA
	lsls r0, 2
	adds r1, r0
	adds r3, r6, r3
	ldrh r0, [r3]
	subs r1, r0
	str r1, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r1, r12
	ldrb r1, [r1]
	cmp r5, r1
	bcc _080524D8
_08052526:
	mov r2, r10
	ldr r0, [r2]
	adds r0, 0x88
	ldrb r1, [r0]
	mov r0, sp
	ldr r2, [sp, 0x14]
	bl sub_80520CC
	movs r5, 0
	mov r4, r10
	ldr r0, [r4]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r5, r0
	bcs _08052568
	mov r2, r10
	movs r3, 0xB2
	lsls r3, 1
_0805254A:
	ldr r1, [r2]
	adds r1, r3
	adds r1, r5
	mov r4, sp
	adds r0, r4, r5
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, [r2]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0805254A
_08052568:
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8052124

	thumb_func_start sub_8052228
sub_8052228: @ 8052578
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r1, _08052598
	ldr r0, [r1]
	ldrb r0, [r0]
	adds r2, r1, 0
	cmp r0, 0x6
	bls _0805258C
	b _080527FE
_0805258C:
	lsls r0, 2
	ldr r1, _0805259C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052598: .4byte gUnknown_03004854
_0805259C: .4byte _080525A0
	.align 2, 0
_080525A0:
	.4byte _080525BC
	.4byte _080525D2
	.4byte _080525EC
	.4byte _08052606
	.4byte _080527B4
	.4byte _080527CE
	.4byte _080527F4
_080525BC:
	ldr r1, [r2]
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldr r0, [r2]
	movs r1, 0x98
	lsls r1, 1
	adds r0, r1
	movs r1, 0xFF
	str r1, [r0]
	b _080527FE
_080525D2:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	subs r0, 0xA
	str r0, [r2]
	cmp r0, 0
	blt _080525E6
	b _080527FE
_080525E6:
	movs r0, 0
	str r0, [r2]
	b _080527E4
_080525EC:
	ldr r1, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	ldr r0, [r2]
	adds r0, 0x1
	str r0, [r2]
	cmp r0, 0x14
	bgt _08052600
	b _080527FE
_08052600:
	movs r0, 0
	str r0, [r2]
	b _080527E4
_08052606:
	movs r0, 0x4
	movs r1, 0x2
	movs r2, 0x19
	movs r3, 0x11
	bl MenuDrawTextWindow
	ldr r0, _080526BC
	movs r1, 0x5
	movs r2, 0x3
	movs r3, 0xA0
	bl sub_8072BD8
	ldr r6, _080526C0
	adds r0, r6, 0
	movs r1, 0x8C
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r7, _080526C4
	ldr r1, [r7]
	adds r1, 0x50
	strb r0, [r1]
	ldr r1, _080526C8
	mov r8, r1
	ldr r2, [r7]
	adds r2, 0x50
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	mov r5, r8
	adds r5, 0x1C
	adds r0, r5
	ldr r4, _080526CC
	str r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x3
	bl StartSpriteAnim
	adds r0, r6, 0
	movs r1, 0xA4
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x51
	strb r0, [r1]
	ldr r0, [r7]
	adds r0, 0x51
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	adds r0, r6, 0
	movs r1, 0xBC
	movs r2, 0x34
	movs r3, 0
	bl CreateSprite
	ldr r1, [r7]
	adds r1, 0x52
	strb r0, [r1]
	ldr r2, [r7]
	adds r2, 0x52
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x1
	bl StartSpriteAnim
	bl sub_8052124
	movs r2, 0
	mov r8, r2
	b _0805278C
	.align 2, 0
_080526BC: .4byte gOtherText_Ranking
_080526C0: .4byte gSpriteTemplate_821645C
_080526C4: .4byte gUnknown_03004854
_080526C8: .4byte gSprites
_080526CC: .4byte SpriteCallbackDummy
_080526D0:
	ldr r1, [r7]
	movs r2, 0xB2
	lsls r2, 1
	adds r0, r1, r2
	add r0, r8
	ldrb r5, [r0]
	adds r2, r1, 0
	adds r2, 0xAB
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x13
	strb r0, [r2, 0x1]
	movs r0, 0x4
	strb r0, [r2, 0x2]
	adds r2, 0x3
	mov r6, r8
	adds r6, 0x1
	adds r0, r2, 0
	adds r1, r6, 0
	bl ConvertIntToDecimalString
	adds r2, r0, 0
	movs r1, 0
	strb r1, [r2]
	movs r0, 0xAD
	strb r0, [r2, 0x1]
	strb r1, [r2, 0x2]
	adds r2, 0x3
	lsls r1, r5, 3
	subs r1, r5
	lsls r1, 2
	ldr r0, _080527A8
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r0, [r7]
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 1
	movs r1, 0xA6
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x6C
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	ldr r0, [r7]
	movs r1, 0xA7
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x84
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	ldr r0, [r7]
	movs r1, 0xA8
	lsls r1, 1
	adds r0, r1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r2, 0
	movs r2, 0x9C
	movs r3, 0x1
	bl sub_8072C14
	ldr r1, [r7]
	adds r0, r1, 0
	adds r0, 0xAB
	ldr r2, _080527AC
	adds r1, 0x88
	ldrb r1, [r1]
	adds r1, r2
	ldrb r1, [r1]
	mov r2, r8
	muls r2, r1
	adds r2, 0x8
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x5
	bl MenuPrint
	lsls r6, 16
	lsrs r6, 16
	mov r8, r6
_0805278C:
	ldr r0, [r7]
	adds r0, 0x88
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080526D0
	ldr r0, _080527B0
	ldr r1, [r0]
	movs r0, 0x98
	lsls r0, 1
	adds r2, r1, r0
	movs r0, 0
	str r0, [r2]
	b _080527E4
	.align 2, 0
_080527A8: .4byte 0x03002988
_080527AC: .4byte gUnknown_082165F3
_080527B0: .4byte gUnknown_03004854
_080527B4:
	ldr r2, [r2]
	movs r0, 0x98
	lsls r0, 1
	adds r1, r2, r0
	ldr r0, [r1]
	adds r0, 0x1
	str r0, [r1]
	cmp r0, 0x14
	ble _080527FE
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	b _080527FE
_080527CE:
	ldr r0, _080527EC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080527FE
	movs r0, 0x5
	bl PlaySE
	ldr r0, _080527F0
	ldr r1, [r0]
_080527E4:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _080527FE
	.align 2, 0
_080527EC: .4byte gMain
_080527F0: .4byte gUnknown_03004854
_080527F4:
	ldr r1, [r2]
	movs r0, 0
	strb r0, [r1]
	movs r0, 0x1
	b _08052800
_080527FE:
	movs r0, 0
_08052800:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8052228

	thumb_func_start unref_sub_80524BC
unref_sub_80524BC: @ 805280C
	push {r4,lr}
	bl ResetSpriteData
	bl FreeAllSpritePalettes
	bl ResetTasks
	ldr r0, _0805286C
	bl SetVBlankCallback
	ldr r4, _08052870
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	ldr r0, _08052874
	ldrh r0, [r0, 0x20]
	bl SeedRng
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	ldr r1, _08052878
	movs r0, 0xFA
	lsls r0, 5
	strh r0, [r1, 0x1A]
	ldrb r0, [r1, 0x10]
	adds r0, 0x1
	strb r0, [r1, 0x10]
	ldr r0, _0805287C
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805286C: .4byte sub_804E2D8
_08052870: .4byte gWindowConfig_81E6CE4
_08052874: .4byte gMain
_08052878: .4byte gUnknown_03000560
_0805287C: .4byte sub_8052AF8
	thumb_func_end unref_sub_80524BC

	thumb_func_start sub_8052530
sub_8052530: @ 8052880
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x98
	ldr r1, _08052918
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0
	bl MenuPrint
	ldr r4, _0805291C
	movs r1, 0x1A
	ldrsh r0, [r4, r1]
	movs r1, 0x64
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	mov r0, sp
	movs r1, 0x6
	movs r2, 0
	bl MenuPrint
	movs r6, 0
	mov r2, sp
	adds r2, 0x3
	str r2, [sp, 0x84]
	mov r3, sp
	adds r3, 0x6
	str r3, [sp, 0x88]
	mov r0, sp
	adds r0, 0x9
	str r0, [sp, 0x8C]
	mov r1, sp
	adds r1, 0xC
	str r1, [sp, 0x90]
	adds r2, 0xC
	str r2, [sp, 0x94]
	mov r8, r4
	mov r7, sp
	ldr r3, _08052920
	mov r9, r3
	ldr r0, _08052924
	mov r10, r0
_080528EE:
	mov r1, r8
	movs r0, 0
	ldrsb r0, [r1, r0]
	cmp r0, r6
	bne _08052928
	movs r0, 0xEF
	strb r0, [r7]
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	adds r1, 0x1
	bl CopyItemName
	b _08052948
	.align 2, 0
_08052918: .4byte gOtherText_BPMAndDash
_0805291C: .4byte gUnknown_03000560
_08052920: .4byte gBerries
_08052924: .4byte gUnknown_082165F8
_08052928:
	mov r0, r8
	adds r0, 0x1
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, 0x85
	lsls r0, 16
	lsrs r0, 16
	mov r1, sp
	bl CopyItemName
	movs r0, 0
	strb r0, [r7, 0x6]
	movs r0, 0xFF
	strb r0, [r7, 0x7]
_08052948:
	lsls r5, r6, 1
	adds r5, r6
	adds r5, 0x3
	lsls r5, 24
	lsrs r5, 24
	mov r0, sp
	movs r1, 0x2
	adds r2, r5, 0
	bl MenuPrint
	mov r4, r8
	adds r4, 0x1
	adds r4, r6, r4
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x15]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x16]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x17]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x18]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x19]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	mov r0, sp
	mov r1, r10
	bl StringAppend
	movs r1, 0
	ldrsb r1, [r4, r1]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 2
	add r0, r9
	ldrb r1, [r0, 0x1A]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x80
	strb r2, [r3]
	movs r0, 0xFF
	strb r0, [r7, 0x11]
	mov r0, sp
	movs r1, 0x7
	adds r2, r5, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x3
	bhi _08052A3C
	b _080528EE
_08052A3C:
	mov r1, r8
	ldrb r0, [r1, 0x8]
	cmp r0, 0
	beq _08052AF4
	ldr r1, _08052B04
	mov r2, r8
	ldrb r0, [r2, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	mov r0, sp
	bl StringCopy
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	mov r3, r8
	ldrb r1, [r3, 0x11]
	mov r0, sp
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	ldr r4, _08052B08
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x12]
	ldr r0, [sp, 0x84]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x13]
	ldr r0, [sp, 0x88]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r3, r8
	ldrb r1, [r3, 0x14]
	ldr r0, [sp, 0x8C]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r0, r8
	ldrb r1, [r0, 0x15]
	ldr r0, [sp, 0x90]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r4, 0
	bl StringAppend
	mov r2, r8
	ldrb r1, [r2, 0x16]
	ldr r0, [sp, 0x94]
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToHexStringN
	mov r1, sp
	ldrb r0, [r1, 0x11]
	add r3, sp, 0x80
	ldrb r3, [r3]
	orrs r0, r3
	strb r0, [r1, 0x11]
	mov r0, sp
	movs r1, 0x7
	movs r2, 0x11
	bl MenuPrint
_08052AF4:
	add sp, 0x98
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052B04: .4byte gPokeblockNames
_08052B08: .4byte gUnknown_082165F8
	thumb_func_end sub_8052530

	thumb_func_start sub_80527BC
sub_80527BC: @ 8052B0C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x58
	ldr r0, _08052B94
	ldrb r0, [r0]
	add r6, sp, 0x48
	cmp r0, 0x1
	bne _08052B64
	movs r1, 0
	ldr r3, _08052B98
	movs r2, 0
_08052B26:
	lsls r0, r1, 1
	adds r0, r3
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x9
	bls _08052B26
	bl Random
	ldr r1, _08052B9C
	strh r0, [r1]
	ldr r1, _08052BA0
	movs r0, 0
	str r0, [r1]
	ldr r1, _08052B94
	movs r0, 0x2
	strb r0, [r1]
	movs r4, 0
	ldr r2, _08052BA4
	movs r1, 0
_08052B50:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xC7
	bls _08052B50
	ldr r1, _08052BA8
	movs r0, 0
	strb r0, [r1]
_08052B64:
	movs r4, 0
	movs r0, 0x1
	mov r8, r0
	ldr r7, _08052BA8
	ldr r5, _08052BA0
	ldr r1, _08052BA4
	mov r9, r1
	ldr r3, _08052BAC
_08052B74:
	str r3, [sp, 0x54]
	bl Random
	lsls r0, 16
	lsrs r0, 31
	mov r1, r8
	ands r0, r1
	ldr r3, [sp, 0x54]
	ldrb r1, [r7]
	cmp r0, r1
	bne _08052BB0
	ldr r0, [r5]
	adds r0, 0x1
	str r0, [r5]
	b _08052BCA
	.align 2, 0
_08052B94: .4byte gUnknown_020297DC
_08052B98: .4byte gUnknown_03004840
_08052B9C: .4byte gUnknown_03004830
_08052BA0: .4byte gUnknown_020297E0
_08052BA4: .4byte 0x02000000
_08052BA8: .4byte gUnknown_020297E8
_08052BAC: .4byte gUnknown_020297E4
_08052BB0:
	ldr r2, [r3]
	lsls r0, r2, 1
	add r0, r9
	ldr r1, [r5]
	strh r1, [r0]
	adds r2, 0x1
	str r2, [r3]
	movs r0, 0
	str r0, [r5]
	ldrb r0, [r7]
	mov r1, r8
	eors r0, r1
	strb r0, [r7]
_08052BCA:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x63
	bls _08052B74
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	ldr r0, _08052C50
	ldrh r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _08052C54
	mov r0, sp
	bl StringAppend
	ldr r0, _08052C58
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x8
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	ldr r1, _08052C5C
	mov r0, sp
	bl StringAppend
	ldr r4, _08052C60
	ldrb r0, [r4]
	cmp r0, 0x3
	bne _08052C38
	ldr r0, _08052C64
	ldr r1, [r0]
	adds r0, r6, 0
	movs r2, 0x2
	movs r3, 0x10
	bl ConvertIntToHexStringN
	mov r0, sp
	adds r1, r6, 0
	bl StringAppend
	movs r0, 0
	strb r0, [r4]
_08052C38:
	mov r0, sp
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	add sp, 0x58
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052C50: .4byte gUnknown_03004830
_08052C54: .4byte gUnknown_082165F8
_08052C58: .4byte gUnknown_020297E0
_08052C5C: .4byte gUnknown_08216600
_08052C60: .4byte gUnknown_020297DC
_08052C64: .4byte gUnknown_020297E4
	thumb_func_end sub_80527BC

	thumb_func_start sub_8052918
sub_8052918: @ 8052C68
	push {r4-r6,lr}
	sub sp, 0x4C
	ldr r2, _08052DD8
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	ldr r4, _08052DDC
	cmp r0, 0
	beq _08052C9C
	movs r1, 0xFA
	lsls r1, 2
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	ldr r1, _08052DE0
	cmp r0, r1
	ble _08052C96
	movs r0, 0xFA
	lsls r0, 2
	strh r0, [r4, 0x1A]
_08052C96:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052C9C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	lsls r0, 2
	ands r0, r1
	cmp r0, 0
	beq _08052CC2
	ldr r1, _08052DE4
	adds r0, r1, 0
	ldrh r1, [r4, 0x1A]
	adds r0, r1
	strh r0, [r4, 0x1A]
	lsls r0, 16
	cmp r0, 0
	bge _08052CBC
	ldr r0, _08052DE8
	strh r0, [r4, 0x1A]
_08052CBC:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052CC2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08052CE2
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	cmp r0, 0
	bge _08052CDC
	movs r0, 0x3
	strb r0, [r4]
_08052CDC:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052CE2:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08052D04
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x3
	ble _08052CFE
	movs r0, 0
	strb r0, [r4]
_08052CFE:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052D04:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08052D34
	adds r3, r4, 0
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r5, r3, 0x1
	adds r1, r5
	ldrb r0, [r1]
	subs r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	cmp r0, 0
	bge _08052D2E
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r5
	movs r1, 0x2A
	strb r1, [r0]
_08052D2E:
	ldrb r0, [r4, 0x10]
	adds r0, 0x1
	strb r0, [r4, 0x10]
_08052D34:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _08052D66
	ldr r3, _08052DDC
	movs r1, 0
	ldrsb r1, [r3, r1]
	adds r4, r3, 0x1
	adds r1, r4
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x2A
	ble _08052D60
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r4
	movs r1, 0
	strb r1, [r0]
_08052D60:
	ldrb r0, [r3, 0x10]
	adds r0, 0x1
	strb r0, [r3, 0x10]
_08052D66:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08052DF0
	movs r6, 0
	movs r4, 0
	ldr r5, _08052DDC
_08052D76:
	adds r0, r5, 0x1
	adds r2, r4, r0
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, 0x2A
	beq _08052DB4
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r0, r4, 1
	mov r1, sp
	adds r1, r0
	adds r1, 0x4
	movs r0, 0
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	add r0, sp, 0xC
	lsls r1, r4, 4
	adds r0, r1
	movs r1, 0
	ldrsb r1, [r2, r1]
	adds r1, 0x85
	lsls r1, 16
	lsrs r1, 16
	bl sub_804E844
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _08052D76
_08052DB4:
	cmp r6, 0x1
	bls _08052DEC
	add r0, sp, 0xC
	adds r1, r5, 0
	adds r1, 0x8
	lsls r2, r6, 24
	lsrs r2, 24
	adds r3, r5, 0
	adds r3, 0x11
	ldrh r4, [r5, 0x1A]
	str r4, [sp]
	bl sub_8050744
	ldrb r0, [r5, 0x10]
	adds r0, 0x1
	strb r0, [r5, 0x10]
	b _08052DF0
	.align 2, 0
_08052DD8: .4byte gMain
_08052DDC: .4byte gUnknown_03000560
_08052DE0: .4byte 0x75300000
_08052DE4: .4byte 0xfffffc18
_08052DE8: .4byte 0x00007530
_08052DEC:
	movs r0, 0xFF
	strb r0, [r5, 0x8]
_08052DF0:
	ldr r4, _08052E38
	ldrb r0, [r4, 0x10]
	cmp r0, 0
	beq _08052E00
	bl sub_8052530
	movs r0, 0
	strb r0, [r4, 0x10]
_08052E00:
	ldr r3, _08052E3C
	ldrh r1, [r3, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08052E24
	ldr r2, _08052E40
	ldrb r0, [r2]
	adds r1, r0, 0
	cmp r1, 0
	bne _08052E2C
	adds r0, 0x1
	strb r0, [r2]
	ldr r0, _08052E44
	str r1, [r0]
	ldrh r0, [r3, 0x20]
	bl SeedRng
_08052E24:
	ldr r0, _08052E40
	ldrb r0, [r0]
	cmp r0, 0
	beq _08052E30
_08052E2C:
	bl sub_80527BC
_08052E30:
	add sp, 0x4C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052E38: .4byte gUnknown_03000560
_08052E3C: .4byte gMain
_08052E40: .4byte gUnknown_020297DC
_08052E44: .4byte gUnknown_020297E0
	thumb_func_end sub_8052918

	thumb_func_start sub_8052AF8
sub_8052AF8: @ 8052E48
	push {lr}
	bl sub_8052918
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8052AF8

	thumb_func_start ShowBerryBlenderRecordWindow
ShowBerryBlenderRecordWindow: @ 8052E64
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x20
	movs r0, 0x6
	movs r1, 0x3
	movs r2, 0x17
	movs r3, 0x10
	bl MenuDrawTextWindow
	ldr r0, _08052EFC
	movs r1, 0x8
	movs r2, 0x4
	bl MenuPrint
	ldr r0, _08052F00
	movs r1, 0x8
	movs r2, 0x9
	bl MenuPrint
	movs r0, 0
	mov r8, r0
	ldr r0, _08052F04
	movs r7, 0x90
	lsls r7, 20
	ldr r1, _08052F08
	adds r6, r0, r1
_08052E9A:
	ldrh r4, [r6]
	adds r0, r4, 0
	movs r1, 0x64
	bl __udivsi3
	adds r1, r0, 0
	mov r0, sp
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C14
	adds r5, r0, 0
	movs r0, 0xB8
	strb r0, [r5]
	adds r5, 0x1
	adds r0, r4, 0
	movs r1, 0x64
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r5, r0, 0
	ldr r1, _08052F0C
	bl StringAppend
	lsrs r2, r7, 24
	mov r0, sp
	movs r1, 0xF
	bl MenuPrint
	movs r0, 0x80
	lsls r0, 18
	adds r7, r0
	adds r6, 0x2
	movs r1, 0x1
	add r8, r1
	mov r0, r8
	cmp r0, 0x2
	ble _08052E9A
	add sp, 0x20
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052EFC: .4byte gMultiText_BerryBlenderMaxSpeedRecord
_08052F00: .4byte gMultiText_2P3P4P
_08052F04: .4byte gSaveBlock1
_08052F08: .4byte 0x0000096c
_08052F0C: .4byte gOtherText_RPM
	thumb_func_end ShowBerryBlenderRecordWindow

	thumb_func_start sub_8052BD0
sub_8052BD0: @ 8052F10
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	ldr r1, _08052F5C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _08052F36
	ldr r0, _08052F60
	bl PlayFanfare
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08052F36:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08052F56
	ldr r0, _08052F64
	ldr r0, [r0]
	movs r1, 0xBC
	lsls r1, 1
	adds r0, r1
	ldrh r0, [r0]
	bl PlayBGM
	adds r0, r5, 0
	bl DestroyTask
_08052F56:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052F5C: .4byte gTasks
_08052F60: .4byte 0x0000016f
_08052F64: .4byte gUnknown_03004854
	thumb_func_end sub_8052BD0

	.align 2, 0 @ Don't pad with nop.
