	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start npc_before_player_of_type
npc_before_player_of_type: @ 810B6C8
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0810B708 @ =gUnknown_0203923C
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810B70C @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r2, r1, r2
	ldrb r0, [r2, 0x5]
	cmp r0, r5
	bne _0810B714
	ldr r1, _0810B710 @ =gScriptLastTalked
	ldrb r0, [r2, 0x8]
	strh r0, [r1]
	movs r0, 0x1
	b _0810B716
	.align 2, 0
_0810B708: .4byte gUnknown_0203923C
_0810B70C: .4byte gMapObjects
_0810B710: .4byte gScriptLastTalked
_0810B714:
	movs r0, 0
_0810B716:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end npc_before_player_of_type

	thumb_func_start oei_task_add
oei_task_add: @ 810B71C
	push {lr}
	ldr r0, _0810B738 @ =gUnknown_0203923C
	adds r1, r0, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	ldr r0, _0810B73C @ =task08_080C9820
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810B738: .4byte gUnknown_0203923C
_0810B73C: .4byte task08_080C9820
	thumb_func_end oei_task_add

	thumb_func_start task08_080C9820
task08_080C9820: @ 810B740
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	bl ScriptContext2_Enable
	ldr r1, _0810B794 @ =gPlayerAvatar
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrb r1, [r1, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B798 @ =gMapObjects
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0810B776
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0810B7C2
_0810B776:
	ldr r0, _0810B79C @ =gMapHeader
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _0810B7A8
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _0810B7A0 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B7A4 @ =sub_810B428
	b _0810B7C0
	.align 2, 0
_0810B794: .4byte gPlayerAvatar
_0810B798: .4byte gMapObjects
_0810B79C: .4byte gMapHeader
_0810B7A0: .4byte gTasks
_0810B7A4: .4byte sub_810B428
_0810B7A8:
	bl sub_8059BF4
	adds r0, r4, 0
	movs r1, 0x39
	bl FieldObjectSetSpecialAnim
	ldr r0, _0810B7C8 @ =gTasks
	lsls r1, r6, 2
	adds r1, r6
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B7CC @ =sub_810B3DC
_0810B7C0:
	str r0, [r1]
_0810B7C2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810B7C8: .4byte gTasks
_0810B7CC: .4byte sub_810B3DC
	thumb_func_end task08_080C9820

	thumb_func_start sub_810B3DC
sub_810B3DC: @ 810B7D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810B80C @ =gPlayerAvatar
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B810 @ =gMapObjects
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810B804
	movs r0, 0x3B
	bl FieldEffectStart
	ldr r0, _0810B814 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810B818 @ =sub_810B428
	str r0, [r1]
_0810B804:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B80C: .4byte gPlayerAvatar
_0810B810: .4byte gMapObjects
_0810B814: .4byte gTasks
_0810B818: .4byte sub_810B428
	thumb_func_end sub_810B3DC

	thumb_func_start sub_810B428
sub_810B428: @ 810B81C
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r7, r0, 24
	movs r0, 0x6
	bl FieldEffectActiveListContains
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _0810B8A0
	bl player_get_direction_lower_nybble
	ldr r6, _0810B8A8 @ =gUnknown_0202FF84
	lsls r0, 24
	lsrs r0, 24
	str r0, [r6, 0x4]
	cmp r0, 0x1
	bne _0810B842
	str r4, [r6, 0x8]
_0810B842:
	ldr r1, [r6, 0x4]
	cmp r1, 0x2
	bne _0810B84C
	movs r0, 0x1
	str r0, [r6, 0x8]
_0810B84C:
	cmp r1, 0x3
	bne _0810B854
	movs r0, 0x2
	str r0, [r6, 0x8]
_0810B854:
	cmp r1, 0x4
	bne _0810B85C
	movs r0, 0x3
	str r0, [r6, 0x8]
_0810B85C:
	ldr r5, _0810B8AC @ =gPlayerAvatar
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0810B8B0 @ =gMapObjects
	adds r4, r0
	bl GetPlayerAvatarGraphicsIdByCurrentState
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0810B8B4 @ =gSprites
	adds r0, r1
	ldrb r1, [r6, 0x8]
	bl StartSpriteAnim
	movs r0, 0x6
	bl FieldEffectActiveListRemove
	ldr r1, _0810B8B8 @ =gTasks
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810B8BC @ =sub_810B4CC
	str r1, [r0]
_0810B8A0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810B8A8: .4byte gUnknown_0202FF84
_0810B8AC: .4byte gPlayerAvatar
_0810B8B0: .4byte gMapObjects
_0810B8B4: .4byte gSprites
_0810B8B8: .4byte gTasks
_0810B8BC: .4byte sub_810B4CC
	thumb_func_end sub_810B428

	thumb_func_start sub_810B4CC
sub_810B4CC: @ 810B8C0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0810B8F0 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldrh r1, [r0, 0x18]
	lsls r1, 16
	ldrh r0, [r0, 0x1A]
	orrs r1, r0
	bl _call_via_r1
	ldr r1, _0810B8F4 @ =gPlayerAvatar
	movs r0, 0
	strb r0, [r1, 0x6]
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810B8F0: .4byte gTasks
_0810B8F4: .4byte gPlayerAvatar
	thumb_func_end sub_810B4CC

	thumb_func_start SetUpFieldMove_RockSmash
SetUpFieldMove_RockSmash: @ 810B8F8
	push {lr}
	movs r0, 0x56
	bl npc_before_player_of_type
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B90C
	movs r0, 0
	b _0810B91A
_0810B90C:
	ldr r1, _0810B920 @ =gUnknown_0300485C
	ldr r0, _0810B924 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0810B928 @ =gUnknown_03005CE4
	ldr r0, _0810B92C @ =sub_810B53C
	str r0, [r1]
	movs r0, 0x1
_0810B91A:
	pop {r1}
	bx r1
	.align 2, 0
_0810B920: .4byte gUnknown_0300485C
_0810B924: .4byte sub_808AB90
_0810B928: .4byte gUnknown_03005CE4
_0810B92C: .4byte sub_810B53C
	thumb_func_end SetUpFieldMove_RockSmash

	thumb_func_start sub_810B53C
sub_810B53C: @ 810B930
	push {lr}
	ldr r1, _0810B944 @ =gUnknown_0202FF84
	ldr r0, _0810B948 @ =gUnknown_03005CE0
	ldrb r0, [r0]
	str r0, [r1]
	ldr r0, _0810B94C @ =UseRockSmashScript
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0810B944: .4byte gUnknown_0202FF84
_0810B948: .4byte gUnknown_03005CE0
_0810B94C: .4byte UseRockSmashScript
	thumb_func_end sub_810B53C

	thumb_func_start FldEff_RockSmash
FldEff_RockSmash: @ 810B950
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810B978 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810B97C @ =sub_810B58C
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	movs r0, 0x13
	bl sav12_xor_increment
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810B978: .4byte gTasks
_0810B97C: .4byte sub_810B58C
	thumb_func_end FldEff_RockSmash

	thumb_func_start sub_810B58C
sub_810B58C: @ 810B980
	push {lr}
	movs r0, 0x83
	bl PlaySE
	movs r0, 0x25
	bl FieldEffectActiveListRemove
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810B58C

	thumb_func_start SetUpFieldMove_Dig
SetUpFieldMove_Dig: @ 810B998
	push {lr}
	bl sub_80CA1C8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810B9AA
	movs r0, 0
	b _0810B9B8
_0810B9AA:
	ldr r1, _0810B9BC @ =gUnknown_0300485C
	ldr r0, _0810B9C0 @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0810B9C4 @ =gUnknown_03005CE4
	ldr r0, _0810B9C8 @ =sub_810B5D8
	str r0, [r1]
	movs r0, 0x1
_0810B9B8:
	pop {r1}
	bx r1
	.align 2, 0
_0810B9BC: .4byte gUnknown_0300485C
_0810B9C0: .4byte sub_808AB90
_0810B9C4: .4byte gUnknown_03005CE4
_0810B9C8: .4byte sub_810B5D8
	thumb_func_end SetUpFieldMove_Dig

	thumb_func_start sub_810B5D8
sub_810B5D8: @ 810B9CC
	push {lr}
	bl sub_8053014
	movs r0, 0x26
	bl FieldEffectStart
	ldr r0, _0810B9E4 @ =gUnknown_0202FF84
	ldr r1, _0810B9E8 @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810B9E4: .4byte gUnknown_0202FF84
_0810B9E8: .4byte gUnknown_03005CE0
	thumb_func_end sub_810B5D8

	thumb_func_start FldEff_UseDig
FldEff_UseDig: @ 810B9EC
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810BA20 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810BA24 @ =sub_810B634
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	bl sub_81473B8
	lsls r0, 24
	cmp r0, 0
	bne _0810BA18
	movs r0, 0x1
	bl SetPlayerAvatarTransitionFlags
_0810BA18:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810BA20: .4byte gTasks
_0810BA24: .4byte sub_810B634
	thumb_func_end FldEff_UseDig

	thumb_func_start sub_810B634
sub_810B634: @ 810BA28
	push {r4,lr}
	movs r0, 0x26
	bl FieldEffectActiveListRemove
	bl sub_81473B8
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0810BA42
	bl sub_8147408
	b _0810BA5A
_0810BA42:
	ldr r0, _0810BA60 @ =task08_080A1C44
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810BA64 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_0810BA5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810BA60: .4byte task08_080A1C44
_0810BA64: .4byte gTasks
	thumb_func_end sub_810B634

	thumb_func_start sub_810B674
sub_810B674: @ 810BA68
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_810B674

	thumb_func_start sub_810B68C
sub_810B68C: @ 810BA80
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r1, _0810BAA4 @ =0x020221cc
	ldr r2, _0810BAA8 @ =0x06007800
	ldr r0, _0810BAAC @ =0x040000d4
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0810BAB0 @ =0x80000400
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0810BAA4: .4byte 0x020221cc
_0810BAA8: .4byte 0x06007800
_0810BAAC: .4byte 0x040000d4
_0810BAB0: .4byte 0x80000400
	thumb_func_end sub_810B68C

	thumb_func_start sub_810B6C0
sub_810B6C0: @ 810BAB4
	push {r4,lr}
	sub sp, 0x4
	ldr r0, _0810BAD0 @ =gMain
	ldr r1, _0810BAD4 @ =0x0000043c
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x12
	bls _0810BAC6
	b _0810BD54
_0810BAC6:
	lsls r0, 2
	ldr r1, _0810BAD8 @ =_0810BADC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810BAD0: .4byte gMain
_0810BAD4: .4byte 0x0000043c
_0810BAD8: .4byte _0810BADC
	.align 2, 0
_0810BADC:
	.4byte _0810BB28
	.4byte _0810BB58
	.4byte _0810BB5E
	.4byte _0810BB80
	.4byte _0810BB86
	.4byte _0810BBA8
	.4byte _0810BBB4
	.4byte _0810BBD0
	.4byte _0810BBDC
	.4byte _0810BBF8
	.4byte _0810BC04
	.4byte _0810BC24
	.4byte _0810BC40
	.4byte _0810BC5E
	.4byte _0810BC88
	.4byte _0810BC92
	.4byte _0810BCB8
	.4byte _0810BD08
	.4byte _0810BD28
_0810BB28:
	bl sub_80F9438
	bl sub_80F9368
	ldr r1, _0810BB48 @ =0x0400000c
	ldr r2, _0810BB4C @ =0x00000f0a
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x44
	movs r0, 0
	strh r0, [r1]
	ldr r1, _0810BB50 @ =gMain
	ldr r0, _0810BB54 @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BB48: .4byte 0x0400000c
_0810BB4C: .4byte 0x00000f0a
_0810BB50: .4byte gMain
_0810BB54: .4byte 0x0000043c
_0810BB58:
	bl remove_some_task
	b _0810BD10
_0810BB5E:
	bl ResetPaletteFade
	ldr r2, _0810BB74 @ =gPaletteFade
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _0810BB78 @ =gMain
	ldr r0, _0810BB7C @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BB74: .4byte gPaletteFade
_0810BB78: .4byte gMain
_0810BB7C: .4byte 0x0000043c
_0810BB80:
	bl ResetSpriteData
	b _0810BD10
_0810BB86:
	ldr r0, _0810BB9C @ =gUnknown_02039244
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _0810BB92
	bl ResetTasks
_0810BB92:
	ldr r1, _0810BBA0 @ =gMain
	ldr r0, _0810BBA4 @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BB9C: .4byte gUnknown_02039244
_0810BBA0: .4byte gMain
_0810BBA4: .4byte 0x0000043c
_0810BBA8:
	ldr r0, _0810BBB0 @ =gWindowConfig_81E6E34
	bl SetUpWindowConfig
	b _0810BD10
	.align 2, 0
_0810BBB0: .4byte gWindowConfig_81E6E34
_0810BBB4:
	ldr r0, _0810BBC4 @ =gWindowConfig_81E6E50
	bl SetUpWindowConfig
	ldr r1, _0810BBC8 @ =gMain
	ldr r0, _0810BBCC @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BBC4: .4byte gWindowConfig_81E6E50
_0810BBC8: .4byte gMain
_0810BBCC: .4byte 0x0000043c
_0810BBD0:
	ldr r0, _0810BBD8 @ =gWindowConfig_81E6E34
	bl MultistepInitMenuWindowBegin
	b _0810BD10
	.align 2, 0
_0810BBD8: .4byte gWindowConfig_81E6E34
_0810BBDC:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0810BBE6
	b _0810BD54
_0810BBE6:
	ldr r1, _0810BBF0 @ =gMain
	ldr r0, _0810BBF4 @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BBF0: .4byte gMain
_0810BBF4: .4byte 0x0000043c
_0810BBF8:
	ldr r0, _0810BC00 @ =gWindowConfig_81E6E50
	bl MultistepInitMenuWindowBegin
	b _0810BD10
	.align 2, 0
_0810BC00: .4byte gWindowConfig_81E6E50
_0810BC04:
	bl MultistepInitMenuWindowContinue
	cmp r0, 0
	bne _0810BC0E
	b _0810BD54
_0810BC0E:
	ldr r0, _0810BC1C @ =0x02000000
	ldr r1, _0810BC20 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	b _0810BD10
	.align 2, 0
_0810BC1C: .4byte 0x02000000
_0810BC20: .4byte 0x0001ffff
_0810BC24:
	bl sub_810B998
	lsls r0, 24
	cmp r0, 0
	bne _0810BC30
	b _0810BD54
_0810BC30:
	ldr r1, _0810BC38 @ =gMain
	ldr r0, _0810BC3C @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BC38: .4byte gMain
_0810BC3C: .4byte 0x0000043c
_0810BC40:
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	movs r0, 0
	movs r1, 0xB0
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
	movs r0, 0x1
	movs r1, 0xB0
	movs r2, 0x98
	bl CreateVerticalScrollIndicators
	b _0810BD10
_0810BC5E:
	movs r0, 0x38
	movs r1, 0x40
	movs r2, 0
	bl sub_810BA50
	ldr r1, _0810BC78 @ =0x02000000
	ldr r2, _0810BC7C @ =0x0001fffe
	adds r1, r2
	strb r0, [r1]
	ldr r1, _0810BC80 @ =gMain
	ldr r0, _0810BC84 @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BC78: .4byte 0x02000000
_0810BC7C: .4byte 0x0001fffe
_0810BC80: .4byte gMain
_0810BC84: .4byte 0x0000043c
_0810BC88:
	bl sub_810BC98
	bl sub_810BD08
	b _0810BD10
_0810BC92:
	bl sub_810BB0C
	bl sub_810BB30
	ldr r0, _0810BCAC @ =gUnknown_02039248
	ldrb r0, [r0, 0x1]
	bl sub_810BC84
	ldr r1, _0810BCB0 @ =gMain
	ldr r0, _0810BCB4 @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BCAC: .4byte gUnknown_02039248
_0810BCB0: .4byte gMain
_0810BCB4: .4byte 0x0000043c
_0810BCB8:
	ldr r3, _0810BCF0 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _0810BCF4 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r2, _0810BCF8 @ =0x04000004
	ldrh r0, [r2]
	movs r1, 0x8
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0810BCFC @ =sub_810B68C
	bl SetVBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xBA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r1, _0810BD00 @ =gMain
	ldr r0, _0810BD04 @ =0x0000043c
	adds r1, r0
	b _0810BD16
	.align 2, 0
_0810BCF0: .4byte 0x04000208
_0810BCF4: .4byte 0x04000200
_0810BCF8: .4byte 0x04000004
_0810BCFC: .4byte sub_810B68C
_0810BD00: .4byte gMain
_0810BD04: .4byte 0x0000043c
_0810BD08:
	bl sub_8055870
	cmp r0, 0x1
	beq _0810BD54
_0810BD10:
	ldr r1, _0810BD20 @ =gMain
	ldr r2, _0810BD24 @ =0x0000043c
	adds r1, r2
_0810BD16:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0810BD54
	.align 2, 0
_0810BD20: .4byte gMain
_0810BD24: .4byte 0x0000043c
_0810BD28:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0810BD4C @ =gPaletteFade
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _0810BD50 @ =sub_810B674
	bl SetMainCallback2
	movs r0, 0x1
	b _0810BD56
	.align 2, 0
_0810BD4C: .4byte gPaletteFade
_0810BD50: .4byte sub_810B674
_0810BD54:
	movs r0, 0
_0810BD56:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810B6C0

	thumb_func_start sub_810B96C
sub_810B96C: @ 810BD60
	push {lr}
_0810BD62:
	bl sub_810B6C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810BD7C
	ldr r0, _0810BD78 @ =sub_810BF7C
	movs r1, 0
	bl CreateTask
	b _0810BD88
	.align 2, 0
_0810BD78: .4byte sub_810BF7C
_0810BD7C:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0810BD62
_0810BD88:
	pop {r0}
	bx r0
	thumb_func_end sub_810B96C

	thumb_func_start sub_810B998
sub_810B998: @ 810BD8C
	push {lr}
	ldr r0, _0810BDA4 @ =0x02000000
	ldr r1, _0810BDA8 @ =0x0001ffff
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810BE3C
	lsls r0, 2
	ldr r1, _0810BDAC @ =_0810BDB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810BDA4: .4byte 0x02000000
_0810BDA8: .4byte 0x0001ffff
_0810BDAC: .4byte _0810BDB0
	.align 2, 0
_0810BDB0:
	.4byte _0810BDC4
	.4byte _0810BDD8
	.4byte _0810BDEC
	.4byte _0810BDFC
	.4byte _0810BE1C
_0810BDC4:
	ldr r0, _0810BDD0 @ =gMenuPokeblock_Gfx
	ldr r1, _0810BDD4 @ =0x06008000
	bl LZDecompressVram
	b _0810BE02
	.align 2, 0
_0810BDD0: .4byte gMenuPokeblock_Gfx
_0810BDD4: .4byte 0x06008000
_0810BDD8:
	ldr r0, _0810BDE4 @ =gMenuPokeblock_Tilemap
	ldr r1, _0810BDE8 @ =0x020221cc
	bl sub_800D238
	b _0810BE02
	.align 2, 0
_0810BDE4: .4byte gMenuPokeblock_Tilemap
_0810BDE8: .4byte 0x020221cc
_0810BDEC:
	ldr r0, _0810BDF8 @ =gMenuPokeblock_Pal
	movs r1, 0
	movs r2, 0xC0
	bl LoadCompressedPalette
	b _0810BE02
	.align 2, 0
_0810BDF8: .4byte gMenuPokeblock_Pal
_0810BDFC:
	ldr r0, _0810BE10 @ =gUnknown_083F7F74
	bl LoadCompressedObjectPic
_0810BE02:
	ldr r1, _0810BE14 @ =0x02000000
	ldr r0, _0810BE18 @ =0x0001ffff
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0810BE3C
	.align 2, 0
_0810BE10: .4byte gUnknown_083F7F74
_0810BE14: .4byte 0x02000000
_0810BE18: .4byte 0x0001ffff
_0810BE1C:
	ldr r0, _0810BE30 @ =gUnknown_083F7F7C
	bl LoadCompressedObjectPalette
	ldr r0, _0810BE34 @ =0x02000000
	ldr r1, _0810BE38 @ =0x0001ffff
	adds r0, r1
	movs r1, 0
	strb r1, [r0]
	movs r0, 0x1
	b _0810BE3E
	.align 2, 0
_0810BE30: .4byte gUnknown_083F7F7C
_0810BE34: .4byte 0x02000000
_0810BE38: .4byte 0x0001ffff
_0810BE3C:
	movs r0, 0
_0810BE3E:
	pop {r1}
	bx r1
	thumb_func_end sub_810B998

	thumb_func_start sub_810BA50
sub_810BA50: @ 810BE44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _0810BE6C @ =gSpriteTemplate_83F7F84
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810BE6C: .4byte gSpriteTemplate_83F7F84
	thumb_func_end sub_810BA50

	thumb_func_start sub_810BA7C
sub_810BA7C: @ 810BE70
	push {lr}
	ldr r1, _0810BE8C @ =gUnknown_02039244
	strb r0, [r1]
	ldrb r2, [r1]
	cmp r2, 0x2
	beq _0810BE9C
	cmp r2, 0x3
	beq _0810BEB4
	ldr r1, _0810BE90 @ =gUnknown_03000758
	ldr r0, _0810BE94 @ =gUnknown_083F7F1C
	str r0, [r1]
	ldr r1, _0810BE98 @ =gUnknown_0203924C
	movs r0, 0x3
	b _0810BEBE
	.align 2, 0
_0810BE8C: .4byte gUnknown_02039244
_0810BE90: .4byte gUnknown_03000758
_0810BE94: .4byte gUnknown_083F7F1C
_0810BE98: .4byte gUnknown_0203924C
_0810BE9C:
	ldr r0, _0810BEA8 @ =gUnknown_03000758
	ldr r1, _0810BEAC @ =gUnknown_083F7F1F
	str r1, [r0]
	ldr r0, _0810BEB0 @ =gUnknown_0203924C
	strb r2, [r0]
	b _0810BEC0
	.align 2, 0
_0810BEA8: .4byte gUnknown_03000758
_0810BEAC: .4byte gUnknown_083F7F1F
_0810BEB0: .4byte gUnknown_0203924C
_0810BEB4:
	ldr r1, _0810BEC4 @ =gUnknown_03000758
	ldr r0, _0810BEC8 @ =gUnknown_083F7F21
	str r0, [r1]
	ldr r1, _0810BECC @ =gUnknown_0203924C
	movs r0, 0x2
_0810BEBE:
	strb r0, [r1]
_0810BEC0:
	pop {r0}
	bx r0
	.align 2, 0
_0810BEC4: .4byte gUnknown_03000758
_0810BEC8: .4byte gUnknown_083F7F21
_0810BECC: .4byte gUnknown_0203924C
	thumb_func_end sub_810BA7C

	thumb_func_start sub_810BADC
sub_810BADC: @ 810BED0
	push {lr}
	movs r0, 0x2
	bl sub_810BA7C
	ldr r0, _0810BEE4 @ =sub_810B96C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810BEE4: .4byte sub_810B96C
	thumb_func_end sub_810BADC

	thumb_func_start sub_810BAF4
sub_810BAF4: @ 810BEE8
	push {lr}
	movs r0, 0x3
	bl sub_810BA7C
	ldr r0, _0810BEFC @ =sub_810B96C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810BEFC: .4byte sub_810B96C
	thumb_func_end sub_810BAF4

	thumb_func_start sub_810BB0C
sub_810BB0C: @ 810BF00
	push {lr}
	ldr r0, _0810BF1C @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810BF20 @ =0x00000111
	bl ItemId_GetItem
	movs r1, 0x2
	movs r2, 0x1
	movs r3, 0x48
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_0810BF1C: .4byte gWindowConfig_81E6E34
_0810BF20: .4byte 0x00000111
	thumb_func_end sub_810BB0C

	thumb_func_start sub_810BB30
sub_810BB30: @ 810BF24
	push {lr}
	ldr r0, _0810BF64 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810BF68 @ =gContestStatsText_Spicy
	movs r1, 0x2
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0810BF6C @ =gContestStatsText_Dry
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	ldr r0, _0810BF70 @ =gContestStatsText_Sweet
	movs r1, 0x2
	movs r2, 0x11
	bl MenuPrint
	ldr r0, _0810BF74 @ =gContestStatsText_Bitter
	movs r1, 0x8
	movs r2, 0xD
	bl MenuPrint
	ldr r0, _0810BF78 @ =gContestStatsText_Sour
	movs r1, 0x8
	movs r2, 0xF
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_0810BF64: .4byte gWindowConfig_81E6E34
_0810BF68: .4byte gContestStatsText_Spicy
_0810BF6C: .4byte gContestStatsText_Dry
_0810BF70: .4byte gContestStatsText_Sweet
_0810BF74: .4byte gContestStatsText_Bitter
_0810BF78: .4byte gContestStatsText_Sour
	thumb_func_end sub_810BB30

	thumb_func_start sub_810BB88
sub_810BB88: @ 810BF7C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0810BFE8 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	mov r6, r8
	adds r0, r6, 0
	adds r0, 0x8
	cmp r6, r0
	bgt _0810C060
	ldr r0, _0810BFEC @ =gStringVar1
	mov r9, r0
	ldr r1, _0810BFF0 @ =gSaveBlock1
	mov r10, r1
_0810BFA4:
	mov r1, r8
	subs r0, r6, r1
	lsls r0, 25
	lsrs r7, r0, 24
	ldr r0, _0810BFF4 @ =gUnknown_02039248
	ldrb r0, [r0, 0x2]
	cmp r6, r0
	bne _0810BFFC
	mov r0, r9
	ldr r1, _0810BFF8 @ =gContestStatsText_StowCase
	movs r2, 0x78
	movs r3, 0
	bl sub_8072C74
	movs r2, 0x1
	orrs r2, r7
	mov r0, r9
	movs r1, 0xF
	bl MenuPrint
	mov r0, r8
	adds r0, 0x8
	cmp r6, r0
	beq _0810C060
	adds r1, r7, 0x3
	lsls r1, 24
	lsrs r1, 24
	movs r0, 0xF
	movs r2, 0x1D
	movs r3, 0x12
	bl MenuZeroFillWindowRect
	b _0810C060
	.align 2, 0
_0810BFE8: .4byte gWindowConfig_81E6E34
_0810BFEC: .4byte gStringVar1
_0810BFF0: .4byte gSaveBlock1
_0810BFF4: .4byte gUnknown_02039248
_0810BFF8: .4byte gContestStatsText_StowCase
_0810BFFC:
	lsls r5, r6, 3
	mov r1, r10
	adds r0, r5, r1
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 2
	ldr r1, _0810C070 @ =gPokeblockNames
	adds r0, r1
	ldr r1, [r0]
	mov r0, r9
	movs r2, 0x5E
	movs r3, 0
	bl sub_8072C74
	adds r4, r0, 0
	movs r0, 0xFC
	strb r0, [r4]
	movs r0, 0x14
	strb r0, [r4, 0x1]
	movs r0, 0x6
	strb r0, [r4, 0x2]
	adds r4, 0x3
	ldr r0, _0810C074 @ =0x02025f2c
	adds r5, r0
	adds r0, r5, 0
	bl sub_810C9B0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x3
	bl ConvertIntToDecimalStringN
	movs r2, 0x1
	orrs r2, r7
	mov r0, r9
	movs r1, 0xF
	bl MenuPrint
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r0, 0x8
	cmp r6, r0
	ble _0810BFA4
_0810C060:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C070: .4byte gPokeblockNames
_0810C074: .4byte 0x02025f2c
	thumb_func_end sub_810BB88

	thumb_func_start sub_810BC84
sub_810BC84: @ 810C078
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_810BB88
	movs r0, 0
	bl sub_810BDAC
	pop {r0}
	bx r0
	thumb_func_end sub_810BC84

	thumb_func_start sub_810BC98
sub_810BC98: @ 810C08C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	movs r2, 0
	ldr r0, _0810C0F4 @ =gSaveBlock1
	mov r9, r0
_0810C09A:
	adds r1, r2, 0x1
	lsls r0, r1, 16
	lsrs r5, r0, 16
	mov r8, r1
	cmp r5, 0x27
	bhi _0810C0DC
	lsls r1, r2, 3
	mov r2, r9
	adds r0, r1, r2
	movs r2, 0xFF
	lsls r2, 3
	adds r7, r0, r2
	ldr r0, _0810C0F8 @ =0x02025f2c
	mov r12, r0
	adds r6, r1, r0
_0810C0B8:
	ldrb r0, [r7]
	cmp r0, 0
	bne _0810C0D2
	ldr r3, [r6]
	ldr r4, [r6, 0x4]
	lsls r2, r5, 3
	add r2, r12
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
	str r3, [r2]
	str r4, [r2, 0x4]
_0810C0D2:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0x27
	bls _0810C0B8
_0810C0DC:
	mov r1, r8
	lsls r0, r1, 16
	lsrs r2, r0, 16
	cmp r2, 0x26
	bls _0810C09A
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C0F4: .4byte gSaveBlock1
_0810C0F8: .4byte 0x02025f2c
	thumb_func_end sub_810BC98

	thumb_func_start sub_810BD08
sub_810BD08: @ 810C0FC
	push {r4,r5,lr}
	ldr r1, _0810C150 @ =gUnknown_02039248
	movs r0, 0
	strb r0, [r1, 0x2]
	movs r2, 0
	ldr r5, _0810C154 @ =gSaveBlock1
	movs r4, 0xFF
	lsls r4, 3
	adds r3, r1, 0
_0810C10E:
	lsls r0, r2, 3
	adds r0, r5
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810C120
	ldrb r0, [r3, 0x2]
	adds r0, 0x1
	strb r0, [r3, 0x2]
_0810C120:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x27
	bls _0810C10E
	ldrb r0, [r1, 0x2]
	cmp r0, 0x7
	bls _0810C132
	movs r0, 0x8
_0810C132:
	strb r0, [r1, 0x3]
	ldrb r2, [r1, 0x1]
	adds r0, r2, 0
	adds r0, 0x8
	ldrb r3, [r1, 0x2]
	cmp r0, r3
	ble _0810C148
	cmp r2, 0
	beq _0810C148
	subs r0, r2, 0x1
	strb r0, [r1, 0x1]
_0810C148:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C150: .4byte gUnknown_02039248
_0810C154: .4byte gSaveBlock1
	thumb_func_end sub_810BD08

	thumb_func_start sub_810BD64
sub_810BD64: @ 810C158
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	movs r2, 0
	ldr r5, _0810C198 @ =gUnknown_02039248
	ldr r4, _0810C19C @ =0x020221cc
_0810C164:
	ldrb r0, [r5]
	lsls r0, 1
	adds r0, 0x1
	lsls r0, 5
	adds r1, r2, 0
	adds r1, 0xF
	adds r0, r1
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
	ldrb r0, [r5]
	lsls r0, 6
	adds r0, 0x40
	adds r0, r1
	lsls r0, 1
	adds r0, r4
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xD
	bls _0810C164
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C198: .4byte gUnknown_02039248
_0810C19C: .4byte 0x020221cc
	thumb_func_end sub_810BD64

	thumb_func_start sub_810BDAC
sub_810BDAC: @ 810C1A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	cmp r0, 0
	bne _0810C1C0
	ldr r0, _0810C1B8 @ =0x00001005
	ldr r1, _0810C1BC @ =0x00001014
	bl sub_810BD64
	b _0810C1C8
	.align 2, 0
_0810C1B8: .4byte 0x00001005
_0810C1BC: .4byte 0x00001014
_0810C1C0:
	ldr r0, _0810C1DC @ =0x00002005
	ldr r1, _0810C1E0 @ =0x00002014
	bl sub_810BD64
_0810C1C8:
	ldr r0, _0810C1E4 @ =gUnknown_02039248
	ldrb r0, [r0, 0x1]
	cmp r0, 0
	beq _0810C1E8
	movs r0, 0
	movs r1, 0
	bl sub_80F979C
	b _0810C1F0
	.align 2, 0
_0810C1DC: .4byte 0x00002005
_0810C1E0: .4byte 0x00002014
_0810C1E4: .4byte gUnknown_02039248
_0810C1E8:
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
_0810C1F0:
	ldr r2, _0810C210 @ =gUnknown_02039248
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bls _0810C214
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _0810C214
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
	b _0810C21C
	.align 2, 0
_0810C210: .4byte gUnknown_02039248
_0810C214:
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
_0810C21C:
	movs r6, 0
	ldr r7, _0810C288 @ =0x020221cc
	movs r0, 0xF
	mov r8, r0
_0810C224:
	adds r0, r6, 0
	movs r1, 0x3
	bl __umodsi3
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 18
	ldr r1, _0810C28C @ =0x000001a1
	adds r4, r1
	adds r0, r6, 0
	movs r1, 0x3
	bl __udivsi3
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 1
	adds r5, r4, r1
	ldr r1, _0810C290 @ =gUnknown_02039248
	ldrb r2, [r1]
	ldrb r0, [r1, 0x1]
	adds r0, r2, r0
	ldrb r1, [r1, 0x2]
	cmp r0, r1
	beq _0810C2AC
	lsls r0, 3
	ldr r1, _0810C294 @ =0x02025f2c
	adds r0, r1
	adds r4, r6, 0x1
	lsls r1, r4, 24
	lsrs r1, 24
	bl sub_810CA9C
	lsls r0, 16
	cmp r0, 0
	ble _0810C298
	lsls r1, r5, 1
	adds r1, r7
	lsls r2, r6, 12
	adds r0, r2, 0
	adds r0, 0x17
	strh r0, [r1]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	adds r2, 0x18
	strh r2, [r0]
	b _0810C2C0
	.align 2, 0
_0810C288: .4byte 0x020221cc
_0810C28C: .4byte 0x000001a1
_0810C290: .4byte gUnknown_02039248
_0810C294: .4byte 0x02025f2c
_0810C298:
	lsls r0, r5, 1
	adds r0, r7
	mov r1, r8
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	b _0810C2C0
_0810C2AC:
	lsls r0, r5, 1
	adds r0, r7
	mov r1, r8
	strh r1, [r0]
	adds r0, r5, 0
	adds r0, 0x20
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	adds r4, r6, 0x1
_0810C2C0:
	lsls r0, r4, 24
	lsrs r6, r0, 24
	cmp r6, 0x4
	bls _0810C224
	ldr r0, _0810C304 @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810C308 @ =gUnknown_02039248
	ldrb r2, [r0]
	ldrb r1, [r0, 0x1]
	adds r2, r1
	ldrb r0, [r0, 0x2]
	cmp r2, r0
	beq _0810C314
	ldr r4, _0810C30C @ =gStringVar1
	lsls r0, r2, 3
	ldr r1, _0810C310 @ =0x02025f2c
	adds r0, r1
	bl sub_810C9E8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	movs r2, 0x10
	movs r3, 0x1
	bl sub_8072C14
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0x11
	bl MenuPrint
	b _0810C320
	.align 2, 0
_0810C304: .4byte gWindowConfig_81E6E34
_0810C308: .4byte gUnknown_02039248
_0810C30C: .4byte gStringVar1
_0810C310: .4byte 0x02025f2c
_0810C314:
	movs r0, 0xB
	movs r1, 0x11
	movs r2, 0xC
	movs r3, 0x12
	bl MenuZeroFillWindowRect
_0810C320:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810BDAC

	thumb_func_start sub_810BF38
sub_810BF38: @ 810C32C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x5
	bl PlaySE
	ldr r2, _0810C360 @ =gSprites
	ldr r0, _0810C364 @ =0x02000000
	ldr r1, _0810C368 @ =0x0001fffe
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, 0x1C
	adds r0, r2
	ldr r1, _0810C36C @ =sub_810C8D4
	str r1, [r0]
	adds r0, r4, 0
	bl sub_810BDAC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C360: .4byte gSprites
_0810C364: .4byte 0x02000000
_0810C368: .4byte 0x0001fffe
_0810C36C: .4byte sub_810C8D4
	thumb_func_end sub_810BF38

	thumb_func_start sub_810BF7C
sub_810BF7C: @ 810C370
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r0, _0810C3AC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r3, 0x80
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0810C388
	b _0810C4AC
_0810C388:
	ldr r2, _0810C3B0 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810C3C2
	ldr r4, _0810C3B4 @ =gUnknown_02039248
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810C3B8
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	b _0810C3FE
	.align 2, 0
_0810C3AC: .4byte gPaletteFade
_0810C3B0: .4byte gMain
_0810C3B4: .4byte gUnknown_02039248
_0810C3B8:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0810C4AC
	subs r0, 0x1
	b _0810C3F6
_0810C3C2:
	adds r0, r3, 0
	ands r0, r1
	cmp r0, 0
	beq _0810C406
	ldr r4, _0810C3E4 @ =gUnknown_02039248
	ldrb r0, [r4]
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0810C3E8
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0810C3FE
	.align 2, 0
_0810C3E4: .4byte gUnknown_02039248
_0810C3E8:
	ldrb r1, [r4, 0x1]
	ldrb r0, [r4]
	adds r0, r1, r0
	ldrb r2, [r4, 0x2]
	cmp r0, r2
	beq _0810C4AC
	adds r0, r1, 0x1
_0810C3F6:
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	bl sub_810BB88
_0810C3FE:
	movs r0, 0
	bl sub_810BF38
	b _0810C4AC
_0810C406:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0810C450
	ldr r4, _0810C444 @ =gUnknown_02039248
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	adds r0, r1
	ldrb r1, [r4, 0x2]
	cmp r0, r1
	beq _0810C4AC
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl sub_810BDAC
	ldr r1, _0810C448 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r4, 0x1]
	ldrb r2, [r4]
	adds r1, r2
	strh r1, [r0, 0x8]
	ldr r1, _0810C44C @ =sub_810C0C8
	str r1, [r0]
	b _0810C4AC
	.align 2, 0
