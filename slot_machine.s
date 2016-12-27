	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start PlaySlotMachine
PlaySlotMachine: @ 8101C70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_81019B0
	ldr r0, _08101C84
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08101C84: .4byte sub_81018B8
	thumb_func_end PlaySlotMachine

	thumb_func_start sub_81018B8
sub_81018B8: @ 8101C88
	push {lr}
	ldr r0, _08101CA0
	ldr r1, _08101CA4
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x6
	bhi _08101D1A
	lsls r0, 2
	ldr r1, _08101CA8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08101CA0: .4byte gMain
_08101CA4: .4byte 0x0000043c
_08101CA8: .4byte _08101CAC
	.align 2, 0
_08101CAC:
	.4byte _08101CC8
	.4byte _08101CD2
	.4byte _08101CD8
	.4byte _08101CE2
	.4byte _08101CE8
	.4byte _08101CEE
	.4byte _08101D08
_08101CC8:
	bl sub_8101A28
	bl sub_8101BA4
	b _08101CF2
_08101CD2:
	bl sub_8101A8C
	b _08101CF2
_08101CD8:
	bl sub_8101AE0
	bl sub_8101B04
	b _08101CF2
_08101CE2:
	bl sub_8101C84
	b _08101CF2
_08101CE8:
	bl sub_8101CA0
	b _08101CF2
_08101CEE:
	bl sub_8101CC0
_08101CF2:
	ldr r1, _08101D00
	ldr r0, _08101D04
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _08101D1A
	.align 2, 0
_08101D00: .4byte gMain
_08101D04: .4byte 0x0000043c
_08101D08:
	bl sub_8101CD4
	bl sub_8101CEC
	bl sub_8101A44
	ldr r0, _08101D20
	bl SetMainCallback2
_08101D1A:
	pop {r0}
	bx r0
	.align 2, 0
_08101D20: .4byte sub_8101954
	thumb_func_end sub_81018B8

	thumb_func_start sub_8101954
sub_8101954: @ 8101D24
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8101954

	thumb_func_start sub_810196C
sub_810196C: @ 8101D3C
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _08101D78
	ldr r2, _08101D7C
	adds r0, r2, 0
	adds r0, 0x58
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	adds r0, r2, 0
	adds r0, 0x5A
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x4
	adds r0, r2, 0
	adds r0, 0x5C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, 0x2
	adds r0, r2, 0
	adds r0, 0x5E
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08101D78: .4byte 0x04000040
_08101D7C: .4byte 0x02000000
	thumb_func_end sub_810196C

	thumb_func_start sub_81019B0
sub_81019B0: @ 8101D80
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _08101DB4
	movs r1, 0xFF
	bl CreateTask
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08101DB8
	adds r0, r1
	strh r4, [r0, 0x8]
	adds r0, 0xA
	adds r1, r5, 0
	bl StoreWordInTwoHalfwords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101DB4: .4byte nullsub_67
_08101DB8: .4byte gTasks
	thumb_func_end sub_81019B0

	thumb_func_start sub_81019EC
sub_81019EC: @ 8101DBC
	push {lr}
	ldr r0, _08101DE8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	ldr r0, _08101DEC
	adds r2, r0
	ldr r1, _08101DF0
	ldrh r0, [r2, 0x8]
	strb r0, [r1, 0x1]
	adds r2, 0xA
	adds r1, 0x64
	adds r0, r2, 0
	bl LoadWordFromTwoHalfwords
	pop {r0}
	bx r0
	.align 2, 0
_08101DE8: .4byte nullsub_67
_08101DEC: .4byte gTasks
_08101DF0: .4byte 0x02000000
	thumb_func_end sub_81019EC

	thumb_func_start nullsub_67
nullsub_67: @ 8101DF4
	bx lr
	thumb_func_end nullsub_67

	thumb_func_start sub_8101A28
sub_8101A28: @ 8101DF8
	push {lr}
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r0, 0
	strh r0, [r1]
	pop {r0}
	bx r0
	thumb_func_end sub_8101A28

	thumb_func_start sub_8101A44
sub_8101A44: @ 8101E14
	push {r4,lr}
	ldr r0, _08101E4C
	bl SetVBlankCallback
	ldr r3, _08101E50
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08101E54
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _08101E58
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFD
	lsls r2, 6
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08101E4C: .4byte sub_810196C
_08101E50: .4byte 0x04000208
_08101E54: .4byte 0x04000200
_08101E58: .4byte 0x04000004
	thumb_func_end sub_8101A44

	thumb_func_start sub_8101A8C
sub_8101A8C: @ 8101E5C
	push {r4-r7,lr}
	sub sp, 0x4
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0x80
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	ldr r1, _08101EA8
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08101EAC
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08101E7A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08101E7A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08101EA8: .4byte 0x040000d4
_08101EAC: .4byte 0x81000800
	thumb_func_end sub_8101A8C

	thumb_func_start sub_8101AE0
sub_8101AE0: @ 8101EB0
	sub sp, 0x4
	movs r2, 0xE0
	lsls r2, 19
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r0, _08101ECC
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _08101ED0
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	add sp, 0x4
	bx lr
	.align 2, 0
_08101ECC: .4byte 0x040000d4
_08101ED0: .4byte 0x81000200
	thumb_func_end sub_8101AE0

	thumb_func_start sub_8101B04
sub_8101B04: @ 8101ED4
	push {r4,r5,lr}
	ldr r5, _08101F40
	movs r1, 0
	strh r1, [r5]
	ldr r2, _08101F44
	strh r1, [r2]
	ldr r3, _08101F48
	strh r1, [r3]
	ldr r4, _08101F4C
	strh r1, [r4]
	ldr r0, _08101F50
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08101F54
	adds r0, r1, 0
	strh r0, [r5]
	ldr r1, _08101F58
	adds r0, r1, 0
	strh r0, [r2]
	ldr r2, _08101F5C
	adds r0, r2, 0
	strh r0, [r3]
	ldr r1, _08101F60
	adds r0, r1, 0
	strh r0, [r4]
	ldr r0, _08101F64
	movs r1, 0x3F
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r1, _08101F68
	ldr r2, _08101F6C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _08101F70
	adds r0, r2, 0
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08101F40: .4byte 0x04000008
_08101F44: .4byte 0x0400000a
_08101F48: .4byte 0x0400000c
_08101F4C: .4byte 0x0400000e
_08101F50: .4byte 0x04000010
_08101F54: .4byte 0x00001f08
_08101F58: .4byte 0x00001c01
_08101F5C: .4byte 0x00001d02
_08101F60: .4byte 0x00001e02
_08101F64: .4byte 0x04000048
_08101F68: .4byte 0x04000050
_08101F6C: .4byte 0x00001048
_08101F70: .4byte 0x00000809
	thumb_func_end sub_8101B04

	thumb_func_start sub_8101BA4
sub_8101BA4: @ 8101F74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	bl sub_81019EC
	ldr r5, _08102044
	movs r4, 0
	strb r4, [r5]
	strb r4, [r5, 0x2]
	bl Random
	movs r1, 0x1
	ands r1, r0
	strb r1, [r5, 0x3]
	strb r4, [r5, 0x4]
	movs r0, 0
	strh r4, [r5, 0x8]
	strb r0, [r5, 0xA]
	strb r0, [r5, 0xB]
	ldr r0, _08102048
	ldr r1, _0810204C
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r5, 0xC]
	strh r4, [r5, 0xE]
	strh r4, [r5, 0x10]
	strh r4, [r5, 0x12]
	strh r4, [r5, 0x18]
	movs r0, 0x8
	strh r0, [r5, 0x1A]
	adds r1, r5, 0
	adds r1, 0x58
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xA0
	strh r0, [r1]
	adds r0, r5, 0
	adds r0, 0x5C
	movs r1, 0x3F
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bl GetCurrentMapMusic
	adds r1, r5, 0
	adds r1, 0x60
	strh r0, [r1]
	movs r7, 0
	adds r6, r5, 0
	ldr r2, _08102050
	mov r9, r2
	movs r0, 0x1C
	adds r0, r6
	mov r8, r0
_08101FE4:
	lsls r5, r7, 1
	adds r0, r6, 0
	adds r0, 0x22
	adds r0, r5, r0
	movs r1, 0
	strh r1, [r0]
	adds r4, r6, 0
	adds r4, 0x28
	adds r4, r5, r4
	ldrb r0, [r6, 0x3]
	lsls r0, 1
	lsls r1, r7, 2
	adds r0, r1
	add r0, r9
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x15
	bl __modsi3
	strh r0, [r4]
	add r5, r8
	movs r2, 0
	ldrsh r0, [r4, r2]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	movs r2, 0xFC
	lsls r2, 1
	adds r0, r2, 0
	subs r0, r1
	strh r0, [r5]
	movs r1, 0
	ldrsh r0, [r5, r1]
	adds r1, r2, 0
	bl __modsi3
	strh r0, [r5]
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x2
	bls _08101FE4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08102044: .4byte 0x02000000
_08102048: .4byte gSaveBlock1
_0810204C: .4byte 0x00000494
_08102050: .4byte gUnknown_083ECCF8
	thumb_func_end sub_8101BA4

	thumb_func_start sub_8101C84
sub_8101C84: @ 8102054
	push {r4,lr}
	ldr r4, _0810206C
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810206C: .4byte gWindowConfig_81E7128
	thumb_func_end sub_8101C84

	thumb_func_start sub_8101CA0
sub_8101CA0: @ 8102070
	push {lr}
	bl ResetPaletteFade
	bl ResetSpriteData
	ldr r1, _0810208C
	movs r0, 0x80
	strb r0, [r1]
	bl FreeAllSpritePalettes
	bl ResetTasks
	pop {r0}
	bx r0
	.align 2, 0
_0810208C: .4byte gOamLimit
	thumb_func_end sub_8101CA0

	thumb_func_start sub_8101CC0
sub_8101CC0: @ 8102090
	push {lr}
	bl sub_8106448
	bl sub_81064B8
	bl sub_81063C0
	pop {r0}
	bx r0
	thumb_func_end sub_8101CC0

	thumb_func_start sub_8101CD4
sub_8101CD4: @ 81020A4
	push {lr}
	bl sub_8104EA8
	bl sub_8104F8C
	bl sub_8103DC8
	bl sub_81050C4
	pop {r0}
	bx r0
	thumb_func_end sub_8101CD4

	thumb_func_start sub_8101CEC
sub_8101CEC: @ 81020BC
	push {lr}
	bl sub_8104048
	bl sub_8102DA8
	bl sub_8104C5C
	bl sub_8101D04
	pop {r0}
	bx r0
	thumb_func_end sub_8101CEC

	thumb_func_start sub_8101D04
sub_8101D04: @ 81020D4
	push {r4,lr}
	ldr r4, _081020F0
	adds r0, r4, 0
	movs r1, 0
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081020F0: .4byte sub_8101D24
	thumb_func_end sub_8101D04

	thumb_func_start sub_8101D24
sub_8101D24: @ 81020F4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _08102120
	lsls r1, r0, 2
	adds r1, r0
	lsls r4, r1, 3
	ldr r6, _08102124
	ldr r5, _08102128
_08102106:
	ldrb r0, [r6]
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r4, r5
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08102106
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08102120: .4byte gUnknown_083ECAAC
_08102124: .4byte 0x02000000
_08102128: .4byte gTasks
	thumb_func_end sub_8101D24

	thumb_func_start sub_8101D5C
sub_8101D5C: @ 810212C
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r4, _08102158
	ldrb r0, [r4, 0x2]
	bl sub_810423C
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102158: .4byte 0x02000000
	thumb_func_end sub_8101D5C

	thumb_func_start sub_8101D8C
sub_8101D8C: @ 810215C
	push {lr}
	ldr r0, _08102178
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08102172
	ldr r1, _0810217C
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
_08102172:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102178: .4byte gPaletteFade
_0810217C: .4byte 0x02000000
	thumb_func_end sub_8101D8C

	thumb_func_start sub_8101DB0
sub_8101DB0: @ 8102180
	push {lr}
	ldr r2, _081021A8
	movs r0, 0
	strh r0, [r2, 0xE]
	strh r0, [r2, 0x12]
	strh r0, [r2, 0x18]
	ldrb r1, [r2, 0x4]
	movs r0, 0xC0
	ands r0, r1
	strb r0, [r2, 0x4]
	movs r0, 0x4
	strb r0, [r2]
	movs r1, 0xC
	ldrsh r0, [r2, r1]
	cmp r0, 0
	bgt _081021AC
	movs r0, 0x19
	strb r0, [r2]
	b _081021BC
	.align 2, 0
_081021A8: .4byte 0x02000000
_081021AC:
	ldrb r0, [r2, 0xA]
	cmp r0, 0
	beq _081021BC
	movs r0, 0x3
	strb r0, [r2]
	movs r0, 0x4
	bl sub_8104CAC
_081021BC:
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8101DB0

	thumb_func_start sub_8101DF4
sub_8101DF4: @ 81021C4
	push {lr}
	bl sub_8104E18
	lsls r0, 24
	cmp r0, 0
	beq _081021D6
	ldr r1, _081021DC
	movs r0, 0x4
	strb r0, [r1]
_081021D6:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081021DC: .4byte 0x02000000
	thumb_func_end sub_8101DF4

	thumb_func_start sub_8101E10
sub_8101E10: @ 81021E0
	push {lr}
	movs r0, 0
	bl sub_8104CAC
	ldr r2, _08102204
	movs r0, 0x5
	strb r0, [r2]
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	ldr r0, _08102208
	cmp r1, r0
	ble _081021FC
	movs r0, 0x17
	strb r0, [r2]
_081021FC:
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08102204: .4byte 0x02000000
_08102208: .4byte 0x0000270e
	thumb_func_end sub_8101E10

	thumb_func_start sub_8101E3C
