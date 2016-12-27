	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80BB4AC
sub_80BB4AC: @ 80BB640
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r3, r0, 0
	movs r0, 0
	strb r0, [r3]
	movs r2, 0
	adds r4, r3, 0x2
	movs r5, 0xFF
_080BB658:
	adds r0, r4, r2
	ldrb r1, [r0]
	orrs r1, r5
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x6
	bls _080BB658
	movs r2, 0
	adds r5, r3, 0
	adds r5, 0x12
	adds r6, r3, 0
	adds r6, 0x22
	adds r7, r3, 0
	adds r7, 0x4C
	adds r0, r3, 0
	adds r0, 0x34
	str r0, [sp]
	adds r1, r3, 0
	adds r1, 0x9A
	str r1, [sp, 0x4]
	movs r0, 0x7C
	adds r0, r3
	mov r10, r0
	movs r1, 0x88
	adds r1, r3
	mov r9, r1
	movs r0, 0x94
	adds r0, r3
	mov r8, r0
	adds r1, r3, 0
	adds r1, 0x9
	movs r4, 0
_080BB69C:
	adds r0, r1, r2
	strb r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080BB69C
	movs r0, 0
	movs r1, 0
	strh r1, [r3, 0xE]
	strb r0, [r3, 0x10]
	strb r0, [r3, 0x11]
	movs r0, 0
	strb r0, [r3, 0x1]
	movs r2, 0
	adds r4, r5, 0
	adds r3, r6, 0
_080BB6BE:
	adds r0, r4, r2
	strb r1, [r0]
	adds r0, r3, r2
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xF
	bls _080BB6BE
	movs r2, 0
	mov r12, r7
	movs r5, 0
_080BB6D6:
	movs r1, 0
	adds r7, r2, 0x1
	lsls r4, r2, 2
	lsls r6, r2, 1
	adds r3, r4, 0
_080BB6E0:
	adds r0, r3, r1
	lsls r0, 1
	add r0, r12
	strh r5, [r0]
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x3
	bls _080BB6E0
	ldr r1, [sp]
	adds r0, r1, r4
	str r5, [r0]
	ldr r1, [sp, 0x4]
	adds r0, r1, r2
	strb r5, [r0]
	mov r1, r10
	adds r0, r1, r6
	strh r5, [r0]
	mov r1, r9
	adds r0, r1, r6
	strh r5, [r0]
	mov r1, r8
	adds r0, r1, r2
	strb r5, [r0]
	lsls r0, r7, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080BB6D6
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB4AC

	thumb_func_start sub_80BB594
sub_80BB594: @ 80BB728
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	ldr r1, _080BB744
	adds r0, r1
	bl sub_80BB4AC
	pop {r0}
	bx r0
	.align 2, 0
_080BB744: .4byte 0x0202713c
	thumb_func_end sub_80BB594

	thumb_func_start sub_80BB5B4
sub_80BB5B4: @ 80BB748
	push {r4,lr}
	movs r4, 0
_080BB74C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BB594
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080BB74C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB5B4

	thumb_func_start sub_80BB5D0
sub_80BB5D0: @ 80BB764
	ldr r0, _080BB770
	ldr r1, _080BB774
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_080BB770: .4byte gUnknown_020387DC
_080BB774: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80BB5D0

	thumb_func_start sub_80BB5E4
sub_80BB5E4: @ 80BB778
	push {r4,lr}
	ldr r0, _080BB788
	movs r1, 0
	strh r1, [r0]
	movs r3, 0
	adds r4, r0, 0
	b _080BB792
	.align 2, 0
_080BB788: .4byte gScriptResult
_080BB78C:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
_080BB792:
	cmp r3, 0x13
	bhi _080BB7BA
	ldr r2, _080BB7C0
	ldr r1, _080BB7C4
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r1
	ldr r1, _080BB7C8
	adds r0, r1
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080BB78C
	movs r0, 0x1
	strh r0, [r4]
	ldr r0, _080BB7CC
	adds r1, r3, 0
	bl VarSet
_080BB7BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB7C0: .4byte gUnknown_020387DC
_080BB7C4: .4byte gSaveBlock1
_080BB7C8: .4byte 0x00001a08
_080BB7CC: .4byte 0x00004054
	thumb_func_end sub_80BB5E4

	thumb_func_start sub_80BB63C
sub_80BB63C: @ 80BB7D0
	push {lr}
	ldr r0, _080BB7E8
	ldr r1, _080BB7EC
	adds r0, r1
	ldrb r1, [r0]
	cmp r1, 0
	beq _080BB7F4
	ldr r1, _080BB7F0
	movs r0, 0x1
	strh r0, [r1]
	b _080BB7F8
	.align 2, 0
_080BB7E8: .4byte gSaveBlock1
_080BB7EC: .4byte 0x00001a08
_080BB7F0: .4byte gScriptResult
_080BB7F4:
	ldr r0, _080BB7FC
	strh r1, [r0]
_080BB7F8:
	pop {r0}
	bx r0
	.align 2, 0
_080BB7FC: .4byte gScriptResult
	thumb_func_end sub_80BB63C

	thumb_func_start sub_80BB66C
sub_80BB66C: @ 80BB800
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	ldr r2, _080BB838
	adds r0, r2, 0
	ands r1, r0
	adds r0, r1, 0
	subs r0, 0x90
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB83C
	movs r0, 0x1
	b _080BB896
	.align 2, 0
_080BB838: .4byte 0x00000fff
_080BB83C:
	adds r0, r1, 0
	subs r0, 0x92
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB84C
	movs r0, 0x2
	b _080BB896
_080BB84C:
	adds r0, r1, 0
	subs r0, 0x9A
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB85C
	movs r0, 0x3
	b _080BB896
_080BB85C:
	adds r0, r1, 0
	subs r0, 0x94
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _080BB86C
	movs r0, 0x4
	b _080BB896
_080BB86C:
	adds r0, r1, 0
	subs r0, 0x96
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BB880
	cmp r1, 0x9C
	beq _080BB880
	cmp r1, 0x9D
	bne _080BB884
_080BB880:
	movs r0, 0x5
	b _080BB896
_080BB884:
	adds r0, r1, 0
	subs r0, 0x98
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _080BB894
	movs r0, 0
	b _080BB896
_080BB894:
	movs r0, 0x6
_080BB896:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BB66C

	thumb_func_start sub_80BB70C
sub_80BB70C: @ 80BB8A0
	push {r4,lr}
	ldr r4, _080BB8B4
	bl sub_80BB66C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BB8B4: .4byte gSpecialVar_0x8007
	thumb_func_end sub_80BB70C

	thumb_func_start unref_sub_80BB724
unref_sub_80BB724: @ 80BB8B8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	movs r2, 0
	ldr r6, _080BB8DC
	lsrs r3, r1, 24
	ldr r5, _080BB8E0
_080BB8C6:
	lsls r0, r2, 1
	adds r0, r4
	ldrh r1, [r0]
	adds r0, r6, 0
	ands r0, r1
	cmp r0, r3
	bne _080BB8E4
	lsls r0, r2, 16
	asrs r0, 16
	b _080BB8F2
	.align 2, 0
_080BB8DC: .4byte 0x00000fff
_080BB8E0: .4byte 0x000001ff
_080BB8E4:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, r5
	bls _080BB8C6
	movs r0, 0x1
	negs r0, r0
_080BB8F2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80BB724

	thumb_func_start sub_80BB764
sub_80BB764: @ 80BB8F8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	mov r9, r0
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	movs r0, 0
	mov r12, r0
	ldr r1, _080BB95C
	ldr r0, [r1]
	ldr r3, [r0, 0x4]
	cmp r12, r3
	bge _080BB982
	ldr r0, [r0]
	str r0, [sp, 0x4]
	str r3, [sp]
_080BB922:
	movs r2, 0
	mov r1, r12
	lsls r7, r1, 16
	ldr r0, [sp, 0x4]
	cmp r2, r0
	bge _080BB970
	ldr r0, _080BB95C
	ldr r1, [r0]
	asrs r0, r7, 16
	ldr r4, [r1]
	adds r6, r0, 0
	muls r6, r4
	ldr r5, [r1, 0xC]
_080BB93C:
	lsls r0, r2, 16
	asrs r3, r0, 16
	adds r0, r6, r3
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r0]
	ldr r0, _080BB960
	ands r0, r1
	cmp r0, r8
	bne _080BB964
	mov r1, r9
	strh r2, [r1]
	mov r1, r12
	mov r0, r10
	strh r1, [r0]
	b _080BB982
	.align 2, 0
_080BB95C: .4byte gMapHeader
_080BB960: .4byte 0x000003ff
_080BB964:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, r4
	blt _080BB93C
_080BB970:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r7, r1
	lsrs r1, r0, 16
	mov r12, r1
	asrs r0, 16
	ldr r1, [sp]
	cmp r0, r1
	blt _080BB922
_080BB982:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB764

	thumb_func_start sub_80BB800
sub_80BB800: @ 80BB994
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	movs r5, 0
	mov r12, r4
	lsls r0, 16
	asrs r3, r0, 16
	ldr r1, _080BB9E0
	mov r8, r1
	adds r7, r0, 0
	mov r4, sp
	mov r6, r12