_0810C444: .4byte gUnknown_02039248
_0810C448: .4byte gTasks
_0810C44C: .4byte sub_810C0C8
_0810C450:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810C490
	movs r0, 0x5
	bl PlaySE
	ldr r0, _0810C47C @ =gUnknown_02039248
	ldrb r1, [r0, 0x1]
	ldrb r2, [r0]
	adds r1, r2
	ldrb r0, [r0, 0x2]
	cmp r1, r0
	bne _0810C488
	ldr r1, _0810C480 @ =gScriptResult
	ldr r2, _0810C484 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r5, 0
	bl sub_810C31C
	b _0810C4AC
	.align 2, 0
_0810C47C: .4byte gUnknown_02039248
_0810C480: .4byte gScriptResult
_0810C484: .4byte 0x0000ffff
_0810C488:
	adds r0, r5, 0
	bl sub_810C368
	b _0810C4AC
_0810C490:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C4AC
	movs r0, 0x5
	bl PlaySE
	ldr r1, _0810C4B4 @ =gScriptResult
	ldr r2, _0810C4B8 @ =0x0000ffff
	adds r0, r2, 0
	strh r0, [r1]
	adds r0, r4, 0
	bl sub_810C31C
_0810C4AC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C4B4: .4byte gScriptResult
_0810C4B8: .4byte 0x0000ffff
	thumb_func_end sub_810BF7C

	thumb_func_start sub_810C0C8
sub_810C0C8: @ 810C4BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _0810C4E8 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810C504
	ldr r4, _0810C4EC @ =gUnknown_02039248
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810C4F0
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	subs r0, 0x1
	strb r0, [r4]
	b _0810C54C
	.align 2, 0
_0810C4E8: .4byte gMain
_0810C4EC: .4byte gUnknown_02039248
_0810C4F0:
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0810C5AE
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	ldrb r0, [r4, 0x1]
	subs r0, 0x1
	b _0810C544
_0810C504:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810C55C
	ldr r4, _0810C528 @ =gUnknown_02039248
	ldrb r0, [r4]
	ldrb r1, [r4, 0x3]
	cmp r0, r1
	beq _0810C52C
	movs r0, 0x5
	movs r1, 0x14
	bl sub_810BD64
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _0810C54C
	.align 2, 0
_0810C528: .4byte gUnknown_02039248
_0810C52C:
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4]
	adds r0, r1
	ldrb r1, [r4, 0x2]
	cmp r0, r1
	beq _0810C5AE
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	ldrb r0, [r4, 0x1]
	adds r0, 0x1
_0810C544:
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x1]
	bl sub_810BB88
_0810C54C:
	movs r0, 0x1
	bl sub_810BF38
	adds r0, r5, 0
	movs r1, 0x1
	bl sub_810C1C8
	b _0810C5AE
_0810C55C:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810C56E
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _0810C584
_0810C56E:
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	adds r0, r5, 0
	bl sub_810C23C
	b _0810C5A0
_0810C584:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C5AE
	movs r0, 0x5
	bl PlaySE
	adds r0, r5, 0
	movs r1, 0
	bl sub_810C1C8
	movs r0, 0
	bl sub_810BDAC
_0810C5A0:
	ldr r0, _0810C5B4 @ =gTasks
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810C5B8 @ =sub_810BF7C
	str r0, [r1]
_0810C5AE:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C5B4: .4byte gTasks
_0810C5B8: .4byte sub_810BF7C
	thumb_func_end sub_810C0C8

	thumb_func_start sub_810C1C8
sub_810C1C8: @ 810C5BC
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	ldr r6, _0810C620 @ =0x00001005
	cmp r1, 0
	bne _0810C5CC
	movs r6, 0x5
_0810C5CC:
	ldr r1, _0810C624 @ =gTasks
	lsls r0, r2, 2
	adds r0, r2
	lsls r0, 3
	adds r0, r1
	ldr r2, _0810C628 @ =gUnknown_02039248
	ldrb r1, [r2, 0x1]
	ldrh r0, [r0, 0x8]
	subs r0, r1
	lsls r1, r0, 16
	lsrs r0, r1, 16
	cmp r0, 0x8
	bhi _0810C61A
	asrs r0, r1, 16
	ldrb r2, [r2]
	cmp r0, r2
	beq _0810C61A
	movs r2, 0
	lsls r0, 1
	adds r1, r0, 0x1
	lsls r5, r1, 5
	ldr r3, _0810C62C @ =0x020221cc
	adds r0, 0x2
	lsls r4, r0, 5
_0810C5FC:
	adds r0, r2, 0
	adds r0, 0xF
	adds r1, r5, r0
	lsls r1, 1
	adds r1, r3
	strh r6, [r1]
	adds r0, r4, r0
	lsls r0, 1
	adds r0, r3
	strh r6, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xD
	bls _0810C5FC
_0810C61A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810C620: .4byte 0x00001005
_0810C624: .4byte gTasks
_0810C628: .4byte gUnknown_02039248
_0810C62C: .4byte 0x020221cc
	thumb_func_end sub_810C1C8

	thumb_func_start sub_810C23C
sub_810C23C: @ 810C630
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r7, _0810C650 @ =gUnknown_02039248
	ldrb r0, [r7]
	ldrb r2, [r7, 0x1]
	adds r0, r2
	lsls r0, 24
	lsrs r0, 24
	ldrb r2, [r7, 0x2]
	cmp r0, r2
	bne _0810C654
	movs r0, 0
	bl sub_810BDAC
	b _0810C696
	.align 2, 0
_0810C650: .4byte gUnknown_02039248
_0810C654:
	ldr r4, _0810C69C @ =gSaveBlock1
	lsls r3, r0, 3
	movs r0, 0xFF
	lsls r0, 3
	adds r4, r0
	adds r3, r4
	ldr r5, [r3]
	ldr r6, [r3, 0x4]
	ldr r0, _0810C6A0 @ =gTasks
	lsls r2, r1, 2
	adds r2, r1
	lsls r2, 3
	adds r2, r0
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r0, 3
	adds r0, r4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, 0x4]
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	lsls r0, 3
	adds r0, r4
	str r5, [r0]
	str r6, [r0, 0x4]
	ldrb r0, [r7, 0x1]
	bl sub_810BB88
	movs r0, 0
	bl sub_810BDAC
_0810C696:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810C69C: .4byte gSaveBlock1
_0810C6A0: .4byte gTasks
	thumb_func_end sub_810C23C

	thumb_func_start sub_810C2B0
sub_810C2B0: @ 810C6A4
	push {lr}
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
	bl BuyMenuFreeMemory
	pop {r0}
	bx r0
	thumb_func_end sub_810C2B0

	thumb_func_start sub_810C2C8
sub_810C2C8: @ 810C6BC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810C6FC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810C6F4
	ldr r4, _0810C700 @ =gUnknown_02039244
	ldrb r0, [r4]
	cmp r0, 0x3
	bne _0810C6DC
	ldr r1, _0810C704 @ =gUnknown_0300485C
	ldr r0, _0810C708 @ =sub_8080990
	str r0, [r1]
_0810C6DC:
	bl sub_810C2B0
	ldr r0, _0810C70C @ =gUnknown_083F7EA8
	ldrb r1, [r4]
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_0810C6F4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C6FC: .4byte gPaletteFade
_0810C700: .4byte gUnknown_02039244
_0810C704: .4byte gUnknown_0300485C
_0810C708: .4byte sub_8080990
_0810C70C: .4byte gUnknown_083F7EA8
	thumb_func_end sub_810C2C8

	thumb_func_start sub_810C31C
sub_810C31C: @ 810C710
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	movs r5, 0
	str r5, [sp]
	movs r1, 0
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r0, _0810C74C @ =gUnknown_02039244
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0810C736
	ldr r0, _0810C750 @ =gScriptItemId
	strh r5, [r0]
_0810C736:
	ldr r0, _0810C754 @ =gTasks
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0810C758 @ =sub_810C2C8
	str r0, [r1]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C74C: .4byte gUnknown_02039244
_0810C750: .4byte gScriptItemId
_0810C754: .4byte gTasks
_0810C758: .4byte sub_810C2C8
	thumb_func_end sub_810C31C

	thumb_func_start sub_810C368
sub_810C368: @ 810C75C
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	movs r4, 0
	ldr r0, _0810C7DC @ =gUnknown_02039244
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0810C770
	movs r4, 0x2
_0810C770:
	movs r0, 0
	bl sub_80F98A4
	movs r0, 0x1
	bl sub_80F98A4
	ldr r0, _0810C7E0 @ =gWindowConfig_81E6E50
	bl BasicInitMenuWindow
	adds r1, r4, 0x4
	movs r0, 0x7
	movs r2, 0xD
	movs r3, 0xB
	bl MenuDrawTextWindow
	adds r4, 0x5
	ldr r5, _0810C7E4 @ =gUnknown_0203924C
	ldrb r2, [r5]
	ldr r3, _0810C7E8 @ =gUnknown_083F7EF4
	ldr r0, _0810C7EC @ =gUnknown_03000758
	ldr r0, [r0]
	str r0, [sp]
	movs r0, 0x8
	adds r1, r4, 0
	bl PrintMenuItemsReordered
	ldrb r3, [r5]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x5
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x8
	adds r2, r4, 0
	bl InitMenu
	ldr r2, _0810C7F0 @ =gScriptItemId
	ldr r1, _0810C7F4 @ =gUnknown_02039248
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	adds r0, r1
	strh r0, [r2]
	ldr r1, _0810C7F8 @ =gTasks
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C7FC @ =sub_810C40C
	str r1, [r0]
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810C7DC: .4byte gUnknown_02039244
_0810C7E0: .4byte gWindowConfig_81E6E50
_0810C7E4: .4byte gUnknown_0203924C
_0810C7E8: .4byte gUnknown_083F7EF4
_0810C7EC: .4byte gUnknown_03000758
_0810C7F0: .4byte gScriptItemId
_0810C7F4: .4byte gUnknown_02039248
_0810C7F8: .4byte gTasks
_0810C7FC: .4byte sub_810C40C
	thumb_func_end sub_810C368

	thumb_func_start sub_810C40C
sub_810C40C: @ 810C800
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	adds r4, r5, 0
	ldr r2, _0810C830 @ =gMain
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _0810C834
	bl GetMenuCursorPos
	lsls r0, 24
	cmp r0, 0
	beq _0810C8B0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	b _0810C8B0
	.align 2, 0
_0810C830: .4byte gMain
_0810C834:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0810C860
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810C85C @ =gUnknown_0203924C
	ldrb r1, [r1]
	subs r1, 0x1
	cmp r0, r1
	beq _0810C8B0
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	b _0810C8B0
	.align 2, 0
_0810C85C: .4byte gUnknown_0203924C
_0810C860:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810C89C
	movs r0, 0x5
	bl PlaySE
	ldr r4, _0810C894 @ =gUnknown_083F7EF4
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810C898 @ =gUnknown_03000758
	ldr r1, [r1]
	adds r1, r0
	ldrb r0, [r1]
	lsls r0, 3
	adds r4, 0x4
	adds r0, r4
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	b _0810C8B0
	.align 2, 0
_0810C894: .4byte gUnknown_083F7EF4
_0810C898: .4byte gUnknown_03000758
_0810C89C:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810C8B0
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl sub_810C748
_0810C8B0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_810C40C

	thumb_func_start sub_810C4C4
sub_810C4C4: @ 810C8B8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0810C8EC @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810C8E4
	bl sub_810C2B0
	ldr r0, _0810C8F0 @ =gScriptItemId
	ldrh r0, [r0]
	lsls r0, 3
	ldr r1, _0810C8F4 @ =0x02025f2c
	adds r0, r1
	ldr r1, _0810C8F8 @ =sub_810B96C
	bl sub_8136130
	adds r0, r4, 0
	bl DestroyTask
_0810C8E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C8EC: .4byte gPaletteFade
_0810C8F0: .4byte gScriptItemId
_0810C8F4: .4byte 0x02025f2c
_0810C8F8: .4byte sub_810B96C
	thumb_func_end sub_810C4C4

	thumb_func_start sub_810C508
sub_810C508: @ 810C8FC
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810C92C @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C930 @ =sub_810C4C4
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C92C: .4byte gTasks
_0810C930: .4byte sub_810C4C4
	thumb_func_end sub_810C508

	thumb_func_start sub_810C540
sub_810C540: @ 810C934
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0810C994 @ =gWindowConfig_81E6E50
	bl BasicInitMenuWindow
	bl sub_8072DEC
	movs r0, 0x7
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r0, _0810C998 @ =gStringVar1
	ldr r4, _0810C99C @ =gPokeblockNames
	ldr r3, _0810C9A0 @ =gSaveBlock1
	ldr r2, _0810C9A4 @ =gUnknown_02039248
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	adds r1, r2
	lsls r1, 3
	adds r1, r3
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r4
	ldr r1, [r1]
	bl StringCopy
	ldr r4, _0810C9A8 @ =gStringVar4
	ldr r1, _0810C9AC @ =gContestStatsText_ThrowAwayPrompt
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _0810C9B0 @ =sub_810C5EC
	adds r0, r5, 0
	adds r1, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810C994: .4byte gWindowConfig_81E6E50
_0810C998: .4byte gStringVar1
_0810C99C: .4byte gPokeblockNames
_0810C9A0: .4byte gSaveBlock1
_0810C9A4: .4byte gUnknown_02039248
_0810C9A8: .4byte gStringVar4
_0810C9AC: .4byte gContestStatsText_ThrowAwayPrompt
_0810C9B0: .4byte sub_810C5EC
	thumb_func_end sub_810C540

	thumb_func_start sub_810C5C0
sub_810C5C0: @ 810C9B4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810C9D8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810C9DC @ =sub_810C540
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810C9D8: .4byte gTasks
_0810C9DC: .4byte sub_810C540
	thumb_func_end sub_810C5C0

	thumb_func_start sub_810C5EC
sub_810C5EC: @ 810C9E0
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _0810CA00 @ =gUnknown_083F7F24
	adds r0, r4, 0
	bl sub_80F914C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CA00: .4byte gUnknown_083F7F24
	thumb_func_end sub_810C5EC

	thumb_func_start sub_810C610
sub_810C610: @ 810CA04
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810CA4C @ =gUnknown_02039248
	ldrb r0, [r1, 0x1]
	ldrb r1, [r1]
	adds r0, r1
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	ldr r5, _0810CA50 @ =gStringVar4
	ldr r1, _0810CA54 @ =gContestStatsText_WasThrownAway
	adds r0, r5, 0
	bl StringExpandPlaceholders
	ldr r2, _0810CA58 @ =sub_810C704
	adds r0, r4, 0
	adds r1, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	bl sub_810BC98
	bl sub_810BD08
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CA4C: .4byte gUnknown_02039248
_0810CA50: .4byte gStringVar4
_0810CA54: .4byte gContestStatsText_WasThrownAway
_0810CA58: .4byte sub_810C704
	thumb_func_end sub_810C610

	thumb_func_start sub_810C668
sub_810C668: @ 810CA5C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	ldr r2, _0810CAC0 @ =gUnknown_02039248
	ldrb r0, [r2, 0x2]
	ldrb r1, [r2, 0x3]
	cmp r0, r1
	bls _0810CA8C
	ldrb r0, [r2, 0x1]
	ldrb r1, [r2, 0x3]
	adds r0, r1
	ldrb r2, [r2, 0x2]
	cmp r0, r2
	beq _0810CA8C
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
_0810CA8C:
	ldr r0, _0810CAC4 @ =gWindowConfig_81E6E50
	bl BasicInitMenuWindow
	movs r0, 0x7
	movs r1, 0x6
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldr r1, _0810CAC8 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810CACC @ =sub_810BF7C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CAC0: .4byte gUnknown_02039248
_0810CAC4: .4byte gWindowConfig_81E6E50
_0810CAC8: .4byte gTasks
_0810CACC: .4byte sub_810BF7C
	thumb_func_end sub_810C668

	thumb_func_start sub_810C6DC