sub_8101E3C: @ 810220C
	push {r4,lr}
	ldr r0, _08102228
	ldrh r1, [r0, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08102230
	movs r0, 0
	bl sub_8104AB8
	ldr r1, _0810222C
	movs r0, 0x8
	strb r0, [r1]
	b _081022EA
	.align 2, 0
_08102228: .4byte gMain
_0810222C: .4byte 0x02000000
_08102230:
	movs r0, 0x80
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08102292
	ldr r2, _08102288
	movs r1, 0xC
	ldrsh r0, [r2, r1]
	subs r0, 0x3
	movs r3, 0x12
	ldrsh r1, [r2, r3]
	adds r0, r1
	cmp r0, 0
	blt _0810228C
	ldrh r4, [r2, 0x12]
	adds r0, r1, 0
	cmp r0, 0x2
	bgt _0810226C
_08102254:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_8103D50
	lsls r0, r4, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08102254
_0810226C:
	ldr r1, _08102288
	ldrh r0, [r1, 0xC]
	subs r0, 0x3
	ldrh r3, [r1, 0x12]
	adds r0, r3
	strh r0, [r1, 0xC]
	movs r0, 0x3
	strh r0, [r1, 0x12]
	movs r0, 0x9
	strb r0, [r1]
	movs r0, 0x5F
	bl PlaySE
	b _081022EA
	.align 2, 0
_08102288: .4byte 0x02000000
_0810228C:
	movs r0, 0x6
	strb r0, [r2]
	b _081022EA
_08102292:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081022BC
	ldr r4, _081022F4
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081022BC
	movs r0, 0x5F
	bl PlaySE
	ldrb r0, [r4, 0x12]
	bl sub_8103D50
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
_081022BC:
	ldr r0, _081022F4
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	ldr r2, _081022F8
	adds r3, r0, 0
	cmp r1, 0x2
	bgt _081022D8
	cmp r1, 0
	beq _081022DC
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _081022DC
_081022D8:
	movs r0, 0x9
	strb r0, [r3]
_081022DC:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _081022EA
	movs r0, 0x15
	strb r0, [r3]
_081022EA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081022F4: .4byte 0x02000000
_081022F8: .4byte gMain
	thumb_func_end sub_8101E3C

	thumb_func_start sub_8101F2C
sub_8101F2C: @ 81022FC
	push {r4,lr}
	adds r4, r0, 0
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8101F2C

	thumb_func_start sub_8101F44
sub_8101F44: @ 8102314
	push {lr}
	ldr r0, _08102328
	bl sub_8101F2C
	ldr r1, _0810232C
	movs r0, 0x7
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102328: .4byte gOtherText_DontHaveThreeCoins
_0810232C: .4byte 0x02000000
	thumb_func_end sub_8101F44

	thumb_func_start sub_8101F60
sub_8101F60: @ 8102330
	push {lr}
	ldr r0, _08102350
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _08102348
	bl MenuZeroFillScreen
	ldr r1, _08102354
	movs r0, 0x5
	strb r0, [r1]
_08102348:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102350: .4byte gMain
_08102354: .4byte 0x02000000
	thumb_func_end sub_8101F60

	thumb_func_start sub_8101F88
sub_8101F88: @ 8102358
	push {lr}
	bl sub_8104AEC
	lsls r0, 24
	cmp r0, 0
	beq _0810236A
	ldr r1, _08102370
	movs r0, 0x5
	strb r0, [r1]
_0810236A:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102370: .4byte 0x02000000
	thumb_func_end sub_8101F88

	thumb_func_start sub_8101FA4
sub_8101FA4: @ 8102374
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8102484
	bl sub_8104DA4
	movs r0, 0
	bl sub_8102DEC
	movs r0, 0x1
	bl sub_8102DEC
	movs r0, 0x2
	bl sub_8102DEC
	movs r0, 0
	strh r0, [r4, 0x8]
	ldr r4, _081023AC
	ldrb r1, [r4, 0x4]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _081023B0
	bl sub_810430C
	movs r0, 0xA
	b _081023B8
	.align 2, 0
_081023AC: .4byte 0x02000000
_081023B0:
	movs r0, 0x1
	bl sub_8104CAC
	movs r0, 0xB
_081023B8:
	strb r0, [r4]
	ldr r4, _081023D4
	movs r0, 0x8
	strh r0, [r4, 0x1A]
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _081023CC
	bl dp15_jump_random_unknown
	strh r0, [r4, 0x1A]
_081023CC:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081023D4: .4byte 0x02000000
	thumb_func_end sub_8101FA4

	thumb_func_start sub_8102008
sub_8102008: @ 81023D8
	push {lr}
	bl sub_810432C
	lsls r0, 24
	cmp r0, 0
	beq _081023F8
	movs r0, 0x1
	bl sub_8104CAC
	ldr r1, _08102400
	ldrb r2, [r1, 0x4]
	movs r0, 0xDF
	ands r0, r2
	strb r0, [r1, 0x4]
	movs r0, 0xB
	strb r0, [r1]
_081023F8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102400: .4byte 0x02000000
	thumb_func_end sub_8102008

	thumb_func_start sub_8102034
sub_8102034: @ 8102404
	push {lr}
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x1D
	ble _0810241E
	bl sub_81024F0
	ldr r1, _08102424
	movs r0, 0xC
	strb r0, [r1]
_0810241E:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102424: .4byte 0x02000000
	thumb_func_end sub_8102034

	thumb_func_start sub_8102058
sub_8102058: @ 8102428
	push {r4,lr}
	ldr r0, _08102458
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810244E
	movs r0, 0x18
	bl PlaySE
	ldr r4, _0810245C
	ldrb r0, [r4, 0x18]
	bl sub_8102E1C
	ldrb r0, [r4, 0x18]
	bl sub_8103C14
	movs r0, 0xD
	strb r0, [r4]
_0810244E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102458: .4byte gMain
_0810245C: .4byte 0x02000000
	thumb_func_end sub_8102058

	thumb_func_start sub_8102090
sub_8102090: @ 8102460
	push {r4,lr}
	ldr r4, _0810248C
	ldrb r0, [r4, 0x18]
	bl sub_8102E40
	lsls r0, 24
	cmp r0, 0
	bne _08102490
	ldrh r0, [r4, 0x18]
	adds r0, 0x1
	strh r0, [r4, 0x18]
	movs r1, 0xC
	strb r1, [r4]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _08102486
	movs r0, 0xE
	strb r0, [r4]
_08102486:
	movs r0, 0x1
	b _08102492
	.align 2, 0
_0810248C: .4byte 0x02000000
_08102490:
	movs r0, 0
_08102492:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8102090

	thumb_func_start sub_81020C8
sub_81020C8: @ 8102498
	push {r4,lr}
	ldr r4, _081024F8
	ldrb r1, [r4, 0x4]
	movs r0, 0xC0
	ands r0, r1
	strb r0, [r4, 0x4]
	bl sub_81027A0
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _081024B8
	subs r0, 0x1
	strb r0, [r4, 0xA]
	ldrb r0, [r4, 0xB]
	adds r0, 0x1
	strb r0, [r4, 0xB]
_081024B8:
	ldrh r0, [r4, 0x8]
	cmp r0, 0
	beq _08102584
	movs r0, 0xF
	strb r0, [r4]
	bl sub_8102A24
	bl sub_8103F70
	ldrh r0, [r4, 0x10]
	ldrh r1, [r4, 0xE]
	subs r0, r1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bge _081024DC
	movs r0, 0
	strh r0, [r4, 0x10]
_081024DC:
	ldrh r1, [r4, 0x8]
	movs r0, 0xC0
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _08102500
	ldr r0, _081024FC
	bl PlayFanfare
	movs r0, 0x6
	bl sub_8104CAC
	b _0810252A
	.align 2, 0
_081024F8: .4byte 0x02000000
_081024FC: .4byte 0x00000185
_08102500:
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810251C
	ldr r0, _08102518
	bl PlayFanfare
	movs r0, 0x5
	bl sub_8104CAC
	b _0810252A
	.align 2, 0
_08102518: .4byte 0x00000185
_0810251C:
	movs r0, 0xC3
	lsls r0, 1
	bl PlayFanfare
	movs r0, 0x2
	bl sub_8104CAC
_0810252A:
	ldr r1, _08102580
	ldrh r3, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 1
	ands r0, r3
	adds r2, r1, 0
	cmp r0, 0
	beq _08102562
	ldrb r1, [r2, 0x4]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0
	strb r0, [r2, 0x4]
	movs r0, 0xC0
	lsls r0, 1
	ands r0, r3
	cmp r0, 0
	beq _08102562
	strb r1, [r2, 0xA]
	strb r1, [r2, 0xB]
	strb r1, [r2, 0x3]
	movs r0, 0x80
	lsls r0, 1
	ands r0, r3
	cmp r0, 0
	beq _08102562
	movs r0, 0x1
	strb r0, [r2, 0x3]
_08102562:
	ldrh r1, [r2, 0x8]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _081025A2
	ldrb r0, [r2, 0x2]
	cmp r0, 0xF
	bhi _081025A2
	adds r0, 0x1
	strb r0, [r2, 0x2]
	ldrb r0, [r2, 0x2]
	bl sub_8104064
	b _081025A2
	.align 2, 0
_08102580: .4byte 0x02000000
_08102584:
	movs r0, 0x3
	bl sub_8104CAC
	movs r0, 0x14
	strb r0, [r4]
	ldrh r0, [r4, 0x12]
	ldrh r1, [r4, 0x10]
	adds r0, r1
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	ldr r1, _081025AC
	cmp r0, r1
	ble _081025A2
	strh r1, [r4, 0x10]
_081025A2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081025AC: .4byte 0x0000270f
	thumb_func_end sub_81020C8

	thumb_func_start sub_81021E0
sub_81021E0: @ 81025B0
	push {lr}
	bl sub_8102A44
	lsls r0, 24
	cmp r0, 0
	beq _081025C2
	ldr r1, _081025C8
	movs r0, 0x10
	strb r0, [r1]
_081025C2:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081025C8: .4byte 0x02000000
	thumb_func_end sub_81021E0

	thumb_func_start sub_81021FC
sub_81021FC: @ 81025CC
	push {r4,lr}
	bl sub_8103FA0
	lsls r0, 24
	cmp r0, 0
	beq _08102626
	ldr r4, _08102630
	movs r0, 0x13
	strb r0, [r4]
	ldrh r1, [r4, 0x8]
	movs r0, 0xC0
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	beq _081025F0
	movs r0, 0x1C
	bl sav12_xor_increment
_081025F0:
	ldrh r1, [r4, 0x8]
	movs r0, 0x4
	ands r0, r1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0
	beq _08102606
	movs r0, 0
	strh r0, [r4, 0x18]
	movs r0, 0x9
	strb r0, [r4]
_08102606:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08102612
	movs r0, 0x11
	strb r0, [r4]
_08102612:
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _08102626
	cmp r2, 0
	beq _08102626
	movs r0, 0x4
	bl sub_8104CAC
	movs r0, 0x12
	strb r0, [r4]
_08102626:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102630: .4byte 0x02000000
	thumb_func_end sub_81021FC

	thumb_func_start sub_8102264
sub_8102264: @ 8102634
	push {r4,lr}
	bl sub_81040C8
	lsls r0, 24
	cmp r0, 0
	bne _08102664
	ldr r4, _0810266C
	movs r0, 0x13
	strb r0, [r4]
	ldrh r1, [r4, 0x8]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08102664
	movs r0, 0x9
	strb r0, [r4]
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	beq _08102664
	movs r0, 0x4
	bl sub_8104CAC
	movs r0, 0x12
	strb r0, [r4]
_08102664:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810266C: .4byte 0x02000000
	thumb_func_end sub_8102264

	thumb_func_start sub_81022A0
sub_81022A0: @ 8102670
	push {lr}
	bl sub_8104E18
	lsls r0, 24
	cmp r0, 0
	beq _08102690
	ldr r2, _08102698
	movs r0, 0x13
	strb r0, [r2]
	ldrh r1, [r2, 0x8]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08102690
	movs r0, 0x9
	strb r0, [r2]
_08102690:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102698: .4byte 0x02000000
	thumb_func_end sub_81022A0

	thumb_func_start sub_81022CC
sub_81022CC: @ 810269C
	push {lr}
	movs r0, 0
	bl sub_8103D8C
	movs r0, 0x1
	bl sub_8103D8C
	movs r0, 0x2
	bl sub_8103D8C
	ldr r1, _081026BC
	movs r0, 0x2
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081026BC: .4byte 0x02000000
	thumb_func_end sub_81022CC

	thumb_func_start sub_81022F0
sub_81022F0: @ 81026C0
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x40
	ble _081026DC
	movs r0, 0
	strh r0, [r1, 0xA]
	ldr r1, _081026E4
	movs r0, 0x13
	strb r0, [r1]
_081026DC:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081026E4: .4byte 0x02000000
	thumb_func_end sub_81022F0

	thumb_func_start sub_8102318
sub_8102318: @ 81026E8
	push {lr}
	ldr r0, _0810270C
	bl sub_8101F2C
	movs r0, 0x15
	movs r1, 0x7
	movs r2, 0x1
	bl DisplayYesNoMenu
	bl sub_814AB84
	ldr r1, _08102710
	movs r0, 0x16
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810270C: .4byte gOtherText_QuitGamePrompt
_08102710: .4byte 0x02000000
	thumb_func_end sub_8102318

	thumb_func_start sub_8102344
sub_8102344: @ 8102714
	push {lr}
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	bne _0810274C
	bl MenuZeroFillScreen
	movs r0, 0
	bl sub_8103D8C
	movs r0, 0x1
	bl sub_8103D8C
	movs r0, 0x2
	bl sub_8103D8C
	ldr r0, _08102748
	ldrh r1, [r0, 0x12]
	ldrh r2, [r0, 0xC]
	adds r1, r2
	strh r1, [r0, 0xC]
	movs r1, 0x1B
	strb r1, [r0]
	b _08102762
	.align 2, 0
_08102748: .4byte 0x02000000
_0810274C:
	cmp r1, 0x1
	beq _08102758
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	bne _08102762
_08102758:
	bl MenuZeroFillScreen
	ldr r1, _08102768
	movs r0, 0x5
	strb r0, [r1]
_08102762:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102768: .4byte 0x02000000
	thumb_func_end sub_8102344

	thumb_func_start sub_810239C
sub_810239C: @ 810276C
	push {lr}
	ldr r0, _08102780
	bl sub_8101F2C
	ldr r1, _08102784
	movs r0, 0x18
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102780: .4byte gOtherText_MaxCoins
_08102784: .4byte 0x02000000
	thumb_func_end sub_810239C

	thumb_func_start sub_81023B8
sub_81023B8: @ 8102788
	push {lr}
	ldr r0, _081027A8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _081027A0
	bl MenuZeroFillScreen
	ldr r1, _081027AC
	movs r0, 0x5
	strb r0, [r1]
_081027A0:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081027A8: .4byte gMain
_081027AC: .4byte 0x02000000
	thumb_func_end sub_81023B8

	thumb_func_start sub_81023E0
sub_81023E0: @ 81027B0
	push {lr}
	ldr r0, _081027C4
	bl sub_8101F2C
	ldr r1, _081027C8
	movs r0, 0x1A
	strb r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081027C4: .4byte gOtherText_OutOfCoins
_081027C8: .4byte 0x02000000
	thumb_func_end sub_81023E0

	thumb_func_start sub_81023FC
sub_81023FC: @ 81027CC
	push {lr}
	ldr r0, _081027EC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
	cmp r0, 0
	beq _081027E4
	bl MenuZeroFillScreen
	ldr r1, _081027F0
	movs r0, 0x1B
	strb r0, [r1]
_081027E4:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_081027EC: .4byte gMain
_081027F0: .4byte 0x02000000
	thumb_func_end sub_81023FC

	thumb_func_start sub_8102424
sub_8102424: @ 81027F4
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _08102824
	ldr r4, _08102828
	ldrh r1, [r4, 0xC]
	ldr r2, _0810282C
	adds r0, r2
	movs r2, 0
	strh r1, [r0]
	movs r0, 0x1
	negs r0, r0
	str r2, [sp]
	movs r1, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102824: .4byte gSaveBlock1
_08102828: .4byte 0x02000000
_0810282C: .4byte 0x00000494
	thumb_func_end sub_8102424

	thumb_func_start sub_8102460
sub_8102460: @ 8102830
	push {lr}
	ldr r0, _0810284C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08102846
	ldr r0, _08102850
	ldr r0, [r0, 0x64]
	bl SetMainCallback2
_08102846:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810284C: .4byte gPaletteFade
_08102850: .4byte 0x02000000
	thumb_func_end sub_8102460

	thumb_func_start sub_8102484
sub_8102484: @ 8102854
	push {r4,lr}
	ldr r4, _081028B4
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	bne _081028AC
	ldrb r1, [r4, 0x4]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	bne _081028AC
	bl sub_8102540
	lsls r0, 24
	cmp r0, 0
	beq _08102890
	bl sub_8102578
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	beq _08102890
	ldr r1, _081028B8
	lsls r0, r3, 1
	adds r0, r1
	ldrb r1, [r0]
	ldrb r0, [r4, 0x4]
	orrs r0, r1
	strb r0, [r4, 0x4]
	cmp r3, 0x1
	bne _081028AC
_08102890:
	bl sub_81025BC
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x5
	beq _081028AC
	ldr r2, _081028B4
	ldr r1, _081028BC
	lsls r0, r3, 1
	adds r0, r1
	ldrb r1, [r0]
	ldrb r0, [r2, 0x4]
	orrs r0, r1
	strb r0, [r2, 0x4]
_081028AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081028B4: .4byte 0x02000000
_081028B8: .4byte gUnknown_083ECE42
_081028BC: .4byte gUnknown_083ECE48
	thumb_func_end sub_8102484

	thumb_func_start sub_81024F0
sub_81024F0: @ 81028C0
	push {lr}
	ldr r1, _081028D8
	movs r0, 0
	strb r0, [r1, 0x6]
	ldrb r0, [r1, 0x4]
	cmp r0, 0
	beq _081028D2
	movs r0, 0x1
	strb r0, [r1, 0x6]
_081028D2:
	pop {r0}
	bx r0
	.align 2, 0
_081028D8: .4byte 0x02000000
	thumb_func_end sub_81024F0

	thumb_func_start sub_810250C
sub_810250C: @ 81028DC
	push {r4,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0
	movs r3, 0x1
	ldr r4, _081028F8
_081028E8:
	adds r0, r1, 0
	ands r0, r3
	cmp r0, 0
	beq _081028FC
	adds r0, r2, r4
	ldrb r0, [r0]
	b _0810290A
	.align 2, 0
_081028F8: .4byte gUnknown_083ECE3A
_081028FC:
	lsrs r1, 1
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _081028E8
	movs r0, 0
_0810290A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810250C

	thumb_func_start sub_8102540
sub_8102540: @ 8102910
	push {r4,lr}
	bl Random
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _08102938
	ldr r1, _0810293C
	movs r3, 0x12
	ldrsh r2, [r1, r3]
	ldrb r3, [r1, 0x1]
	lsls r1, r3, 1
	adds r1, r3
	subs r1, 0x1
	adds r2, r1
	adds r2, r4
	ldrb r1, [r2]
	cmp r1, r0
	bhi _08102940
	movs r0, 0
	b _08102942
	.align 2, 0
_08102938: .4byte gUnknown_083ECD04
_0810293C: .4byte 0x02000000
_08102940:
	movs r0, 0x1
_08102942:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8102540

	thumb_func_start sub_8102578
sub_8102578: @ 8102948
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _08102984
_0810294E:
	bl Random
	movs r2, 0xFF
	ldr r3, _08102988
	lsls r1, r5, 16
	asrs r4, r1, 16
	lsls r1, r4, 1
	adds r1, r4
	lsls r1, 1
	ldrb r3, [r3, 0x1]
	adds r1, r3
	adds r1, r6
	ldrb r1, [r1]
	ands r2, r0
	cmp r1, r2
	bgt _0810297A
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _0810294E
_0810297A:
	lsls r0, r5, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08102984: .4byte gUnknown_083ECD16
_08102988: .4byte 0x02000000
	thumb_func_end sub_8102578

	thumb_func_start sub_81025BC
sub_81025BC: @ 810298C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	ldr r0, _081029D0
	mov r8, r0
	ldr r5, _081029D4
	movs r7, 0x80
	lsls r7, 17
_0810299E:
	bl Random
	movs r4, 0xFF
	ands r4, r0
	lsls r2, r6, 16
	asrs r1, r2, 16
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 1
	ldrb r3, [r5, 0x1]
	adds r0, r3
	add r0, r8
	ldrb r3, [r0]
	cmp r1, 0
	bne _081029D8
	ldrb r0, [r5, 0x3]
	cmp r0, 0x1
	bne _081029D8
	adds r3, 0xA
	asrs r0, r7, 16
	cmp r3, r0
	ble _081029F2
	adds r3, r0, 0
	b _081029F2
	.align 2, 0
_081029D0: .4byte gUnknown_083ECD28
_081029D4: .4byte 0x02000000
_081029D8:
	asrs r0, r2, 16
	cmp r0, 0x4
	bne _081029F2
	ldrb r0, [r5, 0x3]
	cmp r0, 0x1
	bne _081029F2
	lsls r0, r3, 16
	ldr r1, _08102A18
	adds r0, r1
	lsrs r3, r0, 16
	cmp r0, 0
	bge _081029F2
	movs r3, 0
_081029F2:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r4
	bgt _08102A08
	movs r3, 0x80
	lsls r3, 9
	adds r0, r2, r3
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0810299E
_08102A08:
	lsls r0, r6, 24
	lsrs r0, 24
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08102A18: .4byte 0xfff60000
	thumb_func_end sub_81025BC

	thumb_func_start sub_810264C
sub_810264C: @ 8102A1C
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r3, _08102A30
	ldrb r0, [r3, 0x3]
	cmp r0, 0
	beq _08102A38
	ldr r0, _08102A34
	b _08102A3A
	.align 2, 0
_08102A30: .4byte 0x02000000
_08102A34: .4byte gUnknown_083ECDAC
_08102A38:
	ldr r0, _08102A4C
_08102A3A:
	lsls r1, r2, 4
	adds r1, r2
	ldrb r3, [r3, 0x2]
	adds r1, r3
	adds r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_08102A4C: .4byte gUnknown_083ECD46
	thumb_func_end sub_810264C

	thumb_func_start sub_8102680
sub_8102680: @ 8102A50
	push {r4-r6,lr}
	ldr r1, _08102A74
	movs r0, 0
	strb r0, [r1, 0x5]
	bl Random
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl sub_810264C
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcc _08102AA2
	movs r6, 0x5
	b _08102A7E
	.align 2, 0
_08102A74: .4byte 0x02000000
_08102A78:
	subs r0, r5, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08102A7E:
	lsls r0, r6, 16
	asrs r5, r0, 16
	cmp r5, 0
	ble _08102A9E
	bl Random
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r6, 24
	lsrs r0, 24
	bl sub_810264C
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bcs _08102A78
_08102A9E:
	ldr r0, _08102AA8
	strb r6, [r0, 0x5]
_08102AA2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08102AA8: .4byte 0x02000000
	thumb_func_end sub_8102680

	thumb_func_start sub_81026DC
sub_81026DC: @ 8102AAC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl Random
	movs r1, 0xFF
	ands r1, r0
	ldr r0, _08102ACC
	lsls r4, 1
	adds r4, r0
	ldrh r4, [r4]
	cmp r1, r4
	bcc _08102AD0
	movs r0, 0
	b _08102AD2
	.align 2, 0
_08102ACC: .4byte gUnknown_083ECE12
_08102AD0:
	movs r0, 0x1
_08102AD2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81026DC

	thumb_func_start dp15_jump_random_unknown
dp15_jump_random_unknown: @ 8102AD8
	push {r4,r5,lr}
	movs r4, 0
	ldr r0, _08102AEC
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	ldr r0, _08102AF0
	cmp r1, r0
	ble _08102AF4
	movs r4, 0x4
	b _08102B0A
	.align 2, 0
_08102AEC: .4byte 0x02000000
_08102AF0: .4byte 0x0000012b
_08102AF4:
	cmp r1, 0xF9
	ble _08102AFC
	movs r4, 0x3
	b _08102B0A
_08102AFC:
	cmp r1, 0xC7
	ble _08102B04
	movs r4, 0x2
	b _08102B0A
_08102B04:
	cmp r1, 0x95
	ble _08102B0A
	movs r4, 0x1
_08102B0A:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r5, _08102B2C
	lsls r4, 2
	adds r0, r4, r5
	ldrb r0, [r0]
	cmp r1, r0
	bcs _08102B30
	movs r0, 0x4
	b _08102B6A
	.align 2, 0
_08102B2C: .4byte gUnknown_083ECE1C
_08102B30:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	lsls r0, 24
	adds r2, r5, 0x2
	adds r2, r4, r2
	ldr r3, _08102B60
	ldr r1, _08102B64
	ldrb r1, [r1, 0xB]
	lsls r1, 1
	adds r1, r3
	ldrb r1, [r1]
	ldrb r2, [r2]
	adds r1, r2
	lsls r1, 24
	cmp r0, r1
	bcc _08102B68
	movs r0, 0x8
	b _08102B6A
	.align 2, 0
_08102B60: .4byte gUnknown_083ECE30
_08102B64: .4byte 0x02000000
_08102B68:
	movs r0, 0x2
_08102B6A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end dp15_jump_random_unknown

	thumb_func_start sub_81027A0
sub_81027A0: @ 8102B70
	push {r4,lr}
	ldr r4, _08102B9C
	movs r0, 0
	strh r0, [r4, 0x8]
	bl sub_81027D0
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	ble _08102B88
	bl sub_8102840
_08102B88:
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	cmp r0, 0x2
	ble _08102B94
	bl sub_810290C
_08102B94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102B9C: .4byte 0x02000000
	thumb_func_end sub_81027A0

	thumb_func_start sub_81027D0
sub_81027D0: @ 8102BA0
	push {r4,r5,lr}
	movs r0, 0
	movs r1, 0x2
	bl sub_8102BA4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x1
	movs r1, 0x2
	bl sub_8102BA4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x2
	movs r1, 0x2
	bl sub_8102BA4
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81029D4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9
	beq _08102BFE
	ldr r2, _08102C04
	ldr r0, _08102C08
	lsls r1, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, 0xE]
	adds r0, r3
	strh r0, [r2, 0xE]
	ldr r0, _08102C0C
	adds r1, r0
	ldrh r0, [r2, 0x8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, 0x8]
	movs r0, 0
	bl sub_8103E04
_08102BFE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102C04: .4byte 0x02000000
_08102C08: .4byte gUnknown_083ECE6C
_08102C0C: .4byte gUnknown_083ECE5A
	thumb_func_end sub_81027D0

	thumb_func_start sub_8102840
sub_8102840: @ 8102C10
	push {r4,r5,lr}
	movs r0, 0
	movs r1, 0x1
	bl sub_8102BA4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x1
	movs r1, 0x1
	bl sub_8102BA4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8102BA4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81029D4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9
	beq _08102C6E
	cmp r1, 0
	bne _08102C4C
	movs r1, 0x1
_08102C4C:
	ldr r2, _08102CD0
	ldr r0, _08102CD4
	lsls r1, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, 0xE]
	adds r0, r3
	strh r0, [r2, 0xE]
	ldr r0, _08102CD8
	adds r1, r0
	ldrh r0, [r2, 0x8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, 0x8]
	movs r0, 0x1
	bl sub_8103E04
_08102C6E:
	movs r0, 0
	movs r1, 0x3
	bl sub_8102BA4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x1
	movs r1, 0x3
	bl sub_8102BA4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	movs r1, 0x3
	bl sub_8102BA4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81029D4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9
	beq _08102CCA
	cmp r1, 0
	bne _08102CA8
	movs r1, 0x1
_08102CA8:
	ldr r2, _08102CD0
	ldr r0, _08102CD4
	lsls r1, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, 0xE]
	adds r0, r3
	strh r0, [r2, 0xE]
	ldr r0, _08102CD8
	adds r1, r0
	ldrh r0, [r2, 0x8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, 0x8]
	movs r0, 0x2
	bl sub_8103E04
_08102CCA:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102CD0: .4byte 0x02000000
_08102CD4: .4byte gUnknown_083ECE6C
_08102CD8: .4byte gUnknown_083ECE5A
	thumb_func_end sub_8102840

	thumb_func_start sub_810290C
sub_810290C: @ 8102CDC
	push {r4,r5,lr}
	movs r0, 0
	movs r1, 0x1
	bl sub_8102BA4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x1
	movs r1, 0x2
	bl sub_8102BA4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	movs r1, 0x3
	bl sub_8102BA4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81029D4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9
	beq _08102D38
	cmp r1, 0
	beq _08102D32
	ldr r2, _08102D98
	ldr r0, _08102D9C
	lsls r1, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, 0xE]
	adds r0, r3
	strh r0, [r2, 0xE]
	ldr r0, _08102DA0
	adds r1, r0
	ldrh r0, [r2, 0x8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, 0x8]
_08102D32:
	movs r0, 0x3
	bl sub_8103E04
_08102D38:
	movs r0, 0
	movs r1, 0x3
	bl sub_8102BA4
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x1
	movs r1, 0x2
	bl sub_8102BA4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x2
	movs r1, 0x1
	bl sub_8102BA4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_81029D4
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x9
	beq _08102D92
	cmp r1, 0
	beq _08102D8C
	ldr r2, _08102D98
	ldr r0, _08102D9C
	lsls r1, 1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r3, [r2, 0xE]
	adds r0, r3
	strh r0, [r2, 0xE]
	ldr r0, _08102DA0
	adds r1, r0
	ldrh r0, [r2, 0x8]
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2, 0x8]
_08102D8C:
	movs r0, 0x4
	bl sub_8103E04
_08102D92:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102D98: .4byte 0x02000000
_08102D9C: .4byte gUnknown_083ECE6C
_08102DA0: .4byte gUnknown_083ECE5A
	thumb_func_end sub_810290C

	thumb_func_start sub_81029D4
