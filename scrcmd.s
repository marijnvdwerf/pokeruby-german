	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start ScrCmd_snop
ScrCmd_snop: @ 8065BAC
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_snop

	thumb_func_start ScrCmd_snop1
ScrCmd_snop1: @ 8065BB0
	movs r0, 0
	bx lr
	thumb_func_end ScrCmd_snop1

	thumb_func_start ScrCmd_end
ScrCmd_end: @ 8065BB4
	push {lr}
	bl StopScript
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_end

	thumb_func_start ScrCmd_jumpasm
ScrCmd_jumpasm: @ 8065BC0
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
ScrCmd_special: @ 8065BD8
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	ldr r1, _08065BF4
	lsrs r0, 14
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065BF4: .4byte gSpecials
	thumb_func_end ScrCmd_special

	thumb_func_start ScrCmd_specialval
ScrCmd_specialval: @ 8065BF8
	push {r4-r6,lr}
	adds r5, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r6, r0, 0
	ldr r4, _08065C28
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
_08065C28: .4byte gSpecials
	thumb_func_end ScrCmd_specialval

	thumb_func_start ScrCmd_callasm
ScrCmd_callasm: @ 8065C2C
	push {lr}
	bl ScriptReadWord
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_callasm

	thumb_func_start ScrCmd_waitstate
ScrCmd_waitstate: @ 8065C3C
	push {lr}
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_waitstate

	thumb_func_start ScrCmd_jump
ScrCmd_jump: @ 8065C48
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
ScrCmd_return: @ 8065C60
	push {lr}
	bl ScriptReturn
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_return

	thumb_func_start ScrCmd_call
ScrCmd_call: @ 8065C6C
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
ScrCmd_jumpif: @ 8065C84
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r1, _08065CBC
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065CB2
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptJump
_08065CB2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065CBC: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_jumpif

	thumb_func_start ScrCmd_callif
ScrCmd_callif: @ 8065CC0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r1, _08065CF8
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065CEE
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptCall
_08065CEE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065CF8: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_callif

	thumb_func_start ScrCmd_setvaddress
ScrCmd_setvaddress: @ 8065CFC
	push {r4,lr}
	ldr r4, [r0, 0x8]
	subs r4, 0x1
	bl ScriptReadWord
	ldr r1, _08065D14
	subs r0, r4
	str r0, [r1]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065D14: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_setvaddress

	thumb_func_start ScrCmd_vjump
ScrCmd_vjump: @ 8065D18
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _08065D38
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl ScriptJump
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065D38: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_vjump

	thumb_func_start ScrCmd_vcall
ScrCmd_vcall: @ 8065D3C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _08065D5C
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl ScriptCall
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065D5C: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_vcall

	thumb_func_start ScrCmd_if5
ScrCmd_if5: @ 8065D60
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	ldr r1, _08065D9C
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065DA0
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065D92
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptJump
_08065D92:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065D9C: .4byte gUnknown_0202E8B0
_08065DA0: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_if5

	thumb_func_start ScrCmd_if6
ScrCmd_if6: @ 8065DA4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl ScriptReadWord
	ldr r1, _08065DE0
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065DE4
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065DD6
	adds r0, r5, 0
	adds r1, r2, 0
	bl ScriptCall
_08065DD6:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065DE0: .4byte gUnknown_0202E8B0
_08065DE4: .4byte gScriptConditionTable
	thumb_func_end ScrCmd_if6

	thumb_func_start ScrCmd_jumpstd
ScrCmd_jumpstd: @ 8065DE8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065E10
	adds r1, r0
	ldr r0, _08065E14
	cmp r1, r0
	bcs _08065E08
	ldr r1, [r1]
	adds r0, r2, 0
	bl ScriptJump
_08065E08:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065E10: .4byte gStdScripts
_08065E14: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_jumpstd

	thumb_func_start ScrCmd_callstd
ScrCmd_callstd: @ 8065E18
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065E40
	adds r1, r0
	ldr r0, _08065E44
	cmp r1, r0
	bcs _08065E38
	ldr r1, [r1]
	adds r0, r2, 0
	bl ScriptCall
_08065E38:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065E40: .4byte gStdScripts
_08065E44: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_callstd

	thumb_func_start ScrCmd_jumpstdif
ScrCmd_jumpstdif: @ 8065E48
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065E88
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065E80
	lsls r0, r4, 2
	ldr r1, _08065E8C
	adds r1, r0, r1
	ldr r0, _08065E90
	cmp r1, r0
	bcs _08065E80
	ldr r1, [r1]
	adds r0, r3, 0
	bl ScriptJump
_08065E80:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065E88: .4byte gScriptConditionTable
_08065E8C: .4byte gStdScripts
_08065E90: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_jumpstdif

	thumb_func_start ScrCmd_callstdif
ScrCmd_callstdif: @ 8065E94
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065ED4
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065ECC
	lsls r0, r4, 2
	ldr r1, _08065ED8
	adds r1, r0, r1
	ldr r0, _08065EDC
	cmp r1, r0
	bcs _08065ECC
	ldr r1, [r1]
	adds r0, r3, 0
	bl ScriptCall
_08065ECC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065ED4: .4byte gScriptConditionTable
_08065ED8: .4byte gStdScripts
_08065EDC: .4byte PetalburgCity_MapScripts
	thumb_func_end ScrCmd_callstdif

	thumb_func_start ScrCmd_jumpram