sub_810C6DC: @ 810CAD0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810CAF4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810CAEA
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810CAF0
_0810CAEA:
	adds r0, r2, 0
	bl sub_810C668
_0810CAF0:
	pop {r0}
	bx r0
	.align 2, 0
_0810CAF4: .4byte gMain
	thumb_func_end sub_810C6DC

	thumb_func_start sub_810C704
sub_810C704: @ 810CAF8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0810CB2C @ =gWindowConfig_81E6E34
	bl BasicInitMenuWindow
	ldr r0, _0810CB30 @ =gUnknown_02039248
	ldrb r0, [r0, 0x1]
	bl sub_810BC84
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldr r1, _0810CB34 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810CB38 @ =sub_810C6DC
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CB2C: .4byte gWindowConfig_81E6E34
_0810CB30: .4byte gUnknown_02039248
_0810CB34: .4byte gTasks
_0810CB38: .4byte sub_810C6DC
	thumb_func_end sub_810C704

	thumb_func_start sub_810C748
sub_810C748: @ 810CB3C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	bl sub_8072DEC
	movs r0, 0x7
	movs r1, 0x4
	movs r2, 0xD
	movs r3, 0xB
	bl MenuZeroFillWindowRect
	ldr r1, _0810CB74 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810CB78 @ =sub_810BF7C
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CB74: .4byte gTasks
_0810CB78: .4byte sub_810BF7C
	thumb_func_end sub_810C748

	thumb_func_start sub_810C788
sub_810C788: @ 810CB7C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0810CC28 @ =gEnemyParty
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r7, _0810CC2C @ =gScriptItemId
	ldrh r1, [r7]
	lsls r1, 3
	ldr r5, _0810CC30 @ =0x02025f2c
	adds r1, r5
	bl sub_810CAE4
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810CC34 @ =gUnknown_030041C0
	ldr r2, _0810CC38 @ =gPokeblockNames
	ldr r1, _0810CC3C @ =0xfffff808
	adds r5, r1
	ldrh r1, [r7]
	lsls r1, 3
	adds r1, r5
	movs r6, 0xFF
	lsls r6, 3
	adds r1, r6
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl StringCopy
	ldrb r0, [r7]
	bl sub_810CA6C
	ldrh r0, [r7]
	lsls r0, 3
	adds r0, r5
	adds r0, r6
	ldrb r0, [r0]
	lsls r0, 8
	strh r0, [r7]
	lsls r4, 16
	asrs r4, 16
	cmp r4, 0
	bne _0810CBE8
	adds r0, 0x1
	strh r0, [r7]
_0810CBE8:
	cmp r4, 0
	ble _0810CBF2
	ldrh r0, [r7]
	adds r0, 0x2
	strh r0, [r7]
_0810CBF2:
	cmp r4, 0
	bge _0810CBFC
	ldrh r0, [r7]
	adds r0, 0x3
	strh r0, [r7]
_0810CBFC:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810CC40 @ =gTasks
	mov r2, r8
	lsls r0, r2, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810CC44 @ =sub_810C2C8
	str r1, [r0]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810CC28: .4byte gEnemyParty
_0810CC2C: .4byte gScriptItemId
_0810CC30: .4byte 0x02025f2c
_0810CC34: .4byte gUnknown_030041C0
_0810CC38: .4byte gPokeblockNames
_0810CC3C: .4byte 0xfffff808
_0810CC40: .4byte gTasks
_0810CC44: .4byte sub_810C2C8
	thumb_func_end sub_810C788

	thumb_func_start sub_810C854
sub_810C854: @ 810CC48
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r4, _0810CCAC @ =gScriptItemId
	ldrb r0, [r4]
	bl SafariZoneActivatePokeblockFeeder
	ldr r0, _0810CCB0 @ =gStringVar1
	ldr r3, _0810CCB4 @ =gPokeblockNames
	ldr r2, _0810CCB8 @ =gSaveBlock1
	ldrh r1, [r4]
	lsls r1, 3
	adds r1, r2
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r2
	ldrb r1, [r1]
	lsls r1, 2
	adds r1, r3
	ldr r1, [r1]
	bl StringCopy
	ldr r1, _0810CCBC @ =gScriptResult
	ldrh r0, [r4]
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl sub_810CA6C
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _0810CCC0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810CCC4 @ =sub_810C2C8
	str r1, [r0]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CCAC: .4byte gScriptItemId
_0810CCB0: .4byte gStringVar1
_0810CCB4: .4byte gPokeblockNames
_0810CCB8: .4byte gSaveBlock1
_0810CCBC: .4byte gScriptResult
_0810CCC0: .4byte gTasks
_0810CCC4: .4byte sub_810C2C8
	thumb_func_end sub_810C854

	thumb_func_start sub_810C8D4
sub_810C8D4: @ 810CCC8
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	ble _0810CCD8
	movs r0, 0
	strh r0, [r4, 0x2E]
_0810CCD8:
	movs r0, 0x2E
	ldrsh r5, [r4, r0]
	cmp r5, 0
	beq _0810CCE6
	cmp r5, 0x1
	beq _0810CD0C
	b _0810CD38
_0810CCE6:
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r0, _0810CD08 @ =gUnknown_083F7F70
	str r0, [r4, 0x10]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	movs r0, 0x1
	strh r0, [r4, 0x2E]
	strh r5, [r4, 0x30]
	b _0810CD38
	.align 2, 0
_0810CD08: .4byte gUnknown_083F7F70
_0810CD0C:
	ldrh r0, [r4, 0x30]
	adds r0, 0x1
	movs r2, 0
	strh r0, [r4, 0x30]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0xB
	ble _0810CD38
	ldrb r1, [r4, 0x1]
	movs r0, 0x4
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	strh r2, [r4, 0x2E]
	strh r2, [r4, 0x30]
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldr r0, _0810CD40 @ =SpriteCallbackDummy
	str r0, [r4, 0x1C]
_0810CD38:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810CD40: .4byte SpriteCallbackDummy
	thumb_func_end sub_810C8D4

	thumb_func_start sub_810C950
sub_810C950: @ 810CD44
	lsls r0, 24
	ldr r1, _0810CD7C @ =gSaveBlock1
	lsrs r0, 21
	adds r0, r1
	movs r2, 0xFF
	lsls r2, 3
	adds r1, r0, r2
	movs r2, 0
	strb r2, [r1]
	ldr r3, _0810CD80 @ =0x000007f9
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, 0x1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0810CD84 @ =0x000007fe
	adds r0, r1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0810CD7C: .4byte gSaveBlock1
_0810CD80: .4byte 0x000007f9
_0810CD84: .4byte 0x000007fe
	thumb_func_end sub_810C950

	thumb_func_start sub_810C994
sub_810C994: @ 810CD88
	push {r4,lr}
	movs r4, 0
_0810CD8C:
	adds r0, r4, 0
	bl sub_810C950
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x27
	bls _0810CD8C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810C994

	thumb_func_start sub_810C9B0
sub_810C9B0: @ 810CDA4
	push {r4-r6,lr}
	adds r6, r0, 0
	movs r1, 0x1
	bl sub_810CA9C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x1
_0810CDB4:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r6, 0
	adds r1, r4, 0
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r5, r0
	bcs _0810CDCC
	adds r5, r0, 0
_0810CDCC:
	adds r1, r4, 0
	cmp r1, 0x4
	bls _0810CDB4
	adds r0, r5, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810C9B0

	thumb_func_start sub_810C9E8
sub_810C9E8: @ 810CDDC
	push {lr}
	movs r1, 0x6
	bl sub_810CA9C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	bls _0810CDEE
	movs r0, 0x63
_0810CDEE:
	pop {r1}
	bx r1
	thumb_func_end sub_810C9E8

	thumb_func_start sub_810CA00
sub_810CA00: @ 810CDF4
	push {lr}
	movs r1, 0
	ldr r3, _0810CE10 @ =gSaveBlock1
	movs r2, 0xFF
	lsls r2, 3
_0810CDFE:
	lsls r0, r1, 3
	adds r0, r3
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810CE14
	lsls r0, r1, 24
	asrs r0, 24
	b _0810CE22
	.align 2, 0
_0810CE10: .4byte gSaveBlock1
_0810CE14:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x27
	bls _0810CDFE
	movs r0, 0x1
	negs r0, r0
_0810CE22:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA00

	thumb_func_start sub_810CA34
sub_810CA34: @ 810CE28
	push {r4,lr}
	adds r4, r0, 0
	bl sub_810CA00
	lsls r0, 24
	asrs r2, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	beq _0810CE58
	ldr r0, _0810CE54 @ =gSaveBlock1
	lsls r2, 3
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	adds r2, r0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	movs r0, 0x1
	b _0810CE5A
	.align 2, 0
_0810CE54: .4byte gSaveBlock1
_0810CE58:
	movs r0, 0
_0810CE5A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810CA34

	thumb_func_start sub_810CA6C
sub_810CA6C: @ 810CE60
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r1, _0810CE84 @ =gSaveBlock1
	lsls r0, r2, 3
	adds r0, r1
	movs r1, 0xFF
	lsls r1, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810CE88
	adds r0, r2, 0
	bl sub_810C950
	movs r0, 0x1
	b _0810CE8A
	.align 2, 0
_0810CE84: .4byte gSaveBlock1
_0810CE88:
	movs r0, 0
_0810CE8A:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA6C

	thumb_func_start sub_810CA9C
sub_810CA9C: @ 810CE90
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0
	bne _0810CEA0
	ldrb r0, [r0]
	b _0810CED2
_0810CEA0:
	cmp r1, 0x1
	bne _0810CEA8
	ldrb r0, [r0, 0x1]
	b _0810CED2
_0810CEA8:
	cmp r1, 0x2
	bne _0810CEB0
	ldrb r0, [r0, 0x2]
	b _0810CED2
_0810CEB0:
	cmp r1, 0x3
	bne _0810CEB8
	ldrb r0, [r0, 0x3]
	b _0810CED2
_0810CEB8:
	cmp r1, 0x4
	bne _0810CEC0
	ldrb r0, [r0, 0x4]
	b _0810CED2
_0810CEC0:
	cmp r1, 0x5
	bne _0810CEC8
	ldrb r0, [r0, 0x5]
	b _0810CED2
_0810CEC8:
	cmp r2, 0x6
	beq _0810CED0
	movs r0, 0
	b _0810CED2
_0810CED0:
	ldrb r0, [r0, 0x6]
_0810CED2:
	pop {r1}
	bx r1
	thumb_func_end sub_810CA9C

	thumb_func_start sub_810CAE4
sub_810CAE4: @ 810CED8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	movs r6, 0
	movs r4, 0
	ldr r1, _0810CF34 @ =gUnknown_083F7E28
	mov r9, r1
	lsls r1, r0, 2
	adds r7, r1, r0
_0810CEF2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r8
	adds r1, r5, 0
	bl sub_810CA9C
	lsls r0, 16
	asrs r1, r0, 16
	cmp r1, 0
	ble _0810CF1E
	adds r0, r7, r4
	add r0, r9
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	muls r1, r0
	lsls r0, r6, 16
	asrs r0, 16
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
_0810CF1E:
	adds r4, r5, 0
	cmp r4, 0x4
	bls _0810CEF2
	lsls r0, r6, 16
	asrs r0, 16
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810CF34: .4byte gUnknown_083F7E28
	thumb_func_end sub_810CAE4

	thumb_func_start sub_810CB44
sub_810CB44: @ 810CF38
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0
	bl sub_810CA9C
	lsls r0, 24
	ldr r1, _0810CF58 @ =gPokeblockNames
	lsrs r0, 22
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl StringCopy
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810CF58: .4byte gPokeblockNames
	thumb_func_end sub_810CB44

	thumb_func_start sub_810CB68
sub_810CB68: @ 810CF5C
	push {r4-r7,lr}
	adds r6, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r7, _0810CF8C @ =gPokeblockNames
_0810CF68:
	lsls r1, r4, 3
	ldr r0, _0810CF90 @ =gUnknown_083F7F9C
	adds r1, r0
	adds r0, r5, 0
	bl sub_810CAE4
	lsls r0, 16
	cmp r0, 0
	ble _0810CF94
	adds r0, r4, 0x1
	lsls r0, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r6, 0
	bl StringCopy
	movs r0, 0x1
	b _0810CFA0
	.align 2, 0
_0810CF8C: .4byte gPokeblockNames
_0810CF90: .4byte gUnknown_083F7F9C
_0810CF94:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0810CF68
	movs r0, 0
_0810CFA0:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CB68

	thumb_func_start SetUpFieldMove_Flash
SetUpFieldMove_Flash: @ 810CFA8
	push {lr}
	ldr r0, _0810CFD0 @ =gMapHeader
	ldrb r0, [r0, 0x15]
	cmp r0, 0x1
	bne _0810CFE8
	ldr r0, _0810CFD4 @ =0x00000828
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810CFE8
	ldr r1, _0810CFD8 @ =gUnknown_0300485C
	ldr r0, _0810CFDC @ =sub_808AB90
	str r0, [r1]
	ldr r1, _0810CFE0 @ =gUnknown_03005CE4
	ldr r0, _0810CFE4 @ =sub_810CBFC
	str r0, [r1]
	movs r0, 0x1
	b _0810CFEA
	.align 2, 0
_0810CFD0: .4byte gMapHeader
_0810CFD4: .4byte 0x00000828
_0810CFD8: .4byte gUnknown_0300485C
_0810CFDC: .4byte sub_808AB90
_0810CFE0: .4byte gUnknown_03005CE4
_0810CFE4: .4byte sub_810CBFC
_0810CFE8:
	movs r0, 0
_0810CFEA:
	pop {r1}
	bx r1
	thumb_func_end SetUpFieldMove_Flash

	thumb_func_start sub_810CBFC
sub_810CBFC: @ 810CFF0
	push {lr}
	bl oei_task_add
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D018 @ =gUnknown_0202FF84
	ldr r1, _0810D01C @ =gUnknown_03005CE0
	ldrb r1, [r1]
	str r1, [r2]
	ldr r2, _0810D020 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _0810D024 @ =sub_810CC34
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	pop {r0}
	bx r0
	.align 2, 0
_0810D018: .4byte gUnknown_0202FF84
_0810D01C: .4byte gUnknown_03005CE0
_0810D020: .4byte gTasks
_0810D024: .4byte sub_810CC34
	thumb_func_end sub_810CBFC

	thumb_func_start sub_810CC34
sub_810CC34: @ 810D028
	push {lr}
	movs r0, 0xCF
	bl PlaySE
	ldr r0, _0810D040 @ =0x00000828
	bl FlagSet
	ldr r0, _0810D044 @ =gUnknown_081B694A
	bl ScriptContext1_SetupScript
	pop {r0}
	bx r0
	.align 2, 0
_0810D040: .4byte 0x00000828
_0810D044: .4byte gUnknown_081B694A
	thumb_func_end sub_810CC34

	thumb_func_start sub_810CC54
sub_810CC54: @ 810D048
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_810CC54

	thumb_func_start sub_810CC6C
sub_810CC6C: @ 810D060
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_810CC6C

	thumb_func_start sub_810CC80
sub_810CC80: @ 810D074
	push {r4,lr}
	sub sp, 0x8
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0x80
	lsls r0, 19
	movs r1, 0
	strh r1, [r0]
	adds r0, 0xC
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	subs r0, 0x2
	strh r1, [r0]
	adds r0, 0x10
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	subs r0, 0x6
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	mov r0, sp
	strh r1, [r0]
	ldr r1, _0810D128 @ =0x040000d4
	str r0, [r1]
	movs r0, 0xC0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0810D12C @ =0x8100c000
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r4, 0
	str r4, [sp, 0x4]
	add r0, sp, 0x4
	str r0, [r1]
	movs r0, 0xE0
	lsls r0, 19
	str r0, [r1, 0x4]
	ldr r0, _0810D130 @ =0x85000100
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	mov r0, sp
	strh r4, [r0]
	str r0, [r1]
	ldr r0, _0810D134 @ =0x05000002
	str r0, [r1, 0x4]
	ldr r0, _0810D138 @ =0x810001ff
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	bl ResetPaletteFade
	bl ResetTasks
	bl ResetSpriteData
	ldr r3, _0810D13C @ =0x04000208
	ldrh r2, [r3]
	strh r4, [r3]
	ldr r4, _0810D140 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	ldr r0, _0810D144 @ =sub_810CC6C
	bl SetVBlankCallback
	ldr r0, _0810D148 @ =sub_810CC54
	bl SetMainCallback2
	bl sub_810CD5C
	lsls r0, 24
	cmp r0, 0
	bne _0810D11E
	ldr r0, _0810D14C @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810D11E:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D128: .4byte 0x040000d4
_0810D12C: .4byte 0x8100c000
_0810D130: .4byte 0x85000100
_0810D134: .4byte 0x05000002
_0810D138: .4byte 0x810001ff
_0810D13C: .4byte 0x04000208
_0810D140: .4byte 0x04000200
_0810D144: .4byte sub_810CC6C
_0810D148: .4byte sub_810CC54
_0810D14C: .4byte gMain
	thumb_func_end sub_810CC80

	thumb_func_start sub_810CD5C
sub_810CD5C: @ 810D150
	push {r4-r7,lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r6, r0, 24
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r5, r0, 24
	movs r3, 0
	ldr r4, _0810D190 @ =gUnknown_083F7FC4
	ldrb r0, [r4]
	cmp r0, 0
	beq _0810D1A4
	adds r7, r4, 0
	adds r0, r4, 0x4
	mov r12, r0
_0810D172:
	lsls r2, r3, 3
	adds r1, r2, r7
	ldrb r0, [r1]
	cmp r0, r6
	bne _0810D194
	ldrb r0, [r1, 0x1]
	cmp r0, r5
	bne _0810D194
	mov r1, r12
	adds r0, r2, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0x1
	b _0810D1A6
	.align 2, 0
_0810D190: .4byte gUnknown_083F7FC4
_0810D194:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r4
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810D172
_0810D1A4:
	movs r0, 0
_0810D1A6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810CD5C

	thumb_func_start sub_810CDB8
sub_810CDB8: @ 810D1AC
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _0810D1D8 @ =gUnknown_083F7FC4
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810D1EC
	adds r6, r1, 0
_0810D1C2:
	lsls r0, r3, 3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _0810D1DC
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _0810D1DC
	ldrb r0, [r2, 0x2]
	b _0810D1EE
	.align 2, 0
_0810D1D8: .4byte gUnknown_083F7FC4
_0810D1DC:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810D1C2
_0810D1EC:
	movs r0, 0
_0810D1EE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810CDB8

	thumb_func_start fade_type_for_given_maplight_pair
fade_type_for_given_maplight_pair: @ 810D1F4
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	lsrs r4, r1, 24
	movs r3, 0
	ldr r1, _0810D220 @ =gUnknown_083F7FC4
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810D234
	adds r6, r1, 0
_0810D20A:
	lsls r0, r3, 3
	adds r2, r0, r6
	ldrb r0, [r2]
	cmp r0, r5
	bne _0810D224
	ldrb r0, [r2, 0x1]
	cmp r0, r4
	bne _0810D224
	ldrb r0, [r2, 0x3]
	b _0810D236
	.align 2, 0
_0810D220: .4byte gUnknown_083F7FC4
_0810D224:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	bne _0810D20A
_0810D234:
	movs r0, 0
_0810D236:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end fade_type_for_given_maplight_pair

	thumb_func_start sub_810CE48
sub_810CE48: @ 810D23C
	push {lr}
	ldr r0, _0810D24C @ =sub_810CE5C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D24C: .4byte sub_810CE5C
	thumb_func_end sub_810CE48

	thumb_func_start sub_810CE5C
sub_810CE5C: @ 810D250
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D264 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810D268 @ =sub_810CE78
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D264: .4byte gTasks
_0810D268: .4byte sub_810CE78
	thumb_func_end sub_810CE5C

	thumb_func_start sub_810CE78
sub_810CE78: @ 810D26C
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r6, 0x80
	lsls r6, 19
	movs r5, 0
	strh r5, [r6]
	ldr r0, _0810D2DC @ =gCaveTransitionTiles
	ldr r1, _0810D2E0 @ =0x0600c000
	bl LZ77UnCompVram
	ldr r0, _0810D2E4 @ =gCaveTransitionTilemap
	ldr r1, _0810D2E8 @ =0x0600f800
	bl LZ77UnCompVram
	ldr r0, _0810D2EC @ =gCaveTransitionPalette_White
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D2F0 @ =gUnknown_083F809C
	movs r1, 0xE0
	movs r2, 0x10
	bl LoadPalette
	ldr r1, _0810D2F4 @ =0x04000050
	ldr r2, _0810D2F8 @ =0x00003e41
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0810D2FC @ =0x04000052
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	subs r1, 0x48
	ldr r2, _0810D300 @ =0x00001f0c
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x8A
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r6]
	ldr r1, _0810D304 @ =gTasks
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810D308 @ =sub_810CF18
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D2DC: .4byte gCaveTransitionTiles
_0810D2E0: .4byte 0x0600c000
_0810D2E4: .4byte gCaveTransitionTilemap
_0810D2E8: .4byte 0x0600f800
_0810D2EC: .4byte gCaveTransitionPalette_White
_0810D2F0: .4byte gUnknown_083F809C
_0810D2F4: .4byte 0x04000050
_0810D2F8: .4byte 0x00003e41
_0810D2FC: .4byte 0x04000052
_0810D300: .4byte 0x00001f0c
_0810D304: .4byte gTasks
_0810D308: .4byte sub_810CF18
	thumb_func_end sub_810CE78

	thumb_func_start sub_810CF18
sub_810CF18: @ 810D30C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D338 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r2, [r3, 0xA]
	movs r1, 0x80
	lsls r1, 5
	adds r0, r2, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0810D33C @ =0x04000052
	strh r0, [r1]
	cmp r2, 0x10
	bhi _0810D340
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	b _0810D348
	.align 2, 0
_0810D338: .4byte gTasks
_0810D33C: .4byte 0x04000052
_0810D340:
	movs r0, 0
	strh r0, [r3, 0xC]
	ldr r0, _0810D34C @ =sub_810CF5C
	str r0, [r3]
_0810D348:
	pop {r0}
	bx r0
	.align 2, 0
_0810D34C: .4byte sub_810CF5C
	thumb_func_end sub_810CF18

	thumb_func_start sub_810CF5C
sub_810CF5C: @ 810D350
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D388 @ =0x04000052
	ldr r3, _0810D38C @ =0x00001010
	adds r1, r3, 0
	strh r1, [r2]
	ldr r2, _0810D390 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
	ldrh r1, [r4, 0xC]
	cmp r1, 0x7
	bhi _0810D398
	adds r0, r1, 0x1
	strh r0, [r4, 0xC]
	lsls r1, 1
	ldr r0, _0810D394 @ =gUnknown_083F809C
	adds r0, r1, r0
	movs r2, 0x10
	subs r2, r1
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _0810D3AA
	.align 2, 0
_0810D388: .4byte 0x04000052
_0810D38C: .4byte 0x00001010
_0810D390: .4byte gTasks
_0810D394: .4byte gUnknown_083F809C
_0810D398:
	ldr r0, _0810D3B0 @ =gCaveTransitionPalette_White
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D3B4 @ =sub_810CFC4
	str r0, [r4]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_0810D3AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D3B0: .4byte gCaveTransitionPalette_White
_0810D3B4: .4byte sub_810CFC4
	thumb_func_end sub_810CF5C

	thumb_func_start sub_810CFC4
sub_810CFC4: @ 810D3B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D3D8 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r2, [r1, 0xC]
	movs r3, 0xC
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0810D3DC
	subs r0, r2, 0x1
	strh r0, [r1, 0xC]
	b _0810D3E4
	.align 2, 0
_0810D3D8: .4byte gTasks
_0810D3DC:
	ldr r0, _0810D3E8 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810D3E4:
	pop {r0}
	bx r0
	.align 2, 0
_0810D3E8: .4byte gMain
	thumb_func_end sub_810CFC4

	thumb_func_start sub_810CFF8
sub_810CFF8: @ 810D3EC
	push {lr}
	ldr r0, _0810D3FC @ =sub_810D00C
	movs r1, 0
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D3FC: .4byte sub_810D00C
	thumb_func_end sub_810CFF8

	thumb_func_start sub_810D00C
sub_810D00C: @ 810D400
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D414 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810D418 @ =sub_810D028
	str r0, [r1]
	bx lr
	.align 2, 0
_0810D414: .4byte gTasks
_0810D418: .4byte sub_810D028
	thumb_func_end sub_810D00C

	thumb_func_start sub_810D028
sub_810D028: @ 810D41C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	movs r6, 0x80
	lsls r6, 19
	movs r4, 0
	strh r4, [r6]
	ldr r0, _0810D48C @ =gCaveTransitionTiles
	ldr r1, _0810D490 @ =0x0600c000
	bl LZ77UnCompVram
	ldr r0, _0810D494 @ =gCaveTransitionTilemap
	ldr r1, _0810D498 @ =0x0600f800
	bl LZ77UnCompVram
	ldr r0, _0810D49C @ =0x04000050
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	adds r0, 0x2
	strh r4, [r0]
	ldr r1, _0810D4A0 @ =0x04000008
	ldr r2, _0810D4A4 @ =0x00001f0c
	adds r0, r2, 0
	strh r0, [r1]
	movs r1, 0x8A
	lsls r1, 5
	adds r0, r1, 0
	strh r0, [r6]
	ldr r0, _0810D4A8 @ =gCaveTransitionPalette_White
	movs r1, 0xE0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D4AC @ =gCaveTransitionPalette_Black
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r1, _0810D4B0 @ =gTasks
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	ldr r1, _0810D4B4 @ =sub_810D0C4
	str r1, [r0]
	movs r2, 0
	movs r1, 0x10
	strh r1, [r0, 0x8]
	strh r2, [r0, 0xA]
	strh r2, [r0, 0xC]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810D48C: .4byte gCaveTransitionTiles
_0810D490: .4byte 0x0600c000
_0810D494: .4byte gCaveTransitionTilemap
_0810D498: .4byte 0x0600f800
_0810D49C: .4byte 0x04000050
_0810D4A0: .4byte 0x04000008
_0810D4A4: .4byte 0x00001f0c
_0810D4A8: .4byte gCaveTransitionPalette_White
_0810D4AC: .4byte gCaveTransitionPalette_Black
_0810D4B0: .4byte gTasks
_0810D4B4: .4byte sub_810D0C4
	thumb_func_end sub_810D028

	thumb_func_start sub_810D0C4
