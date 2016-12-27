	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetVarPointer
GetVarPointer: @ 8069550
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	ldr r0, _08069564 @ =0x00003fff
	cmp r1, r0
	bhi _08069568
	movs r0, 0
	b _0806958A
	.align 2, 0
_08069564: .4byte 0x00003fff
_08069568:
	lsls r0, r1, 16
	cmp r0, 0
	bge _08069584
	ldr r0, _0806957C @ =gSpecialVars
	ldr r2, _08069580 @ =0xffff8000
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	b _0806958A
	.align 2, 0
_0806957C: .4byte gSpecialVars
_08069580: .4byte 0xffff8000
_08069584:
	lsls r0, r2, 1
	ldr r1, _08069590 @ =0x0201ea74
	adds r0, r1
_0806958A:
	pop {r1}
	bx r1
	.align 2, 0
_08069590: .4byte 0x0201ea74
	thumb_func_end GetVarPointer

	thumb_func_start VarGet
VarGet: @ 8069594
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetVarPointer
	cmp r0, 0
	beq _080695A8
	ldrh r0, [r0]
	b _080695AA
_080695A8:
	adds r0, r4, 0
_080695AA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: @ 80695B0
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl GetVarPointer
	cmp r0, 0
	beq _080695C8
	strh r4, [r0]
	movs r0, 0x1
	b _080695CA
_080695C8:
	movs r0, 0
_080695CA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarSet

	thumb_func_start VarGetFieldObjectGraphicsId
VarGetFieldObjectGraphicsId: @ 80695D0
	push {lr}
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _080695E8 @ =0x40100000
	adds r0, r1
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080695E8: .4byte 0x40100000
	thumb_func_end VarGetFieldObjectGraphicsId

	.align 2, 0 @ Don't pad with nop.
