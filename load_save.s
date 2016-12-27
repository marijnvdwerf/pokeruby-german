	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CheckForFlashMemory
CheckForFlashMemory: @ 8047CF0
	push {lr}
	bl IdentifyFlash
	lsls r0, 16
	cmp r0, 0
	bne _08047D0C
	ldr r1, _08047D08
	movs r0, 0x1
	str r0, [r1]
	bl InitFlashTimer
	b _08047D12
	.align 2, 0
_08047D08: .4byte gUnknown_3004820
_08047D0C:
	ldr r1, _08047D18
	movs r0, 0
	str r0, [r1]
_08047D12:
	pop {r0}
	bx r0
	.align 2, 0
_08047D18: .4byte gUnknown_3004820
	thumb_func_end CheckForFlashMemory

	thumb_func_start GetSecretBase2Field_9
GetSecretBase2Field_9: @ 8047D1C
	ldr r0, _08047D24
	ldrb r0, [r0, 0x9]
	bx lr
	.align 2, 0
_08047D24: .4byte gSaveBlock2
	thumb_func_end GetSecretBase2Field_9

	thumb_func_start ClearSecretBase2Field_9
ClearSecretBase2Field_9: @ 8047D28
	ldr r1, _08047D30
	movs r0, 0
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047D30: .4byte gSaveBlock2
	thumb_func_end ClearSecretBase2Field_9

	thumb_func_start SetSecretBase2Field_9
SetSecretBase2Field_9: @ 8047D34
	ldr r1, _08047D3C
	movs r0, 0x1
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047D3C: .4byte gSaveBlock2
	thumb_func_end SetSecretBase2Field_9

	thumb_func_start SetSecretBase2Field_9_AndHideBG
SetSecretBase2Field_9_AndHideBG: @ 8047D40
	push {lr}
	movs r0, 0
	bl gpu_sync_bg_hide
	ldr r1, _08047D54
	movs r0, 0x1
	strb r0, [r1, 0x9]
	pop {r0}
	bx r0
	.align 2, 0
_08047D54: .4byte gSaveBlock2
	thumb_func_end SetSecretBase2Field_9_AndHideBG

	thumb_func_start ClearSecretBase2Field_9_2
ClearSecretBase2Field_9_2: @ 8047D58
	ldr r1, _08047D60
	movs r0, 0
	strb r0, [r1, 0x9]
	bx lr
	.align 2, 0
_08047D60: .4byte gSaveBlock2
	thumb_func_end ClearSecretBase2Field_9_2

	thumb_func_start SavePlayerParty
SavePlayerParty: @ 8047D64
	push {r4-r6,lr}
	ldr r2, _08047D9C
	ldr r0, _08047DA0
	ldrb r1, [r0]
	movs r3, 0x8D
	lsls r3, 2
	adds r0, r2, r3
	strb r1, [r0]
	movs r6, 0
	movs r0, 0x8E
	lsls r0, 2
	adds r5, r2, r0
	movs r4, 0
_08047D7E:
	ldr r1, _08047DA4
	adds r1, r4, r1
	adds r0, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x64
	adds r6, 0x1
	cmp r6, 0x5
	ble _08047D7E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047D9C: .4byte gSaveBlock1
_08047DA0: .4byte gPlayerPartyCount
_08047DA4: .4byte gPlayerParty
	thumb_func_end SavePlayerParty

	thumb_func_start LoadPlayerParty
LoadPlayerParty: @ 8047DA8
	push {r4-r6,lr}
	ldr r0, _08047DE4
	ldr r1, _08047DE8
	movs r2, 0x8D
	lsls r2, 2
	adds r1, r2
	ldrb r1, [r1]
	strb r1, [r0]
	ldr r4, _08047DEC
	movs r5, 0
	movs r0, 0xFA
	lsls r0, 1
	adds r6, r4, r0
_08047DC2:
	ldr r1, _08047DE8
	adds r1, r5, r1
	movs r2, 0x8E
	lsls r2, 2
	adds r1, r2
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
	adds r4, 0x64
	adds r5, 0x64
	cmp r4, r6
	ble _08047DC2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047DE4: .4byte gPlayerPartyCount
_08047DE8: .4byte gSaveBlock1
_08047DEC: .4byte gPlayerParty
	thumb_func_end LoadPlayerParty

	thumb_func_start SaveMapObjects
SaveMapObjects: @ 8047DF0
	push {r4-r7,lr}
	ldr r0, _08047E20
	ldr r4, _08047E24
	movs r1, 0x9E
	lsls r1, 4
	adds r3, r0, r1
	movs r2, 0xF
_08047DFE:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047DFE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047E20: .4byte gSaveBlock1
_08047E24: .4byte gMapObjects
	thumb_func_end SaveMapObjects

	thumb_func_start LoadMapObjects