sub_81029D4: @ 8102DA4
	push {lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r3, r1
	bne _08102DC8
	cmp r3, r2
	bne _08102DC8
	ldr r0, _08102DC4
	adds r0, r3, r0
	ldrb r0, [r0]
	b _08102DEE
	.align 2, 0
_08102DC4: .4byte gUnknown_083ECE52
_08102DC8:
	cmp r3, 0
	bne _08102DD4
	cmp r1, 0
	bne _08102DD4
	cmp r2, 0x1
	beq _08102DE0
_08102DD4:
	cmp r3, 0x1
	bne _08102DE4
	cmp r1, 0x1
	bne _08102DE4
	cmp r2, 0
	bne _08102DE4
_08102DE0:
	movs r0, 0x6
	b _08102DEE
_08102DE4:
	cmp r3, 0x4
	beq _08102DEC
	movs r0, 0x9
	b _08102DEE
_08102DEC:
	movs r0, 0
_08102DEE:
	pop {r1}
	bx r1
	thumb_func_end sub_81029D4

	thumb_func_start sub_8102A24
sub_8102A24: @ 8102DF4
	push {r4,lr}
	ldr r4, _08102E10
	adds r0, r4, 0
	movs r1, 0x4
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08102E10: .4byte sub_8102A64
	thumb_func_end sub_8102A24

	thumb_func_start sub_8102A44
sub_8102A44: @ 8102E14
	push {lr}
	ldr r0, _08102E28
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08102E2C
	movs r0, 0
	b _08102E2E
	.align 2, 0
_08102E28: .4byte sub_8102A64
_08102E2C:
	movs r0, 0x1
_08102E2E:
	pop {r1}
	bx r1
	thumb_func_end sub_8102A44

	thumb_func_start sub_8102A64
sub_8102A64: @ 8102E34
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08102E64
	ldr r2, _08102E68
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08102E46:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _08102E46
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08102E64: .4byte gUnknown_083ECB20
_08102E68: .4byte gTasks
	thumb_func_end sub_8102A64

	thumb_func_start sub_8102A9C
sub_8102A9C: @ 8102E6C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8103E38
	lsls r0, 24
	cmp r0, 0
	beq _08102E98
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r0, _08102E94
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08102E98
	movs r0, 0x2
	strh r0, [r4, 0x8]
	movs r0, 0x1
	b _08102E9A
	.align 2, 0
_08102E94: .4byte 0x02000000
_08102E98:
	movs r0, 0
_08102E9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8102A9C

	thumb_func_start sub_8102AD0
sub_8102AD0: @ 8102EA0
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	subs r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _08102EF2
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08102EC6
	movs r0, 0x15
	bl PlaySE
_08102EC6:
	ldr r2, _08102F40
	ldrh r0, [r2, 0xE]
	subs r0, 0x1
	strh r0, [r2, 0xE]
	ldrh r3, [r2, 0xC]
	movs r0, 0xC
	ldrsh r1, [r2, r0]
	ldr r0, _08102F44
	cmp r1, r0
	bgt _08102EDE
	adds r0, r3, 0x1
	strh r0, [r2, 0xC]
_08102EDE:
	movs r0, 0x8
	strh r0, [r4, 0xA]
	ldr r0, _08102F48
	ldrh r1, [r0, 0x2C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08102EF2
	movs r0, 0x4
	strh r0, [r4, 0xA]
_08102EF2:
	bl IsFanfareTaskInactive
	lsls r0, 24
	cmp r0, 0
	beq _08102F28
	ldr r0, _08102F48
	ldrh r1, [r0, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08102F28
	movs r0, 0x15
	bl PlaySE
	ldr r1, _08102F40
	ldrh r0, [r1, 0xE]
	ldrh r2, [r1, 0xC]
	adds r0, r2
	strh r0, [r1, 0xC]
	lsls r0, 16
	asrs r0, 16
	ldr r2, _08102F4C
	cmp r0, r2
	ble _08102F24
	strh r2, [r1, 0xC]
_08102F24:
	movs r0, 0
	strh r0, [r1, 0xE]
_08102F28:
	ldr r0, _08102F40
	movs r1, 0xE
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bne _08102F38
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08102F38:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102F40: .4byte 0x02000000
_08102F44: .4byte 0x0000270e
_08102F48: .4byte gMain
_08102F4C: .4byte 0x0000270f
	thumb_func_end sub_8102AD0

	thumb_func_start sub_8102B80
sub_8102B80: @ 8102F50
	push {lr}
	bl sub_8103E7C
	lsls r0, 24
	cmp r0, 0
	beq _08102F6A
	ldr r0, _08102F70
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08102F6A:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08102F70: .4byte sub_8102A64
	thumb_func_end sub_8102B80

	thumb_func_start sub_8102BA4
sub_8102BA4: @ 8102F74
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	ldr r0, _08102FC0
	lsls r2, r4, 1
	adds r0, 0x28
	adds r2, r0
	movs r3, 0
	ldrsh r0, [r2, r3]
	lsls r1, 16
	asrs r1, 16
	adds r0, r1
	movs r1, 0x15
	bl __modsi3
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _08102FA4
	adds r0, 0x15
	lsls r0, 16
	lsrs r1, r0, 16
_08102FA4:
	ldr r2, _08102FC4
	lsls r1, 16
	asrs r1, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 2
	adds r0, r4
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08102FC0: .4byte 0x02000000
_08102FC4: .4byte gUnknown_083ECCB2
	thumb_func_end sub_8102BA4

	thumb_func_start sub_8102BF8
sub_8102BF8: @ 8102FC8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	movs r6, 0
	ldr r0, _08103010
	lsls r1, r5, 1
	adds r0, 0x1C
	adds r1, r0
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	beq _08102FF0
	ldr r6, _08103014
_08102FF0:
	lsls r1, r4, 16
	asrs r1, 16
	lsls r0, r6, 16
	asrs r0, 16
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	adds r0, r5, 0
	bl sub_8102BA4
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08103010: .4byte 0x02000000
_08103014: .4byte 0x0000ffff
	thumb_func_end sub_8102BF8

	thumb_func_start sub_8102C48
sub_8102C48: @ 8103018
	push {lr}
	ldr r1, _0810304C
	movs r2, 0x16
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	adds r1, r0
	adds r0, r1, 0
	movs r1, 0x6
	bl __modsi3
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0
	bge _0810303E
	adds r0, 0x6
	lsls r0, 16
	lsrs r1, r0, 16
_0810303E:
	ldr r0, _08103050
	lsls r1, 16
	asrs r1, 16
	adds r1, r0
	ldrb r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0810304C: .4byte 0x02000000
_08103050: .4byte gUnknown_083ECCF1
	thumb_func_end sub_8102C48

	thumb_func_start sub_8102C84
sub_8102C84: @ 8103054
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	ldr r6, _08103098
	lsrs r5, 23
	adds r4, r6, 0
	adds r4, 0x1C
	adds r4, r5, r4
	lsls r1, 16
	asrs r1, 16
	ldrh r0, [r4]
	adds r1, r0
	strh r1, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0xFC
	lsls r1, 1
	bl __modsi3
	strh r0, [r4]
	adds r6, 0x28
	adds r5, r6
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x18
	bl __divsi3
	movs r1, 0x15
	subs r1, r0
	strh r1, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08103098: .4byte 0x02000000
	thumb_func_end sub_8102C84

	thumb_func_start sub_8102CCC
sub_8102CCC: @ 810309C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	adds r6, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	ldr r0, _081030F4
	lsls r1, r6, 1
	adds r0, 0x1C
	adds r5, r1, r0
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r2, r0, 16
	asrs r1, r2, 16
	cmp r1, 0
	beq _081030E8
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	bge _081030D0
	lsrs r4, r2, 16
_081030D0:
	lsls r1, r4, 16
	asrs r1, 16
	adds r0, r6, 0
	bl sub_8102C84
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
_081030E8:
	lsls r0, 16
	asrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_081030F4: .4byte 0x02000000
	thumb_func_end sub_8102CCC

	thumb_func_start sub_8102D28
sub_8102D28: @ 81030F8
	push {r4,lr}
	ldr r4, _08103128
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4, 0x14]
	adds r0, r1
	strh r0, [r4, 0x14]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r1, 0x78
	bl __modsi3
	strh r0, [r4, 0x14]
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r1, 0x14
	bl __divsi3
	movs r1, 0x6
	subs r1, r0
	strh r1, [r4, 0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08103128: .4byte 0x02000000
	thumb_func_end sub_8102D28

	thumb_func_start sub_8102D5C
sub_8102D5C: @ 810312C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r5, _08103174
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	movs r1, 0x14
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
	lsls r2, r0, 16
	asrs r1, r2, 16
	cmp r1, 0
	beq _0810316A
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	bge _08103154
	lsrs r4, r2, 16
_08103154:
	lsls r0, r4, 16
	asrs r0, 16
	bl sub_8102D28
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	movs r1, 0x14
	bl __modsi3
	lsls r0, 16
	lsrs r0, 16
_0810316A:
	lsls r0, 16
	asrs r0, 16
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08103174: .4byte 0x02000000
	thumb_func_end sub_8102D5C

	thumb_func_start sub_8102DA8
sub_8102DA8: @ 8103178
	push {r4-r7,lr}
	movs r4, 0
	ldr r5, _081031B0
	ldr r7, _081031B4
	ldr r6, _081031B8
_08103182:
	adds r0, r5, 0
	movs r1, 0x2
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r7
	strh r4, [r1, 0x26]
	adds r1, r4, r6
	strb r0, [r1]
	bl _call_via_r5
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _08103182
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081031B0: .4byte sub_8102E68
_081031B4: .4byte gTasks
_081031B8: .4byte 0x0200003a
	thumb_func_end sub_8102DA8

	thumb_func_start sub_8102DEC
sub_8102DEC: @ 81031BC
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _081031E4
	ldr r1, _081031E8
	adds r1, 0x3A
	adds r0, r1
	ldrb r2, [r0]
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r3
	movs r2, 0x1
	strh r2, [r1, 0x8]
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r3
	strh r2, [r0, 0x24]
	bx lr
	.align 2, 0
_081031E4: .4byte gTasks
_081031E8: .4byte 0x02000000
	thumb_func_end sub_8102DEC

	thumb_func_start sub_8102E1C
sub_8102E1C: @ 81031EC
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08103208
	ldr r1, _0810320C
	adds r1, 0x3A
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r1, 0x2
	strh r1, [r0, 0x8]
	bx lr
	.align 2, 0
_08103208: .4byte gTasks
_0810320C: .4byte 0x02000000
	thumb_func_end sub_8102E1C

	thumb_func_start sub_8102E40
sub_8102E40: @ 8103210
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08103230
	ldr r1, _08103234
	adds r1, 0x3A
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x24]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08103230: .4byte gTasks
_08103234: .4byte 0x02000000
	thumb_func_end sub_8102E40

	thumb_func_start sub_8102E68
sub_8102E68: @ 8103238
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08103268
	ldr r2, _0810326C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0810324A:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0810324A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08103268: .4byte gUnknown_083ECB2C
_0810326C: .4byte gTasks
	thumb_func_end sub_8102E68

	thumb_func_start sub_8102EA0
sub_8102EA0: @ 8103270
	movs r0, 0
	bx lr
	thumb_func_end sub_8102EA0

	thumb_func_start sub_8102EA4
sub_8102EA4: @ 8103274
	push {lr}
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810328C
	movs r2, 0x1A
	ldrsh r1, [r1, r2]
	bl sub_8102C84
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810328C: .4byte 0x02000000
	thumb_func_end sub_8102EA4

	thumb_func_start sub_8102EC0
sub_8102EC0: @ 8103290
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0x8]
	ldr r3, _08103310
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x34
	adds r0, r1
	strh r2, [r0]
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r1, r3, 0
	adds r1, 0x2E
	adds r0, r1
	strh r2, [r0]
	ldrb r0, [r3, 0xA]
	cmp r0, 0
	bne _081032F8
	ldrb r0, [r3, 0x4]
	cmp r0, 0
	beq _081032E2
	ldrb r0, [r3, 0x6]
	cmp r0, 0
	beq _081032E2
	ldr r1, _08103314
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	cmp r0, 0
	bne _081032F8
_081032E2:
	ldr r1, _08103310
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r1, _08103318
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
_081032F8:
	ldr r0, _08103310
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r0, 0x2E
	adds r1, r0
	ldrh r0, [r1]
	strh r0, [r4, 0xA]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08103310: .4byte 0x02000000
_08103314: .4byte gUnknown_083ECB40
_08103318: .4byte gUnknown_083ECB4C
	thumb_func_end sub_8102EC0

	thumb_func_start sub_8102F4C
sub_8102F4C: @ 810331C
	push {r4-r7,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _0810335C
	mov r0, sp
	movs r2, 0xA
	bl memcpy
	ldr r5, _08103360
	movs r1, 0x26
	ldrsh r0, [r4, r1]
	lsls r6, r0, 1
	adds r7, r5, 0
	adds r7, 0x1C
	adds r0, r6, r7
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, 0
	beq _08103364
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0x1A
	ldrsh r1, [r5, r6]
	bl sub_8102CCC
	b _08103398
	.align 2, 0
_0810335C: .4byte gUnknown_083ECB58
_08103360: .4byte 0x02000000
_08103364:
	adds r0, r5, 0
	adds r0, 0x2E
	adds r1, r6, r0
	ldrh r3, [r1]
	movs r6, 0
	ldrsh r0, [r1, r6]
	cmp r0, 0
	beq _0810339C
	subs r0, r3, 0x1
	strh r0, [r1]
	ldrh r0, [r4, 0x26]
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0x1A
	ldrsh r1, [r5, r2]
	bl sub_8102C84
	movs r6, 0x26
	ldrsh r0, [r4, r6]
	lsls r0, 1
	adds r0, r7
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x18
	bl __modsi3
_08103398:
	lsls r0, 16
	lsrs r2, r0, 16
_0810339C:
	cmp r2, 0
	bne _081033C8
	ldr r1, _081033D4
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r1, 0x2E
	adds r0, r1
	movs r6, 0
	ldrsh r1, [r0, r6]
	cmp r1, 0
	bne _081033C8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0xA]
	strh r1, [r4, 0xC]
_081033C8:
	movs r0, 0
	add sp, 0xC
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081033D4: .4byte 0x02000000
	thumb_func_end sub_8102F4C

	thumb_func_start sub_8103008
sub_8103008: @ 81033D8
	push {r4,lr}
	adds r2, r0, 0
	ldr r1, _08103428
	movs r3, 0x26
	ldrsh r0, [r2, r3]
	lsls r0, 1
	adds r4, r1, 0
	adds r4, 0x22
	adds r0, r4
	ldrh r1, [r2, 0xA]
	strh r1, [r0]
	ldrh r0, [r2, 0xA]
	negs r3, r0
	strh r3, [r2, 0xA]
	ldrh r0, [r2, 0xC]
	adds r0, 0x1
	strh r0, [r2, 0xC]
	movs r1, 0x3
	ands r0, r1
	cmp r0, 0
	bne _08103408
	lsls r0, r3, 16
	asrs r0, 17
	strh r0, [r2, 0xA]
_08103408:
	movs r0, 0xA
	ldrsh r3, [r2, r0]
	cmp r3, 0
	bne _0810341E
	strh r3, [r2, 0x8]
	strh r3, [r2, 0x24]
	movs r1, 0x26
	ldrsh r0, [r2, r1]
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
_0810341E:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08103428: .4byte 0x02000000
	thumb_func_end sub_8103008

	thumb_func_start sub_810305C
sub_810305C: @ 810342C
	push {r4,r5,lr}
	ldr r4, _0810346C
	ldrb r0, [r4, 0x4]
	bl sub_810250C
	lsls r0, 24
	lsrs r3, r0, 24
	adds r5, r3, 0
	ldrb r1, [r4, 0x4]
	movs r0, 0xC0
	ands r0, r1
	cmp r0, 0
	beq _0810344A
	movs r5, 0
	movs r3, 0x1
_0810344A:
	ldr r1, _08103470
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r2, [r0]
	adds r0, r5, 0
	adds r1, r3, 0
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810346C: .4byte 0x02000000
_08103470: .4byte gUnknown_083ECB64
	thumb_func_end sub_810305C

	thumb_func_start sub_81030A4
sub_81030A4: @ 8103474
	push {r4,r5,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 16
	asrs r3, 16
	movs r0, 0
	adds r1, r3, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, r4
	beq _0810349C
	cmp r0, r5
	bne _081034A8
_0810349C:
	ldr r0, _081034A4
	strb r1, [r0, 0x7]
	movs r0, 0x1
	b _081034AA
	.align 2, 0
_081034A4: .4byte 0x02000000
_081034A8:
	movs r0, 0
_081034AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_81030A4

	thumb_func_start sub_81030E0
sub_81030E0: @ 81034B0
	push {r4,lr}
	movs r1, 0x1
	lsls r0, 16
	asrs r4, r0, 16
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _081034F8
	movs r1, 0x2
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _081034F8
	movs r1, 0x3
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _081034FC
_081034F8:
	movs r0, 0x1
	b _081034FE
_081034FC:
	movs r0, 0
_081034FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_81030E0

	thumb_func_start sub_8103134
sub_8103134: @ 8103504
	push {lr}
	ldr r0, _08103518
	ldrb r1, [r0, 0x4]
	movs r0, 0xC2
	ands r0, r1
	cmp r0, 0
	bne _0810351C
	movs r0, 0
	b _0810351E
	.align 2, 0
_08103518: .4byte 0x02000000
_0810351C:
	movs r0, 0x1
_0810351E:
	pop {r1}
	bx r1
	thumb_func_end sub_8103134

	thumb_func_start sub_8103154
sub_8103154: @ 8103524
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r7, r1, 24
	movs r5, 0
	movs r0, 0x2
	mov r9, r0
	ldr r6, _08103564
_0810353E:
	lsls r0, r5, 16
	asrs r4, r0, 16
	mov r1, r9
	subs r0, r1, r4
	lsls r0, 16
	asrs r0, 16
	mov r1, r8
	adds r2, r7, 0
	bl sub_81030A4
	lsls r0, 24
	cmp r0, 0
	beq _08103568
	movs r0, 0x2
	strh r0, [r6, 0x34]
	strh r5, [r6, 0x2E]
	movs r0, 0x1
	b _08103576
	.align 2, 0
_08103564: .4byte 0x02000000
_08103568:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0810353E
	movs r0, 0
_08103576:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8103154

	thumb_func_start sub_81031B4
sub_81031B4: @ 8103584
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	bl sub_8103134
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _081035B2
	movs r0, 0
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _081035EE
_081035B2:
	movs r0, 0x1
	mov r8, r0
	ldr r5, _081035DC
	movs r7, 0
_081035BA:
	mov r1, r8
	lsls r0, r1, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	mov r1, r10
	mov r2, r9
	bl sub_81030A4
	lsls r0, 24
	cmp r0, 0
	beq _081035E0
	mov r0, r8
	strh r0, [r5, 0x34]
	strh r7, [r5, 0x2E]
	movs r0, 0x1
	b _08103682
	.align 2, 0
_081035DC: .4byte 0x02000000
_081035E0:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	mov r8, r1
	asrs r0, 16
	cmp r0, 0x3
	ble _081035BA
_081035EE:
	movs r0, 0x1
	mov r8, r0
	adds r7, r6, 0
	ldr r6, _0810363C
_081035F6:
	mov r1, r8
	lsls r5, r1, 16
	cmp r7, 0
	bne _0810360A
	asrs r0, r5, 16
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _08103670
_0810360A:
	movs r0, 0x1
	asrs r4, r5, 16
	subs r0, r4
	lsls r0, 16
	asrs r0, 16
	mov r1, r10
	mov r2, r9
	bl sub_81030A4
	lsls r0, 24
	cmp r0, 0
	beq _08103670
	cmp r4, 0x1
	bne _08103640
	cmp r7, 0
	bne _08103636
	movs r0, 0x3
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _08103640
_08103636:
	movs r0, 0x3
	strh r0, [r6, 0x34]
	b _0810366A
	.align 2, 0
_0810363C: .4byte 0x02000000
_08103640:
	asrs r0, r5, 16
	cmp r0, 0x3
	bgt _08103664
	adds r4, r0, 0x1
	cmp r7, 0
	bne _0810365A
	lsls r0, r4, 16
	asrs r0, 16
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _08103664
_0810365A:
	movs r0, 0x2
	strh r0, [r6, 0x34]
	strh r4, [r6, 0x2E]
	movs r0, 0x1
	b _08103682
_08103664:
	movs r0, 0x1
	strh r0, [r6, 0x34]
	mov r0, r8
_0810366A:
	strh r0, [r6, 0x2E]
	movs r0, 0x1
	b _08103682
_08103670:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r5, r1
	lsrs r1, r0, 16
	mov r8, r1
	asrs r0, 16
	cmp r0, 0x4
	ble _081035F6
	movs r0, 0
_08103682:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81031B4

	thumb_func_start sub_81032C0
sub_81032C0: @ 8103690
	push {lr}
	ldr r1, _081036B0
	ldr r0, _081036B4
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_081036B0: .4byte gUnknown_083ECB70
_081036B4: .4byte 0x02000000
	thumb_func_end sub_81032C0

	thumb_func_start sub_81032E8
sub_81032E8: @ 81036B8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r0, _081036F0
	movs r6, 0
	ldrh r1, [r0, 0x34]
	mov r8, r1
	movs r1, 0x34
	ldrsh r7, [r0, r1]
	adds r5, r0, 0
_081036CC:
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x7]
	cmp r0, r1
	bne _081036F4
	mov r0, r8
	strh r0, [r5, 0x36]
	strh r6, [r5, 0x30]
	movs r0, 0x1
	b _08103702
	.align 2, 0
_081036F0: .4byte 0x02000000
_081036F4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081036CC
	movs r0, 0
_08103702:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_81032E8

	thumb_func_start sub_810333C
sub_810333C: @ 810370C
	push {r4-r7,lr}
	bl sub_81032E8
	lsls r0, 24
	cmp r0, 0
	beq _0810376A
	ldr r1, _0810375C
	movs r2, 0x34
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _08103766
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	ble _08103766
	cmp r0, 0x4
	beq _08103766
	movs r5, 0
	movs r7, 0x2
	adds r6, r1, 0
_08103734:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6, 0x7]
	cmp r0, r1
	beq _08103760
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103734
	b _08103766
	.align 2, 0
_0810375C: .4byte 0x02000000
_08103760:
	movs r0, 0x2
	strh r0, [r6, 0x36]
	strh r5, [r6, 0x30]
_08103766:
	movs r0, 0x1
	b _081037A2
_0810376A:
	ldr r1, _081037A8
	movs r2, 0x34
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	beq _081037A0
	movs r5, 0
	movs r7, 0x2
	adds r6, r1, 0
_0810377A:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6, 0x7]
	cmp r0, r1
	beq _08103760
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0810377A
_081037A0:
	movs r0, 0
_081037A2:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_081037A8: .4byte 0x02000000
	thumb_func_end sub_810333C

	thumb_func_start sub_81033DC
sub_81033DC: @ 81037AC
	push {r4,lr}
	ldr r0, _081037E4
	ldrb r3, [r0, 0x7]
	adds r4, r3, 0
	ldrb r2, [r0, 0x4]
	movs r1, 0x40
	ands r1, r2
	cmp r1, 0
	beq _081037C6
	movs r3, 0
	cmp r4, 0
	bne _081037C6
	movs r3, 0x1
_081037C6:
	ldr r1, _081037E8
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	adds r0, r3, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_081037E4: .4byte 0x02000000
_081037E8: .4byte gUnknown_083ECB7C
	thumb_func_end sub_81033DC

	thumb_func_start sub_810341C
sub_810341C: @ 81037EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _0810382C
	movs r5, 0
	ldrh r1, [r0, 0x36]
	mov r8, r1
	movs r1, 0x36
	ldrsh r7, [r0, r1]
	adds r6, r0, 0
_08103808:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r9
	bne _08103830
	mov r0, r8
	strh r0, [r6, 0x38]
	strh r5, [r6, 0x32]
	movs r0, 0x1
	b _0810383E
	.align 2, 0
_0810382C: .4byte 0x02000000
_08103830:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103808
	movs r0, 0
_0810383E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810341C

	thumb_func_start sub_810347C
sub_810347C: @ 810384C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08103870
	movs r2, 0x34
	ldrsh r1, [r0, r2]
	movs r2, 0x36
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bne _08103884
	adds r0, r6, 0
	bl sub_810341C
	lsls r0, 24
	lsrs r0, 24
	b _081038BA
	.align 2, 0
_08103870: .4byte 0x02000000
_08103874:
	ldr r0, _08103880
	strh r5, [r0, 0x32]
	mov r1, r8
	strh r1, [r0, 0x38]
	movs r0, 0x1
	b _081038BA
	.align 2, 0
