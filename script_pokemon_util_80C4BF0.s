	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start sub_80C4BF0
sub_80C4BF0: @ 80C4E20
	push {r4,lr}
	ldr r2, _080C4E4C
	ldr r1, _080C4E50
	ldrb r3, [r1, 0x15]
	movs r4, 0x9B
	lsls r4, 5
	adds r0, r2, r4
	strh r3, [r0]
	adds r0, r1, 0
	adds r0, 0x55
	ldrb r3, [r0]
	adds r4, 0x2
	adds r0, r2, r4
	strh r3, [r0]
	adds r1, 0x95
	ldrb r0, [r1]
	ldr r1, _080C4E54
	adds r2, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4E4C: .4byte gSaveBlock1
_080C4E50: .4byte gContestMons
_080C4E54: .4byte 0x00001364
	thumb_func_end sub_80C4BF0

	thumb_func_start sub_80C4C28
sub_80C4C28: @ 80C4E58
	push {lr}
	ldr r0, _080C4E70
	ldrb r0, [r0]
	adds r1, r0, 0
	cmp r0, 0x1
	beq _080C4E7E
	cmp r0, 0x1
	bgt _080C4E74
	cmp r0, 0
	beq _080C4E7A
	b _080C4E86
	.align 2, 0
_080C4E70: .4byte gSpecialVar_0x8005
_080C4E74:
	cmp r1, 0x2
	beq _080C4E82
	b _080C4E86
_080C4E7A:
	movs r1, 0x3
	b _080C4E88
_080C4E7E:
	movs r1, 0x4
	b _080C4E88
_080C4E82:
	movs r1, 0x5
	b _080C4E88
_080C4E86:
	movs r1, 0x64
_080C4E88:
	ldr r0, _080C4E90
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080C4E90: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80C4C28

	thumb_func_start sub_80C4C64
sub_80C4C64: @ 80C4E94
	push {lr}
	bl sub_80C46EC
	bl sub_80C4740
	bl sub_80C48F4
	pop {r0}
	bx r0
	thumb_func_end sub_80C4C64

	thumb_func_start sub_80C4C78
sub_80C4C78: @ 80C4EA8
	push {lr}
	ldr r0, _080C4EBC
	ldrh r0, [r0]
	cmp r0, 0x4
	bhi _080C4EE8
	lsls r0, 2
	ldr r1, _080C4EC0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C4EBC: .4byte gScriptContestCategory
_080C4EC0: .4byte _080C4EC4
	.align 2, 0
_080C4EC4:
	.4byte _080C4ED8
	.4byte _080C4EDC
	.4byte _080C4EE0
	.4byte _080C4EE4
	.4byte _080C4EE8
_080C4ED8:
	movs r0, 0x8
	b _080C4EEA
_080C4EDC:
	movs r0, 0x9
	b _080C4EEA
_080C4EE0:
	movs r0, 0xA
	b _080C4EEA
_080C4EE4:
	movs r0, 0xB
	b _080C4EEA
_080C4EE8:
	movs r0, 0xC
_080C4EEA:
	ldr r1, _080C4F00
	lsls r0, 5
	adds r0, r1
	ldr r1, _080C4F04
	adds r0, r1
	ldrh r1, [r0]
	cmp r1, 0
	bne _080C4F0C
	ldr r0, _080C4F08
	strh r1, [r0]
	b _080C4F12
	.align 2, 0
_080C4F00: .4byte gSaveBlock1
_080C4F04: .4byte 0x00002e04
_080C4F08: .4byte gSpecialVar_0x8004
_080C4F0C:
	ldr r1, _080C4F18
	movs r0, 0x1
	strh r0, [r1]
_080C4F12:
	pop {r0}
	bx r0
	.align 2, 0
_080C4F18: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80C4C78

	thumb_func_start sub_80C4CEC
sub_80C4CEC: @ 80C4F1C
	push {lr}
	movs r0, 0xFF
	bl sub_80B2A7C
	pop {r0}
	bx r0
	thumb_func_end sub_80C4CEC

	thumb_func_start sub_80C4CF8