_080BB9C8:
	ldr r0, _080BB9E0
	lsls r1, r5, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r3
	bne _080BB9E4
	movs r3, 0
	ldrsh r0, [r4, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	ldrh r3, [r2, 0x2]
	b _080BBA0C
	.align 2, 0
_080BB9E0: .4byte gUnknown_083D1358
_080BB9E4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080BB9C8
	movs r5, 0
	mov r4, sp
	mov r6, r12
_080BB9F4:
	lsls r0, r5, 2
	mov r1, r8
	adds r3, r0, r1
	ldrh r1, [r3, 0x2]
	asrs r0, r7, 16
	cmp r1, r0
	bne _080BBA26
	movs r2, 0
	ldrsh r0, [r4, r2]
	movs r5, 0
	ldrsh r1, [r6, r5]
	ldrh r3, [r3]
_080BBA0C:
	movs r5, 0xC0
	lsls r5, 4
	adds r2, r5, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0
	ldrsh r1, [r6, r2]
	bl CurrentMapDrawMetatileAt
	b _080BBA30
_080BBA26:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x6
	bls _080BB9F4
_080BBA30:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB800

	thumb_func_start sub_80BB8A8
sub_80BB8A8: @ 80BBA3C
	push {lr}
	adds r2, r0, 0
	movs r1, 0
_080BBA42:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BBA4E
	adds r0, r1, 0
	b _080BBA5A
_080BBA4E:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _080BBA42
	movs r0, 0x7
_080BBA5A:
	pop {r1}
	bx r1
	thumb_func_end sub_80BB8A8

	thumb_func_start sub_80BB8CC
sub_80BB8CC: @ 80BBA60
	push {r4-r6,lr}
	ldr r2, _080BBADC
	ldr r0, _080BBAE0
	ldrb r1, [r0]
	ldr r3, _080BBAE4
	adds r0, r2, r3
	strb r1, [r0]
	movs r3, 0
	ldr r0, _080BBAE8
	adds r2, r0
	ldr r4, _080BBAEC
_080BBA76:
	adds r1, r3, r2
	adds r0, r3, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x3
	bls _080BBA76
	ldr r0, _080BBAF0
	movs r1, 0
	bl VarSet
	ldr r6, _080BBAF4
	adds r0, r6, 0
	bl sub_80BB8A8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _080BBAF8
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x7
	bl memset
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl StringCopyN
	ldrb r0, [r6, 0x8]
	subs r5, 0x1
	movs r1, 0x1
	ands r1, r0
	lsls r1, 4
	ldrb r2, [r5]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _080BBAFC
	ldr r1, _080BBB00
	ldrb r1, [r1, 0x14]
	bl VarSet
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBADC: .4byte gSaveBlock1
_080BBAE0: .4byte gUnknown_020387DC
_080BBAE4: .4byte 0x00001a08
_080BBAE8: .4byte 0x00001a11
_080BBAEC: .4byte 0x02024eae
_080BBAF0: .4byte 0x00004054
_080BBAF4: .4byte gSaveBlock2
_080BBAF8: .4byte 0x0202713e
_080BBAFC: .4byte 0x00004026
_080BBB00: .4byte gMapHeader
	thumb_func_end sub_80BB8CC

	thumb_func_start sub_80BB970
sub_80BB970: @ 80BBB04
	push {r4-r7,lr}
	adds r5, r0, 0
	movs r2, 0
	b _080BBB9A
_080BBB0C:
	ldr r0, [r5, 0x10]
	lsls r1, r2, 1
	adds r1, r2
	lsls r1, 2
	adds r3, r1, r0
	ldrb r0, [r3, 0x5]
	adds r7, r2, 0x1
	cmp r0, 0x8
	bne _080BBB96
	movs r2, 0
	ldr r4, _080BBB74
	adds r6, r1, 0
_080BBB24:
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 5
	adds r0, r4
	ldr r1, _080BBB78
	adds r0, r1
	ldrb r1, [r0]
	ldr r0, [r3, 0x8]
	cmp r1, r0
	bne _080BBB8C
	ldrh r0, [r3]
	adds r0, 0x7
	ldrh r1, [r3, 0x2]
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r3, 0
	lsls r0, 16
	asrs r4, r0, 16
_080BBB4A:
	ldr r0, _080BBB7C
	lsls r1, r3, 2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, r4
	bne _080BBB80
	ldr r1, [r5, 0x10]
	adds r1, r6, r1
	ldrh r0, [r1]
	adds r0, 0x7
	ldrh r1, [r1, 0x2]
	adds r1, 0x7
	ldrh r3, [r2, 0x2]
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	b _080BBB96
	.align 2, 0
_080BBB74: .4byte gSaveBlock1
_080BBB78: .4byte 0x00001a08
_080BBB7C: .4byte gUnknown_083D1358
_080BBB80:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x6
	bls _080BBB4A
	b _080BBB96
_080BBB8C:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x13
	bls _080BBB24
_080BBB96:
	lsls r0, r7, 16
	lsrs r2, r0, 16
_080BBB9A:
	ldrb r0, [r5, 0x3]
	cmp r2, r0
	bcc _080BBB0C
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BB970

	thumb_func_start sub_80BBA14
sub_80BBA14: @ 80BBBA8
	push {lr}
	ldr r0, _080BBBD4
	ldrb r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	ldr r2, _080BBBD8
	lsls r0, 26
	asrs r0, 24
	adds r1, r0, r2
	ldrb r1, [r1]
	lsls r1, 24
	asrs r1, 24
	adds r0, 0x1
	adds r0, r2
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r0, 0x19
	bl warp1_set_2
	pop {r0}
	bx r0
	.align 2, 0
_080BBBD4: .4byte gUnknown_020387DC
_080BBBD8: .4byte gUnknown_083D1374
	thumb_func_end sub_80BBA14

	thumb_func_start sub_80BBA48
sub_80BBA48: @ 80BBBDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080BBC00
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _080BBC10
	cmp r0, 0x1
	bgt _080BBC04
	cmp r0, 0
	beq _080BBC0A
	b _080BBC64
	.align 2, 0
_080BBC00: .4byte gTasks
_080BBC04:
	cmp r0, 0x2
	beq _080BBC28
	b _080BBC64
_080BBC0A:
	movs r0, 0x1
	strh r0, [r2, 0x8]
	b _080BBC64
_080BBC10:
	ldr r0, _080BBC24
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BBC64
	movs r0, 0x2
	strh r0, [r2, 0x8]
	b _080BBC64
	.align 2, 0
_080BBC24: .4byte gPaletteFade
_080BBC28:
	ldr r0, _080BBC6C
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080BBC70
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BBC74
	adds r1, r0
	ldrb r0, [r1]
	cmp r0, 0xFE
	bhi _080BBC4A
	adds r0, 0x1
	strb r0, [r1]
_080BBC4A:
	bl sub_80BBA14
	bl warp_in
	ldr r0, _080BBC78
	ldr r1, _080BBC7C
	str r1, [r0]
	ldr r0, _080BBC80
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080BBC64:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBC6C: .4byte 0x00004054
_080BBC70: .4byte gSaveBlock1
_080BBC74: .4byte 0x00001a18
_080BBC78: .4byte gUnknown_0300485C
_080BBC7C: .4byte sub_8080990
_080BBC80: .4byte CB2_LoadMap
	thumb_func_end sub_80BBA48

	thumb_func_start sub_80BBAF0
sub_80BBAF0: @ 80BBC84
	push {lr}
	ldr r0, _080BBCB0
	movs r1, 0
	bl CreateTask
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	ldr r0, _080BBCB4
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	movs r2, 0x5
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0
	bl saved_warp2_set
	pop {r0}
	bx r0
	.align 2, 0
_080BBCB0: .4byte sub_80BBA48
_080BBCB4: .4byte gSaveBlock1
	thumb_func_end sub_80BBAF0

	thumb_func_start sub_80BBB24
sub_80BBB24: @ 80BBCB8
	push {lr}
	ldr r0, _080BBCD4
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	bne _080BBCDC
	ldr r0, _080BBCD8
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _080BBCDC
	movs r0, 0
	b _080BBCDE
	.align 2, 0
_080BBCD4: .4byte gMapHeader
_080BBCD8: .4byte 0x00004097
_080BBCDC:
	movs r0, 0x1
_080BBCDE:
	pop {r1}
	bx r1
	thumb_func_end sub_80BBB24

	thumb_func_start sub_80BBB50
sub_80BBB50: @ 80BBCE4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080BBD1C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080BBD20
	adds r0, r1
	movs r1, 0x2
	bl FieldObjectTurn
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BBD14
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_080BBD14:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBD1C: .4byte gPlayerAvatar
_080BBD20: .4byte gMapObjects
	thumb_func_end sub_80BBB50

	thumb_func_start sub_80BBB90
sub_80BBB90: @ 80BBD24
	push {r4,lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl HideMapNamePopUpWindow
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x7
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r1, 0x7
	movs r2, 0xE2
	lsls r2, 4
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, 0x7
	movs r2, 0
	ldrsh r1, [r4, r2]
	adds r1, 0x7
	bl CurrentMapDrawMetatileAt
	bl pal_fill_black
	ldr r0, _080BBD7C
	movs r1, 0
	bl CreateTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BBD7C: .4byte sub_80BBB50
	thumb_func_end sub_80BBB90

	thumb_func_start sub_80BBBEC
sub_80BBBEC: @ 80BBD80
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _080BBDF0
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BBDE6
	ldr r0, _080BBDF4
	ldrb r0, [r0]
	movs r1, 0xA
	bl __udivsi3
	ldr r1, _080BBDF8
	movs r5, 0x4
	ldrsb r5, [r1, r5]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	ldr r4, _080BBDFC
	lsls r0, 26
	asrs r0, 24
	adds r3, r0, 0x2
	adds r3, r4
	ldrb r3, [r3]
	lsls r3, 24
	asrs r3, 24
	adds r0, 0x3
	adds r0, r4
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	adds r0, r5, 0
	bl warp1_set
	bl warp_in
	ldr r1, _080BBE00
	ldr r0, _080BBE04
	str r0, [r1]
	ldr r0, _080BBE08
	bl SetMainCallback2
	adds r0, r6, 0
	bl DestroyTask
_080BBDE6:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BBDF0: .4byte gPaletteFade
_080BBDF4: .4byte gUnknown_020387DC
_080BBDF8: .4byte gSaveBlock1
_080BBDFC: .4byte gUnknown_083D1374
_080BBE00: .4byte gUnknown_0300485C
_080BBE04: .4byte sub_80BBB90
_080BBE08: .4byte CB2_LoadMap
	thumb_func_end sub_80BBBEC

	thumb_func_start sub_80BBC78
sub_80BBC78: @ 80BBE0C
	push {lr}
	ldr r0, _080BBE34
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BBE38
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	strh r0, [r1, 0x8]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080BBE34: .4byte sub_80BBBEC
_080BBE38: .4byte gTasks
	thumb_func_end sub_80BBC78

	thumb_func_start CurrentMapIsSecretBase
CurrentMapIsSecretBase: @ 80BBE3C
	push {lr}
	ldr r1, _080BBE54
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, 0x19
	bne _080BBE58
	ldrb r0, [r1, 0x5]
	cmp r0, 0x17
	bhi _080BBE58
	movs r0, 0x1
	b _080BBE5A
	.align 2, 0
_080BBE54: .4byte gSaveBlock1
_080BBE58:
	movs r0, 0
_080BBE5A:
	pop {r1}
	bx r1
	thumb_func_end CurrentMapIsSecretBase

	thumb_func_start sub_80BBCCC
sub_80BBCCC: @ 80BBE60
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	bl CurrentMapIsSecretBase
	lsls r0, 24
	cmp r0, 0
	beq _080BBF50
	ldr r0, _080BBF04
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	ldr r6, _080BBF08
	mov r4, sp
	ldr r0, _080BBF0C
	adds r7, r6, r0
_080BBE90:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	ldrh r1, [r4]
	adds r2, r0, r1
	ldr r1, _080BBF10
	adds r0, r6, r1
	adds r1, r2, r0
	ldrb r0, [r1]
	subs r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bhi _080BBECE
	ldr r0, _080BBF14
	ldrb r3, [r1]
	lsls r1, r3, 5
	adds r1, r0
	ldrb r0, [r1, 0x11]
	cmp r0, 0x4
	beq _080BBECE
	adds r0, r2, r7
	ldrb r2, [r0]
	lsrs r0, r2, 4
	adds r0, 0x7
	movs r1, 0xF
	ands r1, r2
	adds r1, 0x7
	adds r2, r3, 0
	bl sub_80FF394
_080BBECE:
	ldrh r0, [r4]
	adds r0, 0x1
	lsls r0, 16
	lsrs r0, 16
	strh r0, [r4]
	cmp r0, 0xF
	bls _080BBE90
	cmp r5, 0
	beq _080BBF1C
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x7
	ldr r2, _080BBF18
	bl MapGridSetMetatileIdAt
	b _080BBF50
	.align 2, 0
_080BBF04: .4byte 0x00004054
_080BBF08: .4byte gSaveBlock1
_080BBF0C: .4byte 0x00001a2a
_080BBF10: .4byte 0x00001a1a
_080BBF14: .4byte gDecorations
_080BBF18: .4byte 0x00000e21
_080BBF1C:
	mov r0, r8
	cmp r0, 0x1
	bne _080BBF50
	ldr r0, _080BBF5C
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _080BBF50
	mov r4, sp
	adds r4, 0x2
	movs r2, 0x88
	lsls r2, 2
	mov r0, sp
	adds r1, r4, 0
	bl sub_80BB764
	mov r0, sp
	ldrh r0, [r0]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x7
	ldr r2, _080BBF60
	bl MapGridSetMetatileIdAt
_080BBF50:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BBF5C: .4byte 0x00004089
_080BBF60: .4byte 0x00000e0a
	thumb_func_end sub_80BBCCC

	thumb_func_start sub_80BBDD0
sub_80BBDD0: @ 80BBF64
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	ldr r0, _080BBF94
	bl VarGet
	lsls r0, 16
	lsrs r4, r0, 16
	bl CurrentMapIsSecretBase
	lsls r0, 24
	cmp r0, 0
	bne _080BBF9C
	ldr r0, _080BBF98
	str r0, [sp, 0x4]
	adds r0, 0xC
	str r0, [sp, 0x8]
	movs r1, 0xC
	str r1, [sp, 0xC]
	b _080BBFB2
	.align 2, 0
_080BBF94: .4byte 0x00004054
_080BBF98: .4byte 0x02027dbc
_080BBF9C:
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 5
	ldr r0, _080BC110
	adds r2, r1, r0
	str r2, [sp, 0x4]
	adds r0, 0x10
	adds r1, r0
	str r1, [sp, 0x8]
	movs r3, 0x10
	str r3, [sp, 0xC]
_080BBFB2:
	movs r6, 0
	ldr r4, [sp, 0xC]
	cmp r6, r4
	bcc _080BBFBC
	b _080BC100
_080BBFBC:
	ldr r5, _080BC114
	mov r10, r5
_080BBFC0:
	ldr r1, [sp, 0x4]
	adds r0, r1, r6
	ldrb r1, [r0]
	mov r9, r0
	adds r2, r6, 0x1
	str r2, [sp, 0x10]
	cmp r1, 0
	bne _080BBFD2
	b _080BC0F2
_080BBFD2:
	ldrb r0, [r0]
	lsls r0, 5
	ldr r3, _080BC118
	adds r0, r3
	ldrb r0, [r0, 0x11]
	cmp r0, 0x4
	beq _080BBFE2
	b _080BC0F2
_080BBFE2:
	movs r5, 0
	ldr r0, _080BC11C
	ldr r2, [r0, 0x4]
	ldrb r3, [r2]
	mov r8, r0
	cmp r5, r3
	bcs _080BC022
	ldr r0, [r2, 0x4]
	ldrh r1, [r0, 0x14]
	ldr r4, _080BC120
	ldrh r0, [r4]
	adds r0, 0xAE
	adds r7, r4, 0
	cmp r1, r0
	beq _080BC022
	adds r4, r2, 0
	adds r2, r3, 0
_080BC004:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r2
	bcs _080BC022
	ldr r1, [r4, 0x4]
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x14]
	ldrh r0, [r7]
	adds r0, 0xAE
	cmp r1, r0
	bne _080BC004
_080BC022:
	mov r1, r8
	ldr r0, [r1, 0x4]
	ldrb r0, [r0]
	cmp r5, r0
	beq _080BC0F2
	ldr r7, _080BC124
	ldr r2, [sp, 0x8]
	adds r1, r2, r6
	ldrb r0, [r1]
	lsrs r0, 4
	strh r0, [r7]
	ldr r6, _080BC128
	ldrb r1, [r1]
	movs r0, 0xF
	ands r0, r1
	strh r0, [r6]
	ldrh r0, [r7]
	adds r0, 0x7
	ldrh r1, [r6]
	adds r1, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80572D8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BC06E
	adds r0, r4, 0
	bl sub_80572EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC0F2
_080BC06E:
	mov r3, r8
	ldr r0, [r3, 0x4]
	ldr r1, [r0, 0x4]
	lsls r4, r5, 1
	adds r4, r5
	lsls r4, 3
	adds r1, r4, r1
	ldr r5, _080BC12C
	adds r0, r5, 0
	ldrb r1, [r1, 0x1]
	adds r0, r1
	ldr r1, _080BC130
	strh r0, [r1]
	ldrh r0, [r1]
	mov r2, r9
	ldrb r1, [r2]
	lsls r1, 5
	ldr r3, _080BC134
	adds r1, r3
	ldr r1, [r1]
	ldrh r1, [r1]
	bl VarSet
	mov r5, r8
	ldr r0, [r5, 0x4]
	ldr r0, [r0, 0x4]
	adds r4, r0
	ldrb r0, [r4]
	ldr r1, _080BC130
	strh r0, [r1]
	ldr r2, _080BC120
	ldrh r0, [r2]
	adds r0, 0xAE
	lsls r0, 16
	lsrs r0, 16
	bl FlagReset
	ldr r3, _080BC130
	ldrb r0, [r3]
	mov r4, r10
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	bl show_sprite
	ldr r5, _080BC130
	ldrb r0, [r5]
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	movs r4, 0
	ldrsh r3, [r7, r4]
	movs r5, 0
	ldrsh r4, [r6, r5]
	str r4, [sp]
	bl sub_805C0F8
	ldr r1, _080BC130
	ldrb r0, [r1]
	mov r2, r10
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805C78C
	ldr r3, _080BC120
	ldrh r0, [r3]
	adds r0, 0x1
	strh r0, [r3]
_080BC0F2:
	ldr r4, [sp, 0x10]
	lsls r0, r4, 24
	lsrs r6, r0, 24
	ldr r5, [sp, 0xC]
	cmp r6, r5
	bcs _080BC100
	b _080BBFC0
_080BC100:
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC110: .4byte 0x0202714e
_080BC114: .4byte gSaveBlock1
_080BC118: .4byte gDecorations
_080BC11C: .4byte gMapHeader
_080BC120: .4byte gSpecialVar_0x8004
_080BC124: .4byte gSpecialVar_0x8006
_080BC128: .4byte gSpecialVar_0x8007
_080BC12C: .4byte 0x00003f20
_080BC130: .4byte gScriptResult
_080BC134: .4byte 0x083f7c0c
	thumb_func_end sub_80BBDD0

	thumb_func_start sub_80BBFA4
sub_80BBFA4: @ 80BC138
	push {r4,r5,lr}
	ldr r0, _080BC160
	bl VarGet
	ldr r5, _080BC164
	ldr r4, _080BC168
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	adds r0, r4
	ldrb r1, [r0]
	adds r0, r5, 0
	bl VarSet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC160: .4byte 0x00004054
_080BC164: .4byte 0x0000401f
_080BC168: .4byte gUnknown_083D13EC
	thumb_func_end sub_80BBFA4

	thumb_func_start sub_80BBFD8
sub_80BBFD8: @ 80BC16C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r3, 0
	ldrb r0, [r4, 0x3]
	cmp r3, r0
	bge _080BC1C4
	ldr r6, _080BC1B0
_080BC17C:
	lsls r3, 16
	asrs r1, r3, 16
	ldr r2, [r4, 0x10]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x5]
	cmp r0, 0x8
	bne _080BC1B4
	movs r0, 0
	ldrsh r1, [r5, r0]
	ldrh r0, [r2]
	adds r0, 0x7
	cmp r1, r0
	bne _080BC1B4
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	ldrh r0, [r2, 0x2]
	adds r0, 0x7
	cmp r1, r0
	bne _080BC1B4
	ldr r0, [r2, 0x8]
	strb r0, [r6]
	b _080BC1C4
	.align 2, 0
