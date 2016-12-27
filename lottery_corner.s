	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8145A78
sub_8145A78: @ 8145E30
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	lsls r0, 16
	orrs r0, r4
	bl sub_8145D14
	ldr r0, _08145E58 @ =0x00004045
	movs r1, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08145E58: .4byte 0x00004045
	thumb_func_end sub_8145A78

	thumb_func_start sub_8145AA4
sub_8145AA4: @ 8145E5C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl Random
	lsls r0, 16
	lsrs r1, r0, 16
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08145E98 @ =0x0000ffff
	cmp r4, r0
	beq _08145E8C
	ldr r5, _08145E9C @ =0x41c64e6d
	ldr r3, _08145EA0 @ =0x00003039
	adds r2, r0, 0
_08145E7C:
	adds r0, r1, 0
	muls r0, r5
	adds r1, r0, r3
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, r2
	bne _08145E7C
_08145E8C:
	adds r0, r1, 0
	bl sub_8145D14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08145E98: .4byte 0x0000ffff
_08145E9C: .4byte 0x41c64e6d
_08145EA0: .4byte 0x00003039
	thumb_func_end sub_8145AA4

	thumb_func_start sub_8145AEC
sub_8145AEC: @ 8145EA4
	push {lr}
	bl sub_8145D3C
	ldr r1, _08145EB4 @ =gScriptResult
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08145EB4: .4byte gScriptResult
	thumb_func_end sub_8145AEC

	thumb_func_start PickLotteryCornerTicket
PickLotteryCornerTicket: @ 8145EB8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r1, _08145FDC @ =gSpecialVar_0x8004
	movs r0, 0
	strh r0, [r1]
	movs r0, 0
	mov r10, r0
	mov r9, r0
	movs r6, 0
_08145ED0:
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08145FE0 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _08145F2C
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08145F22
	adds r0, r4, 0
	movs r1, 0x1
	bl GetMonData
	adds r1, r0, 0
	ldr r0, _08145FE4 @ =gScriptResult
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	bl GetMatchingDigits
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08145FDC @ =gSpecialVar_0x8004
	ldrh r2, [r1]
	cmp r0, r2
	bls _08145F22
	cmp r0, 0x1
	bls _08145F22
	subs r0, 0x1
	strh r0, [r1]
	movs r0, 0xE
	mov r9, r0
	mov r10, r6
_08145F22:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _08145ED0
_08145F2C:
	movs r6, 0
_08145F2E:
	movs r5, 0
	adds r1, r6, 0x1
	mov r8, r1
	lsls r0, r6, 2
	adds r7, r0, r6
_08145F38:
	lsls r2, r7, 4
	subs r2, r7
	lsls r2, 5
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 4
	ldr r1, _08145FE8 @ =gUnknown_020300A4
	adds r0, r1
	adds r4, r2, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetBoxMonData
	cmp r0, 0
	beq _08145F90
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetBoxMonData
	cmp r0, 0
	bne _08145F90
	adds r0, r4, 0
	movs r1, 0x1
	bl GetBoxMonData
	adds r1, r0, 0
	ldr r0, _08145FE4 @ =gScriptResult
	ldrh r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	bl GetMatchingDigits
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08145FDC @ =gSpecialVar_0x8004
	ldrh r2, [r1]
	cmp r0, r2
	bls _08145F90
	cmp r0, 0x1
	bls _08145F90
	subs r0, 0x1
	strh r0, [r1]
	mov r9, r6
	mov r10, r5
