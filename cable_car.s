	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_81231EC
sub_81231EC: @ 812356C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08123590 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0812358A
	ldr r0, _08123594 @ =sub_8123244
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_0812358A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08123590: .4byte gPaletteFade
_08123594: .4byte sub_8123244
	thumb_func_end sub_81231EC

	thumb_func_start sub_8123218
sub_8123218: @ 8123598
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	ldr r0, _081235C0 @ =sub_81231EC
	movs r1, 0x1
	bl CreateTask
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_081235C0: .4byte sub_81231EC
	thumb_func_end sub_8123218

	thumb_func_start sub_8123244
sub_8123244: @ 81235C4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	ldr r1, _081235E8 @ =gMain
	ldr r2, _081235EC @ =0x0000043c
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r9, r1
	cmp r0, 0x8
	bhi _08123618
	lsls r0, 2
	ldr r1, _081235F0 @ =_081235F4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081235E8: .4byte gMain
_081235EC: .4byte 0x0000043c
_081235F0: .4byte _081235F4
	.align 2, 0
_081235F4:
	.4byte _08123618
	.4byte _08123704
	.4byte _08123768
	.4byte _08123804
	.4byte _08123820
	.4byte _08123884
	.4byte _08123918
	.4byte _081239F8
	.4byte _08123A30
_08123618:
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r0, sp, 0xC
	mov r9, r0
	add r2, sp, 0x8
	movs r6, 0
	ldr r1, _081236E8 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _081236EC @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r8, r0
_08123640:
	strh r6, [r2]
	add r0, sp, 0x8
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08123640
	strh r6, [r2]
	add r2, sp, 0x8
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0xC]
	ldr r2, _081236E8 @ =0x040000d4
	mov r1, r9
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	add r0, sp, 0x8
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r4, 0x81
	lsls r4, 24
	orrs r3, r4
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _081236F0 @ =gUnknown_02039274
	ldr r0, _081236F4 @ =0x02017000
	str r0, [r1]
	adds r3, r0, 0
	ldr r5, _081236F8 @ =0x000010fc
	ldr r0, _081236FC @ =gMain
	mov r9, r0
	add r1, sp, 0x8
	movs r7, 0
	movs r6, 0x80
	lsls r6, 5
	ldr r0, _081236EC @ =0x81000800
	mov r8, r0
_081236B8:
	strh r7, [r1]
	add r0, sp, 0x8
	str r0, [r2]
	str r3, [r2, 0x4]
	mov r0, r8
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	adds r3, r6
	subs r5, r6
	cmp r5, r6
	bhi _081236B8
	strh r7, [r1]
	add r1, sp, 0x8
	str r1, [r2]
	str r3, [r2, 0x4]
	lsrs r0, r5, 1
	orrs r0, r4
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r1, _08123700 @ =0x0000043c
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_081236E8: .4byte 0x040000d4
_081236EC: .4byte 0x81000800
_081236F0: .4byte gUnknown_02039274
_081236F4: .4byte 0x02017000
_081236F8: .4byte 0x000010fc
_081236FC: .4byte gMain
_08123700: .4byte 0x0000043c
_08123704:
	bl ResetSpriteData
	bl ResetTasks
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl sub_807C828
	movs r4, 0
	ldr r0, _08123754 @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	movs r2, 0
_08123724:
	lsls r0, r4, 2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123724
	bl InitMapMusic
	bl ResetMapMusic
	ldr r2, _08123758 @ =gSpriteCoordOffsetX
	ldr r1, _0812375C @ =gSpriteCoordOffsetY
	movs r0, 0
	strh r0, [r1]
	strh r0, [r2]
	ldr r1, _08123760 @ =gMain
	ldr r2, _08123764 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_08123754: .4byte gUnknown_08396FC4
_08123758: .4byte gSpriteCoordOffsetX
_0812375C: .4byte gSpriteCoordOffsetY
_08123760: .4byte gMain
_08123764: .4byte 0x0000043c
_08123768:
	movs r4, 0
	ldr r5, _081237D4 @ =gUnknown_08401CF8
_0812376C:
	lsls r0, r4, 3
	adds r0, r5
	bl LoadCompressedObjectPic
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0812376C
	ldr r0, _081237D8 @ =gUnknown_08401D18
	bl LoadSpritePalettes
	ldr r0, _081237DC @ =gCableCarMtChimneyTilemap
	ldr r4, _081237E0 @ =0x02019000
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _081237E4 @ =gCableCarTreeTilemap
	movs r2, 0xB4
	lsls r2, 1
	adds r1, r4, r2
	bl sub_800D238
	ldr r0, _081237E8 @ =gCableCarMountainTilemap
	movs r2, 0xA5
	lsls r2, 3
	adds r1, r4, r2
	bl sub_800D238
	ldr r0, _081237EC @ =gCableCarPylonStemTilemap
	ldr r1, _081237F0 @ =0x000009d8
	adds r4, r1
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _081237F4 @ =gCableCarBG_Pal
	movs r1, 0
	movs r2, 0x80
	bl LoadPalette
	ldr r0, _081237F8 @ =gCableCarBG_Gfx
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r1, _081237FC @ =gMain
	ldr r2, _08123800 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_081237D4: .4byte gUnknown_08401CF8
_081237D8: .4byte gUnknown_08401D18
_081237DC: .4byte gCableCarMtChimneyTilemap
_081237E0: .4byte 0x02019000
_081237E4: .4byte gCableCarTreeTilemap
_081237E8: .4byte gCableCarMountainTilemap
_081237EC: .4byte gCableCarPylonStemTilemap
_081237F0: .4byte 0x000009d8
_081237F4: .4byte gCableCarBG_Pal
_081237F8: .4byte gCableCarBG_Gfx
_081237FC: .4byte gMain
_08123800: .4byte 0x0000043c
_08123804:
	bl sub_8124118
	bl RunTasks
	ldr r1, _08123818 @ =gMain
	ldr r0, _0812381C @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_08123818: .4byte gMain
_0812381C: .4byte 0x0000043c
_08123820:
	ldr r0, _08123834 @ =gUnknown_02039274
	ldr r0, [r0]
	ldrb r0, [r0, 0x2]
	cmp r0, 0x7
	bne _0812383C
	ldr r1, _08123838 @ =0x0000043c
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_08123834: .4byte gUnknown_02039274
_08123838: .4byte 0x0000043c
_0812383C:
	ldr r0, _0812387C @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	ldr r0, [r1]
	cmp r0, 0
	bne _0812384C
	b _08123A8E
_0812384C:
	movs r4, 0
	adds r3, r1, 0
	movs r5, 0xD
	negs r5, r5
_08123854:
	lsls r0, r4, 2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _08123866
	ldrb r1, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2, 0x5]
