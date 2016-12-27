	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start SetUpFieldMove_Strength
SetUpFieldMove_Strength: @ 811AD90
	push {lr}
	bl sub_81474C8
	lsls r0, 24
	cmp r0, 0
	beq _0811ADC8
	ldr r1, _0811ADB0 @ =gScriptResult
	ldr r0, _0811ADB4 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _0811ADB8 @ =gUnknown_0300485C
	ldr r0, _0811ADBC @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0811ADC0 @ =gUnknown_03005CE4
	ldr r0, _0811ADC4 @ =sub_811AA38
	b _0811ADEC
	.align 2, 0
_0811ADB0: .4byte gScriptResult
_0811ADB4: .4byte gUnknown_03005CE0
_0811ADB8: .4byte gUnknown_0300485C
_0811ADBC: .4byte sub_808AB90
_0811ADC0: .4byte gUnknown_03005CE4
_0811ADC4: .4byte sub_811AA38
_0811ADC8:
	movs r0, 0x57
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0811ADDA
	movs r0, 0
	b _0811ADF0
_0811ADDA:
	ldr r1, _0811ADF4 @ =gScriptResult
	ldr r0, _0811ADF8 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	strh r0, [r1]
	ldr r1, _0811ADFC @ =gUnknown_0300485C
	ldr r0, _0811AE00 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0811AE04 @ =gUnknown_03005CE4
	ldr r0, _0811AE08 @ =sub_811AA18
_0811ADEC:
	str r0, [r1]
	movs r0, 0x1
_0811ADF0:
	pop {r1}
	bx r1
	.align 2, 0
_0811ADF4: .4byte gScriptResult
_0811ADF8: .4byte gUnknown_03005CE0
_0811ADFC: .4byte gUnknown_0300485C
_0811AE00: .4byte sub_808AB90
_0811AE04: .4byte gUnknown_03005CE4
_0811AE08: .4byte sub_811AA18
	thumb_func_end SetUpFieldMove_Strength

	thumb_func_start sub_811AA18
sub_811AA18: @ 811AE0C
	push {lr}
	ldr r1, _0811AE20 @ =gUnknown_0202FF84
	ldr r0, _0811AE24 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _0811AE28 @ =UseStrengthScript
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0811AE20: .4byte gUnknown_0202FF84
_0811AE24: .4byte gUnknown_03005CE0
_0811AE28: .4byte UseStrengthScript
	thumb_func_end sub_811AA18

	thumb_func_start sub_811AA38
sub_811AA38: @ 811AE2C
	push {lr}
	ldr r0, _0811AE40 @ =gUnknown_0202FF84
	ldr r1, _0811AE44 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	movs r0, 0x28
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_0811AE40: .4byte gUnknown_0202FF84
_0811AE44: .4byte gUnknown_03005CE0
	thumb_func_end sub_811AA38

	thumb_func_start FldEff_UseStrength
FldEff_UseStrength: @ 811AE48
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0811AE7C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0811AE80 @ =sub_811AA9C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _0811AE84 @ =gUnknown_0202FF84
	ldr r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0811AE88 @ =gPlayerParty
	adds r0, r1
	ldr r1, _0811AE8C @ =gStringVar1
	bl GetMonNickname
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0811AE7C: .4byte gTasks
_0811AE80: .4byte sub_811AA9C
_0811AE84: .4byte gUnknown_0202FF84
_0811AE88: .4byte gPlayerParty
_0811AE8C: .4byte gStringVar1
	thumb_func_end FldEff_UseStrength

	thumb_func_start sub_811AA9C
sub_811AA9C: @ 811AE90
	push {lr}
	bl sub_81474C8
	lsls r0, 24
	cmp r0, 0
	beq _0811AEA2
	bl sub_8147514
	b _0811AEAC
_0811AEA2:
	movs r0, 0x28
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
_0811AEAC:
	pop {r0}
	bx r0
	thumb_func_end sub_811AA9C

	.align 2, 0 @ Don't pad with nop.
