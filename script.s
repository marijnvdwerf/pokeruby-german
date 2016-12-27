	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start InitScriptContext
InitScriptContext: @ 80656D4
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
_080656EE:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080656EE
	adds r1, r3, 0
	adds r1, 0xC
	movs r2, 0
	adds r0, r3, 0
	adds r0, 0x58
_08065702:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _08065702
	pop {r0}
	bx r0
	thumb_func_end InitScriptContext

	thumb_func_start SetupBytecodeScript
SetupBytecodeScript: @ 8065710
	str r1, [r0, 0x8]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	movs r0, 0x1
	bx lr
	thumb_func_end SetupBytecodeScript

	thumb_func_start SetupNativeScript
SetupNativeScript: @ 806571C
	movs r2, 0x2
	strb r2, [r0, 0x1]
	str r1, [r0, 0x4]
	bx lr
	thumb_func_end SetupNativeScript

	thumb_func_start StopScript
StopScript: @ 8065724
	movs r1, 0
	strb r1, [r0, 0x1]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end StopScript

	thumb_func_start RunScript
RunScript: @ 806572C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _0806573A
_08065736:
	movs r0, 0
	b _080657AC
_0806573A:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _08065772
	cmp r0, 0x1
	bgt _0806574A
	cmp r0, 0
	beq _08065736
	b _080657AA
_0806574A:
	cmp r0, 0x2
	bne _080657AA
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _0806576E
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080657AA
	strb r0, [r4, 0x1]
	b _080657AA
_08065764:
	strb r2, [r4, 0x1]
	b _08065736
_08065768:
	movs r0, 0
	strb r0, [r4, 0x1]
	b _080657AC
_0806576E:
	movs r0, 0x1
	strb r0, [r4, 0x1]
_08065772:
	ldr r2, [r4, 0x8]
	cmp r2, 0
	beq _08065764
	ldr r0, _08065784
	ldr r0, [r0]
	cmp r2, r0
	bne _08065788
_08065780:
	swi 0x2
	b _08065780
	.align 2, 0
_08065784: .4byte gUnknown_083762D8
_08065788:
	ldrb r1, [r2]
	adds r0, r2, 0x1
	str r0, [r4, 0x8]
	lsls r1, 2
	ldr r0, [r4, 0x5C]
	adds r1, r0, r1
	ldr r0, [r4, 0x60]
	cmp r1, r0
	bcs _08065768
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08065772
_080657AA:
	movs r0, 0x1
_080657AC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end RunScript

	thumb_func_start ScriptPush
ScriptPush: @ 80657B4
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r1, [r2]
	adds r0, r1, 0x1
	cmp r0, 0x13
	bgt _080657D6
	lsls r0, r1, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r1, r0
	str r3, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r0, 0
	b _080657D8
_080657D6:
	movs r0, 0x1
_080657D8:
	pop {r1}
	bx r1
	thumb_func_end ScriptPush

	thumb_func_start ScriptPop
ScriptPop: @ 80657DC
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r0, 0
	beq _080657F8
	subs r0, 0x1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	b _080657FA
_080657F8:
	movs r0, 0
_080657FA:
	pop {r1}
	bx r1
	thumb_func_end ScriptPop

	thumb_func_start ScriptJump
ScriptJump: @ 8065800
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end ScriptJump

	thumb_func_start ScriptCall
ScriptCall: @ 8065804
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
ScriptReturn: @ 8065818
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptPop
	str r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end ScriptReturn

	thumb_func_start ScriptReadHalfword
ScriptReadHalfword: @ 8065828
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
ScriptReadWord: @ 8065840
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
ScriptContext2_Enable: @ 8065870
	ldr r1, _08065878
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065878: .4byte 0x030006a4
	thumb_func_end ScriptContext2_Enable

	thumb_func_start ScriptContext2_Disable
ScriptContext2_Disable: @ 806587C
	ldr r1, _08065884
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065884: .4byte 0x030006a4
	thumb_func_end ScriptContext2_Disable

	thumb_func_start ScriptContext2_IsEnabled
