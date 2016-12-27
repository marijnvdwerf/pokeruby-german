	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start load_intro_part2_graphics
load_intro_part2_graphics: @ 8148F48
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08148FA4 @ =gUnknown_0841225C
	ldr r1, _08148FA8 @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _08148FAC @ =gUnknown_084126DC
	ldr r1, _08148FB0 @ =0x06007800
	bl LZ77UnCompVram
	ldr r0, _08148FB4 @ =gUnknown_084121FC
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	cmp r4, 0
	beq _08148F70
	cmp r4, 0x1
	beq _08148FD0
_08148F70:
	ldr r0, _08148FB8 @ =gUnknown_084128D8
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08148FBC @ =gUnknown_08412EB4
	ldr r1, _08148FC0 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08148FC4 @ =gUnknown_08412818
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08148FC8 @ =gUnknown_08416B54
	bl LoadCompressedObjectPic
	ldr r0, _08148FCC @ =gUnknown_08413184
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149248
	b _08149002
	.align 2, 0
_08148FA4: .4byte gUnknown_0841225C
_08148FA8: .4byte 0x06004000
_08148FAC: .4byte gUnknown_084126DC
_08148FB0: .4byte 0x06007800
_08148FB4: .4byte gUnknown_084121FC
_08148FB8: .4byte gUnknown_084128D8
_08148FBC: .4byte gUnknown_08412EB4
_08148FC0: .4byte 0x06003000
_08148FC4: .4byte gUnknown_08412818
_08148FC8: .4byte gUnknown_08416B54
_08148FCC: .4byte gUnknown_08413184
_08148FD0:
	ldr r0, _08149014 @ =gUnknown_08413340
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08149018 @ =gUnknown_084139C8
	ldr r1, _0814901C @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08149020 @ =gUnknown_08413300
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08149024 @ =gUnknown_08416BDC
	bl LoadCompressedObjectPic
	ldr r0, _08149028 @ =gUnknown_08413CCC
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149264
_08149002:
	ldr r1, _0814902C @ =gUnknown_0203935C
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08149030 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149014: .4byte gUnknown_08413340
_08149018: .4byte gUnknown_084139C8
_0814901C: .4byte 0x06003000
_08149020: .4byte gUnknown_08413300
_08149024: .4byte gUnknown_08416BDC
_08149028: .4byte gUnknown_08413CCC
_0814902C: .4byte gUnknown_0203935C
_08149030: .4byte gReservedSpritePaletteCount
	thumb_func_end load_intro_part2_graphics

	thumb_func_start sub_8148C78
sub_8148C78: @ 8149034
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08149060 @ =0x0400000e
	ldr r2, _08149064 @ =0x00000603
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08149068 @ =0x00000f05
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xF2
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08149060: .4byte 0x0400000e
_08149064: .4byte 0x00000603
_08149068: .4byte 0x00000f05
	thumb_func_end sub_8148C78

	thumb_func_start sub_8148CB0
sub_8148CB0: @ 814906C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08149090 @ =gUnknown_0841225C
	ldr r1, _08149094 @ =0x06004000
	bl LZ77UnCompVram
	ldr r0, _08149098 @ =gUnknown_084126DC
	ldr r1, _0814909C @ =0x06007800
	bl LZ77UnCompVram
	cmp r4, 0x4
	bhi _081490B8
	lsls r0, r4, 2
	ldr r1, _081490A0 @ =_081490A4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08149090: .4byte gUnknown_0841225C
_08149094: .4byte 0x06004000
_08149098: .4byte gUnknown_084126DC
_0814909C: .4byte 0x06007800
_081490A0: .4byte _081490A4
	.align 2, 0
_081490A4:
	.4byte _081490B8
	.4byte _08149114
	.4byte _08149180
	.4byte _08149180
	.4byte _081491D8
_081490B8:
	ldr r0, _081490F0 @ =gUnknown_084121FC
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _081490F4 @ =gUnknown_084128D8
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _081490F8 @ =gUnknown_08412EB4
	ldr r1, _081490FC @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08149100 @ =gUnknown_08412818
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08149104 @ =gUnknown_08416B54
	bl LoadCompressedObjectPic
	ldr r0, _08149108 @ =gUnknown_084131C4
	ldr r1, _0814910C @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _08149110 @ =gUnknown_08413184
	b _0814914A
	.align 2, 0
_081490F0: .4byte gUnknown_084121FC
_081490F4: .4byte gUnknown_084128D8
_081490F8: .4byte gUnknown_08412EB4
_081490FC: .4byte 0x06003000
_08149100: .4byte gUnknown_08412818
_08149104: .4byte gUnknown_08416B54
_08149108: .4byte gUnknown_084131C4
_0814910C: .4byte 0x06010000
_08149110: .4byte gUnknown_08413184
_08149114:
	ldr r0, _0814915C @ =gUnknown_0841221C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _08149160 @ =gUnknown_084128D8
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08149164 @ =gUnknown_08412EB4
	ldr r1, _08149168 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _0814916C @ =gUnknown_08412878
	movs r1, 0
	movs r2, 0x60
	bl LoadPalette
	ldr r0, _08149170 @ =gUnknown_08416B54
	bl LoadCompressedObjectPic
	ldr r0, _08149174 @ =gUnknown_084131C4
	ldr r1, _08149178 @ =0x06010000
	bl LZ77UnCompVram
	ldr r0, _0814917C @ =gUnknown_084131A4
_0814914A:
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149248
	b _08149214
	.align 2, 0
_0814915C: .4byte gUnknown_0841221C
_08149160: .4byte gUnknown_084128D8
_08149164: .4byte gUnknown_08412EB4
_08149168: .4byte 0x06003000
_0814916C: .4byte gUnknown_08412878
_08149170: .4byte gUnknown_08416B54
_08149174: .4byte gUnknown_084131C4
_08149178: .4byte 0x06010000
_0814917C: .4byte gUnknown_084131A4
_08149180:
	ldr r0, _081491C0 @ =gUnknown_0841221C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _081491C4 @ =gUnknown_08413340
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _081491C8 @ =gUnknown_084139C8
	ldr r1, _081491CC @ =0x06003000
	bl LZ77UnCompVram
	ldr r4, _081491D0 @ =gUnknown_08413320
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _081491D4 @ =gUnknown_08416BDC
	bl LoadCompressedObjectPic
	movs r1, 0x80
	lsls r1, 1
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149264
	b _08149214
	.align 2, 0
_081491C0: .4byte gUnknown_0841221C
_081491C4: .4byte gUnknown_08413340
_081491C8: .4byte gUnknown_084139C8
_081491CC: .4byte 0x06003000
_081491D0: .4byte gUnknown_08413320
_081491D4: .4byte gUnknown_08416BDC
_081491D8:
	ldr r0, _08149228 @ =gUnknown_0841223C
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0814922C @ =gUnknown_08413E78
	movs r1, 0xC0
	lsls r1, 19
	bl LZ77UnCompVram
	ldr r0, _08149230 @ =gUnknown_08414084
	ldr r1, _08149234 @ =0x06003000
	bl LZ77UnCompVram
	ldr r0, _08149238 @ =gUnknown_08413E38
	movs r1, 0
	movs r2, 0x40
	bl LoadPalette
	ldr r0, _0814923C @ =gUnknown_08416C70
	bl LoadCompressedObjectPic
	ldr r0, _08149240 @ =gUnknown_08414064
	movs r1, 0x80
	lsls r1, 1
	movs r2, 0x20
	bl LoadPalette
	bl sub_8149280