_08123866:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123854
	ldr r1, _08123880 @ =0x0000043c
	add r1, r9
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_0812387C: .4byte gUnknown_08396FC4
_08123880: .4byte 0x0000043c
_08123884:
	ldr r0, _081238F8 @ =0x0600e800
	ldr r5, _081238FC @ =0x02019168
	movs r1, 0x20
	str r1, [sp]
	movs r1, 0xF
	str r1, [sp, 0x4]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x11
	bl sub_8124F08
	ldr r0, _08123900 @ =0x0600f000
	movs r2, 0xF0
	lsls r2, 2
	adds r1, r5, r2
	movs r2, 0x1E
	str r2, [sp]
	movs r2, 0x14
	mov r9, r2
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	ldr r0, _08123904 @ =gUnknown_02039274
	mov r8, r0
	ldr r0, [r0]
	ldr r6, _08123908 @ =0x000008fc
	adds r0, r6
	ldr r1, _0812390C @ =gCableCarPylonHookTilemapEntries
	movs r2, 0x5
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, r6
	movs r2, 0x87
	lsls r2, 4
	adds r5, r2
	str r4, [sp]
	mov r1, r9
	str r1, [sp, 0x4]
	adds r1, r5, 0
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	ldr r1, _08123910 @ =gMain
	ldr r2, _08123914 @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_081238F8: .4byte 0x0600e800
_081238FC: .4byte 0x02019168
_08123900: .4byte 0x0600f000
_08123904: .4byte gUnknown_02039274
_08123908: .4byte 0x000008fc
_0812390C: .4byte gCableCarPylonHookTilemapEntries
_08123910: .4byte gMain
_08123914: .4byte 0x0000043c
_08123918:
	ldr r0, _081239E4 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl sub_81248AC
	ldr r0, _081239E8 @ =gUnknown_02039274
	mov r8, r0
	ldr r0, [r0]
	adds r0, 0xFC
	ldr r4, _081239EC @ =0x02019090
	movs r6, 0xC
	str r6, [sp]
	movs r5, 0x3
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0xE
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	adds r1, r4, 0
	adds r1, 0x48
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r2, 0xC
	movs r3, 0x11
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	adds r1, r4, 0
	adds r1, 0x90
	str r6, [sp]
	str r5, [sp, 0x4]
	movs r2, 0x18
	movs r3, 0x14
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	movs r2, 0x90
	negs r2, r2
	adds r2, r4
	mov r9, r2
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0
	movs r3, 0x11
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	subs r4, 0x48
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0
	movs r3, 0x14
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0xC
	movs r3, 0x14
	bl sub_8124F08
	mov r1, r8
	ldr r0, [r1]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	adds r1, r4, 0
	movs r2, 0xC
	movs r3, 0x17
	bl sub_8124F08
	mov r2, r8
	ldr r0, [r2]
	adds r0, 0xFC
	str r6, [sp]
	str r5, [sp, 0x4]
	mov r1, r9
	movs r2, 0x18
	movs r3, 0x17
	bl sub_8124F08
	ldr r1, _081239F0 @ =gMain
	ldr r0, _081239F4 @ =0x0000043c
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_081239E4: .4byte gSpecialVar_0x8004
_081239E8: .4byte gUnknown_02039274
_081239EC: .4byte 0x02019090
_081239F0: .4byte gMain
_081239F4: .4byte 0x0000043c
_081239F8:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r1, 0x3
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r0, _08123A24 @ =0x000001a9
	movs r1, 0x1
	bl FadeInNewBGM
	movs r0, 0x1
	bl sub_8123FBC
	ldr r1, _08123A28 @ =gMain
	ldr r2, _08123A2C @ =0x0000043c
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x1
	b _08123A8C
	.align 2, 0
_08123A24: .4byte 0x000001a9
_08123A28: .4byte gMain
_08123A2C: .4byte 0x0000043c
_08123A30:
	ldr r3, _08123A64 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08123A68 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _08123A6C @ =sub_8123C40
	bl SetVBlankCallback
	ldr r0, _08123A70 @ =sub_8123724
	bl SetMainCallback2
	ldr r0, _08123A74 @ =sub_8123878
	movs r1, 0
	bl CreateTask
	ldr r0, _08123A78 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _08123A80
	ldr r0, _08123A7C @ =sub_81239E4
	b _08123A82
	.align 2, 0
_08123A64: .4byte 0x04000208
_08123A68: .4byte 0x04000200
_08123A6C: .4byte sub_8123C40
_08123A70: .4byte sub_8123724
_08123A74: .4byte sub_8123878
_08123A78: .4byte gSpecialVar_0x8004
_08123A7C: .4byte sub_81239E4
_08123A80:
	ldr r0, _08123A9C @ =sub_8123AF8
_08123A82:
	movs r1, 0x1
	bl CreateTask
	ldr r1, _08123AA0 @ =gUnknown_02039274
	ldr r1, [r1]
_08123A8C:
	strb r0, [r1]
_08123A8E:
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123A9C: .4byte sub_8123AF8
_08123AA0: .4byte gUnknown_02039274
	thumb_func_end sub_8123244

	thumb_func_start sub_8123724
sub_8123724: @ 8123AA4
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl MapMusicMain
	pop {r0}
	bx r0
	thumb_func_end sub_8123724

	thumb_func_start sub_8123740
sub_8123740: @ 8123AC0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	movs r4, 0
	movs r0, 0
	bl sub_8123FBC
	ldr r0, _08123BD4 @ =gSpriteCoordOffsetX
	strh r4, [r0]
	movs r0, 0
	bl sub_807C9B4
	add r7, sp, 0x4
	ldr r0, _08123BD8 @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r1, r0, 0
	adds r1, 0xF0
	movs r2, 0
_08123AE6:
	lsls r0, r4, 2
	adds r0, r1, r0
	str r2, [r0]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123AE6
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	ldr r2, _08123BDC @ =0x02000000
	movs r3, 0x80
	lsls r3, 10
	movs r5, 0
	ldr r1, _08123BE0 @ =0x040000d4
	movs r4, 0x80
	lsls r4, 5
	ldr r6, _08123BE4 @ =0x85000400
	movs r0, 0x85
	lsls r0, 24
	mov r12, r0
_08123B18:
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r4
	subs r3, r4
	cmp r3, r4
	bhi _08123B18
	str r5, [sp]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 2
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r1, _08123BE8 @ =gUnknown_02039274
	movs r0, 0
	str r0, [r1]
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	adds r2, r7, 0
	movs r6, 0
	ldr r1, _08123BE0 @ =0x040000d4
	movs r5, 0x80
	lsls r5, 5
	ldr r0, _08123BEC @ =0x81000800
	mov r12, r0
	movs r0, 0x81
	lsls r0, 24
	mov r8, r0
_08123B60:
	strh r6, [r2]
	str r2, [r1]
	str r3, [r1, 0x4]
	mov r0, r12
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _08123B60
	strh r6, [r7]
	str r7, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r2, r8
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp]
	ldr r2, _08123BE0 @ =0x040000d4
	mov r1, sp
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r0, 0xA0
	lsls r0, 19
	strh r4, [r7]
	str r7, [r2]
	str r0, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	bl warp_in
	ldr r0, _08123BF0 @ =gUnknown_0300485C
	str r4, [r0]
	ldr r0, _08123BF4 @ =CB2_LoadMap
	bl SetMainCallback2
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123BD4: .4byte gSpriteCoordOffsetX
_08123BD8: .4byte gUnknown_08396FC4
_08123BDC: .4byte 0x02000000
_08123BE0: .4byte 0x040000d4
_08123BE4: .4byte 0x85000400
_08123BE8: .4byte gUnknown_02039274
_08123BEC: .4byte 0x81000800
_08123BF0: .4byte gUnknown_0300485C
_08123BF4: .4byte CB2_LoadMap
	thumb_func_end sub_8123740

	thumb_func_start sub_8123878
