	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80F7A34
sub_80F7A34: @ 80F7DE4
	push {r4,lr}
	ldr r0, _080F7E14
	movs r1, 0
	strb r1, [r0]
	adds r2, r0, 0
	adds r2, 0x29
	strb r1, [r2]
	movs r2, 0
	adds r4, r0, 0x2
	ldr r3, _080F7E18
_080F7DF8:
	lsls r0, r2, 1
	adds r1, r4, r0
	adds r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080F7DF8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7E14: .4byte 0x020284c8
_080F7E18: .4byte gUnknown_083E537C
	thumb_func_end sub_80F7A34

	thumb_func_start sub_80F7A6C
sub_80F7A6C: @ 80F7E1C
	ldr r0, _080F7E28
	movs r2, 0
	movs r1, 0x1
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F7E28: .4byte 0x020284c8
	thumb_func_end sub_80F7A6C

	thumb_func_start sub_80F7A7C
sub_80F7A7C: @ 80F7E2C
	push {lr}
	bl sub_80F83F8
	pop {r0}
	bx r0
	thumb_func_end sub_80F7A7C

	thumb_func_start sub_80F7A88
sub_80F7A88: @ 80F7E38
	ldr r0, _080F7E44
	movs r2, 0
	movs r1, 0x4
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F7E44: .4byte 0x020284c8
	thumb_func_end sub_80F7A88

	thumb_func_start sub_80F7A98
sub_80F7A98: @ 80F7E48
	push {lr}
	bl sub_81099CC
	pop {r0}
	bx r0
	thumb_func_end sub_80F7A98

	thumb_func_start sub_80F7AA4
sub_80F7AA4: @ 80F7E54
	push {lr}
	ldr r0, _080F7E78
	ldrb r1, [r0, 0xB]
	lsls r1, 8
	ldrb r0, [r0, 0xA]
	orrs r0, r1
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r0, 17
	cmp r0, 0x4
	bhi _080F7EB0
	lsls r0, 2
	ldr r1, _080F7E7C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F7E78: .4byte gSaveBlock2
_080F7E7C: .4byte _080F7E80
	.align 2, 0
_080F7E80:
	.4byte _080F7E94
	.4byte _080F7E9A
	.4byte _080F7EA0
	.4byte _080F7EA6
	.4byte _080F7EAC
_080F7E94:
	bl sub_80F7A34
	b _080F7EB0
_080F7E9A:
	bl sub_80F7A6C
	b _080F7EB0
_080F7EA0:
	bl sub_80F7A98
	b _080F7EB0
_080F7EA6:
	bl sub_80F7A7C
	b _080F7EB0
_080F7EAC:
	bl sub_80F7A88
_080F7EB0:
	bl sub_80F83D0
	pop {r0}
	bx r0
	thumb_func_end sub_80F7AA4

	thumb_func_start GetCurrentMauvilleOldMan
GetCurrentMauvilleOldMan: @ 80F7EB8
	ldr r0, _080F7EC0
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080F7EC0: .4byte 0x020284c8
	thumb_func_end GetCurrentMauvilleOldMan

	thumb_func_start sub_80F7B14
sub_80F7B14: @ 80F7EC4
	push {r4,lr}
	ldr r4, _080F7ED8
	bl GetCurrentMauvilleOldMan
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F7ED8: .4byte gScriptResult
	thumb_func_end sub_80F7B14

	thumb_func_start sub_80F7B2C
sub_80F7B2C: @ 80F7EDC
	ldr r0, _080F7EE8
	ldr r1, _080F7EEC
	adds r1, 0x29
	ldrb r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F7EE8: .4byte gScriptResult
_080F7EEC: .4byte 0x020284c8
	thumb_func_end sub_80F7B2C

	thumb_func_start sub_80F7B40
sub_80F7B40: @ 80F7EF0
	push {r4,r5,lr}
	ldr r5, _080F7F48
	adds r0, r5, 0
	adds r0, 0x1A
	ldr r4, _080F7F4C
	adds r1, r4, 0
	bl StringCopy
	movs r2, 0
	adds r3, r5, 0
	adds r3, 0x25
	adds r4, 0xA
_080F7F08:
	adds r1, r3, r2
	adds r0, r2, r4
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x3
	bls _080F7F08
	movs r2, 0
	movs r0, 0x29
	adds r0, r5
	mov r12, r0
	adds r4, r5, 0x2
	adds r3, r5, 0
	adds r3, 0xE
_080F7F28:
	lsls r0, r2, 1
	adds r1, r4, r0
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x5
	bls _080F7F28
	movs r0, 0x1
	mov r1, r12
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F7F48: .4byte 0x020284c8
_080F7F4C: .4byte gSaveBlock2
	thumb_func_end sub_80F7B40

	thumb_func_start sub_80F7BA0
sub_80F7BA0: @ 80F7F50
	push {r4-r7,lr}
	ldr r1, _080F7FF8
	ldr r0, _080F7FFC
	ldrh r0, [r0]
	adds r5, r1, 0
	adds r5, 0xE
	cmp r0, 0
	bne _080F7F62
	adds r5, r1, 0x2
_080F7F62:
	ldr r2, _080F8000
	adds r4, r2, 0
	movs r6, 0
_080F7F68:
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r2, 0
	bl ConvertEasyChatWordsToString
	adds r2, r0, 0
	adds r7, r6, 0x1
	cmp r2, r4
	beq _080F7F8A
	movs r1, 0x37
_080F7F7C:
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F7F84
	strb r1, [r4]
_080F7F84:
	adds r4, 0x1
	cmp r2, r4
	bne _080F7F7C