_08149214:
	ldr r1, _08149244 @ =gReservedSpritePaletteCount
	movs r0, 0x8
	strb r0, [r1]
	ldr r1, _08149248 @ =gUnknown_0203935C
	movs r0, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149228: .4byte gUnknown_0841223C
_0814922C: .4byte gUnknown_08413E78
_08149230: .4byte gUnknown_08414084
_08149234: .4byte 0x06003000
_08149238: .4byte gUnknown_08413E38
_0814923C: .4byte gUnknown_08416C70
_08149240: .4byte gUnknown_08414064
_08149244: .4byte gReservedSpritePaletteCount
_08149248: .4byte gUnknown_0203935C
	thumb_func_end sub_8148CB0

	thumb_func_start sub_8148E90
sub_8148E90: @ 814924C
	ldr r1, _08149270 @ =0x0400000e
	ldr r2, _08149274 @ =0x00000603
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	adds r2, 0xFF
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _08149278 @ =0x00000f05
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0xA
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08149270: .4byte 0x0400000e
_08149274: .4byte 0x00000603
_08149278: .4byte 0x00000f05
	thumb_func_end sub_8148E90

	thumb_func_start sub_8148EC0
sub_8148EC0: @ 814927C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r3, 16
	lsrs r3, 16
	ldr r1, _081492F0 @ =sub_8148F3C
	mov r9, r1
	mov r0, r9
	movs r1, 0
	str r3, [sp]
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _081492F4 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r2, 0
	strh r5, [r0, 0x8]
	strh r6, [r0, 0xA]
	strh r2, [r0, 0xC]
	strh r2, [r0, 0xE]
	mov r1, r8
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	strh r2, [r0, 0x14]
	ldr r3, [sp]
	strh r3, [r0, 0x16]
	movs r1, 0x8
	strh r1, [r0, 0x18]
	strh r2, [r0, 0x1A]
	adds r0, r4, 0
	bl _call_via_r9
	adds r0, r4, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081492F0: .4byte sub_8148F3C
_081492F4: .4byte gTasks
	thumb_func_end sub_8148EC0

	thumb_func_start sub_8148F3C
sub_8148F3C: @ 81492F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149370 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r1
	ldrh r0, [r3, 0xA]
	lsls r4, r0, 16
	adds r6, r1, 0
	cmp r4, 0
	beq _08149338
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0xE]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0xC]
	strh r2, [r3, 0xE]
	ldr r0, _08149374 @ =0x04000014
	strh r1, [r0]
	ldr r2, _08149378 @ =0x04000016
	ldr r1, _0814937C @ =gUnknown_02039358
	ldr r0, _08149380 @ =gUnknown_0203935A
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r2]
_08149338:
	ldrh r0, [r3, 0x10]
	lsls r4, r0, 16
	cmp r4, 0
	beq _08149394
	movs r1, 0x12
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0x14]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0x12]
	strh r2, [r3, 0x14]
	ldr r0, _08149384 @ =0x04000018
	strh r1, [r0]
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0
	beq _0814938C
	ldr r2, _08149388 @ =0x0400001a
	ldr r1, _0814937C @ =gUnknown_02039358
	ldr r0, _08149380 @ =gUnknown_0203935A
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r2]
	b _08149394
	.align 2, 0
_08149370: .4byte gTasks
_08149374: .4byte 0x04000014
_08149378: .4byte 0x04000016
_0814937C: .4byte gUnknown_02039358
_08149380: .4byte gUnknown_0203935A
_08149384: .4byte 0x04000018
_08149388: .4byte 0x0400001a
_0814938C:
	ldr r0, _081493CC @ =0x0400001a
	ldr r1, _081493D0 @ =gUnknown_02039358
	ldrh r1, [r1]
	strh r1, [r0]
_08149394:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r3, r0, r6
	ldrh r0, [r3, 0x16]
	lsls r4, r0, 16
	cmp r4, 0
	beq _081493C4
	movs r1, 0x18
	ldrsh r0, [r3, r1]
	lsls r0, 16
	ldrh r1, [r3, 0x1A]
	adds r2, r0, r1
	lsrs r0, r4, 12
	subs r2, r0
	asrs r1, r2, 16
	strh r1, [r3, 0x18]
	strh r2, [r3, 0x1A]
	ldr r0, _081493D4 @ =0x0400001c
	strh r1, [r0]
	ldr r1, _081493D8 @ =0x0400001e
	ldr r0, _081493D0 @ =gUnknown_02039358
	ldrh r0, [r0]
	strh r0, [r1]
_081493C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081493CC: .4byte 0x0400001a
_081493D0: .4byte gUnknown_02039358
_081493D4: .4byte 0x0400001c
_081493D8: .4byte 0x0400001e
	thumb_func_end sub_8148F3C

	thumb_func_start sub_8149020
sub_8149020: @ 81493DC
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _081494BC
	cmp r0, 0x1
	ble _081493F0
	cmp r0, 0x2
	beq _08149454
_081493F0:
	ldr r0, _0814941C @ =gMain
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _081494BC
	ldr r0, _08149420 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081494BC
	movs r0, 0x4
	ands r2, r0
	cmp r2, 0
	beq _08149428
	ldr r2, _08149424 @ =gPlttBufferUnfaded
	ldrh r1, [r2, 0x12]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, 0x14]
	b _08149432
	.align 2, 0
_0814941C: .4byte gMain
_08149420: .4byte gPaletteFade
_08149424: .4byte gPlttBufferUnfaded
_08149428:
	ldr r2, _08149450 @ =gPlttBufferUnfaded
	ldrh r1, [r2, 0x14]
	mov r0, sp
	strh r1, [r0]
	ldrh r1, [r2, 0x12]
_08149432:
	adds r0, 0x2
	strh r1, [r0]
	adds r4, r0, 0
	mov r0, sp
	movs r1, 0x9
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xA
	movs r2, 0x2
	bl LoadPalette
	b _081494BC
	.align 2, 0
_08149450: .4byte gPlttBufferUnfaded
_08149454:
	ldr r0, _08149484 @ =gMain
	ldr r2, [r0, 0x20]
	movs r0, 0x3
	ands r0, r2
	cmp r0, 0
	bne _081494BC
	ldr r0, _08149488 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _081494BC
	movs r0, 0x4
	ands r2, r0
	cmp r2, 0
	beq _08149494
	mov r1, sp
	ldr r2, _0814948C @ =0x00003d27
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08149490 @ =0x00000295
	b _081494A2
	.align 2, 0
_08149484: .4byte gMain
_08149488: .4byte gPaletteFade
_0814948C: .4byte 0x00003d27
_08149490: .4byte 0x00000295
_08149494:
	mov r1, sp
	movs r2, 0xC7
	lsls r2, 2
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _081494C4 @ =0x00003d27
_081494A2:
	adds r0, r2, 0
	strh r0, [r1]
	adds r4, r1, 0
	mov r0, sp
	movs r1, 0xC
	movs r2, 0x2
	bl LoadPalette
	adds r0, r4, 0
	movs r1, 0xD
	movs r2, 0x2
	bl LoadPalette
_081494BC:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081494C4: .4byte 0x00003d27
	thumb_func_end sub_8149020

	thumb_func_start sub_814910C
sub_814910C: @ 81494C8
	push {lr}
	adds r2, r0, 0
	ldr r0, _081494E0 @ =gUnknown_0203935C
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _081494E4
	adds r0, r2, 0
	bl DestroySprite
	b _08149528
	.align 2, 0
