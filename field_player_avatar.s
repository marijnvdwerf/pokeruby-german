	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80587B4
sub_80587B4: @ 8058AF4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08058B10
	adds r0, r2
	ldr r2, _08058B14
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_08058B10: .4byte gMapObjects
_08058B14: .4byte sub_80587D8
	thumb_func_end sub_80587B4

	thumb_func_start sub_80587D8
sub_80587D8: @ 8058B18
	movs r0, 0
	bx lr
	thumb_func_end sub_80587D8

	thumb_func_start player_step
player_step: @ 8058B1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r4, _08058B8C
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058B90
	adds r5, r0, r1
	adds r0, r5, 0
	bl sub_8059D60
	ldrb r0, [r4, 0x6]
	cmp r0, 0
	bne _08058B82
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80E5B38
	adds r0, r5, 0
	mov r1, r8
	bl sub_8058854
	lsls r0, 24
	cmp r0, 0
	bne _08058B82
	adds r0, r5, 0
	bl npc_clear_strange_bits
	bl DoPlayerAvatarTransition
	bl TryDoMetatileBehaviorForcedMovement
	lsls r0, 24
	cmp r0, 0
	bne _08058B82
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	bl MovePlayerAvatarUsingKeypadInput
	bl PlayerAllowForcedMovementIfMovingSameDirection
_08058B82:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058B8C: .4byte gPlayerAvatar
_08058B90: .4byte gMapObjects
	thumb_func_end player_step

	thumb_func_start sub_8058854
sub_8058854: @ 8058B94
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08058BDE
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	bne _08058BDE
	adds r0, r4, 0
	bl FieldObjectGetSpecialAnim
	lsls r0, 24
	movs r1, 0xE7
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bhi _08058BDA
	cmp r5, 0
	beq _08058BDA
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	cmp r0, r5
	beq _08058BDA
	adds r0, r4, 0
	bl FieldObjectClearAnim
	b _08058BDE
_08058BDA:
	movs r0, 0x1
	b _08058BE0
_08058BDE:
	movs r0, 0
_08058BE0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8058854

	thumb_func_start npc_clear_strange_bits
npc_clear_strange_bits: @ 8058BE8
	ldrb r2, [r0, 0x1]
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	movs r2, 0x5
	negs r2, r2
	ands r1, r2
	adds r2, 0x2
	ands r1, r2
	strb r1, [r0, 0x1]
	ldr r2, _08058C08
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08058C08: .4byte gPlayerAvatar
	thumb_func_end npc_clear_strange_bits

	thumb_func_start MovePlayerAvatarUsingKeypadInput
MovePlayerAvatarUsingKeypadInput: @ 8058C0C
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _08058C30
	ldrb r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _08058C34
	adds r0, r3, 0
	adds r1, r4, 0
	bl MovePlayerOnBike
	b _08058C3C
	.align 2, 0
_08058C30: .4byte gPlayerAvatar
_08058C34:
	adds r0, r3, 0
	adds r1, r2, 0
	bl MovePlayerNotOnBike
_08058C3C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end MovePlayerAvatarUsingKeypadInput

	thumb_func_start PlayerAllowForcedMovementIfMovingSameDirection
PlayerAllowForcedMovementIfMovingSameDirection: @ 8058C44
	push {lr}
	ldr r2, _08058C5C
	ldrb r0, [r2, 0x2]
	cmp r0, 0x2
	bne _08058C56
	ldrb r1, [r2]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r2]
_08058C56:
	pop {r0}
	bx r0
	.align 2, 0
_08058C5C: .4byte gPlayerAvatar
	thumb_func_end PlayerAllowForcedMovementIfMovingSameDirection

	thumb_func_start TryDoMetatileBehaviorForcedMovement
TryDoMetatileBehaviorForcedMovement: @ 8058C60
	push {r4,lr}
	ldr r4, _08058C80
	bl GetForcedMovementByMetatileBehavior
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08058C80: .4byte gUnknown_0830FBA0
	thumb_func_end TryDoMetatileBehaviorForcedMovement

	thumb_func_start GetForcedMovementByMetatileBehavior
GetForcedMovementByMetatileBehavior: @ 8058C84
	push {r4-r6,lr}
	ldr r3, _08058CC0
	ldrb r1, [r3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08058CD6
	ldr r2, _08058CC4
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r5, [r0, 0x1E]
	movs r4, 0
	ldr r6, _08058CC8
_08058CA4:
	lsls r0, r4, 2
	adds r0, r6
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08058CCC
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _08058CD8
	.align 2, 0
_08058CC0: .4byte gPlayerAvatar
_08058CC4: .4byte gMapObjects
_08058CC8: .4byte gUnknown_0830FB58
_08058CCC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x11
	bls _08058CA4
_08058CD6:
	movs r0, 0
_08058CD8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetForcedMovementByMetatileBehavior

	thumb_func_start ForcedMovement_None
ForcedMovement_None: @ 8058CE0
	push {r4,lr}
	ldr r4, _08058D24
	ldrb r1, [r4]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08058D1A
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058D28
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r0, 0x18]
	lsls r1, 28
	lsrs r1, 28
	bl FieldObjectSetDirection
	ldrb r1, [r4]
	movs r0, 0xBF
	ands r0, r1
	strb r0, [r4]
_08058D1A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08058D24: .4byte gPlayerAvatar
_08058D28: .4byte gMapObjects
	thumb_func_end ForcedMovement_None

	thumb_func_start DoForcedMovement
DoForcedMovement: @ 8058D2C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08058D6C
	adds r0, r5, 0
	bl CheckForPlayerAvatarCollision
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldrb r0, [r6]
	movs r1, 0x40
	mov r10, r1
	movs r1, 0
	mov r8, r1
	mov r1, r10
	orrs r0, r1
	strb r0, [r6]
	cmp r4, 0
	beq _08058D88
	bl ForcedMovement_None
	cmp r4, 0x4
	bhi _08058D70
	movs r0, 0
	b _08058D94
	.align 2, 0
_08058D6C: .4byte gPlayerAvatar
_08058D70:
	cmp r7, 0x6
	bne _08058D7A
	adds r0, r5, 0
	bl PlayerJumpLedge
_08058D7A:
	ldrb r0, [r6]
	mov r1, r10
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x2
	strb r0, [r6, 0x2]
	b _08058D92
_08058D88:
	movs r0, 0x2
	strb r0, [r6, 0x2]
	adds r0, r5, 0
	bl _call_via_r9
_08058D92:
	movs r0, 0x1
_08058D94:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DoForcedMovement

	thumb_func_start DoForcedMovementInCurrentDirection
