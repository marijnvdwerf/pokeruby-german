	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start InitScriptContext
InitScriptContext: @ 8065394
	push {lr}
	adds r3, r0, 0
	movs r0, 0
	strb r0, [r3, 0x1]
	str r0, [r3, 0x8]
	strb r0, [r3]
	str r0, [r3, 0x4]
	str r1, [r3, 0x5C]
	str r2, [r3, 0x60]
	movs r2, 0
	movs r1, 0x3
	adds r0, r3, 0
	adds r0, 0x70
_080653AE:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080653AE
	adds r1, r3, 0
	adds r1, 0xC
	movs r2, 0
	adds r0, r3, 0
	adds r0, 0x58
_080653C2:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _080653C2
	pop {r0}
	bx r0
	thumb_func_end InitScriptContext

	thumb_func_start SetupBytecodeScript
SetupBytecodeScript: @ 80653D0
	str r1, [r0, 0x8]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	movs r0, 0x1
	bx lr
	thumb_func_end SetupBytecodeScript

	thumb_func_start SetupNativeScript
SetupNativeScript: @ 80653DC
	movs r2, 0x2
	strb r2, [r0, 0x1]
	str r1, [r0, 0x4]
	bx lr
	thumb_func_end SetupNativeScript

	thumb_func_start StopScript
StopScript: @ 80653E4
	movs r1, 0
	strb r1, [r0, 0x1]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end StopScript

	thumb_func_start RunScript
RunScript: @ 80653EC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080653FA
_080653F6:
	movs r0, 0
	b _0806546C
_080653FA:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _08065432
	cmp r0, 0x1
	bgt _0806540A
	cmp r0, 0
	beq _080653F6
	b _0806546A
_0806540A:
	cmp r0, 0x2
	bne _0806546A
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _0806542E
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806546A
	strb r0, [r4, 0x1]
	b _0806546A
_08065424:
	strb r2, [r4, 0x1]
	b _080653F6
_08065428:
	movs r0, 0
	strb r0, [r4, 0x1]
	b _0806546C
_0806542E:
	movs r0, 0x1
	strb r0, [r4, 0x1]
_08065432:
	ldr r2, [r4, 0x8]
	cmp r2, 0
	beq _08065424
	ldr r0, _08065444 @ =gUnknown_083762D8
	ldr r0, [r0]
	cmp r2, r0
	bne _08065448
_08065440:
	swi 0x2
	b _08065440
	.align 2, 0
_08065444: .4byte gUnknown_083762D8
_08065448:
	ldrb r1, [r2]
	adds r0, r2, 0x1
	str r0, [r4, 0x8]
	lsls r1, 2
	ldr r0, [r4, 0x5C]
	adds r1, r0, r1
	ldr r0, [r4, 0x60]
	cmp r1, r0
	bcs _08065428
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08065432
_0806546A:
	movs r0, 0x1
_0806546C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end RunScript

	thumb_func_start ScriptPush
ScriptPush: @ 8065474
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r1, [r2]
	adds r0, r1, 0x1
	cmp r0, 0x13
	bgt _08065496
	lsls r0, r1, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r1, r0
	str r3, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r0, 0
	b _08065498
_08065496:
	movs r0, 0x1
_08065498:
	pop {r1}
	bx r1
	thumb_func_end ScriptPush

	thumb_func_start ScriptPop
ScriptPop: @ 806549C
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r0, 0
	beq _080654B8
	subs r0, 0x1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	b _080654BA
_080654B8:
	movs r0, 0
_080654BA:
	pop {r1}
	bx r1
	thumb_func_end ScriptPop

	thumb_func_start ScriptJump
ScriptJump: @ 80654C0
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end ScriptJump

	thumb_func_start ScriptCall
ScriptCall: @ 80654C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, [r4, 0x8]
	bl ScriptPush
	str r5, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end ScriptCall

	thumb_func_start ScriptReturn
ScriptReturn: @ 80654D8
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptPop
	str r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ScriptReturn

	thumb_func_start ScriptReadHalfword
ScriptReadHalfword: @ 80654E8
	adds r3, r0, 0
	ldr r2, [r3, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r3, 0x8]
	ldrb r1, [r2]
	lsls r1, 8
	orrs r0, r1
	adds r2, 0x1
	str r2, [r3, 0x8]
	bx lr
	thumb_func_end ScriptReadHalfword

	thumb_func_start ScriptReadWord
ScriptReadWord: @ 8065500
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r5, [r0]
	adds r2, r0, 0x1
	str r2, [r3, 0x8]
	ldrb r4, [r0, 0x1]
	adds r1, r2, 0x1
	str r1, [r3, 0x8]
	ldrb r0, [r2, 0x1]
	adds r1, 0x1
	str r1, [r3, 0x8]
	lsls r0, 8
	adds r0, r4
	lsls r0, 8
	adds r0, r5
	lsls r0, 8
	adds r0, r6
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScriptReadWord

	thumb_func_start ScriptContext2_Enable