ScrCmd_jumpram: @ 8065EE0
	push {lr}
	ldr r1, _08065EF0
	ldr r1, [r1]
	bl ScriptJump
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065EF0: .4byte gUnknown_0202E8AC
	thumb_func_end ScrCmd_jumpram

	thumb_func_start ScrCmd_die
ScrCmd_die: @ 8065EF4
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
ScrCmd_setbyte: @ 8065F0C
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
ScrCmd_loadptr: @ 8065F24
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
ScrCmd_loadbytefrompointer: @ 8065F48
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
ScrCmd_writebytetooffset: @ 8065F6C
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
ScrCmd_setbufferbyte: @ 8065F84
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
ScrCmd_setptrbyte: @ 8065FA0
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
ScrCmd_copybuffers: @ 8065FC4
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
ScrCmd_copybyte: @ 8065FE4
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
ScrCmd_setvar: @ 8066000
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
ScrCmd_copyvar: @ 8066024
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
ScrCmd_setorcopyvar: @ 8066050
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
compare_012: @ 806607C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r0, r1
	bcs _0806608E
	movs r0, 0
	b _08066098
_0806608E:
	cmp r0, r1
	beq _08066096
	movs r0, 0x2
	b _08066098
_08066096:
	movs r0, 0x1
_08066098:
	pop {r1}
	bx r1
	thumb_func_end compare_012

	thumb_func_start ScrCmd_comparebuffers