_08103880: .4byte 0x02000000
_08103884:
	movs r2, 0x1
	mov r8, r2
	cmp r1, 0x1
	bne _08103890
	movs r0, 0x3
	mov r8, r0
_08103890:
	movs r5, 0
	mov r7, r8
_08103894:
	lsls r0, r5, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r6
	beq _08103874
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103894
	movs r0, 0
_081038BA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810347C

	thumb_func_start sub_81034F4
sub_81034F4: @ 81038C4
	push {r4,r5,lr}
	movs r5, 0
	b _081038D0
_081038CA:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_081038D0:
	lsls r0, r5, 16
	asrs r4, r0, 16
	adds r0, r4, 0
	bl sub_81030E0
	lsls r0, 24
	cmp r0, 0
	bne _081038CA
	ldr r0, _081038EC
	strh r5, [r0, 0x2E]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081038EC: .4byte 0x02000000
	thumb_func_end sub_81034F4

	thumb_func_start sub_8103520
sub_8103520: @ 81038F0
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	cmp r0, 0
	bne _081038FE
	movs r0, 0x1
	b _08103908
_081038FE:
	cmp r0, 0x1
	beq _08103906
	movs r0, 0
	b _0810390C
_08103906:
	movs r0, 0
_08103908:
	strb r0, [r1]
	movs r0, 0x1
_0810390C:
	pop {r1}
	bx r1
	thumb_func_end sub_8103520

	thumb_func_start sub_8103540
sub_8103540: @ 8103910
	push {lr}
	ldr r1, _0810392C
	ldr r0, _08103930
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_0810392C: .4byte gUnknown_083ECB88
_08103930: .4byte 0x02000000
	thumb_func_end sub_8103540

	thumb_func_start sub_8103564
sub_8103564: @ 8103934
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	ldr r4, _081039A0
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _081039B0
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _081039B0
	ldrh r0, [r4, 0x2E]
	movs r1, 0x2
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl sub_8103520
	lsls r0, 24
	cmp r0, 0
	beq _081039B0
	movs r5, 0
	mov r7, sp
	movs r0, 0x2
	mov r8, r0
	adds r6, r4, 0
_0810397A:
	lsls r0, r5, 16
	asrs r4, r0, 16
	mov r0, r8
	subs r1, r0, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _081039A4
	movs r0, 0x2
	strh r0, [r6, 0x36]
	strh r5, [r6, 0x30]
	b _081039B0
	.align 2, 0
_081039A0: .4byte 0x02000000
_081039A4:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _0810397A
_081039B0:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8103564

	thumb_func_start j5_08111E84
j5_08111E84: @ 81039BC
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _08103A20
	ldrh r2, [r4, 0x34]
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08103A30
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08103A30
	ldrh r1, [r4, 0x2E]
	subs r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl sub_8103520
	lsls r0, 24
	cmp r0, 0
	beq _08103A30
	movs r6, 0
	mov r7, sp
	adds r5, r4, 0
_081039FA:
	ldrh r1, [r5, 0x34]
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _08103A24
	ldrh r0, [r5, 0x34]
	strh r0, [r5, 0x36]
	strh r6, [r5, 0x30]
	b _08103A30
	.align 2, 0
_08103A20: .4byte 0x02000000
_08103A24:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _081039FA
_08103A30:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end j5_08111E84

	thumb_func_start sub_8103668
sub_8103668: @ 8103A38
	push {r4-r7,lr}
	sub sp, 0x4
	ldr r4, _08103A5C
	ldrh r3, [r4, 0x34]
	movs r0, 0x34
	ldrsh r2, [r4, r0]
	cmp r2, 0
	beq _08103B2A
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08103B2A
	cmp r2, 0x2
	bne _08103A7E
	bl j5_08111E84
	b _08103B2A
	.align 2, 0
_08103A5C: .4byte 0x02000000
_08103A60:
	ldr r0, _08103A6C
	movs r1, 0
	strh r6, [r0, 0x36]
	strh r1, [r0, 0x30]
	b _08103B2A
	.align 2, 0
_08103A6C: .4byte 0x02000000
_08103A70:
	movs r0, 0x2
	strh r0, [r5, 0x36]
	adds r0, r4, 0x1
	strh r0, [r5, 0x30]
	b _08103B2A
_08103A7A:
	movs r0, 0x3
	b _08103B06
_08103A7E:
	ldrh r1, [r4, 0x2E]
	subs r1, r3, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	mov r1, sp
	strb r0, [r1]
	mov r0, sp
	bl sub_8103520
	lsls r0, 24
	cmp r0, 0
	beq _08103B2A
	movs r6, 0x2
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	bne _08103AA8
	movs r6, 0x3
_08103AA8:
	movs r5, 0
	mov r7, sp
_08103AAC:
	lsls r0, r6, 16
	asrs r4, r0, 16
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	beq _08103A60
	lsls r1, r5, 16
	movs r0, 0x80
	lsls r0, 9
	adds r1, r0
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	lsrs r5, r1, 16
	asrs r1, 16
	cmp r1, 0x1
	ble _08103AAC
	movs r6, 0x1
	mov r7, sp
	ldr r5, _08103B0C
_08103ADE:
	ldrh r1, [r5, 0x34]
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	ldrb r1, [r7]
	lsls r0, 24
	lsrs r0, 24
	cmp r1, r0
	bne _08103B1E
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	bne _08103B10
	cmp r4, 0x2
	ble _08103A70
_08103B06:
	strh r0, [r5, 0x36]
	strh r6, [r5, 0x30]
	b _08103B2A
	.align 2, 0
_08103B0C: .4byte 0x02000000
_08103B10:
	cmp r4, 0x2
	ble _08103A7A
	movs r0, 0x2
	strh r0, [r5, 0x36]
	subs r0, r4, 0x1
	strh r0, [r5, 0x30]
	b _08103B2A
_08103B1E:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103ADE
_08103B2A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8103668

	thumb_func_start sub_8103764
sub_8103764: @ 8103B34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r0, 0
	bne _08103B48
	cmp r1, 0x1
	beq _08103B50
_08103B48:
	cmp r0, 0x1
	bne _08103B54
	cmp r2, 0
	bne _08103B54
_08103B50:
	movs r0, 0x1
	b _08103B56
_08103B54:
	movs r0, 0
_08103B56:
	pop {r1}
	bx r1
	thumb_func_end sub_8103764

	thumb_func_start sub_810378C
sub_810378C: @ 8103B5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0
	bne _08103B76
	cmp r1, 0x1
	bne _08103B76
	cmp r2, 0
	beq _08103B82
_08103B76:
	cmp r0, 0x1
	bne _08103B86
	cmp r1, 0
	bne _08103B86
	cmp r2, 0x1
	bne _08103B86
_08103B82:
	movs r0, 0x1
	b _08103B88
_08103B86:
	movs r0, 0
_08103B88:
	pop {r1}
	bx r1
	thumb_func_end sub_810378C

	thumb_func_start sub_81037BC
sub_81037BC: @ 8103B8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0
	bne _08103BA6
	cmp r1, 0x1
	bne _08103BA6
	cmp r2, 0
	beq _08103BD2
_08103BA6:
	cmp r0, 0x1
	bne _08103BB2
	cmp r1, 0
	bne _08103BB2
	cmp r2, 0x1
	beq _08103BD2
_08103BB2:
	cmp r0, 0
	bne _08103BBE
	cmp r1, 0
	bne _08103BBE
	cmp r2, 0x1
	beq _08103BD2
_08103BBE:
	cmp r0, 0x1
	bne _08103BCA
	cmp r1, 0x1
	bne _08103BCA
	cmp r2, 0
	beq _08103BD2
_08103BCA:
	cmp r0, r1
	bne _08103BD6
	cmp r0, r2
	bne _08103BD6
_08103BD2:
	movs r0, 0
	b _08103BD8
_08103BD6:
	movs r0, 0x1
_08103BD8:
	pop {r1}
	bx r1
	thumb_func_end sub_81037BC

	thumb_func_start sub_810380C
sub_810380C: @ 8103BDC
	push {lr}
	ldr r1, _08103BF8
	ldr r0, _08103BFC
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	subs r0, 0x1
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_08103BF8: .4byte gUnknown_083ECB94
_08103BFC: .4byte 0x02000000
	thumb_func_end sub_810380C

	thumb_func_start sub_8103830
sub_8103830: @ 8103C00
	push {r4-r7,lr}
	movs r6, 0
	ldr r7, _08103C38
	ldrh r1, [r7, 0x2E]
	movs r4, 0x2
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r7, 0x30]
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x1
	adds r1, r4, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r5, r1
	bne _08103C70
	movs r4, 0x2
	b _08103C46
	.align 2, 0
_08103C38: .4byte 0x02000000
_08103C3C:
	lsls r0, r6, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r6, r0, 16
_08103C46:
	lsls r1, r6, 16
	asrs r1, 16
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08103C3C
	cmp r5, 0
	bne _08103C66
	cmp r0, 0x1
	beq _08103C3C
_08103C66:
	cmp r5, 0x1
	bne _08103CD0
	cmp r0, 0
	beq _08103C3C
	b _08103CD0