_081494E0: .4byte gUnknown_0203935C
_081494E4:
	movs r1, 0x20
	ldrsh r0, [r2, r1]
	lsls r0, 16
	ldrh r1, [r2, 0x32]
	orrs r0, r1
	ldrh r1, [r2, 0x30]
	adds r0, r1
	asrs r1, r0, 16
	strh r1, [r2, 0x20]
	strh r0, [r2, 0x32]
	cmp r1, 0xFF
	ble _08149500
	ldr r0, _08149514 @ =0x0000ffe0
	strh r0, [r2, 0x20]
_08149500:
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08149520
	ldr r1, _08149518 @ =gUnknown_02039358
	ldr r0, _0814951C @ =gUnknown_0203935A
	ldrh r0, [r0]
	ldrh r1, [r1]
	adds r0, r1
	b _08149524
	.align 2, 0
_08149514: .4byte 0x0000ffe0
_08149518: .4byte gUnknown_02039358
_0814951C: .4byte gUnknown_0203935A
_08149520:
	ldr r0, _0814952C @ =gUnknown_02039358
	ldrh r0, [r0]
_08149524:
	negs r0, r0
	strh r0, [r2, 0x26]
_08149528:
	pop {r0}
	bx r0
	.align 2, 0
_0814952C: .4byte gUnknown_02039358
	thumb_func_end sub_814910C

	thumb_func_start sub_8149174
sub_8149174: @ 8149530
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	str r1, [sp, 0x4]
	str r2, [sp, 0x8]
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	movs r7, 0
	cmp r7, r8
	bcs _081495E6
	ldr r0, _081495F8 @ =gSprites
	mov r10, r0
	movs r2, 0x3F
	mov r9, r2
_0814955A:
	lsls r6, r7, 3
	ldr r0, [sp, 0x4]
	adds r6, r0
	ldrb r1, [r6, 0x1]
	ldrb r2, [r6, 0x2]
	ldrb r3, [r6, 0x3]
	ldr r0, _081495FC @ =gSpriteTemplate_8416B3C
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r5, r0, 4
	adds r5, r0
	lsls r5, 2
	mov r2, r10
	adds r4, r5, r2
	ldrb r2, [r6]
	lsls r1, r2, 26
	lsrs r1, 30
	lsrs r2, 6
	adds r0, r4, 0
	movs r3, 0
	bl CalcCenterToCornerVec
	ldrb r3, [r4, 0x5]
	movs r0, 0xC
	orrs r3, r0
	strb r3, [r4, 0x5]
	ldrb r1, [r6]
	lsls r1, 26
	lsrs r1, 30
	lsls r1, 6
	ldrb r2, [r4, 0x1]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r6]
	lsrs r1, 6
	lsls r1, 6
	ldrb r2, [r4, 0x3]
	mov r0, r9
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x3]
	movs r0, 0xF
	ands r3, r0
	strb r3, [r4, 0x5]
	ldr r0, _08149600 @ =0x0202000c
	adds r5, r0
	ldr r2, [sp, 0x8]
	str r2, [r5]
	ldrb r1, [r6]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl StartSpriteAnim
	movs r1, 0
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x2E]
	ldrh r0, [r6, 0x4]
	strh r0, [r4, 0x30]
	strh r1, [r4, 0x32]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, r8
	bcc _0814955A
_081495E6:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081495F8: .4byte gSprites
_081495FC: .4byte gSpriteTemplate_8416B3C
_08149600: .4byte 0x0202000c
	thumb_func_end sub_8149174

	thumb_func_start sub_8149248
sub_8149248: @ 8149604
	push {lr}
	ldr r1, _08149618 @ =gUnknown_08416B94
	ldr r2, _0814961C @ =gSpriteAnimTable_8416B84
	movs r0, 0
	movs r3, 0x9
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_08149618: .4byte gUnknown_08416B94
_0814961C: .4byte gSpriteAnimTable_8416B84
	thumb_func_end sub_8149248

	thumb_func_start sub_8149264
sub_8149264: @ 8149620
	push {lr}
	ldr r1, _08149634 @ =gUnknown_08416C10
	ldr r2, _08149638 @ =gSpriteAnimTable_8416C04
	movs r0, 0x1
	movs r3, 0xC
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_08149634: .4byte gUnknown_08416C10
_08149638: .4byte gSpriteAnimTable_8416C04
	thumb_func_end sub_8149264

	thumb_func_start sub_8149280
sub_8149280: @ 814963C
	push {lr}
	ldr r1, _08149650 @ =gUnknown_08416C8C
	ldr r2, _08149654 @ =gSpriteAnimTable_8416C88
	movs r0, 0x1
	movs r3, 0x6
	bl sub_8149174
	pop {r0}
	bx r0
	.align 2, 0
_08149650: .4byte gUnknown_08416C8C
_08149654: .4byte gSpriteAnimTable_8416C88
	thumb_func_end sub_8149280

	thumb_func_start nullsub_82
nullsub_82: @ 8149658
	bx lr
	thumb_func_end nullsub_82

	thumb_func_start sub_81492A0
sub_81492A0: @ 814965C
	push {r4,lr}
	ldr r4, _081496C8 @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r2, 0x3E
	adds r2, r0
	mov r12, r2
	movs r2, 0x4
	ands r2, r1
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	adds r1, 0x8
	strh r1, [r0, 0x22]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x24]
	strh r1, [r0, 0x24]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081496C8: .4byte gSprites
	thumb_func_end sub_81492A0

	thumb_func_start intro_create_brendan_sprite
intro_create_brendan_sprite: @ 81496CC
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _08149718 @ =gSpriteTemplate_8416CDC
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0814971C @ =gSpriteTemplate_8416D2C
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149720 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r6, [r1, 0x2E]
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149718: .4byte gSpriteTemplate_8416CDC
_0814971C: .4byte gSpriteTemplate_8416D2C
_08149720: .4byte gSprites
	thumb_func_end intro_create_brendan_sprite

	thumb_func_start intro_create_may_sprite
intro_create_may_sprite: @ 8149724
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r0, _08149770 @ =gSpriteTemplate_8416CF4
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08149774 @ =gSpriteTemplate_8416D44
	adds r4, 0x8
	lsls r4, 16
	asrs r4, 16
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149778 @ =gSprites
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r6, [r1, 0x2E]
	adds r0, r6, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08149770: .4byte gSpriteTemplate_8416CF4
_08149774: .4byte gSpriteTemplate_8416D44
_08149778: .4byte gSprites
	thumb_func_end intro_create_may_sprite

	thumb_func_start nullsub_83
nullsub_83: @ 814977C
	bx lr
	thumb_func_end nullsub_83

	thumb_func_start sub_81493C4