LoadMapObjects: @ 8047E28
	push {r4-r7,lr}
	ldr r0, _08047E58
	movs r1, 0x9E
	lsls r1, 4
	adds r4, r0, r1
	ldr r3, _08047E5C
	movs r2, 0xF
_08047E36:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047E36
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047E58: .4byte gSaveBlock1
_08047E5C: .4byte gMapObjects
	thumb_func_end LoadMapObjects

	thumb_func_start SaveSerializedGame
SaveSerializedGame: @ 8047E60
	push {lr}
	bl SavePlayerParty
	bl SaveMapObjects
	pop {r0}
	bx r0
	thumb_func_end SaveSerializedGame

	thumb_func_start LoadSerializedGame
LoadSerializedGame: @ 8047E70
	push {lr}
	bl LoadPlayerParty
	bl LoadMapObjects
	pop {r0}
	bx r0
	thumb_func_end LoadSerializedGame

	thumb_func_start LoadPlayerData
LoadPlayerData: @ 8047E80
	push {r4-r7,lr}
	ldr r0, _08047F30
	movs r1, 0xAC
	lsls r1, 3
	adds r3, r0, r1
	ldr r1, _08047F34
	movs r2, 0x13
_08047E8E:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047E8E
	ldr r1, _08047F34
	ldr r0, _08047F30
	movs r2, 0xB6
	lsls r2, 3
	adds r3, r0, r2
	adds r1, 0x50
	movs r2, 0x13
_08047EA6:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047EA6
	ldr r1, _08047F34
	ldr r0, _08047F30
	movs r5, 0xC0
	lsls r5, 3
	adds r3, r0, r5
	adds r1, 0xA0
	movs r2, 0xF
_08047EBE:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047EBE
	ldr r1, _08047F34
	ldr r0, _08047F30
	movs r6, 0xC8
	lsls r6, 3
	adds r3, r0, r6
	adds r1, 0xE0
	movs r2, 0x3F
_08047ED6:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047ED6
	ldr r1, _08047F34
	ldr r0, _08047F30
	movs r7, 0xE8
	lsls r7, 3
	adds r3, r0, r7
	movs r0, 0xF0
	lsls r0, 1
	adds r1, r0
	movs r2, 0x2D
_08047EF2:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047EF2
	ldr r0, _08047F34
	ldr r4, _08047F30
	movs r1, 0xA6
	lsls r1, 2
	adds r3, r0, r1
	ldr r2, _08047F38
	mov r12, r2
	movs r2, 0xF
_08047F0C:
	adds r1, r3, 0
	mov r5, r12
	adds r0, r4, r5
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047F0C
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047F30: .4byte gSaveBlock1
_08047F34: .4byte gLoadedSaveData
_08047F38: .4byte 0x00002b4c
	thumb_func_end LoadPlayerData

	thumb_func_start SavePlayerData
SavePlayerData: @ 8047F3C
	push {r4-r7,lr}
	ldr r0, _08047FF0
	ldr r3, _08047FF4
	movs r2, 0xAC
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0x13
_08047F4A:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047F4A
	ldr r1, _08047FF0
	ldr r0, _08047FF4
	adds r3, r0, 0
	adds r3, 0x50
	movs r5, 0xB6
	lsls r5, 3
	adds r1, r5
	movs r2, 0x13
_08047F64:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047F64
	ldr r1, _08047FF0
	ldr r0, _08047FF4
	adds r3, r0, 0
	adds r3, 0xA0
	movs r6, 0xC0
	lsls r6, 3
	adds r1, r6
	movs r2, 0xF
_08047F7E:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047F7E
	ldr r1, _08047FF0
	ldr r0, _08047FF4
	adds r3, r0, 0
	adds r3, 0xE0
	movs r7, 0xC8
	lsls r7, 3
	adds r1, r7
	movs r2, 0x3F
_08047F98:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047F98
	ldr r1, _08047FF0
	ldr r0, _08047FF4
	movs r2, 0xF0
	lsls r2, 1
	adds r3, r0, r2
	movs r5, 0xE8
	lsls r5, 3
	adds r1, r5
	movs r2, 0x2D
_08047FB4:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, 0x1
	cmp r2, 0
	bge _08047FB4
	ldr r0, _08047FF0
	ldr r4, _08047FF4
	ldr r6, _08047FF8
	adds r3, r0, r6
	movs r7, 0xA6
	lsls r7, 2
	mov r12, r7
	movs r2, 0xF
_08047FCE:
	adds r1, r3, 0
	mov r5, r12
	adds r0, r4, r5
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	adds r4, 0x24
	adds r3, 0x24
	subs r2, 0x1
	cmp r2, 0
	bge _08047FCE
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047FF0: .4byte gSaveBlock1
_08047FF4: .4byte gLoadedSaveData
_08047FF8: .4byte 0x00002b4c
	thumb_func_end SavePlayerData

	.align 2, 0 @ Don't pad with nop.