_08145F90:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x1D
	bls _08145F38
	mov r1, r8
	lsls r0, r1, 16
	lsrs r6, r0, 16
	cmp r6, 0xD
	bls _08145F2E
	ldr r3, _08145FDC @ =gSpecialVar_0x8004
	ldrh r0, [r3]
	cmp r0, 0
	beq _0814602A
	ldr r2, _08145FEC @ =gSpecialVar_0x8005
	ldr r1, _08145FF0 @ =gUnknown_0840CB04
	subs r0, 0x1
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	mov r2, r9
	cmp r2, 0xE
	bne _08145FFC
	ldr r1, _08145FF4 @ =gSpecialVar_0x8006
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x64
	mov r1, r10
	muls r1, r0
	adds r0, r1, 0
	ldr r1, _08145FE0 @ =gPlayerParty
	adds r0, r1
	ldr r2, _08145FF8 @ =gStringVar1
	movs r1, 0x2
	bl GetMonData
	b _08146024
	.align 2, 0
_08145FDC: .4byte gSpecialVar_0x8004
_08145FE0: .4byte gPlayerParty
_08145FE4: .4byte gScriptResult
_08145FE8: .4byte gUnknown_020300A4
_08145FEC: .4byte gSpecialVar_0x8005
_08145FF0: .4byte gUnknown_0840CB04
_08145FF4: .4byte gSpecialVar_0x8006
_08145FF8: .4byte gStringVar1
_08145FFC:
	ldr r1, _08146038 @ =gSpecialVar_0x8006
	movs r0, 0x1
	strh r0, [r1]
	mov r2, r9
	lsls r1, r2, 2
	add r1, r9
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 5
	mov r2, r10
	lsls r1, r2, 2
	add r1, r10
	lsls r1, 4
	ldr r2, _0814603C @ =gUnknown_020300A4
	adds r1, r2
	adds r0, r1
	ldr r2, _08146040 @ =gStringVar1
	movs r1, 0x2
	bl GetBoxMonData
_08146024:
	ldr r0, _08146040 @ =gStringVar1
	bl StringGetEnd10
_0814602A:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08146038: .4byte gSpecialVar_0x8006
_0814603C: .4byte gUnknown_020300A4
_08146040: .4byte gStringVar1
	thumb_func_end PickLotteryCornerTicket

	thumb_func_start GetMatchingDigits
GetMatchingDigits: @ 8146044
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	movs r0, 0
	mov r8, r0
	movs r7, 0
	ldr r1, _081460C4 @ =0x02039328
	mov r10, r1
	ldr r0, _081460C8 @ =0x0203932a
	mov r9, r0
_08146064:
	adds r0, r6, 0
	movs r1, 0xA
	bl __umodsi3
	adds r4, r0, 0
	mov r1, r10
	strh r4, [r1]
	adds r0, r5, 0
	movs r1, 0xA
	bl __umodsi3
	mov r1, r9
	strh r0, [r1]
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	bne _081460B2
	adds r0, r6, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r5, 0
	movs r1, 0xA
	bl __udivsi3
	lsls r0, 16
	lsrs r5, r0, 16
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x4
	bls _08146064
_081460B2:
	mov r0, r8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081460C4: .4byte 0x02039328
_081460C8: .4byte 0x0203932a
	thumb_func_end GetMatchingDigits

	thumb_func_start sub_8145D14
sub_8145D14: @ 81460CC
	push {r4,lr}
	adds r1, r0, 0
	lsrs r4, r1, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _081460EC @ =0x0000404b
	bl VarSet
	ldr r0, _081460F0 @ =0x0000404c
	adds r1, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081460EC: .4byte 0x0000404b
_081460F0: .4byte 0x0000404c
	thumb_func_end sub_8145D14

	thumb_func_start sub_8145D3C
sub_8145D3C: @ 81460F4
	push {r4,lr}
	ldr r0, _08146114 @ =0x0000404b
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08146118 @ =0x0000404c
	bl VarGet
	lsls r0, 16
	orrs r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08146114: .4byte 0x0000404b
_08146118: .4byte 0x0000404c
	thumb_func_end sub_8145D3C

	thumb_func_start unref_sub_8145D64
unref_sub_8145D64: @ 814611C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl sub_8145D14
	pop {r0}
	bx r0
	thumb_func_end unref_sub_8145D64

	.align 2, 0 @ Don't pad with nop.