sub_80C4CF8: @ 80C4F28
	push {lr}
	ldr r0, _080C4F58
	ldr r1, _080C4F5C
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C4F70
	ldr r0, _080C4F60
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080C4F70
	ldr r1, _080C4F64
	lsls r0, r2, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _080C4F68
	cmp r1, r0
	ble _080C4F70
	ldr r1, _080C4F6C
	movs r0, 0x1
	b _080C4F74
	.align 2, 0
_080C4F58: .4byte gUnknown_02038690
_080C4F5C: .4byte gContestPlayerMonIndex
_080C4F60: .4byte gScriptContestRank
_080C4F64: .4byte gUnknown_02038678
_080C4F68: .4byte 0x0000031f
_080C4F6C: .4byte gSpecialVar_0x8004
_080C4F70:
	ldr r1, _080C4F7C
	movs r0, 0
_080C4F74:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080C4F7C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_80C4CF8

	thumb_func_start sub_80C4D50
sub_80C4D50: @ 80C4F80
	push {lr}
	movs r3, 0
	ldr r0, _080C4FA8
	ldr r1, _080C4FAC
	adds r2, r0, r1
	movs r1, 0x4
_080C4F8C:
	ldrh r0, [r2]
	cmp r0, 0
	beq _080C4F98
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080C4F98:
	adds r2, 0x20
	subs r1, 0x1
	cmp r1, 0
	bge _080C4F8C
	adds r0, r3, 0
	pop {r1}
	bx r1
	.align 2, 0
_080C4FA8: .4byte gSaveBlock1
_080C4FAC: .4byte 0x00002f04
	thumb_func_end sub_80C4D50

	thumb_func_start sub_80C4D80
sub_80C4D80: @ 80C4FB0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	ldr r0, _080C50D0
	mov r12, r0
	ldr r1, _080C50D4
	mov r8, r1
	ldr r2, _080C50D8
	mov r9, r2
	mov r2, r12
	mov r1, sp
	movs r6, 0x3
_080C4FCE:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, 0x2
	adds r1, 0x2
	subs r6, 0x1
	cmp r6, 0
	bge _080C4FCE
	movs r6, 0
_080C4FDE:
	movs r1, 0x3
	cmp r1, r6
	ble _080C5008
_080C4FE4:
	subs r4, r1, 0x1
	lsls r0, r4, 1
	mov r5, sp
	adds r3, r5, r0
	lsls r0, r1, 1
	adds r2, r5, r0
	ldrh r5, [r3]
	movs r7, 0
	ldrsh r1, [r3, r7]
	movs r7, 0
	ldrsh r0, [r2, r7]
	cmp r1, r0
	bge _080C5002
	strh r5, [r2]
	strh r0, [r3]
_080C5002:
	adds r1, r4, 0
	cmp r1, r6
	bgt _080C4FE4
