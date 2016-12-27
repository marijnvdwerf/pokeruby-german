	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetLandmarkName
GetLandmarkName: @ 811ACC0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	bl GetLandmarks
	adds r4, r0, 0
	cmp r4, 0
	bne _0811ACDC
_0811ACD8:
	movs r0, 0
	b _0811AD0E
_0811ACDC:
	ldr r6, _0811ACE0
	b _0811ACF2
	.align 2, 0
_0811ACE0: .4byte 0x0000ffff
_0811ACE4:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0811ACEA:
	adds r4, 0x4
	ldr r0, [r4]
	cmp r0, 0
	beq _0811ACD8
_0811ACF2:
	ldr r1, [r4]
	ldrh r0, [r1, 0x4]
	cmp r0, r6
	beq _0811AD06
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0811ACEA
_0811AD06:
	cmp r5, 0
	bne _0811ACE4
	ldr r0, [r4]
	ldr r0, [r0]
_0811AD0E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLandmarkName

	thumb_func_start GetLandmarks
GetLandmarks: @ 811AD14
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r6, r1, 24
	movs r2, 0
	ldr r0, _0811AD58
	ldrb r1, [r0]
	adds r4, r0, 0
	cmp r1, 0x58
	beq _0811AD84
	adds r1, r4, 0
_0811AD2C:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, r3
	bhi _0811AD84
	cmp r0, r3
	beq _0811AD4A
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x58
	bne _0811AD2C
_0811AD4A:
	lsls r0, r2, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x58
	bne _0811AD64
	b _0811AD84
	.align 2, 0
_0811AD58: .4byte gLandmarkLists
_0811AD5C:
	adds r0, r4, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	b _0811AD86
_0811AD64:
	cmp r0, r3
	bne _0811AD84
	ldr r5, _0811AD8C
_0811AD6A:
	lsls r1, r2, 3
	adds r0, r1, r5
	ldrb r0, [r0, 0x1]
	cmp r0, r6
	beq _0811AD5C
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _0811AD6A
_0811AD84:
	movs r0, 0
_0811AD86:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0811AD8C: .4byte gLandmarkLists
	thumb_func_end GetLandmarks

	.align 2, 0 @ Don't pad with nop.