_08103C70:
	adds r0, r5, 0
	bl sub_8103764
	lsls r0, 24
	cmp r0, 0
	beq _08103CD0
	ldrb r1, [r7, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08103CAC
	movs r7, 0x2
_08103C88:
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08103CD0
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103C88
_08103CAC:
	movs r6, 0
	movs r7, 0x2
	b _08103CB8
_08103CB2:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r6, r0, 16
_08103CB8:
	lsls r0, r6, 16
	asrs r4, r0, 16
	subs r1, r7, r4
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	beq _08103CB2
_08103CD0:
	ldr r0, _08103CDC
	strh r6, [r0, 0x32]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103CDC: .4byte 0x02000000
	thumb_func_end sub_8103830

	thumb_func_start sub_8103910
sub_8103910: @ 8103CE0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r4, _08103D48
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	cmp r1, 0
	beq _08103D76
	ldrh r2, [r4, 0x34]
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	cmp r0, r1
	bne _08103D76
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08103D76
	ldrh r1, [r4, 0x2E]
	subs r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r7, r0, 24
	ldrh r1, [r4, 0x36]
	ldrh r0, [r4, 0x30]
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_8103764
	lsls r0, 24
	cmp r0, 0
	beq _08103D76
	movs r5, 0
	b _08103D52
	.align 2, 0
_08103D48: .4byte 0x02000000
_08103D4C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_08103D52:
	lsls r6, r5, 16
	asrs r5, r6, 16
	cmp r5, 0x4
	bgt _08103D76
	ldr r0, _08103E04
	ldrh r1, [r0, 0x36]
	subs r1, r5
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r7, r4
	bne _08103D4C
	lsrs r6, 16
	str r6, [sp]
_08103D76:
	ldr r0, _08103E04
	mov r9, r0
_08103D7A:
	movs r5, 0x1
	movs r1, 0
	mov r8, r1
	ldr r2, [sp]
	lsls r2, 16
	mov r10, r2
_08103D86:
	mov r3, r9
	ldrh r1, [r3, 0x2E]
	lsls r5, 16
	asrs r4, r5, 16
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	ldrh r1, [r0, 0x30]
	subs r1, r4, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	mov r1, r10
	asrs r0, r1, 16
	subs r4, r0
	lsls r4, 16
	asrs r4, 16
	movs r0, 0x2
	adds r1, r4, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_81037BC
	lsls r0, 24
	cmp r0, 0
	bne _08103E08
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_810378C
	lsls r0, 24
	cmp r0, 0
	beq _08103DF4
	mov r2, r9
	ldrb r1, [r2, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08103E08
_08103DF4:
	mov r3, r8
	lsls r0, r3, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r0, 16
	mov r8, r0
	b _08103E16
	.align 2, 0
_08103E04: .4byte 0x02000000
_08103E08:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r5, r2
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08103D86
_08103E16:
	mov r3, r8
	cmp r3, 0
	beq _08103E2C
	ldr r1, [sp]
	lsls r0, r1, 16
	movs r2, 0x80
	lsls r2, 9
	adds r0, r2
	lsrs r0, 16
	str r0, [sp]
	b _08103D7A
_08103E2C:
	ldr r0, _08103E44
	mov r3, sp
	ldrh r3, [r3]
	strh r3, [r0, 0x32]
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08103E44: .4byte 0x02000000
	thumb_func_end sub_8103910

	thumb_func_start sub_8103A78
sub_8103A78: @ 8103E48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	bl sub_8103910
	ldr r4, _08103EE0
	movs r0, 0x36
	ldrsh r1, [r4, r0]
	cmp r1, 0
	beq _08103EF0
	ldrh r2, [r4, 0x34]
	movs r3, 0x34
	ldrsh r0, [r4, r3]
	cmp r0, r1
	beq _08103EF0
	ldrb r1, [r4, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08103EF0
	ldrh r1, [r4, 0x2E]
	subs r1, r2, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r1, [r4, 0x36]
	ldrh r0, [r4, 0x30]
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_8103764
	lsls r0, 24
	cmp r0, 0
	beq _08103EF0
	movs r1, 0x1
	movs r2, 0x34
	ldrsh r0, [r4, r2]
	cmp r0, 0x1
	bne _08103EB0
	movs r1, 0x3
_08103EB0:
	movs r3, 0
	lsls r1, 16
	mov r8, r1
	adds r7, r4, 0
_08103EB8:
	ldrh r2, [r7, 0x32]
	lsls r0, r3, 16
	asrs r5, r0, 16
	adds r2, r5, r2
	mov r3, r8
	asrs r1, r3, 16
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r6, r4
	bne _08103EE4
	ldrh r0, [r7, 0x32]
	adds r0, r5, r0
	strh r0, [r7, 0x32]
	b _08103EF0
	.align 2, 0
_08103EE0: .4byte 0x02000000
_08103EE4:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x4
	ble _08103EB8
_08103EF0:
	ldr r7, _08103F60
_08103EF2:
	ldrh r0, [r7, 0x2E]
	movs r1, 0x1
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r7, 0x30]
	movs r1, 0x2
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r7, 0x32]
	movs r1, 0x3
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_81037BC
	lsls r0, 24
	cmp r0, 0
	bne _08103F64
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_810378C
	lsls r0, 24
	cmp r0, 0
	beq _08103F58
	ldrb r1, [r7, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08103F64
_08103F58:
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	strh r0, [r7, 0x32]
	b _08103EF2
	.align 2, 0
_08103F60: .4byte 0x02000000
_08103F64:
	ldr r7, _08103FD4
_08103F66:
	ldrh r0, [r7, 0x2E]
	movs r1, 0x3
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	bl sub_8102BF8
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r7, 0x30]
	movs r1, 0x2
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x1
	bl sub_8102BF8
	lsls r0, 24
	lsrs r5, r0, 24
	ldrh r0, [r7, 0x32]
	movs r1, 0x1
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	movs r0, 0x2
	bl sub_8102BF8
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_81037BC
	lsls r0, 24
	cmp r0, 0
	bne _08103FD8
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_810378C
	lsls r0, 24
	cmp r0, 0
	beq _08103FCC
	ldrb r1, [r7, 0x4]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08103FD8
_08103FCC:
	ldrh r0, [r7, 0x32]
	adds r0, 0x1
	strh r0, [r7, 0x32]
	b _08103F66
	.align 2, 0
_08103FD4: .4byte 0x02000000
_08103FD8:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8103A78

	thumb_func_start sub_8103C14
sub_8103C14: @ 8103FE4
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08104010
	adds r0, r5, 0
	movs r1, 0x5
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08104014
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104010: .4byte sub_8103C48
_08104014: .4byte gTasks
	thumb_func_end sub_8103C14

	thumb_func_start sub_8103C48
sub_8103C48: @ 8104018
	push {r4,lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08104040
	ldr r2, _08104044
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r4, 0x8
	ldrsh r2, [r0, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104040: .4byte gUnknown_083ECBA0
_08104044: .4byte gTasks
	thumb_func_end sub_8103C48

	thumb_func_start sub_8103C78
sub_8103C78: @ 8104048
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _08104078
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x73
	str r1, [sp]
	movs r1, 0x62
	movs r2, 0x63
	movs r3, 0x72
	bl sub_81065A8
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104078: .4byte gUnknown_083ECBAC
	thumb_func_end sub_8103C78

	thumb_func_start sub_8103CAC
sub_8103CAC: @ 810407C
	push {lr}
	adds r1, r0, 0
	ldrh r0, [r1, 0xA]
	adds r0, 0x1
	strh r0, [r1, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _08104094
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_08104094:
	pop {r0}
	bx r0
	thumb_func_end sub_8103CAC

	thumb_func_start sub_8103CC8
sub_8103CC8: @ 8104098
	push {r4,lr}
	sub sp, 0x4
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r1, _081040CC
	movs r2, 0x26
	ldrsh r0, [r0, r2]
	lsls r0, 1
	adds r0, r1
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x53
	str r1, [sp]
	movs r1, 0x42
	movs r2, 0x43
	movs r3, 0x52
	bl sub_81065A8
	adds r0, r4, 0
	bl DestroyTask
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081040CC: .4byte gUnknown_083ECBAC
	thumb_func_end sub_8103CC8

	thumb_func_start sub_8103D00
sub_8103D00: @ 81040D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _081040F0
	lsls r1, r0, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r1, _081040F4
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_081040F0: .4byte gUnknown_083EDD08
_081040F4: .4byte gUnknown_083EDD30
	thumb_func_end sub_8103D00

	thumb_func_start sub_8103D28
sub_8103D28: @ 81040F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08104118
	lsls r1, r0, 2
	adds r1, r2
	ldr r2, [r1]
	ldr r1, _0810411C
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	movs r2, 0x2
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08104118: .4byte gUnknown_083EDD1C
_0810411C: .4byte gUnknown_083EDD30
	thumb_func_end sub_8103D28

	thumb_func_start sub_8103D50
sub_8103D50: @ 8104120
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	ldr r0, _08104154
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r4, r0
	bcs _0810414C
	ldr r7, _08104158
	adds r6, r0, 0
	lsls r5, r1, 1
_08104138:
	adds r0, r4, r5
	adds r0, r7
	ldrb r0, [r0]
	bl sub_8103D00
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08104138
_0810414C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104154: .4byte gUnknown_083EDD3B
_08104158: .4byte gUnknown_083EDD35
	thumb_func_end sub_8103D50

	thumb_func_start sub_8103D8C
sub_8103D8C: @ 810415C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r4, 0
	ldr r0, _08104190
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r4, r0
	bcs _08104188
	ldr r7, _08104194
	adds r6, r0, 0
	lsls r5, r1, 1
_08104174:
	adds r0, r4, r5
	adds r0, r7
	ldrb r0, [r0]
	bl sub_8103D28
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _08104174
_08104188:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104190: .4byte gUnknown_083EDD3B
_08104194: .4byte gUnknown_083EDD35
	thumb_func_end sub_8103D8C

	thumb_func_start sub_8103DC8
sub_8103DC8: @ 8104198
	push {r4-r6,lr}
	movs r4, 0
	ldr r6, _081041C8
	ldr r5, _081041CC
_081041A0:
	ldr r0, _081041D0
	bl CreateInvisibleSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	strh r4, [r1, 0x2E]
	adds r1, r4, r5
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _081041A0
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081041C8: .4byte gSprites
_081041CC: .4byte 0x02000044
_081041D0: .4byte sub_8103EE4
	thumb_func_end sub_8103DC8

	thumb_func_start sub_8103E04
sub_8103E04: @ 81041D4
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08104200
	adds r1, 0x44
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104204
	adds r0, r1
	movs r2, 0
	movs r1, 0x1
	strh r1, [r0, 0x30]
	movs r1, 0x4
	strh r1, [r0, 0x32]
	strh r2, [r0, 0x34]
	strh r2, [r0, 0x36]
	movs r1, 0x2
	strh r1, [r0, 0x38]
	strh r2, [r0, 0x3C]
	bx lr
	.align 2, 0
_08104200: .4byte 0x02000000
_08104204: .4byte gSprites
	thumb_func_end sub_8103E04

	thumb_func_start sub_8103E38
sub_8103E38: @ 8104208
	push {r4,r5,lr}
	movs r2, 0
	ldr r4, _08104230
	ldr r3, _08104234
_08104210:
	adds r0, r2, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r3
	movs r5, 0x30
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _08104238
	movs r5, 0x32
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _08104238
	movs r0, 0
	b _08104244
	.align 2, 0
_08104230: .4byte 0x02000044
_08104234: .4byte gSprites
_08104238:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08104210
	movs r0, 0x1
_08104244:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8103E38

	thumb_func_start sub_8103E7C
sub_8103E7C: @ 810424C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08104264
_08104252:
	adds r0, r4, r5
	ldrb r0, [r0]
	bl sub_8103EAC
	lsls r0, 24
	cmp r0, 0
	bne _08104268
	movs r0, 0
	b _08104274
	.align 2, 0
_08104264: .4byte 0x02000044
_08104268:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08104252
	movs r0, 0x1
_08104274:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8103E7C

	thumb_func_start sub_8103EAC
sub_8103EAC: @ 810427C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _08104298
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0810429C
	movs r0, 0x1
	b _081042AE
	.align 2, 0
_08104298: .4byte gSprites
_0810429C:
	ldrh r2, [r1, 0x3C]
	movs r3, 0x3C
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _081042AA
	movs r0, 0
	strh r0, [r1, 0x30]
_081042AA:
	lsls r0, r2, 24
	lsrs r0, 24
_081042AE:
	pop {r1}
	bx r1
	thumb_func_end sub_8103EAC

	thumb_func_start sub_8103EE4
sub_8103EE4: @ 81042B4
	push {r4-r7,lr}
	adds r2, r0, 0
	movs r1, 0x30
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _08104336
	ldrh r0, [r2, 0x34]
	subs r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _0810431E
	movs r0, 0
	strh r0, [r2, 0x3C]
	movs r6, 0x1
	strh r6, [r2, 0x34]
	ldrh r1, [r2, 0x38]
	ldrh r3, [r2, 0x36]
	adds r0, r1, r3
	strh r0, [r2, 0x36]
	movs r4, 0x4
	ldrh r5, [r2, 0x32]
	movs r7, 0x32
	ldrsh r3, [r2, r7]
	cmp r3, 0
	beq _081042F0
	movs r4, 0x8
_081042F0:
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	bgt _08104308
	strh r6, [r2, 0x3C]
	negs r0, r1
	strh r0, [r2, 0x38]
	cmp r3, 0
	beq _0810431E
	subs r0, r5, 0x1
	strh r0, [r2, 0x32]
	b _08104310
_08104308:
	cmp r0, r4
	blt _08104310
	negs r0, r1
	strh r0, [r2, 0x38]
_08104310:
	movs r1, 0x32
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _0810431E
	ldrh r0, [r2, 0x34]
	lsls r0, 1
	strh r0, [r2, 0x34]
_0810431E:
	ldr r1, _0810433C
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	adds r0, r1
	ldrb r0, [r0]
	ldrh r3, [r2, 0x36]
	lsls r3, 24
	lsrs r3, 24
	adds r1, r3, 0
	adds r2, r3, 0
	bl MultiplyPaletteRGBComponents
_08104336:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810433C: .4byte gUnknown_083EDD30
	thumb_func_end sub_8103EE4

	thumb_func_start sub_8103F70
sub_8103F70: @ 8104340
	push {r4,lr}
	ldr r4, _08104368
	adds r0, r4, 0
	movs r1, 0x6
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810436C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x1
	strh r2, [r1, 0xE]
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104368: .4byte sub_8103FE8
_0810436C: .4byte gTasks
	thumb_func_end sub_8103F70

	thumb_func_start sub_8103FA0
sub_8103FA0: @ 8104370
	push {lr}
	ldr r0, _08104394
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _08104398
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	movs r1, 0xC
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0810439C
	movs r0, 0
	b _081043B0
	.align 2, 0
_08104394: .4byte sub_8103FE8
_08104398: .4byte gTasks
_0810439C:
	adds r0, r2, 0
	bl DestroyTask
	ldr r0, _081043B4
	ldr r0, [r0]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	movs r0, 0x1
_081043B0:
	pop {r1}
	bx r1
	.align 2, 0
_081043B4: .4byte gUnknown_083EDDAC
	thumb_func_end sub_8103FA0

	thumb_func_start sub_8103FE8
sub_8103FE8: @ 81043B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08104410
	adds r2, r1, r0
	ldrh r0, [r2, 0xA]
	subs r0, 0x1
	strh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _081043F6
	movs r0, 0x4
	strh r0, [r2, 0xA]
	ldrh r1, [r2, 0xE]
	ldrh r3, [r2, 0xC]
	adds r0, r1, r3
	strh r0, [r2, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0
	beq _081043F2
	cmp r0, 0x2
	bne _081043F6
_081043F2:
	negs r0, r1
	strh r0, [r2, 0xE]
_081043F6:
	ldr r0, _08104414
	movs r3, 0xC
	ldrsh r1, [r2, r3]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x10
	movs r2, 0x20
	bl LoadPalette
	pop {r0}
	bx r0
	.align 2, 0
_08104410: .4byte gTasks
_08104414: .4byte gUnknown_083EDDA0
	thumb_func_end sub_8103FE8

	thumb_func_start sub_8104048
sub_8104048: @ 8104418
	push {lr}
	ldr r0, _0810442C
	movs r1, 0x8
	bl CreateTask
	ldr r1, _08104430
	adds r1, 0x3E
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0810442C: .4byte sub_81040E8
_08104430: .4byte 0x02000000
	thumb_func_end sub_8104048

	thumb_func_start sub_8104064
sub_8104064: @ 8104434
	push {r4,lr}
	ldr r0, _08104460
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08104464
	adds r4, r0
	adds r0, r4, 0
	bl sub_810421C
	movs r1, 0x1
	strh r1, [r4, 0x8]
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	strh r1, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104460: .4byte 0x02000000
_08104464: .4byte gTasks
	thumb_func_end sub_8104064

	thumb_func_start sub_8104098
sub_8104098: @ 8104468
	push {r4,lr}
	ldr r0, _08104490
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r4, r0, 2
	adds r4, r0
	lsls r4, 3
	ldr r0, _08104494
	adds r4, r0
	adds r0, r4, 0
	bl sub_810421C
	movs r0, 0x3
	strh r0, [r4, 0x8]
	movs r0, 0x1
	strh r0, [r4, 0x26]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104490: .4byte 0x02000000
_08104494: .4byte gTasks
	thumb_func_end sub_8104098

	thumb_func_start sub_81040C8
sub_81040C8: @ 8104498
	ldr r2, _081044B0
	ldr r0, _081044B4
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_081044B0: .4byte gTasks
_081044B4: .4byte 0x02000000
	thumb_func_end sub_81040C8

	thumb_func_start sub_81040E8
sub_81040E8: @ 81044B8
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _081044E0
	ldr r2, _081044E4
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_081044E0: .4byte gUnknown_083ECBB4
_081044E4: .4byte gTasks
	thumb_func_end sub_81040E8

	thumb_func_start nullsub_68
nullsub_68: @ 81044E8
	bx lr
	thumb_func_end nullsub_68

	thumb_func_start sub_810411C
sub_810411C: @ 81044EC
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0xA]
	lsls r0, 19
	movs r1, 0xA0
	lsls r1, 13
	adds r0, r1
	asrs r0, 16
	movs r1, 0x14
	bl sub_8105B1C
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4, 0xC]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810411C

	thumb_func_start sub_8104144
sub_8104144: @ 8104514
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08104544
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x3C
	ldrsh r0, [r0, r1]
	cmp r0, 0
	beq _0810456E
	ldrh r1, [r4, 0xA]
	adds r0, r1, 0x2
	lsls r0, 16
	lsrs r2, r0, 16
	movs r0, 0
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x1
	bne _08104548
	movs r0, 0x1
	b _0810454E
	.align 2, 0
_08104544: .4byte gSprites
_08104548:
	cmp r1, 0x10
	bne _0810454E
	movs r0, 0x2
_0810454E:
	lsls r1, r2, 16
	asrs r1, 15
	ldr r2, _08104574
	adds r1, r2
	adds r1, 0x80
	ldr r2, _08104578
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	ldrb r0, [r4, 0xC]
	bl sub_8105B88
	movs r0, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0x26]
_0810456E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104574: .4byte 0x0600e800
_08104578: .4byte gUnknown_083ECBC4
	thumb_func_end sub_8104144

	thumb_func_start sub_81041AC
sub_81041AC: @ 810457C
	push {r4,lr}
	adds r3, r0, 0
	ldrh r1, [r3, 0xA]
	adds r0, r1, 0x2
	lsls r0, 16
	lsrs r4, r0, 16
	movs r2, 0
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x1
	bne _08104596
	movs r2, 0x1
	b _0810459C
_08104596:
	cmp r1, 0x10
	bne _0810459C
	movs r2, 0x2
_0810459C:
	movs r1, 0xC
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _081045C0
	lsls r0, r4, 16
	asrs r0, 15
	ldr r1, _081045E4
	adds r0, r1
	adds r0, 0x80
	ldr r1, _081045E8
	lsls r2, 2
	adds r1, 0x2
	adds r2, r1
	ldrh r1, [r2]
	strh r1, [r0]
	ldrh r0, [r3, 0xA]
	subs r0, 0x1
	strh r0, [r3, 0xA]
_081045C0:
	ldrh r0, [r3, 0xC]
	adds r0, 0x1
	strh r0, [r3, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _081045D2
	movs r0, 0
	strh r0, [r3, 0xC]
_081045D2:
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _081045DE
	strh r0, [r3, 0x8]
	strh r0, [r3, 0x26]
_081045DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081045E4: .4byte 0x0600e800
_081045E8: .4byte gUnknown_083ECBC4
	thumb_func_end sub_81041AC

	thumb_func_start sub_810421C
sub_810421C: @ 81045EC
	push {lr}
	movs r1, 0x2
	adds r2, r0, 0
	adds r2, 0x8
	movs r3, 0
_081045F6:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _081045F6
	pop {r0}
	bx r0
	thumb_func_end sub_810421C

	thumb_func_start sub_810423C
sub_810423C: @ 810460C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0x3
	ldr r6, _08104638
	movs r4, 0
	ldr r0, _0810463C
	mov r8, r0
	ldr r1, _08104640
	mov r12, r1
	cmp r4, r5
	bge _08104676
	ldr r7, _08104644
_0810462A:
	movs r3, 0
	lsls r0, r4, 16
	asrs r0, 16
	cmp r0, 0
	bne _08104648
	movs r3, 0x1
	b _0810464E
	.align 2, 0
_08104638: .4byte 0x0600e800
_0810463C: .4byte gTasks
_08104640: .4byte 0x02000000
_08104644: .4byte gUnknown_083ECBC4
_08104648:
	cmp r0, 0xF
	bne _0810464E
	movs r3, 0x2
_0810464E:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r1, r6
	adds r1, 0x80
	lsls r0, r3, 2
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	adds r2, 0x1
	lsls r2, 16
	lsrs r2, 16
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, r5
	blt _0810462A
_08104676:
	lsls r1, r4, 16
	asrs r0, r1, 16
	cmp r0, 0xF
	bgt _081046C0
	ldr r7, _0810468C
_08104680:
	movs r3, 0
	asrs r0, r1, 16
	cmp r0, 0
	bne _08104690
	movs r3, 0x1
	b _08104696
	.align 2, 0
_0810468C: .4byte 0x083f90f2
_08104690:
	cmp r0, 0xF
	bne _08104696
	movs r3, 0x2
_08104696:
	lsls r2, 16
	asrs r2, 16
	lsls r1, r2, 1
	adds r1, r6
	adds r1, 0x80
	lsls r0, r3, 2
	adds r0, r7
	ldrh r0, [r0]
	strh r0, [r1]
	lsls r0, r4, 16
	movs r1, 0x80
	lsls r1, 9
	adds r0, r1
	lsrs r4, r0, 16
	adds r2, 0x1
	lsls r2, 16
	lsrs r2, 16
	lsls r1, r4, 16
	asrs r0, r1, 16
	cmp r0, 0xF
	ble _08104680
_081046C0:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	add r0, r8
	strh r5, [r0, 0xA]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810423C

	thumb_func_start sub_810430C
sub_810430C: @ 81046DC
	push {r4,lr}
	ldr r4, _081046F8
	adds r0, r4, 0
	movs r1, 0x7
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081046F8: .4byte sub_810434C
	thumb_func_end sub_810430C

	thumb_func_start sub_810432C
sub_810432C: @ 81046FC
	push {lr}
	ldr r0, _08104710
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08104714
	movs r0, 0
	b _08104716
	.align 2, 0
_08104710: .4byte sub_810434C
_08104714:
	movs r0, 0x1
_08104716:
	pop {r1}
	bx r1
	thumb_func_end sub_810432C

	thumb_func_start sub_810434C
sub_810434C: @ 810471C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08104744
	ldr r2, _08104748
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08104744: .4byte gUnknown_083ECBD0
_08104748: .4byte gTasks
	thumb_func_end sub_810434C

	thumb_func_start sub_810437C
sub_810437C: @ 810474C
	push {lr}
	ldr r1, _081047AC
	movs r2, 0
	strb r2, [r1, 0xA]
	strh r2, [r1, 0x14]
	strh r2, [r1, 0x16]
	ldrh r1, [r0, 0x8]
	adds r1, 0x1
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	movs r1, 0x1E
	strh r1, [r0, 0xC]
	movs r1, 0xA0
	lsls r1, 3
	strh r1, [r0, 0x10]
	ldr r0, _081047B0
	strh r2, [r0]
	ldr r0, _081047B4
	strh r2, [r0]
	ldr r0, _081047B8
	strh r2, [r0]
	adds r0, 0x2
	strh r2, [r0]
	movs r0, 0x1E
	movs r1, 0
	bl sub_8104A40
	bl sub_81051C0
	bl sub_8105100
	bl sub_81052EC
	bl sub_81053A0
	bl sub_810545C
	bl sub_8102680
	bl StopMapMusic
	movs r0, 0xC4
	lsls r0, 1
	bl PlayNewMapMusic
	pop {r0}
	bx r0
	.align 2, 0
_081047AC: .4byte 0x02000000
_081047B0: .4byte gSpriteCoordOffsetX
_081047B4: .4byte gSpriteCoordOffsetY
_081047B8: .4byte 0x04000014
	thumb_func_end sub_810437C

	thumb_func_start sub_81043EC
sub_81043EC: @ 81047BC
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _0810482C
	ldrh r0, [r1]
	subs r0, 0x8
	strh r0, [r1]
	ldrh r2, [r4, 0xA]
	adds r2, 0x8
	strh r2, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r0, 0xF0
	movs r1, 0xFF
	ands r0, r1
	lsrs r3, r0, 3
	ldr r1, _08104830
	ldr r0, _08104834
	ands r2, r0
	strh r2, [r1]
	adds r2, r3, 0
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r2, r0
	beq _08104808
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x12
	bgt _08104808
	strh r3, [r4, 0xC]
	ldrh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 19
	strh r0, [r4, 0xE]
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	adds r0, r2, 0
	bl sub_8104A40
_08104808:
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0xC7
	ble _0810481A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xE]
_0810481A:
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810482C: .4byte gSpriteCoordOffsetX
_08104830: .4byte 0x04000014
_08104834: .4byte 0x000001ff
	thumb_func_end sub_81043EC

	thumb_func_start sub_8104468
sub_8104468: @ 8104838
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _08104862
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8105578
	bl sub_81056F0
_08104862:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104468

	thumb_func_start sub_8104498
sub_8104498: @ 8104868
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r7, r0, 0
	ldr r1, _08104904
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	add r0, sp, 0x4
	mov r8, r0
	ldr r1, _08104908
	movs r2, 0x8
	bl memcpy
	add r6, sp, 0xC
	ldr r1, _0810490C
	adds r0, r6, 0
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r7, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrh r0, [r7, 0x10]
	subs r0, 0x4
	strh r0, [r7, 0x10]
	lsls r0, 16
	asrs r0, 24
	movs r5, 0x4
	subs r5, r0
	lsls r4, r5, 1
	add r8, r4
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	bl sub_8105688
	adds r6, r4
	movs r1, 0
	ldrsh r0, [r6, r1]
	bl sub_81057E8
	ldr r0, _08104910
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104914
	adds r0, r1
	mov r2, sp
	adds r1, r2, r5
	ldrb r1, [r1]
	bl StartSpriteAnimIfDifferent
	movs r1, 0x10
	ldrsh r0, [r7, r1]
	movs r1, 0x80
	lsls r1, 1
	cmp r0, r1
	bgt _081048F6
	ldrh r0, [r7, 0x8]
	adds r0, 0x1
	strh r0, [r7, 0x8]
	strh r1, [r7, 0x10]
	movs r0, 0
	strh r0, [r7, 0x12]
_081048F6:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104904: .4byte gUnknown_083ECC1C
_08104908: .4byte gUnknown_083ECC20
_0810490C: .4byte gUnknown_083ECC28
_08104910: .4byte 0x02000000
_08104914: .4byte gSprites
	thumb_func_end sub_8104498

	thumb_func_start sub_8104548
sub_8104548: @ 8104918
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	ble _0810495A
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	strh r0, [r4, 0x12]
	movs r0, 0x2
	bl sub_81057E8
	ldr r0, _08104960
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104964
	adds r0, r1
	movs r1, 0x3
	bl StartSpriteAnimIfDifferent
_0810495A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104960: .4byte 0x02000000
_08104964: .4byte gSprites
	thumb_func_end sub_8104548

	thumb_func_start sub_8104598
sub_8104598: @ 8104968
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrb r0, [r4, 0x10]
	adds r0, 0x80
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4F
	ble _08104994
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	strh r0, [r4, 0x12]
_08104994:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104598

	thumb_func_start sub_81045CC
sub_81045CC: @ 810499C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	ldrb r0, [r4, 0x10]
	adds r0, 0x40
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x27
	ble _08104A04
	movs r0, 0
	strh r0, [r4, 0x12]
	ldr r1, _081049DC
	ldrb r0, [r1, 0x5]
	cmp r0, 0
	beq _081049E0
	ldrb r1, [r1, 0xA]
	movs r2, 0x14
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bgt _081049FE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	b _081049FC
	.align 2, 0
_081049DC: .4byte 0x02000000
_081049E0:
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _081049EE
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	b _081049FC
_081049EE:
	ldrh r0, [r4, 0x14]
	bl sub_81026DC
	lsls r0, 24
	cmp r0, 0
	beq _081049FE
	movs r0, 0xE
_081049FC:
	strh r0, [r4, 0x8]
_081049FE:
	ldrh r0, [r4, 0x14]
	adds r0, 0x1
	strh r0, [r4, 0x14]
_08104A04:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_81045CC

	thumb_func_start sub_810463C
sub_810463C: @ 8104A0C
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r6, _08104A30
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	movs r1, 0x14
	bl __modsi3
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r0, 0
	beq _08104A34
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D5C
	b _08104A58
	.align 2, 0
_08104A30: .4byte 0x02000000
_08104A34:
	movs r0, 0x1
	bl sub_8102C48
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r6, 0x5]
	cmp r0, r1
	beq _08104A62
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 24
	bl sub_8102D28
	movs r1, 0x14
	ldrsh r0, [r6, r1]
	movs r1, 0x14
	bl __modsi3
_08104A58:
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r4, 0x10]
	adds r0, 0x40
	strh r0, [r4, 0x10]
_08104A62:
	lsls r0, r5, 16
	asrs r5, r0, 16
	cmp r5, 0
	bne _08104A84
	movs r0, 0x1
	bl sub_8102C48
	ldr r1, _08104A8C
	lsls r0, 24
	lsrs r0, 24
	ldrb r1, [r1, 0x5]
	cmp r0, r1
	bne _08104A84
	strh r5, [r4, 0x10]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08104A84:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08104A8C: .4byte 0x02000000
	thumb_func_end sub_810463C

	thumb_func_start sub_81046C0
sub_81046C0: @ 8104A90
	push {r4-r7,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x10]
	adds r0, 0x1
	movs r7, 0
	strh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _08104B28
	bl StopMapMusic
	bl sub_81056C0
	bl sub_8105804
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	ldr r5, _08104AE0
	ldrb r0, [r5, 0x5]
	cmp r0, 0
	bne _08104AEC
	movs r0, 0xA0
	strh r0, [r4, 0x10]
	adds r0, r5, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08104AE4
	adds r0, r1
	movs r1, 0x5
	bl StartSpriteAnimIfDifferent
	ldr r0, _08104AE8
	bl PlayFanfare
	b _08104B28
	.align 2, 0
_08104AE0: .4byte 0x02000000
_08104AE4: .4byte gSprites
_08104AE8: .4byte 0x00000187
_08104AEC:
	movs r0, 0xC0
	strh r0, [r4, 0x10]
	adds r6, r5, 0
	adds r6, 0x3F
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r4, _08104B30
	adds r0, r4
	movs r1, 0x4
	bl StartSpriteAnimIfDifferent
	ldrb r1, [r6]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r0, 0x2B
	strb r7, [r0]
	ldrb r0, [r5, 0x2]
	cmp r0, 0
	beq _08104B20
	bl sub_8104098
	strb r7, [r5, 0x2]
_08104B20:
	movs r0, 0xC3
	lsls r0, 1
	bl PlayFanfare
_08104B28:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104B30: .4byte gSprites
	thumb_func_end sub_81046C0

	thumb_func_start sub_8104764
sub_8104764: @ 8104B34
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x10]
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _08104B4C
	subs r0, r1, 0x1
	strh r0, [r4, 0x10]
	lsls r0, 16
	cmp r0, 0
	bne _08104B5C
_08104B4C:
	bl sub_81040C8
	lsls r0, 24
	cmp r0, 0
	bne _08104B5C
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08104B5C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104764

	thumb_func_start sub_8104794
sub_8104794: @ 8104B64
	push {r4,lr}
	adds r3, r0, 0
	ldr r1, _08104BA4
	ldrh r0, [r1]
	subs r0, 0x8
	strh r0, [r1]
	ldrh r2, [r3, 0xA]
	adds r2, 0x8
	strh r2, [r3, 0xA]
	ldrh r0, [r3, 0xE]
	adds r0, 0x8
	strh r0, [r3, 0xE]
	movs r1, 0xA
	ldrsh r0, [r3, r1]
	subs r0, 0x8
	movs r1, 0xFF
	ands r0, r1
	lsrs r4, r0, 3
	ldr r1, _08104BA8
	ldr r0, _08104BAC
	ands r2, r0
	strh r2, [r1]
	ldrh r0, [r3, 0xE]
	lsls r0, 16
	asrs r0, 19
	cmp r0, 0x19
	bgt _08104BB0
	adds r0, r4, 0
	bl sub_8104A88
	b _08104BB6
	.align 2, 0
_08104BA4: .4byte gSpriteCoordOffsetX
_08104BA8: .4byte 0x04000014
_08104BAC: .4byte 0x000001ff
_08104BB0:
	ldrh r0, [r3, 0x8]
	adds r0, 0x1
	strh r0, [r3, 0x8]
_08104BB6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104794

	thumb_func_start sub_81047EC
sub_81047EC: @ 8104BBC
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r4, _08104C04
	movs r6, 0
	strb r6, [r4, 0xB]
	ldrb r0, [r4, 0x5]
	strb r0, [r4, 0xA]
	ldr r0, _08104C08
	strh r6, [r0]
	ldr r0, _08104C0C
	strh r6, [r0]
	movs r0, 0x8
	strh r0, [r4, 0x1A]
	bl sub_810514C
	bl sub_81054B8
	bl sub_8105524
	adds r0, r4, 0
	adds r0, 0x60
	ldrh r0, [r0]
	bl PlayNewMapMusic
	ldrb r0, [r4, 0xA]
	cmp r0, 0
	bne _08104C14
	ldr r0, _08104C10
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	b _08104C2A
	.align 2, 0
_08104C04: .4byte 0x02000000
_08104C08: .4byte gSpriteCoordOffsetX
_08104C0C: .4byte 0x04000014
_08104C10: .4byte sub_810434C
_08104C14:
	movs r0, 0x4
	bl sub_8104CAC
	bl dp15_jump_random_unknown
	strh r0, [r5, 0xA]
	strh r6, [r5, 0xC]
	strh r6, [r5, 0xE]
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
_08104C2A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81047EC

	thumb_func_start sub_8104860
sub_8104860: @ 8104C30
	push {r4-r6,lr}
	adds r4, r0, 0
	ldr r5, _08104C4C
	ldrh r0, [r5, 0x1A]
	lsls r6, r0, 16
	asrs r1, r6, 16
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _08104C50
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08104C72
	.align 2, 0
_08104C4C: .4byte 0x02000000
_08104C50:
	movs r1, 0x1C
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __modsi3
	lsls r0, 16
	cmp r0, 0
	bne _08104C72
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0x7
	ands r0, r1
	cmp r0, 0
	bne _08104C72
	asrs r0, r6, 17
	strh r0, [r5, 0x1A]
_08104C72:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8104860

	thumb_func_start sub_81048A8
sub_81048A8: @ 8104C78
	push {lr}
	bl sub_8104E18
	lsls r0, 24
	cmp r0, 0
	beq _08104C92
	ldr r0, _08104C98
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08104C92:
	pop {r0}
	bx r0
	.align 2, 0
_08104C98: .4byte sub_810434C
	thumb_func_end sub_81048A8

	thumb_func_start sub_81048CC