ScriptContext2_IsEnabled: @ 8065888
	ldr r0, _08065890
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08065890: .4byte 0x030006a4
	thumb_func_end ScriptContext2_IsEnabled

	thumb_func_start ScriptContext1_Init
ScriptContext1_Init: @ 8065894
	push {lr}
	ldr r0, _080658AC
	ldr r1, _080658B0
	ldr r2, _080658B4
	bl InitScriptContext
	ldr r1, _080658B8
	movs r0, 0x2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080658AC: .4byte 0x030005b8
_080658B0: .4byte gScriptCmdTable
_080658B4: .4byte gScriptCmdTableEnd
_080658B8: .4byte 0x030005b0
	thumb_func_end ScriptContext1_Init

	thumb_func_start ScriptContext2_RunScript
ScriptContext2_RunScript: @ 80658BC
	push {r4,lr}
	ldr r4, _080658E0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080658F0
	cmp r0, 0x1
	beq _080658F0
	bl ScriptContext2_Enable
	ldr r0, _080658E4
	bl RunScript
	lsls r0, 24
	cmp r0, 0
	beq _080658E8
	movs r0, 0x1
	b _080658F2
	.align 2, 0
_080658E0: .4byte 0x030005b0
_080658E4: .4byte 0x030005b8
_080658E8:
	movs r0, 0x2
	strb r0, [r4]
	bl ScriptContext2_Disable
_080658F0:
	movs r0, 0
_080658F2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ScriptContext2_RunScript

	thumb_func_start ScriptContext1_SetupScript
ScriptContext1_SetupScript: @ 80658F8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08065920
	ldr r1, _08065924
	ldr r2, _08065928
	adds r0, r4, 0
	bl InitScriptContext
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetupBytecodeScript
	bl ScriptContext2_Enable
	ldr r1, _0806592C
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065920: .4byte 0x030005b8
_08065924: .4byte gScriptCmdTable
_08065928: .4byte gScriptCmdTableEnd
_0806592C: .4byte 0x030005b0
	thumb_func_end ScriptContext1_SetupScript

	thumb_func_start ScriptContext1_Stop
ScriptContext1_Stop: @ 8065930
	ldr r1, _08065938
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065938: .4byte 0x030005b0
	thumb_func_end ScriptContext1_Stop

	thumb_func_start EnableBothScriptContexts
EnableBothScriptContexts: @ 806593C
	push {lr}
	ldr r1, _0806594C
	movs r0, 0
	strb r0, [r1]
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0806594C: .4byte 0x030005b0
	thumb_func_end EnableBothScriptContexts

	thumb_func_start ScriptContext2_RunNewScript
ScriptContext2_RunNewScript: @ 8065950
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0806597C
	ldr r1, _08065980
	ldr r2, _08065984
	adds r0, r4, 0
	bl InitScriptContext
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetupBytecodeScript
_08065968:
	ldr r0, _0806597C
	bl RunScript
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08065968
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806597C: .4byte 0x03000630
_08065980: .4byte gScriptCmdTable
_08065984: .4byte gScriptCmdTableEnd
	thumb_func_end ScriptContext2_RunNewScript

	thumb_func_start mapheader_get_tagged_pointer
mapheader_get_tagged_pointer: @ 8065988
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080659A0
	ldr r2, [r0, 0x8]
	cmp r2, 0
	beq _0806599C
_08065996:
	ldrb r0, [r2]
	cmp r0, 0
	bne _080659A4
_0806599C:
	movs r0, 0
	b _080659C2
	.align 2, 0
_080659A0: .4byte gMapHeader
_080659A4:
	cmp r0, r1
	beq _080659AC
	adds r2, 0x5
	b _08065996
_080659AC:
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
_080659C2:
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_tagged_pointer

	thumb_func_start mapheader_run_script_by_tag
mapheader_run_script_by_tag: @ 80659C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	cmp r0, 0
	beq _080659DA
	bl ScriptContext2_RunNewScript
_080659DA:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_by_tag

	thumb_func_start mapheader_get_first_match_from_tagged_ptr_list