_080C5008:
	adds r6, 0x1
	cmp r6, 0x2
	ble _080C4FDE
	mov r2, r8
	ldrh r0, [r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	movs r2, 0
	movs r7, 0
	movs r6, 0
	lsls r0, 16
	asrs r4, r0, 16
	adds r3, r0, 0
	mov r1, sp
_080C5026:
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r0, r4
	bne _080C5042
	lsls r0, r2, 24
	movs r2, 0x80
	lsls r2, 17
	adds r0, r2
	lsrs r2, r0, 24
	mov r5, r8
	ldrh r5, [r5]
	cmp r6, r5
	bne _080C5042
	adds r7, r2, 0
_080C5042:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _080C5026
	movs r6, 0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	asrs r1, r3, 16
	lsls r2, 24
	mov r10, r2
	cmp r0, r1
	beq _080C5070
	adds r2, r1, 0
	mov r1, sp
_080C5060:
	adds r1, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080C5070
	movs r4, 0
	ldrsh r0, [r1, r4]
	cmp r0, r2
	bne _080C5060
_080C5070:
	lsls r0, r6, 24
	lsrs r4, r0, 24
	adds r2, r7, 0
	movs r6, 0
	asrs r5, r3, 16
	mov r8, r5
	mov r1, r12
	movs r5, 0
	ldrsh r0, [r1, r5]
	cmp r8, r0
	bne _080C5090
	cmp r7, 0x1
	beq _080C50A8
_080C508A:
	subs r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
_080C5090:
	adds r6, 0x1
	cmp r6, 0x3
	bgt _080C50A8
	lsls r0, r6, 1
	add r0, r12
	asrs r1, r3, 16
	movs r5, 0
	ldrsh r0, [r0, r5]
	cmp r1, r0
	bne _080C5090
	cmp r2, 0x1
	bne _080C508A
_080C50A8:
	lsls r1, r6, 24
	lsrs r1, 24
	mov r0, r9
	bl sub_80C4698
	ldr r0, _080C50DC
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C50E8
	ldr r0, _080C50E0
	lsls r1, r6, 3
	subs r1, r6
	lsls r1, 2
	ldr r2, _080C50E4
	adds r1, r2
	bl sub_80C4674
	b _080C50F4
	.align 2, 0
_080C50D0: .4byte gUnknown_02038670
_080C50D4: .4byte gSpecialVar_0x8006
_080C50D8: .4byte gStringVar1
_080C50DC: .4byte gUnknown_0203869A
_080C50E0: .4byte gStringVar2
_080C50E4: .4byte 0x03002988
_080C50E8:
	ldr r0, _080C5108
	lsls r1, r6, 6
	ldr r2, _080C510C
	adds r1, r2
	bl sub_80C4674
_080C50F4:
	mov r1, r10
	asrs r0, r1, 24
	cmp r0, 0x1
	beq _080C5100
	cmp r7, r0
	bne _080C5114
_080C5100:
	ldr r0, _080C5110
	strh r4, [r0]
	b _080C511A
	.align 2, 0
_080C5108: .4byte gStringVar2
_080C510C: .4byte gUnknown_0203857D
_080C5110: .4byte gSpecialVar_0x8006
_080C5114:
	ldr r1, _080C512C
	adds r0, r4, 0x4
	strh r0, [r1]
_080C511A:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C512C: .4byte gSpecialVar_0x8006
	thumb_func_end sub_80C4D80

	thumb_func_start ShowContestWinnerCleanup
ShowContestWinnerCleanup: @ 80C5130
	push {lr}
	ldr r0, _080C513C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C513C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end ShowContestWinnerCleanup

	thumb_func_start ShowContestWinner
ShowContestWinner: @ 80C5140
	push {r4-r6,lr}
	ldr r6, _080C5184
	ldrb r0, [r6]
	cmp r0, 0
	beq _080C5170
	bl sub_80AAF30
	ldr r4, _080C5188
	ldr r0, _080C518C
	adds r1, r4, r0
	movs r5, 0
	movs r0, 0x1
	strb r0, [r1]
	movs r0, 0xFE
	movs r1, 0
	bl sub_80B2C4C
	ldr r1, _080C5190
	adds r4, r1
	strb r0, [r4]
	movs r0, 0x3
	bl sub_80B2A7C
	strb r5, [r6]
_080C5170:
	ldr r0, _080C5194
	bl SetMainCallback2
	ldr r1, _080C5198
	ldr r0, _080C519C
	str r0, [r1, 0x8]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C5184: .4byte gUnknown_0203856C
_080C5188: .4byte 0x02000000
_080C518C: .4byte 0x00015ddf
_080C5190: .4byte 0x00015dde
_080C5194: .4byte CB2_ContestPainting
_080C5198: .4byte gMain
_080C519C: .4byte ShowContestWinnerCleanup
	thumb_func_end ShowContestWinner

	thumb_func_start sub_80C4F70
sub_80C4F70: @ 80C51A0
	push {r4,lr}
	ldr r0, _080C51D8
	ldr r4, _080C51DC
	ldrb r1, [r4, 0x15]
	bl VarSet
	ldr r0, _080C51E0
	adds r1, r4, 0
	adds r1, 0x55
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080C51E4
	adds r1, r4, 0
	adds r1, 0x95
	ldrb r1, [r1]
	bl VarSet
	ldr r0, _080C51E8
	adds r1, r4, 0
	adds r1, 0xD5
	ldrb r1, [r1]
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C51D8: .4byte 0x00004010
_080C51DC: .4byte gContestMons
_080C51E0: .4byte 0x00004011
_080C51E4: .4byte 0x00004012
_080C51E8: .4byte 0x00004013
	thumb_func_end sub_80C4F70

	thumb_func_start GiveMonArtistRibbon
GiveMonArtistRibbon: @ 80C51EC
	push {r4-r6,lr}
	sub sp, 0x4
	ldr r6, _080C524C
	ldrb r0, [r6]
	movs r5, 0x64
	muls r0, r5
	ldr r4, _080C5250
	adds r0, r4
	movs r1, 0x46
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0
	bne _080C5268
	ldr r0, _080C5254
	ldr r1, _080C5258
	ldrb r2, [r1]
	adds r0, r2, r0
	ldrb r0, [r0]
	cmp r0, 0
	bne _080C5268
	ldr r0, _080C525C
	ldrh r0, [r0]
	cmp r0, 0x3
	bne _080C5268
	ldr r1, _080C5260
	lsls r0, r2, 1
	adds r0, r1
	movs r2, 0
	ldrsh r1, [r0, r2]
	ldr r0, _080C5264
	cmp r1, r0
	ble _080C5268
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	ldrb r0, [r6]
	muls r0, r5
	adds r0, r4
	movs r1, 0x46
	mov r2, sp
	bl SetMonData
	movs r0, 0x1
	b _080C526A
	.align 2, 0
_080C524C: .4byte gUnknown_02038694
_080C5250: .4byte gPlayerParty
_080C5254: .4byte gUnknown_02038690
_080C5258: .4byte gContestPlayerMonIndex
_080C525C: .4byte gScriptContestRank
_080C5260: .4byte gUnknown_02038678
_080C5264: .4byte 0x0000031f
_080C5268:
	movs r0, 0
_080C526A:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GiveMonArtistRibbon

	thumb_func_start sub_80C5044
sub_80C5044: @ 80C5274
	ldr r0, _080C527C
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080C527C: .4byte gUnknown_0203856C
	thumb_func_end sub_80C5044

	thumb_func_start ShowContestEntryMonPic
ShowContestEntryMonPic: @ 80C5280
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0xC
	ldr r4, _080C536C
	adds r0, r4, 0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _080C535A
	movs r0, 0xA
	mov r10, r0
	movs r7, 0x3
	movs r1, 0x3
	movs r2, 0x13
	movs r3, 0xD
	bl MenuDrawTextWindow
	ldr r2, _080C5370
	ldr r0, _080C5374
	ldrh r1, [r0]
	lsls r1, 6
	adds r0, r1, r2
	ldrh r6, [r0]
	adds r0, r2, 0
	adds r0, 0x38
	adds r0, r1, r0
	ldr r0, [r0]
	mov r8, r0
	adds r2, 0x3C
	adds r1, r2
	ldr r1, [r1]
	mov r9, r1
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C5378
	lsls r5, r0, 2
	adds r5, r0
	lsls r5, 3
	adds r5, r1
	movs r0, 0
	strh r0, [r5, 0x8]
	strh r6, [r5, 0xA]
	lsls r0, r6, 3
	ldr r1, _080C537C
	adds r0, r1
	ldr r1, _080C5380
	lsls r2, r6, 2
	adds r2, r1
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	ldr r4, _080C5384
	ldr r3, [r4]
	ldr r4, [r4, 0x4]
	str r4, [sp]
	str r6, [sp, 0x4]
	mov r4, r8
	str r4, [sp, 0x8]
	bl sub_800D334
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	bl sub_80409C8
	adds r4, r0, 0
	bl LoadCompressedObjectPalette
	adds r0, r6, 0
	movs r1, 0x1
	bl GetMonSpriteTemplate_803C56C
	ldr r0, _080C5388
	ldrh r1, [r4, 0x4]
	strh r1, [r0, 0x2]
	movs r1, 0x78
	movs r2, 0x40
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0xC]
	mov r1, r10
	strh r1, [r5, 0xE]
	strh r7, [r5, 0x10]
	ldr r3, _080C538C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r1, r0
	ldr r2, _080C5390
	str r2, [r0]
	adds r1, r3
	ldrb r2, [r1, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x5]
