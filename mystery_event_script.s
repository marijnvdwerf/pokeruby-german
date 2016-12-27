	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_8126098
sub_8126098: @ 8126418
	push {r4,lr}
	adds r4, r3, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	lsrs r2, 16
	movs r3, 0x4
	ands r0, r3
	cmp r0, 0
	beq _08126444
	ands r1, r3
	cmp r1, 0
	beq _08126444
	ands r2, r3
	cmp r2, 0
	beq _08126444
	movs r0, 0x80
	ands r0, r4
	cmp r0, 0
	beq _08126444
	movs r0, 0x1
	b _08126446
_08126444:
	movs r0, 0
_08126446:
	pop {r4}
	pop {r1}
	bx r1
_0812644C:
	push {lr}
	ldr r0, _08126460
	thumb_func_end sub_8126098

	thumb_func_start sub_81260D0
sub_81260D0: @ 8126450
	ldr r1, _08126464
	bl StringExpandPlaceholders
	movs r0, 0x3
	bl sub_8126160
	pop {r0}
	bx r0
	.align 2, 0
_08126460: .4byte gStringVar4
_08126464: .4byte gOtherText_DataCannotUseVersion
	thumb_func_end sub_81260D0

	thumb_func_start sub_81260EC
sub_81260EC: @ 8126468
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08126490
	ldr r2, _08126494
	bl InitScriptContext
	adds r0, r4, 0
	adds r1, r5, 0
	bl SetupBytecodeScript
	str r5, [r4, 0x64]
	movs r0, 0
	str r0, [r4, 0x68]
	str r0, [r4, 0x6C]
	str r0, [r4, 0x70]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08126490: .4byte gScriptFuncs
_08126494: .4byte GameCubeMultiBoot_Hash
	thumb_func_end sub_81260EC

	thumb_func_start sub_812611C
sub_812611C: @ 8126498
	push {r4,lr}
	adds r4, r0, 0
	bl RunScript
	lsls r0, 24
	cmp r0, 0
	beq _081264B0
	ldr r0, [r4, 0x70]
	cmp r0, 0
	beq _081264B0
	movs r0, 0x1
	b _081264B2
_081264B0:
	movs r0, 0
_081264B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812611C

	thumb_func_start sub_812613C
sub_812613C: @ 81264B8
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _081264D8
	adds r0, r4, 0
	bl sub_81260EC
_081264C4:
	adds r0, r4, 0
	bl sub_812611C
	cmp r0, 0
	bne _081264C4
	ldr r0, [r4, 0x6C]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081264D8: .4byte gUnknown_02039288
	thumb_func_end sub_812613C

	thumb_func_start sub_8126160
sub_8126160: @ 81264DC
	ldr r1, _081264E4
	str r0, [r1, 0x6C]
	bx lr
	.align 2, 0
_081264E4: .4byte gUnknown_02039288
	thumb_func_end sub_8126160

	thumb_func_start sub_812616C
sub_812616C: @ 81264E8
	push {r4,lr}
	adds r4, r0, 0
	movs r3, 0
	movs r2, 0
	cmp r3, r1
	bcs _08126500
_081264F4:
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r3, r0
	adds r2, 0x1
	cmp r2, r1
	bcc _081264F4
_08126500:
	adds r0, r3, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812616C

	thumb_func_start sub_812618C
sub_812618C: @ 8126508
	adds r2, r0, 0
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	orrs r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	orrs r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	orrs r0, r1
	bx lr
	thumb_func_end sub_812618C

	thumb_func_start sub_81261A4
sub_81261A4: @ 8126520
	strb r1, [r0]
	lsrs r2, r1, 8
	strb r2, [r0, 0x1]
	lsrs r2, r1, 16
	strb r2, [r0, 0x2]
	lsrs r1, 24
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end sub_81261A4

	thumb_func_start unref_sub_81261B4