sub_810D0C4: @ 810D4B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D4EC @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r1, [r3, 0xC]
	cmp r1, 0xF
	bhi _0810D4F4
	adds r2, r1, 0x1
	adds r0, r2, 0x1
	strh r0, [r3, 0xC]
	movs r0, 0xF
	subs r0, r1
	lsls r0, 1
	ldr r1, _0810D4F0 @ =gUnknown_083F808C
	adds r0, r1
	lsls r2, 17
	lsrs r2, 16
	movs r1, 0xE0
	bl LoadPalette
	b _0810D508
	.align 2, 0
_0810D4EC: .4byte gTasks
_0810D4F0: .4byte gUnknown_083F808C
_0810D4F4:
	ldr r1, _0810D50C @ =0x04000052
	ldr r2, _0810D510 @ =0x00001010
	adds r0, r2, 0
	strh r0, [r1]
	subs r1, 0x2
	ldr r2, _0810D514 @ =0x00003e41
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0810D518 @ =sub_810D128
	str r0, [r3]
_0810D508:
	pop {r0}
	bx r0
	.align 2, 0
_0810D50C: .4byte 0x04000052
_0810D510: .4byte 0x00001010
_0810D514: .4byte 0x00003e41
_0810D518: .4byte sub_810D128
	thumb_func_end sub_810D0C4

	thumb_func_start sub_810D128
sub_810D128: @ 810D51C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810D54C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r3, r1, r2
	ldrh r0, [r3, 0xA]
	movs r1, 0x10
	subs r1, r0
	lsls r1, 16
	movs r2, 0x80
	lsls r2, 21
	adds r0, r1, r2
	lsrs r0, 16
	ldr r2, _0810D550 @ =0x04000052
	strh r0, [r2]
	cmp r1, 0
	beq _0810D554
	ldrh r0, [r3, 0xA]
	adds r0, 0x1
	strh r0, [r3, 0xA]
	b _0810D566
	.align 2, 0
_0810D54C: .4byte gTasks
_0810D550: .4byte 0x04000052
_0810D554:
	ldr r0, _0810D56C @ =gCaveTransitionPalette_Black
	movs r1, 0
	movs r2, 0x20
	bl LoadPalette
	ldr r0, _0810D570 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
_0810D566:
	pop {r0}
	bx r0
	.align 2, 0
_0810D56C: .4byte gCaveTransitionPalette_Black
_0810D570: .4byte gMain
	thumb_func_end sub_810D128

	thumb_func_start sub_810D180
sub_810D180: @ 810D574
	push {r4-r7,lr}
	sub sp, 0x4
	bl HealPlayerParty
	ldr r4, _0810D594 @ =0x00000804
	adds r0, r4, 0
	bl FlagGet
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	bne _0810D59C
	ldr r0, _0810D598 @ =gUnknown_02039324
	strb r1, [r0]
	b _0810D5A8
	.align 2, 0
_0810D594: .4byte 0x00000804
_0810D598: .4byte gUnknown_02039324
_0810D59C:
	ldr r1, _0810D5DC @ =gUnknown_02039324
	movs r0, 0
	strb r0, [r1]
	adds r0, r4, 0
	bl FlagSet
_0810D5A8:
	movs r0, 0x1
	bl sub_8053108
	cmp r0, 0
	bne _0810D5C8
	ldr r2, _0810D5E0 @ =gSaveBlock2
	ldrh r1, [r2, 0xE]
	lsls r1, 16
	ldrb r0, [r2, 0x10]
	lsls r0, 8
	orrs r1, r0
	ldrb r0, [r2, 0x11]
	orrs r1, r0
	movs r0, 0x1
	bl sav12_xor_set
_0810D5C8:
	bl SetSecretBase2Field_9
	ldr r0, _0810D5E0 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810D5E4
	movs r0, 0x1
	bl sub_80537CC
	b _0810D5EA
	.align 2, 0
_0810D5DC: .4byte gUnknown_02039324
_0810D5E0: .4byte gSaveBlock2
_0810D5E4:
	movs r0, 0x2
	bl sub_80537CC
_0810D5EA:
	movs r6, 0
	movs r5, 0
	mov r7, sp
_0810D5F0:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D654 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _0810D62E
	adds r0, r4, 0
	movs r1, 0x6
	bl GetMonData
	cmp r0, 0
	bne _0810D62E
	adds r0, r4, 0
	movs r1, 0x43
	bl GetMonData
	cmp r0, 0
	bne _0810D62E
	movs r0, 0x1
	strb r0, [r7]
	adds r0, r4, 0
	movs r1, 0x43
	mov r2, sp
	bl SetMonData
	movs r6, 0x1
_0810D62E:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D5F0
	cmp r6, 0x1
	bne _0810D644
	movs r0, 0x2A
	bl sav12_xor_increment
	ldr r0, _0810D658 @ =0x0000083b
	bl FlagSet
_0810D644:
	ldr r0, _0810D65C @ =sub_8141F90
	bl SetMainCallback2
	movs r0, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810D654: .4byte gPlayerParty
_0810D658: .4byte 0x0000083b
_0810D65C: .4byte sub_8141F90
	thumb_func_end sub_810D180

	thumb_func_start sp0C8_whiteout_maybe
sp0C8_whiteout_maybe: @ 810D660
	push {lr}
	ldr r0, _0810D670 @ =c2_whiteout
	bl SetMainCallback2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0810D670: .4byte c2_whiteout
	thumb_func_end sp0C8_whiteout_maybe

	thumb_func_start sub_810D280
sub_810D280: @ 810D674
	push {r4,lr}
	ldr r0, _0810D698 @ =0x00004024
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D69C @ =0x00004025
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 16
	orrs r4, r0
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810D698: .4byte 0x00004024
_0810D69C: .4byte 0x00004025
	thumb_func_end sub_810D280

	thumb_func_start sub_810D2AC
sub_810D2AC: @ 810D6A0
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _0810D6C0 @ =0x00004024
	lsrs r1, r4, 16
	bl VarSet
	ldr r0, _0810D6C4 @ =0x00004025
	lsls r4, 16
	lsrs r4, 16
	adds r1, r4, 0
	bl VarSet
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D6C0: .4byte 0x00004024
_0810D6C4: .4byte 0x00004025
	thumb_func_end sub_810D2AC

	thumb_func_start unref_sub_810D2D4
unref_sub_810D2D4: @ 810D6C8
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	adds r0, r4, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_810D2D4

	thumb_func_start sub_810D2F4
sub_810D2F4: @ 810D6E8
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_810D280
	adds r1, r0, 0
	cmp r4, 0
	beq _0810D70C
	ldr r3, _0810D718 @ =0x41c64e6d
	ldr r2, _0810D71C @ =0x00003039
_0810D6FC:
	adds r0, r1, 0
	muls r0, r3
	adds r1, r0, r2
	subs r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0
	bne _0810D6FC
_0810D70C:
	adds r0, r1, 0
	bl sub_810D2AC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810D718: .4byte 0x41c64e6d
_0810D71C: .4byte 0x00003039
	thumb_func_end sub_810D2F4

	thumb_func_start sub_810D32C
sub_810D32C: @ 810D720
	push {r4-r6,lr}
	bl sub_810D280
	lsrs r6, r0, 16
	movs r5, 0
_0810D72A:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810D754 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	cmp r0, 0
	beq _0810D75C
	adds r0, r4, 0
	movs r1, 0
	bl GetMonData
	ldr r1, _0810D758 @ =0x0000ffff
	ands r1, r0
	cmp r1, r6
	bne _0810D75C
	movs r0, 0x1
	b _0810D764
	.align 2, 0
_0810D754: .4byte gPlayerParty
_0810D758: .4byte 0x0000ffff
_0810D75C:
	adds r5, 0x1
	cmp r5, 0x5
	ble _0810D72A
	movs r0, 0
_0810D764:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_810D32C

	thumb_func_start sub_810D378
sub_810D378: @ 810D76C
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _0810D7B2
	bl RtcCalcLocalTime
	ldr r1, _0810D7A0 @ =gUnknown_083F8340
	ldr r0, _0810D7A4 @ =gLocalTime
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0810D7AC
	ldr r0, _0810D7A8 @ =0x0000083a
	bl FlagSet
	b _0810D7B2
	.align 2, 0
_0810D7A0: .4byte gUnknown_083F8340
_0810D7A4: .4byte gLocalTime
_0810D7A8: .4byte 0x0000083a
_0810D7AC:
	ldr r0, _0810D7B8 @ =0x0000083a
	bl FlagReset
_0810D7B2:
	pop {r0}
	bx r0
	.align 2, 0
_0810D7B8: .4byte 0x0000083a
	thumb_func_end sub_810D378

	thumb_func_start sub_810D3C8
sub_810D3C8: @ 810D7BC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_807DDFC
	lsls r0, 24
	cmp r0, 0
	beq _0810D7D6
	bl EnableBothScriptContexts
	adds r0, r4, 0
	bl DestroyTask
_0810D7D6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_810D3C8

	thumb_func_start sub_810D3E8
sub_810D3E8: @ 810D7DC
	push {lr}
	ldr r0, _0810D7EC @ =sub_810D3C8
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810D7EC: .4byte sub_810D3C8
	thumb_func_end sub_810D3E8

	thumb_func_start sub_810D3FC
sub_810D3FC: @ 810D7F0
	push {lr}
	ldr r0, _0810D800 @ =0x00004049
	bl GetVarPointer
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810D800: .4byte 0x00004049
	thumb_func_end sub_810D3FC

	thumb_func_start UpdateBirchState
UpdateBirchState: @ 810D804
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810D82C @ =0x00004049
	bl GetVarPointer
	adds r5, r0, 0
	ldrh r0, [r5]
	adds r4, r0
	strh r4, [r5]
	ldrh r0, [r5]
	movs r1, 0x7
	bl __umodsi3
	strh r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810D82C: .4byte 0x00004049
	thumb_func_end UpdateBirchState

	thumb_func_start ScriptGetPokedexInfo
ScriptGetPokedexInfo: @ 810D830
	push {lr}
	ldr r0, _0810D84C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810D854
	movs r0, 0
	bl GetHoennPokedexCount
	ldr r1, _0810D850 @ =gSpecialVar_0x8005
	strh r0, [r1]
	movs r0, 0x1
	bl GetHoennPokedexCount
	b _0810D864
	.align 2, 0
_0810D84C: .4byte gSpecialVar_0x8004
_0810D850: .4byte gSpecialVar_0x8005
_0810D854:
	movs r0, 0
	bl GetNationalPokedexCount
	ldr r1, _0810D874 @ =gSpecialVar_0x8005
	strh r0, [r1]
	movs r0, 0x1
	bl GetNationalPokedexCount
_0810D864:
	ldr r1, _0810D878 @ =gSpecialVar_0x8006
	strh r0, [r1]
	bl IsNationalPokedex
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810D874: .4byte gSpecialVar_0x8005
_0810D878: .4byte gSpecialVar_0x8006
	thumb_func_end ScriptGetPokedexInfo

	thumb_func_start GetPokedexRatingText
GetPokedexRatingText: @ 810D87C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x9
	bhi _0810D888
	b _0810D9E0
_0810D888:
	cmp r0, 0x13
	bhi _0810D894
	ldr r0, _0810D890 @ =gUnknown_081C456A
	b _0810D9EA
	.align 2, 0
_0810D890: .4byte gUnknown_081C456A
_0810D894:
	cmp r0, 0x1D
	bhi _0810D8A0
	ldr r0, _0810D89C @ =gUnknown_081C45B0
	b _0810D9EA
	.align 2, 0
_0810D89C: .4byte gUnknown_081C45B0
_0810D8A0:
	cmp r0, 0x27
	bhi _0810D8AC
	ldr r0, _0810D8A8 @ =gUnknown_081C45F9
	b _0810D9EA
	.align 2, 0
_0810D8A8: .4byte gUnknown_081C45F9
_0810D8AC:
	cmp r0, 0x31
	bhi _0810D8B8
	ldr r0, _0810D8B4 @ =gUnknown_081C4648
	b _0810D9EA
	.align 2, 0
_0810D8B4: .4byte gUnknown_081C4648
_0810D8B8:
	cmp r0, 0x3B
	bhi _0810D8C4
	ldr r0, _0810D8C0 @ =gUnknown_081C467E
	b _0810D9EA
	.align 2, 0
_0810D8C0: .4byte gUnknown_081C467E
_0810D8C4:
	cmp r0, 0x45
	bhi _0810D8D0
	ldr r0, _0810D8CC @ =gUnknown_081C46B9
	b _0810D9EA
	.align 2, 0
_0810D8CC: .4byte gUnknown_081C46B9
_0810D8D0:
	cmp r0, 0x4F
	bhi _0810D8DC
	ldr r0, _0810D8D8 @ =gUnknown_081C46FE
	b _0810D9EA
	.align 2, 0
_0810D8D8: .4byte gUnknown_081C46FE
_0810D8DC:
	cmp r0, 0x59
	bhi _0810D8E8
	ldr r0, _0810D8E4 @ =gUnknown_081C4747
	b _0810D9EA
	.align 2, 0
_0810D8E4: .4byte gUnknown_081C4747
_0810D8E8:
	cmp r0, 0x63
	bhi _0810D8F4
	ldr r0, _0810D8F0 @ =gUnknown_081C4780
	b _0810D9EA
	.align 2, 0
_0810D8F0: .4byte gUnknown_081C4780
_0810D8F4:
	cmp r0, 0x6D
	bhi _0810D900
	ldr r0, _0810D8FC @ =gUnknown_081C47DF
	b _0810D9EA
	.align 2, 0
_0810D8FC: .4byte gUnknown_081C47DF
_0810D900:
	cmp r0, 0x77
	bhi _0810D90C
	ldr r0, _0810D908 @ =gUnknown_081C4828
	b _0810D9EA
	.align 2, 0
_0810D908: .4byte gUnknown_081C4828
_0810D90C:
	cmp r0, 0x81
	bhi _0810D918
	ldr r0, _0810D914 @ =gUnknown_081C4863
	b _0810D9EA
	.align 2, 0
_0810D914: .4byte gUnknown_081C4863
_0810D918:
	cmp r0, 0x8B
	bhi _0810D924
	ldr r0, _0810D920 @ =gUnknown_081C489C
	b _0810D9EA
	.align 2, 0
_0810D920: .4byte gUnknown_081C489C
_0810D924:
	cmp r0, 0x95
	bhi _0810D930
	ldr r0, _0810D92C @ =gUnknown_081C48EB
	b _0810D9EA
	.align 2, 0
_0810D92C: .4byte gUnknown_081C48EB
_0810D930:
	cmp r0, 0x9F
	bhi _0810D93C
	ldr r0, _0810D938 @ =gUnknown_081C4936
	b _0810D9EA
	.align 2, 0
_0810D938: .4byte gUnknown_081C4936
_0810D93C:
	cmp r0, 0xA9
	bhi _0810D948
	ldr r0, _0810D944 @ =gUnknown_081C49A2
	b _0810D9EA
	.align 2, 0
_0810D944: .4byte gUnknown_081C49A2
_0810D948:
	cmp r0, 0xB3
	bhi _0810D954
	ldr r0, _0810D950 @ =gUnknown_081C4A06
	b _0810D9EA
	.align 2, 0
_0810D950: .4byte gUnknown_081C4A06
_0810D954:
	cmp r0, 0xBD
	bhi _0810D960
	ldr r0, _0810D95C @ =gUnknown_081C4A4F
	b _0810D9EA
	.align 2, 0
_0810D95C: .4byte gUnknown_081C4A4F
_0810D960:
	cmp r0, 0xC7
	bls _0810D9CE
	cmp r0, 0xC8
	bne _0810D99C
	ldr r0, _0810D998 @ =0x00000199
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D9CE
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	bne _0810D9CE
	b _0810D9E8
	.align 2, 0
_0810D998: .4byte 0x00000199
_0810D99C:
	cmp r0, 0xC9
	bne _0810D9DC
	ldr r0, _0810D9D4 @ =0x00000199
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D9E8
	movs r0, 0xCD
	lsls r0, 1
	bl SpeciesToNationalPokedexNum
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	bl sub_8090D90
	lsls r0, 24
	cmp r0, 0
	beq _0810D9E8
_0810D9CE:
	ldr r0, _0810D9D8 @ =gUnknown_081C4A91
	b _0810D9EA
	.align 2, 0
_0810D9D4: .4byte 0x00000199
_0810D9D8: .4byte gUnknown_081C4A91
_0810D9DC:
	cmp r0, 0xCA
	beq _0810D9E8
_0810D9E0:
	ldr r0, _0810D9E4 @ =gUnknown_081C4520
	b _0810D9EA
	.align 2, 0
_0810D9E4: .4byte gUnknown_081C4520
_0810D9E8:
	ldr r0, _0810D9F0 @ =gUnknown_081C4ADA
_0810D9EA:
	pop {r1}
	bx r1
	.align 2, 0
_0810D9F0: .4byte gUnknown_081C4ADA
	thumb_func_end GetPokedexRatingText

	thumb_func_start ShowPokedexRatingMessage
ShowPokedexRatingMessage: @ 810D9F4
	push {lr}
	ldr r0, _0810DA08 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	bl GetPokedexRatingText
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0810DA08: .4byte gSpecialVar_0x8004
	thumb_func_end ShowPokedexRatingMessage

	thumb_func_start AccessHallOfFamePC
AccessHallOfFamePC: @ 810DA0C
	push {lr}
	ldr r0, _0810DA1C @ =sub_81428CC
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810DA1C: .4byte sub_81428CC
	thumb_func_end AccessHallOfFamePC

	thumb_func_start ReturnFromHallOfFamePC
ReturnFromHallOfFamePC: @ 810DA20
	push {lr}
	ldr r0, _0810DA34 @ =c2_exit_to_overworld_2_switch
	bl SetMainCallback2
	ldr r1, _0810DA38 @ =gUnknown_0300485C
	ldr r0, _0810DA3C @ =ReshowPCMenuAfterHallOfFamePC
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0810DA34: .4byte c2_exit_to_overworld_2_switch
_0810DA38: .4byte gUnknown_0300485C
_0810DA3C: .4byte ReshowPCMenuAfterHallOfFamePC
	thumb_func_end ReturnFromHallOfFamePC

	thumb_func_start ReshowPCMenuAfterHallOfFamePC
ReshowPCMenuAfterHallOfFamePC: @ 810DA40
	push {lr}
	sub sp, 0x4
	bl ScriptContext2_Enable
	bl sub_8053E90
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	bl sp109_CreatePCMenu
	bl sub_80B5838
	ldr r0, _0810DA74 @ =sub_810D684
	movs r1, 0xA
	bl CreateTask
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810DA74: .4byte sub_810D684
	thumb_func_end ReshowPCMenuAfterHallOfFamePC

	thumb_func_start sub_810D684
sub_810D684: @ 810DA78
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	ldr r0, _0810DA94 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0810DA90
	adds r0, r2, 0
	bl DestroyTask
_0810DA90:
	pop {r0}
	bx r0
	.align 2, 0
_0810DA94: .4byte gPaletteFade
	thumb_func_end sub_810D684

	thumb_func_start sub_810D6A4
sub_810D6A4: @ 810DA98
	push {lr}
	ldr r0, _0810DAA8 @ =sub_8145D88
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810DAA8: .4byte sub_8145D88
	thumb_func_end sub_810D6A4

	thumb_func_start sub_810D6B8
sub_810D6B8: @ 810DAAC
	push {lr}
	ldr r0, _0810DAC4 @ =gMain
	ldr r1, _0810DAC8 @ =c2_exit_to_overworld_2_switch
	str r1, [r0, 0x8]
	ldr r0, _0810DACC @ =Cb2_ViewWallClock
	bl SetMainCallback2
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_0810DAC4: .4byte gMain
_0810DAC8: .4byte c2_exit_to_overworld_2_switch
_0810DACC: .4byte Cb2_ViewWallClock
	thumb_func_end sub_810D6B8

	thumb_func_start ResetCyclingRoadChallengeData
ResetCyclingRoadChallengeData: @ 810DAD0
	ldr r0, _0810DAE4 @ =gUnknown_02039250
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0810DAE8 @ =gUnknown_02039251
	strb r1, [r0]
	ldr r1, _0810DAEC @ =gUnknown_02039254
	movs r0, 0
	str r0, [r1]
	bx lr
	.align 2, 0
_0810DAE4: .4byte gUnknown_02039250
_0810DAE8: .4byte gUnknown_02039251
_0810DAEC: .4byte gUnknown_02039254
	thumb_func_end ResetCyclingRoadChallengeData

	thumb_func_start BeginCyclingRoadChallenge
BeginCyclingRoadChallenge: @ 810DAF0
	ldr r1, _0810DB08 @ =gUnknown_02039250
	movs r0, 0x1
	strb r0, [r1]
	ldr r1, _0810DB0C @ =gUnknown_02039251
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0810DB10 @ =gUnknown_02039254
	ldr r0, _0810DB14 @ =gMain
	ldr r0, [r0, 0x20]
	str r0, [r1]
	bx lr
	.align 2, 0
_0810DB08: .4byte gUnknown_02039250
_0810DB0C: .4byte gUnknown_02039251
_0810DB10: .4byte gUnknown_02039254
_0810DB14: .4byte gMain
	thumb_func_end BeginCyclingRoadChallenge

	thumb_func_start GetPlayerAvatarBike
GetPlayerAvatarBike: @ 810DB18
	push {lr}
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0810DB2A
	movs r0, 0x1
	b _0810DB3C
_0810DB2A:
	movs r0, 0x2
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _0810DB3A
	movs r0, 0
	b _0810DB3C
_0810DB3A:
	movs r0, 0x2
_0810DB3C:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarBike

	thumb_func_start DetermineCyclingRoadResults
DetermineCyclingRoadResults: @ 810DB40
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	cmp r6, 0x63
	bhi _0810DB6C
	ldr r4, _0810DB64 @ =gStringVar1
	adds r0, r4, 0
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0810DB68 @ =gOtherText_Times
	adds r0, r4, 0
	bl StringAppend
	b _0810DB74
	.align 2, 0
_0810DB64: .4byte gStringVar1
_0810DB68: .4byte gOtherText_Times
_0810DB6C:
	ldr r0, _0810DBC0 @ =gStringVar1
	ldr r1, _0810DBC4 @ =gOtherText_99Times
	bl StringCopy
_0810DB74:
	ldr r0, _0810DBC8 @ =0x00000e0f
	cmp r7, r0
	bhi _0810DBD4
	ldr r4, _0810DBCC @ =gStringVar2
	adds r0, r7, 0
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	movs r0, 0xB8
	strb r0, [r4, 0x2]
	adds r5, r4, 0x3
	adds r0, r7, 0
	movs r1, 0x3C
	bl __umodsi3
	movs r1, 0x64
	muls r0, r1
	movs r1, 0x3C
	bl __udivsi3
	adds r1, r0, 0
	adds r0, r5, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r1, _0810DBD0 @ =gOtherText_Seconds
	adds r0, r4, 0
	bl StringAppend
	b _0810DBDC
	.align 2, 0
_0810DBC0: .4byte gStringVar1
_0810DBC4: .4byte gOtherText_99Times
_0810DBC8: .4byte 0x00000e0f
_0810DBCC: .4byte gStringVar2
_0810DBD0: .4byte gOtherText_Seconds
_0810DBD4:
	ldr r0, _0810DBE8 @ =gStringVar2
	ldr r1, _0810DBEC @ =gOtherText_1Minute
	bl StringCopy
_0810DBDC:
	movs r4, 0
	cmp r6, 0
	bne _0810DBF0
	movs r4, 0x5
	b _0810DC0E
	.align 2, 0
_0810DBE8: .4byte gStringVar2
_0810DBEC: .4byte gOtherText_1Minute
_0810DBF0:
	cmp r6, 0x3
	bhi _0810DBF8
	movs r4, 0x4
	b _0810DC0E
_0810DBF8:
	cmp r6, 0x9
	bhi _0810DC00
	movs r4, 0x3
	b _0810DC0E
_0810DC00:
	cmp r6, 0x13
	bhi _0810DC08
	movs r4, 0x2
	b _0810DC0E
_0810DC08:
	cmp r6, 0x63
	bhi _0810DC0E
	movs r4, 0x1
_0810DC0E:
	adds r0, r7, 0
	movs r1, 0x3C
	bl __udivsi3
	cmp r0, 0xA
	bhi _0810DC1E
	adds r0, r4, 0x5
	b _0810DC3C
_0810DC1E:
	cmp r0, 0xF
	bhi _0810DC26
	adds r0, r4, 0x4
	b _0810DC3C
_0810DC26:
	cmp r0, 0x14
	bhi _0810DC2E
	adds r0, r4, 0x3
	b _0810DC3C
_0810DC2E:
	cmp r0, 0x28
	bhi _0810DC36
	adds r0, r4, 0x2
	b _0810DC3C
_0810DC36:
	cmp r0, 0x3B
	bhi _0810DC40
	adds r0, r4, 0x1
_0810DC3C:
	lsls r0, 24
	lsrs r4, r0, 24
_0810DC40:
	ldr r0, _0810DC4C @ =gScriptResult
	strh r4, [r0]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810DC4C: .4byte gScriptResult
	thumb_func_end DetermineCyclingRoadResults

	thumb_func_start FinishCyclingRoadChallenge
FinishCyclingRoadChallenge: @ 810DC50
	push {r4,r5,lr}
	ldr r0, _0810DC74 @ =gMain
	ldr r1, _0810DC78 @ =gUnknown_02039254
	ldr r4, [r0, 0x20]
	ldr r0, [r1]
	subs r4, r0
	ldr r5, _0810DC7C @ =gUnknown_02039251
	ldrb r1, [r5]
	adds r0, r4, 0
	bl DetermineCyclingRoadResults
	ldrb r1, [r5]
	adds r0, r4, 0
	bl RecordCyclingRoadResults
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810DC74: .4byte gMain
_0810DC78: .4byte gUnknown_02039254
_0810DC7C: .4byte gUnknown_02039251
	thumb_func_end FinishCyclingRoadChallenge

	thumb_func_start RecordCyclingRoadResults
RecordCyclingRoadResults: @ 810DC80
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	ldr r6, _0810DCD4 @ =0x00004028
	adds r0, r6, 0
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r7, _0810DCD8 @ =0x00004029
	adds r0, r7, 0
	bl VarGet
	lsls r0, 16
	adds r4, r0
	cmp r4, r5
	bhi _0810DCB0
	cmp r4, 0
	bne _0810DCCA
_0810DCB0:
	lsls r1, r5, 16
	lsrs r1, 16
	adds r0, r6, 0
	bl VarSet
	lsrs r1, r5, 16
	adds r0, r7, 0
	bl VarSet
	ldr r0, _0810DCDC @ =0x00004027
	mov r1, r8
	bl VarSet
_0810DCCA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810DCD4: .4byte 0x00004028
_0810DCD8: .4byte 0x00004029
_0810DCDC: .4byte 0x00004027
	thumb_func_end RecordCyclingRoadResults

	thumb_func_start GetRecordedCyclingRoadResults