sub_8123878: @ 8123BF8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r5, _08123C24 @ =gUnknown_02039274
	ldr r3, [r5]
	ldrh r0, [r3, 0x6]
	adds r0, 0x1
	strh r0, [r3, 0x6]
	ldrb r2, [r3, 0x1]
	adds r7, r5, 0
	cmp r2, 0x2
	beq _08123CFE
	cmp r2, 0x2
	bgt _08123C28
	cmp r2, 0
	beq _08123C36
	cmp r2, 0x1
	beq _08123C50
	b _08123D56
	.align 2, 0
_08123C24: .4byte gUnknown_02039274
_08123C28:
	cmp r2, 0x3
	bne _08123C2E
	b _08123D24
_08123C2E:
	cmp r2, 0xFF
	bne _08123C34
	b _08123D3C
_08123C34:
	b _08123D56
_08123C36:
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r3, 0x4]
	cmp r0, r1
	beq _08123C42
	b _08123D56
_08123C42:
	ldrb r0, [r3, 0x2]
	bl DoWeatherEffect
	ldr r1, [r5]
	movs r0, 0x1
	strb r0, [r1, 0x1]
	b _08123D56
_08123C50:
	ldrb r0, [r3, 0x2]
	cmp r0, 0x2
	beq _08123CA4
	cmp r0, 0x7
	beq _08123C5C
	b _08123D56
_08123C5C:
	ldr r0, _08123CA0 @ =gUnknown_08396FC4
	ldr r0, [r0]
	adds r2, r0, 0
	adds r2, 0xF0
	ldr r0, [r2]
	cmp r0, 0
	beq _08123D56
	ldrb r1, [r0, 0x5]
	movs r0, 0xC
	ands r0, r1
	cmp r0, 0
	beq _08123D56
	adds r3, r2, 0
	movs r5, 0xD
	negs r5, r5
_08123C7A:
	lsls r0, r4, 2
	adds r0, r3, r0
	ldr r2, [r0]
	cmp r2, 0
	beq _08123C8C
	ldrb r1, [r2, 0x5]
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2, 0x5]
_08123C8C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123C7A
	ldr r1, [r7]
	movs r0, 0x2
	strb r0, [r1, 0x1]
	b _08123D56
	.align 2, 0
_08123CA0: .4byte gUnknown_08396FC4
_08123CA4:
	ldr r0, _08123CB8 @ =gUnknown_08396FC4
	ldr r2, [r0]
	movs r1, 0xDA
	lsls r1, 3
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bne _08123CBC
	strb r0, [r3, 0x1]
	b _08123D56
	.align 2, 0
_08123CB8: .4byte gUnknown_08396FC4
_08123CBC:
	ldrh r1, [r3, 0x6]
	ldrh r0, [r3, 0x4]
	adds r0, 0x8
	cmp r1, r0
	blt _08123D56
	adds r6, r2, 0
	adds r6, 0xF0
	movs r5, 0x1
	movs r7, 0x5
	negs r7, r7
_08123CD0:
	lsls r0, r4, 2
	adds r0, r6, r0
	ldr r0, [r0]
	cmp r0, 0
	beq _08123CF2
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r2, [r3]
	lsls r1, r2, 29
	lsrs r1, 31
	eors r1, r5
	ands r1, r5
	lsls r1, 2
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08123CF2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _08123CD0
	b _08123D56
_08123CFE:
	lsls r1, r0, 16
	ldr r0, _08123D20 @ =0x023a0000
	cmp r1, r0
	bne _08123D56
	movs r0, 0x3
	strb r0, [r3, 0x1]
	subs r0, 0x4
	str r4, [sp]
	movs r1, 0x3
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x4
	bl FadeOutBGM
	b _08123D56
	.align 2, 0
_08123D20: .4byte 0x023a0000
_08123D24:
	ldr r0, _08123D38 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08123D56
	movs r0, 0xFF
	strb r0, [r3, 0x1]
	b _08123D56
	.align 2, 0
_08123D38: .4byte gPaletteFade
_08123D3C:
	movs r0, 0
	bl SetVBlankCallback
	adds r0, r6, 0
	bl DestroyTask
	ldr r0, [r5]
	ldrb r0, [r0]
	bl DestroyTask
	ldr r0, _08123D60 @ =sub_8123740
	bl SetMainCallback2
_08123D56:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08123D60: .4byte sub_8123740
	thumb_func_end sub_8123878

	thumb_func_start sub_81239E4
sub_81239E4: @ 8123D64
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08123DB8 @ =gUnknown_02039274
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08123E40
	ldrb r0, [r1, 0x14]
	subs r0, 0x1
	strb r0, [r1, 0x14]
	ldr r1, [r6]
	ldrh r0, [r1, 0x6]
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	bne _08123D8A
	ldrb r0, [r1, 0x15]
	subs r0, 0x1
	strb r0, [r1, 0x15]
_08123D8A:
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08123DA4
	ldrb r0, [r2, 0xC]
	subs r0, 0x1
	strb r0, [r2, 0xC]
	ldr r1, [r6]
	ldrb r0, [r1, 0xD]
	subs r0, 0x1
	strb r0, [r1, 0xD]
_08123DA4:
	ldr r0, [r6]
	ldrb r1, [r0, 0x14]
	cmp r1, 0x20
	beq _08123DF4
	cmp r1, 0x20
	bgt _08123DBC
	cmp r1, 0x10
	beq _08123E10
	b _08123E40
	.align 2, 0
_08123DB8: .4byte gUnknown_02039274
_08123DBC:
	cmp r1, 0x28
	beq _08123DE0
	cmp r1, 0xAF
	bne _08123E40
	ldr r1, _08123DDC @ =0x000008fc
	adds r0, r1
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x16
	bl sub_8124E7C
	b _08123E40
	.align 2, 0
_08123DDC: .4byte 0x000008fc
_08123DE0:
	ldr r1, _08123DF0 @ =0x000008fc
	adds r0, r1
	movs r1, 0x2
	str r1, [sp]
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x3
	b _08123E02
	.align 2, 0
_08123DF0: .4byte 0x000008fc
_08123DF4:
	ldr r1, _08123E0C @ =0x000008fc
	adds r0, r1
	str r3, [sp]
	movs r1, 0x2
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0x2
_08123E02:
	movs r3, 0
	bl sub_8124E7C
	b _08123E40
	.align 2, 0
_08123E0C: .4byte 0x000008fc
_08123E10:
	ldr r5, _08123E68 @ =0x000008fc
	adds r0, r5
	ldr r1, _08123E6C @ =gCableCarPylonHookTilemapEntries
	movs r2, 0x5
	str r2, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r2, 0
	movs r3, 0
	bl sub_8124F08
	ldr r0, [r6]
	adds r0, r5
	ldr r1, _08123E70 @ =0x020199d8
	str r4, [sp]
	movs r2, 0x1E
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	ldr r1, [r6]
	movs r0, 0x40
	strb r0, [r1, 0x15]