ScrCmd_comparebuffers: @ 806609C
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
ScrCmd_comparebuffertobyte: @ 80660CC
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
ScrCmd_comparebuffertoptrbyte: @ 80660F4
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
ScrCmd_compareptrbytetobuffer: @ 8066120
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
ScrCmd_compareptrbytetobyte: @ 806614C
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
ScrCmd_compareptrbytes: @ 806616C
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
ScrCmd_compare: @ 8066190
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
ScrCmd_comparevars: @ 80661C0
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
ScrCmd_addvar: @ 80661F4
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
ScrCmd_subvar: @ 806621C
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
ScrCmd_random: @ 806624C
	push {r4,r5,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r5, _0806627C
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
_0806627C: .4byte gScriptResult
	thumb_func_end ScrCmd_random

	thumb_func_start ScrCmd_additem
ScrCmd_additem: @ 8066280
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
	ldr r5, _080662C0
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
_080662C0: .4byte gScriptResult
	thumb_func_end ScrCmd_additem

	thumb_func_start ScrCmd_removeitem
ScrCmd_removeitem: @ 80662C4
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
	ldr r5, _08066304
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
_08066304: .4byte gScriptResult
	thumb_func_end ScrCmd_removeitem

	thumb_func_start ScrCmd_checkitemspace
ScrCmd_checkitemspace: @ 8066308
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
	ldr r5, _08066348
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
_08066348: .4byte gScriptResult
	thumb_func_end ScrCmd_checkitemspace

	thumb_func_start ScrCmd_checkitem
ScrCmd_checkitem: @ 806634C
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
	ldr r5, _0806638C
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
_0806638C: .4byte gScriptResult
	thumb_func_end ScrCmd_checkitem

	thumb_func_start ScrCmd_checkitemtype
ScrCmd_checkitemtype: @ 8066390
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080663B8
	bl GetPocketByItemId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080663B8: .4byte gScriptResult
	thumb_func_end ScrCmd_checkitemtype

	thumb_func_start ScrCmd_addpcitem
ScrCmd_addpcitem: @ 80663BC
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
	ldr r5, _080663FC
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
_080663FC: .4byte gScriptResult
	thumb_func_end ScrCmd_addpcitem

	thumb_func_start ScrCmd_checkpcitem
ScrCmd_checkpcitem: @ 8066400
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
	ldr r5, _08066440
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
_08066440: .4byte gScriptResult
	thumb_func_end ScrCmd_checkpcitem

	thumb_func_start ScrCmd_adddecor
ScrCmd_adddecor: @ 8066444
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _0806646C
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
_0806646C: .4byte gScriptResult
	thumb_func_end ScrCmd_adddecor

	thumb_func_start ScrCmd_removedecor
ScrCmd_removedecor: @ 8066470
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08066498
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
_08066498: .4byte gScriptResult
	thumb_func_end ScrCmd_removedecor

	thumb_func_start ScrCmd_checkdecor
ScrCmd_checkdecor: @ 806649C
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _080664C4
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
_080664C4: .4byte gScriptResult
	thumb_func_end ScrCmd_checkdecor

	thumb_func_start ScrCmd_testdecor
ScrCmd_testdecor: @ 80664C8
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _080664F0
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
_080664F0: .4byte gScriptResult
	thumb_func_end ScrCmd_testdecor

	thumb_func_start ScrCmd_setflag
ScrCmd_setflag: @ 80664F4
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
ScrCmd_clearflag: @ 8066508
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
ScrCmd_checkflag: @ 806651C
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
ScrCmd_inccounter: @ 8066538
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
ScrCmd_lighten: @ 8066550
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
ScrCmd_darken: @ 806656C
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
sub_8066248: @ 8066588
	push {lr}
	ldr r0, _0806659C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080665A0
	movs r0, 0
	b _080665A2
	.align 2, 0
_0806659C: .4byte gPaletteFade
_080665A0:
	movs r0, 0x1
_080665A2:
	pop {r1}
	bx r1
	thumb_func_end sub_8066248

	thumb_func_start ScrCmd_fadescreen
ScrCmd_fadescreen: @ 80665A8
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	movs r1, 0
	bl fade_screen
	ldr r1, _080665CC
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080665CC: .4byte sub_8066248
	thumb_func_end ScrCmd_fadescreen

	thumb_func_start ScrCmd_fadescreendelay
ScrCmd_fadescreendelay: @ 80665D0
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
	ldr r1, _080665F8
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080665F8: .4byte sub_8066248
	thumb_func_end ScrCmd_fadescreendelay

	thumb_func_start s28_pause_asm
s28_pause_asm: @ 80665FC
	push {lr}
	ldr r1, _08066610
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _08066614
	movs r0, 0
	b _08066616
	.align 2, 0
_08066610: .4byte gUnknown_0202E8B4
_08066614:
	movs r0, 0x1
_08066616:
	pop {r1}
	bx r1
	thumb_func_end s28_pause_asm

	thumb_func_start ScrCmd_pause
ScrCmd_pause: @ 806661C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	ldr r1, _08066638
	strh r0, [r1]
	ldr r1, _0806663C
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066638: .4byte gUnknown_0202E8B4
_0806663C: .4byte s28_pause_asm
	thumb_func_end ScrCmd_pause

	thumb_func_start ScrCmd_compareflags
ScrCmd_compareflags: @ 8066640
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
ScrCmd_checkdailyflags: @ 8066678
	push {lr}
	bl DoTimeBasedEvents
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_checkdailyflags

	thumb_func_start ScrCmd_resetvars
ScrCmd_resetvars: @ 8066684
	push {lr}
	bl RtcCalcLocalTime
	ldr r2, _080666AC
	ldr r1, _080666B0
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _080666B4
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _080666B8
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080666AC: .4byte gSpecialVar_0x8000
_080666B0: .4byte gLocalTime
_080666B4: .4byte gSpecialVar_0x8001
_080666B8: .4byte gSpecialVar_0x8002
	thumb_func_end ScrCmd_resetvars

	thumb_func_start ScrCmd_setweather
ScrCmd_setweather: @ 80666BC
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
ScrCmd_resetweather: @ 80666D8
	push {lr}
	bl sub_80806E4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_resetweather

	thumb_func_start ScrCmd_doweather
ScrCmd_doweather: @ 80666E4
	push {lr}
	bl sub_808073C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_doweather

	thumb_func_start ScrCmd_tileeffect
ScrCmd_tileeffect: @ 80666F0
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
ScrCmd_setmapfooter: @ 8066708
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
ScrCmd_warp: @ 8066724
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
ScrCmd_warpmuted: @ 80667AC
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
ScrCmd_warpwalk: @ 8066834
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
ScrCmd_warphole: @ 80668BC
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
	bne _080668FA
	cmp r5, 0xFF
	bne _080668FA
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
	b _0806691E
_080668FA:
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
_0806691E:
	bl sp13F_fall_to_last_warp
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_warphole

	thumb_func_start ScrCmd_warpteleport
ScrCmd_warpteleport: @ 8066930
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
ScrCmd_warp3: @ 80669B8
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
ScrCmd_warpplace: @ 8066A38
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
ScrCmd_warp4: @ 8066ABC
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
ScrCmd_warp5: @ 8066B3C
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
ScrCmd_warp6: @ 8066BBC
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
ScrCmd_getplayerxy: @ 8066C3C
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
	ldr r2, _08066C70
	ldrh r1, [r2]
	strh r1, [r5]
	ldrh r1, [r2, 0x2]
	strh r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066C70: .4byte gSaveBlock1
	thumb_func_end ScrCmd_getplayerxy

	thumb_func_start ScrCmd_countpokemon
ScrCmd_countpokemon: @ 8066C74
	push {r4,lr}
	ldr r4, _08066C8C
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066C8C: .4byte gScriptResult
	thumb_func_end ScrCmd_countpokemon

	thumb_func_start ScrCmd_playsfx
ScrCmd_playsfx: @ 8066C90
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
s30_music_check_asm: @ 8066CA4
	push {lr}
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	beq _08066CB4
	movs r0, 0
	b _08066CB6
_08066CB4:
	movs r0, 0x1
_08066CB6:
	pop {r1}
	bx r1
	thumb_func_end s30_music_check_asm

	thumb_func_start ScrCmd_checksound
ScrCmd_checksound: @ 8066CBC
	push {lr}
	ldr r1, _08066CCC
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08066CCC: .4byte s30_music_check_asm
	thumb_func_end ScrCmd_checksound

	thumb_func_start ScrCmd_fanfare
ScrCmd_fanfare: @ 8066CD0
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
s32_fanfare_wait_asm: @ 8066CE4
	push {lr}
	bl IsFanfareTaskInactive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end s32_fanfare_wait_asm

	thumb_func_start ScrCmd_waitfanfare
ScrCmd_waitfanfare: @ 8066CF4
	push {lr}
	ldr r1, _08066D04
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08066D04: .4byte s32_fanfare_wait_asm
	thumb_func_end ScrCmd_waitfanfare

	thumb_func_start ScrCmd_playmusic
ScrCmd_playmusic: @ 8066D08
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
	bne _08066D28
	adds r0, r2, 0
	bl sav1_set_battle_music_maybe
_08066D28:
	adds r0, r5, 0
	bl PlayNewMapMusic
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_playmusic

	thumb_func_start ScrCmd_playmusicbattle
ScrCmd_playmusicbattle: @ 8066D38
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
ScrCmd_fadedefault: @ 8066D4C
	push {lr}
	bl sub_8053F84
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fadedefault

	thumb_func_start ScrCmd_fademusic
ScrCmd_fademusic: @ 8066D58
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
ScrCmd_fadeout: @ 8066D6C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	beq _08066D86
	lsls r0, r1, 26
	lsrs r0, 24
	bl FadeOutBGMTemporarily
	b _08066D8C
_08066D86:
	movs r0, 0x4
	bl FadeOutBGMTemporarily
_08066D8C:
	ldr r1, _08066D9C
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066D9C: .4byte IsBGMPausedOrStopped
	thumb_func_end ScrCmd_fadeout

	thumb_func_start ScrCmd_fadein
ScrCmd_fadein: @ 8066DA0
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _08066DB8
	lsls r0, r2, 26
	lsrs r0, 24
	bl FadeInBGM
	b _08066DBE
_08066DB8:
	movs r0, 0x4
	bl FadeInBGM
_08066DBE:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_fadein

	thumb_func_start ScrCmd_move
ScrCmd_move: @ 8066DC4
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
	ldr r2, _08066DFC
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl exec_movement
	ldr r0, _08066E00
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066DFC: .4byte gSaveBlock1
_08066E00: .4byte gUnknown_0202E8B6
	thumb_func_end ScrCmd_move

	thumb_func_start ScrCmd_movecoords
ScrCmd_movecoords: @ 8066E04
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
	ldr r0, _08066E44
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066E44: .4byte gUnknown_0202E8B6
	thumb_func_end ScrCmd_movecoords

	thumb_func_start s51a_0806B288
s51a_0806B288: @ 8066E48
	push {lr}
	ldr r0, _08066E64
	ldrb r0, [r0]
	ldr r1, _08066E68
	ldrb r1, [r1]
	ldr r2, _08066E6C
	ldrb r2, [r2]
	bl sub_80A212C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08066E64: .4byte gUnknown_0202E8B6
_08066E68: .4byte gUnknown_0202E8BA
_08066E6C: .4byte gUnknown_0202E8B8
	thumb_func_end s51a_0806B288

	thumb_func_start ScrCmd_waitmove
ScrCmd_waitmove: @ 8066E70
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066E8C
	ldr r0, _08066EB0
	strh r1, [r0]
_08066E8C:
	ldr r1, _08066EB4
	ldr r2, _08066EB8
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066EBC
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066EC0
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066EB0: .4byte gUnknown_0202E8B6
_08066EB4: .4byte gUnknown_0202E8B8
_08066EB8: .4byte gSaveBlock1
_08066EBC: .4byte gUnknown_0202E8BA
_08066EC0: .4byte s51a_0806B288
	thumb_func_end ScrCmd_waitmove

	thumb_func_start ScrCmd_waitmovexy
ScrCmd_waitmovexy: @ 8066EC4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066EE0
	ldr r0, _08066F08
	strh r1, [r0]
_08066EE0:
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _08066F0C
	strh r2, [r0]
	ldr r0, _08066F10
	strh r1, [r0]
	ldr r1, _08066F14
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066F08: .4byte gUnknown_0202E8B6
_08066F0C: .4byte gUnknown_0202E8B8
_08066F10: .4byte gUnknown_0202E8BA
_08066F14: .4byte s51a_0806B288
	thumb_func_end ScrCmd_waitmovexy

	thumb_func_start ScrCmd_disappear
ScrCmd_disappear: @ 8066F18
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066F3C
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066F3C: .4byte gSaveBlock1
	thumb_func_end ScrCmd_disappear

	thumb_func_start ScrCmd_disappearxy
ScrCmd_disappearxy: @ 8066F40
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
ScrCmd_reappear: @ 8066F70
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066F94
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl show_sprite
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066F94: .4byte gSaveBlock1
	thumb_func_end ScrCmd_reappear

	thumb_func_start ScrCmd_reappearxy
ScrCmd_reappearxy: @ 8066F98
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
ScrCmd_movesprite: @ 8066FC8
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
	ldr r2, _08067028
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
_08067028: .4byte gSaveBlock1
	thumb_func_end ScrCmd_movesprite

	thumb_func_start ScrCmd_movespriteperm
ScrCmd_movespriteperm: @ 806702C
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
ScrCmd_moveoffscreen: @ 8067084
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080670A8
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805C78C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080670A8: .4byte gSaveBlock1
	thumb_func_end ScrCmd_moveoffscreen

	thumb_func_start ScrCmd_spritevisible
ScrCmd_spritevisible: @ 80670AC
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
ScrCmd_spriteinvisible: @ 80670DC
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
ScrCmd_spritelevelup: @ 806710C
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
ScrCmd_restorespritelevel: @ 8067148
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
ScrCmd_faceplayer: @ 8067178
	push {r4,lr}
	ldr r2, _080671A8
	ldr r0, _080671AC
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _080671A0
	bl player_get_direction_lower_nybble
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectFaceOppositeDirection
_080671A0:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080671A8: .4byte gMapObjects
_080671AC: .4byte gSelectedMapObject
	thumb_func_end ScrCmd_faceplayer

	thumb_func_start ScrCmd_spriteface
ScrCmd_spriteface: @ 80671B0
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
	ldr r2, _080671E0
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl FieldObjectTurnByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080671E0: .4byte gSaveBlock1
	thumb_func_end ScrCmd_spriteface

	thumb_func_start ScrCmd_spritebehave
ScrCmd_spritebehave: @ 80671E4
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
ScrCmd_createvsprite: @ 806720C
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
ScrCmd_vspriteface: @ 806727C
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
ScrCmd_lockall: @ 8067298
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	bne _080672B8
	bl sub_8064D20
	ldr r1, _080672B4
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	b _080672BA
	.align 2, 0
_080672B4: .4byte sub_8064CFC
_080672B8:
	movs r0, 0
_080672BA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_lockall

	thumb_func_start ScrCmd_lock
ScrCmd_lock: @ 80672C0
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	beq _080672D0
	movs r0, 0
	b _0806730E
_080672D0:
	ldr r2, _080672F4
	ldr r0, _080672F8
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08067300
	bl sub_8064DD8
	ldr r1, _080672FC
	adds r0, r4, 0
	bl SetupNativeScript
	b _0806730C
	.align 2, 0
_080672F4: .4byte gMapObjects
_080672F8: .4byte gSelectedMapObject
_080672FC: .4byte sub_8064DB4
_08067300:
	bl sub_8064D20
	ldr r1, _08067314
	adds r0, r4, 0
	bl SetupNativeScript
_0806730C:
	movs r0, 0x1
_0806730E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067314: .4byte sub_8064CFC
	thumb_func_end ScrCmd_lock

	thumb_func_start ScrCmd_releaseall
ScrCmd_releaseall: @ 8067318
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
	ldr r1, _0806734C
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806734C: .4byte gMapObjects
	thumb_func_end ScrCmd_releaseall

	thumb_func_start ScrCmd_release
ScrCmd_release: @ 8067350
	push {r4,lr}
	bl HideFieldMessageBox
	ldr r4, _080673A0
	ldr r0, _080673A4
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08067372
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_08067372:
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
_080673A0: .4byte gMapObjects
_080673A4: .4byte gSelectedMapObject
	thumb_func_end ScrCmd_release

	thumb_func_start ScrCmd_message
ScrCmd_message: @ 80673A8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	cmp r0, 0
	bne _080673B6
	ldr r0, [r4, 0x64]
_080673B6:
	bl ShowFieldMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_message

	thumb_func_start ScrCmd_message2
ScrCmd_message2: @ 80673C4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	cmp r0, 0
	bne _080673D2
	ldr r0, [r4, 0x64]
_080673D2:
	bl ShowFieldAutoScrollMessage
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_message2

	thumb_func_start ScrCmd_waittext
ScrCmd_waittext: @ 80673E0
	push {lr}
	ldr r1, _080673F0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080673F0: .4byte IsFieldMessageBoxHidden
	thumb_func_end ScrCmd_waittext

	thumb_func_start ScrCmd_closebutton
ScrCmd_closebutton: @ 80673F4
	push {lr}
	bl HideFieldMessageBox
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_closebutton

	thumb_func_start sub_80670C0
sub_80670C0: @ 8067400
	push {lr}
	ldr r0, _0806741C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08067420
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08067420
	movs r0, 0
	b _08067422
	.align 2, 0
_0806741C: .4byte gMain
_08067420:
	movs r0, 0x1
_08067422:
	pop {r1}
	bx r1
	thumb_func_end sub_80670C0

	thumb_func_start ScrCmd_waitbutton
ScrCmd_waitbutton: @ 8067428
	push {lr}
	ldr r1, _08067438
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067438: .4byte sub_80670C0
	thumb_func_end ScrCmd_waitbutton

	thumb_func_start ScrCmd_yesnobox
ScrCmd_yesnobox: @ 806743C
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
	beq _0806745E
	movs r0, 0
	b _08067464
_0806745E:
	bl ScriptContext1_Stop
	movs r0, 0x1
_08067464:
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_yesnobox

	thumb_func_start ScrCmd_multichoice
ScrCmd_multichoice: @ 8067468
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
	beq _08067496
	movs r0, 0
	b _0806749C
_08067496:
	bl ScriptContext1_Stop
	movs r0, 0x1
_0806749C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoice

	thumb_func_start ScrCmd_multichoicedef
ScrCmd_multichoicedef: @ 80674A4
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
	beq _080674E2
	movs r0, 0
	b _080674E8
_080674E2:
	bl ScriptContext1_Stop
	movs r0, 0x1
_080674E8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicedef

	thumb_func_start ScrCmd_showbox
ScrCmd_showbox: @ 80674F4
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
ScrCmd_multichoicerow: @ 8067520
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
	beq _0806755E
	movs r0, 0
	b _08067564
_0806755E:
	bl ScriptContext1_Stop
	movs r0, 0x1
_08067564:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_multichoicerow

	thumb_func_start ScrCmd_hidebox
ScrCmd_hidebox: @ 8067570
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
ScrCmd_clearbox: @ 806759C
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
	beq _080675CA
	movs r0, 0
	b _080675D0
_080675CA:
	bl ScriptContext1_Stop
	movs r0, 0x1
_080675D0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_clearbox

	thumb_func_start ScrCmd_showpokepic
ScrCmd_showpokepic: @ 80675D8
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
ScrCmd_hidepokepic: @ 8067608
	push {r4,lr}
	adds r4, r0, 0
	bl picbox_close
	adds r1, r0, 0
	cmp r1, 0
	beq _08067620
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	b _08067622
_08067620:
	movs r0, 0
_08067622:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_hidepokepic

	thumb_func_start ScrCmd_showcontestwinner
ScrCmd_showcontestwinner: @ 8067628
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _0806763C
	adds r0, r2, 0
	bl sub_8106630
_0806763C:
	bl ShowContestWinner
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showcontestwinner

	thumb_func_start ScrCmd_braillemsg
ScrCmd_braillemsg: @ 806764C
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
	ldr r4, _080676A0
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
_080676A0: .4byte gStringVar4
	thumb_func_end ScrCmd_braillemsg

	thumb_func_start ScrCmd_vtext
ScrCmd_vtext: @ 80676A4
	push {lr}
	bl ScriptReadWord
	ldr r1, _080676BC
	ldr r1, [r1]
	subs r0, r1
	bl ShowFieldMessage
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080676BC: .4byte gUnknown_0202E8B0
	thumb_func_end ScrCmd_vtext

	thumb_func_start ScrCmd_bufferpoke
ScrCmd_bufferpoke: @ 80676C0
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
	ldr r1, _080676F8
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080676FC
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080676F8: .4byte gUnknown_083762F0
_080676FC: .4byte gSpeciesNames
	thumb_func_end ScrCmd_bufferpoke

	thumb_func_start ScrCmd_bufferfirstpoke
ScrCmd_bufferfirstpoke: @ 8067700
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _08067740
	lsls r2, 2
	adds r2, r0
	ldr r4, [r2]
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08067744
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	movs r1, 0xB
	muls r1, r0
	ldr r0, _08067748
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067740: .4byte gUnknown_083762F0
_08067744: .4byte gPlayerParty
_08067748: .4byte gSpeciesNames
	thumb_func_end ScrCmd_bufferfirstpoke

	thumb_func_start ScrCmd_bufferpartypoke
ScrCmd_bufferpartypoke: @ 806774C
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
	ldr r1, _0806778C
	adds r0, r1
	ldr r1, _08067790
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
_0806778C: .4byte gPlayerParty
_08067790: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_bufferpartypoke

	thumb_func_start ScrCmd_bufferitem
ScrCmd_bufferitem: @ 8067794
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
	ldr r1, _080677C4
	lsls r4, 2
	adds r4, r1
	ldr r1, [r4]
	bl CopyItemName
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677C4: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_bufferitem

	thumb_func_start ScrCmd_bufferdecor
ScrCmd_bufferdecor: @ 80677C8
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
	ldr r0, _080677FC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsrs r1, 11
	ldr r2, _08067800
	adds r1, r2
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677FC: .4byte gUnknown_083762F0
_08067800: .4byte 0x083f7bf1
	thumb_func_end ScrCmd_bufferdecor

	thumb_func_start ScrCmd_bufferattack
ScrCmd_bufferattack: @ 8067804
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
	ldr r1, _0806783C
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xD
	muls r1, r0
	ldr r0, _08067840
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806783C: .4byte gUnknown_083762F0
_08067840: .4byte gMoveNames
	thumb_func_end ScrCmd_bufferattack

	thumb_func_start ScrCmd_buffernum
ScrCmd_buffernum: @ 8067844
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
	ldr r0, _08067884
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
_08067884: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_buffernum

	thumb_func_start ScrCmd_bufferstd
ScrCmd_bufferstd: @ 8067888
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
	ldr r1, _080678C0
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	ldr r1, _080678C4
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
_080678C0: .4byte gUnknown_083762F0
_080678C4: .4byte gUnknown_083CE048
	thumb_func_end ScrCmd_bufferstd

	thumb_func_start ScrCmd_buffertext
ScrCmd_buffertext: @ 80678C8
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _080678EC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080678EC: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_buffertext

	thumb_func_start ScrCmd_vloadptr
ScrCmd_vloadptr: @ 80678F0
	push {lr}
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _0806790C
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _08067910
	bl StringExpandPlaceholders
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806790C: .4byte gUnknown_0202E8B0
_08067910: .4byte gStringVar4
	thumb_func_end ScrCmd_vloadptr

	thumb_func_start ScrCmd_vbuffer
ScrCmd_vbuffer: @ 8067914
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, _08067940
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _08067944
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067940: .4byte gUnknown_0202E8B0
_08067944: .4byte gUnknown_083762F0
	thumb_func_end ScrCmd_vbuffer

	thumb_func_start ScrCmd_givepokemon
ScrCmd_givepokemon: @ 8067948
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
	ldr r4, _080679C4
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
_080679C4: .4byte gScriptResult
	thumb_func_end ScrCmd_givepokemon

	thumb_func_start ScrCmd_giveegg
ScrCmd_giveegg: @ 80679C8
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080679F0
	bl ScriptGiveEgg
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080679F0: .4byte gScriptResult
	thumb_func_end ScrCmd_giveegg

	thumb_func_start ScrCmd_setpokemove
ScrCmd_setpokemove: @ 80679F4
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
ScrCmd_checkattack: @ 8067A20
	push {r4-r7,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _08067A34
	movs r0, 0x6
	strh r0, [r1]
	movs r6, 0
	b _08067A6E
	.align 2, 0
_08067A34: .4byte gScriptResult
_08067A38:
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _08067A68
	adds r0, r4, 0
	adds r1, r7, 0
	bl pokemon_has_move
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067A68
	ldr r0, _08067A60
	strh r6, [r0]
	ldr r0, _08067A64
	strh r5, [r0]
	b _08067A8E
	.align 2, 0
_08067A60: .4byte gScriptResult
_08067A64: .4byte gSpecialVar_0x8004
_08067A68:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_08067A6E:
	cmp r6, 0x5
	bhi _08067A8E
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08067A98
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _08067A38
_08067A8E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067A98: .4byte gPlayerParty
	thumb_func_end ScrCmd_checkattack

	thumb_func_start ScrCmd_givemoney
ScrCmd_givemoney: @ 8067A9C
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _08067ABA
	ldr r0, _08067AC4
	adds r1, r2, 0
	bl sub_80B79B8
_08067ABA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067AC4: .4byte 0x02025bc4
	thumb_func_end ScrCmd_givemoney

	thumb_func_start ScrCmd_paymoney
ScrCmd_paymoney: @ 8067AC8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _08067AE6
	ldr r0, _08067AF0
	adds r1, r2, 0
	bl sub_80B79E0
_08067AE6:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067AF0: .4byte 0x02025bc4
	thumb_func_end ScrCmd_paymoney

	thumb_func_start ScrCmd_checkmoney
ScrCmd_checkmoney: @ 8067AF4
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _08067B22
	ldr r4, _08067B2C
	ldr r0, _08067B30
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r2, 0
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_08067B22:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B2C: .4byte gScriptResult
_08067B30: .4byte gSaveBlock1
	thumb_func_end ScrCmd_checkmoney

	thumb_func_start ScrCmd_showmoney
ScrCmd_showmoney: @ 8067B34
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
	bne _08067B60
	ldr r0, _08067B68
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7C14
_08067B60:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B68: .4byte gSaveBlock1
	thumb_func_end ScrCmd_showmoney

	thumb_func_start ScrCmd_hidemoney
ScrCmd_hidemoney: @ 8067B6C
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
ScrCmd_updatemoney: @ 8067B88
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
	bne _08067BB4
	ldr r0, _08067BBC
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7BEC
_08067BB4:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067BBC: .4byte gSaveBlock1
	thumb_func_end ScrCmd_updatemoney

	thumb_func_start ScrCmd_showcoins
ScrCmd_showcoins: @ 8067BC0
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _08067BE4
	ldr r3, _08067BE8
	adds r0, r3
	ldrh r0, [r0]
	bl ShowCoinsWindow
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067BE4: .4byte gSaveBlock1
_08067BE8: .4byte 0x00000494
	thumb_func_end ScrCmd_showcoins

	thumb_func_start ScrCmd_hidecoins
ScrCmd_hidecoins: @ 8067BEC
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
ScrCmd_updatecoins: @ 8067C08
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _08067C2C
	ldr r3, _08067C30
	adds r0, r3
	ldrh r0, [r0]
	bl UpdateCoinsWindow
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067C2C: .4byte gSaveBlock1
_08067C30: .4byte 0x00000494
	thumb_func_end ScrCmd_updatecoins

	thumb_func_start ScrCmd_trainerbattle
ScrCmd_trainerbattle: @ 8067C34
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
ScrCmd_reptrainerbattle: @ 8067C48
	push {lr}
	bl sub_80825E4
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_reptrainerbattle

	thumb_func_start ScrCmd_endtrainerbattle
ScrCmd_endtrainerbattle: @ 8067C54
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
ScrCmd_endtrainerbattle2: @ 8067C68
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
ScrCmd_checktrainerflag: @ 8067C7C
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
ScrCmd_cleartrainerflag: @ 8067CA0
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
ScrCmd_settrainerflag: @ 8067CBC
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
ScrCmd_setwildbattle: @ 8067CD8
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
ScrCmd_dowildbattle: @ 8067D0C
	push {lr}
	bl sub_8081B3C
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_dowildbattle

	thumb_func_start ScrCmd_pokemart
ScrCmd_pokemart: @ 8067D1C
	push {lr}
	bl ScriptReadWord
	bl CreatePokemartMenu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemart

	thumb_func_start ScrCmd_pokemartdecor
ScrCmd_pokemartdecor: @ 8067D30
	push {lr}
	bl ScriptReadWord
	bl CreateDecorationShop1Menu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartdecor

	thumb_func_start ScrCmd_pokemartbp
ScrCmd_pokemartbp: @ 8067D44
	push {lr}
	bl ScriptReadWord
	bl CreateDecorationShop2Menu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_pokemartbp

	thumb_func_start ScrCmd_pokecasino
ScrCmd_pokecasino: @ 8067D58
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08067D7C
	bl PlaySlotMachine
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067D7C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end ScrCmd_pokecasino

	thumb_func_start ScrCmd_event_8a
ScrCmd_event_8a: @ 8067D80
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
	bne _08067DA8
	adds r0, r5, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
	b _08067DB4
_08067DA8:
	adds r0, r5, 0
	adds r1, r3, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
_08067DB4:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_event_8a

	thumb_func_start ScrCmd_event_96
ScrCmd_event_96: @ 8067DBC
	push {r4,lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08067DE4
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
_08067DE4: .4byte gScriptResult
	thumb_func_end ScrCmd_event_96

	thumb_func_start ScrCmd_choosecontestpkmn
ScrCmd_choosecontestpkmn: @ 8067DE8
	push {lr}
	bl sub_80F99CC
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_choosecontestpkmn

	thumb_func_start ScrCmd_startcontest
ScrCmd_startcontest: @ 8067DF8
	push {lr}
	bl sub_80C48C8
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_startcontest

	thumb_func_start ScrCmd_showcontestresults
ScrCmd_showcontestresults: @ 8067E08
	push {lr}
	bl sub_80C4940
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_showcontestresults

	thumb_func_start ScrCmd_contestlinktransfer
ScrCmd_contestlinktransfer: @ 8067E18
	push {lr}
	ldr r0, _08067E2C
	ldrb r0, [r0]
	bl sub_80C4980
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067E2C: .4byte gScriptContestCategory
	thumb_func_end ScrCmd_contestlinktransfer

	thumb_func_start ScrCmd_doanimation
ScrCmd_doanimation: @ 8067E30
	push {lr}
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08067E54
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl FieldEffectStart
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067E54: .4byte gUnknown_0202E8BC
	thumb_func_end ScrCmd_doanimation

	thumb_func_start ScrCmd_setanimation
ScrCmd_setanimation: @ 8067E58
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067E84
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
_08067E84: .4byte gUnknown_0202FF84
	thumb_func_end ScrCmd_setanimation

	thumb_func_start sub_8067B48
sub_8067B48: @ 8067E88
	push {lr}
	ldr r0, _08067E9C
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
ScrCmd_checkanimation: @ 8067EA8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadHalfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067ECC
	strh r0, [r1]
	ldr r1, _08067ED0
	adds r0, r4, 0
	bl SetupNativeScript
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067ECC: .4byte gUnknown_0202E8BC
_08067ED0: .4byte sub_8067B48
	thumb_func_end ScrCmd_checkanimation

	thumb_func_start ScrCmd_sethealplace
ScrCmd_sethealplace: @ 8067ED4
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
ScrCmd_checkgender: @ 8067EF0
	ldr r0, _08067EFC
	ldr r1, _08067F00
	ldrb r1, [r1, 0x8]
	strh r1, [r0]
	movs r0, 0
	bx lr
	.align 2, 0
_08067EFC: .4byte gScriptResult
_08067F00: .4byte gSaveBlock2
	thumb_func_end ScrCmd_checkgender

	thumb_func_start ScrCmd_pokecry
ScrCmd_pokecry: @ 8067F04
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
ScrCmd_waitpokecry: @ 8067F3C
	push {lr}
	ldr r1, _08067F4C
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067F4C: .4byte IsCryFinished
	thumb_func_end ScrCmd_waitpokecry

	thumb_func_start ScrCmd_setmaptile
ScrCmd_setmaptile: @ 8067F50
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
	bne _08067FB4
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl MapGridSetMetatileIdAt
	b _08067FC6
_08067FB4:
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r2, r7, 0
	orrs r2, r0
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08067FC6:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_setmaptile

	thumb_func_start ScrCmd_setdooropened
ScrCmd_setdooropened: @ 8067FD0
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
ScrCmd_setdoorclosed: @ 8068028
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
ScrCmd_doorchange: @ 8068084
	push {lr}
	ldr r1, _08068094
	bl SetupNativeScript
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08068094: .4byte IsDoorAnimationStopped
	thumb_func_end ScrCmd_doorchange

	thumb_func_start ScrCmd_setdooropened2
ScrCmd_setdooropened2: @ 8068098
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
ScrCmd_setdoorclosed2: @ 80680DC
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
ScrCmd_event_b1: @ 8068120
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
ScrCmd_event_b2: @ 806818C
	push {lr}
	bl ScriptShowElevatorMenu
	bl ScriptContext1_Stop
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end ScrCmd_event_b2

	thumb_func_start ScrCmd_checkcoins
ScrCmd_checkcoins: @ 806819C
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
ScrCmd_givecoins: @ 80681BC
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
	bne _080681E4
	ldr r1, _080681E0
	movs r0, 0
	b _080681E8
	.align 2, 0
_080681E0: .4byte gScriptResult
_080681E4:
	ldr r1, _080681F0
	movs r0, 0x1
_080681E8:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080681F0: .4byte gScriptResult
	thumb_func_end ScrCmd_givecoins

	thumb_func_start ScrCmd_removecoins
ScrCmd_removecoins: @ 80681F4
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
	bne _0806821C
	ldr r1, _08068218
	movs r0, 0
	b _08068220
	.align 2, 0
_08068218: .4byte gScriptResult
_0806821C:
	ldr r1, _08068228
	movs r0, 0x1
_08068220:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08068228: .4byte gScriptResult
	thumb_func_end ScrCmd_removecoins

	.align 2, 0 @ Don't pad with nop.