_080C535A:
	add sp, 0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C536C: .4byte sub_80C5190
_080C5370: .4byte gContestMons
_080C5374: .4byte gSpecialVar_0x8006
_080C5378: .4byte gTasks
_080C537C: .4byte gMonFrontPicTable
_080C5380: .4byte gMonFrontPicCoords
_080C5384: .4byte gUnknown_081FAF4C
_080C5388: .4byte gUnknown_02024E8C
_080C538C: .4byte gSprites
_080C5390: .4byte SpriteCallbackDummy
	thumb_func_end ShowContestEntryMonPic

	thumb_func_start sub_80C5164
sub_80C5164: @ 80C5394
	push {lr}
	ldr r0, _080C53B8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xFF
	beq _080C53B4
	ldr r0, _080C53BC
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
	adds r0, 0x1
	strh r0, [r1, 0x8]
_080C53B4:
	pop {r0}
	bx r0
	.align 2, 0
_080C53B8: .4byte sub_80C5190
_080C53BC: .4byte gTasks
	thumb_func_end sub_80C5164

	thumb_func_start sub_80C5190
sub_80C5190: @ 80C53C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _080C53E4
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _080C5452
	cmp r0, 0x1
	bgt _080C53E8
	cmp r0, 0
	beq _080C5428
	b _080C5452
	.align 2, 0