_080BC1B0: .4byte gUnknown_020387DC
_080BC1B4:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r3, r0, 16
	asrs r0, 16
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	blt _080BC17C
_080BC1C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BBFD8

	thumb_func_start sub_80BC038
sub_80BC038: @ 80BC1CC
	push {lr}
	bl sub_80BBFD8
	bl sub_80BB5E4
	ldr r0, _080BC1E0
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_080BC1E0: .4byte gUnknown_081A2E14
	thumb_func_end sub_80BC038

	thumb_func_start sub_80BC050
sub_80BC050: @ 80BC1E4
	push {lr}
	bl sub_80BB5D0
	bl sub_80BB5E4
	ldr r0, _080BC1FC
	ldrh r0, [r0]
	cmp r0, 0x1
	beq _080BC200
	movs r0, 0x1
	b _080BC202
	.align 2, 0
_080BC1FC: .4byte gScriptResult
_080BC200:
	movs r0, 0
_080BC202:
	pop {r1}
	bx r1
	thumb_func_end sub_80BC050

	thumb_func_start sub_80BC074
sub_80BC074: @ 80BC208
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080BC22C
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080BC240
	cmp r0, 0x1
	bgt _080BC230
	cmp r0, 0
	beq _080BC236
	b _080BC278
	.align 2, 0