sub_81493C4: @ 8149780
	push {r4,lr}
	ldr r4, _081497DC @ =gSprites
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	adds r1, 0x3E
	ldrb r1, [r1]
	movs r2, 0x3E
	adds r2, r0
	mov r12, r2
	movs r2, 0x4
	ands r2, r1
	mov r1, r12
	ldrb r3, [r1]
	movs r1, 0x5
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x24]
	strh r1, [r0, 0x24]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x26]
	strh r1, [r0, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081497DC: .4byte gSprites
	thumb_func_end sub_81493C4

	thumb_func_start intro_create_latios_sprite
intro_create_latios_sprite: @ 81497E0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _0814984C @ =gSpriteTemplate_8416D7C
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _08149850 @ =0xffe00000
	adds r2, r0
	asrs r2, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, r8
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08149854 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _08149858 @ =sub_81493C4
	str r0, [r4]
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0814984C: .4byte gSpriteTemplate_8416D7C
_08149850: .4byte 0xffe00000
_08149854: .4byte gSprites
_08149858: .4byte sub_81493C4
	thumb_func_end intro_create_latios_sprite

	thumb_func_start intro_create_latias_sprite
intro_create_latias_sprite: @ 814985C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r0, _081498C8 @ =gSpriteTemplate_8416D94
	mov r8, r0
	lsls r2, 16
	asrs r4, r2, 16
	ldr r0, _081498CC @ =0xffe00000
	adds r2, r0
	asrs r2, 16
	lsls r5, 16
	asrs r5, 16
	mov r0, r8
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	adds r4, 0x20
	lsls r4, 16
	asrs r4, 16
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x2
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _081498D0 @ =gSprites
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	adds r0, r4, r5
	strh r6, [r0, 0x2E]
	movs r1, 0x1
	bl StartSpriteAnim
	adds r5, 0x1C
	adds r4, r5
	ldr r0, _081498D4 @ =sub_81493C4
	str r0, [r4]
	adds r0, r6, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081498C8: .4byte gSpriteTemplate_8416D94
_081498CC: .4byte 0xffe00000
_081498D0: .4byte gSprites
_081498D4: .4byte sub_81493C4
	thumb_func_end intro_create_latias_sprite

	thumb_func_start nullsub_84
nullsub_84: @ 81498D8
	bx lr
	thumb_func_end nullsub_84

	thumb_func_start sub_8149520
sub_8149520: @ 81498DC
	push {r4,r5,lr}
	sub sp, 0x4
	movs r4, 0
	ldr r5, _08149910 @ =gUnknown_08416ED0
_081498E4:
	adds r0, r4, 0
	adds r0, 0x14
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 1
	adds r1, r5
	ldrh r1, [r1]
	str r1, [sp]
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0xB
	bls _081498E4
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149910: .4byte gUnknown_08416ED0
	thumb_func_end sub_8149520

	thumb_func_start sub_8149558
sub_8149558: @ 8149914
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _081499C2
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x50
	bl __divsi3
	movs r1, 0x58
	subs r1, r0
	strh r1, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0814994E
	adds r0, 0x3
_0814994E:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08149978
	ldrh r0, [r4, 0x38]
	subs r0, 0x1
	strh r0, [r4, 0x38]
_08149978:
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	cmp r0, 0
	ble _0814998E
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	b _08149994
_0814998E:
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
_08149994:
	strb r0, [r1]
	movs r2, 0x38
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bge _081499A0
	adds r0, 0x3
_081499A0:
	asrs r0, 2
	adds r0, 0x14
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _081499AE
	movs r2, 0x1F
_081499AE:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	b _081499C8
_081499C2:
	adds r0, r4, 0
	bl DestroySprite
_081499C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149558

	thumb_func_start sub_8149614
sub_8149614: @ 81499D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149A20 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x58
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08149A1A
	ldr r4, _08149A24 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x30
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x34
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _08149A28 @ =sub_8149558
	str r0, [r3]
_08149A1A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149A20: .4byte gSpriteTemplate_8416EB8
_08149A24: .4byte gSprites
_08149A28: .4byte sub_8149558
	thumb_func_end sub_8149614

	thumb_func_start sub_8149670
sub_8149670: @ 8149A2C
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x22
	ldrsh r0, [r4, r1]
	cmp r0, 0x57
	bgt _08149A92
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	adds r1, r0, 0
	muls r1, r0
	adds r0, r1, 0
	movs r1, 0x5
	bl __divsi3
	adds r0, 0x8
	strh r0, [r4, 0x22]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08149A64
	adds r0, 0x3
_08149A64:
	asrs r0, 2
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3C
	ldrsh r0, [r4, r1]
	lsls r0, 26
	lsrs r0, 24
	movs r1, 0x28
	bl Sin
	adds r0, 0x8
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _08149A98
_08149A92:
	adds r0, r4, 0
	bl DestroySprite
_08149A98:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149670

	thumb_func_start sub_81496E4
sub_81496E4: @ 8149AA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08149AFC @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x8
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08149AF6
	ldr r4, _08149B00 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	movs r0, 0x8
	strh r0, [r2, 0x38]
	strh r5, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0xC
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x32
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _08149B04 @ =sub_8149670
	str r0, [r3]
_08149AF6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149AFC: .4byte gSpriteTemplate_8416EB8
_08149B00: .4byte gSprites
_08149B04: .4byte sub_8149670
	thumb_func_end sub_81496E4

	thumb_func_start sub_814974C
sub_814974C: @ 8149B08
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	ble _08149B44
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r0, [r4, 0x3A]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	ldrh r0, [r4, 0x38]
	ldrh r1, [r4, 0x34]
	subs r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3A]
	adds r0, 0x4
	strh r0, [r4, 0x3A]
	b _08149B4A
_08149B44:
	adds r0, r4, 0
	bl DestroySprite
_08149B4A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814974C

	thumb_func_start sub_8149794
sub_8149794: @ 8149B50
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _08149BAC @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _08149BA6
	ldr r4, _08149BB0 @ =gSprites
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	adds r2, r3, r4
	movs r1, 0
	strh r5, [r2, 0x34]
	movs r0, 0x78
	strh r0, [r2, 0x38]
	strh r6, [r2, 0x3A]
	strh r1, [r2, 0x3C]
	ldrb r1, [r2, 0x1]
	subs r0, 0x7C
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r0, [r2, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r2, 0x3]
	adds r2, 0x43
	movs r0, 0x1
	strb r0, [r2]
	adds r4, 0x1C
	adds r3, r4
	ldr r0, _08149BB4 @ =sub_814974C
	str r0, [r3]
_08149BA6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149BAC: .4byte gSpriteTemplate_8416EB8
_08149BB0: .4byte gSprites
_08149BB4: .4byte sub_814974C
	thumb_func_end sub_8149794

	thumb_func_start sub_81497FC
sub_81497FC: @ 8149BB8
	push {r4,r5,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08149BCC
	ldrh r0, [r4, 0x22]
	adds r0, 0x1
	strh r0, [r4, 0x22]
_08149BCC:
	ldrh r1, [r4, 0x3A]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	cmp r0, 0x7F
	bgt _08149C7C
	lsls r0, r1, 24
	lsrs r0, 24
	movs r5, 0x38
	ldrsh r1, [r4, r5]
	bl Sin
	negs r0, r0
	strh r0, [r4, 0x26]
	movs r0, 0x34
	ldrsh r1, [r4, r0]
	movs r2, 0x3C
	ldrsh r0, [r4, r2]
	muls r0, r1
	movs r1, 0x3
	bl __divsi3
	adds r0, 0x78
	strh r0, [r4, 0x20]
	ldrh r0, [r4, 0x3A]
	adds r3, r0, 0x1
	strh r3, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r1, [r4, r5]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	cmp r0, 0
	bge _08149C10
	adds r0, 0x7F
_08149C10:
	asrs r0, 7
	movs r1, 0x1F
	subs r1, r0
	lsls r1, 24
	lsrs r2, r1, 24
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _08149C2C
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x1
	strb r0, [r1]
	b _08149C5C
_08149C2C:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	adds r1, r4, 0
	adds r1, 0x43
	movs r0, 0x14
	strb r0, [r1]
	ldrh r1, [r4, 0x3A]
	movs r5, 0x3A
	ldrsh r0, [r4, r5]
	cmp r0, 0x70
	ble _08149C5C
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08149C5C
	ldrb r0, [r3]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r3]
_08149C5C:
	cmp r2, 0x13
	bhi _08149C62
	movs r2, 0x14
_08149C62:
	movs r0, 0x1F
	ands r2, r0
	lsls r2, 1
	ldrb r1, [r4, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, 0x3]
	ldrh r0, [r4, 0x3C]
	adds r0, 0x1
	strh r0, [r4, 0x3C]
	b _08149C82