_080C53E4: .4byte gTasks
_080C53E8:
	cmp r0, 0x2
	beq _080C53F2
	cmp r0, 0x3
	beq _080C5434
	b _080C5452
_080C53F2:
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080C5430
	adds r5, r0, r1
	ldrb r0, [r5, 0x5]
	lsrs r0, 4
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r0, 16
	bl FreeSpritePaletteByTag
	ldrb r0, [r5, 0x1]
	lsls r0, 30
	cmp r0, 0
	beq _080C5422
	ldrb r0, [r5, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
_080C5422:
	adds r0, r5, 0
	bl DestroySprite
_080C5428:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _080C5452
	.align 2, 0
_080C5430: .4byte gSprites
_080C5434:
	ldrb r2, [r4, 0xE]
	adds r0, r2, 0
	ldrb r3, [r4, 0x10]
	adds r1, r3, 0
	adds r2, 0x9
	lsls r2, 24
	lsrs r2, 24
	adds r3, 0xA
	lsls r3, 24
	lsrs r3, 24
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl DestroyTask
_080C5452:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80C5190

	thumb_func_start ScriptGetMultiplayerId
ScriptGetMultiplayerId: @ 80C5458
	push {r4,lr}
	ldr r0, _080C5474
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C547C
	ldr r4, _080C5478
	bl GetMultiplayerId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	b _080C5482
	.align 2, 0
_080C5474: .4byte gUnknown_0203869A
_080C5478: .4byte gScriptResult
_080C547C:
	ldr r1, _080C5488
	movs r0, 0x4
	strh r0, [r1]
_080C5482:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5488: .4byte gScriptResult
	thumb_func_end ScriptGetMultiplayerId

	thumb_func_start ScriptRandom
ScriptRandom: @ 80C548C
	push {r4,lr}
	ldr r0, _080C54B0
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080C54C4
	ldr r2, _080C54B4
	ldr r1, [r2]
	ldr r0, _080C54B8
	muls r0, r1
	ldr r1, _080C54BC
	adds r0, r1
	str r0, [r2]
	lsrs r0, 16
	ldr r4, _080C54C0
	b _080C54CE
	.align 2, 0
_080C54B0: .4byte gUnknown_0203869A
_080C54B4: .4byte gUnknown_03005D28
_080C54B8: .4byte 0x41c64e6d
_080C54BC: .4byte 0x00006073
_080C54C0: .4byte gScriptResult
_080C54C4:
	ldr r4, _080C54DC
	bl Random
	lsls r0, 16
	lsrs r0, 16
_080C54CE:
	ldrh r1, [r4]
	bl __umodsi3
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C54DC: .4byte gScriptResult
	thumb_func_end ScriptRandom

	thumb_func_start HealPlayerParty
HealPlayerParty: @ 80C54E0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	ldr r0, _080C559C
	ldrb r0, [r0]
	cmp r8, r0
	bcs _080C558C
	ldr r1, _080C55A0
	mov r10, r1
	mov r6, sp
_080C54FE:
	movs r0, 0x64
	mov r4, r8
	muls r4, r0
	add r4, r10
	adds r0, r4, 0
	movs r1, 0x3A
	bl GetMonData
	lsls r1, r0, 16
	strb r0, [r6]
	lsrs r1, 24
	strb r1, [r6, 0x1]
	adds r0, r4, 0
	movs r1, 0x39
	mov r2, sp
	bl SetMonData
	adds r0, r4, 0
	movs r1, 0x15
	bl GetMonData
	lsls r0, 24
	lsrs r7, r0, 24
	movs r5, 0
	movs r1, 0x1
	add r1, r8
	mov r9, r1
_080C5534:
	adds r1, r5, 0
	adds r1, 0xD
	adds r0, r4, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	adds r1, r7, 0
	adds r2, r5, 0
	bl CalculatePPWithBonus
	strb r0, [r6]
	adds r1, r5, 0
	adds r1, 0x11
	adds r0, r4, 0
	mov r2, sp
	bl SetMonData
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3
	bls _080C5534
	movs r0, 0
	strb r0, [r6]
	strb r0, [r6, 0x1]
	strb r0, [r6, 0x2]
	strb r0, [r6, 0x3]
	movs r1, 0x64
	mov r0, r8
	muls r0, r1
	add r0, r10
	movs r1, 0x37
	mov r2, sp
	bl SetMonData
	mov r1, r9
	lsls r0, r1, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _080C559C
	ldrb r0, [r0]
	cmp r8, r0
	bcc _080C54FE
_080C558C:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C559C: .4byte gPlayerPartyCount
_080C55A0: .4byte gPlayerParty
	thumb_func_end HealPlayerParty

	thumb_func_start ScriptGiveMon
ScriptGiveMon: @ 80C55A4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x78
	adds r5, r0, 0
	adds r3, r1, 0
	adds r4, r2, 0
	lsls r5, 16
	lsrs r5, 16
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 16
	lsrs r0, r4, 16
	mov r8, r0
	add r6, sp, 0x14
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r3, 0
	movs r3, 0x20
	bl CreateMon
	add r0, sp, 0x10
	mov r1, r8
	strb r1, [r0]
	lsrs r4, 24
	strb r4, [r0, 0x1]
	adds r0, r6, 0
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r6, 0
	bl GiveMonToPlayer
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r4, 0x1
	bgt _080C5618
	cmp r4, 0
	blt _080C5618
	adds r0, r5, 0
	movs r1, 0x2
	bl sub_8090D90
	adds r0, r5, 0
	movs r1, 0x3
	bl sub_8090D90
_080C5618:
	adds r0, r4, 0
	add sp, 0x78
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end ScriptGiveMon

	thumb_func_start ScriptGiveEgg
ScriptGiveEgg: @ 80C5628
	push {lr}
	sub sp, 0x68
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r0, sp
	movs r2, 0x1
	bl sub_8042044
	add r2, sp, 0x64
	movs r0, 0x1
	strb r0, [r2]
	mov r0, sp
	movs r1, 0x2D
	bl SetMonData
	mov r0, sp
	bl GiveMonToPlayer
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x68
	pop {r1}
	bx r1
	thumb_func_end ScriptGiveEgg

	thumb_func_start CheckForAlivePartyMons
CheckForAlivePartyMons: @ 80C5658
	push {lr}
	bl sub_803DAA0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	beq _080C5674
	cmp r1, 0x1
	bgt _080C5670
	cmp r1, 0
	beq _080C5674
	b _080C5678
_080C5670:
	cmp r1, 0x2
	bne _080C5678
_080C5674:
	ldr r0, _080C567C
	strh r1, [r0]
_080C5678:
	pop {r0}
	bx r0
	.align 2, 0
_080C567C: .4byte gScriptResult
	thumb_func_end CheckForAlivePartyMons

	thumb_func_start CheckPartyMonHasHeldItem
CheckPartyMonHasHeldItem: @ 80C5680
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r6, r0, 16
	movs r5, 0
	movs r7, 0xCE
	lsls r7, 1
_080C568C:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _080C56BC
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0
	beq _080C56C0
	cmp r0, r7
	beq _080C56C0
	adds r0, r4, 0
	movs r1, 0xC
	bl GetMonData
	cmp r0, r6
	bne _080C56C0
	movs r0, 0x1
	b _080C56C8
	.align 2, 0
_080C56BC: .4byte gPlayerParty
_080C56C0:
	adds r5, 0x1
	cmp r5, 0x5
	ble _080C568C
	movs r0, 0
_080C56C8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckPartyMonHasHeldItem

	thumb_func_start GetNameOfEnigmaBerryInPlayerParty
GetNameOfEnigmaBerryInPlayerParty: @ 80C56D0
	push {r4,lr}
	movs r0, 0xAF
	bl CheckPartyMonHasHeldItem
	lsls r0, 24
	lsrs r0, 24
	adds r4, r0, 0
	cmp r4, 0x1
	bne _080C56F2
	movs r0, 0xAF
	bl ItemIdToBerryType
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _080C56FC
	bl GetBerryNameByBerryType
_080C56F2:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C56FC: .4byte gStringVar1
	thumb_func_end GetNameOfEnigmaBerryInPlayerParty

	thumb_func_start ScriptWildBattle
ScriptWildBattle: @ 80C5700
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	lsls r7, r2, 16
	lsrs r6, r7, 16
	bl ZeroEnemyPartyMons
	ldr r0, _080C575C
	mov r8, r0
	movs r0, 0
	str r0, [sp]
	str r0, [sp, 0x4]
	str r0, [sp, 0x8]
	str r0, [sp, 0xC]
	mov r0, r8
	adds r1, r4, 0
	adds r2, r5, 0
	movs r3, 0x20
	bl CreateMon
	cmp r6, 0
	beq _080C574E
	add r0, sp, 0x10
	strb r6, [r0]
	adds r1, r0, 0
	lsrs r0, r7, 24
	strb r0, [r1, 0x1]
	mov r0, r8
	movs r1, 0xC
	add r2, sp, 0x10
	bl SetMonData
_080C574E:
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C575C: .4byte gEnemyParty
	thumb_func_end ScriptWildBattle

	thumb_func_start ScriptSetMonMoveSlot
ScriptSetMonMoveSlot: @ 80C5760
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r3, 0x6
	bls _080C577C
	ldr r0, _080C5790
	ldrb r0, [r0]
	subs r0, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_080C577C:
	movs r0, 0x64
	muls r0, r3
	ldr r1, _080C5794
	adds r0, r1
	adds r1, r4, 0
	bl SetMonMoveSlot
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C5790: .4byte gPlayerPartyCount
_080C5794: .4byte gPlayerParty
	thumb_func_end ScriptSetMonMoveSlot

	thumb_func_start sub_80C5568
sub_80C5568: @ 80C5798
	push {lr}
	ldr r1, _080C57A8
	ldr r0, _080C57AC
	str r0, [r1, 0x8]
	bl sub_8121E10
	pop {r0}
	bx r0
	.align 2, 0
_080C57A8: .4byte gMain
_080C57AC: .4byte sub_80C5580
	thumb_func_end sub_80C5568

	thumb_func_start sub_80C5580
sub_80C5580: @ 80C57B0
	push {lr}
	ldr r0, _080C57C0
	ldrb r1, [r0]
	cmp r1, 0
	bne _080C57C8
	ldr r0, _080C57C4
	strh r1, [r0]
	b _080C57CE
	.align 2, 0
_080C57C0: .4byte gUnknown_02039270
_080C57C4: .4byte gScriptResult
_080C57C8:
	ldr r1, _080C57D8
	movs r0, 0x1
	strh r0, [r1]
_080C57CE:
	ldr r0, _080C57DC
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080C57D8: .4byte gScriptResult
_080C57DC: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_80C5580

	thumb_func_start ChooseBattleTowerPlayerParty
ChooseBattleTowerPlayerParty: @ 80C57E0
	push {lr}
	ldr r1, _080C57F0
	ldr r0, _080C57F4
	str r0, [r1, 0x8]
	bl sub_8121E34
	pop {r0}
	bx r0
	.align 2, 0
_080C57F0: .4byte gMain
_080C57F4: .4byte SetBattleTowerPlayerParty
	thumb_func_end ChooseBattleTowerPlayerParty

	thumb_func_start SetBattleTowerPlayerParty
SetBattleTowerPlayerParty: @ 80C57F8
	push {r4,lr}
	ldr r0, _080C580C
	ldrb r4, [r0]
	cmp r4, 0
	bne _080C5814
	bl LoadPlayerParty
	ldr r0, _080C5810
	strh r4, [r0]
	b _080C581E
	.align 2, 0
_080C580C: .4byte gUnknown_02039270
_080C5810: .4byte gScriptResult
_080C5814:
	bl ReducePlayerPartyToThree
	ldr r1, _080C582C
	movs r0, 0x1
	strh r0, [r1]
_080C581E:
	ldr r0, _080C5830
	bl SetMainCallback2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C582C: .4byte gScriptResult
_080C5830: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end SetBattleTowerPlayerParty

	thumb_func_start ReducePlayerPartyToThree
ReducePlayerPartyToThree: @ 80C5834
	push {r4-r7,lr}
	sub sp, 0x134
	add r0, sp, 0x12C
	movs r1, 0
	str r1, [r0]
	ldr r2, _080C58A4
	mov r1, sp
	bl CpuSet
	movs r5, 0
	movs r7, 0x64
	ldr r6, _080C58A8
	mov r4, sp
_080C584E:
	ldr r0, _080C58AC
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, 0
	beq _080C5868
	subs r0, 0x1
	adds r1, r0, 0
	muls r1, r7
	adds r1, r6
	adds r0, r4, 0
	movs r2, 0x64
	bl memcpy
_080C5868:
	adds r4, 0x64
	adds r5, 0x1
	cmp r5, 0x2
	ble _080C584E
	add r0, sp, 0x130
	movs r1, 0
	str r1, [r0]
	ldr r4, _080C58A8
	ldr r2, _080C58B0
	adds r1, r4, 0
	bl CpuSet
	mov r5, sp
	add r6, sp, 0xC8
_080C5884:
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x64
	bl memcpy
	adds r5, 0x64
	adds r4, 0x64
	cmp r5, r6
	ble _080C5884
	bl CalculatePlayerPartyCount
	add sp, 0x134
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C58A4: .4byte 0x0500004b
_080C58A8: .4byte gPlayerParty
_080C58AC: .4byte gUnknown_02039270
_080C58B0: .4byte 0x05000096
	thumb_func_end ReducePlayerPartyToThree

	.align 2, 0 @ Don't pad with nop.