unref_sub_81261B4: @ 8126530
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _08126580
	ldrb r0, [r5, 0x11]
	cmp r0, 0xF
	bne _08126580
	adds r6, r5, 0
	adds r6, 0x12
	adds r0, r6, 0
	bl sub_812618C
	cmp r0, 0
	bne _08126580
	adds r0, r5, 0
	adds r0, 0x16
	bl sub_812618C
	adds r4, r0, 0
	subs r4, r7
	adds r4, r5
	adds r0, r5, 0
	adds r0, 0x1A
	bl sub_812618C
	adds r1, r0, 0
	subs r1, r7
	adds r1, r5
	subs r1, r4
	adds r0, r4, 0
	bl sub_812616C
	adds r1, r0, 0
	adds r0, r6, 0
	bl sub_81261A4
	movs r0, 0x1
	b _08126582
_08126580:
	movs r0, 0
_08126582:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_81261B4

	thumb_func_start unref_sub_812620C
unref_sub_812620C: @ 8126588
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	ldrb r0, [r5]
	cmp r0, 0x1
	bne _081265DC
	ldrb r0, [r5, 0x11]
	cmp r0, 0x10
	bne _081265DC
	adds r6, r5, 0
	adds r6, 0x12
	adds r0, r6, 0
	bl sub_812618C
	cmp r0, 0
	bne _081265DC
	adds r0, r5, 0
	adds r0, 0x16
	bl sub_812618C
	adds r4, r0, 0
	subs r4, r7
	adds r4, r5
	adds r0, r5, 0
	adds r0, 0x1A
	bl sub_812618C
	adds r1, r0, 0
	subs r1, r7
	adds r1, r5
	subs r1, r4
	adds r0, r4, 0
	bl sub_8041174
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r6, 0
	bl sub_81261A4
	movs r0, 0x1
	b _081265DE
_081265DC:
	movs r0, 0
_081265DE:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_812620C

	thumb_func_start sub_8126268
sub_8126268: @ 81265E4
	push {lr}
	movs r2, 0
	ldr r3, _08126600
	movs r1, 0
_081265EC:
	adds r0, r3, r1
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, 0xB
	bls _081265EC
	adds r0, r2, 0
	pop {r1}
	bx r1
	.align 2, 0
_08126600: .4byte 0x020291b4
	thumb_func_end sub_8126268

	thumb_func_start sub_8126288
sub_8126288: @ 8126604
	push {r4,lr}
	ldr r4, _08126630
	bl sub_8126268
	adds r1, r0, 0
	ldrb r0, [r4]
	cmp r0, 0
	beq _0812662C
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0812662C
	ldrh r0, [r4, 0x2]
	cmp r0, 0
	beq _0812662C
	cmp r1, 0
	beq _0812662C
	subs r0, r4, 0x4
	ldr r0, [r0]
	cmp r1, r0
	beq _08126634
_0812662C:
	movs r0, 0
	b _08126636
	.align 2, 0
_08126630: .4byte 0x020291b4
_08126634:
	movs r0, 0x1
_08126636:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8126288

	thumb_func_start sub_81262C0
sub_81262C0: @ 812663C
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08126658
	ldr r2, _0812665C
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08126658: .4byte 0x020291b0
_0812665C: .4byte 0x01000008
	thumb_func_end sub_81262C0

	thumb_func_start sub_81262E4
sub_81262E4: @ 8126660
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r3, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r5, r1, 0
	lsls r2, 16
	lsrs r2, 16
	adds r6, r2, 0
	cmp r3, 0
	beq _08126680
	cmp r1, 0
	beq _08126680
	cmp r2, 0
	bne _08126686
_08126680:
	bl sub_81262C0
	b _081266A6
_08126686:
	ldr r4, _081266AC
	movs r1, 0xEA
	lsls r1, 6
	adds r0, r4, r1
	strb r3, [r0]
	adds r1, 0x1
	adds r0, r4, r1
	strb r5, [r0]
	adds r1, 0x1
	adds r0, r4, r1
	strh r6, [r0]
	bl sub_8126268
	ldr r1, _081266B0
	adds r4, r1
	str r0, [r4]