_08149C7C:
	adds r0, r4, 0
	bl DestroySprite
_08149C82:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_81497FC

	thumb_func_start sub_81498CC
sub_81498CC: @ 8149C88
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	ldr r0, _08149D04 @ =gSpriteTemplate_8416EB8
	movs r1, 0x78
	movs r2, 0x38
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x40
	beq _08149CF8
	bl Random
	ldr r6, _08149D08 @ =gSprites
	lsls r5, r4, 4
	adds r5, r4
	lsls r5, 2
	adds r4, r5, r6
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x7
	bl __umodsi3
	movs r1, 0x3
	subs r1, r0
	movs r0, 0
	mov r8, r0
	strh r1, [r4, 0x34]
	bl Random
	movs r1, 0x3F
	ands r1, r0
	adds r1, 0x30
	strh r1, [r4, 0x38]
	mov r0, r8
	strh r0, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x3]
	movs r1, 0x3E
	orrs r0, r1
	strb r0, [r4, 0x3]
	adds r4, 0x43
	movs r0, 0x14
	strb r0, [r4]
	adds r6, 0x1C
	adds r5, r6
	ldr r0, _08149D0C @ =sub_81497FC
	str r0, [r5]
_08149CF8:
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149D04: .4byte gSpriteTemplate_8416EB8
_08149D08: .4byte gSprites
_08149D0C: .4byte sub_81497FC
	thumb_func_end sub_81498CC

	thumb_func_start sub_8149954
sub_8149954: @ 8149D10
	push {lr}
	ldr r0, _08149D24 @ =gUnknown_08416E84
	bl LoadCompressedObjectPic
	ldr r0, _08149D28 @ =gUnknown_08416E94
	bl LoadSpritePalettes
	pop {r0}
	bx r0
	.align 2, 0
_08149D24: .4byte gUnknown_08416E84
_08149D28: .4byte gUnknown_08416E94
	thumb_func_end sub_8149954

	thumb_func_start sub_8149970
sub_8149970: @ 8149D2C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08149D54 @ =sub_81499A0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08149D58 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08149D54: .4byte sub_81499A0
_08149D58: .4byte gTasks
	thumb_func_end sub_8149970

	thumb_func_start sub_81499A0
sub_81499A0: @ 8149D5C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _08149DA0 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r0, 0xA
	ldrsh r1, [r5, r0]
	movs r0, 0x3
	lsls r0, r1
	ldr r1, _08149DA4 @ =0x00007fff
	str r1, [sp]
	movs r1, 0xA
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _08149DA8 @ =sub_81499F0
	str r0, [r5]
	movs r0, 0x8C
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08149DA0: .4byte gTasks
_08149DA4: .4byte 0x00007fff
_08149DA8: .4byte sub_81499F0
	thumb_func_end sub_81499A0

	thumb_func_start sub_81499F0
sub_81499F0: @ 8149DAC
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149E04 @ =gTasks
	lsls r3, r5, 2
	adds r0, r3, r5
	lsls r0, 3
	adds r1, r0, r1
	ldrh r2, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0x3F
	bgt _08149E08
	movs r0, 0x7
	ands r0, r2
	adds r7, r3, 0
	cmp r0, 0
	bne _08149DF2
	movs r4, 0
	adds r6, r1, 0
_08149DD4:
	ldrh r1, [r6, 0x26]
	movs r0, 0x78
	ands r0, r1
	lsls r0, 1
	lsls r1, r4, 6
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_8149614
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08149DD4
_08149DF2:
	ldr r0, _08149E04 @ =gTasks
	adds r1, r7, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149E10
	.align 2, 0
_08149E04: .4byte gTasks
_08149E08:
	movs r0, 0x60
	strh r0, [r1, 0x26]
	ldr r0, _08149E18 @ =sub_8149A60
	str r0, [r1]
_08149E10:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08149E18: .4byte sub_8149A60
	thumb_func_end sub_81499F0

	thumb_func_start sub_8149A60
sub_8149A60: @ 8149E1C
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08149E3C @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r1, r0, r1
	ldrh r3, [r1, 0x26]
	movs r4, 0x26
	ldrsh r0, [r1, r4]
	cmp r0, 0
	beq _08149E40
	subs r0, r3, 0x1
	strh r0, [r1, 0x26]
	b _08149E46
	.align 2, 0
_08149E3C: .4byte gTasks
_08149E40:
	adds r0, r2, 0
	bl DestroyTask
_08149E46:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8149A60

	thumb_func_start sub_8149A90
sub_8149A90: @ 8149E4C
	push {lr}
	ldr r0, _08149E60 @ =sub_8149AA8
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149E60: .4byte sub_8149AA8
	thumb_func_end sub_8149A90

	thumb_func_start sub_8149AA8
sub_8149AA8: @ 8149E64
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149E90 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149E94 @ =sub_8149ADC
	str r1, [r0]
	movs r0, 0xB7
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149E90: .4byte gTasks
_08149E94: .4byte sub_8149ADC
	thumb_func_end sub_8149AA8

	thumb_func_start sub_8149ADC
sub_8149ADC: @ 8149E98
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149EDC @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x5F
	bgt _08149EE0
	adds r6, r2, 0
	cmp r0, 0x5
	bgt _08149ECA
	movs r4, 0
_08149EB8:
	lsls r0, r4, 28
	lsrs r0, 24
	bl sub_81496E4
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x8
	bls _08149EB8
_08149ECA:
	ldr r0, _08149EDC @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149EE4
	.align 2, 0
_08149EDC: .4byte gTasks
_08149EE0:
	ldr r0, _08149EEC @ =sub_8149B34
	str r0, [r1]
_08149EE4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149EEC: .4byte sub_8149B34
	thumb_func_end sub_8149ADC

	thumb_func_start sub_8149B34
sub_8149B34: @ 8149EF0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149B34

	thumb_func_start sub_8149B44
sub_8149B44: @ 8149F00
	push {lr}
	ldr r0, _08149F14 @ =sub_8149B5C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08149F14: .4byte sub_8149B5C
	thumb_func_end sub_8149B44

	thumb_func_start sub_8149B5C
sub_8149B5C: @ 8149F18
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r1, _08149F44 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x26]
	ldr r1, _08149F48 @ =sub_8149B90
	str r1, [r0]
	movs r0, 0x66
	bl PlaySE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08149F44: .4byte gTasks
_08149F48: .4byte sub_8149B90
	thumb_func_end sub_8149B5C

	thumb_func_start sub_8149B90
sub_8149B90: @ 8149F4C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _08149FB8 @ =gTasks
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 3
	adds r1, r0, r1
	movs r3, 0x26
	ldrsh r0, [r1, r3]
	cmp r0, 0x2F
	bgt _08149FBC
	adds r6, r2, 0
	cmp r0, 0
	bne _08149F80
	movs r4, 0
_08149F6C:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x4
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149F6C
_08149F80:
	ldr r0, _08149FB8 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0x26
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	bne _08149FA6
	movs r4, 0
_08149F92:
	lsls r0, r4, 28
	lsrs r0, 24
	movs r1, 0x8
	bl sub_8149794
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08149F92
_08149FA6:
	ldr r0, _08149FB8 @ =gTasks
	adds r1, r6, r5
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _08149FC0
	.align 2, 0
_08149FB8: .4byte gTasks
_08149FBC:
	ldr r0, _08149FC8 @ =sub_8149C10
	str r0, [r1]
_08149FC0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08149FC8: .4byte sub_8149C10
	thumb_func_end sub_8149B90

	thumb_func_start sub_8149C10
sub_8149C10: @ 8149FCC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	thumb_func_end sub_8149C10

	thumb_func_start sub_8149C20