DoForcedMovementInCurrentDirection: @ 8058DA4
	push {lr}
	adds r1, r0, 0
	ldr r0, _08058DD0
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08058DD4
	adds r0, r2
	ldrb r2, [r0, 0x1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058DD0: .4byte gPlayerAvatar
_08058DD4: .4byte gMapObjects
	thumb_func_end DoForcedMovementInCurrentDirection

	thumb_func_start ForcedMovement_Slip
ForcedMovement_Slip: @ 8058DD8
	push {lr}
	ldr r0, _08058DE8
	bl DoForcedMovementInCurrentDirection
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058DE8: .4byte sub_80593C4
	thumb_func_end ForcedMovement_Slip

	thumb_func_start sub_8058AAC
sub_8058AAC: @ 8058DEC
	push {lr}
	ldr r1, _08058E00
	movs r0, 0x1
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058E00: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058AAC

	thumb_func_start sub_8058AC4
sub_8058AC4: @ 8058E04
	push {lr}
	ldr r1, _08058E18
	movs r0, 0x2
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058E18: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058AC4

	thumb_func_start sub_8058ADC
sub_8058ADC: @ 8058E1C
	push {lr}
	ldr r1, _08058E30
	movs r0, 0x3
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058E30: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058ADC

	thumb_func_start sub_8058AF4
sub_8058AF4: @ 8058E34
	push {lr}
	ldr r1, _08058E48
	movs r0, 0x4
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058E48: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058AF4

	thumb_func_start sub_8058B0C
sub_8058B0C: @ 8058E4C
	push {lr}
	ldr r1, _08058E60
	movs r0, 0x1
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058E60: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B0C

	thumb_func_start sub_8058B24
sub_8058B24: @ 8058E64
	push {lr}
	ldr r1, _08058E78
	movs r0, 0x2
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058E78: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B24

	thumb_func_start sub_8058B3C
sub_8058B3C: @ 8058E7C
	push {lr}
	ldr r1, _08058E90
	movs r0, 0x3
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058E90: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B3C

	thumb_func_start sub_8058B54
sub_8058B54: @ 8058E94
	push {lr}
	ldr r1, _08058EA8
	movs r0, 0x4
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058EA8: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B54

	thumb_func_start ForcedMovement_Slide
ForcedMovement_Slide: @ 8058EAC
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08058EDC
	ldrb r3, [r2, 0x5]
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	ldr r3, _08058EE0
	adds r2, r3
	ldrb r3, [r2, 0x1]
	movs r4, 0x4
	orrs r3, r4
	movs r4, 0x2
	orrs r3, r4
	strb r3, [r2, 0x1]
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08058EDC: .4byte gPlayerAvatar
_08058EE0: .4byte gMapObjects
	thumb_func_end ForcedMovement_Slide

	thumb_func_start ForcedMovement_SlideSouth
ForcedMovement_SlideSouth: @ 8058EE4
	push {lr}
	ldr r1, _08058EF8
	movs r0, 0x1
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058EF8: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideSouth

	thumb_func_start ForcedMovement_SlideNorth
ForcedMovement_SlideNorth: @ 8058EFC
	push {lr}
	ldr r1, _08058F10
	movs r0, 0x2
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058F10: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideNorth

	thumb_func_start ForcedMovement_SlideWest
ForcedMovement_SlideWest: @ 8058F14
	push {lr}
	ldr r1, _08058F28
	movs r0, 0x3
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058F28: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideWest

	thumb_func_start ForcedMovement_SlideEast
ForcedMovement_SlideEast: @ 8058F2C
	push {lr}
	ldr r1, _08058F40
	movs r0, 0x4
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058F40: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideEast

	thumb_func_start sub_8058C04
sub_8058C04: @ 8058F44
	push {lr}
	bl sub_8059F94
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8058C04

	thumb_func_start sub_8058C10
sub_8058C10: @ 8058F50
	push {lr}
	bl sub_805A06C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8058C10

	thumb_func_start ForcedMovement_MuddySlope
ForcedMovement_MuddySlope: @ 8058F5C
	push {r4,lr}
	ldr r0, _08058FA0
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058FA4
	adds r4, r0, r1
	ldrb r1, [r4, 0x18]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0x20
	bne _08058F82
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _08058FAC
_08058F82:
	movs r0, 0
	bl sub_80E6010
	ldrb r0, [r4, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r1, _08058FA8
	movs r0, 0x1
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	b _08058FAE
	.align 2, 0
_08058FA0: .4byte gPlayerAvatar
_08058FA4: .4byte gMapObjects
_08058FA8: .4byte sub_80593C4
_08058FAC:
	movs r0, 0
_08058FAE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ForcedMovement_MuddySlope

	thumb_func_start MovePlayerNotOnBike
MovePlayerNotOnBike: @ 8058FB4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _08058FE0
	adds r0, r4, 0
	bl CheckMovementInputNotOnBike
	lsls r0, 24
	lsrs r0, 22
	adds r0, r6
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058FE0: .4byte gUnknown_0830FBEC
	thumb_func_end MovePlayerNotOnBike

	thumb_func_start CheckMovementInputNotOnBike
CheckMovementInputNotOnBike: @ 8058FE4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08058FFC
	ldr r0, _08058FF8
	strb r4, [r0, 0x2]
	movs r0, 0
	b _0805901E
	.align 2, 0
_08058FF8: .4byte gPlayerAvatar
_08058FFC:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _08059018
	ldr r1, _08059014
	ldrb r0, [r1, 0x2]
	cmp r0, 0x2
	beq _08059018
	movs r0, 0x1
	b _0805901C
	.align 2, 0
_08059014: .4byte gPlayerAvatar
_08059018:
	ldr r1, _08059024
	movs r0, 0x2
_0805901C:
	strb r0, [r1, 0x2]
_0805901E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08059024: .4byte gPlayerAvatar
	thumb_func_end CheckMovementInputNotOnBike

	thumb_func_start PlayerNotOnBikeNotMoving
PlayerNotOnBikeNotMoving: @ 8059028
	push {lr}
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl PlayerFaceDirection
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeNotMoving

	thumb_func_start PlayerNotOnBikeTurningInPlace
PlayerNotOnBikeTurningInPlace: @ 805903C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl PlayerTurnInPlace
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeTurningInPlace

	thumb_func_start sub_8058D0C
sub_8058D0C: @ 805904C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r5, 0
	bl CheckForPlayerAvatarCollision
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	beq _08059084
	cmp r0, 0x6
	bne _08059072
	adds r0, r5, 0
	bl PlayerJumpLedge
	b _080590EE
_08059072:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _080590EE
	adds r0, r5, 0
	bl PlayerNotOnBikeCollide
	b _080590EE
_08059084:
	ldr r6, _08059098
	ldrb r1, [r6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805909C
	adds r0, r5, 0
	bl sub_80593C4
	b _080590EE
	.align 2, 0
_08059098: .4byte gPlayerAvatar
_0805909C:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _080590E8
	movs r0, 0x2
	ands r4, r0
	cmp r4, 0
	beq _080590E8
	movs r0, 0x86
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080590E8
	ldr r2, _080590E4
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	bl sub_80E5DEC
	lsls r0, 24
	cmp r0, 0
	bne _080590E8
	adds r0, r5, 0
	bl sub_805940C
	ldrb r1, [r6]
	movs r0, 0x80
	orrs r0, r1
	strb r0, [r6]
	b _080590EE
	.align 2, 0
_080590E4: .4byte gMapObjects
_080590E8:
	adds r0, r5, 0
	bl PlayerGoSpeed0
_080590EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8058D0C

	thumb_func_start CheckForPlayerAvatarCollision
CheckForPlayerAvatarCollision: @ 80590F4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08059158
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805915C
	adds r4, r0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	bl MoveCoords
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	add r1, sp, 0x4
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	str r0, [sp]
	adds r0, r4, 0
	adds r3, r6, 0
	bl CheckForFieldObjectCollision
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08059158: .4byte gPlayerAvatar
_0805915C: .4byte gMapObjects
	thumb_func_end CheckForPlayerAvatarCollision

	thumb_func_start CheckForFieldObjectCollision
CheckForFieldObjectCollision: @ 8059160
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsrs r7, r1, 16
	asrs r5, r1, 16
	lsrs r1, r2, 16
	mov r9, r1
	asrs r4, r2, 16
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0x3
	bne _080591B0
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8058EF0
	lsls r0, 24
	cmp r0, 0
	beq _080591B0
	movs r0, 0x5
	b _0805921E
_080591B0:
	lsls r5, r7, 16
	asrs r0, r5, 16
	mov r8, r0
	mov r1, r9
	lsls r4, r1, 16
	asrs r7, r4, 16
	adds r1, r7, 0
	adds r2, r6, 0
	bl ShouldJumpLedge
	lsls r0, 24
	cmp r0, 0
	beq _080591D4
	movs r0, 0x2B
	bl sav12_xor_increment
	movs r0, 0x6
	b _0805921E
_080591D4:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _080591F0
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_8058F6C
	lsls r0, 24
	cmp r0, 0
	beq _080591F0
	movs r0, 0x7
	b _0805921E
_080591F0:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _0805921A
	asrs r5, 16
	asrs r4, 16
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl CheckForRotatingGatePuzzleCollision
	cmp r0, 0
	beq _0805920E
	movs r0, 0x8
	b _0805921E
_0805920E:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r10
	mov r3, sp
	bl check_acro_bike_metatile
_0805921A:
	mov r0, sp
	ldrb r0, [r0]
_0805921E:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckForFieldObjectCollision

	thumb_func_start sub_8058EF0
sub_8058EF0: @ 8059230
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _0805927C
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08059280
	lsls r5, r3, 16
	asrs r0, r5, 16
	lsls r4, 16
	asrs r1, r4, 16
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08059280
	lsrs r0, r5, 16
	lsrs r1, r4, 16
	movs r2, 0x3
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	bne _08059280
	adds r0, r6, 0
	bl sub_805A20C
	movs r0, 0x1
	b _08059282
	.align 2, 0
_0805927C: .4byte gPlayerAvatar
_08059280:
	movs r0, 0
_08059282:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8058EF0

	thumb_func_start ShouldJumpLedge
ShouldJumpLedge: @ 8059288
	push {lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetLedgeJumpDirection
	lsls r0, 24
	cmp r0, 0
	bne _080592A4
	movs r0, 0
	b _080592A6
_080592A4:
	movs r0, 0x1
_080592A6:
	pop {r1}
	bx r1
	thumb_func_end ShouldJumpLedge

	thumb_func_start sub_8058F6C
sub_8058F6C: @ 80592AC
	push {r4-r7,lr}
	sub sp, 0x4
	mov r3, sp
	strh r0, [r3]
	mov r5, sp
	adds r5, 0x2
	strh r1, [r5]
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r0, _08059344
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0805934C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl GetFieldObjectIdByXY
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x10
	beq _0805934C
	ldr r0, _08059348
	lsls r1, r6, 3
	adds r1, r6
	lsls r1, 2
	adds r4, r1, r0
	ldrb r0, [r4, 0x5]
	cmp r0, 0x57
	bne _0805934C
	ldrh r1, [r4, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	strh r0, [r5]
	adds r0, r7, 0
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r7, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805934C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056F08
	lsls r0, 24
	cmp r0, 0
	bne _0805934C
	adds r0, r6, 0
	adds r1, r7, 0
	bl StartStrengthAnim
	movs r0, 0x1
	b _0805934E
	.align 2, 0
_08059344: .4byte 0x00000829
_08059348: .4byte gMapObjects
_0805934C:
	movs r0, 0
_0805934E:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8058F6C

	thumb_func_start check_acro_bike_metatile
check_acro_bike_metatile: @ 8059358
	push {r4-r7,lr}
	adds r6, r3, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	ldr r7, _08059380
_08059364:
	lsls r0, r4, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08059388
	ldr r0, _08059384
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r6]
	b _08059392
	.align 2, 0
_08059380: .4byte gUnknown_0830FBF8
_08059384: .4byte gUnknown_0830FC0C
_08059388:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08059364
_08059392:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end check_acro_bike_metatile

	thumb_func_start SetPlayerAvatarTransitionFlags
SetPlayerAvatarTransitionFlags: @ 8059398
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080593B0
	ldrb r1, [r2, 0x1]
	orrs r0, r1
	strb r0, [r2, 0x1]
	bl DoPlayerAvatarTransition
	pop {r0}
	bx r0
	.align 2, 0
_080593B0: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarTransitionFlags

	thumb_func_start DoPlayerAvatarTransition
DoPlayerAvatarTransition: @ 80593B4
	push {r4,r5,lr}
	ldr r0, _080593FC
	ldrb r4, [r0, 0x1]
	cmp r4, 0
	beq _080593F4
	movs r5, 0
_080593C0:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080593E2
	ldr r0, _08059400
	lsls r2, r5, 2
	adds r2, r0
	ldr r0, _080593FC
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08059404
	adds r0, r1
	ldr r1, [r2]
	bl _call_via_r1
_080593E2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsrs r4, 1
	cmp r5, 0x7
	bls _080593C0
	ldr r1, _080593FC
	movs r0, 0
	strb r0, [r1, 0x1]
_080593F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080593FC: .4byte gPlayerAvatar
_08059400: .4byte gUnknown_0830FC14
_08059404: .4byte gMapObjects
	thumb_func_end DoPlayerAvatarTransition

	thumb_func_start nullsub_49
nullsub_49: @ 8059408
	bx lr
	thumb_func_end nullsub_49

	thumb_func_start PlayerAvatarTransition_Normal
PlayerAvatarTransition_Normal: @ 805940C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x1
	bl SetPlayerAvatarStateMask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Normal

	thumb_func_start PlayerAvatarTransition_MachBike
PlayerAvatarTransition_MachBike: @ 8059438
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x2
	bl SetPlayerAvatarStateMask
	movs r0, 0
	movs r1, 0
	bl sub_80E5FCC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_MachBike

	thumb_func_start PlayerAvatarTransition_AcroBike
PlayerAvatarTransition_AcroBike: @ 805946C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x4
	bl SetPlayerAvatarStateMask
	movs r0, 0
	movs r1, 0
	bl sub_80E5FCC
	bl sub_80E6084
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_AcroBike

	thumb_func_start PlayerAvatarTransition_Surfing
PlayerAvatarTransition_Surfing: @ 80594A4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	ldr r1, _080594F8
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	ldr r0, _080594FC
	ldrb r0, [r0, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080594F8: .4byte gUnknown_0202FF84
_080594FC: .4byte gPlayerAvatar
	thumb_func_end PlayerAvatarTransition_Surfing

	thumb_func_start PlayerAvatarTransition_Underwater
PlayerAvatarTransition_Underwater: @ 8059500
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x4
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x10
	bl SetPlayerAvatarStateMask
	ldrb r0, [r4, 0x4]
	bl sub_8128124
	strb r0, [r4, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Underwater

	thumb_func_start sub_80591F4
sub_80591F4: @ 8059534
	ldr r2, _08059540
	ldrb r1, [r2]
	movs r0, 0x20
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08059540: .4byte gPlayerAvatar
	thumb_func_end sub_80591F4

	thumb_func_start sub_8059204
sub_8059204: @ 8059544
	push {r4,lr}
	ldr r4, _08059570
	movs r0, 0
	strb r0, [r4, 0x3]
	bl PlayerIsAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08059582
	bl PlayerCheckIfAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	bne _08059574
	bl player_is_anim_in_certain_ranges
	lsls r0, 24
	cmp r0, 0
	bne _08059582
	movs r0, 0x1
	b _08059580
	.align 2, 0
_08059570: .4byte gPlayerAvatar
_08059574:
	bl sub_80592A4
	lsls r0, 24
	cmp r0, 0
	bne _08059582
	movs r0, 0x2
_08059580:
	strb r0, [r4, 0x3]
_08059582:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059204

	thumb_func_start player_is_anim_in_certain_ranges
player_is_anim_in_certain_ranges: @ 8059588
	push {lr}
	ldr r2, _080595D4
	ldr r0, _080595D8
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1C]
	cmp r1, 0x3
	bls _080595CE
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _080595CE
	adds r0, r1, 0
	subs r0, 0x19
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _080595CE
	adds r0, r1, 0
	subs r0, 0x62
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bls _080595CE
	adds r0, r1, 0
	subs r0, 0x7A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080595DC
_080595CE:
	movs r0, 0x1
	b _080595DE
	.align 2, 0
_080595D4: .4byte gMapObjects
_080595D8: .4byte gPlayerAvatar
_080595DC:
	movs r0, 0
_080595DE:
	pop {r1}
	bx r1
	thumb_func_end player_is_anim_in_certain_ranges

	thumb_func_start sub_80592A4
sub_80592A4: @ 80595E4
	push {lr}
	bl player_is_anim_in_certain_ranges
	lsls r0, 24
	cmp r0, 0
	beq _08059600
	ldr r0, _080595FC
	ldrb r0, [r0, 0x2]
	cmp r0, 0x1
	beq _08059600
	movs r0, 0x1
	b _08059602
	.align 2, 0
_080595FC: .4byte gPlayerAvatar
_08059600:
	movs r0, 0
_08059602:
	pop {r1}
	bx r1
	thumb_func_end sub_80592A4

	thumb_func_start PlayerIsAnimActive
PlayerIsAnimActive: @ 8059608
	push {lr}
	ldr r0, _08059624
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08059628
	adds r0, r1
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08059624: .4byte gPlayerAvatar
_08059628: .4byte gMapObjects
	thumb_func_end PlayerIsAnimActive

	thumb_func_start PlayerCheckIfAnimFinishedOrInactive
PlayerCheckIfAnimFinishedOrInactive: @ 805962C
	push {lr}
	ldr r0, _08059648
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805964C
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08059648: .4byte gPlayerAvatar
_0805964C: .4byte gMapObjects
	thumb_func_end PlayerCheckIfAnimFinishedOrInactive

	thumb_func_start player_set_x22
player_set_x22: @ 8059650
	ldr r3, _08059664
	ldr r1, _08059668
	ldrb r2, [r1, 0x5]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	adds r1, 0x22
	strb r0, [r1]
	bx lr
	.align 2, 0
_08059664: .4byte gMapObjects
_08059668: .4byte gPlayerAvatar
	thumb_func_end player_set_x22

	thumb_func_start player_get_x22
player_get_x22: @ 805966C
	ldr r2, _08059680
	ldr r0, _08059684
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x22
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08059680: .4byte gMapObjects
_08059684: .4byte gPlayerAvatar
	thumb_func_end player_get_x22

	thumb_func_start sub_8059348
sub_8059348: @ 8059688
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _080596A8
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080596AC
	adds r0, r2
	bl FieldObjectForceSetSpecialAnim
	pop {r0}
	bx r0
	.align 2, 0
_080596A8: .4byte gPlayerAvatar
_080596AC: .4byte gMapObjects
	thumb_func_end sub_8059348

	thumb_func_start player_npc_set_state_and_x22_etc
player_npc_set_state_and_x22_etc: @ 80596B0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl PlayerIsAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _080596DE
	adds r0, r4, 0
	bl player_set_x22
	ldr r0, _080596E4
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080596E8
	adds r0, r1
	adds r1, r5, 0
	bl FieldObjectSetSpecialAnim
_080596DE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080596E4: .4byte gPlayerAvatar
_080596E8: .4byte gMapObjects
	thumb_func_end player_npc_set_state_and_x22_etc

	thumb_func_start PlayerGoSpeed0
PlayerGoSpeed0: @ 80596EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed0

	thumb_func_start sub_80593C4
sub_80593C4: @ 8059704
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060744
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_80593C4

	thumb_func_start npc_use_some_d2s
npc_use_some_d2s: @ 805971C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl d2s_08064034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end npc_use_some_d2s

	thumb_func_start sub_80593F4
sub_80593F4: @ 8059734
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806079C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_80593F4

	thumb_func_start sub_805940C
sub_805940C: @ 805974C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80607F4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_805940C

	thumb_func_start PlayerOnBikeCollide
PlayerOnBikeCollide: @ 8059764
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, 0
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerOnBikeCollide

	thumb_func_start PlayerNotOnBikeCollide
PlayerNotOnBikeCollide: @ 8059788
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, 0
	bl GetStepInPlaceDelay32AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeCollide

	thumb_func_start PlayerFaceDirection
PlayerFaceDirection: @ 80597AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerFaceDirection

	thumb_func_start PlayerTurnInPlace
PlayerTurnInPlace: @ 80597C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay8AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerTurnInPlace

	thumb_func_start PlayerJumpLedge
PlayerJumpLedge: @ 80597DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xA
	bl PlaySE
	adds r0, r4, 0
	bl GetJumpLedgeAnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerJumpLedge

	thumb_func_start sub_80594C0
sub_80594C0: @ 8059800
	push {r4,lr}
	ldr r4, _0805983C
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	beq _0805980E
	cmp r0, 0
	bne _08059836
_0805980E:
	bl player_should_look_direction_be_enforced_upon_movement
	lsls r0, 24
	cmp r0, 0
	beq _08059836
	ldr r2, _08059840
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059348
_08059836:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805983C: .4byte gPlayerAvatar
_08059840: .4byte gMapObjects
	thumb_func_end sub_80594C0

	thumb_func_start sub_8059504
sub_8059504: @ 8059844
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80609D8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059504

	thumb_func_start sub_805951C
sub_805951C: @ 805985C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060A04
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_805951C

	thumb_func_start sub_8059534
sub_8059534: @ 8059874
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060A30
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059534

	thumb_func_start sub_805954C
sub_805954C: @ 805988C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060A5C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805954C

	thumb_func_start sub_8059570
sub_8059570: @ 80598B0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060A88
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059570

	thumb_func_start sub_8059594
sub_8059594: @ 80598D4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060AB4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059594

	thumb_func_start sub_80595B8
sub_80595B8: @ 80598F8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060878
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80595B8

	thumb_func_start sub_80595DC
sub_80595DC: @ 805991C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	bl PlaySE
	adds r0, r4, 0
	bl sub_8060AE0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80595DC

	thumb_func_start sub_8059600
sub_8059600: @ 8059940
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B0C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059600

	thumb_func_start sub_8059618
sub_8059618: @ 8059958
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059618

	thumb_func_start sub_8059630
sub_8059630: @ 8059970
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B64
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059630

	thumb_func_start PlayCollisionSoundIfNotFacingWarp
PlayCollisionSoundIfNotFacingWarp: @ 8059988
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080599F8
	ldr r0, _080599FC
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	ldr r2, _08059A00
	subs r1, r4, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080599F0
	cmp r4, 0x2
	bne _080599EA
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	cmp r0, 0
	bne _080599F0
_080599EA:
	movs r0, 0x7
	bl PlaySE
_080599F0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080599F8: .4byte gMapObjects
_080599FC: .4byte gPlayerAvatar
_08059A00: .4byte gUnknown_0830FC34
	thumb_func_end PlayCollisionSoundIfNotFacingWarp

	thumb_func_start GetXYCoordsOneStepInFrontOfPlayer
GetXYCoordsOneStepInFrontOfPlayer: @ 8059A04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r3, _08059A40
	ldr r2, _08059A44
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x10]
	strh r0, [r4]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	strh r0, [r5]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl MoveCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059A40: .4byte gMapObjects
_08059A44: .4byte gPlayerAvatar
	thumb_func_end GetXYCoordsOneStepInFrontOfPlayer

	thumb_func_start PlayerGetDestCoords
PlayerGetDestCoords: @ 8059A48
	push {r4,r5,lr}
	ldr r5, _08059A70
	ldr r4, _08059A74
	ldrb r3, [r4, 0x5]
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	ldrh r2, [r2, 0x10]
	strh r2, [r0]
	ldrb r2, [r4, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x12]
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059A70: .4byte gMapObjects
_08059A74: .4byte gPlayerAvatar
	thumb_func_end PlayerGetDestCoords

	thumb_func_start player_get_direction_lower_nybble
player_get_direction_lower_nybble: @ 8059A78
	ldr r2, _08059A90
	ldr r0, _08059A94
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08059A90: .4byte gMapObjects
_08059A94: .4byte gPlayerAvatar
	thumb_func_end player_get_direction_lower_nybble

	thumb_func_start player_get_direction_upper_nybble
player_get_direction_upper_nybble: @ 8059A98
	ldr r2, _08059AAC
	ldr r0, _08059AB0
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	bx lr
	.align 2, 0
_08059AAC: .4byte gMapObjects
_08059AB0: .4byte gPlayerAvatar
	thumb_func_end player_get_direction_upper_nybble

	thumb_func_start PlayerGetZCoord
PlayerGetZCoord: @ 8059AB4
	ldr r2, _08059AC8
	ldr r0, _08059ACC
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	bx lr
	.align 2, 0
_08059AC8: .4byte gMapObjects
_08059ACC: .4byte gPlayerAvatar
	thumb_func_end PlayerGetZCoord

	thumb_func_start unref_sub_8059790
unref_sub_8059790: @ 8059AD0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _08059AF8
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08059AFC
	adds r0, r1
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	bl sub_805C058
	pop {r0}
	bx r0
	.align 2, 0
_08059AF8: .4byte gPlayerAvatar
_08059AFC: .4byte gMapObjects
	thumb_func_end unref_sub_8059790

	thumb_func_start TestPlayerAvatarFlags
TestPlayerAvatarFlags: @ 8059B00
	ldr r1, _08059B0C
	ldrb r1, [r1]
	ands r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_08059B0C: .4byte gPlayerAvatar
	thumb_func_end TestPlayerAvatarFlags

	thumb_func_start sub_80597D0
sub_80597D0: @ 8059B10
	ldr r0, _08059B18
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08059B18: .4byte gPlayerAvatar
	thumb_func_end sub_80597D0

	thumb_func_start GetPlayerAvatarObjectId
GetPlayerAvatarObjectId: @ 8059B1C
	ldr r0, _08059B24
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_08059B24: .4byte gPlayerAvatar
	thumb_func_end GetPlayerAvatarObjectId

	thumb_func_start sub_80597E8
sub_80597E8: @ 8059B28
	push {lr}
	bl ForcedMovement_None
	pop {r0}
	bx r0
	thumb_func_end sub_80597E8

	thumb_func_start sub_80597F4
sub_80597F4: @ 8059B34
	push {r4,lr}
	ldr r0, _08059B74
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059B78
	adds r4, r0
	adds r0, r4, 0
	bl npc_clear_strange_bits
	ldrb r1, [r4, 0x18]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08059B6C
	bl sub_80E6084
	movs r0, 0
	bl sub_80E6010
_08059B6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059B74: .4byte gPlayerAvatar
_08059B78: .4byte gMapObjects
	thumb_func_end sub_80597F4

	thumb_func_start sub_805983C
sub_805983C: @ 8059B7C
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08059B90
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08059B90: .4byte gUnknown_0830FC44
	thumb_func_end sub_805983C

	thumb_func_start GetPlayerAvatarGraphicsIdByStateIdAndGender
GetPlayerAvatarGraphicsIdByStateIdAndGender: @ 8059B94
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08059BA8
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08059BA8: .4byte gUnknown_0830FC54
	thumb_func_end GetPlayerAvatarGraphicsIdByStateIdAndGender

	thumb_func_start GetPlayerAvatarGraphicsIdByStateId
GetPlayerAvatarGraphicsIdByStateId: @ 8059BAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08059BC4
	ldrb r1, [r1, 0x7]
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08059BC4: .4byte gPlayerAvatar
	thumb_func_end GetPlayerAvatarGraphicsIdByStateId

	thumb_func_start unref_sub_8059888
unref_sub_8059888: @ 8059BC8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x70
	beq _08059BEA
	cmp r0, 0x70
	bgt _08059BE2
	cmp r0, 0x6D
	bgt _08059BEE
	cmp r0, 0x69
	blt _08059BEE
	b _08059BEA
_08059BE2:
	cmp r1, 0x8A
	beq _08059BEA
	cmp r1, 0xC0
	bne _08059BEE
_08059BEA:
	movs r0, 0x1
	b _08059BF0
_08059BEE:
	movs r0, 0
_08059BF0:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8059888

	thumb_func_start GetPlayerAvatarGenderByGraphicsId
GetPlayerAvatarGenderByGraphicsId: @ 8059BF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x70
	beq _08059C16
	cmp r0, 0x70
	bgt _08059C0E
	cmp r0, 0x5D
	bgt _08059C1A
	cmp r0, 0x59
	blt _08059C1A
	b _08059C16
_08059C0E:
	cmp r1, 0x8A
	beq _08059C16
	cmp r1, 0xC0
	bne _08059C1A
_08059C16:
	movs r0, 0x1
	b _08059C1C
_08059C1A:
	movs r0, 0
_08059C1C:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGenderByGraphicsId

	thumb_func_start PartyHasMonWithSurf
PartyHasMonWithSurf: @ 8059C20
	push {r4,r5,lr}
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _08059C64
	movs r5, 0
	b _08059C4A
_08059C32:
	adds r0, r4, 0
	movs r1, 0x39
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _08059C44
	movs r0, 0x1
	b _08059C66
_08059C44:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_08059C4A:
	cmp r5, 0x5
	bhi _08059C64
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08059C6C
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	bne _08059C32
_08059C64:
	movs r0, 0
_08059C66:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08059C6C: .4byte gPlayerParty
	thumb_func_end PartyHasMonWithSurf

	thumb_func_start IsPlayerSurfingNorth
IsPlayerSurfingNorth: @ 8059C70
	push {lr}
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _08059C8E
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08059C8E
	movs r0, 0x1
	b _08059C90
_08059C8E:
	movs r0, 0
_08059C90:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerSurfingNorth

	thumb_func_start IsPlayerFacingSurfableFishableWater
IsPlayerFacingSurfableFishableWater: @ 8059C94
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08059D0C
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D10
	adds r4, r0
	ldrh r1, [r4, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	ldrb r3, [r4, 0x18]
	lsls r3, 28
	lsrs r3, 28
	adds r0, r4, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08059D14
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08059D14
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableFishableWater
	lsls r0, 24
	cmp r0, 0
	beq _08059D14
	movs r0, 0x1
	b _08059D16
	.align 2, 0
_08059D0C: .4byte gPlayerAvatar
_08059D10: .4byte gMapObjects
_08059D14:
	movs r0, 0
_08059D16:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsPlayerFacingSurfableFishableWater

	thumb_func_start ClearPlayerAvatarInfo
ClearPlayerAvatarInfo: @ 8059D20
	push {lr}
	ldr r0, _08059D30
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_08059D30: .4byte gPlayerAvatar
	thumb_func_end ClearPlayerAvatarInfo

	thumb_func_start SetPlayerAvatarStateMask
SetPlayerAvatarStateMask: @ 8059D34
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08059D48
	ldrb r2, [r3]
	movs r1, 0xE0
	ands r1, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_08059D48: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarStateMask

	thumb_func_start GetPlayerAvatarStateTransitionByGraphicsId
GetPlayerAvatarStateTransitionByGraphicsId: @ 8059D4C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	ldr r3, _08059D74
	lsls r0, r1, 2
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_08059D62:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _08059D78
	adds r0, r1, r6
	ldrb r0, [r0]
	b _08059D84
	.align 2, 0
_08059D74: .4byte gUnknown_0830FC64
_08059D78:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08059D62
	movs r0, 0x1
_08059D84:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarStateTransitionByGraphicsId

	thumb_func_start GetPlayerAvatarGraphicsIdByCurrentState
GetPlayerAvatarGraphicsIdByCurrentState: @ 8059D8C
	push {r4-r6,lr}
	ldr r0, _08059DB4
	ldrb r5, [r0]
	movs r2, 0
	ldr r3, _08059DB8
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 2
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_08059DA0:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r6
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _08059DBC
	adds r0, r1, r3
	ldrb r0, [r0]
	b _08059DC8
	.align 2, 0
_08059DB4: .4byte gPlayerAvatar
_08059DB8: .4byte gUnknown_0830FC64
_08059DBC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08059DA0
	movs r0, 0
_08059DC8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGraphicsIdByCurrentState

	thumb_func_start SetPlayerAvatarExtraStateTransition
SetPlayerAvatarExtraStateTransition: @ 8059DD0
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08059DFC
	ldrb r1, [r5, 0x7]
	bl GetPlayerAvatarStateTransitionByGraphicsId
	lsls r0, 24
	lsrs r0, 24
	orrs r0, r4
	ldrb r1, [r5, 0x1]
	orrs r0, r1
	strb r0, [r5, 0x1]
	bl DoPlayerAvatarTransition
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059DFC: .4byte gPlayerAvatar
	thumb_func_end SetPlayerAvatarExtraStateTransition

	thumb_func_start InitPlayerAvatar
InitPlayerAvatar: @ 8059E00
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	mov r9, r2
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0
	mov r1, r8
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	mov r1, sp
	movs r3, 0
	strb r0, [r1, 0x1]
	mov r0, sp
	lsls r4, 16
	asrs r4, 16
	subs r4, 0x7
	movs r6, 0
	strh r4, [r0, 0x4]
	lsls r5, 16
	asrs r5, 16
	subs r5, 0x7
	strh r5, [r0, 0x6]
	strb r6, [r0, 0x8]
	movs r0, 0xB
	strb r0, [r1, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xA]
	subs r0, 0x1B
	ands r0, r1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r6, [r0, 0xA]
	strh r3, [r0, 0xC]
	strh r3, [r0, 0xE]
	str r3, [sp, 0x10]
	strh r3, [r0, 0x14]
	bl SpawnSpecialFieldObject
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 3
	adds r4, r5
	lsls r4, 2
	ldr r0, _08059EC0
	adds r4, r0
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x2]
	bl sub_8126B54
	strb r0, [r4, 0x1B]
	adds r0, r4, 0
	mov r1, r9
	bl FieldObjectTurn
	bl ClearPlayerAvatarInfo
	ldr r0, _08059EC4
	strb r6, [r0, 0x2]
	strb r6, [r0, 0x3]
	strb r5, [r0, 0x5]
	ldrb r1, [r4, 0x4]
	strb r1, [r0, 0x4]
	mov r1, r8
	strb r1, [r0, 0x7]
	movs r0, 0x21
	bl SetPlayerAvatarStateMask
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059EC0: .4byte gMapObjects
_08059EC4: .4byte gPlayerAvatar
	thumb_func_end InitPlayerAvatar

	thumb_func_start sub_8059B88
sub_8059B88: @ 8059EC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _08059F28
	ldr r5, _08059F2C
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	ands r4, r0
	lsls r3, r4, 5
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08059F20
	ldr r2, _08059F30
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1A]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	lsls r3, r4, 2
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_08059F20:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059F28: .4byte gMapObjects
_08059F2C: .4byte gPlayerAvatar
_08059F30: .4byte gSprites
	thumb_func_end sub_8059B88

	thumb_func_start sub_8059BF4
sub_8059BF4: @ 8059F34
	push {r4,r5,lr}
	ldr r5, _08059F70
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059F74
	adds r4, r0
	movs r0, 0x5
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08059F78
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059F70: .4byte gPlayerAvatar
_08059F74: .4byte gMapObjects
_08059F78: .4byte gSprites
	thumb_func_end sub_8059BF4

	thumb_func_start sub_8059C3C
sub_8059C3C: @ 8059F7C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059FC8
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059FCC
	adds r4, r0
	movs r0, 0x6
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059FD0
	adds r4, r0
	adds r0, r5, 0
	bl sub_805FDE8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059FC8: .4byte gPlayerAvatar
_08059FCC: .4byte gMapObjects
_08059FD0: .4byte gSprites
	thumb_func_end sub_8059C3C

	thumb_func_start sub_8059C94
sub_8059C94: @ 8059FD4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0805A03C
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A040
	adds r4, r0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A044
	mov r8, r0
	add r4, r8
	adds r0, r5, 0
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x1
	bl SeekSpriteAnim
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A03C: .4byte gPlayerAvatar
_0805A040: .4byte gMapObjects
_0805A044: .4byte gSprites
	thumb_func_end sub_8059C94

	thumb_func_start sub_8059D08
sub_8059D08: @ 805A048
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0805A094
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A098
	adds r4, r0
	movs r0, 0x7
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A09C
	adds r4, r0
	adds r0, r5, 0
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A094: .4byte gPlayerAvatar
_0805A098: .4byte gMapObjects
_0805A09C: .4byte gSprites
	thumb_func_end sub_8059D08

	thumb_func_start sub_8059D60
sub_8059D60: @ 805A0A0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrb r0, [r5, 0x1E]
	mov r8, r0
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	movs r6, 0x1
	ldr r1, _0805A104
	mov r9, r1
	mov r4, sp
	mov r7, sp
	adds r7, 0x2
_0805A0C2:
	movs r1, 0
	ldrsh r0, [r4, r1]
	lsls r0, 2
	add r0, r9
	ldr r1, [r0]
	mov r0, r8
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _0805A108
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	cmp r6, r0
	bne _0805A108
	ldrh r0, [r5, 0x10]
	strh r0, [r4]
	ldrh r0, [r5, 0x12]
	strh r0, [r7]
	adds r0, r6, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	ldrb r0, [r5, 0x1B]
	movs r1, 0
	ldrsh r2, [r4, r1]
	movs r1, 0
	ldrsh r3, [r7, r1]
	adds r1, r6, 0
	bl sub_8126BC4
	b _0805A122
	.align 2, 0
_0805A104: .4byte gUnknown_0830FC78
_0805A108:
	ldrh r1, [r4]
	adds r1, 0x1
	strh r1, [r4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3
	ble _0805A0C2
	ldrb r0, [r5, 0x1B]
	bl objid_set_invisible
_0805A122:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8059D60

	thumb_func_start StartStrengthAnim
StartStrengthAnim: @ 805A130
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0805A164
	adds r0, r6, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A168
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	bl _call_via_r6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A164: .4byte sub_8059E2C
_0805A168: .4byte gTasks
	thumb_func_end StartStrengthAnim

	thumb_func_start sub_8059E2C
sub_8059E2C: @ 805A16C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _0805A1B4
	ldr r2, _0805A1B8
	ldr r5, _0805A1BC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A180:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldr r0, _0805A1C0
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _0805A180
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A1B4: .4byte gUnknown_0830FC88
_0805A1B8: .4byte gTasks
_0805A1BC: .4byte gMapObjects
_0805A1C0: .4byte gPlayerAvatar
	thumb_func_end sub_8059E2C

	thumb_func_start sub_8059E84
sub_8059E84: @ 805A1C4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0805A1E0
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A1E0: .4byte gPlayerAvatar
	thumb_func_end sub_8059E84

	thumb_func_start sub_8059EA4
sub_8059EA4: @ 805A1E4
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _0805A26E
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _0805A26E
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r6, 0xC]
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r6, 0xC]
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r2, _0805A278
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldrb r0, [r4, 0xB]
	lsrs r0, 4
	str r0, [r2, 0x8]
	ldr r3, _0805A27C
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r2, 0xC]
	movs r0, 0xA
	bl FieldEffectStart
	movs r0, 0xD6
	bl PlaySE
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805A26E:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A278: .4byte gUnknown_0202FF84
_0805A27C: .4byte gSprites
	thumb_func_end sub_8059EA4

	thumb_func_start sub_8059F40
sub_8059F40: @ 805A280
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	adds r0, r4, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _0805A2C2
	adds r0, r5, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _0805A2C2
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldr r1, _0805A2CC
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldr r0, _0805A2D0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A2C2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A2CC: .4byte gPlayerAvatar
_0805A2D0: .4byte sub_8059E2C
	thumb_func_end sub_8059F40

	thumb_func_start sub_8059F94
sub_8059F94: @ 805A2D4
	push {r4,lr}
	ldr r4, _0805A2F0
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A2F0: .4byte sub_8059FB4
	thumb_func_end sub_8059F94

	thumb_func_start sub_8059FB4
sub_8059FB4: @ 805A2F4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A330
	ldr r2, _0805A334
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A306:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _0805A338
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805A33C
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _0805A306
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A330: .4byte gUnknown_0830FC94
_0805A334: .4byte gTasks
_0805A338: .4byte gPlayerAvatar
_0805A33C: .4byte gMapObjects
	thumb_func_end sub_8059FB4

	thumb_func_start sub_805A000
sub_805A000: @ 805A340
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	ldr r5, _0805A3A4
	movs r0, 0x1
	strb r0, [r5, 0x6]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A39C
	movs r0, 0xA
	bl PlaySE
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806084C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0805A39C
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldr r0, _0805A3A8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A39C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A3A4: .4byte gPlayerAvatar
_0805A3A8: .4byte sub_8059FB4
	thumb_func_end sub_805A000

	thumb_func_start sub_805A06C
sub_805A06C: @ 805A3AC
	push {r4,lr}
	ldr r4, _0805A3C8
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3C8: .4byte sub_805A08C
	thumb_func_end sub_805A06C

	thumb_func_start sub_805A08C
sub_805A08C: @ 805A3CC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A408
	ldr r2, _0805A40C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A3DE:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _0805A410
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805A414
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _0805A3DE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A408: .4byte gUnknown_0830FC98
_0805A40C: .4byte gTasks
_0805A410: .4byte gPlayerAvatar
_0805A414: .4byte gMapObjects
	thumb_func_end sub_805A08C

	thumb_func_start sub_805A0D8
sub_805A0D8: @ 805A418
	push {lr}
	ldrh r2, [r0, 0x8]
	adds r2, 0x1
	strh r2, [r0, 0x8]
	ldrb r1, [r1, 0x18]
	lsrs r1, 4
	strh r1, [r0, 0xA]
	ldr r1, _0805A43C
	movs r0, 0x1
	strb r0, [r1, 0x6]
	bl ScriptContext2_Enable
	movs r0, 0x2D
	bl PlaySE
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0805A43C: .4byte gPlayerAvatar
	thumb_func_end sub_805A0D8

	thumb_func_start sub_805A100
sub_805A100: @ 805A440
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805A4B4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A4A8
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	subs r0, 0x1
	add r0, sp
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0xA]
	cmp r6, r0
	bne _0805A486
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A486:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _0805A4A8
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0805A4A8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A4A8:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A4B4: .4byte gUnknown_0830FCA8
	thumb_func_end sub_805A100

	thumb_func_start sub_805A178