_08123E40:
	bl sub_812453C
	ldr r3, _08123E74 @ =gSpriteCoordOffsetX
	movs r0, 0
	ldrsh r2, [r3, r0]
	adds r1, r2, 0x1
	adds r0, r1, 0
	cmp r1, 0
	bge _08123E56
	adds r0, r2, 0
	adds r0, 0x80
_08123E56:
	asrs r0, 7
	lsls r0, 7
	subs r0, r1, r0
	strh r0, [r3]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123E68: .4byte 0x000008fc
_08123E6C: .4byte gCableCarPylonHookTilemapEntries
_08123E70: .4byte 0x020199d8
_08123E74: .4byte gSpriteCoordOffsetX
	thumb_func_end sub_81239E4

	thumb_func_start sub_8123AF8
sub_8123AF8: @ 8123E78
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r6, _08123ECC @ =gUnknown_02039274
	ldr r1, [r6]
	ldrb r0, [r1, 0x1]
	cmp r0, 0xFF
	beq _08123F6E
	ldrb r0, [r1, 0x14]
	adds r0, 0x1
	strb r0, [r1, 0x14]
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08123E9E
	ldrb r0, [r2, 0x15]
	adds r0, 0x1
	strb r0, [r2, 0x15]
_08123E9E:
	ldr r2, [r6]
	ldrh r0, [r2, 0x6]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08123EB8
	ldrb r0, [r2, 0xC]
	adds r0, 0x1
	strb r0, [r2, 0xC]
	ldr r1, [r6]
	ldrb r0, [r1, 0xD]
	adds r0, 0x1
	strb r0, [r1, 0xD]
_08123EB8:
	ldr r3, [r6]
	ldrb r0, [r3, 0x14]
	cmp r0, 0x20
	beq _08123F30
	cmp r0, 0x20
	bgt _08123ED0
	cmp r0, 0x10
	beq _08123EF8
	b _08123F6E
	.align 2, 0
_08123ECC: .4byte gUnknown_02039274
_08123ED0:
	cmp r0, 0x28
	beq _08123F5C
	cmp r0, 0xB0
	bne _08123F6E
	ldr r1, _08123EF0 @ =0x000008fc
	adds r0, r3, r1
	ldr r1, _08123EF4 @ =0x020199d8
	movs r2, 0x2
	str r2, [sp]
	movs r2, 0x1E
	str r2, [sp, 0x4]
	movs r2, 0
	movs r3, 0x2
	bl sub_8124F08
	b _08123F6E
	.align 2, 0
_08123EF0: .4byte 0x000008fc
_08123EF4: .4byte 0x020199d8
_08123EF8:
	ldr r5, _08123F2C @ =0x000008fc
	adds r0, r3, r5
	movs r1, 0x3
	str r1, [sp]
	movs r4, 0x2
	str r4, [sp, 0x4]
	movs r1, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8124E7C
	ldr r0, [r6]
	adds r0, r5
	str r4, [sp]
	movs r1, 0xA
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	movs r3, 0x16
	bl sub_8124E7C
	ldr r1, [r6]
	movs r0, 0xC0
	strb r0, [r1, 0x15]
	b _08123F6E
	.align 2, 0
_08123F2C: .4byte 0x000008fc
_08123F30:
	ldr r1, _08123F54 @ =0x0840e364
	ldrh r2, [r1]
	movs r4, 0x90
	lsls r4, 4
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1, 0x2]
	adds r4, 0x2
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r2, [r1, 0xA]
	adds r4, 0x3E
	adds r0, r3, r4
	strh r2, [r0]
	ldrh r1, [r1, 0xC]
	ldr r2, _08123F58 @ =0x00000942
	b _08123F6A
	.align 2, 0
_08123F54: .4byte 0x0840e364
_08123F58: .4byte 0x00000942
_08123F5C:
	ldr r2, _08123F88 @ =0x0840e368
	ldrh r1, [r2]
	ldr r4, _08123F8C @ =0x00000904
	adds r0, r3, r4
	strh r1, [r0]
	ldrh r1, [r2, 0xA]
	ldr r2, _08123F90 @ =0x00000944
_08123F6A:
	adds r0, r3, r2
	strh r1, [r0]
_08123F6E:
	bl sub_8124598
	ldr r0, _08123F94 @ =gUnknown_02039274
	ldr r1, [r0]
	ldrh r0, [r1, 0x6]
	ldrh r1, [r1, 0x4]
	cmp r0, r1
	bcs _08123F9C
	ldr r4, _08123F98 @ =gSpriteCoordOffsetX
	movs r1, 0
	ldrsh r0, [r4, r1]
	b _08123FA6
	.align 2, 0
_08123F88: .4byte 0x0840e368
_08123F8C: .4byte 0x00000904
_08123F90: .4byte 0x00000944
_08123F94: .4byte gUnknown_02039274
_08123F98: .4byte gSpriteCoordOffsetX
_08123F9C:
	ldr r0, _08123FB8 @ =gUnknown_08396FC4
	ldr r4, [r0]
	ldr r2, _08123FBC @ =0x000006fc
	adds r4, r2
	ldrh r0, [r4]
_08123FA6:
	adds r0, 0xF7
	movs r1, 0xF8
	bl __modsi3
	strh r0, [r4]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08123FB8: .4byte gUnknown_08396FC4
_08123FBC: .4byte 0x000006fc
	thumb_func_end sub_8123AF8

	thumb_func_start sub_8123C40
sub_8123C40: @ 8123FC0
	push {r4,lr}
	ldr r1, _0812401C @ =0x040000d4
	ldr r0, _08124020 @ =gUnknown_02039274
	ldr r2, [r0]
	adds r0, r2, 0
	adds r0, 0xFC
	str r0, [r1]
	ldr r0, _08124024 @ =0x0600e000
	str r0, [r1, 0x4]
	ldr r3, _08124028 @ =0x80000400
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r4, _0812402C @ =0x000008fc
	adds r0, r2, r4
	str r0, [r1]
	ldr r0, _08124030 @ =0x0600f800
	str r0, [r1, 0x4]
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	subs r1, 0xB8
	ldrb r0, [r2, 0x14]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x15]
	strh r0, [r1]
	subs r1, 0xA
	ldrb r0, [r2, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0xD]
	strh r0, [r1]
	subs r1, 0x6
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x9]
	strh r0, [r1]
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0812401C: .4byte 0x040000d4
_08124020: .4byte gUnknown_02039274
_08124024: .4byte 0x0600e000
_08124028: .4byte 0x80000400
_0812402C: .4byte 0x000008fc
_08124030: .4byte 0x0600f800
	thumb_func_end sub_8123C40

	thumb_func_start nullsub_76
nullsub_76: @ 8124034
	bx lr
	thumb_func_end nullsub_76

	thumb_func_start sub_8123CB8
sub_8123CB8: @ 8124038
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _081240A0 @ =gUnknown_02039274
	ldr r6, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0xFF
	beq _08124104
	ldr r0, _081240A4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _081240B4
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08124062
	ldr r1, _081240A8 @ =0x47800000
	bl __addsf3
_08124062:
	ldr r1, _081240AC @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	subs r1, r0
	strh r1, [r5, 0x20]
	movs r1, 0x6
	ldrsh r4, [r6, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _0812408A
	ldr r1, _081240A8 @ =0x47800000
	bl __addsf3
_0812408A:
	ldr r1, _081240B0 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x22]
	b _08124104
	.align 2, 0