sub_81048CC: @ 8104C9C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl sub_81054B8
	bl sub_81056C0
	bl sub_8105804
	bl sub_8105854
	ldr r5, _08104D04
	ldr r3, _08104D08
	adds r0, r3, 0
	adds r0, 0x4E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	adds r3, 0x3F
	ldrb r1, [r3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0x5
	bl StartSpriteAnimIfDifferent
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	movs r0, 0x4
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	bl StopMapMusic
	ldr r0, _08104D0C
	bl PlayFanfare
	movs r0, 0xB2
	bl PlaySE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104D04: .4byte gSprites
_08104D08: .4byte 0x02000000
_08104D0C: .4byte 0x00000187
	thumb_func_end sub_81048CC

	thumb_func_start sub_8104940
sub_8104940: @ 8104D10
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, _08104D88
	ldrh r1, [r4, 0x10]
	strh r1, [r0]
	ldr r0, _08104D8C
	strh r1, [r0]
	ldrh r1, [r4, 0x12]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08104D2E
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
_08104D2E:
	ldrh r0, [r4, 0x12]
	adds r0, 0x1
	strh r0, [r4, 0x12]
	movs r1, 0x1F
	ands r0, r1
	cmp r0, 0
	bne _08104D44
	ldrh r0, [r4, 0x10]
	lsls r0, 16
	asrs r0, 17
	strh r0, [r4, 0x10]
_08104D44:
	movs r0, 0x10
	ldrsh r5, [r4, r0]
	cmp r5, 0
	bne _08104D80
	bl sub_81058A0
	bl sub_81058C4
	bl sub_8105284
	bl sub_81059E8
	ldr r2, _08104D90
	ldr r0, _08104D94
	adds r0, 0x4E
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x3E
	ldrb r2, [r0]
	movs r1, 0x5
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	strh r5, [r4, 0x12]
_08104D80:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104D88: .4byte gSpriteCoordOffsetY
_08104D8C: .4byte 0x04000016
_08104D90: .4byte gSprites
_08104D94: .4byte 0x02000000
	thumb_func_end sub_8104940

	thumb_func_start sub_81049C8
sub_81049C8: @ 8104D98
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08104DC0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08104DC4
	strh r1, [r0]
	bl sub_8105ACC
	lsls r0, 24
	cmp r0, 0
	beq _08104DBA
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl sub_8105AEC
_08104DBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104DC0: .4byte gSpriteCoordOffsetY
_08104DC4: .4byte 0x04000016
	thumb_func_end sub_81049C8

	thumb_func_start sub_81049F8
sub_81049F8: @ 8104DC8
	push {lr}
	ldr r0, _08104E00
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08104E04
	strh r1, [r0]
	ldr r0, _08104E08
	adds r0, 0x60
	ldrh r0, [r0]
	bl PlayNewMapMusic
	bl sub_810514C
	bl sub_8105554
	bl sub_8105524
	bl sub_81059B8
	ldr r0, _08104E0C
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_08104E00: .4byte gSpriteCoordOffsetX
_08104E04: .4byte 0x04000014
_08104E08: .4byte 0x02000000
_08104E0C: .4byte sub_810434C
	thumb_func_end sub_81049F8

	thumb_func_start sub_8104A40
sub_8104A40: @ 8104E10
	push {r4-r7,lr}
	movs r3, 0x4
	ldr r7, _08104E50
	lsls r1, 16
	asrs r5, r1, 16
	lsls r0, 16
	asrs r4, r0, 16
	ldr r6, _08104E54
_08104E20:
	lsls r2, r3, 16
	asrs r2, 16
	subs r1, r2, 0x4
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	adds r0, r5, r0
	lsls r0, 1
	adds r0, r7
	ldrh r1, [r0]
	lsls r0, r2, 5
	adds r0, r4
	lsls r0, 1
	adds r0, r6
	strh r1, [r0]
	adds r2, 0x1
	lsls r2, 16
	lsrs r3, r2, 16
	asrs r2, 16
	cmp r2, 0xE
	ble _08104E20
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08104E50: .4byte gReelTimeWindowTilemap
_08104E54: .4byte 0x0600e000
	thumb_func_end sub_8104A40

	thumb_func_start sub_8104A88
sub_8104A88: @ 8104E58
	push {r4,r5,lr}
	movs r2, 0x4
	lsls r0, 16
	asrs r3, r0, 16
	ldr r5, _08104E84
	movs r4, 0
_08104E64:
	lsls r1, r2, 16
	asrs r1, 16
	lsls r0, r1, 5
	adds r0, r3
	lsls r0, 1
	adds r0, r5
	strh r4, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r2, r1, 16
	asrs r1, 16
	cmp r1, 0xE
	ble _08104E64
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104E84: .4byte 0x0600e000
	thumb_func_end sub_8104A88

	thumb_func_start sub_8104AB8
sub_8104AB8: @ 8104E88
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08104EB4
	adds r0, r5, 0
	movs r1, 0x1
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08104EB8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08104EB4: .4byte sub_8104B0C
_08104EB8: .4byte gTasks
	thumb_func_end sub_8104AB8

	thumb_func_start sub_8104AEC
sub_8104AEC: @ 8104EBC
	push {lr}
	ldr r0, _08104ED0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08104ED4
	movs r0, 0
	b _08104ED6
	.align 2, 0
_08104ED0: .4byte sub_8104B0C
_08104ED4:
	movs r0, 0x1
_08104ED6:
	pop {r1}
	bx r1
	thumb_func_end sub_8104AEC

	thumb_func_start sub_8104B0C
sub_8104B0C: @ 8104EDC
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08104F04
	ldr r2, _08104F08
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08104F04: .4byte gUnknown_083ECC30
_08104F08: .4byte gTasks
	thumb_func_end sub_8104B0C

	thumb_func_start sub_8104B3C
sub_8104B3C: @ 8104F0C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8104B3C

	thumb_func_start sub_8104B60
sub_8104B60: @ 8104F30
	push {lr}
	adds r2, r0, 0
	ldr r0, _08104F4C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08104F46
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
_08104F46:
	pop {r0}
	bx r0
	.align 2, 0
_08104F4C: .4byte gPaletteFade
	thumb_func_end sub_8104B60

	thumb_func_start sub_8104B80
sub_8104B80: @ 8104F50
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl sub_8104DA4
	bl sub_81065DC
	ldr r0, _08104F90
	bl BasicInitMenuWindow
	ldr r0, _08104F94
	movs r1, 0xA
	movs r2, 0x20
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104F90: .4byte gWindowConfig_81E7144
_08104F94: .4byte gOtherText_ReelTime
	thumb_func_end sub_8104B80

	thumb_func_start sub_8104BC8
sub_8104BC8: @ 8104F98
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r0, _08104FC8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _08104FC0
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_08104FC0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08104FC8: .4byte gMain
	thumb_func_end sub_8104BC8

	thumb_func_start sub_8104BFC
sub_8104BFC: @ 8104FCC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	bl MenuZeroFillScreen
	ldr r0, _0810500C
	bl BasicInitMenuWindow
	bl sub_81064B8
	ldrb r0, [r4, 0xA]
	bl sub_8104CAC
	ldr r0, _08105010
	ldrb r0, [r0, 0x2]
	bl sub_810423C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810500C: .4byte gWindowConfig_81E7128
_08105010: .4byte 0x02000000
	thumb_func_end sub_8104BFC

	thumb_func_start sub_8104C44
sub_8104C44: @ 8105014
	push {lr}
	ldr r0, _08105028
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_08105028: .4byte sub_8104B0C
	thumb_func_end sub_8104C44

	thumb_func_start sub_8104C5C
sub_8104C5C: @ 810502C
	push {lr}
	ldr r0, _0810506C
	movs r1, 0x3
	bl CreateTask
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08105070
	adds r0, 0x3D
	strb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08105074
	adds r0, r1
	ldr r1, _08105078
	strh r1, [r0, 0xA]
	movs r1, 0x4
	adds r2, r0, 0
	adds r2, 0x8
	movs r3, 0x40
_08105056:
	lsls r0, r1, 1
	adds r0, r2, r0
	strh r3, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _08105056
	pop {r0}
	bx r0
	.align 2, 0
_0810506C: .4byte sub_8104E74
_08105070: .4byte 0x02000000
_08105074: .4byte gTasks
_08105078: .4byte 0x0000ffff
	thumb_func_end sub_8104C5C

	thumb_func_start sub_8104CAC
sub_8104CAC: @ 810507C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl sub_8104DA4
	ldr r0, _08105108
	adds r0, 0x3D
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0810510C
	adds r6, r0, r1
	strh r5, [r6, 0xA]
	movs r4, 0
	ldr r3, _08105110
	lsls r2, r5, 2
	adds r0, r2, r3
	ldr r0, [r0]
	ldrb r0, [r0]
	cmp r0, 0xFF
	beq _08105100
	ldr r7, _08105114
_081050AA:
	adds r0, r2, r3
	ldr r0, [r0]
	lsls r2, r4, 2
	adds r2, r0
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	movs r3, 0x2
	ldrsh r2, [r2, r3]
	bl sub_8105BB4
	lsls r0, 24
	lsrs r2, r0, 24
	adds r1, r4, 0x4
	lsls r1, 1
	adds r0, r6, 0
	adds r0, 0x8
	adds r0, r1
	strh r2, [r0]
	cmp r5, 0x5
	bne _081050E8
	cmp r4, 0x2
	bhi _081050E8
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r7
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_081050E8:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r3, _08105110
	lsls r2, r5, 2
	adds r0, r2, r3
	ldr r1, [r0]
	lsls r0, r4, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0xFF
	bne _081050AA
_08105100:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105108: .4byte 0x02000000
_0810510C: .4byte gTasks
_08105110: .4byte gUnknown_083ED048
_08105114: .4byte gSprites
	thumb_func_end sub_8104CAC

	thumb_func_start sub_8104D30
sub_8104D30: @ 8105118
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r1
	ldr r4, [sp, 0x1C]
	lsls r0, 24
	lsrs r7, r0, 24
	ldr r0, _0810516C
	adds r0, 0x3D
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08105170
	adds r0, r1
	mov r12, r0
	movs r5, 0x4
	lsls r4, 16
	asrs r6, r4, 16
	lsls r2, 16
	lsls r3, 16
_08105144:
	lsls r0, r5, 1
	mov r1, r12
	adds r1, 0x8
	adds r4, r1, r0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	bne _08105174
	str r6, [sp]
	adds r0, r7, 0
	mov r1, r8
	asrs r2, 16
	asrs r3, 16
	bl sub_8105BF8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	b _0810517E
	.align 2, 0
_0810516C: .4byte 0x02000000
_08105170: .4byte gTasks
_08105174:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _08105144
_0810517E:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8104D30

	thumb_func_start sub_8104DA4
sub_8104DA4: @ 810518C
	push {r4-r6,lr}
	ldr r0, _081051EC
	adds r0, 0x3D
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _081051F0
	adds r4, r0, r1
	ldrh r1, [r4, 0xA]
	ldr r0, _081051F4
	cmp r1, r0
	beq _081051B6
	ldr r0, _081051F8
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_081051B6:
	movs r5, 0x4
	adds r6, r4, 0
	adds r6, 0x8
_081051BC:
	lsls r0, r5, 1
	adds r4, r6, r0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	beq _081051DC
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _081051FC
	adds r0, r1
	bl DestroySprite
	movs r0, 0x40
	strh r0, [r4]
_081051DC:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _081051BC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081051EC: .4byte 0x02000000
_081051F0: .4byte gTasks
_081051F4: .4byte 0x0000ffff
_081051F8: .4byte gUnknown_083ED064
_081051FC: .4byte gSprites
	thumb_func_end sub_8104DA4

	thumb_func_start sub_8104E18
sub_8104E18: @ 8105200
	push {r4,r5,lr}
	ldr r0, _0810523C
	adds r0, 0x3D
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08105240
	adds r0, r1
	movs r2, 0x4
	adds r3, r0, 0
	adds r3, 0x8
	ldr r4, _08105244
_0810521A:
	lsls r0, r2, 1
	adds r1, r3, r0
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, 0x40
	beq _08105248
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r5, 0x3C
	ldrsh r0, [r1, r5]
	cmp r0, 0
	beq _08105248
	movs r0, 0
	b _08105254
	.align 2, 0
_0810523C: .4byte 0x02000000
_08105240: .4byte gTasks
_08105244: .4byte gSprites
_08105248:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0810521A
	movs r0, 0x1
_08105254:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8104E18

	thumb_func_start sub_8104E74
sub_8104E74: @ 810525C
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r3, _08105284
	ldr r2, _08105288
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08105284: .4byte gUnknown_083ECC54
_08105288: .4byte gTasks
	thumb_func_end sub_8104E74

	thumb_func_start nullsub_69
nullsub_69: @ 810528C
	bx lr
	thumb_func_end nullsub_69

	thumb_func_start sub_8104EA8
sub_8104EA8: @ 8105290
	push {r4-r7,lr}
	movs r6, 0
	movs r0, 0x30
_08105296:
	movs r4, 0
	lsls r5, r0, 16
	lsls r7, r6, 16
_0810529C:
	ldr r0, _081052F4
	asrs r1, r5, 16
	movs r2, 0
	movs r3, 0xE
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r0, _081052F8
	adds r1, r0
	ldrb r0, [r1, 0x5]
	movs r2, 0xC
	orrs r0, r2
	strb r0, [r1, 0x5]
	strh r6, [r1, 0x2E]
	strh r4, [r1, 0x30]
	ldr r0, _081052FC
	strh r0, [r1, 0x34]
	lsls r0, r4, 16
	movs r1, 0xC0
	lsls r1, 13
	adds r0, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x77
	ble _0810529C
	movs r2, 0x80
	lsls r2, 9
	adds r1, r7, r2
	movs r2, 0xA0
	lsls r2, 14
	adds r0, r5, r2
	lsrs r0, 16
	lsrs r6, r1, 16
	asrs r1, 16
	cmp r1, 0x2
	ble _08105296
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_081052F4: .4byte gSpriteTemplate_83ED414
_081052F8: .4byte gSprites
_081052FC: .4byte 0x0000ffff
	thumb_func_end sub_8104EA8

	thumb_func_start sub_8104F18
sub_8104F18: @ 8105300
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _08105370
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r1, 1
	adds r0, r4, 0
	adds r0, 0x1C
	adds r1, r0
	ldrh r0, [r5, 0x30]
	ldrh r1, [r1]
	adds r0, r1
	strh r0, [r5, 0x32]
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0x78
	bl __modsi3
	strh r0, [r5, 0x32]
	movs r2, 0x2E
	ldrsh r1, [r5, r2]
	lsls r1, 1
	adds r4, 0x22
	adds r1, r4
	ldrh r1, [r1]
	adds r1, 0x1C
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrh r4, [r5, 0x2E]
	lsls r4, 24
	lsrs r4, 24
	movs r1, 0x32
	ldrsh r0, [r5, r1]
	movs r1, 0x18
	bl __divsi3
	adds r1, r0, 0
	lsls r1, 16
	asrs r1, 16
	adds r0, r4, 0
	bl sub_8102BA4
	lsls r0, 24
	lsrs r0, 24
	bl GetSpriteTileStartByTag
	adds r1, r5, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r0, r5, 0
	bl SetSpriteSheetFrameTileNum
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105370: .4byte 0x02000000
	thumb_func_end sub_8104F18

	thumb_func_start sub_8104F8C
sub_8104F8C: @ 8105374
	push {r4-r6,lr}
	movs r4, 0xCB
	movs r5, 0x1
	ldr r6, _081053D8
_0810537C:
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	movs r1, 0x17
	movs r2, 0
	adds r3, r5, 0
	bl sub_8104FF4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 17
	subs r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, r6
	ble _0810537C
	movs r4, 0xEB
	movs r5, 0x1
	ldr r6, _081053D8
_081053AA:
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	movs r1, 0x17
	movs r2, 0x1
	adds r3, r5, 0
	bl sub_8104FF4
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 17
	subs r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, r6
	ble _081053AA
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081053D8: .4byte 0x0000270f
	thumb_func_end sub_8104F8C

	thumb_func_start sub_8104FF4
sub_8104FF4: @ 81053DC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	adds r4, r3, 0
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08105448
	lsls r5, 16
	asrs r5, 16
	lsls r6, 16
	asrs r6, 16
	adds r1, r5, 0
	adds r2, r6, 0
	movs r3, 0xD
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _0810544C
	adds r2, r0
	ldrb r1, [r2, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r2, 0x5]
	mov r0, r8
	strh r0, [r2, 0x2E]
	strh r4, [r2, 0x30]
	lsls r4, 16
	asrs r4, 16
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 1
	strh r0, [r2, 0x32]
	ldr r0, _08105450
	strh r0, [r2, 0x34]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105448: .4byte gSpriteTemplate_83ED42C
_0810544C: .4byte gSprites
_08105450: .4byte 0x0000ffff
	thumb_func_end sub_8104FF4

	thumb_func_start sub_810506C
sub_810506C: @ 8105454
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _081054A8
	ldrh r2, [r1, 0xC]
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _08105466
	ldrh r2, [r1, 0xE]
_08105466:
	movs r1, 0x34
	ldrsh r0, [r4, r1]
	cmp r0, r2
	beq _081054A0
	strh r2, [r4, 0x34]
	ldrh r1, [r4, 0x32]
	adds r0, r2, 0
	bl __umodsi3
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r1, [r4, 0x30]
	adds r0, r2, 0
	bl __udivsi3
	lsls r0, 16
	movs r3, 0xE0
	lsls r3, 11
	adds r0, r3
	lsrs r2, r0, 16
	adds r0, r2, 0
	bl GetSpriteTileStartByTag
	adds r1, r4, 0
	adds r1, 0x40
	strh r0, [r1]
	adds r0, r4, 0
	bl SetSpriteSheetFrameTileNum
_081054A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081054A8: .4byte 0x02000000
	thumb_func_end sub_810506C

	thumb_func_start sub_81050C4
sub_81050C4: @ 81054AC
	push {lr}
	ldr r0, _081054DC
	movs r1, 0x58
	movs r2, 0x48
	movs r3, 0xF
	bl CreateSprite
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _081054E0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x5]
	movs r2, 0xC
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, _081054E4
	bl SetSubspriteTables
	pop {r0}
	bx r0
	.align 2, 0
_081054DC: .4byte gSpriteTemplate_83ED444
_081054E0: .4byte gSprites
_081054E4: .4byte gUnknown_083ED704
	thumb_func_end sub_81050C4

	thumb_func_start sub_8105100
sub_8105100: @ 81054E8
	push {lr}
	ldr r0, _08105528
	movs r1, 0x8C
	lsls r1, 1
	movs r2, 0x50
	movs r3, 0x1
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810552C
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r3, [r2, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x5]
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x2
	orrs r1, r3
	strb r1, [r2]
	ldr r1, _08105530
	adds r1, 0x3F
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08105528: .4byte gSpriteTemplate_83ED45C
_0810552C: .4byte gSprites
_08105530: .4byte 0x02000000
	thumb_func_end sub_8105100

	thumb_func_start sub_810514C
sub_810514C: @ 8105534
	push {lr}
	ldr r0, _08105550
	adds r0, 0x3F
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105554
	adds r0, r1
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
_08105550: .4byte 0x02000000
_08105554: .4byte gSprites
	thumb_func_end sub_810514C

	thumb_func_start sub_8105170
sub_8105170: @ 8105558
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2, 0x24]
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0810559E
	movs r0, 0x8
	strh r0, [r2, 0x24]
	strh r0, [r2, 0x26]
	adds r0, r2, 0
	adds r0, 0x2B
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810558C
	adds r0, r2, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _0810559A
	b _0810559E
_0810558C:
	adds r0, r2, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	bne _0810559E
_0810559A:
	ldr r0, _081055A4
	strh r0, [r2, 0x26]
_0810559E:
	pop {r0}
	bx r0
	.align 2, 0
_081055A4: .4byte 0x0000fff8
	thumb_func_end sub_8105170

	thumb_func_start sub_81051C0
sub_81051C0: @ 81055A8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	ldr r0, _08105654
	movs r7, 0xB8
	lsls r7, 1
	adds r1, r7, 0
	movs r2, 0x34
	movs r3, 0x7
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08105658
	mov r10, r1
	adds r2, r0, r1
	ldrb r1, [r2, 0x5]
	movs r5, 0xD
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	movs r3, 0x4
	mov r9, r3
	mov r1, r9
	orrs r0, r1
	strb r0, [r2, 0x5]
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x2
	mov r8, r3
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _0810565C
	adds r0, r2, 0
	bl SetSubspriteTables
	ldr r6, _08105660
	adds r0, r6, 0
	adds r0, 0x49
	strb r4, [r0]
	ldr r0, _08105664
	adds r1, r7, 0
	movs r2, 0x54
	movs r3, 0x7
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	mov r1, r10
	adds r2, r0, r1
	ldrb r0, [r2, 0x5]
	ands r5, r0
	mov r3, r9
	orrs r5, r3
	strb r5, [r2, 0x5]
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	mov r3, r8
	orrs r0, r3
	strb r0, [r1]
	ldr r1, _08105668
	adds r0, r2, 0
	bl SetSubspriteTables
	adds r6, 0x4A
	strb r4, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105654: .4byte gSpriteTemplate_83ED474
_08105658: .4byte gSprites
_0810565C: .4byte gUnknown_083ED73C
_08105660: .4byte 0x02000000
_08105664: .4byte gSpriteTemplate_83ED48C
_08105668: .4byte gUnknown_083ED75C
	thumb_func_end sub_81051C0

	thumb_func_start sub_8105284
sub_8105284: @ 810566C
	push {r4,lr}
	ldr r0, _081056C0
	ldr r1, _081056C4
	ldrh r2, [r1]
	movs r1, 0xA8
	subs r1, r2
	lsls r1, 16
	asrs r1, 16
	movs r2, 0x50
	movs r3, 0x7
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _081056C8
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _081056CC
	bl SetSubspriteTables
	ldr r0, _081056D0
	adds r0, 0x42
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081056C0: .4byte gSpriteTemplate_83ED4A4
_081056C4: .4byte gSpriteCoordOffsetX
_081056C8: .4byte gSprites
_081056CC: .4byte gUnknown_083ED78C
_081056D0: .4byte 0x02000000
	thumb_func_end sub_8105284

	thumb_func_start sub_81052EC
sub_81052EC: @ 81056D4
	push {r4-r7,lr}
	movs r4, 0
	movs r5, 0
	ldr r6, _08105738
_081056DC:
	ldr r0, _0810573C
	movs r1, 0xB8
	lsls r1, 1
	movs r2, 0
	movs r3, 0xA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	ldr r1, _08105740
	adds r3, r1
	ldrb r2, [r3, 0x5]
	movs r7, 0xD
	negs r7, r7
	adds r1, r7, 0
	ands r2, r1
	movs r1, 0x4
	orrs r2, r1
	strb r2, [r3, 0x5]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r1, [r1]
	movs r2, 0x2
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	strh r5, [r3, 0x3C]
	adds r1, r4, r6
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r5, 16
	movs r7, 0xA0
	lsls r7, 13
	adds r0, r7
	lsrs r5, r0, 16
	cmp r4, 0x2
	bls _081056DC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105738: .4byte 0x0200004b