sub_8149C20: @ 8149FDC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0814A004 @ =sub_8149C50
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A008 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A004: .4byte sub_8149C50
_0814A008: .4byte gTasks
	thumb_func_end sub_8149C20

	thumb_func_start sub_8149C50
sub_8149C50: @ 814A00C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _0814A054 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _0814A058 @ =0x0202ef08
	ldr r1, _0814A05C @ =0x0202eb08
	movs r2, 0x30
	bl CpuSet
	ldr r0, _0814A060 @ =0xfff9001c
	ldr r1, _0814A064 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0814A068 @ =sub_8149CB0
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A054: .4byte gTasks
_0814A058: .4byte 0x0202ef08
_0814A05C: .4byte 0x0202eb08
_0814A060: .4byte 0xfff9001c
_0814A064: .4byte 0x00007fff
_0814A068: .4byte sub_8149CB0
	thumb_func_end sub_8149C50

	thumb_func_start sub_8149CB0
sub_8149CB0: @ 814A06C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0814A0A4 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _0814A0E8
	adds r0, r2, 0
	cmp r0, 0
	beq _0814A0A8
	cmp r0, 0x20
	beq _0814A0BC
	cmp r2, 0x31
	bgt _0814A0CC
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _0814A0CC
	.align 2, 0
_0814A0A4: .4byte gTasks
_0814A0A8:
	movs r4, 0
_0814A0AA:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0814A0AA
	b _0814A0CC
_0814A0BC:
	ldr r0, _0814A0DC @ =0xffff001c
	ldr r1, _0814A0E0 @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0814A0CC:
	ldr r0, _0814A0E4 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _0814A0EC
	.align 2, 0
_0814A0DC: .4byte 0xffff001c
_0814A0E0: .4byte 0x00007fff
_0814A0E4: .4byte gTasks
_0814A0E8:
	ldr r0, _0814A0F4 @ =sub_8149D3C
	str r0, [r1]
_0814A0EC:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A0F4: .4byte sub_8149D3C
	thumb_func_end sub_8149CB0

	thumb_func_start sub_8149D3C
sub_8149D3C: @ 814A0F8
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0814A114 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0814A110
	adds r0, r2, 0
	bl DestroyTask
_0814A110:
	pop {r0}
	bx r0
	.align 2, 0
_0814A114: .4byte gPaletteFade
	thumb_func_end sub_8149D3C

	thumb_func_start sub_8149D5C
sub_8149D5C: @ 814A118
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0814A140 @ =sub_8149D8C
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A144 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xC]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A140: .4byte sub_8149D8C
_0814A144: .4byte gTasks
	thumb_func_end sub_8149D5C

	thumb_func_start sub_8149D8C
sub_8149D8C: @ 814A148
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8149520
	ldr r0, _0814A190 @ =gTasks
	lsls r5, r4, 2
	adds r5, r4
	lsls r5, 3
	adds r5, r0
	movs r0, 0
	strh r0, [r5, 0x26]
	ldr r0, _0814A194 @ =0x0202ef08
	ldr r1, _0814A198 @ =0x0202eb08
	movs r2, 0x30
	bl CpuSet
	ldr r0, _0814A19C @ =0xfff90001
	ldr r1, _0814A1A0 @ =0x00007fff
	str r1, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0814A1A4 @ =sub_8149DEC
	str r0, [r5]
	movs r0, 0xCA
	bl PlaySE
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0814A190: .4byte gTasks
_0814A194: .4byte 0x0202ef08
_0814A198: .4byte 0x0202eb08
_0814A19C: .4byte 0xfff90001
_0814A1A0: .4byte 0x00007fff
_0814A1A4: .4byte sub_8149DEC
	thumb_func_end sub_8149D8C

	thumb_func_start sub_8149DEC
sub_8149DEC: @ 814A1A8
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0814A1E0 @ =gTasks
	lsls r5, r6, 2
	adds r0, r5, r6
	lsls r0, 3
	adds r1, r0, r1
	movs r0, 0x26
	ldrsh r2, [r1, r0]
	cmp r2, 0x7F
	bgt _0814A224
	adds r0, r2, 0
	cmp r0, 0
	beq _0814A1E4
	cmp r0, 0x20
	beq _0814A1F8
	cmp r2, 0x31
	bgt _0814A208
	bl Random
	movs r1, 0x7
	ands r0, r1
	bl sub_81498CC
	b _0814A208
	.align 2, 0
_0814A1E0: .4byte gTasks
_0814A1E4:
	movs r4, 0
_0814A1E6:
	adds r0, r4, 0
	bl sub_81498CC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x7
	bls _0814A1E6
	b _0814A208
_0814A1F8:
	ldr r0, _0814A218 @ =0xffff0001
	ldr r1, _0814A21C @ =0x00007fff
	str r1, [sp]
	movs r1, 0x10
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
_0814A208:
	ldr r0, _0814A220 @ =gTasks
	adds r1, r5, r6
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x26]
	adds r0, 0x1
	strh r0, [r1, 0x26]
	b _0814A228
	.align 2, 0
_0814A218: .4byte 0xffff0001
_0814A21C: .4byte 0x00007fff
_0814A220: .4byte gTasks
_0814A224:
	ldr r0, _0814A230 @ =sub_8149D3C
	str r0, [r1]
_0814A228:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A230: .4byte sub_8149D3C
	thumb_func_end sub_8149DEC

	thumb_func_start nullsub_85
nullsub_85: @ 814A234
	bx lr
	thumb_func_end nullsub_85

	thumb_func_start sub_8149E7C
sub_8149E7C: @ 814A238
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x28
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	movs r1, 0
	ldr r3, _0814A36C @ =sub_8149FC8
	ldr r2, _0814A370 @ =0x00007fff
_0814A252:
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	strh r2, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0xF
	bls _0814A252
	adds r0, r3, 0
	movs r1, 0
	bl CreateTask
	mov r8, r0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0814A374 @ =gTasks
	mov r1, r8
	lsls r6, r1, 2
	add r6, r8
	lsls r6, 3
	adds r6, r0
	strh r5, [r6, 0xA]
	strh r7, [r6, 0xC]
	movs r1, 0x80
	lsls r1, 1
	strh r1, [r6, 0xE]
	movs r0, 0x10
	strh r0, [r6, 0x10]
	movs r4, 0x80
	lsls r4, 9
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r0, 0x10
	ldrsh r1, [r6, r0]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	ldr r1, _0814A378 @ =gSprites
	mov r9, r1
	lsls r2, r5, 4
	adds r2, r5
	lsls r2, 2
	mov r3, r9
	adds r3, 0x1C
	adds r0, r2, r3
	ldr r1, _0814A37C @ =nullsub_85
	str r1, [r0]
	add r2, r9
	ldrb r1, [r2, 0x1]
	movs r4, 0x4
	negs r4, r4
	adds r0, r4, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	movs r0, 0x3F
	negs r0, r0
	ands r0, r1
	movs r1, 0x3C
	orrs r0, r1
	strb r0, [r2, 0x3]
	movs r0, 0x3E
	adds r0, r2
	mov r10, r0
	ldrb r1, [r0]
	movs r5, 0x5
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r1, [r2, 0x5]
	lsrs r1, 4
	lsls r1, 5
	ldr r0, _0814A380 @ =0x0202f0c8
	mov r10, r0
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	str r3, [sp, 0x24]
	bl CpuSet
	lsls r1, r7, 4
	adds r1, r7
	lsls r1, 2
	ldr r3, [sp, 0x24]
	adds r3, r1, r3
	ldr r0, _0814A37C @ =nullsub_85
	str r0, [r3]
	add r1, r9
	ldrb r0, [r1, 0x1]
	ands r4, r0
	movs r0, 0x1
	orrs r4, r0
	strb r4, [r1, 0x1]
	ldrb r0, [r1, 0x3]
	movs r2, 0x3E
	orrs r0, r2
	strb r0, [r1, 0x3]
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	ands r5, r0
	strb r5, [r2]
	ldrb r1, [r1, 0x5]
	lsrs r1, 4
	lsls r1, 5
	add r1, r10
	add r0, sp, 0x4
	movs r2, 0x10
	bl CpuSet
	movs r1, 0
	strh r1, [r6, 0x18]
	mov r0, r8
	add sp, 0x28
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A36C: .4byte sub_8149FC8
_0814A370: .4byte 0x00007fff
_0814A374: .4byte gTasks
_0814A378: .4byte gSprites
_0814A37C: .4byte nullsub_85
_0814A380: .4byte 0x0202f0c8
	thumb_func_end sub_8149E7C

	thumb_func_start sub_8149FC8