_080F7F8A:
	adds r4, 0x1
	movs r0, 0
	strb r0, [r2]
	adds r2, 0x1
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r2, 0
	bl ConvertEasyChatWordsToString
	adds r2, r0, 0
	cmp r2, r4
	beq _080F7FB2
	movs r1, 0x37
_080F7FA4:
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F7FAC
	strb r1, [r4]
_080F7FAC:
	adds r4, 0x1
	cmp r2, r4
	bne _080F7FA4
_080F7FB2:
	adds r4, 0x1
	movs r0, 0xFE
	strb r0, [r2]
	adds r2, 0x1
	ldrh r1, [r5]
	adds r5, 0x2
	adds r0, r2, 0
	bl ConvertEasyChatWordsToString
	adds r2, r0, 0
	cmp r2, r4
	beq _080F7FDA
	movs r1, 0x37
_080F7FCC:
	ldrb r0, [r4]
	cmp r0, 0
	bne _080F7FD4
	strb r1, [r4]
_080F7FD4:
	adds r4, 0x1
	cmp r2, r4
	bne _080F7FCC
_080F7FDA:
	cmp r6, 0
	bne _080F7FEA
	movs r0, 0xFC
	strb r0, [r2]
	adds r2, 0x1
	movs r0, 0xF
	strb r0, [r2]
	adds r2, 0x1
_080F7FEA:
	lsls r0, r7, 16
	lsrs r6, r0, 16
	cmp r6, 0x1
	bls _080F7F68
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F7FF8: .4byte 0x020284c8
_080F7FFC: .4byte gSpecialVar_0x8004
_080F8000: .4byte gStringVar4
	thumb_func_end sub_80F7BA0

	thumb_func_start sub_80F7C54
sub_80F7C54: @ 80F8004
	push {lr}
	ldr r0, _080F801C
	ldrb r0, [r0]
	bl sub_80F7F80
	bl MenuDisplayMessageBox
	bl ScriptContext1_Stop
	pop {r0}
	bx r0
	.align 2, 0
_080F801C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80F7C54

	thumb_func_start sub_80F7C70