GetRecordedCyclingRoadResults: @ 810DCE0
	push {r4,lr}
	ldr r0, _0810DD14 @ =0x00004028
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _0810DD18 @ =0x00004029
	bl VarGet
	lsls r0, 16
	adds r4, r0
	cmp r4, 0
	beq _0810DD20
	ldr r0, _0810DD1C @ =0x00004027
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl DetermineCyclingRoadResults
	movs r0, 0x1
	b _0810DD22
	.align 2, 0
_0810DD14: .4byte 0x00004028
_0810DD18: .4byte 0x00004029
_0810DD1C: .4byte 0x00004027
_0810DD20:
	movs r0, 0
_0810DD22:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetRecordedCyclingRoadResults

	thumb_func_start UpdateCyclingRoadState
UpdateCyclingRoadState: @ 810DD28
	push {r4,lr}
	ldr r0, _0810DD68 @ =gUnknown_020297F0
	ldrh r1, [r0]
	ldr r0, _0810DD6C @ =0x00000c1d
	cmp r1, r0
	beq _0810DD60
	ldr r4, _0810DD70 @ =0x000040a9
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	beq _0810DD52
	adds r0, r4, 0
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x3
	bne _0810DD60
_0810DD52:
	adds r0, r4, 0
	movs r1, 0
	bl VarSet
	movs r0, 0
	bl sav1_set_battle_music_maybe
_0810DD60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810DD68: .4byte gUnknown_020297F0
_0810DD6C: .4byte 0x00000c1d
_0810DD70: .4byte 0x000040a9
	thumb_func_end UpdateCyclingRoadState

	thumb_func_start SetSSTidalFlag
SetSSTidalFlag: @ 810DD74
	push {lr}
	ldr r0, _0810DD8C @ =0x0000082d
	bl FlagSet
	ldr r0, _0810DD90 @ =0x0000404a
	bl GetVarPointer
	movs r1, 0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0810DD8C: .4byte 0x0000082d
_0810DD90: .4byte 0x0000404a
	thumb_func_end SetSSTidalFlag

	thumb_func_start ResetSSTidalFlag
ResetSSTidalFlag: @ 810DD94
	push {lr}
	ldr r0, _0810DDA0 @ =0x0000082d
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0810DDA0: .4byte 0x0000082d
	thumb_func_end ResetSSTidalFlag

	thumb_func_start sub_810D9B0
sub_810D9B0: @ 810DDA4
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _0810DDD0 @ =0x0000082d
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810DDCA
	ldr r0, _0810DDD4 @ =0x0000404a
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, r4, r1
	strh r1, [r0]
	lsls r1, 16
	lsrs r1, 16
	cmp r1, 0xCC
	bhi _0810DDD8
_0810DDCA:
	movs r0, 0
	b _0810DDDA
	.align 2, 0
_0810DDD0: .4byte 0x0000082d
_0810DDD4: .4byte 0x0000404a
_0810DDD8:
	movs r0, 0x1
_0810DDDA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810D9B0

	thumb_func_start sub_810D9EC
sub_810D9EC: @ 810DDE0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	ldr r0, _0810DE10 @ =0x0000404a
	bl GetVarPointer
	adds r4, r0, 0
	ldr r0, _0810DE14 @ =0x000040b4
	bl GetVarPointer
	ldrh r0, [r0]
	subs r0, 0x1
	cmp r0, 0x9
	bhi _0810DEA6
	lsls r0, 2
	ldr r1, _0810DE18 @ =_0810DE1C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810DE10: .4byte 0x0000404a
_0810DE14: .4byte 0x000040b4
_0810DE18: .4byte _0810DE1C
	.align 2, 0
_0810DE1C:
	.4byte _0810DE44
	.4byte _0810DE54
	.4byte _0810DE48
	.4byte _0810DE4C
	.4byte _0810DE4C
	.4byte _0810DE50
	.4byte _0810DE7C
	.4byte _0810DE44
	.4byte _0810DE48
	.4byte _0810DE50
_0810DE44:
	movs r0, 0x1
	b _0810DEB2
_0810DE48:
	movs r0, 0x4
	b _0810DEB2
_0810DE4C:
	movs r0, 0x2
	b _0810DEB2
_0810DE50:
	movs r0, 0x3
	b _0810DEB2
_0810DE54:
	ldrh r0, [r4]
	cmp r0, 0x3B
	bhi _0810DE64
	movs r0, 0x31
	strb r0, [r5]
	ldrh r0, [r4]
	adds r0, 0x13
	b _0810DEA4
_0810DE64:
	cmp r0, 0x8B
	bhi _0810DE72
	movs r0, 0x30
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x3C
	b _0810DEA4
_0810DE72:
	movs r0, 0x2F
	strb r0, [r5]
	ldrh r0, [r4]
	subs r0, 0x8C
	b _0810DEA4
_0810DE7C:
	ldrh r0, [r4]
	cmp r0, 0x41
	bhi _0810DE8C
	movs r0, 0x2F
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0x41
	b _0810DEA2
_0810DE8C:
	cmp r0, 0x91
	bhi _0810DE9A
	movs r0, 0x30
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0x91
	b _0810DEA2
_0810DE9A:
	movs r0, 0x31
	strb r0, [r5]
	ldrh r1, [r4]
	movs r0, 0xE0
_0810DEA2:
	subs r0, r1
_0810DEA4:
	strh r0, [r6]
_0810DEA6:
	movs r0, 0
	mov r1, r8
	strb r0, [r1]
	movs r0, 0x14
	strh r0, [r7]
	movs r0, 0
_0810DEB2:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_810D9EC

	thumb_func_start GetLinkPartnerNames
GetLinkPartnerNames: @ 810DEBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r6, 0
	bl sub_8008218
	lsls r0, 24
	lsrs r7, r0, 24
	bl sub_800820C
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810DF06
	ldr r0, _0810DF14 @ =gUnknown_083D1464
	mov r8, r0
_0810DEDE:
	cmp r7, r4
	beq _0810DEFC
	lsls r0, r6, 2
	add r0, r8
	ldr r0, [r0]
	lsls r1, r4, 3
	subs r1, r4
	lsls r1, 2
	ldr r2, _0810DF18 @ =0x03002988
	adds r1, r2
	bl StringCopy
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0810DEFC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810DEDE
_0810DF06:
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810DF14: .4byte gUnknown_083D1464
_0810DF18: .4byte 0x03002988
	thumb_func_end GetLinkPartnerNames

	thumb_func_start sub_810DB28
sub_810DB28: @ 810DF1C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x14
	movs r7, 0
	movs r0, 0
	mov r9, r0
	mov r8, r0
	ldr r1, _0810DF68 @ =gUnknown_083F8358
	add r0, sp, 0x8
	movs r2, 0x4
	bl memcpy
	add r4, sp, 0xC
	ldr r1, _0810DF6C @ =gUnknown_083F835C
	adds r0, r4, 0
	movs r2, 0x8
	bl memcpy
	bl sub_8008218
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x2
	beq _0810DF88
	cmp r0, 0x2
	bgt _0810DF70
	cmp r0, 0x1
	beq _0810DFB4
	b _0810DFC6
	.align 2, 0
_0810DF68: .4byte gUnknown_083F8358
_0810DF6C: .4byte gUnknown_083F835C
_0810DF70:
	cmp r1, 0x3
	beq _0810DF7A
	cmp r1, 0x4
	beq _0810DF9C
	b _0810DFC6
_0810DF7A:
	movs r7, 0x2
	ldr r1, _0810DF84 @ =gSaveBlock1
	ldrh r0, [r1]
	subs r0, 0x1
	b _0810DFA2
	.align 2, 0
_0810DF84: .4byte gSaveBlock1
_0810DF88:
	movs r7, 0x1
	ldr r0, _0810DF98 @ =gSaveBlock1
	ldrh r1, [r0]
	mov r9, r1
	ldrh r0, [r0, 0x2]
	subs r0, 0x1
	b _0810DFC0
	.align 2, 0
_0810DF98: .4byte gSaveBlock1
_0810DF9C:
	ldr r1, _0810DFB0 @ =gSaveBlock1
	ldrh r0, [r1]
	adds r0, 0x1
_0810DFA2:
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	ldrh r1, [r1, 0x2]
	mov r8, r1
	b _0810DFC6
	.align 2, 0
_0810DFB0: .4byte gSaveBlock1
_0810DFB4:
	movs r7, 0x3
	ldr r0, _0810DFCC @ =gSaveBlock1
	ldrh r4, [r0]
	mov r9, r4
	ldrh r0, [r0, 0x2]
	adds r0, 0x1
_0810DFC0:
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
_0810DFC6:
	movs r6, 0
	b _0810E050
	.align 2, 0
_0810DFCC: .4byte gSaveBlock1
_0810DFD0:
	cmp r10, r6
	beq _0810E04A
	ldr r1, _0810E068 @ =gLinkPlayers
	lsls r0, r6, 3
	subs r0, r6
	lsls r0, 2
	adds r0, r1
	ldrb r1, [r0, 0x13]
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	adds r1, r7
	adds r1, 0x8
	ldrb r1, [r1]
	movs r2, 0xF0
	subs r2, r6
	lsls r2, 24
	lsrs r2, 24
	lsls r5, r7, 1
	mov r3, sp
	adds r3, r5
	adds r3, 0xC
	ldrb r3, [r3]
	lsls r3, 24
	asrs r3, 24
	mov r12, r3
	mov r4, r9
	lsls r3, r4, 16
	asrs r3, 16
	add r3, r12
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	mov r4, sp
	adds r4, 0xD
	adds r4, r5
	ldrb r4, [r4]
	lsls r4, 24
	asrs r4, 24
	mov r12, r4
	mov r5, r8
	lsls r4, r5, 16
	asrs r4, 16
	add r4, r12
	adds r4, 0x7
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	movs r4, 0
	str r4, [sp, 0x4]
	bl SpawnSpecialFieldObjectParametrized
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x4
	bne _0810E04A
	movs r7, 0
_0810E04A:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0810E050:
	ldr r0, _0810E06C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r6, r0
	bcc _0810DFD0
	add sp, 0x14
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810E068: .4byte gLinkPlayers
_0810E06C: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810DB28

	thumb_func_start sub_810DC7C
sub_810DC7C: @ 810E070
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810E090 @ =gUnknown_083F8364
_0810E076:
	ldr r0, _0810E094 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r4, r0
	bne _0810E09C
	lsls r1, r4, 2
	adds r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	ldr r2, _0810E098 @ =0x00000206
	bl MapGridSetMetatileIdAt
	b _0810E0AA
	.align 2, 0
_0810E090: .4byte gUnknown_083F8364
_0810E094: .4byte gSpecialVar_0x8004
_0810E098: .4byte 0x00000206
_0810E09C:
	lsls r1, r4, 2
	adds r1, r5
	ldrb r0, [r1]
	ldrb r1, [r1, 0x1]
	ldr r2, _0810E0BC @ =0x00000205
	bl MapGridSetMetatileIdAt
_0810E0AA:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2
	bls _0810E076
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E0BC: .4byte 0x00000205
	thumb_func_end sub_810DC7C

	thumb_func_start sub_810DCCC
sub_810DCCC: @ 810E0C0
	push {r4-r6,lr}
	movs r5, 0xC
_0810E0C4:
	movs r4, 0x7
	adds r6, r5, 0x1
_0810E0C8:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0810E0E4 @ =0xfffffde6
	adds r0, r1
	cmp r0, 0x37
	bls _0810E0DA
	b _0810E2B4
_0810E0DA:
	lsls r0, 2
	ldr r1, _0810E0E8 @ =_0810E0EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810E0E4: .4byte 0xfffffde6
_0810E0E8: .4byte _0810E0EC
	.align 2, 0
_0810E0EC:
	.4byte _0810E272
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E1CC
	.4byte _0810E1D2
	.4byte _0810E20C
	.4byte _0810E214
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E1DC
	.4byte _0810E1E2
	.4byte _0810E21C
	.4byte _0810E224
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E1EC
	.4byte _0810E1F2
	.4byte _0810E22C
	.4byte _0810E234
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E1FC
	.4byte _0810E204
	.4byte _0810E23C
	.4byte _0810E244
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E24C
	.4byte _0810E25C
	.4byte _0810E26C
	.4byte _0810E294
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E254
	.4byte _0810E264
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2B4
	.4byte _0810E2AA
	.4byte _0810E29C
_0810E1CC:
	movs r2, 0x8C
	lsls r2, 2
	b _0810E2A0
_0810E1D2:
	ldr r2, _0810E1D8 @ =0x00000231
	b _0810E2A0
	.align 2, 0
_0810E1D8: .4byte 0x00000231
_0810E1DC:
	movs r2, 0x8E
	lsls r2, 2
	b _0810E2A0
_0810E1E2:
	ldr r2, _0810E1E8 @ =0x00000239
	b _0810E2A0
	.align 2, 0
_0810E1E8: .4byte 0x00000239
_0810E1EC:
	movs r2, 0x88
	lsls r2, 2
	b _0810E2A0
_0810E1F2:
	ldr r2, _0810E1F8 @ =0x00000221
	b _0810E2A0
	.align 2, 0
_0810E1F8: .4byte 0x00000221
_0810E1FC:
	ldr r2, _0810E200 @ =0x00000e28
	b _0810E2A0
	.align 2, 0
_0810E200: .4byte 0x00000e28
_0810E204:
	ldr r2, _0810E208 @ =0x00000e29
	b _0810E2A0
	.align 2, 0
_0810E208: .4byte 0x00000e29
_0810E20C:
	ldr r2, _0810E210 @ =0x00000232
	b _0810E2A0
	.align 2, 0
_0810E210: .4byte 0x00000232
_0810E214:
	ldr r2, _0810E218 @ =0x00000233
	b _0810E2A0
	.align 2, 0
_0810E218: .4byte 0x00000233
_0810E21C:
	ldr r2, _0810E220 @ =0x0000023a
	b _0810E2A0
	.align 2, 0
_0810E220: .4byte 0x0000023a
_0810E224:
	ldr r2, _0810E228 @ =0x0000023b
	b _0810E2A0
	.align 2, 0
_0810E228: .4byte 0x0000023b
_0810E22C:
	ldr r2, _0810E230 @ =0x00000222
	b _0810E2A0
	.align 2, 0
_0810E230: .4byte 0x00000222
_0810E234:
	ldr r2, _0810E238 @ =0x00000223
	b _0810E2A0
	.align 2, 0
_0810E238: .4byte 0x00000223
_0810E23C:
	ldr r2, _0810E240 @ =0x00000e2a
	b _0810E2A0
	.align 2, 0
_0810E240: .4byte 0x00000e2a
_0810E244:
	ldr r2, _0810E248 @ =0x00000e2b
	b _0810E2A0
	.align 2, 0
_0810E248: .4byte 0x00000e2b
_0810E24C:
	ldr r2, _0810E250 @ =0x00000e42
	b _0810E2A0
	.align 2, 0
_0810E250: .4byte 0x00000e42
_0810E254:
	ldr r2, _0810E258 @ =0x0000021a
	b _0810E2A0
	.align 2, 0
_0810E258: .4byte 0x0000021a
_0810E25C:
	ldr r2, _0810E260 @ =0x00000e43
	b _0810E2A0
	.align 2, 0
_0810E260: .4byte 0x00000e43
_0810E264:
	ldr r2, _0810E268 @ =0x0000021a
	b _0810E2A0
	.align 2, 0
_0810E268: .4byte 0x0000021a
_0810E26C:
	movs r2, 0xE4
	lsls r2, 4
	b _0810E2A0
_0810E272:
	subs r1, r5, 0x1
	adds r0, r4, 0
	bl MapGridGetMetatileIdAt
	movs r1, 0x90
	lsls r1, 2
	cmp r0, r1
	bne _0810E28C
	ldr r2, _0810E288 @ =0x00000e48
	b _0810E2A0
	.align 2, 0
_0810E288: .4byte 0x00000e48
_0810E28C:
	ldr r2, _0810E290 @ =0x00000e49
	b _0810E2A0
	.align 2, 0
_0810E290: .4byte 0x00000e49
_0810E294:
	ldr r2, _0810E298 @ =0x00000e41
	b _0810E2A0
	.align 2, 0
_0810E298: .4byte 0x00000e41
_0810E29C:
	movs r2, 0xE5
	lsls r2, 4
_0810E2A0:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _0810E2B4
_0810E2AA:
	ldr r2, _0810E2CC @ =0x00000251
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0810E2B4:
	adds r4, 0x1
	cmp r4, 0xF
	bgt _0810E2BC
	b _0810E0C8
_0810E2BC:
	adds r5, r6, 0
	cmp r5, 0x17
	bgt _0810E2C4
	b _0810E0C4
_0810E2C4:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E2CC: .4byte 0x00000251
	thumb_func_end sub_810DCCC

	thumb_func_start sub_810DEDC
sub_810DEDC: @ 810E2D0
	push {r4-r6,lr}
	ldr r4, _0810E30C @ =gUnknown_083F8364
	movs r5, 0x2
_0810E2D6:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	ldr r2, _0810E310 @ =0x00000206
	bl MapGridSetMetatileIdAt
	adds r4, 0x4
	subs r5, 0x1
	cmp r5, 0
	bge _0810E2D6
	movs r5, 0xC
_0810E2EA:
	movs r4, 0x7
	adds r6, r5, 0x1
_0810E2EE:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0810E314 @ =0xfffffde0
	adds r0, r1
	cmp r0, 0x30
	bls _0810E300
	b _0810E44A
_0810E300:
	lsls r0, 2
	ldr r1, _0810E318 @ =_0810E31C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810E30C: .4byte gUnknown_083F8364
_0810E310: .4byte 0x00000206
_0810E314: .4byte 0xfffffde0
_0810E318: .4byte _0810E31C
	.align 2, 0
_0810E31C:
	.4byte _0810E3E0
	.4byte _0810E3E6
	.4byte _0810E400
	.4byte _0810E408
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E3F0
	.4byte _0810E3F6
	.4byte _0810E410
	.4byte _0810E418
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E420
	.4byte _0810E428
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E430
	.4byte _0810E430
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E44A
	.4byte _0810E440
_0810E3E0:
	movs r2, 0x8C
	lsls r2, 2
	b _0810E432
_0810E3E6:
	ldr r2, _0810E3EC @ =0x00000231
	b _0810E432
	.align 2, 0
_0810E3EC: .4byte 0x00000231
_0810E3F0:
	movs r2, 0x8E
	lsls r2, 2
	b _0810E432
_0810E3F6:
	ldr r2, _0810E3FC @ =0x00000239
	b _0810E432
	.align 2, 0
_0810E3FC: .4byte 0x00000239
_0810E400:
	ldr r2, _0810E404 @ =0x00000232
	b _0810E432
	.align 2, 0
_0810E404: .4byte 0x00000232
_0810E408:
	ldr r2, _0810E40C @ =0x00000233
	b _0810E432
	.align 2, 0
_0810E40C: .4byte 0x00000233
_0810E410:
	ldr r2, _0810E414 @ =0x0000023a
	b _0810E432
	.align 2, 0
_0810E414: .4byte 0x0000023a
_0810E418:
	ldr r2, _0810E41C @ =0x0000023b
	b _0810E432
	.align 2, 0
_0810E41C: .4byte 0x0000023b
_0810E420:
	ldr r2, _0810E424 @ =0x00000e42
	b _0810E432
	.align 2, 0
_0810E424: .4byte 0x00000e42
_0810E428:
	ldr r2, _0810E42C @ =0x00000e43
	b _0810E432
	.align 2, 0
_0810E42C: .4byte 0x00000e43
_0810E430:
	ldr r2, _0810E43C @ =0x0000021a
_0810E432:
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _0810E44A
	.align 2, 0
_0810E43C: .4byte 0x0000021a
_0810E440:
	ldr r2, _0810E460 @ =0x00000251
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_0810E44A:
	adds r4, 0x1
	cmp r4, 0xF
	bgt _0810E452
	b _0810E2EE
_0810E452:
	adds r5, r6, 0
	cmp r5, 0x17
	bgt _0810E45A
	b _0810E2EA
_0810E45A:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810E460: .4byte 0x00000251
	thumb_func_end sub_810DEDC

	thumb_func_start sub_810E070
sub_810E070: @ 810E464
	push {lr}
	ldr r0, _0810E484 @ =gUnknown_02039258
	movs r1, 0
	strb r1, [r0]
	ldr r0, _0810E488 @ =gUnknown_02039259
	strb r1, [r0]
	movs r0, 0x2C
	bl PlaySE
	ldr r0, _0810E48C @ =sub_810E09C
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0810E484: .4byte gUnknown_02039258
_0810E488: .4byte gUnknown_02039259
_0810E48C: .4byte sub_810E09C
	thumb_func_end sub_810E070

	thumb_func_start sub_810E09C
sub_810E09C: @ 810E490
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0810E4D8 @ =gUnknown_083F8370
	ldr r5, _0810E4DC @ =gUnknown_02039259
	ldrb r1, [r5]
	adds r0, r1, r0
	ldr r4, _0810E4E0 @ =gUnknown_02039258
	ldrb r2, [r4]
	ldrb r0, [r0]
	cmp r0, r2
	bne _0810E4EC
	ldr r0, _0810E4E4 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	ldr r2, _0810E4E8 @ =gUnknown_083F8376
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	bl sub_810E104
	movs r0, 0
	strb r0, [r4]
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _0810E4F0
	adds r0, r6, 0
	bl DestroyTask
	bl EnableBothScriptContexts
	b _0810E4F0
	.align 2, 0
_0810E4D8: .4byte gUnknown_083F8370
_0810E4DC: .4byte gUnknown_02039259
_0810E4E0: .4byte gUnknown_02039258
_0810E4E4: .4byte gSpecialVar_0x8004
_0810E4E8: .4byte gUnknown_083F8376
_0810E4EC:
	adds r0, r2, 0x1
	strb r0, [r4]
_0810E4F0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_810E09C

	thumb_func_start sub_810E104
sub_810E104: @ 810E4F8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x10
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r2, r1, 16
	movs r7, 0
	subs r0, 0x1
	cmp r0, 0x7
	bhi _0810E5C0
	lsls r0, 2
	ldr r1, _0810E51C @ =_0810E520
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810E51C: .4byte _0810E520
	.align 2, 0
_0810E520:
	.4byte _0810E540
	.4byte _0810E552
	.4byte _0810E564
	.4byte _0810E576
	.4byte _0810E584
	.4byte _0810E59A
	.4byte _0810E5A6
	.4byte _0810E5B4
_0810E540:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x68
	b _0810E594
_0810E552:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x4E
	b _0810E594
_0810E564:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x5B
	b _0810E594
_0810E576:
	movs r7, 0x1
	mov r1, sp
	movs r0, 0x7
	strh r0, [r1]
	add r1, sp, 0x8
	movs r0, 0x27
	b _0810E5BE
_0810E584:
	movs r7, 0x2
	mov r1, sp
	movs r0, 0x1
	strh r0, [r1]
	movs r0, 0x7
	strh r0, [r1, 0x2]
	add r1, sp, 0x8
	movs r0, 0x34
_0810E594:
	strh r0, [r1]
	strh r0, [r1, 0x2]
	b _0810E5C0
_0810E59A:
	movs r7, 0x1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, 0x8
	movs r0, 0x41
	b _0810E5BE
_0810E5A6:
	movs r7, 0x1
	mov r1, sp
	movs r0, 0x7
	strh r0, [r1]
	add r1, sp, 0x8
	movs r0, 0xD
	b _0810E5BE
_0810E5B4:
	movs r7, 0x1
	mov r0, sp
	strh r7, [r0]
	add r1, sp, 0x8
	movs r0, 0x1A
_0810E5BE:
	strh r0, [r1]
_0810E5C0:
	movs r6, 0
	cmp r6, r7
	bcs _0810E612
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r1, r2, 0
	orrs r1, r0
	lsls r1, 16
	mov r9, r1
	adds r1, r2, 0
	adds r1, 0x8
	orrs r1, r0
	lsls r1, 16
	mov r8, r1
_0810E5DE:
	lsls r1, r6, 1
	mov r3, sp
	adds r5, r3, r1
	ldrh r0, [r5]
	adds r0, 0x7
	add r4, sp, 0x8
	adds r4, r1
	ldrh r1, [r4]
	adds r1, 0x7
	mov r3, r9
	lsrs r2, r3, 16
	bl MapGridSetMetatileIdAt
	ldrh r0, [r5]
	adds r0, 0x7
	ldrh r1, [r4]
	adds r1, 0x8
	mov r3, r8
	lsrs r2, r3, 16
	bl MapGridSetMetatileIdAt
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, r7
	bcc _0810E5DE
_0810E612:
	bl DrawWholeMapView
	add sp, 0x10
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810E104

	thumb_func_start sub_810E230
sub_810E230: @ 810E624
	push {lr}
	ldr r0, _0810E638 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	ldr r1, _0810E63C @ =gUnknown_083F8376
	ldrh r1, [r1, 0x8]
	bl sub_810E104
	pop {r0}
	bx r0
	.align 2, 0
_0810E638: .4byte gSpecialVar_0x8004
_0810E63C: .4byte gUnknown_083F8376
	thumb_func_end sub_810E230

	thumb_func_start ShowFieldMessageStringVar4
ShowFieldMessageStringVar4: @ 810E640
	push {lr}
	ldr r0, _0810E64C @ =gStringVar4
	bl ShowFieldMessage
	pop {r0}
	bx r0
	.align 2, 0
_0810E64C: .4byte gStringVar4
	thumb_func_end ShowFieldMessageStringVar4

	thumb_func_start StorePlayerCoordsInVars