_081266A6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081266AC: .4byte gSaveBlock1
_081266B0: .4byte 0x00003a7c
	thumb_func_end sub_81262E4

	thumb_func_start sub_8126338
sub_8126338: @ 81266B4
	push {r4,r5,lr}
	ldr r4, _081266C8
	bl sub_8126288
	cmp r0, 0
	bne _081266CC
	bl sub_81262C0
	movs r0, 0
	b _081266EA
	.align 2, 0
_081266C8: .4byte 0x020291b4
_081266CC:
	ldrh r5, [r4, 0x2]
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	strb r0, [r4, 0x1]
	lsls r0, 24
	cmp r0, 0
	bne _081266E0
	bl sub_81262C0
	b _081266E8
_081266E0:
	bl sub_8126268
	subs r1, r4, 0x4
	str r0, [r1]
_081266E8:
	adds r0, r5, 0
_081266EA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8126338

	thumb_func_start script_status_stop_and_ret_1
script_status_stop_and_ret_1: @ 81266F0
	push {lr}
	bl StopScript
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end script_status_stop_and_ret_1

	thumb_func_start sub_8126380
sub_8126380: @ 81266FC
	push {r4-r7,lr}
	adds r7, r0, 0
	bl ScriptReadWord
	str r0, [r7, 0x68]
	adds r0, r7, 0
	bl ScriptReadHalfword
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r7, 0
	bl ScriptReadWord
	adds r6, r0, 0
	adds r0, r7, 0
	bl ScriptReadHalfword
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r7, 0
	bl ScriptReadWord
	adds r3, r0, 0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_8126098
	cmp r0, 0x1
	bne _08126740
	str r0, [r7, 0x70]
	b _08126744
_08126740:
	bl _0812644C
_08126744:
	movs r0, 0x1
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8126380

	thumb_func_start sub_81263D0
sub_81263D0: @ 812674C
	movs r0, 0
	bx lr
	thumb_func_end sub_81263D0

	thumb_func_start sub_81263D4
sub_81263D4: @ 8126750
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	str r2, [r0, 0x6C]
	movs r0, 0
	bx lr
	thumb_func_end sub_81263D4

	thumb_func_start sub_81263E4
sub_81263E4: @ 8126760
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	ldr r1, [r4, 0x68]
	subs r0, r1
	ldr r1, [r4, 0x64]
	adds r1, r0, r1
	cmp r5, 0xFF
	beq _08126784
	ldr r0, [r4, 0x6C]
	cmp r5, r0
	bne _0812678A
_08126784:
	ldr r0, _08126794
	bl StringExpandPlaceholders
_0812678A:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08126794: .4byte gStringVar4
	thumb_func_end sub_81263E4

	thumb_func_start sub_812641C
sub_812641C: @ 8126798
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	ldr r1, [r4, 0x68]
	subs r0, r1
	ldr r1, [r4, 0x64]
	adds r0, r1
	bl ScriptContext2_RunNewScript
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_812641C

	thumb_func_start sub_8126438
sub_8126438: @ 81267B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	bl sub_80B4940
	mov r8, r0
	adds r0, r7, 0
	bl ScriptReadWord
	adds r4, r0, 0
	ldr r0, [r7, 0x68]
	subs r4, r0
	ldr r0, [r7, 0x64]
	adds r4, r0
	ldr r6, _08126800
	ldr r5, _08126804
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x7
	bl StringCopyN
	adds r0, r4, 0
	bl sub_80B48A8
	ldr r4, _08126808
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x7
	bl StringCopyN
	mov r0, r8
	cmp r0, 0
	bne _08126814
	ldr r0, _0812680C
	ldr r1, _08126810
	b _08126834
	.align 2, 0