sub_805A178: @ 805A4B8
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _0805A4F4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A4E8
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x1
	strh r0, [r5, 0x8]
_0805A4E8:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A4F4: .4byte gUnknown_0830FCAC
	thumb_func_end sub_805A178

	thumb_func_start sub_805A1B8
sub_805A1B8: @ 805A4F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A53C
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	bl ScriptContext2_Disable
	ldr r1, _0805A544
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r0, _0805A548
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A53C:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A544: .4byte gPlayerAvatar
_0805A548: .4byte sub_805A08C
	thumb_func_end sub_805A1B8

	thumb_func_start sub_805A20C
sub_805A20C: @ 805A54C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	bl sav1_reset_battle_music_maybe
	bl sub_8053F84
	ldr r2, _0805A598
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x6]
	ldr r5, _0805A59C
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A5A0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A598: .4byte gPlayerAvatar
_0805A59C: .4byte taskFF_0805D1D4
_0805A5A0: .4byte gTasks
	thumb_func_end sub_805A20C

	thumb_func_start taskFF_0805D1D4
taskFF_0805D1D4: @ 805A5A4
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0805A600
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A604
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0805A5D0
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A5F8
_0805A5D0:
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldr r0, _0805A608
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldr r0, _0805A60C
	str r0, [r4]