_081240A0: .4byte gUnknown_02039274
_081240A4: .4byte gSpecialVar_0x8004
_081240A8: .4byte 0x47800000
_081240AC: .4byte 0x3e0f5c29
_081240B0: .4byte 0x3d89374c
_081240B4:
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _081240C8
	ldr r1, _0812410C @ =0x47800000
	bl __addsf3
_081240C8:
	ldr r1, _08124110 @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	adds r0, r1
	strh r0, [r5, 0x20]
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _081240F0
	ldr r1, _0812410C @ =0x47800000
	bl __addsf3
_081240F0:
	ldr r1, _08124114 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x22]
_08124104:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0812410C: .4byte 0x47800000
_08124110: .4byte 0x3e0f5c29
_08124114: .4byte 0x3d89374c
	thumb_func_end sub_8123CB8

	thumb_func_start sub_8123D98
sub_8123D98: @ 8124118
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _08124184 @ =gUnknown_02039274
	ldr r6, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0xFF
	bne _08124128
	b _08124230
_08124128:
	ldr r0, _08124188 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _08124198
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _08124144
	ldr r1, _0812418C @ =0x47800000
	bl __addsf3
_08124144:
	ldr r1, _08124190 @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	subs r1, r0
	strh r1, [r5, 0x20]
	movs r1, 0x6
	ldrsh r4, [r6, r1]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _0812416C
	ldr r1, _0812418C @ =0x47800000
	bl __addsf3
_0812416C:
	ldr r1, _08124194 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	subs r1, r0
	strh r1, [r5, 0x22]
	b _081241E8
	.align 2, 0
_08124184: .4byte gUnknown_02039274
_08124188: .4byte gSpecialVar_0x8004
_0812418C: .4byte 0x47800000
_08124190: .4byte 0x3e0f5c29
_08124194: .4byte 0x3d89374c
_08124198:
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _081241AC
	ldr r1, _0812420C @ =0x47800000
	bl __addsf3
_081241AC:
	ldr r1, _08124210 @ =0x3e0f5c29
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x2E]
	adds r0, r1
	strh r0, [r5, 0x20]
	movs r0, 0x6
	ldrsh r4, [r6, r0]
	adds r0, r4, 0
	bl __floatsisf
	cmp r4, 0
	bge _081241D4
	ldr r1, _0812420C @ =0x47800000
	bl __addsf3
_081241D4:
	ldr r1, _08124214 @ =0x3d89374c
	bl __mulsf3
	bl __fixunssfsi
	lsls r0, 24
	lsrs r0, 24
	ldrh r1, [r5, 0x30]
	adds r0, r1
	strh r0, [r5, 0x22]
_081241E8:
	movs r0, 0x32
	ldrsh r2, [r5, r0]
	cmp r2, 0
	bne _08124218
	movs r0, 0x11
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x34]
	adds r1, r0, 0x1
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08124230
	strh r2, [r5, 0x34]
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	b _08124230
	.align 2, 0
_0812420C: .4byte 0x47800000
_08124210: .4byte 0x3e0f5c29
_08124214: .4byte 0x3d89374c
_08124218:
	movs r2, 0
	movs r0, 0x10
	strh r0, [r5, 0x26]
	ldrh r0, [r5, 0x34]
	adds r1, r0, 0x1
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x9
	ble _08124230
	strh r2, [r5, 0x34]
	strh r2, [r5, 0x32]
_08124230:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8123D98

	thumb_func_start sub_8123EB8
sub_8123EB8: @ 8124238
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _08124268
	adds r0, r2, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	lsls r0, 1
	ldrh r3, [r2, 0x20]
	adds r0, r3
	strh r0, [r2, 0x20]
	ldrh r1, [r2, 0x22]
	adds r1, 0x10
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r2, 0x22]
_08124268:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _081242BE
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08124288
	cmp r1, 0x1
	beq _08124292
	b _081242B0
_08124288:
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	b _081242A2
_08124292:
	ldrh r0, [r2, 0x2E]
	ands r0, r1
	cmp r0, 0
	beq _081242B0
	ldrh r0, [r2, 0x20]
	adds r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x20]
_081242A2:
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _081242B0
	ldrh r0, [r2, 0x22]
	adds r0, 0x1
	strh r0, [r2, 0x22]
_081242B0:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	cmp r0, 0xA0
	ble _081242BE
	adds r0, r2, 0
	bl DestroySprite
_081242BE:
	pop {r0}
	bx r0
	thumb_func_end sub_8123EB8

	thumb_func_start sub_8123F44
sub_8123F44: @ 81242C4
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bne _081242E2
	ldrh r1, [r2, 0x22]
	adds r1, 0x10
	adds r0, r2, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	strh r0, [r2, 0x22]
_081242E2:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	lsls r0, 16
	asrs r0, 16
	movs r3, 0x32
	ldrsh r1, [r2, r3]
	cmp r0, r1
	blt _08124338
	movs r0, 0x30
	ldrsh r1, [r2, r0]
	cmp r1, 0
	beq _08124302
	cmp r1, 0x1
	beq _0812430C
	b _0812432A
_08124302:
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x2E]
	b _0812431C
_0812430C:
	ldrh r0, [r2, 0x2E]
	ands r0, r1
	cmp r0, 0
	beq _0812432A
	ldrh r0, [r2, 0x20]
	subs r0, 0x1
	strh r0, [r2, 0x20]
	ldrh r0, [r2, 0x20]
_0812431C:
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0812432A
	ldrh r0, [r2, 0x22]
	subs r0, 0x1
	strh r0, [r2, 0x22]
_0812432A:
	movs r1, 0x22
	ldrsh r0, [r2, r1]
	cmp r0, 0x4F
	bgt _08124338
	adds r0, r2, 0
	bl DestroySprite
_08124338:
	pop {r0}
	bx r0
	thumb_func_end sub_8123F44

	thumb_func_start sub_8123FBC
sub_8123FBC: @ 812433C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0812434A
	cmp r0, 0x1
	beq _081243A4
_0812434A:
	ldr r1, _081243A0 @ =0x04000048
	movs r0, 0
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0xA
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x46
	strh r0, [r1]
	adds r1, 0xE
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	subs r1, 0x2
	strh r0, [r1]
	adds r1, 0x14
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	subs r1, 0x6
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r1, 0x3E
	strh r0, [r1]
	b _0812446E
	.align 2, 0
_081243A0: .4byte 0x04000048
_081243A4:
	ldr r0, _081243E0 @ =0x04000048
	movs r3, 0
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	subs r0, 0xA
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	adds r0, 0x2
	strh r3, [r0]
	ldr r0, _081243E4 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _081243EC
	ldr r1, _081243E8 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0xB0
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0x10
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x50
	b _08124402
	.align 2, 0
_081243E0: .4byte 0x04000048
_081243E4: .4byte gSpecialVar_0x8004
_081243E8: .4byte gUnknown_02039274
_081243EC:
	ldr r1, _08124474 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x60
	strb r0, [r2, 0x14]
	ldr r2, [r1]
	movs r0, 0xE8
	strb r0, [r2, 0x15]
	ldr r0, [r1]
	strb r3, [r0, 0xC]
	ldr r2, [r1]
	movs r0, 0x4