_08126800: .4byte gStringVar1
_08126804: .4byte 0x02028894
_08126808: .4byte gStringVar2
_0812680C: .4byte gStringVar4
_08126810: .4byte gOtherText_BerryObtainedDadHasIt
_08126814:
	adds r0, r6, 0
	adds r1, r4, 0
	bl StringCompare
	cmp r0, 0
	beq _08126830
	ldr r0, _08126828
	ldr r1, _0812682C
	b _08126834
	.align 2, 0
_08126828: .4byte gStringVar4
_0812682C: .4byte gOtherText_BerryTransformed
_08126830:
	ldr r0, _08126850
	ldr r1, _08126854
_08126834:
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r7, 0x6C]
	bl sub_80B4940
	cmp r0, 0x1
	bne _0812685C
	ldr r0, _08126858
	movs r1, 0x1
	bl VarSet
	b _08126860
	.align 2, 0
_08126850: .4byte gStringVar4
_08126854: .4byte gOtherText_BerryAlreadyObtained
_08126858: .4byte 0x0000402d
_0812685C:
	movs r0, 0x1
	str r0, [r7, 0x6C]
_08126860:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8126438

	thumb_func_start sub_81264F0
sub_81264F0: @ 812686C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl GiveGiftRibbonToParty
	ldr r0, _08126898
	ldr r1, _0812689C
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126898: .4byte gStringVar4
_0812689C: .4byte gOtherText_SpecialRibbonReceived
	thumb_func_end sub_81264F0

	thumb_func_start sub_8126524
sub_8126524: @ 81268A0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r4, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	adds r0, r4, 0
	bl ScriptReadWord
	adds r5, r0, 0
	ldr r0, [r4, 0x68]
	subs r5, r0
	ldr r0, [r4, 0x64]
	adds r5, r0
	adds r0, r4, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r4, 0x68]
	subs r1, r0
	ldr r0, [r4, 0x64]
	adds r1, r0
	subs r1, r5
	lsls r1, 16
	lsrs r1, 16
	str r6, [sp]
	adds r0, r5, 0
	mov r2, r9
	mov r3, r8
	bl InitRamScript
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8126524

	thumb_func_start sub_812658C
sub_812658C: @ 8126908
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80690F0
	ldr r0, _08126924
	ldr r1, _08126928
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126924: .4byte gStringVar4
_08126928: .4byte gOtherText_DexUpgraded
	thumb_func_end sub_812658C

	thumb_func_start sub_81265B0
sub_81265B0: @ 812692C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	bl sub_80EB890
	ldr r0, _08126950
	ldr r1, _08126954
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126950: .4byte gStringVar4
_08126954: .4byte gOtherText_RareWordAdded
	thumb_func_end sub_81265B0

	thumb_func_start sub_81265DC
sub_81265DC: @ 8126958
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl ScriptReadHalfword
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81262E4
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81265DC

	thumb_func_start sub_8126608
sub_8126608: @ 8126984
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x88
	adds r6, r0, 0
	bl ScriptReadWord
	ldr r1, [r6, 0x68]
	subs r0, r1
	ldr r1, [r6, 0x64]
	adds r5, r0, r1
	movs r0, 0x64
	adds r0, r5
	mov r8, r0
	add r4, sp, 0x24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	bne _081269D4
	ldr r0, _081269CC
	ldr r1, _081269D0
	movs r2, 0xB
	bl StringCopyN
	b _081269DE
	.align 2, 0
_081269CC: .4byte gStringVar1
_081269D0: .4byte gSystemText_Egg
_081269D4:
	ldr r0, _081269F4
	ldr r1, _081269F8
	movs r2, 0xB
	bl StringCopyN
_081269DE:
	ldr r0, _081269FC
	ldrb r0, [r0]
	cmp r0, 0x6
	bne _08126A08
	ldr r0, _08126A00
	ldr r1, _08126A04
	bl StringExpandPlaceholders
	movs r0, 0x3
	b _08126A72
	.align 2, 0