sub_80F7C70: @ 80F8020
	ldr r0, _080F802C
	ldr r1, _080F8030
	ldrb r1, [r1, 0x1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_080F802C: .4byte gScriptResult
_080F8030: .4byte 0x020284c8
	thumb_func_end sub_80F7C70

	thumb_func_start sub_80F7C84
sub_80F7C84: @ 80F8034
	ldr r1, _080F803C
	movs r0, 0x1
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_080F803C: .4byte 0x020284c8
	thumb_func_end sub_80F7C84

	thumb_func_start sub_80F7C90
sub_80F7C90: @ 80F8040
	push {lr}
	bl sub_80EB8EC
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _080F8058
	cmp r1, r0
	bne _080F8060
	ldr r1, _080F805C
	movs r0, 0
	b _080F806A
	.align 2, 0
_080F8058: .4byte 0x0000ffff
_080F805C: .4byte gScriptResult
_080F8060:
	ldr r0, _080F8070
	bl ConvertEasyChatWordsToString
	ldr r1, _080F8074
	movs r0, 0x1
_080F806A:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F8070: .4byte gStringVar1
_080F8074: .4byte gScriptResult
	thumb_func_end sub_80F7C90

	thumb_func_start sub_80F7CC8
sub_80F7CC8: @ 80F8078
	push {lr}
	ldr r2, _080F808C
	ldrb r0, [r2, 0x1]
	cmp r0, 0xA
	bne _080F8094
	ldr r1, _080F8090
	movs r0, 0
	strh r0, [r1]
	strb r0, [r2, 0x1]
	b _080F809A
	.align 2, 0
_080F808C: .4byte 0x020284c8
_080F8090: .4byte gScriptResult
_080F8094:
	ldr r1, _080F80A0
	movs r0, 0x1
	strh r0, [r1]
_080F809A:
	pop {r0}
	bx r0
	.align 2, 0
_080F80A0: .4byte gScriptResult
	thumb_func_end sub_80F7CC8

	thumb_func_start sub_80F7CF4
sub_80F7CF4: @ 80F80A4
	push {r4-r6,lr}
	ldr r5, _080F8100
	ldrb r0, [r5, 0x1]
	cmp r0, 0
	bne _080F80B2
	bl sub_80F7DC0
_080F80B2:
	ldrb r0, [r5, 0x1]
	lsls r0, 1
	adds r6, r5, 0x4
	adds r0, r6
	ldrh r1, [r0]
	ldr r0, _080F8104
	cmp r1, r0
	beq _080F8118
	bl Random
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0x7
	ands r4, r0
	ldr r0, _080F8108
	ldrb r1, [r5, 0x1]
	lsls r1, 1
	adds r1, r6
	ldrh r1, [r1]
	bl ConvertEasyChatWordsToString
	adds r2, r0, 0
	ldr r1, _080F810C
	bl StringCopy
	adds r2, r0, 0
	ldr r0, _080F8110
	lsls r4, 2
	adds r4, r0
	ldr r1, [r4]
	adds r0, r2, 0
	bl StringCopy
	adds r2, r0, 0
	ldr r1, _080F8114
	bl StringCopy
	b _080F8138
	.align 2, 0
_080F8100: .4byte 0x020284c8
_080F8104: .4byte 0x0000ffff
_080F8108: .4byte gStringVar4
_080F810C: .4byte gOtherText_Is
_080F8110: .4byte gUnknown_083E5388
_080F8114: .4byte gOtherText_DontYouAgree
_080F8118:
	ldr r0, _080F8150
	ldr r3, _080F8154
	ldrb r1, [r5, 0x2]
	adds r2, r1, 0x1
	strb r2, [r5, 0x2]
	lsls r1, 24
	lsrs r1, 24
	adds r2, r5, 0
	adds r2, 0x18
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl StringCopy
_080F8138:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	cmp r0, 0
	bne _080F8158
	movs r0, 0xA
	b _080F815C
	.align 2, 0
_080F8150: .4byte gStringVar4
_080F8154: .4byte gUnknown_083E53A8
_080F8158:
	ldrb r0, [r5, 0x1]
	adds r0, 0x1
_080F815C:
	strb r0, [r5, 0x1]
	ldr r1, _080F816C
	movs r0, 0x1
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F816C: .4byte gScriptResult
	thumb_func_end sub_80F7CF4

	thumb_func_start sub_80F7DC0
sub_80F7DC0: @ 80F8170
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x18
	ldr r1, _080F8234
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	movs r5, 0
	movs r0, 0x2
	add r0, sp
	mov r8, r0
	ldr r1, _080F8238
	adds r1, 0x18
	adds r3, r1, 0
_080F8194:
	adds r0, r3, r5
	strb r5, [r0]
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x7
	bls _080F8194
	movs r5, 0
	ldr r2, _080F8238
	adds r2, 0x4
	mov r9, r2
	adds r6, r1, 0
_080F81AC:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r4, r5, 0x1
	adds r1, r4, 0
	bl __modsi3
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r6, r5
	ldrb r7, [r2]
	adds r1, r6, r1
	ldrb r0, [r1]
	strb r0, [r2]
	strb r7, [r1]
	lsls r4, 16
	lsrs r5, r4, 16
	cmp r5, 0x7
	bls _080F81AC
	movs r3, 0
	mov r10, r3
	movs r5, 0
_080F81DA:
	lsls r4, r5, 2
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl sub_80EAE88
	add r4, r8
	strh r0, [r4]
	add r0, r10
	lsls r0, 16
	lsrs r0, 16
	mov r10, r0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x5
	bls _080F81DA
	movs r0, 0
	ldr r2, _080F8238
	strb r0, [r2, 0x2]
	movs r7, 0
	movs r5, 0
_080F8206:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x2
	bhi _080F8240
	cmp r7, 0x7
	bhi _080F8240
	lsls r0, r5, 1
	add r0, r9
	ldr r1, _080F823C
	strh r1, [r0]
	adds r0, r7, 0x1
	lsls r0, 16
	lsrs r7, r0, 16
	adds r4, r5, 0x1
	b _080F8292
	.align 2, 0
_080F8234: .4byte gUnknown_083E53C8
_080F8238: .4byte 0x020284c8
_080F823C: .4byte 0x0000ffff
_080F8240:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	mov r1, r10
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	movs r1, 0
	adds r4, r5, 0x1
	lsls r6, r5, 1
	cmp r5, 0x5
	bhi _080F827C
	mov r3, r8
	ldrh r0, [r3]
	b _080F8272
_080F8262:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r5, 0x5
	bhi _080F827C
	lsls r0, r1, 2
	adds r0, r3, r0
	ldrh r0, [r0]
_080F8272:
	subs r0, r2, r0
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	bgt _080F8262
_080F827C:
	cmp r1, 0x6
	bne _080F8282
	movs r1, 0
_080F8282:
	lsls r0, r1, 2
	add r0, sp
	ldrh r0, [r0]
	bl sub_80EB784
	mov r2, r9
	adds r1, r2, r6
	strh r0, [r1]
_080F8292:
	lsls r0, r4, 16
	lsrs r5, r0, 16
	cmp r5, 0x9
	bls _080F8206
	add sp, 0x18
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F7DC0

	thumb_func_start sub_80F7EFC
sub_80F7EFC: @ 80F82AC
	ldr r0, _080F82B8
	adds r0, 0x29
	movs r1, 0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080F82B8: .4byte 0x020284c8
	thumb_func_end sub_80F7EFC

	thumb_func_start sub_80F7F0C
sub_80F7F0C: @ 80F82BC
	ldr r1, _080F82C4
	movs r0, 0
	strb r0, [r1, 0x1]
	bx lr
	.align 2, 0
_080F82C4: .4byte 0x020284c8
	thumb_func_end sub_80F7F0C

	thumb_func_start sub_80F7F18
sub_80F7F18: @ 80F82C8
	push {lr}
	bl sub_8109A20
	pop {r0}
	bx r0
	thumb_func_end sub_80F7F18

	thumb_func_start sub_80F7F24
sub_80F7F24: @ 80F82D4
	push {lr}
	bl sub_80F8428
	pop {r0}
	bx r0
	thumb_func_end sub_80F7F24

	thumb_func_start sub_80F7F30
sub_80F7F30: @ 80F82E0
	push {lr}
	bl GetCurrentMauvilleOldMan
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _080F8326
	lsls r0, 2
	ldr r1, _080F82F8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F82F8: .4byte _080F82FC
	.align 2, 0
_080F82FC:
	.4byte _080F8310
	.4byte _080F8316
	.4byte _080F8322
	.4byte _080F831C
	.4byte _080F8326
_080F8310:
	bl sub_80F7EFC
	b _080F8326
_080F8316:
	bl sub_80F7F0C
	b _080F8326
_080F831C:
	bl sub_80F7F24
	b _080F8326
_080F8322:
	bl sub_80F7F18
_080F8326:
	bl sub_80F83D0
	pop {r0}
	bx r0
	thumb_func_end sub_80F7F30

	thumb_func_start sub_80F7F80
sub_80F7F80: @ 80F8330
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080F8358
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080F835C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x12]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F8358: .4byte sub_80F8184
_080F835C: .4byte gTasks
	thumb_func_end sub_80F7F80

	thumb_func_start sub_80F7FB0