_080BC22C: .4byte gTasks
_080BC230:
	cmp r0, 0x2
	beq _080BC258
	b _080BC278
_080BC236:
	bl ScriptContext2_Enable
	movs r0, 0x1
	strh r0, [r4, 0x8]
	b _080BC278
_080BC240:
	ldr r0, _080BC254
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080BC278
	movs r0, 0x2
	strh r0, [r4, 0x8]
	b _080BC278
	.align 2, 0
_080BC254: .4byte gPaletteFade
_080BC258:
	movs r0, 0x7E
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	bl warp_in
	ldr r0, _080BC280
	ldr r1, _080BC284
	str r1, [r0]
	ldr r0, _080BC288
	bl SetMainCallback2
	bl ScriptContext2_Disable
	adds r0, r5, 0
	bl DestroyTask
_080BC278:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC280: .4byte gUnknown_0300485C
_080BC284: .4byte mapldr_default
_080BC288: .4byte CB2_LoadMap
	thumb_func_end sub_80BC074

	thumb_func_start sub_80BC0F8
sub_80BC0F8: @ 80BC28C
	push {lr}
	ldr r0, _080BC2A4
	movs r1, 0
	bl CreateTask
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080BC2A4: .4byte sub_80BC074
	thumb_func_end sub_80BC0F8

	thumb_func_start sub_80BC114
sub_80BC114: @ 80BC2A8
	push {lr}
	ldr r0, _080BC2C0
	ldr r1, _080BC2C4
	adds r0, r1
	ldr r1, _080BC2C8
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BC2D0
	ldr r1, _080BC2CC
	movs r0, 0x1
	b _080BC2D4
	.align 2, 0
_080BC2C0: .4byte gSaveBlock1
_080BC2C4: .4byte 0x00001a08
_080BC2C8: .4byte gUnknown_020387DC
_080BC2CC: .4byte gScriptResult
_080BC2D0:
	ldr r1, _080BC2DC
	movs r0, 0
_080BC2D4:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BC2DC: .4byte gScriptResult
	thumb_func_end sub_80BC114

	thumb_func_start sub_80BC14C
sub_80BC14C: @ 80BC2E0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r5, _080BC308
	ldr r4, _080BC30C
_080BC2EC:
	lsls r0, r2, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080BC310
	lsls r0, r2, 24
	lsrs r0, 24
	b _080BC31E
	.align 2, 0
_080BC308: .4byte gSaveBlock1
_080BC30C: .4byte 0x00001a08
_080BC310:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BC2EC
	movs r0, 0
_080BC31E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC14C

	thumb_func_start sub_80BC190
sub_80BC190: @ 80BC324
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r4, r1, 2
	adds r4, r1
	lsls r4, 5
	ldr r0, _080BC35C
	adds r4, r0
	adds r0, r4, 0
	bl sub_80BB8A8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringCopyN
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _080BC360
	adds r0, r5, 0
	bl de_sub_8073174
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BC35C: .4byte 0x0202713e
_080BC360: .4byte gOtherText_PlayersBase
	thumb_func_end sub_80BC190

	thumb_func_start GetSecretBaseMapName
GetSecretBaseMapName: @ 80BC364
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	ldr r6, _080BC3A8
	ldr r5, _080BC3AC
	ldr r4, _080BC3B0
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r5
	ldr r0, _080BC3B4
	adds r1, r0
	ldrb r0, [r1]
	strb r0, [r6]
	adds r0, r4, 0
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	bl sub_80BC190
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080BC3A8: .4byte gUnknown_020387DC
_080BC3AC: .4byte gSaveBlock1
_080BC3B0: .4byte 0x00004054
_080BC3B4: .4byte 0x00001a08
	thumb_func_end GetSecretBaseMapName

	thumb_func_start sub_80BC224
sub_80BC224: @ 80BC3B8
	push {r4,r5,lr}
	ldr r0, _080BC3F0
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	ldr r0, _080BC3F4
	adds r4, r0
	ldr r5, _080BC3F8
	adds r0, r4, 0
	bl sub_80BB8A8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl StringCopyN
	movs r1, 0xFF
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC3F0: .4byte 0x00004054
_080BC3F4: .4byte 0x0202713e
_080BC3F8: .4byte gStringVar1
	thumb_func_end sub_80BC224

	thumb_func_start sub_80BC268
sub_80BC268: @ 80BC3FC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BC41C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BC420
	adds r1, r0
	ldrb r0, [r1]
	lsrs r0, 6
	cmp r0, 0
	bne _080BC424
	movs r0, 0
	b _080BC426
	.align 2, 0
_080BC41C: .4byte gSaveBlock1
_080BC420: .4byte 0x00001a09
_080BC424:
	movs r0, 0x1
_080BC426:
	pop {r1}
	bx r1
	thumb_func_end sub_80BC268

	thumb_func_start sub_80BC298
sub_80BC298: @ 80BC42C
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x1A
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1B
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1C
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1D
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1E
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	movs r1, 0x1F
	bl GetMonData
	adds r4, r0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	movs r1, 0x6
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC298

	thumb_func_start sub_80BC300
sub_80BC300: @ 80BC494
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	movs r0, 0
	mov r10, r0
	movs r6, 0
	mov r9, r6
_080BC4A8:
	movs r4, 0
	lsls r3, r6, 2
	lsls r2, r6, 1
	ldr r7, _080BC5B8
	adds r1, r6, 0x1
	str r1, [sp]
	adds r1, r3, 0
_080BC4B6:
	adds r0, r1, r4
	lsls r0, 1
	ldr r5, _080BC5BC
	adds r0, r5, r0
	mov r5, r9
	strh r5, [r0]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x3
	bls _080BC4B6
	ldr r1, _080BC5C0
	adds r0, r1, r2
	strh r5, [r0]
	ldr r5, _080BC5C4
	adds r0, r5, r2
	mov r1, r9
	strh r1, [r0]
	ldr r2, _080BC5C8
	adds r0, r2, r6
	mov r5, r9
	strb r5, [r0]
	ldr r1, _080BC5CC
	adds r0, r1, r3
	mov r2, r9
	str r2, [r0]
	ldr r3, _080BC5D0
	adds r0, r3, r6
	strb r2, [r0]
	movs r0, 0x64
	adds r5, r6, 0
	muls r5, r0
	adds r4, r5, r7
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _080BC59C
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _080BC59C
	movs r4, 0
	mov r0, r10
	lsls r0, 2
	mov r8, r0
	mov r1, r10
	lsls r7, r1, 1
	adds r1, 0x1
	str r1, [sp, 0x4]
	ldr r2, _080BC5B8
_080BC522:
	adds r1, r4, 0
	adds r1, 0xD
	adds r0, r5, r2
	str r2, [sp, 0x8]
	bl GetMonData
	mov r3, r8
	adds r1, r3, r4
	lsls r1, 1
	ldr r3, _080BC5BC
	adds r1, r3, r1
	strh r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r2, [sp, 0x8]
	cmp r4, 0x3
	bls _080BC522
	movs r0, 0x64
	adds r4, r6, 0
	muls r4, r0
	ldr r0, _080BC5B8
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	ldr r5, _080BC5C0
	adds r1, r5, r7
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	ldr r2, _080BC5C4
	adds r1, r2, r7
	strh r0, [r1]
	adds r0, r4, 0
	movs r1, 0x38
	bl GetMonData
	ldr r1, _080BC5C8
	add r1, r10
	strb r0, [r1]
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldr r1, _080BC5CC
	add r1, r8
	str r0, [r1]
	adds r0, r4, 0
	bl sub_80BC298
	ldr r1, _080BC5D0
	add r1, r10
	strb r0, [r1]
	ldr r3, [sp, 0x4]
	lsls r0, r3, 16
	lsrs r0, 16
	mov r10, r0
_080BC59C:
	ldr r5, [sp]
	lsls r0, r5, 16
	lsrs r6, r0, 16
	cmp r6, 0x5
	bls _080BC4A8
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC5B8: .4byte gPlayerParty
_080BC5BC: .4byte 0x02027188
_080BC5C0: .4byte 0x020271b8
_080BC5C4: .4byte 0x020271c4
_080BC5C8: .4byte 0x020271d0
_080BC5CC: .4byte 0x02027170
_080BC5D0: .4byte 0x020271d6
	thumb_func_end sub_80BC300

	thumb_func_start sub_80BC440
sub_80BC440: @ 80BC5D4
	push {r4,r5,lr}
	ldr r4, _080BC5F0
	ldr r0, _080BC5F4
	adds r4, r0
	ldrh r5, [r4]
	movs r0, 0
	bl sub_80BB594
	strh r5, [r4]
	bl sub_80BC0F8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC5F0: .4byte gSaveBlock1
_080BC5F4: .4byte 0x00001a16
	thumb_func_end sub_80BC440

	thumb_func_start SecretBasePC_PackUp