_0810573C: .4byte gSpriteTemplate_83ED4BC
_08105740: .4byte gSprites
	thumb_func_end sub_81052EC

	thumb_func_start sub_810535C
sub_810535C: @ 8105744
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, _08105784
	ldrh r0, [r4, 0x3C]
	ldrh r1, [r1, 0x14]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x28
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	adds r1, r0, 0
	adds r1, 0x3B
	strh r1, [r4, 0x22]
	movs r1, 0x14
	bl __divsi3
	lsls r0, 16
	asrs r0, 16
	bl sub_8102C48
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnimIfDifferent
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105784: .4byte 0x02000000
	thumb_func_end sub_810535C

	thumb_func_start sub_81053A0
sub_81053A0: @ 8105788
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	movs r1, 0xB8
	lsls r1, 1
	ldr r0, _08105834
	movs r2, 0x64
	movs r3, 0x9
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r7, _08105838
	adds r2, r0, r7
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	movs r3, 0x2
	mov r10, r3
	mov r3, r10
	orrs r0, r3
	strb r0, [r1]
	ldrb r1, [r2, 0x5]
	movs r5, 0xD
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	movs r1, 0x4
	mov r8, r1
	mov r3, r8
	orrs r0, r3
	strb r0, [r2, 0x5]
	ldr r0, _0810583C
	mov r9, r0
	adds r0, r2, 0
	mov r1, r9
	bl SetSubspriteTables
	ldr r6, _08105840
	adds r0, r6, 0
	adds r0, 0x4E
	strb r4, [r0]
	movs r1, 0x90
	lsls r1, 1
	ldr r0, _08105834
	movs r2, 0x68
	movs r3, 0x4
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r2, r0, r7
	adds r1, r2, 0
	adds r1, 0x3E
	ldrb r0, [r1]
	mov r3, r10
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r2, 0x5]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r2, 0x5]
	adds r0, r2, 0
	mov r1, r9
	bl SetSubspriteTables
	adds r6, 0x4F
	strb r4, [r6]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08105834: .4byte gSpriteTemplate_83ED4D4
_08105838: .4byte gSprites
_0810583C: .4byte gUnknown_083ED7B4
_08105840: .4byte 0x02000000
	thumb_func_end sub_81053A0

	thumb_func_start sub_810545C
sub_810545C: @ 8105844
	push {r4,lr}
	ldr r0, _08105890
	movs r1, 0xB8
	lsls r1, 1
	movs r2, 0x4C
	movs r3, 0xB
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08105894
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldr r1, _08105898
	bl SetSubspriteTables
	ldr r0, _0810589C
	adds r0, 0x40
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105890: .4byte gSpriteTemplate_83ED4EC
_08105894: .4byte gSprites
_08105898: .4byte gUnknown_083ED7D4
_0810589C: .4byte 0x02000000
	thumb_func_end sub_810545C

	thumb_func_start sub_81054B8
sub_81054B8: @ 81058A0
	push {r4,r5,lr}
	ldr r4, _08105900
	adds r0, r4, 0
	adds r0, 0x40
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105904
	adds r0, r1
	bl DestroySprite
	movs r5, 0
	adds r4, 0x49
_081058BC:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105904
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1
	bls _081058BC
	movs r5, 0
	ldr r4, _08105908
_081058DC:
	adds r0, r5, r4
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105904
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x2
	bls _081058DC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105900: .4byte 0x02000000
_08105904: .4byte gSprites
_08105908: .4byte 0x0200004b
	thumb_func_end sub_81054B8

	thumb_func_start sub_8105524
sub_8105524: @ 810590C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08105934
_08105912:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105938
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08105912
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105934: .4byte 0x0200004e
_08105938: .4byte gSprites
	thumb_func_end sub_8105524

	thumb_func_start sub_8105554
sub_8105554: @ 810593C
	push {lr}
	ldr r0, _08105958
	adds r0, 0x42
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810595C
	adds r0, r1
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
_08105958: .4byte 0x02000000
_0810595C: .4byte gSprites
	thumb_func_end sub_8105554

	thumb_func_start sub_8105578
sub_8105578: @ 8105960
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _08105A04
	mov r10, r0
	movs r1, 0x98
	movs r2, 0x20
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	ldr r2, _08105A08
	mov r9, r2
	adds r3, r1, r2
	ldrb r2, [r3, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r1, r4, 0
	ands r1, r2
	movs r2, 0x4
	mov r8, r2
	mov r2, r8
	orrs r1, r2
	strb r1, [r3, 0x5]
	adds r5, r3, 0
	adds r5, 0x3F
	ldrb r1, [r5]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r5]
	ldr r5, _08105A0C
	adds r1, r5, 0
	adds r1, 0x50
	strb r0, [r1]
	movs r0, 0x8
	strh r0, [r3, 0x2E]
	ldr r0, _08105A10
	strh r0, [r3, 0x30]
	movs r0, 0x1
	negs r0, r0
	strh r0, [r3, 0x32]
	movs r6, 0x20
	strh r6, [r3, 0x3C]
	mov r0, r10
	movs r1, 0xB8
	movs r2, 0x20
	movs r3, 0x5
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	mov r2, r9
	adds r3, r1, r2
	ldrb r1, [r3, 0x5]
	ands r4, r1
	mov r1, r8
	orrs r4, r1
	strb r4, [r3, 0x5]
	adds r5, 0x51
	strb r0, [r5]
	movs r0, 0x1
	strh r0, [r3, 0x30]
	subs r0, 0x2
	strh r0, [r3, 0x32]
	strh r6, [r3, 0x3C]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105A04: .4byte gSpriteTemplate_83ED504
_08105A08: .4byte gSprites
_08105A0C: .4byte 0x02000000
_08105A10: .4byte 0x0000ffff
	thumb_func_end sub_8105578

	thumb_func_start sub_810562C
sub_810562C: @ 8105A14
	push {r4,lr}
	adds r2, r0, 0
	ldrh r0, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r4, [r2, r1]
	cmp r4, 0
	beq _08105A38
	subs r0, 0x1
	movs r1, 0
	strh r0, [r2, 0x2E]
	strh r1, [r2, 0x24]
	strh r1, [r2, 0x26]
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	b _08105A6A
_08105A38:
	adds r3, r2, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x30]
	ldrh r1, [r2, 0x24]
	adds r0, r1
	strh r0, [r2, 0x24]
	ldrh r0, [r2, 0x32]
	ldrh r1, [r2, 0x26]
	adds r0, r1
	strh r0, [r2, 0x26]
	ldrh r0, [r2, 0x34]
	adds r0, 0x1
	strh r0, [r2, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	ble _08105A6A
	ldrh r0, [r2, 0x3C]
	strh r0, [r2, 0x2E]
	strh r4, [r2, 0x34]
_08105A6A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810562C

	thumb_func_start sub_8105688
sub_8105688: @ 8105A70
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08105AA0
	ldr r3, _08105AA4
	adds r1, r3, 0
	adds r1, 0x50
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x3C]
	adds r3, 0x51
	ldrb r2, [r3]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	strh r0, [r1, 0x3C]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105AA0: .4byte gSprites
_08105AA4: .4byte 0x02000000
	thumb_func_end sub_8105688

	thumb_func_start sub_81056C0
sub_81056C0: @ 8105AA8
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08105AD0
_08105AAE:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105AD4
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08105AAE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105AD0: .4byte 0x02000050
_08105AD4: .4byte gSprites
	thumb_func_end sub_81056C0

	thumb_func_start sub_81056F0
sub_81056F0: @ 8105AD8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	ldr r0, _08105B60
	mov r8, r0
	movs r1, 0x48
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08105B64
	mov r9, r1
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	add r2, r9
	ldrb r3, [r2, 0x5]
	movs r4, 0xD
	negs r4, r4
	adds r1, r4, 0
	ands r1, r3
	movs r6, 0x4
	orrs r1, r6
	strb r1, [r2, 0x5]
	movs r3, 0
	movs r1, 0x1
	strh r1, [r2, 0x2E]
	strh r3, [r2, 0x38]
	movs r1, 0x10
	strh r1, [r2, 0x3A]
	movs r1, 0x8
	strh r1, [r2, 0x3C]
	ldr r5, _08105B68
	adds r1, r5, 0
	adds r1, 0x52
	strb r0, [r1]
	mov r0, r8
	movs r1, 0x68
	movs r2, 0x50
	movs r3, 0x3
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldrb r2, [r1, 0x5]
	ands r4, r2
	orrs r4, r6
	strb r4, [r1, 0x5]
	adds r1, 0x3F
	ldrb r2, [r1]
	movs r3, 0x1
	orrs r2, r3
	strb r2, [r1]
	adds r5, 0x53
	strb r0, [r5]
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105B60: .4byte gSpriteTemplate_83ED51C
_08105B64: .4byte gSprites
_08105B68: .4byte 0x02000000
	thumb_func_end sub_81056F0

	thumb_func_start sub_8105784
sub_8105784: @ 8105B6C
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _08105BC8
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08105BBE
	ldrh r0, [r4, 0x3A]
	subs r0, 0x1
	strh r0, [r4, 0x3A]
	lsls r0, 16
	cmp r0, 0
	bgt _08105BBE
	movs r0, 0x7
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r2, _08105BCC
	adds r0, r2
	lsrs r0, 16
	movs r2, 0x38
	ldrsh r1, [r4, r2]
	add r1, sp
	ldrb r3, [r1]
	adds r1, r3, 0
	adds r2, r3, 0
	bl MultiplyInvertedPaletteRGBComponents
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	movs r1, 0x1
	ands r0, r1
	strh r0, [r4, 0x38]
	ldrh r0, [r4, 0x3C]
	strh r0, [r4, 0x3A]
_08105BBE:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105BC8: .4byte gUnknown_083ECC58
_08105BCC: .4byte 0x01030000
	thumb_func_end sub_8105784

	thumb_func_start sub_81057E8
sub_81057E8: @ 8105BD0
	ldr r3, _08105BE4
	ldr r1, _08105BE8
	adds r1, 0x52
	ldrb r2, [r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	strh r0, [r1, 0x3C]
	bx lr
	.align 2, 0
_08105BE4: .4byte gSprites
_08105BE8: .4byte 0x02000000
	thumb_func_end sub_81057E8

	thumb_func_start sub_8105804
sub_8105804: @ 8105BEC
	push {r4,r5,lr}
	movs r0, 0x7
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 4
	ldr r1, _08105C30
	adds r0, r1
	lsrs r0, 16
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl MultiplyInvertedPaletteRGBComponents
	movs r4, 0
	ldr r5, _08105C34
_08105C0C:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105C38
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bls _08105C0C
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105C30: .4byte 0x01030000
_08105C34: .4byte 0x02000052
_08105C38: .4byte gSprites
	thumb_func_end sub_8105804

	thumb_func_start sub_8105854
sub_8105854: @ 8105C3C
	push {lr}
	ldr r0, _08105C70
	movs r1, 0xA8
	movs r2, 0x50
	movs r3, 0x6
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08105C74
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r3, [r1, 0x5]
	movs r2, 0xD
	negs r2, r2
	ands r2, r3
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r1, 0x5]
	ldr r1, _08105C78
	adds r1, 0x41
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08105C70: .4byte gSpriteTemplate_83ED534
_08105C74: .4byte gSprites
_08105C78: .4byte 0x02000000
	thumb_func_end sub_8105854

	thumb_func_start sub_8105894
sub_8105894: @ 8105C7C
	ldr r1, _08105C84
	ldrh r1, [r1]
	strh r1, [r0, 0x26]
	bx lr
	.align 2, 0
_08105C84: .4byte gSpriteCoordOffsetY
	thumb_func_end sub_8105894

	thumb_func_start sub_81058A0
sub_81058A0: @ 8105C88
	push {lr}
	ldr r0, _08105CA4
	adds r0, 0x41
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105CA8
	adds r0, r1
	bl DestroySprite
	pop {r0}
	bx r0
	.align 2, 0
_08105CA4: .4byte 0x02000000
_08105CA8: .4byte gSprites
	thumb_func_end sub_81058A0

	thumb_func_start sub_81058C4
sub_81058C4: @ 8105CAC
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, _08105D20
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	movs r4, 0
	ldr r5, _08105D24
_08105CBE:
	ldr r0, _08105D28
	ldrh r0, [r0]
	movs r1, 0x50
	subs r1, r0
	lsls r1, 16
	asrs r1, 16
	ldr r0, _08105D2C
	movs r2, 0x44
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r3, r0, 4
	adds r3, r0
	lsls r3, 2
	ldr r1, _08105D30
	adds r3, r1
	ldrb r2, [r3, 0x5]
	movs r6, 0xD
	negs r6, r6
	adds r1, r6, 0
	ands r2, r1
	movs r1, 0x4
	orrs r2, r1
	strb r2, [r3, 0x5]
	movs r1, 0x3E
	adds r1, r3
	mov r12, r1
	ldrb r1, [r1]
	movs r2, 0x2
	orrs r1, r2
	mov r2, r12
	strb r1, [r2]
	lsls r1, r4, 1
	add r1, sp
	ldrh r1, [r1]
	strh r1, [r3, 0x2E]
	adds r1, r4, r5
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08105CBE
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08105D20: .4byte gUnknown_083ECC5A
_08105D24: .4byte 0x02000054
_08105D28: .4byte gSpriteCoordOffsetX
_08105D2C: .4byte gSpriteTemplate_83ED54C
_08105D30: .4byte gSprites
	thumb_func_end sub_81058C4

	thumb_func_start sub_810594C