sub_80F7FB0: @ 80F8360
	push {r4-r7,lr}
	adds r6, r1, 0
	movs r1, 0x8
	ldrsh r0, [r0, r1]
	cmp r0, 0x5
	bls _080F836E
	b _080F852A
_080F836E:
	lsls r0, 2
	ldr r1, _080F8378
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8378: .4byte _080F837C
	.align 2, 0
_080F837C:
	.4byte _080F8394
	.4byte _080F852A
	.4byte _080F83F0
	.4byte _080F8424
	.4byte _080F8424
	.4byte _080F852A
_080F8394:
	ldr r2, _080F83E4
	ldr r0, _080F83E8
	ldrh r0, [r0]
	adds r1, r2, 0
	adds r1, 0xE
	cmp r0, 0
	bne _080F83A4
	adds r1, r2, 0x2
_080F83A4:
	adds r2, r1, 0
	adds r1, r6, 0
	adds r1, 0xC
	movs r3, 0x5
_080F83AC:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r3, 0x1
	cmp r3, 0
	bge _080F83AC
	ldr r2, _080F83EC
	adds r4, r2, 0
	movs r2, 0
	adds r1, r6, 0
	adds r1, 0x18
	movs r3, 0x5
_080F83C6:
	ldrh r0, [r1]
	orrs r0, r4
	strh r0, [r1]
	strh r2, [r1, 0x2]
	strh r2, [r1, 0x4]
	strh r2, [r1, 0x6]
	adds r1, 0x8
	subs r3, 0x1
	cmp r3, 0
	bge _080F83C6
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	strh r0, [r6, 0x4]
	b _080F852A
	.align 2, 0
_080F83E4: .4byte 0x020284c8
_080F83E8: .4byte gSpecialVar_0x8004
_080F83EC: .4byte 0x0000ffff
_080F83F0:
	ldrb r1, [r6]
	lsls r1, 1
	adds r0, r6, 0
	adds r0, 0xC
	adds r0, r1
	ldrh r4, [r0]
	lsrs r0, r4, 9
	ldr r1, _080F8420
	ands r1, r4
	bl sub_814A2D0
	adds r1, r0, 0
	movs r0, 0
	strh r0, [r6, 0x4]
	movs r2, 0x3
	ands r2, r4
	lsrs r4, 3
	movs r0, 0x1
	ands r4, r0
	adds r2, r4
	adds r0, r6, 0
	bl sub_814A2EC
	b _080F852A
	.align 2, 0
_080F8420: .4byte 0x000001ff
_080F8424:
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 3
	adds r0, 0x18
	adds r7, r6, r0
	ldrb r0, [r6, 0x3]
	cmp r0, 0x1
	beq _080F84D4
	cmp r0, 0x1
	bgt _080F843C
	cmp r0, 0
	beq _080F8442
	b _080F852A
_080F843C:
	cmp r0, 0xFE
	beq _080F8520
	b _080F852A
_080F8442:
	ldrb r0, [r6, 0x2]
	cmp r0, 0
	bne _080F8480
	cmp r1, 0x6
	beq _080F8452
	ldrh r0, [r7]
	cmp r0, 0xFF
	bne _080F8456
_080F8452:
	movs r0, 0xFE
	b _080F8528
_080F8456:
	ldrh r0, [r7, 0x2]
	strb r0, [r6, 0x2]
	ldrh r0, [r7]
	cmp r0, 0x32
	bhi _080F847A
	movs r1, 0x3
	bl __udivsi3
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0xF9
	lsls r0, 16
	lsrs r0, 16
	bl m4aSongNumStart
_080F847A:
	movs r0, 0x1
	strb r0, [r6, 0x3]
	b _080F84C4
_080F8480:
	ldrh r1, [r6, 0xA]
	movs r2, 0xA
	ldrsh r0, [r6, r2]
	cmp r0, 0xA
	ble _080F8490
	ldrh r0, [r6, 0x6]
	subs r0, 0x2
	strh r0, [r6, 0x6]
_080F8490:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080F849E
	ldrh r0, [r6, 0x8]
	adds r0, 0x40
	b _080F84A2
_080F849E:
	ldrh r0, [r6, 0x8]
	subs r0, 0x40