SecretBasePC_PackUp: @ 80BC5F8
	push {lr}
	movs r0, 0x14
	bl sav12_xor_increment
	bl sub_80BC440
	pop {r0}
	bx r0
	thumb_func_end SecretBasePC_PackUp

	thumb_func_start sub_80BC474
sub_80BC474: @ 80BC608
	push {r4-r7,lr}
	ldr r0, _080BC660
	ldr r4, [r0, 0x4]
	movs r6, 0
	ldrb r0, [r4, 0x3]
	cmp r6, r0
	bcs _080BC698
	ldr r3, _080BC664
_080BC618:
	ldr r2, [r4, 0x10]
	lsls r1, r6, 1
	adds r0, r1, r6
	lsls r0, 2
	adds r2, r0, r2
	ldrb r0, [r2, 0x5]
	adds r7, r1, 0
	cmp r0, 0x8
	bne _080BC68C
	ldrb r1, [r3]
	ldr r0, [r2, 0x8]
	cmp r1, r0
	bne _080BC68C
	ldrh r0, [r2]
	adds r0, 0x7
	ldrh r1, [r2, 0x2]
	adds r1, 0x7
	bl MapGridGetMetatileIdAt
	movs r1, 0
	ldr r5, _080BC668
	lsls r0, 16
	asrs r2, r0, 16
_080BC646:
	lsls r0, r1, 2
	adds r3, r0, r5
	ldrh r0, [r3, 0x2]
	cmp r0, r2
	beq _080BC66C
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x6
	bls _080BC646
_080BC65A:
	bl DrawWholeMapView
	b _080BC698
	.align 2, 0
_080BC660: .4byte gMapHeader
_080BC664: .4byte 0x0202713c
_080BC668: .4byte gUnknown_083D1358
_080BC66C:
	ldr r0, [r4, 0x10]
	adds r1, r7, r6
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1]
	adds r0, 0x7
	ldrh r1, [r1, 0x2]
	adds r1, 0x7
	ldrh r3, [r3]
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r2, r3
	bl MapGridSetMetatileIdAt
	b _080BC65A
_080BC68C:
	adds r0, r6, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	ldrb r0, [r4, 0x3]
	cmp r6, r0
	bcc _080BC618
_080BC698:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC474

	thumb_func_start sub_80BC50C
sub_80BC50C: @ 80BC6A0
	push {r4,r5,lr}
	bl sub_80BC474
	movs r0, 0x14
	bl sav12_xor_increment
	ldr r4, _080BC6C4
	ldr r0, _080BC6C8
	adds r4, r0
	ldrh r5, [r4]
	movs r0, 0
	bl sub_80BB594
	strh r5, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC6C4: .4byte gSaveBlock1
_080BC6C8: .4byte 0x00001a16
	thumb_func_end sub_80BC50C

	thumb_func_start sub_80BC538
sub_80BC538: @ 80BC6CC
	push {r4,r5,lr}
	movs r5, 0
	movs r4, 0x1
_080BC6D2:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC6E8
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080BC6E8:
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BC6D2
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC538

	thumb_func_start sub_80BC56C
sub_80BC56C: @ 80BC700
	push {lr}
	ldr r0, _080BC720
	ldrb r0, [r0]
	bl sub_80BC14C
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BC268
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _080BC728
	ldr r0, _080BC724
	strh r1, [r0]
	b _080BC746
	.align 2, 0
_080BC720: .4byte gUnknown_020387DC
_080BC724: .4byte gScriptResult
_080BC728:
	bl sub_80BC538
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x9
	bls _080BC740
	ldr r1, _080BC73C
	movs r0, 0x2
	b _080BC744
	.align 2, 0
_080BC73C: .4byte gScriptResult
_080BC740:
	ldr r1, _080BC74C
	movs r0, 0
_080BC744:
	strh r0, [r1]
_080BC746:
	pop {r0}
	bx r0
	.align 2, 0
_080BC74C: .4byte gScriptResult
	thumb_func_end sub_80BC56C

	thumb_func_start sub_80BC5BC
sub_80BC5BC: @ 80BC750
	push {lr}
	ldr r0, _080BC78C
	ldrb r0, [r0]
	bl sub_80BC14C
	ldr r2, _080BC790
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BC794
	adds r1, r0
	ldrb r3, [r1]
	lsrs r2, r3, 6
	movs r0, 0x1
	eors r2, r0
	lsls r2, 6
	movs r0, 0x3F
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x86
	lsls r0, 1
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080BC78C: .4byte gUnknown_020387DC
_080BC790: .4byte gSaveBlock1
_080BC794: .4byte 0x00001a09
	thumb_func_end sub_80BC5BC

	thumb_func_start SecretBasePC_Decoration
SecretBasePC_Decoration: @ 80BC798
	push {lr}
	ldr r0, _080BC7A8
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC7A8: .4byte Task_SecretBasePC_Decoration
	thumb_func_end SecretBasePC_Decoration

	thumb_func_start SecretBasePC_Registry
SecretBasePC_Registry: @ 80BC7AC
	push {lr}
	ldr r0, _080BC7BC
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080BC7BC: .4byte Task_SecretBasePC_Registry
	thumb_func_end SecretBasePC_Registry

	thumb_func_start Task_SecretBasePC_Registry
Task_SecretBasePC_Registry: @ 80BC7C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl ScriptContext2_Enable
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BC81C
	adds r4, r0, r1
	bl sub_80BC538
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	adds r1, r0, 0
	cmp r1, 0
	beq _080BC828
	cmp r1, 0x7
	ble _080BC7F2
	movs r0, 0x7
_080BC7F2:
	strh r0, [r4, 0x6]
	movs r0, 0
	strh r0, [r4, 0x2]
	strh r0, [r4, 0x4]
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_80BC7D8
	ldr r1, _080BC820
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BC824
	str r1, [r0]
	b _080BC834
	.align 2, 0
_080BC81C: .4byte 0x03004b38
_080BC820: .4byte gTasks
_080BC824: .4byte sub_80BC824
_080BC828:
	ldr r1, _080BC83C
	ldr r2, _080BC840
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080BC834:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC83C: .4byte gSecretBaseText_NoRegistry
_080BC840: .4byte sub_80BCC54
	thumb_func_end Task_SecretBasePC_Registry

	thumb_func_start sub_80BC6B0
sub_80BC6B0: @ 80BC844
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BC86C
	adds r1, r0
	mov r8, r1
	movs r4, 0
	movs r6, 0
	movs r5, 0x1
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r6, r0
	bne _080BC870
	movs r4, 0x1
	b _080BC89A
	.align 2, 0
_080BC86C: .4byte 0x03004b38
_080BC870:
	adds r0, r5, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC884
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_080BC884:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bhi _080BC89A
	mov r1, r8
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bne _080BC870
	adds r4, r5, 0
_080BC89A:
	adds r5, r4, 0
	cmp r5, 0x13
	bhi _080BC8EE
	ldr r7, _080BC934
_080BC8A2:
	adds r0, r5, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BC8E4
	adds r0, r7, 0
	adds r1, r5, 0
	bl sub_80BC190
	lsls r3, r6, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x12
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	adds r0, r7, 0
	movs r1, 0x12
	adds r2, r4, 0
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x8
	beq _080BC8EE
_080BC8E4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BC8A2
_080BC8EE:
	cmp r6, 0x7
	bhi _080BC93C
	lsls r3, r6, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x12
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080BC938
	movs r1, 0x12
	adds r2, r4, 0
	bl MenuPrint
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	cmp r6, 0x7
	beq _080BC946
	lsls r1, r6, 25
	movs r0, 0x80
	lsls r0, 19
	adds r1, r0
	lsrs r1, 24
	movs r0, 0x12
	movs r2, 0x1C
	movs r3, 0x12
	bl MenuFillWindowRectWithBlankTile
	b _080BC946
	.align 2, 0
_080BC934: .4byte gStringVar1
_080BC938: .4byte gUnknownText_Exit
_080BC93C:
	movs r0, 0x1
	movs r1, 0xBC
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
_080BC946:
	mov r1, r8
	movs r2, 0x4
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080BC958
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	b _080BC962
_080BC958:
	movs r0, 0
	movs r1, 0xBC
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
_080BC962:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC6B0

	thumb_func_start sub_80BC7D8
sub_80BC7D8: @ 80BC96C
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080BC9B4
	adds r4, r0
	movs r0, 0x11
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldrb r3, [r4, 0x6]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r4, 0x2]
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x12
	movs r2, 0x2
	bl InitMenu
	adds r0, r5, 0
	bl sub_80BC6B0
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BC9B4: .4byte 0x03004b38
	thumb_func_end sub_80BC7D8

	thumb_func_start sub_80BC824
sub_80BC824: @ 80BC9B8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080BC9EC
	adds r4, r0, r1
	ldr r2, _080BC9F0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BCA08
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _080BC9F4
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080BCA4A
	.align 2, 0
_080BC9EC: .4byte 0x03004b38
_080BC9F0: .4byte gMain
_080BC9F4:
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _080BCAD4
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x4]
	subs r0, 0x1
	b _080BCA38
_080BCA08:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BCA56
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r2, 0x6
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080BCA42
	movs r1, 0x4
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	beq _080BCAD4
	movs r0, 0x5
	bl PlaySE
	ldrh r0, [r4, 0x4]
	adds r0, 0x1
_080BCA38:
	strh r0, [r4, 0x4]
	adds r0, r5, 0
	bl sub_80BC6B0
	b _080BCAD4
_080BCA42:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080BCA4A:
	bl MoveMenuCursor
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x2]
	b _080BCAD4
_080BCA56:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BCAB0
	movs r0, 0x5
	bl PlaySE
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	movs r2, 0x4
	ldrsh r1, [r4, r2]
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	cmp r0, r1
	bne _080BCA90
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_80BCC54
	b _080BCAD4
_080BCA90:
	bl sub_8072DEC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x2]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BC948
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0x8]
	adds r0, r5, 0
	bl sub_80BC980
	b _080BCAD4