sub_8149FC8: @ 814A384
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A3A0 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x12]
	movs r0, 0x8
	strh r0, [r1, 0x14]
	ldr r0, _0814A3A4 @ =sub_8149FEC
	str r0, [r1]
	bx lr
	.align 2, 0
_0814A3A0: .4byte gTasks
_0814A3A4: .4byte sub_8149FEC
	thumb_func_end sub_8149FC8

	thumb_func_start sub_8149FEC
sub_8149FEC: @ 814A3A8
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r1, _0814A3C8 @ =gTasks
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x18
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _0814A3CC
	adds r0, r3, 0
	bl sub_814A208
	b _0814A3EE
	.align 2, 0
_0814A3C8: .4byte gTasks
_0814A3CC:
	ldrh r1, [r2, 0x14]
	movs r4, 0x14
	ldrsh r0, [r2, r4]
	cmp r0, 0x80
	bne _0814A3DE
	adds r0, r3, 0
	bl sub_814A158
	b _0814A3EE
_0814A3DE:
	adds r0, r1, 0x2
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x12]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r2, 0x12]
	ldr r0, _0814A3F4 @ =sub_814A03C
	str r0, [r2]
_0814A3EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0814A3F4: .4byte sub_814A03C
	thumb_func_end sub_8149FEC

	thumb_func_start sub_814A03C
sub_814A03C: @ 814A3F8
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0814A41C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r3, 0x18
	ldrsh r0, [r2, r3]
	adds r5, r1, 0
	cmp r0, 0
	beq _0814A424
	ldr r0, _0814A420 @ =sub_814A208
	str r0, [r2]
	b _0814A508
	.align 2, 0
_0814A41C: .4byte gTasks
_0814A420: .4byte sub_814A208
_0814A424:
	movs r6, 0
	movs r7, 0x12
	ldrsh r0, [r2, r7]
	cmp r0, 0
	bne _0814A474
	movs r0, 0xE
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A44A
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0xE]
	adds r0, r7
	strh r0, [r2, 0xE]
	b _0814A44E
_0814A44A:
	strh r3, [r2, 0xE]
	movs r6, 0x1
_0814A44E:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0x10
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A46E
	ldrh r0, [r3, 0x10]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0x10]
	b _0814A4BE
_0814A46E:
	movs r0, 0x10
	strh r0, [r3, 0x10]
	b _0814A4B8
_0814A474:
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	movs r3, 0x14
	ldrsh r0, [r2, r3]
	movs r3, 0x80
	lsls r3, 1
	subs r0, r3, r0
	cmp r1, r0
	bge _0814A490
	ldrh r0, [r2, 0x14]
	ldrh r7, [r2, 0x10]
	adds r0, r7
	strh r0, [r2, 0x10]
	b _0814A494
_0814A490:
	strh r3, [r2, 0x10]
	movs r6, 0x1
_0814A494:
	lsls r2, r4, 2
	adds r0, r2, r4
	lsls r0, 3
	adds r3, r0, r5
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	movs r7, 0x14
	ldrsh r0, [r3, r7]
	adds r0, 0x10
	cmp r1, r0
	ble _0814A4B4
	ldrh r0, [r3, 0xE]
	ldrh r1, [r3, 0x14]
	subs r0, r1
	strh r0, [r3, 0xE]
	b _0814A4BE
_0814A4B4:
	movs r0, 0x10
	strh r0, [r3, 0xE]
_0814A4B8:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0814A4BE:
	adds r0, r2, r4
	lsls r0, 3
	adds r5, r0, r5
	movs r0, 0xE
	ldrsh r1, [r5, r0]
	movs r4, 0x80
	lsls r4, 9
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1E
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	movs r3, 0x10
	ldrsh r1, [r5, r3]
	adds r0, r4, 0
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp]
	movs r0, 0x1F
	movs r2, 0
	movs r3, 0
	bl SetOamMatrix
	cmp r6, 0x2
	bne _0814A508
	ldr r0, _0814A510 @ =sub_8149FEC
	str r0, [r5]
_0814A508:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0814A510: .4byte sub_8149FEC
	thumb_func_end sub_814A03C

	thumb_func_start sub_814A158
sub_814A158: @ 814A514
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A5BC @ =gSprites
	mov r8, r1
	ldr r1, _0814A5C0 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A5BC: .4byte gSprites
_0814A5C0: .4byte gTasks
	thumb_func_end sub_814A158

	thumb_func_start sub_814A208