ScriptContext2_Enable: @ 8065530
	ldr r1, _08065538 @ =0x030006a4
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065538: .4byte 0x030006a4
	thumb_func_end ScriptContext2_Enable

	thumb_func_start ScriptContext2_Disable
ScriptContext2_Disable: @ 806553C
	ldr r1, _08065544 @ =0x030006a4
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065544: .4byte 0x030006a4
	thumb_func_end ScriptContext2_Disable

	thumb_func_start ScriptContext2_IsEnabled
ScriptContext2_IsEnabled: @ 8065548
	ldr r0, _08065550 @ =0x030006a4
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08065550: .4byte 0x030006a4
	thumb_func_end ScriptContext2_IsEnabled

	thumb_func_start ScriptContext1_Init
ScriptContext1_Init: @ 8065554
	push {lr}
	ldr r0, _0806556C @ =0x030005b8
	ldr r1, _08065570 @ =gScriptCmdTable
	ldr r2, _08065574 @ =gScriptCmdTableEnd
	bl InitScriptContext
	ldr r1, _08065578 @ =0x030005b0
	movs r0, 0x2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806556C: .4byte 0x030005b8
_08065570: .4byte gScriptCmdTable
_08065574: .4byte gScriptCmdTableEnd
_08065578: .4byte 0x030005b0
	thumb_func_end ScriptContext1_Init

	thumb_func_start ScriptContext2_RunScript
ScriptContext2_RunScript: @ 806557C
	push {r4,lr}
	ldr r4, _080655A0 @ =0x030005b0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080655B0
	cmp r0, 0x1
	beq _080655B0
	bl ScriptContext2_Enable
	ldr r0, _080655A4 @ =0x030005b8
	bl RunScript
	lsls r0, 24
	cmp r0, 0
	beq _080655A8
	movs r0, 0x1
	b _080655B2
	.align 2, 0
_080655A0: .4byte 0x030005b0
_080655A4: .4byte 0x030005b8
_080655A8:
	movs r0, 0x2
	strb r0, [r4]
	bl ScriptContext2_Disable
_080655B0:
	movs r0, 0
_080655B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScriptContext2_RunScript

	thumb_func_start ScriptContext1_SetupScript
ScriptContext1_SetupScript: @ 80655B8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080655E0 @ =0x030005b8
	ldr r1, _080655E4 @ =gScriptCmdTable
	ldr r2, _080655E8 @ =gScriptCmdTableEnd
	adds r0, r4, 0
	bl InitScriptContext
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetupBytecodeScript
	bl ScriptContext2_Enable
	ldr r1, _080655EC @ =0x030005b0
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080655E0: .4byte 0x030005b8
_080655E4: .4byte gScriptCmdTable
_080655E8: .4byte gScriptCmdTableEnd
_080655EC: .4byte 0x030005b0
	thumb_func_end ScriptContext1_SetupScript

	thumb_func_start ScriptContext1_Stop
ScriptContext1_Stop: @ 80655F0
	ldr r1, _080655F8 @ =0x030005b0
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080655F8: .4byte 0x030005b0
	thumb_func_end ScriptContext1_Stop

	thumb_func_start EnableBothScriptContexts
EnableBothScriptContexts: @ 80655FC
	push {lr}
	ldr r1, _0806560C @ =0x030005b0
	movs r0, 0
	strb r0, [r1]
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0806560C: .4byte 0x030005b0
	thumb_func_end EnableBothScriptContexts

	thumb_func_start ScriptContext2_RunNewScript
ScriptContext2_RunNewScript: @ 8065610
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0806563C @ =0x03000630
	ldr r1, _08065640 @ =gScriptCmdTable
	ldr r2, _08065644 @ =gScriptCmdTableEnd
	adds r0, r4, 0
	bl InitScriptContext
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetupBytecodeScript
_08065628:
	ldr r0, _0806563C @ =0x03000630
	bl RunScript
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08065628
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806563C: .4byte 0x03000630
_08065640: .4byte gScriptCmdTable
_08065644: .4byte gScriptCmdTableEnd
	thumb_func_end ScriptContext2_RunNewScript

	thumb_func_start mapheader_get_tagged_pointer
mapheader_get_tagged_pointer: @ 8065648
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08065660 @ =gMapHeader
	ldr r2, [r0, 0x8]
	cmp r2, 0
	beq _0806565C
_08065656:
	ldrb r0, [r2]
	cmp r0, 0
	bne _08065664
_0806565C:
	movs r0, 0
	b _08065682
	.align 2, 0
_08065660: .4byte gMapHeader
_08065664:
	cmp r0, r1
	beq _0806566C
	adds r2, 0x5
	b _08065656
_0806566C:
	adds r2, 0x1
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	adds r0, r1
_08065682:
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_tagged_pointer

	thumb_func_start mapheader_run_script_by_tag
mapheader_run_script_by_tag: @ 8065688
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	cmp r0, 0
	beq _0806569A
	bl ScriptContext2_RunNewScript
