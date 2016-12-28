	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ScrCmd_snop
ScrCmd_snop: @ 806586C
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_snop

	thumb_func_start ScrCmd_snop1
ScrCmd_snop1: @ 8065870
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_snop1

	thumb_func_start ScrCmd_end
ScrCmd_end: @ 8065874
	push {lr}
	bl StopScript
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_end

	thumb_func_start ScrCmd_jumpasm
ScrCmd_jumpasm: @ 8065880
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_jumpasm

	thumb_func_start ScrCmd_special
ScrCmd_special: @ 8065898
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	ldr r1, _080658B4 @ =gSpecials
	lsrs r0, 14
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080658B4: .4byte gSpecials
	thumb_func_end ScrCmd_special

	thumb_func_start ScrCmd_specialval
ScrCmd_specialval: @ 80658B8
	push {r4-r6,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r6, r0, 0
	ldr r4, _080658E8 @ =gSpecials
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 14
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	strh r0, [r6]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080658E8: .4byte gSpecials
	thumb_func_end ScrCmd_specialval

	thumb_func_start ScrCmd_callasm
ScrCmd_callasm: @ 80658EC
	push {lr}
	bl ScriptReadWord
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_callasm

	thumb_func_start ScrCmd_waitstate
ScrCmd_waitstate: @ 80658FC
	push {lr}
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_waitstate

	thumb_func_start ScrCmd_jump
ScrCmd_jump: @ 8065908
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	adds r0, r4, 0
	bl ScriptJump
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_jump

	thumb_func_start ScrCmd_return
ScrCmd_return: @ 8065920
	push {lr}
	bl ScriptReturn
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_return

	thumb_func_start ScrCmd_call
ScrCmd_call: @ 806592C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	adds r0, r4, 0
	bl ScriptCall
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_call

	thumb_func_start ScrCmd_jumpif
ScrCmd_jumpif: @ 8065944
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r1, _0806597C @ =gScriptConditionTable
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065972
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptJump
_08065972:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806597C: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_jumpif

	thumb_func_start ScrCmd_callif
ScrCmd_callif: @ 8065980
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r1, _080659B8 @ =gScriptConditionTable
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080659AE
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptCall
_080659AE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080659B8: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_callif

	thumb_func_start ScrCmd_setvaddress
ScrCmd_setvaddress: @ 80659BC
	push {r4,lr}
	ldr r4, [r0, 0x8]
	subs r4, 0x1
	bl ScriptReadWord
	ldr r1, _080659D4 @ =gUnknown_0202E8B0
	subs r0, r4
	str r0, [r1]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080659D4: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_setvaddress

	thumb_func_start ScrCmd_vjump
ScrCmd_vjump: @ 80659D8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _080659F8 @ =gUnknown_0202E8B0
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl ScriptJump
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080659F8: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_vjump

	thumb_func_start ScrCmd_vcall
ScrCmd_vcall: @ 80659FC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _08065A1C @ =gUnknown_0202E8B0
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl ScriptCall
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065A1C: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_vcall

	thumb_func_start ScrCmd_if5
ScrCmd_if5: @ 8065A20
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	ldr r1, _08065A5C @ =gUnknown_0202E8B0
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065A60 @ =gScriptConditionTable
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065A52
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptJump
_08065A52:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065A5C: .4byte gUnknown_0202E8B0
_08065A60: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_if5

	thumb_func_start ScrCmd_if6
ScrCmd_if6: @ 8065A64
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	ldr r1, _08065AA0 @ =gUnknown_0202E8B0
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065AA4 @ =gScriptConditionTable
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065A96
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptCall
_08065A96:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065AA0: .4byte gUnknown_0202E8B0
_08065AA4: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_if6

	thumb_func_start ScrCmd_jumpstd
ScrCmd_jumpstd: @ 8065AA8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065AD0 @ =gStdScripts
	adds r1, r0
	ldr r0, _08065AD4 @ =PetalburgCity_MapScripts
	cmp r1, r0
	bcs _08065AC8
	ldr r1, [r1]
	adds r0, r2, 0
	bl ScriptJump
_08065AC8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065AD0: .4byte gStdScripts
_08065AD4: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_jumpstd

	thumb_func_start ScrCmd_callstd
ScrCmd_callstd: @ 8065AD8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065B00 @ =gStdScripts
	adds r1, r0
	ldr r0, _08065B04 @ =PetalburgCity_MapScripts
	cmp r1, r0
	bcs _08065AF8
	ldr r1, [r1]
	adds r0, r2, 0
	bl ScriptCall
_08065AF8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065B00: .4byte gStdScripts
_08065B04: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_callstd

	thumb_func_start ScrCmd_jumpstdif
ScrCmd_jumpstdif: @ 8065B08
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065B48 @ =gScriptConditionTable
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065B40
	lsls r0, r4, 2
	ldr r1, _08065B4C @ =gStdScripts
	adds r1, r0, r1
	ldr r0, _08065B50 @ =PetalburgCity_MapScripts
	cmp r1, r0
	bcs _08065B40
	ldr r1, [r1]
	adds r0, r3, 0
	bl ScriptJump
_08065B40:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065B48: .4byte gScriptConditionTable
_08065B4C: .4byte gStdScripts
_08065B50: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_jumpstdif

	thumb_func_start ScrCmd_callstdif
ScrCmd_callstdif: @ 8065B54
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065B94 @ =gScriptConditionTable
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065B8C
	lsls r0, r4, 2
	ldr r1, _08065B98 @ =gStdScripts
	adds r1, r0, r1
	ldr r0, _08065B9C @ =PetalburgCity_MapScripts
	cmp r1, r0
	bcs _08065B8C
	ldr r1, [r1]
	adds r0, r3, 0
	bl ScriptCall
_08065B8C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065B94: .4byte gScriptConditionTable
_08065B98: .4byte gStdScripts
_08065B9C: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_callstdif

	thumb_func_start ScrCmd_jumpram
ScrCmd_jumpram: @ 8065BA0
	push {lr}
	ldr r1, _08065BB0 @ =gUnknown_0202E8AC
	ldr r1, [r1]
	bl ScriptJump
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065BB0: .4byte gUnknown_0202E8AC
	thumb_func_end ScrCmd_jumpram

	thumb_func_start ScrCmd_die
ScrCmd_die: @ 8065BB4
	push {r4,lr}
	adds r4, r0, 0
	bl ClearRamScript
	adds r0, r4, 0
	bl StopScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_die

	thumb_func_start ScrCmd_setbyte
ScrCmd_setbyte: @ 8065BCC
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_8126160
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setbyte

	thumb_func_start ScrCmd_loadptr
ScrCmd_loadptr: @ 8065BE4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_loadptr

	thumb_func_start ScrCmd_loadbytefrompointer
ScrCmd_loadbytefrompointer: @ 8065C08
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldrb r0, [r0]
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_loadbytefrompointer

	thumb_func_start ScrCmd_writebytetooffset
ScrCmd_writebytetooffset: @ 8065C2C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadWord
	strb r4, [r0]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_writebytetooffset

	thumb_func_start ScrCmd_setbufferbyte
ScrCmd_setbufferbyte: @ 8065C44
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r2, r0, 0
	adds r2, 0x64
	adds r2, r3
	ldrb r3, [r1]
	str r3, [r2]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_setbufferbyte

	thumb_func_start ScrCmd_setptrbyte
ScrCmd_setptrbyte: @ 8065C60
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldr r1, [r4]
	strb r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setptrbyte

	thumb_func_start ScrCmd_copybuffers
ScrCmd_copybuffers: @ 8065C84
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r0, 0x64
	adds r3, r0, r3
	lsls r2, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_copybuffers

	thumb_func_start ScrCmd_copybyte
ScrCmd_copybyte: @ 8065CA4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r5, r0, 0
	adds r0, r4, 0
	bl ScriptReadWord
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_copybyte

	thumb_func_start ScrCmd_setvar
ScrCmd_setvar: @ 8065CC0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	adds r0, r5, 0
	bl ScriptReadHalfword
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setvar

	thumb_func_start ScrCmd_copyvar
ScrCmd_copyvar: @ 8065CE4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_copyvar

	thumb_func_start ScrCmd_setorcopyvar
ScrCmd_setorcopyvar: @ 8065D10
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setorcopyvar

	thumb_func_start compare_012
compare_012: @ 8065D3C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r0, r1
	bcs _08065D4E
	movs r0, 0
	b _08065D58
_08065D4E:
	cmp r0, r1
	beq _08065D56
	movs r0, 0x2
	b _08065D58
_08065D56:
	movs r0, 0x1
_08065D58:
	pop {r1}
	bx r1
	thumb_func_end compare_012

	thumb_func_start ScrCmd_comparebuffers
ScrCmd_comparebuffers: @ 8065D5C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, r4, 0
	adds r3, 0x64
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r3, r1
	ldrb r1, [r3]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_comparebuffers

	thumb_func_start ScrCmd_comparebuffertobyte
ScrCmd_comparebuffertobyte: @ 8065D8C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_comparebuffertobyte

	thumb_func_start ScrCmd_comparebuffertoptrbyte
ScrCmd_comparebuffertoptrbyte: @ 8065DB4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r5, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	ldrb r1, [r0]
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_comparebuffertoptrbyte

	thumb_func_start ScrCmd_compareptrbytetobuffer
ScrCmd_compareptrbytetobuffer: @ 8065DE0
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	ldrb r0, [r0]
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	lsls r2, 2
	adds r1, r4, 0
	adds r1, 0x64
	adds r1, r2
	ldrb r1, [r1]
	adds r3, 0x1
	str r3, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compareptrbytetobuffer

	thumb_func_start ScrCmd_compareptrbytetobyte
ScrCmd_compareptrbytetobyte: @ 8065E0C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	ldrb r0, [r0]
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compareptrbytetobyte

	thumb_func_start ScrCmd_compareptrbytes
ScrCmd_compareptrbytes: @ 8065E2C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	ldrb r5, [r0]
	adds r0, r4, 0
	bl ScriptReadWord
	ldrb r1, [r0]
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compareptrbytes

	thumb_func_start ScrCmd_compare
ScrCmd_compare: @ 8065E50
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r5, [r0]
	adds r0, r4, 0
	bl ScriptReadHalfword
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compare

	thumb_func_start ScrCmd_comparevars
ScrCmd_comparevars: @ 8065E80
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r2, [r5]
	ldrh r1, [r0]
	adds r0, r2, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_comparevars

	thumb_func_start ScrCmd_addvar
ScrCmd_addvar: @ 8065EB4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	adds r0, r5, 0
	bl ScriptReadHalfword
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_addvar

	thumb_func_start ScrCmd_subvar
ScrCmd_subvar: @ 8065EDC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldrh r1, [r5]
	subs r1, r0
	strh r1, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_subvar

	thumb_func_start ScrCmd_random
ScrCmd_random: @ 8065F0C
	push {r4,r5,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r5, _08065F3C @ =gScriptResult
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __umodsi3
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065F3C: .4byte gScriptResult
	thumb_func_end ScrCmd_random

	thumb_func_start ScrCmd_additem
ScrCmd_additem: @ 8065F40
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08065F80 @ =gScriptResult
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065F80: .4byte gScriptResult
	thumb_func_end ScrCmd_additem

	thumb_func_start ScrCmd_removeitem
ScrCmd_removeitem: @ 8065F84
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08065FC4 @ =gScriptResult
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RemoveBagItem
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065FC4: .4byte gScriptResult
	thumb_func_end ScrCmd_removeitem

	thumb_func_start ScrCmd_checkitemspace
ScrCmd_checkitemspace: @ 8065FC8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08066008 @ =gScriptResult
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl CheckBagHasSpace
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066008: .4byte gScriptResult
	thumb_func_end ScrCmd_checkitemspace

	thumb_func_start ScrCmd_checkitem
ScrCmd_checkitem: @ 806600C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _0806604C @ =gScriptResult
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl CheckBagHasItem
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806604C: .4byte gScriptResult
	thumb_func_end ScrCmd_checkitem

	thumb_func_start ScrCmd_checkitemtype
ScrCmd_checkitemtype: @ 8066050
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08066078 @ =gScriptResult
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066078: .4byte gScriptResult
	thumb_func_end ScrCmd_checkitemtype

	thumb_func_start ScrCmd_addpcitem
ScrCmd_addpcitem: @ 806607C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _080660BC @ =gScriptResult
	adds r0, r4, 0
	bl AddPCItem
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080660BC: .4byte gScriptResult
	thumb_func_end ScrCmd_addpcitem

	thumb_func_start ScrCmd_checkpcitem
ScrCmd_checkpcitem: @ 80660C0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _08066100 @ =gScriptResult
	adds r0, r4, 0
	bl CheckPCHasItem
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066100: .4byte gScriptResult
	thumb_func_end ScrCmd_checkpcitem

	thumb_func_start ScrCmd_adddecor
ScrCmd_adddecor: @ 8066104
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _0806612C @ =gScriptResult
	lsls r0, 24
	lsrs r0, 24
	bl IsThereStorageSpaceForDecoration
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806612C: .4byte gScriptResult
	thumb_func_end ScrCmd_adddecor

	thumb_func_start ScrCmd_removedecor
ScrCmd_removedecor: @ 8066130
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08066158 @ =gScriptResult
	lsls r0, 24
	lsrs r0, 24
	bl sub_81340A8
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066158: .4byte gScriptResult
	thumb_func_end ScrCmd_removedecor

	thumb_func_start ScrCmd_checkdecor
ScrCmd_checkdecor: @ 806615C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08066184 @ =gScriptResult
	lsls r0, 24
	lsrs r0, 24
	bl sub_8134074
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066184: .4byte gScriptResult
	thumb_func_end ScrCmd_checkdecor

	thumb_func_start ScrCmd_testdecor
ScrCmd_testdecor: @ 8066188
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _080661B0 @ =gScriptResult
	lsls r0, 24
	lsrs r0, 24
	bl sub_8133FE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080661B0: .4byte gScriptResult
	thumb_func_end ScrCmd_testdecor

	thumb_func_start ScrCmd_setflag
ScrCmd_setflag: @ 80661B4
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setflag

	thumb_func_start ScrCmd_clearflag
ScrCmd_clearflag: @ 80661C8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagReset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_clearflag

	thumb_func_start ScrCmd_checkflag
ScrCmd_checkflag: @ 80661DC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checkflag

	thumb_func_start ScrCmd_inccounter
ScrCmd_inccounter: @ 80661F8
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sav12_xor_increment
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_inccounter

	thumb_func_start ScrCmd_lighten
ScrCmd_lighten: @ 8066210
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_8081594
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_lighten

	thumb_func_start ScrCmd_darken
ScrCmd_darken: @ 806622C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053CE4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_darken

	thumb_func_start sub_8066248
sub_8066248: @ 8066248
	push {lr}
	ldr r0, _0806625C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08066260
	movs r0, 0
	b _08066262
	.align 2, 0
_0806625C: .4byte gPaletteFade
_08066260:
	movs r0, 0x1
_08066262:
	pop {r1}
	bx r1
	thumb_func_end sub_8066248

	thumb_func_start ScrCmd_fadescreen
ScrCmd_fadescreen: @ 8066268
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	movs r1, 0
	bl fade_screen
	ldr r1, _0806628C @ =sub_8066248
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806628C: .4byte sub_8066248
	thumb_func_end ScrCmd_fadescreen

	thumb_func_start ScrCmd_fadescreendelay
ScrCmd_fadescreendelay: @ 8066290
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl fade_screen
	ldr r1, _080662B8 @ =sub_8066248
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080662B8: .4byte sub_8066248
	thumb_func_end ScrCmd_fadescreendelay

	thumb_func_start s28_pause_asm
s28_pause_asm: @ 80662BC
	push {lr}
	ldr r1, _080662D0 @ =gUnknown_0202E8B4
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080662D4
	movs r0, 0
	b _080662D6
	.align 2, 0
_080662D0: .4byte gUnknown_0202E8B4
_080662D4:
	movs r0, 0x1
_080662D6:
	pop {r1}
	bx r1
	thumb_func_end s28_pause_asm

	thumb_func_start ScrCmd_pause
ScrCmd_pause: @ 80662DC
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	ldr r1, _080662F8 @ =gUnknown_0202E8B4
	strh r0, [r1]
	ldr r1, _080662FC @ =s28_pause_asm
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080662F8: .4byte gUnknown_0202E8B4
_080662FC: .4byte s28_pause_asm
	thumb_func_end ScrCmd_pause

	thumb_func_start ScrCmd_compareflags
ScrCmd_compareflags: @ 8066300
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RtcInitLocalTimeOffset
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_compareflags

	thumb_func_start ScrCmd_checkdailyflags
ScrCmd_checkdailyflags: @ 8066338
	push {lr}
	bl DoTimeBasedEvents
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checkdailyflags

	thumb_func_start ScrCmd_resetvars
ScrCmd_resetvars: @ 8066344
	push {lr}
	bl RtcCalcLocalTime
	ldr r2, _0806636C @ =gSpecialVar_0x8000
	ldr r1, _08066370 @ =gLocalTime
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _08066374 @ =gSpecialVar_0x8001
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _08066378 @ =gSpecialVar_0x8002
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806636C: .4byte gSpecialVar_0x8000
_08066370: .4byte gLocalTime
_08066374: .4byte gSpecialVar_0x8001
_08066378: .4byte gSpecialVar_0x8002
	thumb_func_end ScrCmd_resetvars

	thumb_func_start ScrCmd_setweather
ScrCmd_setweather: @ 806637C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl SetSav1Weather
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setweather

	thumb_func_start ScrCmd_resetweather
ScrCmd_resetweather: @ 8066398
	push {lr}
	bl sub_80806E4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_resetweather

	thumb_func_start ScrCmd_doweather
ScrCmd_doweather: @ 80663A4
	push {lr}
	bl sub_808073C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_doweather

	thumb_func_start ScrCmd_tileeffect
ScrCmd_tileeffect: @ 80663B0
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl activate_per_step_callback
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_tileeffect

	thumb_func_start ScrCmd_setmapfooter
ScrCmd_setmapfooter: @ 80663C8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053D14
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setmapfooter

	thumb_func_start ScrCmd_warp
ScrCmd_warp: @ 80663E4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080E88
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warp

	thumb_func_start ScrCmd_warpmuted
ScrCmd_warpmuted: @ 806646C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sp13E_warp_to_last_warp
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warpmuted

	thumb_func_start ScrCmd_warpwalk
ScrCmd_warpwalk: @ 80664F4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080EF0
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warpwalk

	thumb_func_start ScrCmd_warphole
ScrCmd_warphole: @ 806657C
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, [r0, 0x8]
	ldrb r6, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl PlayerGetDestCoords
	cmp r6, 0xFF
	bne _080665BA
	cmp r5, 0xFF
	bne _080665BA
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8053720
	b _080665DE
_080665BA:
	lsls r0, r6, 24
	asrs r0, 24
	lsls r1, r5, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x4
	ldrb r3, [r3]
	subs r3, 0x7
	lsls r3, 24
	asrs r3, 24
	ldrb r4, [r4]
	subs r4, 0x7
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
_080665DE:
	bl sp13F_fall_to_last_warp
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warphole

	thumb_func_start ScrCmd_warpteleport
ScrCmd_warpteleport: @ 80665F0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080F68
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warpteleport

	thumb_func_start ScrCmd_warp3
ScrCmd_warp3: @ 8066678
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warp3

	thumb_func_start ScrCmd_warpplace
ScrCmd_warpplace: @ 80666F8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl saved_warp2_set_2
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warpplace

	thumb_func_start ScrCmd_warp4
ScrCmd_warp4: @ 806677C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_8053690
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warp4

	thumb_func_start ScrCmd_warp5
ScrCmd_warp5: @ 80667FC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_80536E4
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warp5

	thumb_func_start ScrCmd_warp6
ScrCmd_warp6: @ 806687C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805363C
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warp6

	thumb_func_start ScrCmd_getplayerxy
ScrCmd_getplayerxy: @ 80668FC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldr r2, _08066930 @ =gSaveBlock1
	ldrh r1, [r2]
	strh r1, [r5]
	ldrh r1, [r2, 0x2]
	strh r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066930: .4byte gSaveBlock1
	thumb_func_end ScrCmd_getplayerxy

	thumb_func_start ScrCmd_countpokemon
ScrCmd_countpokemon: @ 8066934
	push {r4,lr}
	ldr r4, _0806694C @ =gScriptResult
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806694C: .4byte gScriptResult
	thumb_func_end ScrCmd_countpokemon

	thumb_func_start ScrCmd_playsfx
ScrCmd_playsfx: @ 8066950
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playsfx

	thumb_func_start s30_music_check_asm
s30_music_check_asm: @ 8066964
	push {lr}
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08066974
	movs r0, 0
	b _08066976
_08066974:
	movs r0, 0x1
_08066976:
	pop {r1}
	bx r1
	thumb_func_end s30_music_check_asm

	thumb_func_start ScrCmd_checksound
ScrCmd_checksound: @ 806697C
	push {lr}
	ldr r1, _0806698C @ =s30_music_check_asm
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806698C: .4byte s30_music_check_asm
	thumb_func_end ScrCmd_checksound

	thumb_func_start ScrCmd_fanfare
ScrCmd_fanfare: @ 8066990
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl PlayFanfare
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fanfare

	thumb_func_start s32_fanfare_wait_asm
s32_fanfare_wait_asm: @ 80669A4
	push {lr}
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end s32_fanfare_wait_asm

	thumb_func_start ScrCmd_waitfanfare
ScrCmd_waitfanfare: @ 80669B4
	push {lr}
	ldr r1, _080669C4 @ =s32_fanfare_wait_asm
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080669C4: .4byte s32_fanfare_wait_asm
	thumb_func_end ScrCmd_waitfanfare

	thumb_func_start ScrCmd_playmusic
ScrCmd_playmusic: @ 80669C8
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r2, r0, 16
	adds r5, r2, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0x1
	bne _080669E8
	adds r0, r2, 0
	bl sav1_set_battle_music_maybe
_080669E8:
	adds r0, r5, 0
	bl PlayNewMapMusic
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playmusic

	thumb_func_start ScrCmd_playmusicbattle
ScrCmd_playmusicbattle: @ 80669F8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl sav1_set_battle_music_maybe
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playmusicbattle

	thumb_func_start ScrCmd_fadedefault
ScrCmd_fadedefault: @ 8066A0C
	push {lr}
	bl sub_8053F84
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fadedefault

	thumb_func_start ScrCmd_fademusic
ScrCmd_fademusic: @ 8066A18
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053FB0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fademusic

	thumb_func_start ScrCmd_fadeout
ScrCmd_fadeout: @ 8066A2C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	beq _08066A46
	lsls r0, r1, 26
	lsrs r0, 24
	bl FadeOutBGMTemporarily
	b _08066A4C
_08066A46:
	movs r0, 0x4
	bl FadeOutBGMTemporarily
_08066A4C:
	ldr r1, _08066A5C @ =IsBGMPausedOrStopped
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066A5C: .4byte IsBGMPausedOrStopped
	thumb_func_end ScrCmd_fadeout

	thumb_func_start ScrCmd_fadein
ScrCmd_fadein: @ 8066A60
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _08066A78
	lsls r0, r2, 26
	lsrs r0, 24
	bl FadeInBGM
	b _08066A7E
_08066A78:
	movs r0, 0x4
	bl FadeInBGM
_08066A7E:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fadein

	thumb_func_start ScrCmd_move
ScrCmd_move: @ 8066A84
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadWord
	adds r3, r0, 0
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r2, _08066ABC @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl exec_movement
	ldr r0, _08066AC0 @ =gUnknown_0202E8B6
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066ABC: .4byte gSaveBlock1
_08066AC0: .4byte gUnknown_0202E8B6
	thumb_func_end ScrCmd_move

	thumb_func_start ScrCmd_movecoords
ScrCmd_movecoords: @ 8066AC4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadWord
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r0, r4, 24
	lsrs r0, 24
	bl exec_movement
	ldr r0, _08066B04 @ =gUnknown_0202E8B6
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066B04: .4byte gUnknown_0202E8B6
	thumb_func_end ScrCmd_movecoords

	thumb_func_start s51a_0806B288
s51a_0806B288: @ 8066B08
	push {lr}
	ldr r0, _08066B24 @ =gUnknown_0202E8B6
	ldrb r0, [r0]
	ldr r1, _08066B28 @ =gUnknown_0202E8BA
	ldrb r1, [r1]
	ldr r2, _08066B2C @ =gUnknown_0202E8B8
	ldrb r2, [r2]
	bl sub_80A212C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08066B24: .4byte gUnknown_0202E8B6
_08066B28: .4byte gUnknown_0202E8BA
_08066B2C: .4byte gUnknown_0202E8B8
	thumb_func_end s51a_0806B288

	thumb_func_start ScrCmd_waitmove
ScrCmd_waitmove: @ 8066B30
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066B4C
	ldr r0, _08066B70 @ =gUnknown_0202E8B6
	strh r1, [r0]
_08066B4C:
	ldr r1, _08066B74 @ =gUnknown_0202E8B8
	ldr r2, _08066B78 @ =gSaveBlock1
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066B7C @ =gUnknown_0202E8BA
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066B80 @ =s51a_0806B288
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066B70: .4byte gUnknown_0202E8B6
_08066B74: .4byte gUnknown_0202E8B8
_08066B78: .4byte gSaveBlock1
_08066B7C: .4byte gUnknown_0202E8BA
_08066B80: .4byte s51a_0806B288
	thumb_func_end ScrCmd_waitmove

	thumb_func_start ScrCmd_waitmovexy
ScrCmd_waitmovexy: @ 8066B84
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066BA0
	ldr r0, _08066BC8 @ =gUnknown_0202E8B6
	strh r1, [r0]
_08066BA0:
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _08066BCC @ =gUnknown_0202E8B8
	strh r2, [r0]
	ldr r0, _08066BD0 @ =gUnknown_0202E8BA
	strh r1, [r0]
	ldr r1, _08066BD4 @ =s51a_0806B288
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066BC8: .4byte gUnknown_0202E8B6
_08066BCC: .4byte gUnknown_0202E8B8
_08066BD0: .4byte gUnknown_0202E8BA
_08066BD4: .4byte s51a_0806B288
	thumb_func_end ScrCmd_waitmovexy

	thumb_func_start ScrCmd_disappear
ScrCmd_disappear: @ 8066BD8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066BFC @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066BFC: .4byte gSaveBlock1
	thumb_func_end ScrCmd_disappear

	thumb_func_start ScrCmd_disappearxy
ScrCmd_disappearxy: @ 8066C00
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_disappearxy

	thumb_func_start ScrCmd_reappear
ScrCmd_reappear: @ 8066C30
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066C54 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl show_sprite
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066C54: .4byte gSaveBlock1
	thumb_func_end ScrCmd_reappear

	thumb_func_start ScrCmd_reappearxy
ScrCmd_reappearxy: @ 8066C58
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl show_sprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_reappearxy

	thumb_func_start ScrCmd_movesprite
ScrCmd_movesprite: @ 8066C88
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _08066CE8 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	lsls r4, 16
	asrs r4, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	adds r3, r4, 0
	bl sub_805C0F8
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08066CE8: .4byte gSaveBlock1
	thumb_func_end ScrCmd_movesprite

	thumb_func_start ScrCmd_movespriteperm
ScrCmd_movespriteperm: @ 8066CEC
	push {r4-r6,lr}
	adds r6, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r2, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl update_saveblock1_field_object_coords
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_movespriteperm

	thumb_func_start ScrCmd_moveoffscreen
ScrCmd_moveoffscreen: @ 8066D44
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066D68 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805C78C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066D68: .4byte gSaveBlock1
	thumb_func_end ScrCmd_moveoffscreen

	thumb_func_start ScrCmd_spritevisible
ScrCmd_spritevisible: @ 8066D6C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_spritevisible

	thumb_func_start ScrCmd_spriteinvisible
ScrCmd_spriteinvisible: @ 8066D9C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_spriteinvisible

	thumb_func_start ScrCmd_spritelevelup
ScrCmd_spritelevelup: @ 8066DCC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r5, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r5, 0x8]
	ldrb r1, [r3]
	adds r4, r3, 0x1
	str r4, [r5, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r5, 0x8]
	lsls r0, 24
	lsrs r0, 24
	adds r3, 0x53
	lsls r3, 24
	lsrs r3, 24
	bl sub_805BCF0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_spritelevelup

	thumb_func_start ScrCmd_restorespritelevel
ScrCmd_restorespritelevel: @ 8066E08
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_805BD48
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_restorespritelevel

	thumb_func_start ScrCmd_faceplayer
ScrCmd_faceplayer: @ 8066E38
	push {r4,lr}
	ldr r2, _08066E68 @ =gMapObjects
	ldr r0, _08066E6C @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _08066E60
	bl player_get_direction_lower_nybble
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectFaceOppositeDirection
_08066E60:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066E68: .4byte gMapObjects
_08066E6C: .4byte gSelectedMapObject
	thumb_func_end ScrCmd_faceplayer

	thumb_func_start ScrCmd_spriteface
ScrCmd_spriteface: @ 8066E70
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, [r4, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066EA0 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl FieldObjectTurnByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066EA0: .4byte gSaveBlock1
	thumb_func_end ScrCmd_spriteface

	thumb_func_start ScrCmd_spritebehave
ScrCmd_spritebehave: @ 8066EA4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl update_saveblock1_field_object_movement_behavior
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_spritebehave

	thumb_func_start ScrCmd_createvsprite
ScrCmd_createvsprite: @ 8066ECC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r4, 16
	asrs r4, 16
	lsls r3, 16
	asrs r3, 16
	str r2, [sp]
	str r1, [sp, 0x4]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805B410
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_createvsprite

	thumb_func_start ScrCmd_vspriteface
ScrCmd_vspriteface: @ 8066F3C
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_8064990
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_vspriteface

	thumb_func_start ScrCmd_lockall
ScrCmd_lockall: @ 8066F58
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	bne _08066F78
	bl sub_8064D20
	ldr r1, _08066F74 @ =sub_8064CFC
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	b _08066F7A
	.align 2, 0
_08066F74: .4byte sub_8064CFC
_08066F78:
	movs r0, 0
_08066F7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_lockall

	thumb_func_start ScrCmd_lock
ScrCmd_lock: @ 8066F80
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	beq _08066F90
	movs r0, 0
	b _08066FCE
_08066F90:
	ldr r2, _08066FB4 @ =gMapObjects
	ldr r0, _08066FB8 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08066FC0
	bl sub_8064DD8
	ldr r1, _08066FBC @ =sub_8064DB4
	adds r0, r4, 0
	bl SetupNativeScript
	b _08066FCC
	.align 2, 0
_08066FB4: .4byte gMapObjects
_08066FB8: .4byte gSelectedMapObject
_08066FBC: .4byte sub_8064DB4
_08066FC0:
	bl sub_8064D20
	ldr r1, _08066FD4 @ =sub_8064CFC
	adds r0, r4, 0
	bl SetupNativeScript
_08066FCC:
	movs r0, 0x1
_08066FCE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066FD4: .4byte sub_8064CFC
	thumb_func_end ScrCmd_lock

	thumb_func_start ScrCmd_releaseall
ScrCmd_releaseall: @ 8066FD8
	push {lr}
	bl HideFieldMessageBox
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806700C @ =gMapObjects
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806700C: .4byte gMapObjects
	thumb_func_end ScrCmd_releaseall

	thumb_func_start ScrCmd_release
ScrCmd_release: @ 8067010
	push {r4,lr}
	bl HideFieldMessageBox
	ldr r4, _08067060 @ =gMapObjects
	ldr r0, _08067064 @ =gSelectedMapObject
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08067032
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_08067032:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067060: .4byte gMapObjects
_08067064: .4byte gSelectedMapObject
	thumb_func_end ScrCmd_release

	thumb_func_start ScrCmd_message
ScrCmd_message: @ 8067068
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	cmp r0, 0
	bne _08067076
	ldr r0, [r4, 0x64]
_08067076:
	bl ShowFieldMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_message

	thumb_func_start ScrCmd_message2
ScrCmd_message2: @ 8067084
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	cmp r0, 0
	bne _08067092
	ldr r0, [r4, 0x64]
_08067092:
	bl ShowFieldAutoScrollMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_message2

	thumb_func_start ScrCmd_waittext
ScrCmd_waittext: @ 80670A0
	push {lr}
	ldr r1, _080670B0 @ =IsFieldMessageBoxHidden
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080670B0: .4byte IsFieldMessageBoxHidden
	thumb_func_end ScrCmd_waittext

	thumb_func_start ScrCmd_closebutton
ScrCmd_closebutton: @ 80670B4
	push {lr}
	bl HideFieldMessageBox
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_closebutton

	thumb_func_start sub_80670C0
sub_80670C0: @ 80670C0
	push {lr}
	ldr r0, _080670DC @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080670E0
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080670E0
	movs r0, 0
	b _080670E2
	.align 2, 0
_080670DC: .4byte gMain
_080670E0:
	movs r0, 0x1
_080670E2:
	pop {r1}
	bx r1
	thumb_func_end sub_80670C0

	thumb_func_start ScrCmd_waitbutton
ScrCmd_waitbutton: @ 80670E8
	push {lr}
	ldr r1, _080670F8 @ =sub_80670C0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080670F8: .4byte sub_80670C0
	thumb_func_end ScrCmd_waitbutton

	thumb_func_start ScrCmd_yesnobox
ScrCmd_yesnobox: @ 80670FC
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl yes_no_box
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806711E
	movs r0, 0
	b _08067124
_0806711E:
	bl ScriptContext1_Stop
	movs r0, 0x1
_08067124:
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_yesnobox

	thumb_func_start ScrCmd_multichoice
ScrCmd_multichoice: @ 8067128
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl sub_80B5054
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08067156
	movs r0, 0
	b _0806715C
_08067156:
	bl ScriptContext1_Stop
	movs r0, 0x1
_0806715C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoice

	thumb_func_start ScrCmd_multichoicedef
ScrCmd_multichoicedef: @ 8067164
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_80B50B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080671A2
	movs r0, 0
	b _080671A8
_080671A2:
	bl ScriptContext1_Stop
	movs r0, 0x1
_080671A8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicedef

	thumb_func_start ScrCmd_showbox
ScrCmd_showbox: @ 80671B4
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl MenuDrawTextWindow
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showbox

	thumb_func_start ScrCmd_multichoicerow
ScrCmd_multichoicerow: @ 80671E0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_80B5578
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806721E
	movs r0, 0
	b _08067224
_0806721E:
	bl ScriptContext1_Stop
	movs r0, 0x1
_08067224:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicerow

	thumb_func_start ScrCmd_hidebox
ScrCmd_hidebox: @ 8067230
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl MenuZeroFillWindowRect
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidebox

	thumb_func_start ScrCmd_clearbox
ScrCmd_clearbox: @ 806725C
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl Multichoice
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806728A
	movs r0, 0
	b _08067290
_0806728A:
	bl ScriptContext1_Stop
	movs r0, 0x1
_08067290:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_clearbox

	thumb_func_start ScrCmd_showpokepic
ScrCmd_showpokepic: @ 8067298
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	bl sub_80B58C4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showpokepic

	thumb_func_start ScrCmd_hidepokepic
ScrCmd_hidepokepic: @ 80672C8
	push {r4,lr}
	adds r4, r0, 0
	bl picbox_close
	adds r1, r0, 0
	cmp r1, 0
	beq _080672E0
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	b _080672E2
_080672E0:
	movs r0, 0
_080672E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidepokepic

	thumb_func_start ScrCmd_showcontestwinner
ScrCmd_showcontestwinner: @ 80672E8
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _080672FC
	adds r0, r2, 0
	bl sub_8106630
_080672FC:
	bl ShowContestWinner
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showcontestwinner

	thumb_func_start ScrCmd_braillemsg
ScrCmd_braillemsg: @ 806730C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl ScriptReadWord
	adds r1, r0, 0
	ldrb r5, [r1]
	ldrb r6, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	mov r8, r0
	ldrb r0, [r1, 0x3]
	mov r9, r0
	ldrb r0, [r1, 0x4]
	mov r10, r0
	ldrb r7, [r1, 0x5]
	ldr r4, _08067360 @ =gStringVar4
	adds r1, 0x6
	adds r0, r4, 0
	bl StringBraille
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r9
	bl MenuDrawTextWindow
	adds r0, r4, 0
	mov r1, r10
	adds r2, r7, 0
	bl MenuPrint
	movs r0, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067360: .4byte gStringVar4
	thumb_func_end ScrCmd_braillemsg

	thumb_func_start ScrCmd_vtext
ScrCmd_vtext: @ 8067364
	push {lr}
	bl ScriptReadWord
	ldr r1, _0806737C @ =gUnknown_0202E8B0
	ldr r1, [r1]
	subs r0, r1
	bl ShowFieldMessage
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806737C: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_vtext

	thumb_func_start ScrCmd_bufferpoke
ScrCmd_bufferpoke: @ 8067380
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080673B8 @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080673BC @ =gSpeciesNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080673B8: .4byte gUnknown_083762F0
_080673BC: .4byte gSpeciesNames
	thumb_func_end ScrCmd_bufferpoke

	thumb_func_start ScrCmd_bufferfirstpoke
ScrCmd_bufferfirstpoke: @ 80673C0
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _08067400 @ =gUnknown_083762F0
	lsls r2, 2
	adds r2, r0
	ldr r4, [r2]
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08067404 @ =gPlayerParty
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _08067408 @ =gSpeciesNames
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067400: .4byte gUnknown_083762F0
_08067404: .4byte gPlayerParty
_08067408: .4byte gSpeciesNames
	thumb_func_end ScrCmd_bufferfirstpoke

	thumb_func_start ScrCmd_bufferpartypoke
ScrCmd_bufferpartypoke: @ 806740C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806744C @ =gPlayerParty
	adds r0, r1
	ldr r1, _08067450 @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r1
	ldr r4, [r4]
	movs r1, 0x2
	adds r2, r4, 0
	bl GetMonData
	adds r0, r4, 0
	bl StringGetEnd10
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806744C: .4byte gPlayerParty
_08067450: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_bufferpartypoke

	thumb_func_start ScrCmd_bufferitem
ScrCmd_bufferitem: @ 8067454
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08067484 @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r1
	ldr r1, [r4]
	bl CopyItemName
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067484: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_bufferitem

	thumb_func_start ScrCmd_bufferdecor
ScrCmd_bufferdecor: @ 8067488
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	ldr r0, _080674BC @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsrs r1, 11
	ldr r2, _080674C0 @ =0x083f7bf1
	adds r1, r2
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080674BC: .4byte gUnknown_083762F0
_080674C0: .4byte 0x083f7bf1
	thumb_func_end ScrCmd_bufferdecor

	thumb_func_start ScrCmd_bufferattack
ScrCmd_bufferattack: @ 80674C4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080674FC @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xD
	muls r1, r0
	ldr r0, _08067500 @ =gMoveNames
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080674FC: .4byte gUnknown_083762F0
_08067500: .4byte gMoveNames
	thumb_func_end ScrCmd_bufferattack

	thumb_func_start ScrCmd_buffernum
ScrCmd_buffernum: @ 8067504
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08067544 @ =gUnknown_083762F0
	lsls r5, 2
	adds r5, r0
	ldr r0, [r5]
	adds r1, r4, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08067544: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_buffernum

	thumb_func_start ScrCmd_bufferstd
ScrCmd_bufferstd: @ 8067548
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	ldr r1, _08067580 @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	ldr r1, _08067584 @ =gUnknown_083CE048
	lsrs r0, 14
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067580: .4byte gUnknown_083762F0
_08067584: .4byte gUnknown_083CE048
	thumb_func_end ScrCmd_bufferstd

	thumb_func_start ScrCmd_buffertext
ScrCmd_buffertext: @ 8067588
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _080675AC @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080675AC: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_buffertext

	thumb_func_start ScrCmd_vloadptr
ScrCmd_vloadptr: @ 80675B0
	push {lr}
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _080675CC @ =gUnknown_0202E8B0
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _080675D0 @ =gStringVar4
	bl StringExpandPlaceholders
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080675CC: .4byte gUnknown_0202E8B0
_080675D0: .4byte gStringVar4
	thumb_func_end ScrCmd_vloadptr

	thumb_func_start ScrCmd_vbuffer
ScrCmd_vbuffer: @ 80675D4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _08067600 @ =gUnknown_0202E8B0
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _08067604 @ =gUnknown_083762F0
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067600: .4byte gUnknown_0202E8B0
_08067604: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_vbuffer

	thumb_func_start ScrCmd_givepokemon
ScrCmd_givepokemon: @ 8067608
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl ScriptReadWord
	mov r8, r0
	adds r0, r4, 0
	bl ScriptReadWord
	ldr r1, [r4, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	ldr r4, _08067684 @ =gScriptResult
	str r0, [sp]
	str r2, [sp, 0x4]
	adds r0, r6, 0
	mov r1, r9
	adds r2, r5, 0
	mov r3, r8
	bl ScriptGiveMon
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08067684: .4byte gScriptResult
	thumb_func_end ScrCmd_givepokemon

	thumb_func_start ScrCmd_giveegg
ScrCmd_giveegg: @ 8067688
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080676B0 @ =gScriptResult
	bl ScriptGiveEgg
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080676B0: .4byte gScriptResult
	thumb_func_end ScrCmd_giveegg

	thumb_func_start ScrCmd_setpokemove
ScrCmd_setpokemove: @ 80676B4
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl ScriptSetMonMoveSlot
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setpokemove

	thumb_func_start ScrCmd_checkattack
ScrCmd_checkattack: @ 80676E0
	push {r4-r7,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _080676F4 @ =gScriptResult
	movs r0, 0x6
	strh r0, [r1]
	movs r6, 0
	b _0806772E
	.align 2, 0
_080676F4: .4byte gScriptResult
_080676F8:
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08067728
	adds r0, r4, 0
	adds r1, r7, 0
	bl pokemon_has_move
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067728
	ldr r0, _08067720 @ =gScriptResult
	strh r6, [r0]
	ldr r0, _08067724 @ =gSpecialVar_0x8004
	strh r5, [r0]
	b _0806774E
	.align 2, 0
_08067720: .4byte gScriptResult
_08067724: .4byte gSpecialVar_0x8004
_08067728:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0806772E:
	cmp r6, 0x5
	bhi _0806774E
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08067758 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080676F8
_0806774E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067758: .4byte gPlayerParty
	thumb_func_end ScrCmd_checkattack

	thumb_func_start ScrCmd_givemoney
ScrCmd_givemoney: @ 806775C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806777A
	ldr r0, _08067784 @ =gSaveBlock1 + 0x490
	adds r1, r2, 0
	bl sub_80B79B8
_0806777A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067784: .4byte gSaveBlock1 + 0x490
	thumb_func_end ScrCmd_givemoney

	thumb_func_start ScrCmd_paymoney
ScrCmd_paymoney: @ 8067788
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _080677A6
	ldr r0, _080677B0 @ =gSaveBlock1 + 0x490
	adds r1, r2, 0
	bl sub_80B79E0
_080677A6:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677B0: .4byte gSaveBlock1 + 0x490
	thumb_func_end ScrCmd_paymoney

	thumb_func_start ScrCmd_checkmoney
ScrCmd_checkmoney: @ 80677B4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _080677E2
	ldr r4, _080677EC @ =gScriptResult
	ldr r0, _080677F0 @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r2, 0
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080677E2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677EC: .4byte gScriptResult
_080677F0: .4byte gSaveBlock1
	thumb_func_end ScrCmd_checkmoney

	thumb_func_start ScrCmd_showmoney
ScrCmd_showmoney: @ 80677F4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _08067820
	ldr r0, _08067828 @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7C14
_08067820:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067828: .4byte gSaveBlock1
	thumb_func_end ScrCmd_showmoney

	thumb_func_start ScrCmd_hidemoney
ScrCmd_hidemoney: @ 806782C
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl RemoveMoneyLabelObject
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidemoney

	thumb_func_start ScrCmd_updatemoney
ScrCmd_updatemoney: @ 8067848
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _08067874
	ldr r0, _0806787C @ =gSaveBlock1
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7BEC
_08067874:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806787C: .4byte gSaveBlock1
	thumb_func_end ScrCmd_updatemoney

	thumb_func_start ScrCmd_showcoins
ScrCmd_showcoins: @ 8067880
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _080678A4 @ =gSaveBlock1
	ldr r3, _080678A8 @ =0x00000494
	adds r0, r3
	ldrh r0, [r0]
	bl ShowCoinsWindow
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080678A4: .4byte gSaveBlock1
_080678A8: .4byte 0x00000494
	thumb_func_end ScrCmd_showcoins

	thumb_func_start ScrCmd_hidecoins
ScrCmd_hidecoins: @ 80678AC
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl HideCoinsWindow
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidecoins

	thumb_func_start ScrCmd_updatecoins
ScrCmd_updatecoins: @ 80678C8
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _080678EC @ =gSaveBlock1
	ldr r3, _080678F0 @ =0x00000494
	adds r0, r3
	ldrh r0, [r0]
	bl UpdateCoinsWindow
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080678EC: .4byte gSaveBlock1
_080678F0: .4byte 0x00000494
	thumb_func_end ScrCmd_updatecoins

	thumb_func_start ScrCmd_trainerbattle
ScrCmd_trainerbattle: @ 80678F4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	bl TrainerBattleConfigure
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_trainerbattle

	thumb_func_start ScrCmd_reptrainerbattle
ScrCmd_reptrainerbattle: @ 8067908
	push {lr}
	bl sub_80825E4
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_reptrainerbattle

	thumb_func_start ScrCmd_endtrainerbattle
ScrCmd_endtrainerbattle: @ 8067914
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80826E8
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_endtrainerbattle

	thumb_func_start ScrCmd_endtrainerbattle2
ScrCmd_endtrainerbattle2: @ 8067928
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8082700
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_endtrainerbattle2

	thumb_func_start ScrCmd_checktrainerflag
ScrCmd_checktrainerflag: @ 806793C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_check
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checktrainerflag

	thumb_func_start ScrCmd_cleartrainerflag
ScrCmd_cleartrainerflag: @ 8067960
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_set
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_cleartrainerflag

	thumb_func_start ScrCmd_settrainerflag
ScrCmd_settrainerflag: @ 806797C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_clear
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_settrainerflag

	thumb_func_start ScrCmd_setwildbattle
ScrCmd_setwildbattle: @ 8067998
	push {r4-r6,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r0, [r4, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadHalfword
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl ScriptWildBattle
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setwildbattle

	thumb_func_start ScrCmd_dowildbattle
ScrCmd_dowildbattle: @ 80679CC
	push {lr}
	bl sub_8081B3C
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_dowildbattle

	thumb_func_start ScrCmd_pokemart
ScrCmd_pokemart: @ 80679DC
	push {lr}
	bl ScriptReadWord
	bl CreatePokemartMenu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemart

	thumb_func_start ScrCmd_pokemartdecor
ScrCmd_pokemartdecor: @ 80679F0
	push {lr}
	bl ScriptReadWord
	bl CreateDecorationShop1Menu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartdecor

	thumb_func_start ScrCmd_pokemartbp
ScrCmd_pokemartbp: @ 8067A04
	push {lr}
	bl ScriptReadWord
	bl CreateDecorationShop2Menu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartbp

	thumb_func_start ScrCmd_pokecasino
ScrCmd_pokecasino: @ 8067A18
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08067A3C @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl PlaySlotMachine
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067A3C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end ScrCmd_pokecasino

	thumb_func_start ScrCmd_event_8a
ScrCmd_event_8a: @ 8067A40
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r4, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r3, 0
	bne _08067A68
	adds r0, r5, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
	b _08067A74
_08067A68:
	adds r0, r5, 0
	adds r1, r3, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
_08067A74:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_event_8a

	thumb_func_start ScrCmd_event_96
ScrCmd_event_96: @ 8067A7C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08067AA4 @ =gScriptResult
	lsls r0, 24
	lsrs r0, 24
	bl GetPriceReduction
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067AA4: .4byte gScriptResult
	thumb_func_end ScrCmd_event_96

	thumb_func_start ScrCmd_choosecontestpkmn
ScrCmd_choosecontestpkmn: @ 8067AA8
	push {lr}
	bl sub_80F99CC
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_choosecontestpkmn

	thumb_func_start ScrCmd_startcontest
ScrCmd_startcontest: @ 8067AB8
	push {lr}
	bl sub_80C48C8
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_startcontest

	thumb_func_start ScrCmd_showcontestresults
ScrCmd_showcontestresults: @ 8067AC8
	push {lr}
	bl sub_80C4940
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showcontestresults

	thumb_func_start ScrCmd_contestlinktransfer
ScrCmd_contestlinktransfer: @ 8067AD8
	push {lr}
	ldr r0, _08067AEC @ =gScriptContestCategory
	ldrb r0, [r0]
	bl sub_80C4980
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067AEC: .4byte gScriptContestCategory
	thumb_func_end ScrCmd_contestlinktransfer

	thumb_func_start ScrCmd_doanimation
ScrCmd_doanimation: @ 8067AF0
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08067B14 @ =gUnknown_0202E8BC
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl FieldEffectStart
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067B14: .4byte gUnknown_0202E8BC
	thumb_func_end ScrCmd_doanimation

	thumb_func_start ScrCmd_setanimation
ScrCmd_setanimation: @ 8067B18
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067B44 @ =gUnknown_0202FF84
	lsls r4, 2
	adds r4, r1
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B44: .4byte gUnknown_0202FF84
	thumb_func_end ScrCmd_setanimation

	thumb_func_start sub_8067B48
sub_8067B48: @ 8067E88
	push {lr}
	ldr r0, _08067E9C @ =gUnknown_0202E8BC
	ldrb r0, [r0]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _08067EA0
	movs r0, 0
	b _08067EA2
	.align 2, 0
_08067E9C: .4byte gUnknown_0202E8BC
_08067EA0:
	movs r0, 0x1
_08067EA2:
	pop {r1}
	bx r1
	thumb_func_end sub_8067B48

	thumb_func_start ScrCmd_checkanimation
ScrCmd_checkanimation: @ 8067B68
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067B8C @ =gUnknown_0202E8BC
	strh r0, [r1]
	ldr r1, _08067B90 @ =sub_8067B48
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B8C: .4byte gUnknown_0202E8BC
_08067B90: .4byte sub_8067B48
	thumb_func_end ScrCmd_checkanimation

	thumb_func_start ScrCmd_sethealplace
ScrCmd_sethealplace: @ 8067B94
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_8053588
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_sethealplace

	thumb_func_start ScrCmd_checkgender
ScrCmd_checkgender: @ 8067BB0
	ldr r0, _08067BBC @ =gScriptResult
	ldr r1, _08067BC0 @ =gSaveBlock2
	ldrb r1, [r1, 0x8]
	strh r1, [r0]
	movs r0, 0
	bx lr
	.align 2, 0
_08067BBC: .4byte gScriptResult
_08067BC0: .4byte gSaveBlock2
	thumb_func_end ScrCmd_checkgender

	thumb_func_start ScrCmd_pokecry
ScrCmd_pokecry: @ 8067BC4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl PlayCry5
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokecry

	thumb_func_start ScrCmd_waitpokecry
ScrCmd_waitpokecry: @ 8067BFC
	push {lr}
	ldr r1, _08067C0C @ =IsCryFinished
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067C0C: .4byte IsCryFinished
	thumb_func_end ScrCmd_waitpokecry

	thumb_func_start ScrCmd_setmaptile
ScrCmd_setmaptile: @ 8067C10
	push {r4-r7,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	adds r1, r6, 0x7
	lsls r1, 16
	lsrs r6, r1, 16
	adds r1, r5, 0x7
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r0, 0
	bne _08067C74
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl MapGridSetMetatileIdAt
	b _08067C86
_08067C74:
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r2, r7, 0
	orrs r2, r0
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08067C86:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setmaptile

	thumb_func_start ScrCmd_setdooropened
ScrCmd_setdooropened: @ 8067C90
	push {r4,r5,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	adds r5, 0x7
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r4, r0
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8058790
	lsls r0, 16
	lsrs r0, 16
	bl PlaySE
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldAnimateDoorOpen
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdooropened

	thumb_func_start ScrCmd_setdoorclosed
ScrCmd_setdoorclosed: @ 8067CE8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl FieldAnimateDoorClose
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdoorclosed

	thumb_func_start IsDoorAnimationStopped
IsDoorAnimationStopped: @ 806806C
	push {lr}
	bl FieldIsDoorAnimationRunning
	lsls r0, 24
	cmp r0, 0
	beq _0806807C
	movs r0, 0
	b _0806807E
_0806807C:
	movs r0, 0x1
_0806807E:
	pop {r1}
	bx r1
	thumb_func_end IsDoorAnimationStopped

	thumb_func_start ScrCmd_doorchange
ScrCmd_doorchange: @ 8067D44
	push {lr}
	ldr r1, _08067D54 @ =IsDoorAnimationStopped
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067D54: .4byte IsDoorAnimationStopped
	thumb_func_end ScrCmd_doorchange

	thumb_func_start ScrCmd_setdooropened2
ScrCmd_setdooropened2: @ 8067D58
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl FieldSetDoorOpened
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdooropened2

	thumb_func_start ScrCmd_setdoorclosed2
ScrCmd_setdoorclosed2: @ 8067D9C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl FieldSetDoorClosed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setdoorclosed2

	thumb_func_start ScrCmd_event_b1
ScrCmd_event_b1: @ 8067DE0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	ldr r0, [r6, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r6, 0x8]
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r3, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl ScriptAddElevatorMenuItem
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_event_b1

	thumb_func_start ScrCmd_event_b2
ScrCmd_event_b2: @ 8067E4C
	push {lr}
	bl ScriptShowElevatorMenu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_event_b2

	thumb_func_start ScrCmd_checkcoins
ScrCmd_checkcoins: @ 8067E5C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	bl GetCoins
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checkcoins

	thumb_func_start ScrCmd_givecoins
ScrCmd_givecoins: @ 8067E7C
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GiveCoins
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067EA4
	ldr r1, _08067EA0 @ =gScriptResult
	movs r0, 0
	b _08067EA8
	.align 2, 0
_08067EA0: .4byte gScriptResult
_08067EA4:
	ldr r1, _08067EB0 @ =gScriptResult
	movs r0, 0x1
_08067EA8:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067EB0: .4byte gScriptResult
	thumb_func_end ScrCmd_givecoins

	thumb_func_start ScrCmd_removecoins
ScrCmd_removecoins: @ 8067EB4
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl TakeCoins
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067EDC
	ldr r1, _08067ED8 @ =gScriptResult
	movs r0, 0
	b _08067EE0
	.align 2, 0
_08067ED8: .4byte gScriptResult
_08067EDC:
	ldr r1, _08067EE8 @ =gScriptResult
	movs r0, 0x1
_08067EE0:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067EE8: .4byte gScriptResult
	thumb_func_end ScrCmd_removecoins

	.align 2, 0 @ Don't pad with nop.