StorePlayerCoordsInVars: @ 810E650
	ldr r1, _0810E660 @ =gSpecialVar_0x8004
	ldr r2, _0810E664 @ =gSaveBlock1
	ldrh r0, [r2]
	strh r0, [r1]
	ldr r1, _0810E668 @ =gSpecialVar_0x8005
	ldrh r0, [r2, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0810E660: .4byte gSpecialVar_0x8004
_0810E664: .4byte gSaveBlock1
_0810E668: .4byte gSpecialVar_0x8005
	thumb_func_end StorePlayerCoordsInVars

	thumb_func_start GetPlayerTrainerIdOnesDigit
GetPlayerTrainerIdOnesDigit: @ 810E66C
	push {lr}
	ldr r0, _0810E688 @ =gSaveBlock2
	ldrb r1, [r0, 0xB]
	lsls r1, 8
	ldrb r0, [r0, 0xA]
	orrs r0, r1
	movs r1, 0xA
	bl __umodsi3
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810E688: .4byte gSaveBlock2
	thumb_func_end GetPlayerTrainerIdOnesDigit

	thumb_func_start GetPlayerBigGuyGirlString
GetPlayerBigGuyGirlString: @ 810E68C
	push {lr}
	ldr r0, _0810E6A0 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810E6AC
	ldr r0, _0810E6A4 @ =gStringVar1
	ldr r1, _0810E6A8 @ =gOtherText_BigGuy
	bl StringCopy
	b _0810E6B4
	.align 2, 0
_0810E6A0: .4byte gSaveBlock2
_0810E6A4: .4byte gStringVar1
_0810E6A8: .4byte gOtherText_BigGuy
_0810E6AC:
	ldr r0, _0810E6B8 @ =gStringVar1
	ldr r1, _0810E6BC @ =gOtherText_BigGirl
	bl StringCopy
_0810E6B4:
	pop {r0}
	bx r0
	.align 2, 0
_0810E6B8: .4byte gStringVar1
_0810E6BC: .4byte gOtherText_BigGirl
	thumb_func_end GetPlayerBigGuyGirlString

	thumb_func_start GetRivalSonDaughterString
GetRivalSonDaughterString: @ 810E6C0
	push {lr}
	ldr r0, _0810E6D4 @ =gSaveBlock2
	ldrb r0, [r0, 0x8]
	cmp r0, 0
	bne _0810E6E0
	ldr r0, _0810E6D8 @ =gStringVar1
	ldr r1, _0810E6DC @ =gOtherText_Daughter
	bl StringCopy
	b _0810E6E8
	.align 2, 0
_0810E6D4: .4byte gSaveBlock2
_0810E6D8: .4byte gStringVar1
_0810E6DC: .4byte gOtherText_Daughter
_0810E6E0:
	ldr r0, _0810E6EC @ =gStringVar1
	ldr r1, _0810E6F0 @ =gOtherText_Son
	bl StringCopy
_0810E6E8:
	pop {r0}
	bx r0
	.align 2, 0
_0810E6EC: .4byte gStringVar1
_0810E6F0: .4byte gOtherText_Son
	thumb_func_end GetRivalSonDaughterString

	thumb_func_start sub_810E300
sub_810E300: @ 810E6F4
	ldr r0, _0810E6FC @ =gUnknown_02024D26
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0810E6FC: .4byte gUnknown_02024D26
	thumb_func_end sub_810E300

	thumb_func_start CableCarWarp
CableCarWarp: @ 810E700
	push {lr}
	sub sp, 0x4
	ldr r0, _0810E720 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	beq _0810E724
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0
	movs r3, 0x6
	bl warp1_set
	b _0810E736
	.align 2, 0
_0810E720: .4byte gSpecialVar_0x8004
_0810E724:
	movs r2, 0x1
	negs r2, r2
	movs r0, 0x4
	str r0, [sp]
	movs r0, 0x13
	movs r1, 0x1
	movs r3, 0x6
	bl warp1_set
_0810E736:
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end CableCarWarp

	thumb_func_start SetFlagInVar
SetFlagInVar: @ 810E73C
	push {lr}
	ldr r0, _0810E74C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810E74C: .4byte gSpecialVar_0x8004
	thumb_func_end SetFlagInVar

	thumb_func_start GetWeekCount
GetWeekCount: @ 810E750
	push {lr}
	ldr r0, _0810E770 @ =gLocalTime
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r1, 0x7
	bl __divsi3
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _0810E774 @ =0x0000270f
	cmp r0, r1
	bls _0810E76A
	adds r0, r1, 0
_0810E76A:
	pop {r1}
	bx r1
	.align 2, 0
_0810E770: .4byte gLocalTime
_0810E774: .4byte 0x0000270f
	thumb_func_end GetWeekCount

	thumb_func_start GetLeadMonFriendshipScore
GetLeadMonFriendshipScore: @ 810E778
	push {r4,lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r1, r0
	ldr r0, _0810E79C @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0xFF
	bne _0810E7A0
	movs r0, 0x6
	b _0810E7F2
	.align 2, 0
_0810E79C: .4byte gPlayerParty
_0810E7A0:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0xC7
	bls _0810E7B0
	movs r0, 0x5
	b _0810E7F2
_0810E7B0:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x95
	bls _0810E7C0
	movs r0, 0x4
	b _0810E7F2
_0810E7C0:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x63
	bls _0810E7D0
	movs r0, 0x3
	b _0810E7F2
_0810E7D0:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0x31
	bls _0810E7E0
	movs r0, 0x2
	b _0810E7F2
_0810E7E0:
	adds r0, r4, 0
	movs r1, 0x20
	bl GetMonData
	cmp r0, 0
	bne _0810E7F0
	movs r0, 0
	b _0810E7F2
_0810E7F0:
	movs r0, 0x1
_0810E7F2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonFriendshipScore

	thumb_func_start CB2_FieldShowRegionMap
CB2_FieldShowRegionMap: @ 810E7F8
	push {lr}
	ldr r0, _0810E804 @ =c2_exit_to_overworld_1_continue_scripts_restart_music
	bl FieldInitRegionMap
	pop {r0}
	bx r0
	.align 2, 0
_0810E804: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end CB2_FieldShowRegionMap

	thumb_func_start FieldShowRegionMap
FieldShowRegionMap: @ 810E808
	push {lr}
	ldr r0, _0810E814 @ =CB2_FieldShowRegionMap
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0810E814: .4byte CB2_FieldShowRegionMap
	thumb_func_end FieldShowRegionMap

	thumb_func_start DoPCTurnOnEffect
DoPCTurnOnEffect: @ 810E818
	push {r4,lr}
	ldr r4, _0810E854 @ =Task_PCTurnOnEffect
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810E84C
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810E858 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810E84C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810E854: .4byte Task_PCTurnOnEffect
_0810E858: .4byte gTasks
	thumb_func_end DoPCTurnOnEffect

	thumb_func_start Task_PCTurnOnEffect
Task_PCTurnOnEffect: @ 810E85C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0810E880 @ =gTasks
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0810E87A
	adds r0, r1, 0
	bl PCTurnOffEffect_0
_0810E87A:
	pop {r0}
	bx r0
	.align 2, 0
_0810E880: .4byte gTasks
	thumb_func_end Task_PCTurnOnEffect

	thumb_func_start PCTurnOffEffect_0
PCTurnOffEffect_0: @ 810E884
	push {r4-r6,lr}
	adds r4, r0, 0
	movs r6, 0
	movs r5, 0
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bne _0810E8F0
	strh r5, [r4, 0xE]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _0810E8B8
	cmp r0, 0x3
	bgt _0810E8AE
	cmp r0, 0x2
	beq _0810E8B4
	b _0810E8C0
_0810E8AE:
	cmp r1, 0x4
	beq _0810E8BC
	b _0810E8C0
_0810E8B4:
	movs r6, 0
	b _0810E8BE
_0810E8B8:
	movs r6, 0xFF
	b _0810E8BE
_0810E8BC:
	movs r6, 0x1
_0810E8BE:
	movs r5, 0xFF
_0810E8C0:
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	lsls r1, r6, 24
	asrs r1, 24
	lsls r2, r5, 24
	asrs r2, 24
	bl PCTurnOffEffect_1
	bl DrawWholeMapView
	ldrh r0, [r4, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0810E8F0
	ldrb r0, [r4, 0xA]
	bl DestroyTask
_0810E8F0:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end PCTurnOffEffect_0

	thumb_func_start PCTurnOffEffect_1
PCTurnOffEffect_1: @ 810E8FC
	push {r4,r5,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r3, 0
	lsls r0, 16
	cmp r0, 0
	beq _0810E938
	ldr r0, _0810E91C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E920
	movs r3, 0x4
	b _0810E95A
	.align 2, 0
_0810E91C: .4byte gSpecialVar_0x8004
_0810E920:
	cmp r0, 0x1
	bne _0810E92C
	ldr r3, _0810E928 @ =0x0000025a
	b _0810E95A
	.align 2, 0
_0810E928: .4byte 0x0000025a
_0810E92C:
	cmp r0, 0x2
	bne _0810E95A
	ldr r3, _0810E934 @ =0x00000259
	b _0810E95A
	.align 2, 0
_0810E934: .4byte 0x00000259
_0810E938:
	ldr r0, _0810E944 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E948
	movs r3, 0x5
	b _0810E95A
	.align 2, 0
_0810E944: .4byte gSpecialVar_0x8004
_0810E948:
	cmp r0, 0x1
	bne _0810E954
	ldr r3, _0810E950 @ =0x0000027f
	b _0810E95A
	.align 2, 0
_0810E950: .4byte 0x0000027f
_0810E954:
	cmp r0, 0x2
	bne _0810E95A
	ldr r3, _0810E988 @ =0x0000027e
_0810E95A:
	ldr r2, _0810E98C @ =gSaveBlock1
	movs r5, 0
	ldrsh r0, [r2, r5]
	lsls r1, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r5, 0x2
	ldrsh r1, [r2, r5]
	lsls r2, r4, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r4, 0xC0
	lsls r4, 4
	adds r2, r4, 0
	orrs r3, r2
	adds r2, r3, 0
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E988: .4byte 0x0000027e
_0810E98C: .4byte gSaveBlock1
	thumb_func_end PCTurnOffEffect_1

	thumb_func_start DoPCTurnOffEffect
DoPCTurnOffEffect: @ 810E990
	push {lr}
	bl PCTurnOffEffect
	pop {r0}
	bx r0
	thumb_func_end DoPCTurnOffEffect

	thumb_func_start PCTurnOffEffect
PCTurnOffEffect: @ 810E99C
	push {r4-r6,lr}
	movs r6, 0
	movs r5, 0
	movs r4, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x3
	beq _0810E9C6
	cmp r0, 0x3
	bgt _0810E9BC
	cmp r0, 0x2
	beq _0810E9C2
	b _0810E9CE
_0810E9BC:
	cmp r1, 0x4
	beq _0810E9CA
	b _0810E9CE
_0810E9C2:
	movs r6, 0
	b _0810E9CC
_0810E9C6:
	movs r6, 0xFF
	b _0810E9CC
_0810E9CA:
	movs r6, 0x1
_0810E9CC:
	movs r5, 0xFF
_0810E9CE:
	ldr r0, _0810E9DC @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	cmp r0, 0
	bne _0810E9E0
	movs r4, 0x4
	b _0810E9F2
	.align 2, 0
_0810E9DC: .4byte gSpecialVar_0x8004
_0810E9E0:
	cmp r0, 0x1
	bne _0810E9EC
	ldr r4, _0810E9E8 @ =0x0000025a
	b _0810E9F2
	.align 2, 0
_0810E9E8: .4byte 0x0000025a
_0810E9EC:
	cmp r0, 0x2
	bne _0810E9F2
	ldr r4, _0810EA24 @ =0x00000259
_0810E9F2:
	ldr r2, _0810EA28 @ =gSaveBlock1
	movs r1, 0
	ldrsh r0, [r2, r1]
	lsls r1, r6, 24
	asrs r1, 24
	adds r0, r1
	adds r0, 0x7
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	lsls r2, r5, 24
	asrs r2, 24
	adds r1, r2
	adds r1, 0x7
	movs r3, 0xC0
	lsls r3, 4
	adds r2, r3, 0
	orrs r4, r2
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810EA24: .4byte 0x00000259
_0810EA28: .4byte gSaveBlock1
	thumb_func_end PCTurnOffEffect

	thumb_func_start DoLotteryCornerComputerEffect
DoLotteryCornerComputerEffect: @ 810EA2C
	push {r4,lr}
	ldr r4, _0810EA68 @ =Task_LotteryCornerComputerEffect
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810EA60
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810EA6C @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810EA60:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EA68: .4byte Task_LotteryCornerComputerEffect
_0810EA6C: .4byte gTasks
	thumb_func_end DoLotteryCornerComputerEffect

	thumb_func_start Task_LotteryCornerComputerEffect
Task_LotteryCornerComputerEffect: @ 810EA70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0810EA94 @ =gTasks
	adds r1, r0
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0810EA8E
	adds r0, r1, 0
	bl LotteryCornerComputerEffect
_0810EA8E:
	pop {r0}
	bx r0
	.align 2, 0
_0810EA94: .4byte gTasks
	thumb_func_end Task_LotteryCornerComputerEffect

	thumb_func_start LotteryCornerComputerEffect
LotteryCornerComputerEffect: @ 810EA98
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bne _0810EB06
	movs r0, 0
	strh r0, [r4, 0xE]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0810EAD0
	ldr r2, _0810EAC8 @ =0x00000e9d
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EACC @ =0x00000ea5
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	b _0810EAE6
	.align 2, 0
_0810EAC8: .4byte 0x00000e9d
_0810EACC: .4byte 0x00000ea5
_0810EAD0:
	ldr r2, _0810EB14 @ =0x00000e58
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	movs r2, 0xE6
	lsls r2, 4
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
_0810EAE6:
	bl DrawWholeMapView
	ldrh r0, [r4, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r4, 0x10]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x5
	bne _0810EB06
	ldrb r0, [r4, 0xA]
	bl DestroyTask
_0810EB06:
	ldrh r0, [r4, 0xE]
	adds r0, 0x1
	strh r0, [r4, 0xE]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810EB14: .4byte 0x00000e58
	thumb_func_end LotteryCornerComputerEffect

	thumb_func_start EndLotteryCornerComputerEffect
EndLotteryCornerComputerEffect: @ 810EB18
	push {lr}
	ldr r2, _0810EB38 @ =0x00000e9d
	movs r0, 0x12
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810EB3C @ =0x00000ea5
	movs r0, 0x12
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	bl DrawWholeMapView
	pop {r0}
	bx r0
	.align 2, 0
_0810EB38: .4byte 0x00000e9d
_0810EB3C: .4byte 0x00000ea5
	thumb_func_end EndLotteryCornerComputerEffect

	thumb_func_start SetDepartmentStoreFloorVar
SetDepartmentStoreFloorVar: @ 810EB40
	push {lr}
	ldr r0, _0810EB5C @ =gSaveBlock1
	ldrb r0, [r0, 0x15]
	subs r0, 0x11
	lsls r0, 24
	asrs r0, 24
	cmp r0, 0x5
	bhi _0810EB90
	lsls r0, 2
	ldr r1, _0810EB60 @ =_0810EB64
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810EB5C: .4byte gSaveBlock1
_0810EB60: .4byte _0810EB64
	.align 2, 0
_0810EB64:
	.4byte _0810EB90
	.4byte _0810EB7C
	.4byte _0810EB80
	.4byte _0810EB84
	.4byte _0810EB88
	.4byte _0810EB8C
_0810EB7C:
	movs r1, 0x1
	b _0810EB92
_0810EB80:
	movs r1, 0x2
	b _0810EB92
_0810EB84:
	movs r1, 0x3
	b _0810EB92
_0810EB88:
	movs r1, 0x4
	b _0810EB92
_0810EB8C:
	movs r1, 0xF
	b _0810EB92
_0810EB90:
	movs r1, 0
_0810EB92:
	ldr r0, _0810EB9C @ =0x00004043
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0810EB9C: .4byte 0x00004043
	thumb_func_end SetDepartmentStoreFloorVar

	thumb_func_start ScriptAddElevatorMenuItem
ScriptAddElevatorMenuItem: @ 810EBA0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r12, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, _0810EC10 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	adds r2, r0, 0
	ldr r3, _0810EC14 @ =gUnknown_03000760
	cmp r1, 0
	bne _0810EBDC
	movs r1, 0
	adds r5, r3, 0
	movs r4, 0x10
_0810EBCC:
	lsls r0, r1, 2
	adds r0, r5
	strb r4, [r0]
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x13
	bls _0810EBCC
_0810EBDC:
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	strb r6, [r0]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	strb r7, [r0, 0x1]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	mov r1, r12
	strb r1, [r0, 0x2]
	ldrh r0, [r2]
	lsls r0, 2
	adds r0, r3
	mov r1, r8
	strb r1, [r0, 0x3]
	ldrh r0, [r2]
	adds r0, 0x1
	strh r0, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0810EC10: .4byte gSpecialVar_0x8004
_0810EC14: .4byte gUnknown_03000760
	thumb_func_end ScriptAddElevatorMenuItem

	thumb_func_start ScriptShowElevatorMenu
ScriptShowElevatorMenu: @ 810EC18
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0810EC5C @ =gUnknown_0203925A
	strb r4, [r5]
	ldr r0, _0810EC60 @ =gUnknown_0203925B
	strb r4, [r0]
	movs r0, 0x10
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl ScriptAddElevatorMenuItem
	ldr r2, _0810EC64 @ =gUnknown_03000760
	ldrb r0, [r2]
	cmp r0, 0x10
	beq _0810EC50
	adds r1, r5, 0
_0810EC3A:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r2
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810EC3A
_0810EC50:
	bl sub_810E874
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EC5C: .4byte gUnknown_0203925A
_0810EC60: .4byte gUnknown_0203925B
_0810EC64: .4byte gUnknown_03000760
	thumb_func_end ScriptShowElevatorMenu

	thumb_func_start sub_810E874
sub_810E874: @ 810EC68
	push {r4-r6,lr}
	sub sp, 0x8
	bl ScriptContext2_Enable
	ldr r4, _0810ECAC @ =gUnknown_0203925A
	ldrb r0, [r4]
	cmp r0, 0x5
	bls _0810ECB4
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	movs r3, 0xB
	bl MenuDrawTextWindow
	movs r4, 0
	str r4, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x5
	bl InitMenu
	ldr r0, _0810ECB0 @ =gUnknown_0203925C
	strb r4, [r0]
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	bl sub_810ECD4
	b _0810ECDC
	.align 2, 0
_0810ECAC: .4byte gUnknown_0203925A
_0810ECB0: .4byte gUnknown_0203925C
_0810ECB4:
	ldrb r3, [r4]
	lsls r3, 1
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	movs r1, 0
	movs r2, 0x8
	bl MenuDrawTextWindow
	ldrb r3, [r4]
	movs r0, 0
	str r0, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	bl InitMenu
_0810ECDC:
	movs r4, 0
	ldr r1, _0810ED2C @ =gUnknown_03000760
	ldrb r0, [r1]
	cmp r0, 0x10
	beq _0810ED18
	ldr r6, _0810ED30 @ =gUnknown_083F8380
	adds r5, r1, 0
_0810ECEA:
	lsls r0, r4, 2
	adds r0, r5
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r6
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bhi _0810ED18
	lsls r0, r4, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810ECEA
_0810ED18:
	bl sub_810E944
	ldr r0, _0810ED34 @ =sub_810E984
	movs r1, 0x8
	bl CreateTask
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810ED2C: .4byte gUnknown_03000760
_0810ED30: .4byte gUnknown_083F8380
_0810ED34: .4byte sub_810E984
	thumb_func_end sub_810E874

	thumb_func_start sub_810E944
sub_810E944: @ 810ED38
	push {lr}
	movs r0, 0x14
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r0, _0810ED6C @ =gOtherText_NowOn
	movs r1, 0x15
	movs r2, 0x1
	movs r3, 0x40
	bl sub_8072BD8
	ldr r1, _0810ED70 @ =gUnknown_083F8380
	ldr r0, _0810ED74 @ =gSpecialVar_0x8005
	ldrh r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x15
	movs r2, 0x3
	movs r3, 0x40
	bl sub_8072BD8
	pop {r0}
	bx r0
	.align 2, 0
_0810ED6C: .4byte gOtherText_NowOn
_0810ED70: .4byte gUnknown_083F8380
_0810ED74: .4byte gSpecialVar_0x8005
	thumb_func_end sub_810E944

	thumb_func_start sub_810E984
sub_810E984: @ 810ED78
	push {r4-r6,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0810EE38 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0810EDAC
	ldr r1, _0810EE3C @ =gUnknown_0203925B
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810EDAC
	subs r0, 0x1
	strb r0, [r1]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x40
	bl sub_810EAC8
_0810EDAC:
	ldr r0, _0810EE38 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0810EDDC
	ldr r2, _0810EE3C @ =gUnknown_0203925B
	ldrb r1, [r2]
	ldr r0, _0810EE40 @ =gUnknown_0203925A
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _0810EDDC
	adds r0, r1, 0x1
	strb r0, [r2]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x80
	bl sub_810EAC8
_0810EDDC:
	ldr r0, _0810EE38 @ =gMain
	ldrh r2, [r0, 0x2E]
	movs r5, 0x1
	adds r1, r5, 0
	ands r1, r2
	cmp r1, 0
	beq _0810EE88
	ldr r1, _0810EE44 @ =gUnknown_03000760
	ldr r4, _0810EE3C @ =gUnknown_0203925B
	ldrb r0, [r4]
	lsls r0, 2
	adds r0, r1
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	movs r2, 0x2
	ldrsb r2, [r0, r2]
	movs r3, 0x1
	negs r3, r3
	movs r0, 0x2
	str r0, [sp]
	str r5, [sp, 0x4]
	movs r0, 0
	bl saved_warp2_set_2
	ldr r1, _0810EE48 @ =gSpecialVar_0x8005
	ldrh r0, [r1]
	ldrb r2, [r4]
	cmp r0, r2
	bne _0810EE50
	ldr r1, _0810EE4C @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	movs r0, 0x5
	bl PlaySE
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_810EC9C
	b _0810EEB0
	.align 2, 0
_0810EE38: .4byte gMain
_0810EE3C: .4byte gUnknown_0203925B
_0810EE40: .4byte gUnknown_0203925A
_0810EE44: .4byte gUnknown_03000760
_0810EE48: .4byte gSpecialVar_0x8005
_0810EE4C: .4byte gScriptResult
_0810EE50:
	ldr r0, _0810EE7C @ =gScriptResult
	strh r5, [r0]
	ldrb r0, [r4]
	strh r0, [r1]
	bl sub_810EBEC
	ldr r0, _0810EE80 @ =gScriptLastTalked
	ldrb r0, [r0]
	ldr r2, _0810EE84 @ =gSaveBlock1
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	movs r3, 0x1
	bl FieldObjectTurnByLocalIdAndMap
	bl sub_810EEDC
	bl MenuZeroFillScreen
	adds r0, r6, 0
	bl DestroyTask
	b _0810EEB0
	.align 2, 0
_0810EE7C: .4byte gScriptResult
_0810EE80: .4byte gScriptLastTalked
_0810EE84: .4byte gSaveBlock1
_0810EE88:
	movs r0, 0x2
	ands r0, r2
	cmp r0, 0
	beq _0810EEB0
	ldr r0, _0810EEB8 @ =gScriptResult
	strh r1, [r0]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r6, 0
	bl sub_810EC9C
_0810EEB0:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810EEB8: .4byte gScriptResult
	thumb_func_end sub_810E984

	thumb_func_start sub_810EAC8
sub_810EAC8: @ 810EEBC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	movs r7, 0
	movs r4, 0
	ldr r0, _0810EEE0 @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810EEE4
	movs r0, 0
	b _0810EF6C
	.align 2, 0
_0810EEE0: .4byte gUnknown_0203925A
_0810EEE4:
	cmp r1, 0x40
	bne _0810EEF8
	cmp r2, 0
	bne _0810EF0C
	ldr r0, _0810EEF4 @ =gUnknown_0203925B
	ldrb r4, [r0]
	movs r7, 0x1
	b _0810EF10
	.align 2, 0
_0810EEF4: .4byte gUnknown_0203925B
_0810EEF8:
	cmp r3, 0x80
	bne _0810EF0C
	cmp r5, 0x4
	bne _0810EF0C
	ldr r0, _0810EF78 @ =gUnknown_0203925B
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r7, 0x1
_0810EF0C:
	cmp r7, 0
	beq _0810EF6A
_0810EF10:
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_810EB90
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x7
	movs r3, 0xA
	bl MenuFillWindowRectWithBlankTile
	movs r5, 0
	ldr r2, _0810EF7C @ =gUnknown_03000760
	lsls r1, r4, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x10
	beq _0810EF6A
	ldr r0, _0810EF80 @ =gUnknown_083F8380
	mov r8, r0
	adds r6, r2, 0
_0810EF38:
	adds r0, r1, r6
	ldrb r0, [r0]
	lsls r0, 2
	add r0, r8
	ldr r0, [r0]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bhi _0810EF6A
	lsls r1, r4, 2
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, 0x10
	bne _0810EF38
_0810EF6A:
	adds r0, r7, 0
_0810EF6C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810EF78: .4byte gUnknown_0203925B
_0810EF7C: .4byte gUnknown_03000760
_0810EF80: .4byte gUnknown_083F8380
	thumb_func_end sub_810EAC8

	thumb_func_start sub_810EB90
sub_810EB90: @ 810EF84
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0
	bne _0810EFA8
	ldr r0, _0810EFA4 @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x2
	eors r1, r2
	strb r1, [r0]
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	b _0810EFAC
	.align 2, 0
_0810EFA4: .4byte gUnknown_0203925C
_0810EFA8:
	bl sub_810ECB0
_0810EFAC:
	adds r1, r4, r5
	ldr r0, _0810EFBC @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r1, r0
	bge _0810EFC0
	bl sub_810ECD4
	b _0810EFD4
	.align 2, 0
_0810EFBC: .4byte gUnknown_0203925A
_0810EFC0:
	cmp r1, r0
	bne _0810EFD4
	ldr r0, _0810EFDC @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0810EFD4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810EFDC: .4byte gUnknown_0203925C
	thumb_func_end sub_810EB90

	thumb_func_start sub_810EBEC
sub_810EBEC: @ 810EFE0
	push {lr}
	ldr r0, _0810F020 @ =sub_810EC34
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F024 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0
	movs r2, 0x1
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	strh r2, [r1, 0x10]
	movs r0, 0x3
	strh r0, [r1, 0x12]
	movs r0, 0
	bl SetCameraPanningCallback
	bl sub_810ECFC
	movs r0, 0x59
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0810F020: .4byte sub_810EC34
_0810F024: .4byte gTasks
	thumb_func_end sub_810EBEC

	thumb_func_start sub_810EC34
sub_810EC34: @ 810F028
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810F08C @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0810F086
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0810F086
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	movs r0, 0
	bl SetCameraPanning
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x17
	bne _0810F086
	movs r0, 0x49
	bl PlaySE
	adds r0, r5, 0
	bl sub_810EC9C
	bl InstallCameraPanAheadCallback
_0810F086:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F08C: .4byte gTasks
	thumb_func_end sub_810EC34

	thumb_func_start sub_810EC9C
sub_810EC9C: @ 810F090
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810EC9C

	thumb_func_start sub_810ECB0
sub_810ECB0: @ 810F0A4
	push {lr}
	ldr r2, _0810F0C4 @ =gUnknown_0203925C
	ldrb r1, [r2]
	lsrs r0, r1, 1
	cmp r0, 0x1
	beq _0810F0C0
	movs r0, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0x24
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
_0810F0C0:
	pop {r0}
	bx r0
	.align 2, 0
_0810F0C4: .4byte gUnknown_0203925C
	thumb_func_end sub_810ECB0

	thumb_func_start sub_810ECD4
sub_810ECD4: @ 810F0C8
	push {lr}
	ldr r2, _0810F0EC @ =gUnknown_0203925C
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810F0E6
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	movs r1, 0x24
	movs r2, 0x48
	bl CreateVerticalScrollIndicators
_0810F0E6:
	pop {r0}
	bx r0
	.align 2, 0
_0810F0EC: .4byte gUnknown_0203925C
	thumb_func_end sub_810ECD4

	thumb_func_start sub_810ECFC
sub_810ECFC: @ 810F0F0
	push {r4,lr}
	ldr r4, _0810F12C @ =sub_810ED40
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810F124
	adds r0, r4, 0
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F130 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r2, [r1, 0xC]
	strh r2, [r1, 0xE]
	strh r2, [r1, 0x10]
_0810F124:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F12C: .4byte sub_810ED40
_0810F130: .4byte gTasks
	thumb_func_end sub_810ECFC

	thumb_func_start sub_810ED40
sub_810ED40: @ 810F134
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _0810F150 @ =gTasks
	adds r0, r1
	bl sub_810ED60
	pop {r0}
	bx r0
	.align 2, 0
_0810F150: .4byte gTasks
	thumb_func_end sub_810ED40

	thumb_func_start sub_810ED60
sub_810ED60: @ 810F154
	push {r4,r5,lr}
	adds r5, r0, 0
	movs r1, 0xE
	ldrsh r0, [r5, r1]
	cmp r0, 0x8
	beq _0810F162
	b _0810F2A6
_0810F162:
	movs r0, 0
	strh r0, [r5, 0xE]
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0810F208
	ldr r2, _0810F1F0 @ =0x00000e68
	movs r0, 0x7
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r4, _0810F1F4 @ =0x00000e69
	movs r0, 0x8
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F1F8 @ =0x00000e6a
	movs r0, 0xA
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	movs r2, 0xE7
	lsls r2, 4
	movs r0, 0x7
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F1FC @ =0x00000e72
	movs r0, 0xA
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F200 @ =0x00000e78
	movs r0, 0x7
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F204 @ =0x00000e7a
	movs r0, 0xA
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	b _0810F286
	.align 2, 0
_0810F1F0: .4byte 0x00000e68
_0810F1F4: .4byte 0x00000e69
_0810F1F8: .4byte 0x00000e6a
_0810F1FC: .4byte 0x00000e72
_0810F200: .4byte 0x00000e78
_0810F204: .4byte 0x00000e7a
_0810F208:
	ldr r2, _0810F2B4 @ =0x00000e6b
	movs r0, 0x7
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r4, _0810F2B8 @ =0x00000e6c
	movs r0, 0x8
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x7
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F2BC @ =0x00000e6d
	movs r0, 0xA
	movs r1, 0x7
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F2C0 @ =0x00000e73
	movs r0, 0x7
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x8
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F2C4 @ =0x00000e75
	movs r0, 0xA
	movs r1, 0x8
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F2C8 @ =0x00000e7b
	movs r0, 0x7
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
	adds r4, 0x8
	movs r0, 0x8
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	movs r0, 0x9
	movs r1, 0x9
	adds r2, r4, 0
	bl MapGridSetMetatileIdAt
	ldr r2, _0810F2CC @ =0x00000e7d
	movs r0, 0xA
	movs r1, 0x9
	bl MapGridSetMetatileIdAt
_0810F286:
	bl DrawWholeMapView
	ldrh r0, [r5, 0x10]
	movs r1, 0x1
	eors r0, r1
	strh r0, [r5, 0x10]
	ldrh r0, [r5, 0xC]
	adds r0, 0x1
	strh r0, [r5, 0xC]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x8
	bne _0810F2A6
	ldrb r0, [r5, 0xA]
	bl DestroyTask
_0810F2A6:
	ldrh r0, [r5, 0xE]
	adds r0, 0x1
	strh r0, [r5, 0xE]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F2B4: .4byte 0x00000e6b
_0810F2B8: .4byte 0x00000e6c
_0810F2BC: .4byte 0x00000e6d
_0810F2C0: .4byte 0x00000e73
_0810F2C4: .4byte 0x00000e75
_0810F2C8: .4byte 0x00000e7b
_0810F2CC: .4byte 0x00000e7d
	thumb_func_end sub_810ED60

	thumb_func_start sub_810EEDC
sub_810EEDC: @ 810F2D0
	push {r4,lr}
	ldr r4, _0810F2FC @ =gUnknown_0203925C
	ldrb r1, [r4]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810F2E4
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0810F2E4:
	ldrb r0, [r4]
	lsrs r0, 1
	cmp r0, 0x1
	bne _0810F2F2
	movs r0, 0
	bl DestroyVerticalScrollIndicator
_0810F2F2:
	bl BuyMenuFreeMemory
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F2FC: .4byte gUnknown_0203925C
	thumb_func_end sub_810EEDC

	thumb_func_start SetTrickHouseEndRoomFlag
SetTrickHouseEndRoomFlag: @ 810F300
	push {lr}
	ldr r1, _0810F310 @ =gSpecialVar_0x8004
	ldr r0, _0810F314 @ =0x00000259
	strh r0, [r1]
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810F310: .4byte gSpecialVar_0x8004
_0810F314: .4byte 0x00000259
	thumb_func_end SetTrickHouseEndRoomFlag

	thumb_func_start ResetTrickHouseEndRoomFlag
ResetTrickHouseEndRoomFlag: @ 810F318
	push {lr}
	ldr r1, _0810F328 @ =gSpecialVar_0x8004
	ldr r0, _0810F32C @ =0x00000259
	strh r0, [r1]
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0810F328: .4byte gSpecialVar_0x8004
_0810F32C: .4byte 0x00000259
	thumb_func_end ResetTrickHouseEndRoomFlag

	thumb_func_start CheckLeadMonCool
CheckLeadMonCool: @ 810F330
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F350 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x16
	bl GetMonData
	cmp r0, 0xC7
	bls _0810F354
	movs r0, 0x1
	b _0810F356
	.align 2, 0
_0810F350: .4byte gPlayerParty
_0810F354:
	movs r0, 0
_0810F356:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonCool

	thumb_func_start CheckLeadMonBeauty
CheckLeadMonBeauty: @ 810F35C
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F37C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x17
	bl GetMonData
	cmp r0, 0xC7
	bls _0810F380
	movs r0, 0x1
	b _0810F382
	.align 2, 0
_0810F37C: .4byte gPlayerParty
_0810F380:
	movs r0, 0
_0810F382:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonBeauty

	thumb_func_start CheckLeadMonCute
CheckLeadMonCute: @ 810F388
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F3A8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x18
	bl GetMonData
	cmp r0, 0xC7
	bls _0810F3AC
	movs r0, 0x1
	b _0810F3AE
	.align 2, 0
_0810F3A8: .4byte gPlayerParty
_0810F3AC:
	movs r0, 0
_0810F3AE:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonCute

	thumb_func_start CheckLeadMonSmart
CheckLeadMonSmart: @ 810F3B4
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F3D4 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x21
	bl GetMonData
	cmp r0, 0xC7
	bls _0810F3D8
	movs r0, 0x1
	b _0810F3DA
	.align 2, 0
_0810F3D4: .4byte gPlayerParty
_0810F3D8:
	movs r0, 0
_0810F3DA:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonSmart

	thumb_func_start CheckLeadMonTough
CheckLeadMonTough: @ 810F3E0
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F400 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x2F
	bl GetMonData
	cmp r0, 0xC7
	bls _0810F404
	movs r0, 0x1
	b _0810F406
	.align 2, 0
_0810F400: .4byte gPlayerParty
_0810F404:
	movs r0, 0
_0810F406:
	pop {r1}
	bx r1
	thumb_func_end CheckLeadMonTough

	thumb_func_start IsGrassTypeInParty
IsGrassTypeInParty: @ 810F40C
	push {r4-r6,lr}
	movs r5, 0
	ldr r6, _0810F45C @ =gBaseStats
_0810F412:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810F460 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x5
	bl GetMonData
	cmp r0, 0
	beq _0810F468
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	bne _0810F468
	adds r0, r4, 0
	movs r1, 0xB
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 3
	subs r1, r0
	lsls r1, 2
	adds r1, r6
	ldrb r0, [r1, 0x6]
	cmp r0, 0xC
	beq _0810F454
	ldrb r0, [r1, 0x7]
	cmp r0, 0xC
	bne _0810F468
_0810F454:
	ldr r1, _0810F464 @ =gScriptResult
	movs r0, 0x1
	b _0810F476
	.align 2, 0
_0810F45C: .4byte gBaseStats
_0810F460: .4byte gPlayerParty
_0810F464: .4byte gScriptResult
_0810F468:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _0810F412
	ldr r1, _0810F480 @ =gScriptResult
	movs r0, 0
_0810F476:
	strh r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0810F480: .4byte gScriptResult
	thumb_func_end IsGrassTypeInParty

	thumb_func_start ShowGlassWorkshopMenu
ShowGlassWorkshopMenu: @ 810F484
	push {r4,r5,lr}
	sub sp, 0x8
	bl ScriptContext2_Enable
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0xB
	bl MenuDrawTextWindow
	movs r4, 0
	str r4, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x5
	bl InitMenu
	ldr r0, _0810F4F8 @ =gUnknown_0203925C
	strb r4, [r0]
	bl sub_80F944C
	bl LoadScrollIndicatorPalette
	bl sub_810F2B4
	ldr r5, _0810F4FC @ =gUnknown_083F83C0
_0810F4BE:
	lsls r0, r4, 2
	adds r0, r5
	ldr r0, [r0]
	lsls r2, r4, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _0810F4BE
	ldr r1, _0810F500 @ =gUnknown_0203925B
	movs r0, 0
	strb r0, [r1]
	ldr r1, _0810F504 @ =gUnknown_0203925A
	movs r0, 0x8
	strb r0, [r1]
	ldr r0, _0810F508 @ =sub_810F118
	movs r1, 0x8
	bl CreateTask
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F4F8: .4byte gUnknown_0203925C
_0810F4FC: .4byte gUnknown_083F83C0
_0810F500: .4byte gUnknown_0203925B
_0810F504: .4byte gUnknown_0203925A
_0810F508: .4byte sub_810F118
	thumb_func_end ShowGlassWorkshopMenu

	thumb_func_start sub_810F118
sub_810F118: @ 810F50C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810F5D8 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x40
	bne _0810F53E
	ldr r1, _0810F5DC @ =gUnknown_0203925B
	ldrb r0, [r1]
	cmp r0, 0
	beq _0810F53E
	subs r0, 0x1
	strb r0, [r1]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x40
	bl sub_810F1F4
_0810F53E:
	ldr r0, _0810F5D8 @ =gMain
	ldrh r0, [r0, 0x2E]
	cmp r0, 0x80
	bne _0810F56E
	ldr r2, _0810F5DC @ =gUnknown_0203925B
	ldrb r1, [r2]
	ldr r0, _0810F5E0 @ =gUnknown_0203925A
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r1, r0
	beq _0810F56E
	adds r0, r1, 0x1
	strb r0, [r2]
	bl GetMenuCursorPos
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x1
	bl MoveMenuCursorNoWrap
	adds r0, r4, 0
	movs r1, 0x80
	bl sub_810F1F4
_0810F56E:
	ldr r4, _0810F5D8 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0810F5A2
	bl sub_8072DEC
	ldr r0, _0810F5E4 @ =gScriptResult
	ldr r1, _0810F5DC @ =gUnknown_0203925B
	ldrb r1, [r1]
	strh r1, [r0]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_810EC9C
_0810F5A2:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0810F5D2
	bl sub_8072DEC
	ldr r1, _0810F5E4 @ =gScriptResult
	movs r0, 0x7F
	strh r0, [r1]
	movs r0, 0x5
	bl PlaySE
	bl sub_810EEDC
	movs r0, 0
	movs r1, 0
	movs r2, 0x1D
	movs r3, 0xC
	bl MenuZeroFillWindowRect
	adds r0, r5, 0
	bl sub_810EC9C
_0810F5D2:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F5D8: .4byte gMain
_0810F5DC: .4byte gUnknown_0203925B
_0810F5E0: .4byte gUnknown_0203925A
_0810F5E4: .4byte gScriptResult
	thumb_func_end sub_810F118

	thumb_func_start sub_810F1F4
sub_810F1F4: @ 810F5E8
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	lsls r1, 24
	lsrs r1, 24
	adds r3, r1, 0
	movs r6, 0
	movs r4, 0
	ldr r0, _0810F608 @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r0, 0x4
	bhi _0810F60C
	movs r0, 0
	b _0810F676
	.align 2, 0
_0810F608: .4byte gUnknown_0203925A
_0810F60C:
	cmp r1, 0x40
	bne _0810F620
	cmp r2, 0
	bne _0810F634
	ldr r0, _0810F61C @ =gUnknown_0203925B
	ldrb r4, [r0]
	movs r6, 0x1
	b _0810F638
	.align 2, 0
_0810F61C: .4byte gUnknown_0203925B
_0810F620:
	cmp r3, 0x80
	bne _0810F634
	cmp r5, 0x4
	bne _0810F634
	ldr r0, _0810F67C @ =gUnknown_0203925B
	ldrb r0, [r0]
	subs r0, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	movs r6, 0x1
_0810F634:
	cmp r6, 0
	beq _0810F674
_0810F638:
	adds r0, r4, 0
	movs r1, 0x5
	bl GlassWorkshopUpdateScrollIndicators
	movs r0, 0x2
	movs r1, 0x1
	movs r2, 0x9
	movs r3, 0xA
	bl MenuFillWindowRectWithBlankTile
	movs r5, 0
	ldr r7, _0810F680 @ =gUnknown_083F83C0
_0810F650:
	lsls r0, r4, 2
	adds r0, r7
	ldr r0, [r0]
	lsls r2, r5, 1
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0x1
	bl MenuPrint
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _0810F650
_0810F674:
	adds r0, r6, 0
_0810F676:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810F67C: .4byte gUnknown_0203925B
_0810F680: .4byte gUnknown_083F83C0
	thumb_func_end sub_810F1F4

	thumb_func_start sub_810F290
sub_810F290: @ 810F684
	push {lr}
	ldr r2, _0810F6A4 @ =gUnknown_0203925C
	ldrb r1, [r2]
	lsrs r0, r1, 1
	cmp r0, 0x1
	beq _0810F6A0
	movs r0, 0x2
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0
	movs r1, 0x2C
	movs r2, 0x8
	bl CreateVerticalScrollIndicators
_0810F6A0:
	pop {r0}
	bx r0
	.align 2, 0
_0810F6A4: .4byte gUnknown_0203925C
	thumb_func_end sub_810F290

	thumb_func_start sub_810F2B4
sub_810F2B4: @ 810F6A8
	push {lr}
	ldr r2, _0810F6CC @ =gUnknown_0203925C
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810F6C6
	movs r0, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	movs r1, 0x2C
	movs r2, 0x58
	bl CreateVerticalScrollIndicators
_0810F6C6:
	pop {r0}
	bx r0
	.align 2, 0
_0810F6CC: .4byte gUnknown_0203925C
	thumb_func_end sub_810F2B4

	thumb_func_start GlassWorkshopUpdateScrollIndicators
GlassWorkshopUpdateScrollIndicators: @ 810F6D0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r5, r1, 24
	cmp r4, 0
	bne _0810F6F4
	ldr r0, _0810F6F0 @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x2
	eors r1, r2
	strb r1, [r0]
	movs r0, 0
	bl DestroyVerticalScrollIndicator
	b _0810F6F8
	.align 2, 0
_0810F6F0: .4byte gUnknown_0203925C
_0810F6F4:
	bl sub_810F290
_0810F6F8:
	adds r1, r4, r5
	ldr r0, _0810F708 @ =gUnknown_0203925A
	ldrb r0, [r0]
	cmp r1, r0
	bge _0810F70C
	bl sub_810F2B4
	b _0810F720
	.align 2, 0
_0810F708: .4byte gUnknown_0203925A
_0810F70C:
	cmp r1, r0
	bne _0810F720
	ldr r0, _0810F728 @ =gUnknown_0203925C
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	movs r0, 0x1
	bl DestroyVerticalScrollIndicator
_0810F720:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810F728: .4byte gUnknown_0203925C
	thumb_func_end GlassWorkshopUpdateScrollIndicators

	thumb_func_start SpawnCameraDummy
SpawnCameraDummy: @ 810F72C
	push {lr}
	sub sp, 0x8
	ldr r0, _0810F774 @ =gSaveBlock1
	ldrh r3, [r0]
	adds r3, 0x7
	lsls r3, 16
	asrs r3, 16
	ldrh r0, [r0, 0x2]
	adds r0, 0x7
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	movs r0, 0x3
	str r0, [sp, 0x4]
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0x7F
	bl SpawnSpecialFieldObjectParametrized
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810F778 @ =gMapObjects
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1]
	movs r2, 0x20
	orrs r0, r2
	strb r0, [r1, 0x1]
	ldrb r0, [r1, 0x4]
	bl CameraObjectSetFollowedObjectId
	add sp, 0x8
	pop {r0}
	bx r0
	.align 2, 0
_0810F774: .4byte gSaveBlock1
_0810F778: .4byte gMapObjects
	thumb_func_end SpawnCameraDummy

	thumb_func_start RemoveCameraDummy
RemoveCameraDummy: @ 810F77C
	push {lr}
	bl GetPlayerAvatarObjectId
	lsls r0, 24
	lsrs r0, 24
	bl CameraObjectSetFollowedObjectId
	ldr r0, _0810F79C @ =gSaveBlock1
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	movs r0, 0x7F
	bl RemoveFieldObjectByLocalIdAndMap
	pop {r0}
	bx r0
	.align 2, 0
_0810F79C: .4byte gSaveBlock1
	thumb_func_end RemoveCameraDummy

	thumb_func_start GetPokeblockNameByMonNature
GetPokeblockNameByMonNature: @ 810F7A0
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F7C8 @ =gPlayerParty
	adds r0, r1
	bl GetNature
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0810F7CC @ =gStringVar1
	bl sub_810CB68
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810F7C8: .4byte gPlayerParty
_0810F7CC: .4byte gStringVar1
	thumb_func_end GetPokeblockNameByMonNature

	thumb_func_start GetSecretBaseNearbyMapName
GetSecretBaseNearbyMapName: @ 810F7D0
	push {r4,lr}
	ldr r4, _0810F7F0 @ =gStringVar1
	ldr r0, _0810F7F4 @ =0x00004026
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	movs r2, 0
	bl sub_80FBFB4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810F7F0: .4byte gStringVar1
_0810F7F4: .4byte 0x00004026
	thumb_func_end GetSecretBaseNearbyMapName

	thumb_func_start sub_810F404
sub_810F404: @ 810F7F8
	push {lr}
	movs r0, 0x20
	bl sub_8053108
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end sub_810F404

	thumb_func_start sub_810F414
sub_810F414: @ 810F808
	push {lr}
	ldr r0, _0810F814 @ =gStringVar1
	bl sub_8135FF4
	pop {r0}
	bx r0
	.align 2, 0
_0810F814: .4byte gStringVar1
	thumb_func_end sub_810F414

	thumb_func_start sub_810F424
sub_810F424: @ 810F818
	push {r4,r5,lr}
	ldr r2, _0810F84C @ =gSaveBlock1
	ldr r1, _0810F850 @ =0x00002dd4
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r1, 25
	ldr r0, _0810F854 @ =0x00002dd6
	adds r2, r0
	lsrs r1, 25
	ldrh r2, [r2]
	adds r1, r2
	ldr r2, _0810F858 @ =gUnknown_083F83E0
	ldr r0, _0810F85C @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	adds r5, r1, r0
	movs r0, 0x2
	bl GetPriceReduction
	lsls r0, 24
	cmp r0, 0
	bne _0810F864
	ldr r4, _0810F860 @ =gUnknown_083F83EC
	b _0810F866
	.align 2, 0
_0810F84C: .4byte gSaveBlock1
_0810F850: .4byte 0x00002dd4
_0810F854: .4byte 0x00002dd6
_0810F858: .4byte gUnknown_083F83E0
_0810F85C: .4byte gSpecialVar_0x8004
_0810F860: .4byte gUnknown_083F83EC
_0810F864:
	ldr r4, _0810F878 @ =gUnknown_083F83F8
_0810F866:
	adds r0, r5, 0
	movs r1, 0xC
	bl __umodsi3
	adds r0, r4
	ldrb r0, [r0]
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810F878: .4byte gUnknown_083F83F8
	thumb_func_end sub_810F424

	thumb_func_start sub_810F488
sub_810F488: @ 810F87C
	push {lr}
	ldr r1, _0810F894 @ =gSpecialVar_0x8004
	ldr r0, _0810F898 @ =0x00000277
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F89C
	movs r0, 0x1
	b _0810F89E
	.align 2, 0
_0810F894: .4byte gSpecialVar_0x8004
_0810F898: .4byte 0x00000277
_0810F89C:
	movs r0, 0
_0810F89E:
	pop {r1}
	bx r1
	thumb_func_end sub_810F488

	thumb_func_start sub_810F4B0
sub_810F4B0: @ 810F8A4
	push {lr}
	ldr r1, _0810F8BC @ =gSpecialVar_0x8004
	movs r0, 0x9E
	lsls r0, 2
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F8C0
	movs r0, 0x1
	b _0810F8C2
	.align 2, 0
_0810F8BC: .4byte gSpecialVar_0x8004
_0810F8C0:
	movs r0, 0
_0810F8C2:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4B0

	thumb_func_start sub_810F4D4
sub_810F4D4: @ 810F8C8
	push {lr}
	ldr r1, _0810F8E0 @ =gSpecialVar_0x8004
	ldr r0, _0810F8E4 @ =0x00000279
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F8E8
	movs r0, 0x1
	b _0810F8EA
	.align 2, 0
_0810F8E0: .4byte gSpecialVar_0x8004
_0810F8E4: .4byte 0x00000279
_0810F8E8:
	movs r0, 0
_0810F8EA:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4D4

	thumb_func_start sub_810F4FC
sub_810F4FC: @ 810F8F0
	push {lr}
	ldr r1, _0810F908 @ =gSpecialVar_0x8004
	ldr r0, _0810F90C @ =0x0000027a
	strh r0, [r1]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F910
	movs r0, 0x1
	b _0810F912
	.align 2, 0
_0810F908: .4byte gSpecialVar_0x8004
_0810F90C: .4byte 0x0000027a
_0810F910:
	movs r0, 0
_0810F912:
	pop {r1}
	bx r1
	thumb_func_end sub_810F4FC

	thumb_func_start LeadMonHasEffortRibbon
LeadMonHasEffortRibbon: @ 810F918
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F93C @ =gPlayerParty
	adds r0, r1
	movs r1, 0x47
	movs r2, 0
	bl GetMonData
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0810F93C: .4byte gPlayerParty
	thumb_func_end LeadMonHasEffortRibbon

	thumb_func_start GivLeadMonEffortRibbon
GivLeadMonEffortRibbon: @ 810F940
	push {lr}
	sub sp, 0x4
	movs r0, 0x2A
	bl sav12_xor_increment
	ldr r0, _0810F974 @ =0x0000083b
	bl FlagSet
	movs r1, 0x1
	mov r0, sp
	strb r1, [r0]
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F978 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x47
	mov r2, sp
	bl SetMonData
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0810F974: .4byte 0x0000083b
_0810F978: .4byte gPlayerParty
	thumb_func_end GivLeadMonEffortRibbon

	thumb_func_start GetLeadMonEVCount
GetLeadMonEVCount: @ 810F97C
	push {lr}
	bl GetLeadMonIndex
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0810F9A0 @ =gPlayerParty
	adds r0, r1
	bl GetMonEVCount
	lsls r0, 16
	ldr r1, _0810F9A4 @ =0x01fd0000
	cmp r0, r1
	bhi _0810F9A8
	movs r0, 0
	b _0810F9AA
	.align 2, 0
_0810F9A0: .4byte gPlayerParty
_0810F9A4: .4byte 0x01fd0000
_0810F9A8:
	movs r0, 0x1
_0810F9AA:
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonEVCount

	thumb_func_start sub_810F5BC
sub_810F5BC: @ 810F9B0
	push {lr}
	movs r0, 0xC7
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0810FA04
	ldr r0, _0810F9DC @ =gSaveBlock1
	ldrh r1, [r0, 0x4]
	movs r0, 0x83
	lsls r0, 3
	cmp r1, r0
	bne _0810FA04
	subs r0, 0x75
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810F9E4
	ldr r0, _0810F9E0 @ =0x0000409a
	movs r1, 0x4
	b _0810F9F6
	.align 2, 0
_0810F9DC: .4byte gSaveBlock1
_0810F9E0: .4byte 0x0000409a
_0810F9E4:
	movs r0, 0xE9
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0810FA04
	ldr r0, _0810FA00 @ =0x0000409a
	movs r1, 0x5
_0810F9F6:
	bl VarSet
	movs r0, 0x1
	b _0810FA06
	.align 2, 0
_0810FA00: .4byte 0x0000409a
_0810FA04:
	movs r0, 0
_0810FA06:
	pop {r1}
	bx r1
	thumb_func_end sub_810F5BC

	thumb_func_start sub_810F618
sub_810F618: @ 810FA0C
	push {lr}
	ldr r0, _0810FA18 @ =0x0000085f
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_0810FA18: .4byte 0x0000085f
	thumb_func_end sub_810F618

	thumb_func_start PutZigzagoonInPlayerParty
PutZigzagoonInPlayerParty: @ 810FA1C
	push {r4,r5,lr}
	sub sp, 0x14
	ldr r5, _0810FA84 @ =gPlayerParty
	movs r1, 0x90
	lsls r1, 1
	movs r4, 0
	str r4, [sp]
	str r4, [sp, 0x4]
	str r4, [sp, 0x8]
	str r4, [sp, 0xC]
	adds r0, r5, 0
	movs r2, 0x7
	movs r3, 0x20
	bl CreateMon
	movs r1, 0x1
	add r0, sp, 0x10
	strh r1, [r0]
	adds r0, r5, 0
	movs r1, 0x2E
	add r2, sp, 0x10
	bl SetMonData
	add r1, sp, 0x10
	movs r0, 0x21
	strh r0, [r1]
	adds r0, r5, 0
	movs r1, 0xD
	add r2, sp, 0x10
	bl SetMonData
	add r0, sp, 0x10
	strh r4, [r0]
	adds r0, r5, 0
	movs r1, 0xE
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0xF
	add r2, sp, 0x10
	bl SetMonData
	adds r0, r5, 0
	movs r1, 0x10
	add r2, sp, 0x10
	bl SetMonData
	add sp, 0x14
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FA84: .4byte gPlayerParty
	thumb_func_end PutZigzagoonInPlayerParty

	thumb_func_start IsStarterInParty
IsStarterInParty: @ 810FA88
	push {r4-r6,lr}
	ldr r0, _0810FAC4 @ =0x00004023
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl GetStarterPokemon
	lsls r0, 16
	lsrs r6, r0, 16
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	cmp r4, r5
	bcs _0810FAD6
_0810FAAA:
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0810FAC8 @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, r6
	bne _0810FACC
	movs r0, 0x1
	b _0810FAD8
	.align 2, 0
_0810FAC4: .4byte 0x00004023
_0810FAC8: .4byte gPlayerParty
_0810FACC:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r5
	bcc _0810FAAA
_0810FAD6:
	movs r0, 0
_0810FAD8:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end IsStarterInParty

	thumb_func_start CheckFreePokemonStorageSpace
CheckFreePokemonStorageSpace: @ 810FAE0
	push {r4-r6,lr}
	movs r5, 0
_0810FAE4:
	movs r4, 0
	lsls r1, r5, 2
	adds r1, r5
	lsls r0, r1, 4
	subs r0, r1
	lsls r6, r0, 5
_0810FAF0:
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 4
	ldr r1, _0810FB0C @ =gUnknown_020300A4
	adds r0, r1
	adds r0, r6, r0
	movs r1, 0xB
	movs r2, 0
	bl GetBoxMonData
	cmp r0, 0
	bne _0810FB10
	movs r0, 0x1
	b _0810FB26
	.align 2, 0
_0810FB0C: .4byte gUnknown_020300A4
_0810FB10:
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r4, 0x1D
	bls _0810FAF0
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0xD
	bls _0810FAE4
	movs r0, 0
_0810FB26:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CheckFreePokemonStorageSpace

	thumb_func_start IsPokerusInParty
IsPokerusInParty: @ 810FB2C
	push {lr}
	ldr r0, _0810FB40 @ =gPlayerParty
	movs r1, 0x3F
	bl CheckPartyPokerus
	lsls r0, 24
	cmp r0, 0
	beq _0810FB44
	movs r0, 0x1
	b _0810FB46
	.align 2, 0
_0810FB40: .4byte gPlayerParty
_0810FB44:
	movs r0, 0
_0810FB46:
	pop {r1}
	bx r1
	thumb_func_end IsPokerusInParty

	thumb_func_start sub_810F758
sub_810F758: @ 810FB4C
	push {lr}
	ldr r0, _0810FB8C @ =sub_810F7A8
	movs r1, 0x9
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0810FB90 @ =gTasks
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _0810FB94 @ =gSpecialVar_0x8005
	ldrh r2, [r0]
	movs r0, 0
	strh r2, [r1, 0x8]
	strh r0, [r1, 0xA]
	strh r0, [r1, 0xC]
	strh r0, [r1, 0xE]
	ldr r0, _0810FB98 @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	strh r0, [r1, 0x10]
	movs r0, 0x5
	strh r0, [r1, 0x12]
	movs r0, 0
	bl SetCameraPanningCallback
	movs r0, 0xD6
	bl PlaySE
	pop {r0}
	bx r0
	.align 2, 0
_0810FB8C: .4byte sub_810F7A8
_0810FB90: .4byte gTasks
_0810FB94: .4byte gSpecialVar_0x8005
_0810FB98: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810F758

	thumb_func_start sub_810F7A8
sub_810F7A8: @ 810FB9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0810FC04 @ =gTasks
	adds r4, r0, r1
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl __modsi3
	cmp r0, 0
	bne _0810FBFC
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0810FBFC
	ldrh r0, [r4, 0x8]
	negs r0, r0
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x10]
	negs r0, r0
	strh r0, [r4, 0x10]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	movs r2, 0x10
	ldrsh r1, [r4, r2]
	bl SetCameraPanning
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x8
	bne _0810FBFC
	adds r0, r5, 0
	bl sub_810F814
	bl InstallCameraPanAheadCallback
_0810FBFC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FC04: .4byte gTasks
	thumb_func_end sub_810F7A8

	thumb_func_start sub_810F814
sub_810F814: @ 810FC08
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
	bl EnableBothScriptContexts
	pop {r0}
	bx r0
	thumb_func_end sub_810F814

	thumb_func_start sub_810F828
sub_810F828: @ 810FC1C
	push {lr}
	movs r0, 0xAE
	lsls r0, 2
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_810F828

	thumb_func_start SetRoute119Weather
SetRoute119Weather: @ 810FC30
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810FC4C
	movs r0, 0x14
	bl SetSav1Weather
_0810FC4C:
	pop {r0}
	bx r0
	thumb_func_end SetRoute119Weather

	thumb_func_start SetRoute123Weather
SetRoute123Weather: @ 810FC50
	push {lr}
	bl get_map_light_from_warp0
	lsls r0, 24
	lsrs r0, 24
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0810FC6C
	movs r0, 0x15
	bl SetSav1Weather
_0810FC6C:
	pop {r0}
	bx r0
	thumb_func_end SetRoute123Weather

	thumb_func_start GetLeadMonIndex
GetLeadMonIndex: @ 810FC70
	push {r4-r6,lr}
	bl CalculatePlayerPartyCount
	lsls r0, 24
	lsrs r6, r0, 24
	movs r5, 0
	cmp r5, r6
	bcs _0810FCBE
_0810FC80:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0810FCB0 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	movs r1, 0xCE
	lsls r1, 1
	cmp r0, r1
	beq _0810FCB4
	adds r0, r4, 0
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	cmp r0, 0
	beq _0810FCB4
	adds r0, r5, 0
	b _0810FCC0
	.align 2, 0
_0810FCB0: .4byte gPlayerParty
_0810FCB4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0810FC80
_0810FCBE:
	movs r0, 0
_0810FCC0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetLeadMonIndex

	thumb_func_start ScriptGetPartyMonSpecies
ScriptGetPartyMonSpecies: @ 810FCC8
	push {lr}
	ldr r0, _0810FCE8 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810FCEC @ =gPlayerParty
	adds r0, r1
	movs r1, 0x41
	movs r2, 0
	bl GetMonData
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0810FCE8: .4byte gSpecialVar_0x8004
_0810FCEC: .4byte gPlayerParty
	thumb_func_end ScriptGetPartyMonSpecies

	thumb_func_start sub_810F8FC
sub_810F8FC: @ 810FCF0
	push {lr}
	movs r0, 0x6
	bl sub_805ADDC
	pop {r0}
	bx r0
	thumb_func_end sub_810F8FC

	thumb_func_start sub_810F908
sub_810F908: @ 810FCFC
	push {r4,lr}
	ldr r0, _0810FD1C @ =0x000040c2
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	adds r3, r0, 0
	ldr r2, _0810FD20 @ =gLocalTime
	movs r1, 0
	ldrsh r0, [r2, r1]
	subs r0, r3
	cmp r0, 0x6
	ble _0810FD24
	movs r0, 0
	b _0810FD3C
	.align 2, 0
_0810FD1C: .4byte 0x000040c2
_0810FD20: .4byte gLocalTime
_0810FD24:
	ldrh r1, [r2]
	movs r4, 0
	ldrsh r0, [r2, r4]
	cmp r0, 0
	blt _0810FD3A
	subs r1, r3
	movs r0, 0x7
	subs r0, r1
	lsls r0, 16
	lsrs r0, 16
	b _0810FD3C
_0810FD3A:
	movs r0, 0x8
_0810FD3C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F908

	thumb_func_start sub_810F950
sub_810F950: @ 810FD44
	push {r4,lr}
	ldr r0, _0810FD58 @ =0x000040c2
	ldr r4, _0810FD5C @ =gLocalTime
	ldrh r1, [r4]
	bl VarSet
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0810FD58: .4byte 0x000040c2
_0810FD5C: .4byte gLocalTime
	thumb_func_end sub_810F950

	thumb_func_start sub_810F96C
sub_810F96C: @ 810FD60
	push {r4,lr}
	ldr r0, _0810FD88 @ =gSpecialVar_0x8004
	ldrh r1, [r0]
	movs r0, 0x64
	muls r0, r1
	ldr r1, _0810FD8C @ =gPlayerParty
	adds r0, r1
	ldr r4, _0810FD90 @ =gStringVar1
	movs r1, 0x7
	adds r2, r4, 0
	bl GetMonData
	ldr r0, _0810FD94 @ =gSaveBlock2
	adds r1, r4, 0
	bl StringCompareWithoutExtCtrlCodes
	cmp r0, 0
	beq _0810FD98
	movs r0, 0x1
	b _0810FD9A
	.align 2, 0
_0810FD88: .4byte gSpecialVar_0x8004
_0810FD8C: .4byte gPlayerParty
_0810FD90: .4byte gStringVar1
_0810FD94: .4byte gSaveBlock2
_0810FD98:
	movs r0, 0
_0810FD9A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_810F96C

	thumb_func_start sub_810F9AC
sub_810F9AC: @ 810FDA0
	push {r4,r5,lr}
	ldr r2, _0810FDB4 @ =gScriptResult
	ldrh r1, [r2]
	ldr r0, _0810FDB8 @ =0x0000270f
	cmp r1, r0
	bls _0810FDBC
	movs r0, 0
	bl sub_80BF088
	b _0810FE3E
	.align 2, 0
_0810FDB4: .4byte gScriptResult
_0810FDB8: .4byte 0x0000270f
_0810FDBC:
	ldr r0, _0810FDCC @ =0x000003e7
	cmp r1, r0
	bls _0810FDD4
	ldr r4, _0810FDD0 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	adds r4, 0x1
	b _0810FDF8
	.align 2, 0
_0810FDCC: .4byte 0x000003e7
_0810FDD0: .4byte gStringVar1
_0810FDD4:
	cmp r1, 0x63
	bls _0810FDE8
	ldr r4, _0810FDE4 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	adds r4, 0x2
	b _0810FDF8
	.align 2, 0
_0810FDE4: .4byte gStringVar1
_0810FDE8:
	cmp r1, 0x9
	bls _0810FE18
	ldr r4, _0810FE14 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	adds r4, 0x3
_0810FDF8:
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	b _0810FE3E
	.align 2, 0
_0810FE14: .4byte gStringVar1
_0810FE18:
	ldr r4, _0810FE44 @ =gStringVar1
	movs r0, 0xA1
	strb r0, [r4]
	strb r0, [r4, 0x1]
	strb r0, [r4, 0x2]
	strb r0, [r4, 0x3]
	adds r4, 0x4
	ldrh r5, [r2]
	adds r0, r5, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
_0810FE3E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810FE44: .4byte gStringVar1
	thumb_func_end sub_810F9AC

	thumb_func_start sub_810FA54
sub_810FA54: @ 810FE48
	ldr r0, _0810FE5C @ =gSaveBlock1
	ldr r2, _0810FE60 @ =0x000013c2
	adds r1, r0, r2
	movs r2, 0
	strh r2, [r1]
	ldr r1, _0810FE64 @ =0x000013c4
	adds r0, r1
	strh r2, [r0]
	bx lr
	.align 2, 0
_0810FE5C: .4byte gSaveBlock1
_0810FE60: .4byte 0x000013c2
_0810FE64: .4byte 0x000013c4
	thumb_func_end sub_810FA54

	thumb_func_start sub_810FA74
sub_810FA74: @ 810FE68
	push {lr}
	bl sub_810FF30
	lsls r0, 24
	cmp r0, 0
	beq _0810FE84
	bl sub_810FCE8
	ldr r0, _0810FE88 @ =gSaveBlock1
	ldr r1, _0810FE8C @ =gSaveBlock2
	ldrh r1, [r1, 0xE]
	ldr r2, _0810FE90 @ =0x000013c4
	adds r0, r2
	strh r1, [r0]
_0810FE84:
	pop {r0}
	bx r0
	.align 2, 0
_0810FE88: .4byte gSaveBlock1
_0810FE8C: .4byte gSaveBlock2
_0810FE90: .4byte 0x000013c4
	thumb_func_end sub_810FA74

	thumb_func_start sub_810FAA0
sub_810FAA0: @ 810FE94
	push {r4,lr}
	ldr r4, _0810FEE4 @ =gSaveBlock1
	ldr r1, _0810FEE8 @ =0x000013c2
	adds r0, r4, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0810FEDC
	bl sub_810FF48
	bl sub_810FD80
	ldr r0, _0810FEEC @ =gSaveBlock2
	ldrh r1, [r0, 0xE]
	ldr r2, _0810FEF0 @ =0x000013c4
	adds r0, r4, r2
	strh r1, [r0]
	ldr r0, _0810FEF4 @ =0x00000315
	bl FlagReset
	ldr r0, _0810FEF8 @ =0x00000316
	bl FlagReset
	ldr r0, _0810FEFC @ =0x00000317
	bl FlagReset
	movs r0, 0xC6
	lsls r0, 2
	bl FlagReset
	ldr r0, _0810FF00 @ =0x00004095
	movs r1, 0x1
	bl VarSet
_0810FEDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0810FEE4: .4byte gSaveBlock1
_0810FEE8: .4byte 0x000013c2
_0810FEEC: .4byte gSaveBlock2
_0810FEF0: .4byte 0x000013c4
_0810FEF4: .4byte 0x00000315
_0810FEF8: .4byte 0x00000316
_0810FEFC: .4byte 0x00000317
_0810FF00: .4byte 0x00004095
	thumb_func_end sub_810FAA0

	thumb_func_start sub_810FB10
sub_810FB10: @ 810FF04
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0810FF48 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0810FF74
	ldr r0, _0810FF4C @ =gSaveBlock1
	ldr r1, _0810FF50 @ =0x000013c2
	adds r4, r0, r1
	ldrh r2, [r4]
	movs r1, 0x7F
	ands r1, r2
	ldr r0, _0810FF54 @ =gUnknown_083F8404
	adds r0, r5, r0
	ldrb r0, [r0]
	adds r1, r0
	cmp r1, 0x13
	ble _0810FF70
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bhi _0810FF5C
	bl sub_810FB9C
	ldrh r1, [r4]
	ldr r0, _0810FF58 @ =0x0000ff80
	ands r0, r1
	b _0810FF72
	.align 2, 0
_0810FF48: .4byte 0x00004095
_0810FF4C: .4byte gSaveBlock1
_0810FF50: .4byte 0x000013c2
_0810FF54: .4byte gUnknown_083F8404
_0810FF58: .4byte 0x0000ff80
_0810FF5C:
	ldrh r0, [r4]
	ldr r1, _0810FF6C @ =0x0000ff80
	ands r1, r0
	movs r0, 0x14
	orrs r1, r0
	strh r1, [r4]
	b _0810FF74
	.align 2, 0
_0810FF6C: .4byte 0x0000ff80
_0810FF70:
	adds r0, r2, r0
_0810FF72:
	strh r0, [r4]
_0810FF74:
	ldr r0, _0810FF88 @ =gSaveBlock1
	ldr r1, _0810FF8C @ =0x000013c2
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x7F
	ands r0, r1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0810FF88: .4byte gSaveBlock1
_0810FF8C: .4byte 0x000013c2
	thumb_func_end sub_810FB10

	thumb_func_start sub_810FB9C
sub_810FB9C: @ 810FF90
	push {r4-r7,lr}
	sub sp, 0x4
	movs r3, 0
	movs r5, 0
	ldr r7, _0810FFCC @ =0x02026af6
	movs r6, 0x1
_0810FF9C:
	ldrh r1, [r7]
	ldr r0, _0810FFD0 @ =gUnknown_083F8408
	adds r0, r5, r0
	ldrb r4, [r0]
	asrs r1, r4
	ands r1, r6
	cmp r1, 0
	bne _0810FFD4
	adds r3, r5, 0
	str r3, [sp]
	bl Random
	adds r1, r6, 0
	ands r1, r0
	ldr r3, [sp]
	cmp r1, 0
	beq _0810FFD4
	adds r0, r6, 0
	lsls r0, r4
	ldrh r1, [r7]
	orrs r0, r1
	strh r0, [r7]
	b _0810FFF4
	.align 2, 0
_0810FFCC: .4byte 0x02026af6
_0810FFD0: .4byte gUnknown_083F8408
_0810FFD4:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _0810FF9C
	ldr r2, _08110000 @ =gSaveBlock1
	ldr r0, _08110004 @ =0x000013c2
	adds r2, r0
	ldr r1, _08110008 @ =gUnknown_083F8408
	adds r1, r3, r1
	movs r0, 0x1
	ldrb r1, [r1]
	lsls r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
_0810FFF4:
	adds r0, r3, 0
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08110000: .4byte gSaveBlock1
_08110004: .4byte 0x000013c2
_08110008: .4byte gUnknown_083F8408
	thumb_func_end sub_810FB9C

	thumb_func_start sub_810FC18
sub_810FC18: @ 811000C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r0, 0
	mov r8, r0
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _08110032
	movs r0, 0
	b _08110088
_08110028:
	lsls r4, r6
	ldrh r0, [r2]
	eors r4, r0
	strh r4, [r2]
	b _08110086
_08110032:
	movs r5, 0
	ldr r2, _08110094 @ =0x02026af6
	movs r4, 0x1
_08110038:
	ldrh r1, [r2]
	ldr r7, _08110098 @ =gUnknown_083F8410
	adds r0, r5, r7
	ldrb r6, [r0]
	asrs r1, r6
	ands r1, r4
	cmp r1, 0
	beq _0811005A
	mov r8, r5
	str r2, [sp]
	bl Random
	adds r1, r4, 0
	ands r1, r0
	ldr r2, [sp]
	cmp r1, 0
	bne _08110028
_0811005A:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x7
	bls _08110038
	ldr r0, _0811009C @ =gSaveBlock1
	ldr r1, _081100A0 @ =0x000013c2
	adds r4, r0, r1
	ldrh r1, [r4]
	mov r2, r8
	adds r0, r2, r7
	ldrb r2, [r0]
	adds r0, r1, 0
	asrs r0, r2
	movs r3, 0x1
	ands r0, r3
	cmp r0, 0
	beq _08110086
	adds r0, r3, 0
	lsls r0, r2
	eors r1, r0
	strh r1, [r4]
_08110086:
	mov r0, r8
_08110088:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08110094: .4byte 0x02026af6
_08110098: .4byte gUnknown_083F8410
_0811009C: .4byte gSaveBlock1
_081100A0: .4byte 0x000013c2
	thumb_func_end sub_810FC18

	thumb_func_start sub_810FCB0
sub_810FCB0: @ 81100A4
	push {r4,r5,lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _081100D8 @ =0x02026af6
	ldrh r4, [r0]
	movs r5, 0x1
_081100B0:
	adds r1, r2, 0
	adds r1, 0x8
	adds r0, r4, 0
	asrs r0, r1
	ands r0, r5
	cmp r0, 0
	beq _081100C4
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
_081100C4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x7
	bls _081100B0
	adds r0, r3, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_081100D8: .4byte 0x02026af6
	thumb_func_end sub_810FCB0

	thumb_func_start sub_810FCE8
sub_810FCE8: @ 81100DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	movs r5, 0
	ldr r2, _081100FC @ =gSaveBlock2
	ldrh r1, [r2, 0xE]
	ldr r0, _08110100 @ =0x000003e6
	cmp r1, r0
	bhi _08110148
	ldr r7, _08110104 @ =gSaveBlock1
	adds r6, r2, 0
	ldr r0, _08110108 @ =0x000013c4
	adds r0, r7
	mov r8, r0
	b _0811012A
	.align 2, 0
_081100FC: .4byte gSaveBlock2
_08110100: .4byte 0x000003e6
_08110104: .4byte gSaveBlock1
_08110108: .4byte 0x000013c4
_0811010C:
	ldrh r1, [r6, 0xE]
	ldr r0, _08110140 @ =0x000013c4
	adds r4, r7, r0
	ldrh r0, [r4]
	subs r1, r0
	cmp r1, 0xB
	ble _08110148
	bl sub_810FC18
	ldrh r0, [r4]
	adds r0, 0xC
	strh r0, [r4]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0811012A:
	bl sub_810FCB0
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x4
	bhi _08110144
	ldrh r0, [r6, 0xE]
	mov r1, r8
	strh r0, [r1]
	b _08110148
	.align 2, 0
_08110140: .4byte 0x000013c4
_08110144:
	cmp r5, 0x8
	bne _0811010C
_08110148:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_810FCE8

	thumb_func_start sub_810FD60
sub_810FD60: @ 8110154
	ldr r0, _08110168 @ =gSaveBlock1
	ldr r1, _0811016C @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _08110170 @ =gSpecialVar_0x8004
	ldrh r1, [r1]
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08110168: .4byte gSaveBlock1
_0811016C: .4byte 0x000013c2
_08110170: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FD60

	thumb_func_start sub_810FD80
sub_810FD80: @ 8110174
	ldr r2, _08110198 @ =gSaveBlock1
	ldr r0, _0811019C @ =0x000013c2
	adds r2, r0
	ldrh r1, [r2]
	movs r3, 0x80
	lsls r3, 6
	adds r0, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 1
	adds r1, r3, 0
	orrs r0, r1
	movs r3, 0x80
	lsls r3, 3
	adds r1, r3, 0
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08110198: .4byte gSaveBlock1
_0811019C: .4byte 0x000013c2
	thumb_func_end sub_810FD80

	thumb_func_start sub_810FDAC
sub_810FDAC: @ 81101A0
	push {lr}
	movs r3, 0
	movs r2, 0
	ldr r0, _081101BC @ =gSpecialVar_0x8004
	ldrh r0, [r0]
	subs r0, 0x8
	cmp r0, 0x7
	bhi _08110200
	lsls r0, 2
	ldr r1, _081101C0 @ =_081101C4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_081101BC: .4byte gSpecialVar_0x8004
_081101C0: .4byte _081101C4
	.align 2, 0
_081101C4:
	.4byte _08110200
	.4byte _08110200
	.4byte _081101E4
	.4byte _081101EA
	.4byte _081101F0
	.4byte _081101F6
	.4byte _081101FC
	.4byte _08110200
_081101E4:
	movs r3, 0
	movs r2, 0x3
	b _08110200
_081101EA:
	movs r3, 0
	movs r2, 0x1
	b _08110200
_081101F0:
	movs r3, 0x1
	movs r2, 0
	b _08110200
_081101F6:
	movs r3, 0
	movs r2, 0x4
	b _08110200
_081101FC:
	movs r3, 0x1
	movs r2, 0x5
_08110200:
	ldr r0, _0811020C @ =0x020287ec
	adds r1, r3, 0
	bl sub_810FE1C
	pop {r0}
	bx r0
	.align 2, 0
_0811020C: .4byte 0x020287ec
	thumb_func_end sub_810FDAC

	thumb_func_start sub_810FE1C
sub_810FE1C: @ 8110210
	push {r4,lr}
	lsls r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsrs r1, 20
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _081102C4
	cmp r2, 0x5
	bhi _081102B0
	lsls r0, r2, 2
	ldr r1, _08110230 @ =_08110234
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110230: .4byte _08110234
	.align 2, 0
_08110234:
	.4byte _081102B0
	.4byte _0811024C
	.4byte _08110260
	.4byte _08110274
	.4byte _08110288
	.4byte _0811029C
_0811024C:
	ldr r0, _08110258 @ =gStringVar1
	ldr r1, _0811025C @ =gOtherText_Steven
	bl StringCopy
	b _081102E6
	.align 2, 0
_08110258: .4byte gStringVar1
_0811025C: .4byte gOtherText_Steven
_08110260:
	ldr r0, _0811026C @ =gStringVar1
	ldr r1, _08110270 @ =gOtherText_Brawly
	bl StringCopy
	b _081102E6
	.align 2, 0
_0811026C: .4byte gStringVar1
_08110270: .4byte gOtherText_Brawly
_08110274:
	ldr r0, _08110280 @ =gStringVar1
	ldr r1, _08110284 @ =gOtherText_Winona
	bl StringCopy
	b _081102E6
	.align 2, 0
_08110280: .4byte gStringVar1
_08110284: .4byte gOtherText_Winona
_08110288:
	ldr r0, _08110294 @ =gStringVar1
	ldr r1, _08110298 @ =gOtherText_Phoebe
	bl StringCopy
	b _081102E6
	.align 2, 0
_08110294: .4byte gStringVar1
_08110298: .4byte gOtherText_Phoebe
_0811029C:
	ldr r0, _081102A8 @ =gStringVar1
	ldr r1, _081102AC @ =gOtherText_Glacia
	bl StringCopy
	b _081102E6
	.align 2, 0
_081102A8: .4byte gStringVar1
_081102AC: .4byte gOtherText_Glacia
_081102B0:
	ldr r0, _081102BC @ =gStringVar1
	ldr r1, _081102C0 @ =gOtherText_Wallace
	bl StringCopy
	b _081102E6
	.align 2, 0
_081102BC: .4byte gStringVar1
_081102C0: .4byte gOtherText_Wallace
_081102C4:
	ldr r4, _081102EC @ =gStringVar1
	adds r0, r4, 0
	movs r2, 0x7
	bl StringCopyN
	movs r0, 0xFF
	strb r0, [r4, 0x7]
	ldrb r0, [r4]
	cmp r0, 0xFC
	bne _081102E6
	ldrb r0, [r4, 0x1]
	cmp r0, 0x15
	bne _081102E6
	adds r0, r4, 0
	movs r1, 0x1
	bl ConvertInternationalString
_081102E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_081102EC: .4byte gStringVar1
	thumb_func_end sub_810FE1C

	thumb_func_start sub_810FEFC
sub_810FEFC: @ 81102F0
	push {lr}
	ldr r0, _08110314 @ =0x00004095
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _08110320
	bl sub_810FA74
	ldr r0, _08110318 @ =gUnknown_02024D26
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _0811031C
	bl sub_810FB9C
	b _08110320
	.align 2, 0
_08110314: .4byte 0x00004095
_08110318: .4byte gUnknown_02024D26
_0811031C:
	bl sub_810FC18
_08110320:
	pop {r0}
	bx r0
	thumb_func_end sub_810FEFC

	thumb_func_start sub_810FF30
sub_810FF30: @ 8110324
	ldr r0, _08110334 @ =gSaveBlock1
	ldr r1, _08110338 @ =0x000013c2
	adds r0, r1
	ldrh r0, [r0]
	lsrs r0, 7
	movs r1, 0x1
	ands r0, r1
	bx lr
	.align 2, 0
_08110334: .4byte gSaveBlock1
_08110338: .4byte 0x000013c2
	thumb_func_end sub_810FF30

	thumb_func_start sub_810FF48
sub_810FF48: @ 811033C
	ldr r0, _0811034C @ =gSaveBlock1
	ldr r1, _08110350 @ =0x000013c2
	adds r0, r1
	ldrh r2, [r0]
	movs r1, 0x80
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0811034C: .4byte gSaveBlock1
_08110350: .4byte 0x000013c2
	thumb_func_end sub_810FF48

	thumb_func_start sub_810FF60
sub_810FF60: @ 8110354
	push {lr}
	ldr r0, _08110368 @ =gSpecialVar_0x8004
	ldrb r0, [r0]
	bl sub_810FB10
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08110368: .4byte gSpecialVar_0x8004
	thumb_func_end sub_810FF60

	.align 2, 0 @ Don't pad with nop.