_080BCAB0:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BCAD4
	movs r0, 0x5
	bl PlaySE
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_80BCC54
_080BCAD4:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC824

	thumb_func_start sub_80BC948
sub_80BC948: @ 80BCADC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	movs r4, 0x1
_080BCAE6:
	adds r0, r4, 0
	bl sub_80BC268
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BCB02
	cmp r6, r5
	bne _080BCAFC
	adds r0, r4, 0
	b _080BCB0E
_080BCAFC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_080BCB02:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x13
	bls _080BCAE6
	movs r0, 0
_080BCB0E:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BC948

	thumb_func_start sub_80BC980
sub_80BC980: @ 80BCB14
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r3, _080BCB6C
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x2
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0xA
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x2
	bl InitMenu
	ldr r1, _080BCB70
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BCB74
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCB6C: .4byte gUnknown_083D13D4
_080BCB70: .4byte gTasks
_080BCB74: .4byte sub_80BC9E4
	thumb_func_end sub_80BC980

	thumb_func_start sub_80BC9E4
sub_80BC9E4: @ 80BCB78
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _080BCBA8
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080BCBAC
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _080BCC10
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _080BCC10
	.align 2, 0
_080BCBA8: .4byte gMain
_080BCBAC:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080BCBCE
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080BCC10
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _080BCC10
_080BCBCE:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080BCBFC
	movs r0, 0x5
	bl PlaySE
	ldr r4, _080BCBF8
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 21
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _080BCC10
	.align 2, 0
_080BCBF8: .4byte gUnknown_083D13D4
_080BCBFC:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080BCC10
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_80BCBF8
_080BCC10:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BC9E4

	thumb_func_start sub_80BCA84
sub_80BCA84: @ 80BCC18
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 2
	adds r4, r5
	lsls r4, 3
	ldr r0, _080BCC6C
	adds r4, r0
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r0, _080BCC70
	ldrb r1, [r4, 0x8]
	bl sub_80BC190
	ldr r4, _080BCC74
	ldr r1, _080BCC78
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080BCC7C
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCC6C: .4byte 0x03004b38
_080BCC70: .4byte gStringVar1
_080BCC74: .4byte gStringVar4
_080BCC78: .4byte gOtherText_OkayToDeleteFromRegistry
_080BCC7C: .4byte sub_80BCAEC
	thumb_func_end sub_80BCA84

	thumb_func_start sub_80BCAEC
sub_80BCAEC: @ 80BCC80
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _080BCCA0
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCCA0: .4byte gUnknown_083D13E4
	thumb_func_end sub_80BCAEC

	thumb_func_start sub_80BCB10
sub_80BCB10: @ 80BCCA4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r0, r5, 2
	adds r0, r5
	lsls r6, r0, 3
	ldr r7, _080BCD14
	adds r4, r6, r7
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r2, _080BCD18
	movs r0, 0x8
	ldrsh r1, [r4, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r2
	ldr r1, _080BCD1C
	adds r0, r1
	ldrb r2, [r0]
	movs r1, 0x3F
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r4]
	subs r0, 0x1
	strh r0, [r4]
	ldrh r1, [r4, 0x4]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r0, 0
	ble _080BCCF0
	subs r0, r1, 0x1
	strh r0, [r4, 0x4]
_080BCCF0:
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bgt _080BCCFE
	ldrh r0, [r4, 0x6]
	subs r0, 0x1
	strh r0, [r4, 0x6]
_080BCCFE:
	adds r0, r5, 0
	bl sub_80BC7D8
	adds r0, r7, 0
	subs r0, 0x8
	adds r0, r6, r0
	ldr r1, _080BCD20
	str r1, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCD14: .4byte 0x03004b38
_080BCD18: .4byte gSaveBlock1
_080BCD1C: .4byte 0x00001a09
_080BCD20: .4byte sub_80BC824
	thumb_func_end sub_80BCB10

	thumb_func_start sub_80BCB90
sub_80BCB90: @ 80BCD24
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r1, _080BCD4C
	ldr r2, _080BCD50
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCD4C: .4byte gOtherText_RegisteredDataDeleted
_080BCD50: .4byte sub_80BCB10
	thumb_func_end sub_80BCB90

	thumb_func_start sub_80BCBC0
sub_80BCBC0: @ 80BCD54
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	adds r0, r4, 0
	bl sub_80BC7D8
	ldr r1, _080BCD84
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080BCD88
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCD84: .4byte gTasks
_080BCD88: .4byte sub_80BC824
	thumb_func_end sub_80BCBC0

	thumb_func_start sub_80BCBF8
sub_80BCBF8: @ 80BCD8C
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r5, _080BCDE0
	adds r0, r4, r5
	ldrb r3, [r0, 0x6]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	ldrb r0, [r0, 0x2]
	str r0, [sp]
	movs r0, 0xB
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x12
	movs r2, 0x2
	bl InitMenu
	movs r0, 0x1
	movs r1, 0
	movs r2, 0xC
	movs r3, 0x5
	bl MenuZeroFillWindowRect
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	subs r5, 0x8
	adds r4, r5
	ldr r0, _080BCDE4
	str r0, [r4]
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCDE0: .4byte 0x03004b38
_080BCDE4: .4byte sub_80BC824
	thumb_func_end sub_80BCBF8

	thumb_func_start sub_80BCC54
sub_80BCC54: @ 80BCDE8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080BCE18
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl BuyMenuFreeMemory
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	cmp r4, 0
	bne _080BCE20
	ldr r0, _080BCE1C
	bl ScriptContext1_SetupScript
	b _080BCE26
	.align 2, 0
_080BCE18: .4byte 0x00004054
_080BCE1C: .4byte gUnknown_0815F399
_080BCE20:
	ldr r0, _080BCE34
	bl ScriptContext1_SetupScript
_080BCE26:
	adds r0, r5, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BCE34: .4byte gUnknown_0815F49A
	thumb_func_end sub_80BCC54

	thumb_func_start sub_80BCCA4
sub_80BCCA4: @ 80BCE38
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080BCE70
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	adds r4, r1
	ldr r1, _080BCE74
	adds r0, r4, r1
	ldrb r0, [r0]
	movs r1, 0x5
	bl __umodsi3
	ldr r1, _080BCE78
	adds r4, r1
	ldrb r2, [r4]
	lsls r2, 27
	lsrs r2, 31
	lsls r1, r2, 2
	adds r1, r2
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080BCE70: .4byte gSaveBlock1
_080BCE74: .4byte 0x00001a11
_080BCE78: .4byte 0x00001a09
	thumb_func_end sub_80BCCA4

	thumb_func_start sub_80BCCE8
sub_80BCCE8: @ 80BCE7C
	push {lr}
	ldr r0, _080BCE9C
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	bne _080BCEA4
	ldr r0, _080BCEA0
	b _080BCF06
	.align 2, 0
_080BCE9C: .4byte 0x00004054
_080BCEA0: .4byte UnknownString_81A1BB2
_080BCEA4:
	cmp r0, 0x1
	bne _080BCEB0
	ldr r0, _080BCEAC
	b _080BCF06
	.align 2, 0
_080BCEAC: .4byte UnknownString_81A1F67
_080BCEB0:
	cmp r0, 0x2
	bne _080BCEBC
	ldr r0, _080BCEB8
	b _080BCF06
	.align 2, 0
_080BCEB8: .4byte UnknownString_81A2254
_080BCEBC:
	cmp r0, 0x3
	bne _080BCEC8
	ldr r0, _080BCEC4
	b _080BCF06
	.align 2, 0
_080BCEC4: .4byte UnknownString_81A25C3
_080BCEC8:
	cmp r0, 0x4
	bne _080BCED4
	ldr r0, _080BCED0
	b _080BCF06
	.align 2, 0
_080BCED0: .4byte UnknownString_81A2925
_080BCED4:
	cmp r0, 0x5
	bne _080BCEE0
	ldr r0, _080BCEDC
	b _080BCF06
	.align 2, 0
_080BCEDC: .4byte UnknownString_81A1D74
_080BCEE0:
	cmp r0, 0x6
	bne _080BCEEC
	ldr r0, _080BCEE8
	b _080BCF06
	.align 2, 0
_080BCEE8: .4byte UnknownString_81A20C9
_080BCEEC:
	cmp r0, 0x7
	bne _080BCEF8
	ldr r0, _080BCEF4
	b _080BCF06
	.align 2, 0
_080BCEF4: .4byte UnknownString_81A2439
_080BCEF8:
	cmp r1, 0x8
	beq _080BCF04
	ldr r0, _080BCF00
	b _080BCF06
	.align 2, 0
_080BCF00: .4byte UnknownString_81A2B2A
_080BCF04:
	ldr r0, _080BCF0C
_080BCF06:
	pop {r1}
	bx r1
	.align 2, 0
_080BCF0C: .4byte UnknownString_81A2754
	thumb_func_end sub_80BCCE8

	thumb_func_start unref_sub_80BCD7C
unref_sub_80BCD7C: @ 80BCF10
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	movs r5, 0
	ldr r7, _080BCF90
	lsls r1, r0, 2
	adds r1, r0
	lsls r6, r1, 5
	ldr r0, _080BCF94
	adds r0, r7
	mov r10, r0
	ldr r1, _080BCF98
	adds r1, r7
	mov r9, r1
	ldr r2, _080BCF9C
	adds r2, r7
	mov r8, r2
	ldr r0, _080BCFA0
	mov r12, r0