_08124402:
	strb r0, [r2, 0xD]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	ldr r0, [r1]
	strb r3, [r0, 0x9]
	adds r2, r1, 0
	ldr r1, _08124478 @ =0x0400001c
	ldr r2, [r2]
	ldrb r0, [r2, 0x14]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x15]
	strh r0, [r1]
	ldr r0, _0812447C @ =0x04000018
	movs r1, 0
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08124480 @ =0x04000014
	ldrb r0, [r2, 0xC]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0xD]
	strh r0, [r1]
	subs r1, 0x6
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	adds r1, 0x2
	ldrb r0, [r2, 0x9]
	strh r0, [r1]
	subs r1, 0xA
	ldr r2, _08124484 @ =0x00003c01
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r3, _08124488 @ =0x00003d02
	adds r0, r3, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0812448C @ =0x00003e03
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _08124490 @ =0x0400000e
	movs r3, 0xFC
	lsls r3, 6
	adds r2, r3, 0
	strh r2, [r0]
	subs r1, 0xC
	movs r3, 0xFA
	lsls r3, 5
	adds r0, r3, 0
	strh r0, [r1]
	ldr r0, _08124494 @ =0x04000050
	strh r2, [r0]
_0812446E:
	pop {r0}
	bx r0
	.align 2, 0
_08124474: .4byte gUnknown_02039274
_08124478: .4byte 0x0400001c
_0812447C: .4byte 0x04000018
_08124480: .4byte 0x04000014
_08124484: .4byte 0x00003c01
_08124488: .4byte 0x00003d02
_0812448C: .4byte 0x00003e03
_08124490: .4byte 0x0400000e
_08124494: .4byte 0x04000050
	thumb_func_end sub_8123FBC

	thumb_func_start sub_8124118
sub_8124118: @ 8124498
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	ldr r1, _081245AC @ =gCableCarPlayerGraphicsIDs
	add r0, sp, 0x8
	movs r2, 0x2
	bl memcpy
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	add r6, sp, 0xC
	ldr r1, _081245B0 @ =gMtChimneyHikerGraphicsIDs
	adds r0, r6, 0
	movs r2, 0x4
	bl memcpy
	add r5, sp, 0x10
	ldr r1, _081245B4 @ =gMtChimneyHikerCoords
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	add r4, sp, 0x18
	ldr r1, _081245B8 @ =gMtChimneyHikerMovementDelayTable
	adds r0, r4, 0
	movs r2, 0x4
	bl memcpy
	ldr r0, _081245BC @ =gUnknown_08401D9C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp, 0x1C]
	str r1, [sp, 0x20]
	ldr r0, _081245C0 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	mov r8, r6
	mov r10, r5
	cmp r0, 0
	beq _081244F6
	cmp r0, 0x1
	beq _081245D8
_081244F6:
	ldr r0, _081245C4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _081245C8 @ =sub_8123D98
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0xC8
	movs r3, 0x49
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _0812453E
	ldr r0, _081245CC @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0xC8
	strh r0, [r1, 0x2E]
	movs r0, 0x49
	strh r0, [r1, 0x30]
_0812453E:
	ldr r4, _081245D0 @ =gSpriteTemplate_8401D40
	adds r0, r4, 0
	movs r1, 0xB0
	movs r2, 0x2B
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _081245CC @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0xB0
	strh r1, [r0, 0x2E]
	movs r1, 0x2B
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0xC8
	movs r2, 0x63
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0xC8
	strh r1, [r0, 0x2E]
	movs r1, 0x63
	strh r1, [r0, 0x30]
	ldr r2, _081245D4 @ =gUnknown_02039274
	ldr r1, [r2]
	movs r0, 0x7
	strb r0, [r1, 0x2]
	ldr r1, [r2]
	movs r0, 0xAF
	lsls r0, 1
	strh r0, [r1, 0x4]
	movs r0, 0x2
	bl sub_807C9B4
	b _0812469E
	.align 2, 0
_081245AC: .4byte gCableCarPlayerGraphicsIDs
_081245B0: .4byte gMtChimneyHikerGraphicsIDs
_081245B4: .4byte gMtChimneyHikerCoords
_081245B8: .4byte gMtChimneyHikerMovementDelayTable
_081245BC: .4byte gUnknown_08401D9C
_081245C0: .4byte gSpecialVar_0x8004
_081245C4: .4byte gSaveBlock2
_081245C8: .4byte sub_8123D98
_081245CC: .4byte gSprites
_081245D0: .4byte gSpriteTemplate_8401D40
_081245D4: .4byte gUnknown_02039274
_081245D8:
	ldr r7, _0812476C @ =gUnknown_02039274
	ldr r0, [r7]
	adds r0, 0xFC
	ldr r1, _08124770 @ =0x02019048
	movs r2, 0xC
	str r2, [sp]
	movs r2, 0x3
	str r2, [sp, 0x4]
	movs r2, 0x18
	movs r3, 0x1A
	bl sub_8124F08
	ldr r0, _08124774 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	add r0, sp
	adds r0, 0x8
	ldrb r0, [r0]
	ldr r1, _08124778 @ =sub_8123D98
	movs r2, 0x66
	str r2, [sp]
	movs r2, 0x80
	movs r3, 0x27
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _08124638
	ldr r0, _0812477C @ =gSprites
	lsls r1, r6, 4
	adds r1, r6
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	movs r2, 0x8
	orrs r0, r2
	strb r0, [r1, 0x5]
	movs r0, 0x8
	strh r0, [r1, 0x24]
	movs r0, 0x10
	strh r0, [r1, 0x26]
	movs r0, 0x80
	strh r0, [r1, 0x2E]
	movs r0, 0x27
	strh r0, [r1, 0x30]
_08124638:
	ldr r4, _08124780 @ =gSpriteTemplate_8401D40
	adds r0, r4, 0
	movs r1, 0x68
	movs r2, 0x9
	movs r3, 0x67
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r5, _0812477C @ =gSprites
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x20
	strh r1, [r0, 0x26]
	strh r1, [r0, 0x24]
	movs r1, 0x68
	strh r1, [r0, 0x2E]
	movs r1, 0x9
	strh r1, [r0, 0x30]
	adds r4, 0x18
	adds r0, r4, 0
	movs r1, 0x80
	movs r2, 0x41
	movs r3, 0x65
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	movs r1, 0x4
	strh r1, [r0, 0x26]
	movs r1, 0x80
	strh r1, [r0, 0x2E]
	movs r1, 0x41
	strh r1, [r0, 0x30]
	ldr r1, [r7]
	movs r0, 0x2
	strb r0, [r1, 0x2]
	ldr r1, [r7]
	ldr r0, _08124784 @ =0x00000109
	strh r0, [r1, 0x4]
	movs r0, 0x7
	bl sub_807C9B4
_0812469E:
	movs r4, 0
	ldr r5, _0812477C @ =gSprites