sub_810594C: @ 8105D34
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r0, [r5, 0x2E]
	subs r0, 0x2
	movs r4, 0
	movs r1, 0xFF
	ands r0, r1
	strh r0, [r5, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	movs r1, 0x14
	bl Cos
	strh r0, [r5, 0x24]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	movs r1, 0x6
	bl Sin
	strh r0, [r5, 0x26]
	adds r1, r5, 0
	adds r1, 0x43
	strb r4, [r1]
	movs r2, 0x2E
	ldrsh r0, [r5, r2]
	cmp r0, 0x7F
	ble _08105D6E
	movs r0, 0x2
	strb r0, [r1]
_08105D6E:
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _08105D98
	adds r3, r5, 0
	adds r3, 0x3F
	ldrb r2, [r3]
	lsls r0, r2, 31
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0
	strh r0, [r5, 0x30]
_08105D98:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810594C

	thumb_func_start sub_81059B8
sub_81059B8: @ 8105DA0
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08105DC8
_08105DA6:
	adds r0, r4, r5
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08105DCC
	adds r0, r1
	bl DestroySprite
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x3
	bls _08105DA6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08105DC8: .4byte 0x02000054
_08105DCC: .4byte gSprites
	thumb_func_end sub_81059B8

	thumb_func_start sub_81059E8
sub_81059E8: @ 8105DD0
	push {r4,lr}
	ldr r0, _08105E14
	movs r1, 0xA8
	movs r2, 0x3C
	movs r3, 0x8
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08105E18
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl InitSpriteAffineAnim
	ldr r0, _08105E1C
	adds r0, 0x43
	strb r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105E14: .4byte gSpriteTemplate_83ED564
_08105E18: .4byte gSprites
_08105E1C: .4byte 0x02000000
	thumb_func_end sub_81059E8

	thumb_func_start sub_8105A38
sub_8105A38: @ 8105E20
	push {lr}
	adds r3, r0, 0
	ldrh r2, [r3, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0
	bne _08105E42
	adds r0, r3, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08105E9C
	adds r0, r2, 0x1
	strh r0, [r3, 0x2E]
	b _08105E9C
_08105E42:
	cmp r0, 0x1
	bne _08105E7E
	movs r0, 0x3E
	adds r0, r3
	mov r12, r0
	ldrb r2, [r0]
	lsls r0, r2, 29
	lsrs r0, 31
	movs r1, 0x1
	eors r1, r0
	lsls r1, 2
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	mov r1, r12
	strb r0, [r1]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x17
	ble _08105E9C
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	movs r0, 0
	strh r0, [r3, 0x32]
	b _08105E9C
_08105E7E:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	strh r0, [r3, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _08105E9C
	movs r0, 0x1
	strh r0, [r3, 0x3C]
_08105E9C:
	ldrh r0, [r3, 0x30]
	movs r1, 0xFF
	ands r1, r0
	adds r1, 0x10
	strh r1, [r3, 0x30]
	lsrs r1, 8
	ldrh r0, [r3, 0x26]
	subs r0, r1
	strh r0, [r3, 0x26]
	pop {r0}
	bx r0
	thumb_func_end sub_8105A38

	thumb_func_start sub_8105ACC
sub_8105ACC: @ 8105EB4
	ldr r2, _08105ECC
	ldr r0, _08105ED0
	adds r0, 0x43
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	bx lr
	.align 2, 0
_08105ECC: .4byte gSprites
_08105ED0: .4byte 0x02000000
	thumb_func_end sub_8105ACC

	thumb_func_start sub_8105AEC
sub_8105AEC: @ 8105ED4
	push {r4,lr}
	ldr r0, _08105EFC
	adds r0, 0x43
	ldrb r0, [r0]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08105F00
	adds r4, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105EFC: .4byte 0x02000000
_08105F00: .4byte gSprites
	thumb_func_end sub_8105AEC

	thumb_func_start sub_8105B1C
sub_8105B1C: @ 8105F04
	push {r4,lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _08105F50
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	movs r3, 0xC
	bl CreateSprite
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	ldr r1, _08105F54
	adds r0, r1
	ldrb r2, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x5]
	ldrb r1, [r0, 0x1]
	movs r2, 0x3
	orrs r1, r2
	strb r1, [r0, 0x1]
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08105F50: .4byte gSpriteTemplate_83ED6CC
_08105F54: .4byte gSprites
	thumb_func_end sub_8105B1C

	thumb_func_start sub_8105B70
sub_8105B70: @ 8105F58
	push {lr}
	adds r2, r0, 0
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _08105F6C
	movs r0, 0x1
	strh r0, [r2, 0x3C]
_08105F6C:
	pop {r0}
	bx r0
	thumb_func_end sub_8105B70

	thumb_func_start sub_8105B88
sub_8105B88: @ 8105F70
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08105F98
	adds r4, r0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	adds r0, r4, 0
	bl DestroySprite
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08105F98: .4byte gSprites
	thumb_func_end sub_8105B88

	thumb_func_start sub_8105BB4
sub_8105BB4: @ 8105F9C
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _08105FD8
	lsrs r1, 22
	adds r3, r1, r3
	ldr r5, [r3]
	ldr r3, _08105FDC
	adds r4, r1, r3
	movs r6, 0
	ldrsh r4, [r4, r6]
	adds r3, 0x2
	adds r1, r3
	movs r6, 0
	ldrsh r3, [r1, r6]
	lsls r2, 16
	asrs r2, 16
	str r2, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8105BF8
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08105FD8: .4byte gUnknown_083ECF0C
_08105FDC: .4byte gUnknown_083ECE7E
	thumb_func_end sub_8105BB4

	thumb_func_start sub_8105BF8
sub_8105BF8: @ 8105FE0
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r6, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	ldr r5, [sp, 0x14]
	lsls r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r0, _08106040
	lsrs r4, 22
	adds r0, r4, r0
	ldr r0, [r0]
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	movs r3, 0x10
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	adds r7, r0, 0
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _08106044
	adds r2, r0, r1
	ldrb r0, [r2, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r2, 0x5]
	str r6, [r2, 0x1C]
	strh r5, [r2, 0x3A]
	movs r0, 0x1
	strh r0, [r2, 0x3C]
	ldr r0, _08106048
	adds r4, r0
	ldr r1, [r4]
	cmp r1, 0
	beq _08106038
	adds r0, r2, 0
	bl SetSubspriteTables
_08106038:
	adds r0, r7, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08106040: .4byte gUnknown_083EDB5C
_08106044: .4byte gSprites
_08106048: .4byte gUnknown_083EDBC4
	thumb_func_end sub_8105BF8

	thumb_func_start sub_8105C64
sub_8105C64: @ 810604C
	movs r1, 0
	strh r1, [r0, 0x3C]
	bx lr
	thumb_func_end sub_8105C64

	thumb_func_start sub_8105C6C
sub_8105C6C: @ 8106054
	push {r4,r5,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r1, _081060D0
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _081060D4
	adds r0, r5, 0
	movs r2, 0x8
	bl memcpy
	ldrh r0, [r4, 0x30]
	adds r1, r0, 0x1
	strh r1, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF
	ble _0810609A
	adds r3, r4, 0
	adds r3, 0x42
	ldrb r2, [r3]
	lsls r0, r2, 26
	lsrs r0, 26
	movs r1, 0x1
	eors r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r0, 0
	strh r0, [r4, 0x30]
_0810609A:
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x42
	ldrb r1, [r0]
	movs r0, 0x3F
	ands r0, r1
	cmp r0, 0
	beq _081060C6
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
_081060C6:
	add sp, 0x10
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081060D0: .4byte gUnknown_083ECC62
_081060D4: .4byte gUnknown_083ECC6A
	thumb_func_end sub_8105C6C

	thumb_func_start sub_8105CF0
sub_8105CF0: @ 81060D8
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x1
	orrs r1, r2
	strb r1, [r3]
	bl sub_8105C6C
	pop {r0}
	bx r0
	thumb_func_end sub_8105CF0

	thumb_func_start sub_8105D08
sub_8105D08: @ 81060F0
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	bl sub_8105C6C
	pop {r0}
	bx r0
	thumb_func_end sub_8105D08

	thumb_func_start sub_8105D20
sub_8105D20: @ 8106108
	push {lr}
	adds r3, r0, 0
	adds r3, 0x3F
	ldrb r1, [r3]
	movs r2, 0x1
	orrs r1, r2
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	bl sub_8105C6C
	pop {r0}
	bx r0
	thumb_func_end sub_8105D20

	thumb_func_start sub_8105D3C
sub_8105D3C: @ 8106124
	push {lr}
	adds r2, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x1
	beq _08106158
	cmp r0, 0x1
	bgt _0810613A
	cmp r0, 0
	beq _08106144
	b _08106188
_0810613A:
	cmp r0, 0x2
	beq _08106168
	cmp r0, 0x3
	beq _08106184
	b _08106188
_08106144:
	ldrh r0, [r2, 0x20]
	adds r0, 0x4
	strh r0, [r2, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xCF
	ble _08106188
	movs r0, 0xD0
	strh r0, [r2, 0x20]
	b _08106176
_08106158:
	ldrh r0, [r2, 0x30]
	adds r0, 0x1
	strh r0, [r2, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	ble _08106188
	b _08106176
_08106168:
	ldrh r0, [r2, 0x20]
	adds r0, 0x4
	strh r0, [r2, 0x20]
	lsls r0, 16
	ldr r1, _08106180
	cmp r0, r1
	ble _08106188
_08106176:
	ldrh r0, [r2, 0x2E]
	adds r0, 0x1
	strh r0, [r2, 0x2E]
	b _08106188
	.align 2, 0
_08106180: .4byte 0x010f0000
_08106184:
	movs r0, 0
	strh r0, [r2, 0x3C]
_08106188:
	pop {r0}
	bx r0
	thumb_func_end sub_8105D3C

	thumb_func_start sub_8105DA4
sub_8105DA4: @ 810618C
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x1
	beq _081061C0
	cmp r0, 0x1
	bgt _081061A2
	cmp r0, 0
	beq _081061AC
	b _081061EA
_081061A2:
	cmp r0, 0x2
	beq _081061D0
	cmp r0, 0x3
	beq _081061E6
	b _081061EA
_081061AC:
	ldrh r0, [r1, 0x20]
	subs r0, 0x4
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD0
	bgt _081061EA
	movs r0, 0xD0
	strh r0, [r1, 0x20]
	b _081061DE
_081061C0:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	ble _081061EA
	b _081061DE
_081061D0:
	ldrh r0, [r1, 0x20]
	subs r0, 0x4
	strh r0, [r1, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x90
	bgt _081061EA
_081061DE:
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _081061EA
_081061E6:
	movs r0, 0
	strh r0, [r1, 0x3C]
_081061EA:
	pop {r0}
	bx r0
	thumb_func_end sub_8105DA4

	thumb_func_start sub_8105E08
sub_8105E08: @ 81061F0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _08106296
	lsls r0, 2
	ldr r1, _08106208
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08106208: .4byte _0810620C
	.align 2, 0
_0810620C:
	.4byte _08106224
	.4byte _0810623A
	.4byte _08106258
	.4byte _0810626C
	.4byte _0810627C
	.4byte _08106292
_08106224:
	ldr r0, _08106254
	ldrb r1, [r0, 0xA]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_0810623A:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _08106296
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0
	strh r0, [r4, 0x30]
	b _08106296
	.align 2, 0
_08106254: .4byte 0x02000000
_08106258:
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xCF
	ble _08106296
	movs r0, 0xD0
	strh r0, [r4, 0x20]
	b _0810628A
_0810626C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5A
	ble _08106296
	b _0810628A
_0810627C:
	ldrh r0, [r4, 0x20]
	adds r0, 0x4
	strh r0, [r4, 0x20]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xF7
	ble _08106296
_0810628A:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	b _08106296
_08106292:
	movs r0, 0
	strh r0, [r4, 0x3C]
_08106296:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8105E08

	thumb_func_start sub_8105EB4
sub_8105EB4: @ 810629C
	push {lr}
	adds r3, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r3, r1]
	cmp r0, 0x1
	beq _081062CA
	cmp r0, 0x1
	bgt _081062B2
	cmp r0, 0
	beq _081062B8
	b _08106338
_081062B2:
	cmp r0, 0x2
	beq _081062E8
	b _08106338
_081062B8:
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
_081062CA:
	ldrh r0, [r3, 0x22]
	adds r0, 0x8
	strh r0, [r3, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x6F
	ble _08106338
	movs r0, 0x70
	strh r0, [r3, 0x22]
	movs r0, 0x10
	strh r0, [r3, 0x30]
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	b _08106338
_081062E8:
	movs r0, 0x32
	ldrsh r2, [r3, r0]
	cmp r2, 0
	bne _0810632E
	ldrh r0, [r3, 0x22]
	ldrh r1, [r3, 0x30]
	subs r0, r1
	strh r0, [r3, 0x22]
	negs r1, r1
	strh r1, [r3, 0x30]
	ldrh r0, [r3, 0x34]
	adds r0, 0x1
	strh r0, [r3, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0810632E
	lsls r0, r1, 16
	asrs r0, 18
	strh r0, [r3, 0x30]
	strh r2, [r3, 0x34]
	adds r1, r0, 0
	cmp r1, 0
	bne _0810632E
	ldrh r0, [r3, 0x2E]
	adds r0, 0x1
	strh r0, [r3, 0x2E]
	strh r1, [r3, 0x3C]
	adds r2, r3, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0810632E:
	ldrh r0, [r3, 0x32]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	strh r0, [r3, 0x32]
_08106338:
	pop {r0}
	bx r0
	thumb_func_end sub_8105EB4

	thumb_func_start sub_8105F54
sub_8105F54: @ 810633C
	push {lr}
	adds r1, r0, 0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0810634E
	cmp r0, 0x1
	beq _08106364
	b _08106380
_0810634E:
	ldrh r0, [r1, 0x30]
	adds r0, 0x1
	strh r0, [r1, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	ble _08106380
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	b _08106380
_08106364:
	ldrh r0, [r1, 0x22]
	adds r0, 0x2
	strh r0, [r1, 0x22]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x2F
	ble _08106380
	movs r0, 0x30
	strh r0, [r1, 0x22]
	ldrh r0, [r1, 0x2E]
	adds r0, 0x1
	strh r0, [r1, 0x2E]
	movs r0, 0
	strh r0, [r1, 0x3C]
_08106380:
	pop {r0}
	bx r0
	thumb_func_end sub_8105F54

	thumb_func_start sub_8105F9C
sub_8105F9C: @ 8106384
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08106396
	cmp r0, 0x1
	beq _081063E8
	b _08106436
_08106396:
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x20
	ble _08106436
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0x5
	strh r0, [r4, 0x30]
	ldrb r0, [r4, 0x1]
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAnim
	ldr r2, _081063E4
	ldrh r1, [r4, 0x30]
	lsls r0, r1, 4
	orrs r0, r1
	lsls r0, 8
	strh r0, [r2]
	b _08106436
	.align 2, 0
_081063E4: .4byte 0x0400004c
_081063E8:
	ldrh r1, [r4, 0x32]
	lsls r1, 16
	asrs r1, 24
	ldrh r0, [r4, 0x30]
	subs r0, r1
	strh r0, [r4, 0x30]
	lsls r0, 16
	cmp r0, 0
	bge _081063FE
	movs r0, 0
	strh r0, [r4, 0x30]
_081063FE:
	ldr r2, _0810643C
	ldrh r1, [r4, 0x30]
	lsls r0, r1, 4
	orrs r0, r1
	lsls r0, 8
	strh r0, [r2]
	ldrh r1, [r4, 0x32]
	movs r0, 0xFF
	ands r0, r1
	adds r0, 0x80
	strh r0, [r4, 0x32]
	movs r0, 0x30
	ldrsh r1, [r4, r0]
	cmp r1, 0
	bne _08106436
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x3C]
	ldrb r1, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAnim
_08106436:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810643C: .4byte 0x0400004c
	thumb_func_end sub_8105F9C

	thumb_func_start sub_8106058
sub_8106058: @ 8106440
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x2
	bgt _08106490
	ldr r1, _0810648C
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 17
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	ble _081064CC
	ldrh r0, [r5, 0x30]
	adds r0, 0x1
	strh r0, [r5, 0x30]
	movs r0, 0
	strh r0, [r5, 0x32]
	b _081064CC
	.align 2, 0
_0810648C: .4byte gUnknown_083EDE10
_08106490:
	ldr r1, _081064E0
	movs r2, 0x30
	ldrsh r0, [r5, r2]
	lsls r0, 2
	adds r0, r1
	ldr r4, [r0]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 17
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	ldrh r0, [r5, 0x32]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r5, 0x32]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x18
	ble _081064CC
	strh r1, [r5, 0x30]
	strh r1, [r5, 0x32]
_081064CC:
	adds r0, r5, 0
	movs r1, 0x1
	bl StartSpriteAnimIfDifferent
	movs r0, 0
	strh r0, [r5, 0x3C]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_081064E0: .4byte gUnknown_083EDE10
	thumb_func_end sub_8106058

	thumb_func_start sub_81060FC
sub_81060FC: @ 81064E4
	push {r4-r6,lr}
	sub sp, 0x30
	adds r4, r0, 0
	ldr r1, _08106520
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	add r6, sp, 0x10
	ldr r1, _08106524
	adds r0, r6, 0
	movs r2, 0x10
	bl memcpy
	add r5, sp, 0x20
	ldr r1, _08106528
	adds r0, r5, 0
	movs r2, 0x10
	bl memcpy
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _0810655C
	cmp r0, 0x1
	bgt _0810652C
	cmp r0, 0
	beq _08106532
	b _081065A8
	.align 2, 0
_08106520: .4byte gUnknown_083ECC72
_08106524: .4byte gUnknown_083ECC82
_08106528: .4byte gUnknown_083ECC92
_0810652C:
	cmp r0, 0x2
	beq _08106570
	b _081065A8
_08106532:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r4, 0x26]
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r0, [r0]
	strh r0, [r4, 0x30]
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_0810655C:
	ldrh r0, [r4, 0x30]
	subs r0, 0x1
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	bne _081065A8
	b _081065A2
_08106570:
	ldrh r0, [r4, 0x24]
	movs r2, 0x24
	ldrsh r1, [r4, r2]
	cmp r1, 0
	ble _0810657E
	subs r0, 0x4
	b _08106584
_0810657E:
	cmp r1, 0
	bge _08106586
	adds r0, 0x4
_08106584:
	strh r0, [r4, 0x24]
_08106586:
	ldrh r0, [r4, 0x26]
	movs r2, 0x26
	ldrsh r1, [r4, r2]
	cmp r1, 0
	ble _08106594
	subs r0, 0x4
	b _0810659A
_08106594:
	cmp r1, 0
	bge _0810659C
	adds r0, 0x4
_0810659A:
	strh r0, [r4, 0x26]
_0810659C:
	ldr r0, [r4, 0x24]
	cmp r0, 0
	bne _081065A8
_081065A2:
	ldrh r0, [r4, 0x2E]
	adds r0, 0x1
	strh r0, [r4, 0x2E]
_081065A8:
	add sp, 0x30
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_81060FC

	thumb_func_start sub_81061C8
sub_81061C8: @ 81065B0
	push {r4,lr}
	sub sp, 0x10
	adds r4, r0, 0
	ldr r1, _08106614
	mov r0, sp
	movs r2, 0x10
	bl memcpy
	ldrh r1, [r4, 0x2E]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _081065D2
	adds r0, r1, 0x1
	strh r0, [r4, 0x2E]
	movs r0, 0xC
	strh r0, [r4, 0x30]
_081065D2:
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Cos
	strh r0, [r4, 0x24]
	movs r1, 0x3A
	ldrsh r0, [r4, r1]
	lsls r0, 1
	add r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0x30
	ldrsh r1, [r4, r2]
	bl Sin
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x30]
	movs r2, 0x30
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0810660C
	subs r0, r1, 0x1
	strh r0, [r4, 0x30]
_0810660C:
	add sp, 0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106614: .4byte gUnknown_083ECCA2
	thumb_func_end sub_81061C8

	thumb_func_start sub_8106230
sub_8106230: @ 8106618
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08106662
	cmp r0, 0x1
	bgt _08106630
	cmp r0, 0
	beq _0810663A
	b _08106732
_08106630:
	cmp r0, 0x2
	beq _081066AC
	cmp r0, 0x3
	beq _081066E4
	b _08106732
_0810663A:
	ldr r2, _081066A4
	adds r1, r2, 0
	adds r1, 0x5C
	movs r0, 0x2F
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x3F
	strh r0, [r1]
	subs r1, 0x4
	ldr r0, _081066A8
	strh r0, [r1]
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
_08106662:
	ldrh r0, [r5, 0x30]
	adds r2, r0, 0x2
	strh r2, [r5, 0x30]
	adds r0, 0xB2
	strh r0, [r5, 0x32]
	movs r1, 0xF0
	subs r1, r2
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD0
	ble _0810667E
	movs r0, 0xD0
	strh r0, [r5, 0x32]
_0810667E:
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0xCF
	bgt _0810668A
	movs r0, 0xD0
	strh r0, [r5, 0x34]
_0810668A:
	ldr r2, _081066A4
	ldrh r0, [r5, 0x32]
	lsls r0, 8
	ldrh r1, [r5, 0x34]
	orrs r0, r1
	adds r1, r2, 0
	adds r1, 0x58
	strh r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0x33
	ble _08106732
	b _08106724
	.align 2, 0
_081066A4: .4byte 0x02000000
_081066A8: .4byte 0x00002088
_081066AC:
	ldr r6, _0810673C
	movs r1, 0x12
	ldrsh r0, [r6, r1]
	cmp r0, 0
	beq _08106732
	ldr r1, _08106740
	movs r4, 0
	str r4, [sp]
	movs r0, 0x5
	movs r2, 0xD0
	movs r3, 0x74
	bl sub_8104D30
	adds r1, r6, 0
	adds r1, 0x58
	ldr r0, _08106744
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xD1
	lsls r0, 7
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0x2F
	strh r0, [r1]
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	strh r4, [r5, 0x30]
_081066E4:
	ldrh r0, [r5, 0x30]
	adds r2, r0, 0x2
	strh r2, [r5, 0x30]
	adds r0, 0xC2
	strh r0, [r5, 0x32]
	movs r1, 0xE0
	subs r1, r2
	strh r1, [r5, 0x34]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xD0
	ble _08106700
	movs r0, 0xD0
	strh r0, [r5, 0x32]
_08106700:
	movs r1, 0x34
	ldrsh r0, [r5, r1]
	cmp r0, 0xCF
	bgt _0810670C
	movs r0, 0xD0
	strh r0, [r5, 0x34]
_0810670C:
	ldr r2, _0810673C
	ldrh r0, [r5, 0x32]
	lsls r0, 8
	ldrh r1, [r5, 0x34]
	orrs r0, r1
	adds r1, r2, 0
	adds r1, 0x58
	strh r0, [r1]
	movs r1, 0x30
	ldrsh r0, [r5, r1]
	cmp r0, 0xF
	ble _08106732
_08106724:
	ldrh r0, [r5, 0x2E]
	adds r0, 0x1
	strh r0, [r5, 0x2E]
	adds r1, r2, 0
	adds r1, 0x5C
	movs r0, 0x3F
	strh r0, [r1]
_08106732:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810673C: .4byte 0x02000000
_08106740: .4byte SpriteCallbackDummy
_08106744: .4byte 0x0000c0e0
	thumb_func_end sub_8106230

	thumb_func_start nullsub_70
nullsub_70: @ 8106748
	bx lr
	thumb_func_end nullsub_70

	thumb_func_start sub_8106364
sub_8106364: @ 810674C
	ldr r1, _08106754
	movs r0, 0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08106754: .4byte 0x0400004c
	thumb_func_end sub_8106364

	thumb_func_start sub_8106370
sub_8106370: @ 8106758
	push {r4,lr}
	ldr r0, _08106780
	ldr r4, [r0]
	movs r0, 0x6
	bl IndexOfSpritePaletteTag
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 4
	movs r0, 0x80
	lsls r0, 17
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08106780: .4byte gUnknown_083EDE20
	thumb_func_end sub_8106370

	thumb_func_start sub_810639C
sub_810639C: @ 8106784
	ldr r2, _081067A4
	adds r1, r2, 0
	adds r1, 0x58
	movs r0, 0xF0
	strh r0, [r1]
	adds r1, 0x2
	movs r0, 0xA0
	strh r0, [r1]
	adds r0, r2, 0
	adds r0, 0x5C
	movs r1, 0x3F
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	bx lr
	.align 2, 0
_081067A4: .4byte 0x02000000
	thumb_func_end sub_810639C

	thumb_func_start sub_81063C0
sub_81063C0: @ 81067A8
	push {r4,lr}
	bl sub_8106404
	ldr r0, _081067D8
	ldr r4, _081067DC
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _081067E0
	movs r1, 0xC8
	lsls r1, 6
	adds r4, r1
	adds r1, r4, 0
	bl sub_800D238
	ldr r0, _081067E4
	bl LoadSpriteSheets
	ldr r0, _081067E8
	bl LoadSpritePalettes
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081067D8: .4byte gSlotMachineReelTimeLights_Gfx
_081067DC: .4byte 0x02010000
_081067E0: .4byte gUnknown_083EDE8C
_081067E4: .4byte gUnknown_083EDC2C
_081067E8: .4byte gSlotMachineSpritePalettes
	thumb_func_end sub_81063C0

	thumb_func_start sub_8106404
sub_8106404: @ 81067EC
	push {r4,r5,lr}
	ldr r3, _08106824
	movs r2, 0
	ldr r5, _08106828
	ldr r0, _0810682C
	ldr r4, [r0]
_081067F8:
	movs r1, 0
	adds r2, 0x1
_081067FC:
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r3]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	adds r3, 0x1
	cmp r1, 0x1F
	bls _081067FC
	lsls r0, r2, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _081067F8
	adds r0, r5, 0
	bl LoadSpriteSheet
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106824: .4byte 0x02010000
_08106828: .4byte gUnknown_083EDCDC
_0810682C: .4byte gUnknown_083EDCE4
	thumb_func_end sub_8106404

	thumb_func_start sub_8106448
sub_8106448: @ 8106830
	push {r4-r7,lr}
	ldr r0, _08106888
	ldr r4, _0810688C
	adds r1, r4, 0
	bl sub_800D238
	movs r3, 0xC0
	lsls r3, 19
	movs r5, 0xEC
	lsls r5, 5
	ldr r1, _08106890
	ldr r6, _08106894
	movs r2, 0x80
	lsls r2, 5
	movs r7, 0x80
	lsls r7, 24
_08106850:
	str r4, [r1]
	str r3, [r1, 0x4]
	str r6, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, r2
	adds r3, r2
	subs r5, r2
	cmp r5, r2
	bhi _08106850
	str r4, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r5, 1
	orrs r0, r7
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	ldr r0, _08106898
	movs r1, 0
	movs r2, 0xA0
	bl LoadPalette
	ldr r0, _0810689C
	movs r1, 0xD0
	movs r2, 0x20
	bl LoadPalette
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106888: .4byte gSlotMachine_Gfx
_0810688C: .4byte 0x02010000
_08106890: .4byte 0x040000d4
_08106894: .4byte 0x80000800
_08106898: .4byte gUnknown_08E95A18
_0810689C: .4byte gUnknown_083EDE24
	thumb_func_end sub_8106448

	thumb_func_start sub_81064B8
sub_81064B8: @ 81068A0
	push {lr}
	ldr r0, _081068B8
	ldr r1, _081068BC
	movs r2, 0xA0
	lsls r2, 2
	bl CpuSet
	bl sub_81064D8
	pop {r0}
	bx r0
	.align 2, 0
_081068B8: .4byte gUnknown_08E95AB8
_081068BC: .4byte 0x0600e800
	thumb_func_end sub_81064B8

	thumb_func_start sub_81064D8
sub_81064D8: @ 81068C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r6, _08106974
	movs r3, 0x4
	movs r0, 0xC0
	lsls r0, 1
	mov r12, r0
	movs r1, 0xC0
	lsls r1, 2
	mov r9, r1
	movs r2, 0xA0
	lsls r2, 1
	mov r8, r2
_081068DE:
	movs r0, 0
	lsls r4, r3, 16
	asrs r5, r4, 16
_081068E4:
	lsls r2, r0, 16
	asrs r2, 16
	adds r1, r5, r2
	lsls r1, 1
	adds r1, r6
	mov r7, r8
	adds r3, r1, r7
	ldr r7, _08106978
	adds r0, r7, 0
	strh r0, [r3]
	movs r0, 0xD0
	lsls r0, 2
	adds r3, r1, r0
	ldr r7, _0810697C
	adds r0, r7, 0
	strh r0, [r3]
	mov r0, r12
	adds r3, r1, r0
	ldr r7, _08106980
	adds r0, r7, 0
	strh r0, [r3]
	add r1, r9
	ldr r3, _08106984
	adds r0, r3, 0
	strh r0, [r1]
	adds r2, 0x1
	lsls r2, 16
	lsrs r0, r2, 16
	asrs r2, 16
	cmp r2, 0x3
	ble _081068E4
	asrs r3, r4, 16
	lsls r1, r3, 1
	adds r1, r6
	mov r5, r12
	adds r2, r1, r5
	adds r7, 0x5D
	adds r0, r7, 0
	strh r0, [r2]
	add r1, r9
	ldr r2, _08106988
	adds r0, r2, 0
	strh r0, [r1]
	movs r0, 0x7
	ldr r5, _0810698C
	adds r2, r5, 0
_08106940:
	lsls r1, r0, 16
	asrs r1, 16
	lsls r0, r1, 5
	adds r0, r3
	lsls r0, 1
	adds r0, r6
	strh r2, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r0, r1, 16
	asrs r1, 16
	cmp r1, 0xB
	ble _08106940
	movs r7, 0xA0
	lsls r7, 11
	adds r0, r4, r7
	lsrs r3, r0, 16
	asrs r0, 16
	cmp r0, 0x11
	ble _081068DE
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08106974: .4byte 0x0600f000
_08106978: .4byte 0x00002051
_0810697C: .4byte 0x00002851
_08106980: .4byte 0x00002061
_08106984: .4byte 0x00002861
_08106988: .4byte 0x000028be
_0810698C: .4byte 0x000020bf
	thumb_func_end sub_81064D8

	thumb_func_start sub_81065A8
sub_81065A8: @ 8106990
	push {r4-r6,lr}
	ldr r5, [sp, 0x10]
	lsls r0, 16
	asrs r0, 15
	ldr r6, _081069B8
	adds r4, r0, r6
	strh r1, [r4]
	ldr r4, _081069BC
	adds r1, r0, r4
	strh r2, [r1]
	adds r6, 0x40
	adds r1, r0, r6
	strh r3, [r1]
	ldr r1, _081069C0
	adds r0, r1
	strh r5, [r0]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_081069B8: .4byte 0x0600ebc0
_081069BC: .4byte 0x0600ebc2
_081069C0: .4byte 0x0600ec02
	thumb_func_end sub_81065A8

	thumb_func_start sub_81065DC
sub_81065DC: @ 81069C4
	push {r4,r5,lr}
	ldr r0, _08106A0C
	ldr r1, _08106A10
	movs r2, 0xA0
	lsls r2, 2
	bl CpuSet
	ldr r5, _08106A14
	movs r1, 0
	movs r4, 0
_081069D8:
	movs r0, 0
	lsls r3, r1, 16
	asrs r2, r3, 11
_081069DE:
	lsls r1, r0, 16
	asrs r1, 16
	adds r0, r2, r1
	lsls r0, 1
	adds r0, r5
	strh r4, [r0]
	adds r1, 0x1
	lsls r1, 16
	lsrs r0, r1, 16
	asrs r1, 16
	cmp r1, 0x1D
	ble _081069DE
	movs r1, 0x80
	lsls r1, 9
	adds r0, r3, r1
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _081069D8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08106A0C: .4byte gUnknown_08E95FB8
_08106A10: .4byte 0x0600e800
_08106A14: .4byte 0x0600f000
	thumb_func_end sub_81065DC

	.align 2, 0 @ Don't pad with nop.
