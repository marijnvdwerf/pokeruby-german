	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start Random
Random: @ 80411A8
	ldr r2, _080411BC @ =gRngValue
	ldr r1, [r2]
	ldr r0, _080411C0 @ =0x41c64e6d
	muls r0, r1
	ldr r1, _080411C4 @ =0x00006073
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	bx lr
	.align 2, 0
_080411BC: .4byte gRngValue
_080411C0: .4byte 0x41c64e6d
_080411C4: .4byte 0x00006073
	thumb_func_end Random

	thumb_func_start SeedRng
SeedRng: @ 80411C8
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080411D4 @ =gRngValue
	str r0, [r1]
	bx lr
	.align 2, 0
_080411D4: .4byte gRngValue
	thumb_func_end SeedRng

	.align 2, 0 @ Don't pad with nop.