_0806569A:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_by_tag

	thumb_func_start mapheader_get_first_match_from_tagged_ptr_list
mapheader_get_first_match_from_tagged_ptr_list: @ 80656A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	adds r6, r0, 0
	cmp r6, 0
	beq _080656BC
_080656B0:
	ldrb r1, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r1, r0
	cmp r1, 0
	bne _080656C0
_080656BC:
	movs r0, 0
	b _080656FA
_080656C0:
	adds r6, 0x2
	ldrb r5, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r5, r0
	adds r6, 0x2
	adds r0, r1, 0
	bl VarGet
	adds r4, r0, 0
	adds r0, r5, 0
	bl VarGet
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	beq _080656E6
	adds r6, 0x4
	b _080656B0
_080656E6:
	ldrb r0, [r6]
	ldrb r1, [r6, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r6, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r6, 0x3]
	lsls r1, 24
	adds r0, r1
_080656FA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_first_match_from_tagged_ptr_list

	thumb_func_start mapheader_run_script_with_tag_x1
mapheader_run_script_with_tag_x1: @ 8065700
	push {lr}
	movs r0, 0x1
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x1

	thumb_func_start mapheader_run_script_with_tag_x3
mapheader_run_script_with_tag_x3: @ 806570C
	push {lr}
	movs r0, 0x3
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x3

	thumb_func_start mapheader_run_script_with_tag_x5
mapheader_run_script_with_tag_x5: @ 8065718
	push {lr}
	movs r0, 0x5
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x5

	thumb_func_start mapheader_run_script_with_tag_x6
mapheader_run_script_with_tag_x6: @ 8065724
	push {lr}
	movs r0, 0x6
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x6

	thumb_func_start mapheader_run_first_tag2_script_list_match
mapheader_run_first_tag2_script_list_match: @ 8065730
	push {lr}
	movs r0, 0x2
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _08065744
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08065746
_08065744:
	movs r0, 0
_08065746:
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match

	thumb_func_start mapheader_run_first_tag4_script_list_match
mapheader_run_first_tag4_script_list_match: @ 806574C
	push {lr}
	movs r0, 0x4
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _0806575C
	bl ScriptContext2_RunNewScript
_0806575C:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_first_tag4_script_list_match

	thumb_func_start CalculateRamScriptChecksum
CalculateRamScriptChecksum: @ 8065760
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _08065780 @ =0x000003e7
	ldr r3, _08065784 @ =0x02028dc8
_0806576A:
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, r4
	bls _0806576A
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065780: .4byte 0x000003e7
_08065784: .4byte 0x02028dc8
	thumb_func_end CalculateRamScriptChecksum

	thumb_func_start ClearRamScript
ClearRamScript: @ 8065788
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _080657A0 @ =0x02028dc4
	ldr r2, _080657A4 @ =0x050000fb
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080657A0: .4byte 0x02028dc4
_080657A4: .4byte 0x050000fb
	thumb_func_end ClearRamScript

	thumb_func_start InitRamScript
InitRamScript: @ 80657A8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	ldr r0, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080657F4 @ =0x02028dc8
	bl ClearRamScript
	ldr r0, _080657F8 @ =0x000003e3
	cmp r8, r0
	bhi _080657FC
	movs r0, 0x33
	strb r0, [r4]
	strb r7, [r4, 0x1]
	strb r6, [r4, 0x2]
	strb r5, [r4, 0x3]
	adds r0, r4, 0x4
	mov r1, r9
	mov r2, r8
	bl memcpy
	bl CalculateRamScriptChecksum
	subs r1, r4, 0x4
	str r0, [r1]
	movs r0, 0x1
	b _080657FE
	.align 2, 0
_080657F4: .4byte 0x02028dc8
_080657F8: .4byte 0x000003e3
_080657FC:
	movs r0, 0
_080657FE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end InitRamScript

	thumb_func_start GetRamScript
GetRamScript: @ 806580C
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r4, _08065854 @ =0x02028dc8
	ldr r6, _08065858 @ =gUnknown_0202E8AC
	movs r0, 0
	str r0, [r6]
	ldrb r0, [r4]
	cmp r0, 0x33
	bne _08065864
	ldrb r1, [r4, 0x1]
	ldr r0, _0806585C @ =0xffffc96c
	adds r2, r4, r0
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065864
	ldrb r1, [r4, 0x2]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065864
	ldrb r0, [r4, 0x3]
	cmp r0, r3
	bne _08065864
	bl CalculateRamScriptChecksum
	subs r1, r4, 0x4
	ldr r1, [r1]
	cmp r0, r1
	bne _08065860
	str r5, [r6]
	adds r0, r4, 0x4
	b _08065866
	.align 2, 0
_08065854: .4byte 0x02028dc8
_08065858: .4byte gUnknown_0202E8AC
_0806585C: .4byte 0xffffc96c
_08065860:
	bl ClearRamScript
_08065864:
	adds r0, r5, 0
_08065866:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetRamScript

	.align 2, 0 @ Don't pad with nop.