mapheader_get_first_match_from_tagged_ptr_list: @ 80659E0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	adds r6, r0, 0
	cmp r6, 0
	beq _080659FC
_080659F0:
	ldrb r1, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r1, r0
	cmp r1, 0
	bne _08065A00
_080659FC:
	movs r0, 0
	b _08065A3A
_08065A00:
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
	beq _08065A26
	adds r6, 0x4
	b _080659F0
_08065A26:
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
_08065A3A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_first_match_from_tagged_ptr_list

	thumb_func_start mapheader_run_script_with_tag_x1
mapheader_run_script_with_tag_x1: @ 8065A40
	push {lr}
	movs r0, 0x1
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x1

	thumb_func_start mapheader_run_script_with_tag_x3
mapheader_run_script_with_tag_x3: @ 8065A4C
	push {lr}
	movs r0, 0x3
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x3

	thumb_func_start mapheader_run_script_with_tag_x5
mapheader_run_script_with_tag_x5: @ 8065A58
	push {lr}
	movs r0, 0x5
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x5

	thumb_func_start mapheader_run_script_with_tag_x6
mapheader_run_script_with_tag_x6: @ 8065A64
	push {lr}
	movs r0, 0x6
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x6

	thumb_func_start mapheader_run_first_tag2_script_list_match
mapheader_run_first_tag2_script_list_match: @ 8065A70
	push {lr}
	movs r0, 0x2
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _08065A84
	bl ScriptContext1_SetupScript
	movs r0, 0x1
	b _08065A86
_08065A84:
	movs r0, 0
_08065A86:
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match

	thumb_func_start mapheader_run_first_tag4_script_list_match
mapheader_run_first_tag4_script_list_match: @ 8065A8C
	push {lr}
	movs r0, 0x4
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _08065A9C
	bl ScriptContext2_RunNewScript
_08065A9C:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_first_tag4_script_list_match

	thumb_func_start CalculateRamScriptChecksum
CalculateRamScriptChecksum: @ 8065AA0
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _08065AC0
	ldr r3, _08065AC4
_08065AAA:
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, r4
	bls _08065AAA
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065AC0: .4byte 0x000003e7
_08065AC4: .4byte 0x02028dc8
	thumb_func_end CalculateRamScriptChecksum

	thumb_func_start ClearRamScript
ClearRamScript: @ 8065AC8
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _08065AE0
	ldr r2, _08065AE4
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08065AE0: .4byte 0x02028dc4
_08065AE4: .4byte 0x050000fb
	thumb_func_end ClearRamScript

	thumb_func_start InitRamScript
InitRamScript: @ 8065AE8
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
	ldr r4, _08065B34
	bl ClearRamScript
	ldr r0, _08065B38
	cmp r8, r0
	bhi _08065B3C
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
	b _08065B3E
	.align 2, 0
_08065B34: .4byte 0x02028dc8
_08065B38: .4byte 0x000003e3
_08065B3C:
	movs r0, 0
_08065B3E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end InitRamScript

	thumb_func_start GetRamScript
GetRamScript: @ 8065B4C
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r4, _08065B94
	ldr r6, _08065B98
	movs r0, 0
	str r0, [r6]
	ldrb r0, [r4]
	cmp r0, 0x33
	bne _08065BA4
	ldrb r1, [r4, 0x1]
	ldr r0, _08065B9C
	adds r2, r4, r0
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065BA4
	ldrb r1, [r4, 0x2]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065BA4
	ldrb r0, [r4, 0x3]
	cmp r0, r3
	bne _08065BA4
	bl CalculateRamScriptChecksum
	subs r1, r4, 0x4
	ldr r1, [r1]
	cmp r0, r1
	bne _08065BA0
	str r5, [r6]
	adds r0, r4, 0x4
	b _08065BA6
	.align 2, 0
_08065B94: .4byte 0x02028dc8
_08065B98: .4byte gUnknown_0202E8AC
_08065B9C: .4byte 0xffffc96c
_08065BA0:
	bl ClearRamScript
_08065BA4:
	adds r0, r5, 0
_08065BA6:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetRamScript

	.align 2, 0 @ Don't pad with nop.