_080F84A2:
	strh r0, [r6, 0x8]
	ldr r4, _080F84CC
	ldr r5, _080F84D0
	ldrh r2, [r6, 0x6]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayVolumeControl
	movs r0, 0x8
	ldrsh r2, [r6, r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayPitchControl
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
_080F84C4:
	ldrb r0, [r6, 0x2]
	subs r0, 0x1
	strb r0, [r6, 0x2]
	b _080F852A
	.align 2, 0
_080F84CC: .4byte gMPlay_SE2
_080F84D0: .4byte 0x0000ffff
_080F84D4:
	adds r0, r1, 0x1
	movs r1, 0
	strb r0, [r6, 0x1]
	strb r1, [r6, 0x3]
	ldrh r0, [r7]
	cmp r0, 0x32
	bhi _080F852A
	ldrh r0, [r7, 0x6]
	lsls r0, 4
	movs r1, 0x80
	lsls r1, 1
	adds r0, r1
	strh r0, [r6, 0x6]
	ldr r4, _080F8518
	ldr r5, _080F851C
	ldrh r2, [r6, 0x6]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayVolumeControl
	movs r2, 0x80
	lsls r2, 2
	adds r0, r2, 0
	ldrh r7, [r7, 0x4]
	adds r0, r7
	strh r0, [r6, 0x8]
	movs r0, 0x8
	ldrsh r2, [r6, r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl m4aMPlayPitchControl
	b _080F852A
	.align 2, 0
_080F8518: .4byte gMPlay_SE2
_080F851C: .4byte 0x0000ffff
_080F8520:
	ldr r0, _080F8530
	bl m4aMPlayStop
	movs r0, 0xFF
_080F8528:
	strb r0, [r6, 0x3]
_080F852A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F8530: .4byte gMPlay_SE2
	thumb_func_end sub_80F7FB0

	thumb_func_start sub_80F8184
sub_80F8184: @ 80F8534
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080F8564
	adds r5, r0, r1
	ldr r1, _080F8568
	adds r0, r5, 0
	bl sub_80F7FB0
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0x5
	bls _080F8558
	b _080F8778
_080F8558:
	lsls r0, 2
	ldr r1, _080F856C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F8564: .4byte gTasks
_080F8568: .4byte gUnknown_03005DA0
_080F856C: .4byte _080F8570
	.align 2, 0
_080F8570:
	.4byte _080F8588
	.4byte _080F85C8
	.4byte _080F85D8
	.4byte _080F8688
	.4byte _080F8768
	.4byte _080F8676
_080F8588:
	bl sub_80F7BA0
	ldr r4, _080F85BC
	ldr r0, [r4]
	ldr r1, _080F85C0
	bl InitWindowFromConfig
	ldr r0, [r4]
	ldr r1, _080F85C4
	movs r2, 0xF
	str r2, [sp]
	movs r2, 0x2
	movs r3, 0x4
	bl sub_8002EB0
	movs r0, 0
	strh r0, [r5, 0xA]
	strh r0, [r5, 0xC]
	strh r0, [r5, 0xE]
	strh r0, [r5, 0x10]
	movs r0, 0x4
	bl FadeOutBGMTemporarily
	movs r0, 0x1
	b _080F8776
	.align 2, 0
_080F85BC: .4byte gMenuWindowPtr
_080F85C0: .4byte gWindowConfig_81E6CE4
_080F85C4: .4byte gStringVar4
_080F85C8:
	bl IsBGMPausedOrStopped
	lsls r0, 24
	cmp r0, 0
	bne _080F85D4
	b _080F8778
_080F85D4:
	movs r0, 0x2
	b _080F8776
_080F85D8:
	ldr r4, _080F85F0
	movs r2, 0xE
	ldrsh r1, [r5, r2]
	ldr r0, _080F85F4
	adds r1, r0
	movs r3, 0
	ldrb r0, [r1]
	ldr r7, _080F85F8
	ldrh r2, [r5, 0x12]
	ldr r6, _080F85FC
	b _080F860A
	.align 2, 0
_080F85F0: .4byte 0x020284c8
_080F85F4: .4byte gStringVar4
_080F85F8: .4byte gUnknown_03005DA0
_080F85FC: .4byte gUnknown_020388BC
_080F8600:
	adds r1, 0x1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r0, [r1]
_080F860A:
	cmp r0, 0
	beq _080F861A
	cmp r0, 0xFE
	beq _080F861A
	cmp r0, 0xFC
	beq _080F861A
	cmp r0, 0xFF
	bne _080F8600
_080F861A:
	cmp r2, 0
	bne _080F8628
	movs r0, 0x10
	ldrsh r1, [r5, r0]
	lsls r1, 1
	adds r0, r4, 0x2
	b _080F8632
_080F8628:
	movs r2, 0x10
	ldrsh r1, [r5, r2]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0xE
_080F8632:
	adds r0, r1
	ldrh r0, [r0]
	movs r1, 0x3
	ands r1, r0
	lsrs r0, 3
	movs r2, 0x1
	ands r0, r2
	adds r1, r0
	strh r1, [r6]
	movs r1, 0x4
	ldrsh r0, [r7, r1]
	adds r1, r3, 0
	bl __divsi3
	movs r1, 0
	strh r0, [r7, 0x4]
	lsls r0, 16
	cmp r0, 0
	bgt _080F865C
	movs r0, 0x1
	strh r0, [r7, 0x4]
_080F865C:
	ldrh r0, [r5, 0x10]
	adds r0, 0x1
	strh r0, [r5, 0x10]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080F866E
	movs r0, 0x3
	b _080F8670
_080F866E:
	movs r0, 0x5
_080F8670:
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xA]
	b _080F8778
_080F8676:
	ldrh r1, [r5, 0xC]
	movs r2, 0xC
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _080F8682
	b _080F8774
_080F8682:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _080F8778
_080F8688:
	ldr r1, _080F86B4
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	adds r0, r1
	ldrb r4, [r0]
	cmp r4, 0xFF
	bne _080F86BC
	movs r0, 0xC8
	lsls r0, 1
	movs r1, 0x6
	bl FadeInNewBGM
	ldr r0, _080F86B8
	movs r1, 0x2
	bl m4aMPlayFadeOutTemporarily
	bl EnableBothScriptContexts
	adds r0, r6, 0
	bl DestroyTask
	b _080F8778
	.align 2, 0
_080F86B4: .4byte gStringVar4
_080F86B8: .4byte gMPlay_SE2
_080F86BC:
	cmp r4, 0
	bne _080F86DC
	ldr r0, _080F86D8
	ldr r0, [r0]
	bl sub_8003418
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	movs r0, 0x2
	strh r0, [r5, 0x8]
	strh r4, [r5, 0xC]
	b _080F8778
	.align 2, 0
_080F86D8: .4byte gMenuWindowPtr
_080F86DC:
	cmp r4, 0xFE
	bne _080F86F0
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0xE]
	movs r0, 0x2
	strh r0, [r5, 0x8]
	strh r1, [r5, 0xC]
	b _080F8778