_0805A5F8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A600: .4byte gPlayerAvatar
_0805A604: .4byte gMapObjects
_0805A608: .4byte gTasks
_0805A60C: .4byte sub_805A2D0
	thumb_func_end taskFF_0805D1D4

	thumb_func_start sub_805A2D0
sub_805A2D0: @ 805A610
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0805A67C
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A680
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A676
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0
	strb r0, [r6, 0x6]
	bl ScriptContext2_Disable
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A684
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
_0805A676:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A67C: .4byte gPlayerAvatar
_0805A680: .4byte gMapObjects
_0805A684: .4byte gSprites
	thumb_func_end sub_805A2D0

	thumb_func_start StartFishing
StartFishing: @ 805A688
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0805A6B4
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A6B8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A6B4: .4byte Task_Fishing
_0805A6B8: .4byte gTasks
	thumb_func_end StartFishing

	thumb_func_start Task_Fishing
Task_Fishing: @ 805A6BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A6EC
	ldr r2, _0805A6F0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A6CE:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0805A6CE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A6EC: .4byte gUnknown_0830FCB4
_0805A6F0: .4byte gTasks
	thumb_func_end Task_Fishing

	thumb_func_start Fishing1
Fishing1: @ 805A6F4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptContext2_Enable
	ldr r1, _0805A710
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A710: .4byte gPlayerAvatar
	thumb_func_end Fishing1

	thumb_func_start Fishing2