_080BCF3E:
	lsls r4, r5, 2
	adds r0, r4, r6
	add r0, r10
	adds r3, r5, 0x1
	str r3, [r0]
	lsls r0, r5, 3
	adds r0, r6
	add r0, r9
	strh r3, [r0]
	lsls r1, r5, 1
	adds r1, r6
	mov r2, r8
	adds r0, r1, r2
	mov r2, r12
	strh r2, [r0]
	ldr r2, _080BCFA4
	adds r0, r7, r2
	adds r1, r0
	strh r3, [r1]
	adds r2, r5, r6
	ldr r1, _080BCFA8
	adds r0, r7, r1
	adds r0, r2, r0
	adds r1, r5, 0x5
	strb r1, [r0]
	ldr r1, _080BCFAC
	adds r0, r7, r1
	adds r2, r0
	adds r4, r5
	strb r4, [r2]
	lsls r3, 16
	lsrs r5, r3, 16
	cmp r5, 0
	beq _080BCF3E
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCF90: .4byte gSaveBlock1
_080BCF94: .4byte 0x00001a3c
_080BCF98: .4byte 0x00001a54
_080BCF9C: .4byte 0x00001a84
_080BCFA0: .4byte 0x00000115
_080BCFA4: .4byte 0x00001a90
_080BCFA8: .4byte 0x00001a9c
_080BCFAC: .4byte 0x00001aa2
	thumb_func_end unref_sub_80BCD7C

	thumb_func_start sub_80BCE1C
sub_80BCE1C: @ 80BCFB0
	push {r4,lr}
	ldr r0, _080BCFD8
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x1
	bl sub_810FB10
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 5
	ldr r1, _080BCFDC
	adds r0, r1
	bl CreateSecretBaseEnemyParty
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFD8: .4byte 0x00004054
_080BCFDC: .4byte 0x0202713c
	thumb_func_end sub_80BCE1C

	thumb_func_start sub_80BCE4C
sub_80BCE4C: @ 80BCFE0
	push {lr}
	ldr r0, _080BD014
	bl VarGet
	ldr r2, _080BD018
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 5
	adds r1, r2
	ldr r0, _080BD01C
	ldrb r0, [r0]
	ldr r2, _080BD020
	adds r1, r2
	movs r2, 0x1
	ands r2, r0
	lsls r2, 5
	ldrb r3, [r1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080BD014: .4byte 0x00004054
_080BD018: .4byte gSaveBlock1
_080BD01C: .4byte gScriptResult
_080BD020: .4byte 0x00001a09
	thumb_func_end sub_80BCE4C

	thumb_func_start sub_80BCE90
sub_80BCE90: @ 80BD024
	push {r4-r7,lr}
	ldr r0, _080BD098
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _080BD09C
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080BD068
	movs r3, 0
	ldr r7, _080BD0A0
	ldr r4, _080BD0A4
	movs r6, 0x21
	negs r6, r6
_080BD046:
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 5
	adds r1, r7
	adds r1, r4
	ldrb r2, [r1]
	adds r0, r6, 0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x13
	bls _080BD046
	ldr r0, _080BD09C
	bl FlagSet
_080BD068:
	ldr r4, _080BD0A8
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80BCCA4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r2, _080BD0AC
	ldr r1, _080BD0A0
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	adds r0, r1
	ldr r1, _080BD0A4
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 26
	lsrs r0, 31
	strh r0, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD098: .4byte 0x00004054
_080BD09C: .4byte 0x000008c2
_080BD0A0: .4byte gSaveBlock1
_080BD0A4: .4byte 0x00001a09
_080BD0A8: .4byte gSpecialVar_0x8004
_080BD0AC: .4byte gScriptResult
	thumb_func_end sub_80BCE90

	thumb_func_start sub_80BCF1C
sub_80BCF1C: @ 80BD0B0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080BD0D4
	adds r4, r1, r0
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080BD0E8
	cmp r0, 0x1
	bgt _080BD0D8
	cmp r0, 0
	beq _080BD0DE
	b _080BD1C0
	.align 2, 0
_080BD0D4: .4byte 0x03004b38
_080BD0D8:
	cmp r0, 0x2
	beq _080BD1B0
	b _080BD1C0
_080BD0DE:
	adds r0, r4, 0x4
	adds r1, r4, 0x6
	bl PlayerGetDestCoords
	b _080BD1BC
_080BD0E8:
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _080BD110
	movs r0, 0
	ldrsh r1, [r5, r0]
	movs r3, 0x6
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _080BD1C0
_080BD110:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_8057350
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD13C
	bl DoYellowCave4Sparkle
	b _080BD1C0
_080BD13C:
	adds r0, r4, 0
	bl sub_8057314
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD16C
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	asrs r0, 16
	mov r1, sp
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	bl sub_80C68A4
	b _080BD1C0
_080BD16C:
	adds r0, r4, 0
	bl sub_8057328
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD18A
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl sub_80C6A54
	b _080BD1C0
_080BD18A:
	adds r0, r4, 0
	bl sub_805733C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD1C0
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	asrs r0, 16
	bl DoDecorationSoundEffect
	b _080BD1C0
_080BD1B0:
	ldrb r0, [r4, 0x8]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	bne _080BD1C0
_080BD1BC:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_080BD1C0:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80BCF1C

	thumb_func_start sub_80BD034
sub_80BD034: @ 80BD1C8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080BD1F8
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 5
	adds r4, r2
	ldr r2, _080BD1FC
	adds r0, r4, r2
	movs r2, 0xA0
	bl memcpy
	ldr r0, _080BD200
	adds r4, r0
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BD1F8: .4byte gSaveBlock1
_080BD1FC: .4byte 0x00001a08
_080BD200: .4byte 0x00001a09
	thumb_func_end sub_80BD034

	thumb_func_start sub_80BD070
sub_80BD070: @ 80BD204
	push {r4,lr}
	movs r2, 0
	adds r4, r0, 0
	adds r4, 0x9
	adds r3, r1, 0
	adds r3, 0x9
_080BD210:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BD220
	movs r0, 0
	b _080BD22C
_080BD220:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080BD210
	movs r0, 0x1
_080BD22C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD070

	thumb_func_start sub_80BD0A0
sub_80BD0A0: @ 80BD234
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r3, 0
	ldrb r0, [r6, 0x2]
	cmp r0, 0xFF
	bne _080BD248
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	beq _080BD276
_080BD248:
	adds r2, r6, 0x2
	adds r0, r2, r3
	adds r4, r5, 0x2
	adds r1, r4, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080BD25C
	movs r0, 0
	b _080BD278
_080BD25C:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x6
	bhi _080BD276
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD248
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD248
_080BD276:
	movs r0, 0x1
_080BD278:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD0A0

	thumb_func_start sub_80BD0EC
sub_80BD0EC: @ 80BD280
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	movs r0, 0x10
	adds r1, r0, 0
	ands r1, r2
	ldrb r2, [r5, 0x1]
	ands r0, r2
	cmp r1, r0
	bne _080BD2B6
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD070
	lsls r0, 24
	cmp r0, 0
	beq _080BD2B6
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD0A0
	lsls r0, 24
	cmp r0, 0
	beq _080BD2B6
	movs r0, 0x1
	b _080BD2B8
_080BD2B6:
	movs r0, 0
_080BD2B8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD0EC

	thumb_func_start sub_80BD12C
sub_80BD12C: @ 80BD2C0
	push {r4,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r4, _080BD2E4
	ldr r3, _080BD2E8
_080BD2CC:
	lsls r0, r1, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _080BD2EC
	adds r0, r1, 0
	b _080BD2FC
	.align 2, 0
_080BD2E4: .4byte gSaveBlock1
_080BD2E8: .4byte 0x00001a08
_080BD2EC:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD2CC
	movs r0, 0x1
	negs r0, r0
_080BD2FC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD12C

	thumb_func_start sub_80BD170
sub_80BD170: @ 80BD304
	push {r4,lr}
	movs r2, 0x1
	ldr r4, _080BD328
	ldr r3, _080BD32C
_080BD30C:
	lsls r0, r2, 16
	asrs r1, r0, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	adds r0, r3
	ldrb r0, [r0]
	cmp r0, 0
	bne _080BD330
	lsls r0, r2, 24
	lsrs r0, 24
	b _080BD33E
	.align 2, 0
_080BD328: .4byte gSaveBlock1
_080BD32C: .4byte 0x00001a08
_080BD330:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD30C
	movs r0, 0
_080BD33E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD170

	thumb_func_start sub_80BD1B0
sub_80BD1B0: @ 80BD344
	push {r4,lr}
	movs r3, 0x1
	ldr r4, _080BD370
_080BD34A:
	lsls r2, r3, 16
	asrs r1, r2, 16
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 5
	adds r0, r4
	ldr r1, _080BD374
	adds r0, r1
	ldrb r1, [r0]
	lsrs r0, r1, 6
	cmp r0, 0
	bne _080BD378
	lsls r0, r1, 28
	cmp r0, 0
	bne _080BD378
	lsls r0, r3, 24
	lsrs r0, 24
	b _080BD388
	.align 2, 0
_080BD370: .4byte gSaveBlock1
_080BD374: .4byte 0x00001a09
_080BD378:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r2, r1
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _080BD34A
	movs r0, 0
_080BD388:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1B0

	thumb_func_start sub_80BD1FC
sub_80BD1FC: @ 80BD390
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD40C
	ldrb r0, [r5]
	bl sub_80BD12C
	lsls r0, 16
	lsrs r4, r0, 16
	asrs r2, r0, 16
	cmp r2, 0
	beq _080BD40C
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _080BD3E8
	ldr r0, _080BD3E0
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 5
	adds r1, r0
	ldr r0, _080BD3E4
	adds r1, r0
	ldrb r1, [r1]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	beq _080BD40C
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD3DA
	ldrb r1, [r5, 0x1]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0x1
	bne _080BD40C
_080BD3DA:
	lsls r4, 24
	lsrs r4, 24
	b _080BD400
	.align 2, 0
_080BD3E0: .4byte gSaveBlock1
_080BD3E4: .4byte 0x00001a09
_080BD3E8:
	bl sub_80BD170
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _080BD400
	bl sub_80BD1B0
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _080BD40C
_080BD400:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80BD034
	adds r0, r4, 0
	b _080BD40E
_080BD40C:
	movs r0, 0
_080BD40E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD1FC

	thumb_func_start sub_80BD280
sub_80BD280: @ 80BD414
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0xA0
	ldr r0, _080BD4B8
	mov r8, r0
	movs r2, 0x1
_080BD424:
	adds r1, r2, 0x1
	lsls r0, r1, 24
	lsrs r5, r0, 24
	mov r9, r1
	cmp r5, 0x13
	bhi _080BD4A0
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 5
	mov r1, r8
	adds r6, r0, r1
	movs r7, 0xC0
_080BD43C:
	ldrb r0, [r6, 0x1]
	adds r3, r7, 0
	ands r3, r0
	cmp r3, 0
	bne _080BD45A
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x40
	beq _080BD472
_080BD45A:
	cmp r3, 0x80
	bne _080BD496
	lsls r2, r5, 2
	adds r0, r2, r5
	lsls r0, 5
	add r0, r8
	ldrb r1, [r0, 0x1]
	adds r0, r7, 0
	ands r0, r1
	adds r4, r2, 0
	cmp r0, 0x80
	beq _080BD496
_080BD472:
	mov r0, sp
	adds r1, r6, 0
	movs r2, 0xA0
	bl memcpy
	adds r4, r5
	lsls r4, 5
	add r4, r8
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0xA0
	bl memcpy
	adds r0, r4, 0
	mov r1, sp
	movs r2, 0xA0
	bl memcpy
_080BD496:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD43C
_080BD4A0:
	mov r1, r9
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bls _080BD424
	add sp, 0xA0
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD4B8: .4byte 0x0202713c
	thumb_func_end sub_80BD280

	thumb_func_start sub_80BD328
sub_80BD328: @ 80BD4BC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	movs r4, 0x1
_080BD4C6:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 5
	adds r1, r0, r6
	ldrb r0, [r1, 0x1]
	lsrs r0, 6
	cmp r0, r5
	bne _080BD4DC
	adds r0, r1, 0
	bl sub_80BD1FC
_080BD4DC:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x13
	bls _080BD4C6
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD328

	thumb_func_start sub_80BD358
sub_80BD358: @ 80BD4EC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldrb r0, [r5]
	cmp r0, 0
	beq _080BD506
	ldrb r0, [r5, 0x1]
	lsls r0, 27
	ldr r1, _080BD50C
	lsrs r0, 31
	adds r4, r1, 0
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	beq _080BD510
_080BD506:
	movs r0, 0
	b _080BD568
	.align 2, 0
_080BD50C: .4byte gSaveBlock2
_080BD510:
	movs r2, 0
	adds r3, r5, 0
	adds r3, 0x9
	adds r6, r4, 0
	adds r6, 0xA
_080BD51A:
	adds r0, r3, r2
	adds r1, r2, r6
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD506
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _080BD51A
	movs r2, 0
	ldrb r0, [r5, 0x2]
	cmp r0, 0xFF
	bne _080BD53E
	ldrb r0, [r4]
	cmp r0, 0xFF
	beq _080BD566
_080BD53E:
	adds r3, r5, 0x2
	adds r0, r3, r2
	adds r1, r2, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080BD506
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x6
	bhi _080BD566
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD53E
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _080BD53E
_080BD566:
	movs r0, 0x1
_080BD568:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD358

	thumb_func_start sub_80BD3DC
sub_80BD3DC: @ 80BD570
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	mov r9, r1
	mov r8, r2
	movs r5, 0
	movs r6, 0
_080BD584:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	bne _080BD5AE
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r10
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD5AE
	adds r0, r4, 0
	bl sub_80BB4AC
	movs r0, 0x1
	orrs r5, r0
_080BD5AE:
	movs r7, 0x2
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	bne _080BD5DC
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r9
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD5DC
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD5DC:
	movs r7, 0x4
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	bne _080BD60A
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 5
	mov r1, r8
	adds r4, r1, r0
	adds r0, r4, 0
	bl sub_80BD358
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD60A
	adds r0, r4, 0
	bl sub_80BB4AC
	orrs r5, r7
	lsls r0, r5, 24
	lsrs r5, r0, 24
_080BD60A:
	cmp r5, 0x7
	beq _080BD618
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x13
	bls _080BD584
_080BD618:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD3DC

	thumb_func_start sub_80BD494
sub_80BD494: @ 80BD628
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	movs r5, 0
_080BD638:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r8
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD692
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_80BD0EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080BD692
	cmp r7, 0
	bne _080BD664
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD69C
_080BD664:
	ldrh r0, [r6, 0xE]
	ldrh r3, [r4, 0xE]
	cmp r0, r3
	bls _080BD674
	adds r0, r4, 0
	bl sub_80BB4AC
	b _080BD69C
_080BD674:
	ldrb r0, [r6, 0x1]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r4, 0x1]
	movs r3, 0x10
	negs r3, r3
	adds r2, r3, 0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x1]
	adds r0, r6, 0
	bl sub_80BB4AC
	movs r0, 0x1
	b _080BD69E
