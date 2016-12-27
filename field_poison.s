	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CheckMonIsValid
CheckMonIsValid: @ 80C58B4
	push {lr}
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _080C58CC
	movs r0, 0xCE
	lsls r0, 1
	cmp r1, r0
	bne _080C58D0
_080C58CC:
	movs r0, 0
	b _080C58D2
_080C58D0:
	movs r0, 0x1
_080C58D2:
	pop {r1}
	bx r1
	thumb_func_end CheckMonIsValid

	thumb_func_start AllMonsFainted
AllMonsFainted: @ 80C58D8
	push {r4,r5,lr}
	ldr r4, _080C58F8 @ =gPlayerParty
	movs r5, 0
_080C58DE:
	adds r0, r4, 0
	bl CheckMonIsValid
	cmp r0, 0
	beq _080C58FC
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	beq _080C58FC
	movs r0, 0
	b _080C5906
	.align 2, 0
_080C58F8: .4byte gPlayerParty
_080C58FC:
	adds r5, 0x1
	adds r4, 0x64
	cmp r5, 0x5
	ble _080C58DE
	movs r0, 0x1
_080C5906:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end AllMonsFainted

	thumb_func_start MonFaintFromPoisonOnField
MonFaintFromPoisonOnField: @ 80C590C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	adds r4, r0, 0
	muls r4, r1
	ldr r0, _080C5950 @ =gPlayerParty
	adds r4, r0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r1, 0x7
	bl AdjustFriendship
	adds r0, r4, 0
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	ldr r5, _080C5954 @ =gStringVar1
	adds r0, r4, 0
	movs r1, 0x2
	adds r2, r5, 0
	bl GetMonData
	adds r0, r5, 0
	bl StringGetEnd10
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5950: .4byte gPlayerParty
_080C5954: .4byte gStringVar1
	thumb_func_end MonFaintFromPoisonOnField

	thumb_func_start CheckMonFaintedFromPoison
CheckMonFaintedFromPoison: @ 80C5958
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _080C5994 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	bl CheckMonIsValid
	cmp r0, 0
	beq _080C5998
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	cmp r0, 0
	bne _080C5998
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C5998
	movs r0, 0x1
	b _080C599A
	.align 2, 0
_080C5994: .4byte gPlayerParty
_080C5998:
	movs r0, 0
_080C599A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end CheckMonFaintedFromPoison

	thumb_func_start Task_WhiteOut
Task_WhiteOut: @ 80C59A0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C59C4 @ =0x03004b38
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C59FA
	cmp r0, 0x1
	bgt _080C59C8
	cmp r0, 0
	beq _080C59CE
	b _080C5A4A
	.align 2, 0
_080C59C4: .4byte 0x03004b38
_080C59C8:
	cmp r0, 0x2
	beq _080C5A0C
	b _080C5A4A
_080C59CE:
	ldrh r1, [r4, 0x2]
	movs r2, 0x2
	ldrsh r0, [r4, r2]
	cmp r0, 0x5
	bgt _080C59F4
_080C59D8:
	lsls r0, r1, 24
	lsrs r0, 24
	bl CheckMonFaintedFromPoison
	cmp r0, 0
	bne _080C5A24
	ldrh r0, [r4, 0x2]
	adds r0, 0x1
	strh r0, [r4, 0x2]
	adds r1, r0, 0
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080C59D8
_080C59F4:
	movs r0, 0x2
	strh r0, [r4]
	b _080C5A4A
_080C59FA:
	bl IsFieldMessageBoxHidden
	lsls r0, 24
	cmp r0, 0
	beq _080C5A4A
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	b _080C5A4A
_080C5A0C:
	bl AllMonsFainted
	adds r1, r0, 0
	cmp r1, 0
	beq _080C5A3C
	ldr r1, _080C5A20 @ =gScriptResult
	movs r0, 0x1
	strh r0, [r1]
	b _080C5A40
	.align 2, 0
_080C5A20: .4byte gScriptResult
_080C5A24:
	ldrb r0, [r4, 0x2]
	bl MonFaintFromPoisonOnField
	ldr r0, _080C5A38 @ =fieldPoisonText_PokemonFainted
	bl ShowFieldMessage
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _080C5A4A
	.align 2, 0
_080C5A38: .4byte fieldPoisonText_PokemonFainted
_080C5A3C:
	ldr r0, _080C5A50 @ =gScriptResult
	strh r1, [r0]
_080C5A40:
	bl EnableBothScriptContexts
	adds r0, r5, 0
	bl DestroyTask
_080C5A4A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5A50: .4byte gScriptResult
	thumb_func_end Task_WhiteOut

	thumb_func_start DoWhiteOut
DoWhiteOut: @ 80C5A54
	push {lr}
	ldr r0, _080C5A68 @ =Task_WhiteOut
	movs r1, 0x50
	bl CreateTask
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080C5A68: .4byte Task_WhiteOut
	thumb_func_end DoWhiteOut

	thumb_func_start overworld_poison
overworld_poison: @ 80C5A6C
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _080C5AD8 @ =gPlayerParty
	movs r7, 0
	movs r6, 0
	movs r5, 0x5
_080C5A78:
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _080C5ABC
	adds r0, r4, 0
	movs r1, 0x37
	bl GetMonData
	bl pokemon_ailments_get_primary
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080C5ABC
	adds r0, r4, 0
	movs r1, 0x39
	bl GetMonData
	str r0, [sp]
	cmp r0, 0
	beq _080C5AAE
	subs r0, 0x1
	str r0, [sp]
	cmp r0, 0
	bne _080C5AB0
_080C5AAE:
	adds r6, 0x1
_080C5AB0:
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r7, 0x1
_080C5ABC:
	adds r4, 0x64
	subs r5, 0x1
	cmp r5, 0
	bge _080C5A78
	cmp r6, 0
	bne _080C5ACC
	cmp r7, 0
	beq _080C5AD0
_080C5ACC:
	bl DoFieldPoisonEffect
_080C5AD0:
	cmp r6, 0
	beq _080C5ADC
	movs r0, 0x2
	b _080C5AE6
	.align 2, 0
_080C5AD8: .4byte gPlayerParty
_080C5ADC:
	cmp r7, 0
	bne _080C5AE4
	movs r0, 0
	b _080C5AE6
_080C5AE4:
	movs r0, 0x1
_080C5AE6:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end overworld_poison

	.align 2, 0 @ Don't pad with nop.