Fishing2: @ 805A714
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldr r1, _0805A79C
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0805A7A0
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r5, 0x20]
	bl Random
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	lsls r1, 1
	mov r2, sp
	adds r6, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r6]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldr r3, _0805A7A4
	ldr r2, _0805A7A8
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	strh r0, [r5, 0x24]
	ldrb r0, [r2, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r0, [r4, 0x1]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8059C3C
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A79C: .4byte gUnknown_0830FCF4
_0805A7A0: .4byte gUnknown_0830FCFA
_0805A7A4: .4byte gMapObjects
_0805A7A8: .4byte gPlayerAvatar
	thumb_func_end Fishing2

	thumb_func_start Fishing3
Fishing3: @ 805A7AC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _0805A7C8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A7C8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fishing3

	thumb_func_start Fishing4
Fishing4: @ 805A7D0
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0805A804
	adds r0, r1, 0x4
	strh r0, [r4, 0xE]
_0805A804:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	ble _0805A810
	movs r0, 0xA
	strh r0, [r4, 0xE]
_0805A810:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fishing4

	thumb_func_start Fishing5
Fishing5: @ 805A818
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0805A854
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r2, r0, 0x1
	strh r2, [r4, 0xA]
	ldr r0, _0805A858
	ldrh r0, [r0, 0x2E]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A85C
	movs r0, 0xB
	strh r0, [r4, 0x8]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0805A84E
	movs r0, 0xC
	strh r0, [r4, 0x8]
_0805A84E:
	movs r0, 0x1
	b _0805A8A4
	.align 2, 0
_0805A854: .4byte gUnknown_0830FD00
_0805A858: .4byte gMain
_0805A85C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0805A8A2
	strh r1, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0805A88E
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	ldrh r2, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0805A888
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0805A888:
	adds r0, r2, 0x1
	strh r0, [r4, 0x20]
	b _0805A8A2
_0805A88E:
	adds r1, r2, 0x4
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	movs r2, 0xF
	bl MenuPrint
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A8A2:
	movs r0, 0
_0805A8A4:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fishing5

	thumb_func_start Fishing6
Fishing6: @ 805A8AC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl GetFishingWildMonListHeader
	lsls r0, 24
	cmp r0, 0
	beq _0805A8D0
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A8D6
_0805A8D0:
	movs r0, 0xB
	strh r0, [r4, 0x8]
	b _0805A8FC
_0805A8D6:
	ldr r0, _0805A904
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A908
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FE08
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805A8FC:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A904: .4byte gPlayerAvatar
_0805A908: .4byte gSprites
	thumb_func_end Fishing6

	thumb_func_start Fishing7
Fishing7: @ 805A90C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805A930
	movs r1, 0x4
	movs r2, 0x11
	bl MenuPrint
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A930: .4byte gOtherText_OhABite
	thumb_func_end Fishing7

	thumb_func_start Fishing8
Fishing8: @ 805A934
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0805A968
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	bl sub_805A954
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0805A96C
	movs r0, 0xC
	b _0805A97C
	.align 2, 0
_0805A968: .4byte gUnknown_0830FD02
_0805A96C:
	ldr r0, _0805A988
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805A97E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
_0805A97C:
	strh r0, [r4, 0x8]
_0805A97E:
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A988: .4byte gMain
	thumb_func_end Fishing8

	thumb_func_start Fishing9
Fishing9: @ 805A98C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _0805A9F0
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805A9E2
	cmp r1, 0x1
	bgt _0805A9E6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	movs r3, 0x20
	ldrsh r2, [r4, r3]
	lsls r2, 1
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	lsls r1, 2
	adds r2, r1
	mov r3, sp
	adds r1, r3, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805A9E6
_0805A9E2:
	movs r0, 0x3
	strh r0, [r4, 0x8]
_0805A9E6:
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A9F0: .4byte gUnknown_0830FD08
	thumb_func_end Fishing9

	thumb_func_start Fishing10
Fishing10: @ 805A9F4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805AA18
	bl sub_8072044
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805AA18: .4byte gOtherText_PokeOnHook
	thumb_func_end Fishing10

	thumb_func_start Fishing11
Fishing11: @ 805AA1C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805AAC0
	bl sub_805A954
	movs r0, 0xA
	ldrsh r6, [r5, r0]
	cmp r6, 0
	bne _0805AAC0
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805AAB8
	ldr r7, _0805AAAC
	ldrb r0, [r7, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r1, _0805AAB0
	mov r8, r1
	add r4, r8
	ldrh r1, [r5, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r7]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805AA86
	ldrb r0, [r7, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805AA86:
	ldr r2, _0805AAB4
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x24]
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x26]
	bl MenuZeroFillScreen
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _0805AAE8
	.align 2, 0
_0805AAAC: .4byte gPlayerAvatar
_0805AAB0: .4byte gMapObjects
_0805AAB4: .4byte gSprites
_0805AAB8:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0805AAE8
_0805AAC0:
	ldr r1, _0805AAF4
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl FishingWildEncounter
	movs r0, 0x1
	bl sub_80BE97C
	ldr r0, _0805AAF8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805AAE8:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805AAF4: .4byte gPlayerAvatar
_0805AAF8: .4byte Task_Fishing
	thumb_func_end Fishing11

	thumb_func_start Fishing12
Fishing12: @ 805AAFC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805AB3C
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805AB40
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805AB44
	bl sub_8072044
	movs r0, 0xD
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805AB3C: .4byte gPlayerAvatar
_0805AB40: .4byte gSprites
_0805AB44: .4byte gOtherText_NotEvenANibble
	thumb_func_end Fishing12

	thumb_func_start Fishing13
Fishing13: @ 805AB48
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805AB8C
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805AB90
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805AB94
	bl sub_8072044
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805AB8C: .4byte gPlayerAvatar
_0805AB90: .4byte gSprites
_0805AB94: .4byte gOtherText_ItGotAway
	thumb_func_end Fishing13

	thumb_func_start Fishing14
Fishing14: @ 805AB98
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	bl MenuDisplayMessageBox
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end Fishing14

	thumb_func_start Fishing15
Fishing15: @ 805ABB4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	bl sub_805A954
	ldr r7, _0805AC48
	ldr r5, _0805AC4C
	ldrb r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3F
	ldrb r0, [r1]
	lsls r0, 27
	cmp r0, 0
	bge _0805AC3A
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805AC50
	mov r8, r0
	add r4, r8
	ldrh r1, [r6, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805AC1A
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805AC1A:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805AC3A:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805AC48: .4byte gSprites
_0805AC4C: .4byte gPlayerAvatar
_0805AC50: .4byte gMapObjects
	thumb_func_end Fishing15

	thumb_func_start Fishing16
Fishing16: @ 805AC54
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _0805AC86
	ldr r1, _0805AC8C
	movs r0, 0
	strb r0, [r1, 0x6]
	bl ScriptContext2_Disable
	bl sub_806451C
	bl MenuZeroFillScreen
	movs r0, 0
	bl sub_80BE97C
	ldr r0, _0805AC90
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805AC86:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0805AC8C: .4byte gPlayerAvatar
_0805AC90: .4byte Task_Fishing
	thumb_func_end Fishing16

	thumb_func_start sub_805A954
sub_805A954: @ 805AC94
	push {r4-r7,lr}
	ldr r0, _0805AD80
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805AD84
	adds r4, r0, r1
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r5, [r0]
	movs r0, 0x2A
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r5, 2
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r7, 0x1
	negs r7, r7
	cmp r0, r7
	beq _0805AD06
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, r12
	ldrb r0, [r1]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0805AD0C
_0805AD06:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805AD0C:
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrb r5, [r0]
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0805AD3E
	movs r0, 0x8
	strh r0, [r4, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805AD3E
	ldr r0, _0805AD88
	strh r0, [r4, 0x24]
_0805AD3E:
	cmp r5, 0x5
	bne _0805AD46
	ldr r0, _0805AD88
	strh r0, [r4, 0x26]
_0805AD46:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805AD56
	movs r0, 0x8
	strh r0, [r4, 0x26]
_0805AD56:
	ldr r3, _0805AD80
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805AD7A
	ldr r2, _0805AD8C
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1A]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0x1
	bl sub_8127F28
_0805AD7A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD80: .4byte gPlayerAvatar
_0805AD84: .4byte gSprites
_0805AD88: .4byte 0x0000fff8
_0805AD8C: .4byte gMapObjects
	thumb_func_end sub_805A954

	.align 2, 0 @ Don't pad with nop.