_081246A2:
	lsls r1, r4, 20
	movs r0, 0xC0
	lsls r0, 15
	adds r1, r0
	asrs r1, 16
	lsls r2, r4, 19
	ldr r3, _08124788 @ =0xfff80000
	adds r2, r3
	asrs r2, 16
	ldr r0, _0812478C @ =gSpriteTemplate_8401D70
	movs r3, 0x68
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r5
	movs r1, 0x8
	strh r1, [r0, 0x24]
	strh r1, [r0, 0x26]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _081246A2
	movs r0, 0x3F
	mov r4, r9
	ands r0, r4
	cmp r0, 0
	bne _081247D8
	mov r0, r9
	movs r1, 0x3
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 16
	add r0, r8
	ldrb r0, [r0]
	ldr r5, _08124790 @ =gSpecialVar_0x8004
	ldrh r4, [r5]
	lsls r4, 2
	add r1, sp, 0x1C
	adds r1, r4, r1
	ldr r1, [r1]
	mov r3, r10
	adds r2, r3, r4
	movs r3, 0
	ldrsh r2, [r2, r3]
	mov r3, sp
	adds r3, 0x12
	adds r3, r4
	movs r4, 0
	ldrsh r3, [r3, r4]
	movs r4, 0x6A
	str r4, [sp]
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _081247D8
	ldr r1, _0812477C @ =gSprites
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r4, r0, r1
	ldrb r1, [r4, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x24]
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	negs r0, r0
	strh r0, [r4, 0x26]
	ldrh r0, [r5]
	mov r8, r2
	cmp r0, 0
	bne _0812479A
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _08124794
	adds r0, r4, 0
	movs r1, 0x6
	b _081247A8
	.align 2, 0
_0812476C: .4byte gUnknown_02039274
_08124770: .4byte 0x02019048
_08124774: .4byte gSaveBlock2
_08124778: .4byte sub_8123D98
_0812477C: .4byte gSprites
_08124780: .4byte gSpriteTemplate_8401D40
_08124784: .4byte 0x00000109
_08124788: .4byte 0xfff80000
_0812478C: .4byte gSpriteTemplate_8401D70
_08124790: .4byte gSpecialVar_0x8004
_08124794:
	adds r0, r4, 0
	movs r1, 0x7
	b _081247BA
_0812479A:
	movs r7, 0x1
	mov r5, r9
	ands r5, r7
	cmp r5, 0
	beq _081247B6
	adds r0, r4, 0
	movs r1, 0x7
_081247A8:
	bl StartSpriteAnim
	strh r7, [r4, 0x30]
	ldrh r0, [r4, 0x22]
	adds r0, 0x2
	strh r0, [r4, 0x22]
	b _081247C0
_081247B6:
	adds r0, r4, 0
	movs r1, 0x6
_081247BA:
	bl StartSpriteAnim
	strh r5, [r4, 0x30]
_081247C0:
	ldr r0, _081247E8 @ =gSprites
	mov r2, r8
	adds r1, r2, r6
	lsls r1, 2
	adds r1, r0
	movs r0, 0x3
	mov r3, r9
	ands r0, r3
	add r0, sp
	adds r0, 0x18
	ldrb r0, [r0]
	strh r0, [r1, 0x32]
_081247D8:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081247E8: .4byte gSprites
	thumb_func_end sub_8124118

	thumb_func_start sub_812446C
sub_812446C: @ 81247EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r3, 0
	mov r9, r3
	ldr r2, _081248B0 @ =gUnknown_02039274
	ldr r0, [r2]
	ldrb r1, [r0, 0x1B]
	adds r1, 0x2
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 26
	lsrs r0, 24
	mov r12, r0
_0812480E:
	movs r6, 0
	lsls r0, r3, 1
	adds r1, r3, 0x3
	adds r2, r3, 0x6
	adds r4, r3, 0x1
	str r4, [sp]
	adds r0, r3
	lsls r0, 3
	mov r10, r0
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	mov r8, r0
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	str r0, [sp, 0x4]
_08124830:
	ldr r7, _081248B0 @ =gUnknown_02039274
	ldr r5, [r7]
	lsls r3, r6, 1
	mov r0, r10
	adds r2, r3, r0
	adds r4, r5, 0
	adds r4, 0x22
	adds r2, r4, r2
	mov r1, r12
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	lsls r1, 1
	ldr r7, _081248B4 @ =0x02019000
	adds r1, r7
	ldrh r0, [r1]
	strh r0, [r2]
	mov r0, r8
	adds r1, r3, r0
	adds r1, r4, r1
	mov r7, r9
	lsls r2, r7, 1
	ldr r7, _081248B4 @ =0x02019000
	adds r0, r2, r7
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, [sp, 0x4]
	adds r3, r0
	adds r4, r3
	ldr r1, _081248B8 @ =0x02019048
	adds r2, r1
	ldrh r0, [r2]
	strh r0, [r4]
	mov r0, r9
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xB
	bls _08124830
	ldr r4, [sp]
	lsls r0, r4, 24
	lsrs r3, r0, 24
	cmp r3, 0x2
	bls _0812480E
	ldrb r0, [r5, 0x1B]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strb r0, [r5, 0x1B]
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081248B0: .4byte gUnknown_02039274
_081248B4: .4byte 0x02019000
_081248B8: .4byte 0x02019048
	thumb_func_end sub_812446C

	thumb_func_start sub_812453C
sub_812453C: @ 81248BC
	push {r4,r5,lr}
	ldr r5, _08124914 @ =gUnknown_02039274
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1F]
	ldrb r2, [r1, 0x1D]
	subs r0, r2
	strb r0, [r1, 0x8]
	ldr r2, [r5]
	adds r0, r2, 0
	adds r0, 0x20
	ldrb r0, [r0]
	ldrb r1, [r2, 0x1E]
	subs r0, r1
	strb r0, [r2, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08124900
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_08124900:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _0812490C
	bl sub_81245F4
_0812490C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124914: .4byte gUnknown_02039274
	thumb_func_end sub_812453C

	thumb_func_start sub_8124598
sub_8124598: @ 8124918
	push {r4,r5,lr}
	ldr r5, _08124970 @ =gUnknown_02039274
	ldr r4, [r5]
	ldrb r0, [r4, 0x1C]
	adds r0, 0x1
	movs r1, 0x60
	bl __modsi3
	strb r0, [r4, 0x1C]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	ldrb r2, [r1, 0x1F]
	adds r0, r2
	strb r0, [r1, 0x8]
	ldr r1, [r5]
	adds r2, r1, 0
	adds r2, 0x20
	ldrb r0, [r1, 0x1E]
	ldrb r2, [r2]
	adds r0, r2
	strb r0, [r1, 0x9]
	ldr r1, [r5]
	ldrb r0, [r1, 0x1D]
	adds r0, 0x1
	strb r0, [r1, 0x1D]
	ldr r2, [r5]
	ldrb r0, [r2, 0x1D]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _0812495C
	ldrb r0, [r2, 0x1E]
	adds r0, 0x1
	strb r0, [r2, 0x1E]
_0812495C:
	ldr r0, [r5]
	ldrb r0, [r0, 0x1D]
	cmp r0, 0x10
	bls _08124968
	bl sub_812476C
_08124968:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08124970: .4byte gUnknown_02039274
	thumb_func_end sub_8124598

	thumb_func_start sub_81245F4
sub_81245F4: @ 8124974
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _08124ADC @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0
	adds r3, 0x1E
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	subs r0, 0x2
	strb r0, [r1, 0x18]
	ldr r0, [r2]
	ldrb r1, [r0, 0x1A]
	adds r2, r1, 0
	adds r2, 0x17
	adds r0, r2, 0
	ldr r3, _08124AE0 @ =gUnknown_0203927A
	mov r10, r3
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	mov r4, r10
	strb r0, [r4]
	ldr r7, _08124AE4 @ =gUnknown_02039278
	ldr r0, _08124AE8 @ =gUnknown_02039279
	mov r8, r0
_081249D8:
	mov r1, r9
	ldr r3, [r1]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	mov r2, r10
	ldrb r0, [r2]
	mov r4, r12
	adds r1, r0, r4
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r1, r8
	strb r0, [r1]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r1]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _081249D8
	ldr r4, _08124AE4 @ =gUnknown_02039278
	mov r5, r9
	ldr r3, [r5]
	ldrb r1, [r3, 0x19]
	adds r2, r1, 0
	adds r2, 0x1E
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r4]
	adds r0, r3, 0
	adds r0, 0xFC
	ldrb r2, [r4]
	movs r1, 0x2
	str r1, [sp]
	movs r6, 0x20
	str r6, [sp, 0x4]
	movs r1, 0
	movs r3, 0
	bl sub_8124E7C
	ldr r1, [r5]
	ldrb r0, [r1, 0x18]
	cmp r0, 0
	bne _08124ACC
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x1D
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r3, r9
	ldr r1, [r3]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	mov r4, r9
	ldr r1, [r4]
	ldrb r3, [r1, 0x1A]
	adds r4, r3, 0x1
	adds r0, r4, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r4, r0
	ldr r2, _08124AE4 @ =gUnknown_02039278
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r3, [r2]
	str r6, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	movs r2, 0
	bl sub_8124E7C