_080F86F0:
	cmp r4, 0xFC
	bne _080F8704
	ldrh r0, [r5, 0xE]
	adds r0, 0x2
	strh r0, [r5, 0xE]
	movs r0, 0x2
	strh r0, [r5, 0x8]
	movs r0, 0x8
	strh r0, [r5, 0xC]
	b _080F8778
_080F8704:
	cmp r4, 0x37
	bne _080F8724
	movs r4, 0
	strb r4, [r0]
	ldr r0, _080F8720
	ldr r0, [r0]
	bl sub_8003418
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	strh r4, [r5, 0xC]
	b _080F8778
	.align 2, 0
_080F8720: .4byte gMenuWindowPtr
_080F8724:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _080F8744
	cmp r0, 0x1
	bgt _080F8736
	cmp r0, 0
	beq _080F873C
	b _080F8778
_080F8736:
	cmp r0, 0x2
	beq _080F8750
	b _080F8778
_080F873C:
	ldr r0, _080F874C
	ldr r0, [r0]
	bl sub_8003418
_080F8744:
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _080F8778
	.align 2, 0
_080F874C: .4byte gMenuWindowPtr
_080F8750:
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0xE]
	strh r1, [r5, 0xA]
	ldr r0, _080F8764
	ldrh r0, [r0, 0x4]
	strh r0, [r5, 0xC]
	movs r0, 0x4
	b _080F8776
	.align 2, 0
_080F8764: .4byte gUnknown_03005DA0
_080F8768:
	ldrh r0, [r5, 0xC]
	subs r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080F8778
_080F8774:
	movs r0, 0x3
_080F8776:
	strh r0, [r5, 0x8]
_080F8778:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F8184

	thumb_func_start sub_80F83D0
sub_80F83D0: @ 80F8780
	push {r4,lr}
	ldr r4, _080F87A4
	bl GetCurrentMauvilleOldMan
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 8
	movs r0, 0x8A
	lsls r0, 15
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F87A4: .4byte 0x00004010
	thumb_func_end sub_80F83D0

	thumb_func_start sub_80F83F8
sub_80F83F8: @ 80F87A8
	push {r4,lr}
	ldr r0, _080F87D4
	movs r2, 0
	movs r1, 0x3
	strb r1, [r0]
	strb r2, [r0, 0x1]
	movs r4, 0
	movs r3, 0xFF
	adds r1, r0, 0x4
	movs r2, 0x3
_080F87BC:
	strb r4, [r1]
	ldrb r0, [r1, 0x4]
	orrs r0, r3
	strb r0, [r1, 0x4]
	adds r1, 0x1
	subs r2, 0x1
	cmp r2, 0
	bge _080F87BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F87D4: .4byte 0x020284c8
	thumb_func_end sub_80F83F8

	thumb_func_start sub_80F8428
sub_80F8428: @ 80F87D8
	ldr r0, _080F87E4
	movs r2, 0
	movs r1, 0x3
	strb r1, [r0]
	strb r2, [r0, 0x1]
	bx lr
	.align 2, 0
_080F87E4: .4byte 0x020284c8
	thumb_func_end sub_80F8428

	thumb_func_start sub_80F8438
sub_80F8438: @ 80F87E8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x32
	bne _080F87F4
	movs r0, 0
_080F87F4:
	bl sub_8053108
	pop {r1}
	bx r1
	thumb_func_end sub_80F8438

	thumb_func_start sub_80F844C
sub_80F844C: @ 80F87FC
	push {lr}
	adds r3, r0, 0
	movs r2, 0
	ldr r1, _080F8810
_080F8804:
	ldrb r0, [r1]
	cmp r0, r3
	bne _080F8814
	adds r0, r1, 0
	b _080F881E
	.align 2, 0
_080F8810: .4byte gUnknown_083E53E0
_080F8814:
	adds r1, 0x10
	adds r2, 0x1
	cmp r2, 0x23
	ble _080F8804
	ldr r0, _080F8824
_080F881E:
	pop {r1}
	bx r1
	.align 2, 0
_080F8824: .4byte gUnknown_083E5610
	thumb_func_end sub_80F844C

	thumb_func_start sub_80F8478
sub_80F8478: @ 80F8828
	push {lr}
	bl sub_80F844C
	ldr r0, [r0, 0x4]
	pop {r1}
	bx r1
	thumb_func_end sub_80F8478

	thumb_func_start sub_80F8484
sub_80F8484: @ 80F8834
	push {lr}
	bl sub_80F844C
	ldr r0, [r0, 0xC]
	pop {r1}
	bx r1
	thumb_func_end sub_80F8484

	thumb_func_start sub_80F8490
sub_80F8490: @ 80F8840
	push {lr}
	bl sub_80F844C
	ldr r0, [r0, 0x8]
	pop {r1}
	bx r1
	thumb_func_end sub_80F8490

	thumb_func_start sub_80F849C
sub_80F849C: @ 80F884C
	push {lr}
	movs r1, 0
	ldr r2, _080F8874
	ldrb r0, [r2, 0x4]
	cmp r0, 0
	beq _080F886C
	adds r2, 0x4
_080F885A:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x3
	bhi _080F886C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F885A
_080F886C:
	adds r0, r1, 0
	pop {r1}
	bx r1
	.align 2, 0
_080F8874: .4byte 0x020284c8
	thumb_func_end sub_80F849C

	thumb_func_start sub_80F84C8
sub_80F84C8: @ 80F8878
	lsls r0, 2
	ldr r1, _080F8898
	adds r0, r1
	ldrb r2, [r0]
	ldrb r1, [r0, 0x1]
	lsls r1, 8
	orrs r2, r1
	ldrb r1, [r0, 0x2]
	lsls r1, 16
	orrs r2, r1
	ldrb r0, [r0, 0x3]
	lsls r0, 24
	orrs r2, r0
	adds r0, r2, 0
	bx lr
	.align 2, 0
