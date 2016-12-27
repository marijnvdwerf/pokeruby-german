	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start GetHealLocationIndexByMap
GetHealLocationIndexByMap: @ 80FAC1C
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r1, 16
	movs r3, 0
	ldr r2, _080FAC40
_080FAC2A:
	movs r0, 0
	ldrsb r0, [r2, r0]
	cmp r0, r4
	bne _080FAC44
	movs r0, 0x1
	ldrsb r0, [r2, r0]
	cmp r0, r1
	bne _080FAC44
	adds r0, r3, 0x1
	b _080FAC4E
	.align 2, 0
_080FAC40: .4byte gHealLocations
_080FAC44:
	adds r2, 0x8
	adds r3, 0x1
	cmp r3, 0x15
	bls _080FAC2A
	movs r0, 0
_080FAC4E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetHealLocationIndexByMap

	thumb_func_start GetHealLocationByMap
GetHealLocationByMap: @ 80FAC54
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	bl GetHealLocationIndexByMap
	cmp r0, 0
	beq _080FAC74
	lsls r0, 3
	ldr r1, _080FAC70
	adds r0, r1
	b _080FAC76
	.align 2, 0
_080FAC70: .4byte gUnknown_083E5A18
_080FAC74:
	movs r0, 0
_080FAC76:
	pop {r1}
	bx r1
	thumb_func_end GetHealLocationByMap

	thumb_func_start GetHealLocation
GetHealLocation: @ 80FAC7C
	push {lr}
	cmp r0, 0
	beq _080FAC94
	cmp r0, 0x16
	bhi _080FAC94
	lsls r0, 3
	ldr r1, _080FAC90
	adds r0, r1
	b _080FAC96
	.align 2, 0
_080FAC90: .4byte gUnknown_083E5A18
_080FAC94:
	movs r0, 0
_080FAC96:
	pop {r1}
	bx r1
	thumb_func_end GetHealLocation

	.align 2, 0 @ Don't pad with nop.