_081269F4: .4byte gStringVar1
_081269F8: .4byte gSystemText_Pokemon2
_081269FC: .4byte gPlayerPartyCount
_08126A00: .4byte gStringVar4
_08126A04: .4byte gOtherText_PartyIsFull
_08126A08:
	ldr r7, _08126A84
	adds r0, r7, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	mov r0, sp
	mov r1, r8
	movs r2, 0x24
	bl memcpy
	movs r0, 0xCE
	lsls r0, 1
	cmp r4, r0
	beq _08126A42
	adds r0, r4, 0
	bl SpeciesToNationalPokedexNum
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_8090D90
_08126A42:
	adds r0, r7, 0
	movs r1, 0xC
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _08126A60
	adds r0, r7, 0
	mov r1, sp
	bl sub_80A2D88
_08126A60:
	bl party_compaction
	bl CalculatePlayerPartyCount
	ldr r0, _08126A88
	ldr r1, _08126A8C
	bl StringExpandPlaceholders
	movs r0, 0x2
_08126A72:
	str r0, [r6, 0x6C]
	movs r0, 0
	add sp, 0x88
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08126A84: .4byte 0x03004564
_08126A88: .4byte gStringVar4
_08126A8C: .4byte gOtherText_PokeWasSentOver
	thumb_func_end sub_8126608

	thumb_func_start sub_8126714
sub_8126714: @ 8126A90
	push {r4,lr}
	adds r4, r0, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r4, 0x68]
	subs r1, r0
	ldr r0, [r4, 0x64]
	adds r1, r0
	ldr r0, _08126AC4
	movs r2, 0xBC
	bl memcpy
	bl sub_813601C
	ldr r0, _08126AC8
	ldr r1, _08126ACC
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126AC4: .4byte 0x0202533c
_08126AC8: .4byte gStringVar4
_08126ACC: .4byte gOtherText_NewTrainerInHoenn
	thumb_func_end sub_8126714

	thumb_func_start sub_8126754
sub_8126754: @ 8126AD0
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80691BC
	ldr r0, _08126AEC
	ldr r1, _08126AF0
	bl StringExpandPlaceholders
	movs r0, 0x2
	str r0, [r4, 0x6C]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08126AEC: .4byte gStringVar4
_08126AF0: .4byte gSystemText_ClockAdjustmentUsable
	thumb_func_end sub_8126754

	thumb_func_start sub_8126778
sub_8126778: @ 8126AF4
	push {r4-r6,lr}
	adds r6, r0, 0
	bl ScriptReadWord
	adds r5, r0, 0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r4, r0, 0
	ldr r0, [r6, 0x68]
	subs r4, r0
	ldr r0, [r6, 0x64]
	adds r4, r0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r6, 0x68]
	subs r1, r0
	ldr r0, [r6, 0x64]
	adds r1, r0
	subs r1, r4
	adds r0, r4, 0
	bl sub_812616C
	cmp r5, r0
	beq _08126B32
	movs r0, 0
	str r0, [r6, 0x70]
	movs r0, 0x1
	str r0, [r6, 0x6C]
_08126B32:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8126778

	thumb_func_start sub_81267C0
sub_81267C0: @ 8126B3C
	push {r4-r6,lr}
	adds r6, r0, 0
	bl ScriptReadWord
	adds r5, r0, 0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r4, r0, 0
	ldr r0, [r6, 0x68]
	subs r4, r0
	ldr r0, [r6, 0x64]
	adds r4, r0
	adds r0, r6, 0
	bl ScriptReadWord
	adds r1, r0, 0
	ldr r0, [r6, 0x68]
	subs r1, r0
	ldr r0, [r6, 0x64]
	adds r1, r0
	subs r1, r4
	adds r0, r4, 0
	bl sub_8041174
	lsls r0, 16
	lsrs r0, 16
	cmp r5, r0
	beq _08126B7E
	movs r0, 0
	str r0, [r6, 0x70]
	movs r0, 0x1
	str r0, [r6, 0x6C]
_08126B7E:
	movs r0, 0x1
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_81267C0

	.align 2, 0 @ Don't pad with nop.