_080F8898: .4byte 0x020284ec
	thumb_func_end sub_80F84C8

	thumb_func_start sub_80F84EC
sub_80F84EC: @ 80F889C
	lsls r0, 2
	ldr r2, _080F88B4
	adds r0, r2
	strb r1, [r0]
	lsrs r2, r1, 8
	strb r2, [r0, 0x1]
	lsrs r2, r1, 16
	strb r2, [r0, 0x2]
	lsrs r1, 24
	strb r1, [r0, 0x3]
	bx lr
	.align 2, 0
_080F88B4: .4byte 0x020284ec
	thumb_func_end sub_80F84EC

	thumb_func_start sub_80F8508
sub_80F8508: @ 80F88B8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080F88D8
	adds r0, 0x4
	adds r0, r5, r0
	ldrb r0, [r0]
	bl sub_80F8438
	adds r4, r0, 0
	adds r0, r5, 0
	bl sub_80F84C8
	cmp r4, r0
	bhi _080F88DC
	movs r0, 0
	b _080F88DE
	.align 2, 0
_080F88D8: .4byte 0x020284c8
_080F88DC:
	movs r0, 0x1
_080F88DE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8508

	thumb_func_start sub_80F8534
sub_80F8534: @ 80F88E4
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r4, r0, 3
	subs r4, r0
	ldr r0, _080F890C
	adds r4, r0
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x8
	bl memset
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x7
	bl memcpy
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F890C: .4byte 0x020284d0
	thumb_func_end sub_80F8534

	thumb_func_start sub_80F8560
sub_80F8560: @ 80F8910
	push {r4-r6,lr}
	adds r6, r1, 0
	lsls r5, r0, 3
	subs r5, r0
	ldr r0, _080F8944
	adds r5, r0
	adds r0, r6, 0
	bl StringLength
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	movs r1, 0xFF
	movs r2, 0x7
	bl memset
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl StringCopyN
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8944: .4byte 0x020284d0
	thumb_func_end sub_80F8560

	thumb_func_start sub_80F8598
sub_80F8598: @ 80F8948
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r0, _080F899C
	adds r0, 0x4
	adds r0, r5, r0
	strb r6, [r0]
	ldr r1, _080F89A0
	adds r0, r5, 0
	bl sub_80F8560
	lsls r4, r6, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_80F8438
	adds r1, r0, 0
	adds r0, r5, 0
	bl sub_80F84EC
	ldr r5, _080F89A4
	adds r0, r4, 0
	bl sub_80F8438
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0
	movs r3, 0xA
	bl ConvertIntToDecimalStringN
	ldr r4, _080F89A8
	adds r0, r6, 0
	bl sub_80F8490
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F899C: .4byte 0x020284c8
_080F89A0: .4byte gSaveBlock2
_080F89A4: .4byte gStringVar1
_080F89A8: .4byte gStringVar2
	thumb_func_end sub_80F8598

	thumb_func_start sub_80F85FC
sub_80F85FC: @ 80F89AC
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r6, r1, 0
	movs r5, 0
	cmp r5, r6
	bge _080F89C2
_080F89B8:
	adds r0, r7, r5
	strb r5, [r0]
	adds r5, 0x1
	cmp r5, r6
	blt _080F89B8
_080F89C2:
	cmp r6, 0
	ble _080F89F8
	adds r5, r6, 0
_080F89C8:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __modsi3
	adds r4, r0, 0
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r6, 0
	bl __modsi3
	adds r4, r7, r4
	ldrb r2, [r4]
	adds r0, r7, r0
	ldrb r1, [r0]
	strb r1, [r4]
	strb r2, [r0]
	subs r5, 0x1
	cmp r5, 0
	bne _080F89C8
_080F89F8:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80F85FC

	thumb_func_start sub_80F8650
sub_80F8650: @ 80F8A00
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r7, sp
	mov r10, sp
	ldr r0, _080F8A84
	ldr r0, [r0]
	lsls r0, 3
	lsrs r0, 3
	adds r0, 0x3
	lsrs r0, 2
	lsls r0, 2
	mov r1, sp
	subs r1, r0
	mov sp, r1
	mov r8, sp
	mov r0, sp
	movs r1, 0x24
	bl sub_80F85FC
	movs r5, 0
	ldr r0, _080F8A88
	mov r9, r0
	ldr r3, _080F8A8C
_080F8A36:
	mov r1, r8
	adds r0, r1, r5
	ldrb r0, [r0]
	lsls r0, 4
	add r0, r9
	ldrb r4, [r0]
	ldrb r6, [r0, 0x1]
	movs r1, 0
	ldrb r0, [r3, 0x4]
	cmp r0, r4
	beq _080F8A5C
	ldr r2, _080F8A90
_080F8A4E:
	adds r1, 0x1
	cmp r1, 0x3
	bgt _080F8A5C
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, r4
	bne _080F8A4E
_080F8A5C:
	cmp r1, 0x4
	bne _080F8A94
	adds r0, r4, 0
	str r3, [r7]
	bl sub_80F8438
	ldr r3, [r7]
	cmp r0, r6
	bcc _080F8A94
	movs r0, 0x1
	strb r0, [r3, 0x1]
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	bl sub_80F8598
	movs r0, 0x1
	b _080F8A9C
	.align 2, 0
_080F8A84: .4byte gUnknown_083E5620
_080F8A88: .4byte gUnknown_083E53E0
_080F8A8C: .4byte 0x020284c8
_080F8A90: .4byte 0x020284cc
_080F8A94:
	adds r5, 0x1
	cmp r5, 0x23
	ble _080F8A36
	movs r0, 0