sub_814A208: @ 814A5C4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0814A66C @ =gSprites
	mov r8, r1
	ldr r1, _0814A670 @ =gTasks
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	adds r4, r1
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x1]
	movs r6, 0x4
	negs r6, r6
	adds r1, r6, 0
	ands r1, r3
	strb r1, [r2, 0x1]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r2, r1, 4
	adds r2, r1
	lsls r2, 2
	add r2, r8
	ldrb r3, [r2, 0x3]
	movs r5, 0x3F
	negs r5, r5
	adds r1, r5, 0
	ands r1, r3
	strb r1, [r2, 0x3]
	movs r1, 0xA
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r3, [r1]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x1]
	ands r6, r2
	strb r6, [r1, 0x1]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	ldrb r2, [r1, 0x3]
	ands r5, r2
	strb r5, [r1, 0x3]
	movs r1, 0xC
	ldrsh r2, [r4, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	add r1, r8
	adds r1, 0x3E
	ldrb r2, [r1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1]
	bl DestroyTask
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0814A66C: .4byte gSprites
_0814A670: .4byte gTasks
	thumb_func_end sub_814A208

	thumb_func_start sub_814A2B8
sub_814A2B8: @ 814A674
	ldr r2, _0814A688 @ =gUnknown_08417068
	lsls r0, 2
	adds r0, r2
	ldr r0, [r0]
	lsls r1, 1
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	bx lr
	.align 2, 0
_0814A688: .4byte gUnknown_08417068
	thumb_func_end sub_814A2B8

	thumb_func_start sub_814A2D0
sub_814A2D0: @ 814A68C
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r3, _0814A6B4 @ =gBardMusicTable
	lsls r2, r0, 2
	adds r2, r3
	ldr r4, [r2]
	bl sub_80EB3FC
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 4
	adds r4, r1
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A6B4: .4byte gBardMusicTable
	thumb_func_end sub_814A2D0

	thumb_func_start sub_814A2EC
sub_814A2EC: @ 814A6B8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r6, r0, 0
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	ldr r4, _0814A73C @ =gUnknown_084170F4
	adds r2, r1, 0
	adds r3, r6, 0
	adds r3, 0x18
	movs r7, 0x5
_0814A6D2:
	ldrb r0, [r2]
	strh r0, [r3]
	ldrb r0, [r2]
	cmp r0, 0xFF
	beq _0814A6F4
	movs r1, 0x1
	ldrsb r1, [r2, r1]
	lsls r0, 2
	adds r0, r4
	ldr r0, [r0]
	adds r1, r0
	strh r1, [r3, 0x2]
	ldrh r0, [r2, 0x4]
	strh r0, [r3, 0x6]
	ldrh r0, [r6, 0x4]
	adds r0, r1
	strh r0, [r6, 0x4]
_0814A6F4:
	adds r2, 0x8
	adds r3, 0x8
	subs r7, 0x1
	cmp r7, 0
	bge _0814A6D2
	movs r7, 0x6
	movs r5, 0
	movs r0, 0x1E
	mov r8, r0
	adds r4, r6, 0
_0814A708:
	mov r0, r8
	add r0, r9
	adds r1, r5, 0
	bl sub_814A2B8
	adds r1, r0, 0
	strh r1, [r4, 0x1C]
	adds r4, 0x8
	adds r5, 0x1
	cmp r5, r7
	blt _0814A708
	ldrb r1, [r6]
	adds r1, 0x1
	movs r2, 0
	strb r1, [r6]
	strb r2, [r6, 0x1]
	strb r2, [r6, 0x2]
	strb r2, [r6, 0x3]
	strh r2, [r6, 0xA]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0814A73C: .4byte gUnknown_084170F4
	thumb_func_end sub_814A2EC

	thumb_func_start SetUpFieldMove_Teleport
SetUpFieldMove_Teleport: @ 814A740
	push {lr}
	ldr r0, _0814A758 @ =gMapHeader
	ldrb r0, [r0, 0x17]
	bl is_light_level_1_2_3_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0814A75C
	movs r0, 0
	b _0814A76A
	.align 2, 0
_0814A758: .4byte gMapHeader
_0814A75C:
	ldr r1, _0814A770 @ =gUnknown_0300485C
	ldr r0, _0814A774 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0814A778 @ =gUnknown_03005CE4
	ldr r0, _0814A77C @ =hm_teleport_run_dp02scr
	str r0, [r1]
	movs r0, 0x1
_0814A76A:
	pop {r1}
	bx r1
	.align 2, 0
_0814A770: .4byte gUnknown_0300485C
_0814A774: .4byte sub_808AB90
_0814A778: .4byte gUnknown_03005CE4
_0814A77C: .4byte hm_teleport_run_dp02scr
	thumb_func_end SetUpFieldMove_Teleport

	thumb_func_start hm_teleport_run_dp02scr
hm_teleport_run_dp02scr: @ 814A780
	push {lr}
	bl new_game
	movs r0, 0x3F
	bl FieldEffectStart
	ldr r0, _0814A798 @ =gUnknown_0202FF84
	ldr r1, _0814A79C @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0814A798: .4byte gUnknown_0202FF84
_0814A79C: .4byte gUnknown_03005CE0
	thumb_func_end hm_teleport_run_dp02scr

	thumb_func_start FldEff_UseTeleport
FldEff_UseTeleport: @ 814A7A0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0814A7C8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0814A7CC @ =sub_814A404
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0814A7C8: .4byte gTasks
_0814A7CC: .4byte sub_814A404
	thumb_func_end FldEff_UseTeleport

	thumb_func_start sub_814A404
sub_814A404: @ 814A7D0
	push {lr}
	movs r0, 0x3F
	bl FieldEffectActiveListRemove
	bl sub_8087BA8
	pop {r0}
	bx r0
	thumb_func_end sub_814A404

	thumb_func_start unref_sub_814A414
unref_sub_814A414: @ 814A7E0
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0x10
	movs r3, 0x12
	bl MenuDrawTextWindow
	ldr r3, _0814A824 @ =gUnknown_0842C29C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x8
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x8
	bl InitMenu
	ldr r1, _0814A828 @ =gCallback_03004AE8
	ldr r0, _0814A82C @ =sub_814A464
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_0814A824: .4byte gUnknown_0842C29C
_0814A828: .4byte gCallback_03004AE8
_0814A82C: .4byte sub_814A464
	thumb_func_end unref_sub_814A414

	thumb_func_start sub_814A464
sub_814A464: @ 814A830
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	lsrs r0, 24
	adds r2, r0, 0
	lsls r0, r2, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	bne _0814A84C
	movs r0, 0
	b _0814A87E
_0814A84C:
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _0814A878
	ldr r0, _0814A86C @ =gUnknown_02024D1E
	strb r2, [r0]
	ldr r2, _0814A870 @ =gCallback_03004AE8
	ldr r0, _0814A874 @ =gUnknown_0842C29C
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
	movs r0, 0
	b _0814A87E
	.align 2, 0
_0814A86C: .4byte gUnknown_02024D1E
_0814A870: .4byte gCallback_03004AE8
_0814A874: .4byte gUnknown_0842C29C
_0814A878:
	bl sub_8071C20
	movs r0, 0x1
_0814A87E:
	pop {r1}
	bx r1
	thumb_func_end sub_814A464

	thumb_func_start sub_814A4B8
sub_814A4B8: @ 814A884
	push {r4,lr}
	ldr r2, _0814A8C8 @ =gSaveBlock2
	ldr r1, _0814A8CC @ =0x00000556
	adds r0, r2, r1
	movs r1, 0x3
	strb r1, [r0]
	ldr r3, _0814A8D0 @ =0x00000557
	adds r0, r2, r3
	strb r1, [r0]
	ldr r3, _0814A8D4 @ =gUnknown_02024D1E
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r4, _0814A8D8 @ =0x0000055c
	adds r1, r2, r4
	strh r0, [r1]
	ldrb r0, [r3]
	adds r0, 0x1
	ldr r3, _0814A8DC @ =0x0000055e
	adds r1, r2, r3
	strh r0, [r1]
	subs r4, 0x4
	adds r0, r2, r4
	movs r1, 0x1
	strh r1, [r0]
	ldr r0, _0814A8E0 @ =0x0000055a
	adds r2, r0
	strh r1, [r2]
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0814A8C8: .4byte gSaveBlock2
_0814A8CC: .4byte 0x00000556
_0814A8D0: .4byte 0x00000557
_0814A8D4: .4byte gUnknown_02024D1E
_0814A8D8: .4byte 0x0000055c
_0814A8DC: .4byte 0x0000055e
_0814A8E0: .4byte 0x0000055a
	thumb_func_end sub_814A4B8

	thumb_func_start sub_814A518
sub_814A518: @ 814A8E4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl StripExtCtrlCodes
	adds r0, r4, 0
	bl StringLength
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r5, 0xFC
	bne _0814A922
	cmp r1, 0x5
	bhi _0814A926
	movs r3, 0xFC
	movs r2, 0x7
_0814A906:
	adds r0, r4, r1
	strb r3, [r0]
	strb r2, [r0, 0x1]
	adds r0, r1, 0x2
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x5
	bls _0814A906
	b _0814A926
_0814A918:
	adds r0, r4, r1
	strb r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_0814A922:
	cmp r1, 0x5
	bls _0814A918
_0814A926:
	adds r1, r4, r1
	movs r0, 0xFF
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_814A518

	thumb_func_start sub_814A568
sub_814A568: @ 814A934
	push {r4,lr}
	adds r4, r0, 0
	bl StringLength
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x5
	bhi _0814A94E
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
	b _0814A954
_0814A94E:
	adds r0, r4, 0
	bl StripExtCtrlCodes
_0814A954:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_814A568

	.align 2, 0 @ Don't pad with nop.
