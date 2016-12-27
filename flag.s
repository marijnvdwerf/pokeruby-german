	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetFlagPointer
GetFlagPointer: @ 80695EC
	push {lr}
	lsls r2, r0, 16
	lsrs r1, r2, 16
	adds r3, r1, 0
	cmp r1, 0
	bne _080695FC
	movs r0, 0
	b _08069622
_080695FC:
	ldr r0, _08069608
	cmp r1, r0
	bhi _08069610
	lsrs r0, r2, 19
	ldr r1, _0806960C
	b _08069620
	.align 2, 0
_08069608: .4byte 0x00003fff
_0806960C: .4byte 0x02026954
_08069610:
	ldr r1, _08069628
	adds r0, r3, r1
	cmp r0, 0
	bge _0806961C
	adds r1, 0x7
	adds r0, r3, r1
_0806961C:
	asrs r0, 3
	ldr r1, _0806962C
_08069620:
	adds r0, r1
_08069622:
	pop {r1}
	bx r1
	.align 2, 0
_08069628: .4byte 0xffffc000
_0806962C: .4byte gUnknown_0202E8E2
	thumb_func_end GetFlagPointer

	thumb_func_start FlagSet
FlagSet: @ 8069630
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069650
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_08069650:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagSet

	thumb_func_start FlagReset
FlagReset: @ 8069658
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069678
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_08069678:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagReset

	thumb_func_start FlagGet
FlagGet: @ 8069680
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	cmp r0, 0
	beq _080696A4
	ldrb r0, [r0]
	movs r1, 0x7
	ands r1, r4
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080696A4
	movs r0, 0x1
	b _080696A6
_080696A4:
	movs r0, 0
_080696A6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagGet

	.align 2, 0 @ Don't pad with nop.