_08124ACC:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124ADC: .4byte gUnknown_02039274
_08124AE0: .4byte gUnknown_0203927A
_08124AE4: .4byte gUnknown_02039278
_08124AE8: .4byte gUnknown_02039279
	thumb_func_end sub_81245F4

	thumb_func_start sub_812476C
sub_812476C: @ 8124AEC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r12, r0
	ldr r2, _08124C1C @ =gUnknown_02039274
	ldr r0, [r2]
	mov r1, r12
	strb r1, [r0, 0x1E]
	strb r1, [r0, 0x1D]
	ldr r1, [r2]
	ldrb r0, [r1, 0x8]
	strb r0, [r1, 0x1F]
	ldr r0, [r2]
	ldrb r1, [r0, 0x9]
	adds r0, 0x20
	strb r1, [r0]
	ldr r4, [r2]
	ldrb r1, [r4, 0x19]
	adds r3, r1, 0x2
	adds r0, r3, 0
	mov r9, r2
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r4, 0x19]
	mov r2, r9
	ldr r1, [r2]
	ldrb r0, [r1, 0x18]
	adds r0, 0x2
	strb r0, [r1, 0x18]
	ldr r1, _08124C20 @ =gUnknown_0203927D
	ldr r0, [r2]
	ldrb r0, [r0, 0x1A]
	strb r0, [r1]
	ldr r4, _08124C24 @ =gUnknown_0203927C
	mov r10, r4
	ldr r7, _08124C28 @ =gUnknown_0203927B
	mov r8, r10
_08124B40:
	mov r0, r9
	ldr r3, [r0]
	ldrb r0, [r3, 0x19]
	strb r0, [r7]
	ldr r1, _08124C20 @ =gUnknown_0203927D
	ldrb r0, [r1]
	mov r2, r12
	adds r1, r0, r2
	adds r0, r1, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r1, r0
	mov r4, r8
	strb r0, [r4]
	ldrb r2, [r7]
	lsls r2, 1
	ldrb r0, [r4]
	lsls r0, 6
	adds r2, r0
	adds r6, r3, 0
	adds r6, 0xFC
	adds r2, r6, r2
	ldrb r1, [r3, 0x18]
	lsls r1, 1
	mov r4, r12
	lsls r0, r4, 1
	add r0, r12
	lsls r5, r0, 3
	adds r1, r5
	adds r4, r3, 0
	adds r4, 0x22
	adds r1, r4, r1
	ldrh r0, [r1]
	strh r0, [r2]
	ldrb r1, [r7]
	adds r2, r1, 0x1
	adds r0, r2, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r2, r0
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, 1
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, 6
	adds r1, r0
	adds r1, r6, r1
	ldrb r0, [r3, 0x18]
	adds r0, 0x1
	lsls r0, 1
	adds r0, r5
	adds r0, r4, r0
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, r12
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r12, r0
	cmp r0, 0x8
	bls _08124B40
	mov r4, r9
	ldr r1, [r4]
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0
	adds r3, 0x17
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	mov r2, r10
	strb r0, [r2]
	adds r0, r1, 0
	adds r0, 0xFC
	ldrb r2, [r1, 0x19]
	mov r1, r10
	ldrb r3, [r1]
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0x9
	str r1, [sp, 0x4]
	movs r1, 0
	bl sub_8124E7C
	ldr r1, [r4]
	ldrb r0, [r1, 0x18]
	cmp r0, 0xA
	bne _08124C0C
	ldrb r2, [r1, 0x1A]
	adds r3, r2, 0x3
	adds r0, r3, 0
	asrs r0, 5
	lsls r0, 5
	subs r0, r3, r0
	strb r0, [r1, 0x1A]
	mov r2, r9
	ldr r1, [r2]
	movs r0, 0xFE
	strb r0, [r1, 0x18]
	bl sub_812446C
_08124C0C:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08124C1C: .4byte gUnknown_02039274
_08124C20: .4byte gUnknown_0203927D
_08124C24: .4byte gUnknown_0203927C
_08124C28: .4byte gUnknown_0203927B
	thumb_func_end sub_812476C

	thumb_func_start sub_81248AC
sub_81248AC: @ 8124C2C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08124C3A
	cmp r0, 0x1
	beq _08124C64
_08124C3A:
	ldr r1, _08124C60 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r3, 0
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r0, [r1]
	strb r3, [r0, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0xC
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_81245F4
	b _08124C86
	.align 2, 0
_08124C60: .4byte gUnknown_02039274
_08124C64:
	ldr r1, _08124C94 @ =gUnknown_02039274
	ldr r2, [r1]
	movs r0, 0x2
	strb r0, [r2, 0x1B]
	ldr r2, [r1]
	movs r0, 0x1C
	strb r0, [r2, 0x19]
	ldr r2, [r1]
	movs r0, 0x14
	strb r0, [r2, 0x1A]
	ldr r1, [r1]
	movs r0, 0x4
	strb r0, [r1, 0x18]
	bl sub_812446C
	bl sub_812476C
_08124C86:
	ldr r0, _08124C94 @ =gUnknown_02039274
	ldr r1, [r0]
	movs r0, 0
	strb r0, [r1, 0x1C]
	pop {r0}
	bx r0
	.align 2, 0
_08124C94: .4byte gUnknown_02039274
	thumb_func_end sub_81248AC

	.align 2, 0 @ Don't pad with nop.