_080BD692:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD638
_080BD69C:
	movs r0, 0
_080BD69E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80BD494

	thumb_func_start sub_80BD514
sub_80BD514: @ 80BD6A8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	adds r7, r1, 0
	mov r8, r2
	adds r6, r3, 0
	movs r5, 0x1
_080BD6BA:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	mov r1, r9
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD70C
	ldrb r1, [r4, 0x1]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0x40
	bne _080BD6E2
	movs r2, 0x10
	negs r2, r2
	adds r0, r2, 0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
_080BD6E2:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD70C
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD70C
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD70C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD6BA
	movs r5, 0
_080BD718:
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 5
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, 0
	beq _080BD74C
	ldrb r0, [r4, 0x1]
	movs r2, 0x21
	negs r2, r2
	adds r1, r2, 0
	ands r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	mov r1, r8
	adds r2, r5, 0
	bl sub_80BD494
	lsls r0, 24
	cmp r0, 0
	bne _080BD74C
	adds r0, r4, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD74C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD718
	movs r5, 0
	movs r0, 0x21
	negs r0, r0
	adds r7, r0, 0
_080BD75E:
	lsls r0, r5, 2
	adds r0, r5
	lsls r4, r0, 5
	mov r2, r8
	adds r1, r4, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD77E
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
	adds r0, r1, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_80BD494
_080BD77E:
	adds r1, r4, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _080BD78C
	ldrb r0, [r1, 0x1]
	ands r0, r7
	strb r0, [r1, 0x1]
_080BD78C:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x13
	bls _080BD75E
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80BD514

	thumb_func_start sub_80BD610
sub_80BD610: @ 80BD7A4
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl sub_80BD3DC
	ldr r0, _080BD804
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_80BD514
	adds r0, r4, 0
	bl sub_80BD1FC
	adds r0, r5, 0
	bl sub_80BD1FC
	adds r0, r6, 0
	bl sub_80BD1FC
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0x1
	bl sub_80BD328
	adds r0, r4, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r5, 0
	movs r1, 0
	bl sub_80BD328
	adds r0, r6, 0
	movs r1, 0
	bl sub_80BD328
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BD804: .4byte 0x0202713c
	thumb_func_end sub_80BD610

	thumb_func_start sub_80BD674
sub_80BD674: @ 80BD808
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r7, r2, 24
	movs r0, 0x60
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _080BD820
	b _080BD924
_080BD820:
	bl GetLinkPlayerCount
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080BD832
	cmp r0, 0x3
	beq _080BD84E
	b _080BD85C
_080BD832:
	lsls r4, r5, 1
	adds r0, r6, r4
	movs r1, 0
	adds r2, r5, 0
	bl memset
	adds r4, r5
	adds r4, r6, r4
	adds r0, r4, 0
	movs r1, 0
	adds r2, r5, 0
	bl memset
	b _080BD85C
_080BD84E:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	movs r1, 0
	adds r2, r5, 0
	bl memset
_080BD85C:
	cmp r7, 0x1
	beq _080BD884
	cmp r7, 0x1
	bgt _080BD86A
	cmp r7, 0
	beq _080BD874
	b _080BD8B0
_080BD86A:
	cmp r7, 0x2
	beq _080BD894
	cmp r7, 0x3
	beq _080BD8A4
	b _080BD8B0
_080BD874:
	adds r0, r6, r5
	lsls r2, r5, 1
	adds r1, r6, r2
	adds r2, r5
	adds r2, r6, r2
	bl sub_80BD610
	b _080BD8B0
_080BD884:
	lsls r1, r5, 1
	adds r0, r6, r1
	adds r1, r5
	adds r1, r6, r1
	adds r2, r6, 0
	bl sub_80BD610
	b _080BD8B0
_080BD894:
	lsls r0, r5, 1
	adds r0, r5
	adds r0, r6, r0
	adds r2, r6, r5
	adds r1, r6, 0
	bl sub_80BD610
	b _080BD8B0
_080BD8A4:
	adds r1, r6, r5
	lsls r2, r5, 1
	adds r2, r6, r2
	adds r0, r6, 0
	bl sub_80BD610
_080BD8B0:
	movs r3, 0x1
	ldr r6, _080BD92C
	movs r5, 0x10
	negs r5, r5
	ldr r4, _080BD930
_080BD8BA:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r6
	adds r2, r0, r4
	ldrb r1, [r2]
	lsls r0, r1, 28
	lsrs r0, 28
	cmp r0, 0x1
	bne _080BD8DA
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x40
	orrs r0, r1
	ands r0, r5
	strb r0, [r2]
_080BD8DA:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD8BA
	bl sub_80BD280
	movs r3, 0x1
	ldr r4, _080BD92C
	ldr r6, _080BD930
	adds r7, r4, 0
	movs r5, 0x3F
_080BD8F2:
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 5
	adds r0, r4
	adds r2, r0, r6
	ldrb r1, [r2]
	lsrs r0, r1, 6
	cmp r0, 0x2
	bne _080BD90A
	adds r0, r5, 0
	ands r0, r1
	strb r0, [r2]
_080BD90A:
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, 0x13
	bls _080BD8F2
	ldr r0, _080BD934
	adds r2, r7, r0
	ldrh r1, [r2]
	ldr r0, _080BD938
	cmp r1, r0
	beq _080BD924
	adds r0, r1, 0x1
	strh r0, [r2]
_080BD924:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD92C: .4byte gSaveBlock1
_080BD930: .4byte 0x00001a09
_080BD934: .4byte 0x00001a16
_080BD938: .4byte 0x0000ffff
	thumb_func_end sub_80BD674

	.align 2, 0 @ Don't pad with nop.