_080F8A9C:
	mov sp, r10
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80F8650

	thumb_func_start sub_80F8700
sub_80F8700: @ 80F8AB0
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _080F8AF8
	adds r0, 0x4
	adds r0, r5, r0
	ldrb r6, [r0]
	ldr r4, _080F8AFC
	adds r0, r5, 0
	bl sub_80F84C8
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0
	movs r3, 0xA
	bl ConvertIntToDecimalStringN
	ldr r4, _080F8B00
	adds r0, r6, 0
	bl sub_80F8490
	adds r1, r0, 0
	adds r0, r4, 0
	bl StringCopy
	ldr r1, _080F8B04
	adds r0, r5, 0
	bl sub_80F8534
	adds r0, r6, 0
	bl sub_80F8484
	bl ShowFieldMessage
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8AF8: .4byte 0x020284c8
_080F8AFC: .4byte gStringVar1
_080F8B00: .4byte gStringVar2
_080F8B04: .4byte gStringVar3
	thumb_func_end sub_80F8700

	thumb_func_start sub_80F8758
sub_80F8758: @ 80F8B08
	push {r4-r6,lr}
	bl sub_80F849C
	adds r3, r0, 0
	lsls r3, 25
	movs r0, 0x80
	lsls r0, 19
	adds r3, r0
	lsrs r3, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	bl MenuDrawTextWindow
	movs r4, 0
	ldr r1, _080F8B6C
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _080F8B54
	adds r6, r1, 0x4
	movs r5, 0x80
	lsls r5, 18
_080F8B34:
	bl sub_80F8478
	lsrs r2, r5, 24
	movs r1, 0x1
	bl MenuPrint
	movs r1, 0x80
	lsls r1, 18
	adds r5, r1
	adds r4, 0x1
	cmp r4, 0x3
	bgt _080F8B54
	adds r0, r4, r6
	ldrb r0, [r0]
	cmp r0, 0
	bne _080F8B34
_080F8B54:
	ldr r0, _080F8B70
	lsls r2, r4, 25
	movs r1, 0x80
	lsls r1, 18
	adds r2, r1
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8B6C: .4byte 0x020284c8
_080F8B70: .4byte gPCText_Cancel
	thumb_func_end sub_80F8758

	thumb_func_start sub_80F87C4
sub_80F87C4: @ 80F8B74
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _080F8B94
	adds r4, r0, r1
	movs r0, 0x8
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _080F8B98
	cmp r5, 0x1
	beq _080F8BC0
	b _080F8C12
	.align 2, 0
_080F8B94: .4byte gTasks
_080F8B98:
	bl sub_80F8758
	bl sub_80F849C
	adds r3, r0, 0
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	str r5, [sp]
	movs r0, 0x18
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x2
	bl InitMenu
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080F8C12
_080F8BC0:
	bl ProcessMenuInput
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r4, r0
	beq _080F8C12
	adds r0, 0x1
	cmp r4, r0
	beq _080F8BE2
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080F8BF0
_080F8BE2:
	ldr r1, _080F8BEC
	movs r0, 0
	strh r0, [r1]
	b _080F8BF8
	.align 2, 0
_080F8BEC: .4byte gScriptResult
_080F8BF0:
	ldr r0, _080F8C1C
	strh r5, [r0]
	ldr r0, _080F8C20
	strb r4, [r0]
_080F8BF8:
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0x19
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_080F8C12:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F8C1C: .4byte gScriptResult
_080F8C20: .4byte gUnknown_03000748
	thumb_func_end sub_80F87C4

	thumb_func_start sub_80F8874
sub_80F8874: @ 80F8C24
	push {lr}
	ldr r0, _080F8C34
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080F8C34: .4byte sub_80F87C4
	thumb_func_end sub_80F8874

	thumb_func_start sub_80F8888
sub_80F8888: @ 80F8C38
	push {lr}
	ldr r0, _080F8C48
	ldrb r0, [r0]
	bl sub_80F8700
	pop {r0}
	bx r0
	.align 2, 0
_080F8C48: .4byte gUnknown_03000748
	thumb_func_end sub_80F8888

	thumb_func_start sub_80F889C
sub_80F889C: @ 80F8C4C
	push {lr}
	bl sub_80F849C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F889C

	thumb_func_start sub_80F88AC
sub_80F88AC: @ 80F8C5C
	push {r4,r5,lr}
	ldr r1, _080F8C78
	ldr r5, _080F8C7C
	ldrb r0, [r5]
	adds r1, 0x4
	adds r1, r0, r1
	ldrb r4, [r1]
	bl sub_80F8508
	cmp r0, 0x1
	beq _080F8C80
	movs r0, 0
	b _080F8C8A
	.align 2, 0
_080F8C78: .4byte 0x020284c8
_080F8C7C: .4byte gUnknown_03000748
_080F8C80:
	ldrb r0, [r5]
	adds r1, r4, 0
	bl sub_80F8598
	movs r0, 0x1
_080F8C8A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80F88AC

	thumb_func_start sub_80F88E0
sub_80F88E0: @ 80F8C90
	push {lr}
	ldr r0, _080F8CA0
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _080F8CA4
	movs r0, 0x1
	b _080F8CA6
	.align 2, 0
_080F8CA0: .4byte 0x020284c8
_080F8CA4:
	movs r0, 0
_080F8CA6:
	pop {r1}
	bx r1
	thumb_func_end sub_80F88E0

	thumb_func_start sub_80F88FC
sub_80F88FC: @ 80F8CAC
	push {lr}
	bl sub_80F8650
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80F88FC

	.align 2, 0 @ Don't pad with nop.
