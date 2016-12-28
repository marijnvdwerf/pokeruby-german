	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start Random
Random: @ 8040E84
	ldr r2, _08040E98 @ =gRngValue
	ldr r1, [r2]
	ldr r0, _08040E9C @ =0x41c64e6d
	muls r0, r1
	ldr r1, _08040EA0 @ =0x00006073
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	bx lr
	.align 2, 0
_08040E98: .4byte gRngValue
_08040E9C: .4byte 0x41c64e6d
_08040EA0: .4byte 0x00006073
	thumb_func_end Random

	thumb_func_start SeedRng
SeedRng: @ 8040EA4
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08040EB0 @ =gRngValue
	str r0, [r1]
	bx lr
	.align 2, 0
_08040EB0: .4byte gRngValue
	thumb_func_end SeedRng

	.align 2, 0 @ Don't pad with nop.
