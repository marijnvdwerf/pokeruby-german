	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CreateShopMenu
CreateShopMenu: @ 80B2EA4
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl ScriptContext2_Enable
	ldr r1, _080B2EE0
	movs r0, 0
	strb r4, [r1, 0xC]
	strb r0, [r1, 0x9]
	cmp r4, 0
	bne _080B2EEC
	movs r0, 0x2
	strb r0, [r1, 0xA]
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x7
	bl MenuDrawTextWindow
	ldr r3, _080B2EE4
	ldr r0, _080B2EE8
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x3
	bl PrintMenuItemsReordered
	b _080B2F0C
	.align 2, 0
_080B2EE0: .4byte gUnknown_03000708
_080B2EE4: .4byte gUnknown_083CC6D0
_080B2EE8: .4byte gUnknown_083CC6E8
_080B2EEC:
	movs r0, 0x1
	strb r0, [r1, 0xA]
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r3, _080B2F3C
	ldr r0, _080B2F40
	str r0, [sp]
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x2
	bl PrintMenuItemsReordered
_080B2F0C:
	ldr r0, _080B2F44
	ldrb r3, [r0, 0xA]
	adds r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	bl InitMenu
	ldr r0, _080B2F48
	movs r1, 0x8
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B2F3C: .4byte gUnknown_083CC6D0
_080B2F40: .4byte gUnknown_083CC6EB
_080B2F44: .4byte gUnknown_03000708
_080B2F48: .4byte sub_80B2E38
	thumb_func_end CreateShopMenu

	thumb_func_start SetShopMenuCallback
SetShopMenuCallback: @ 80B2F4C
	ldr r1, _080B2F54
	str r0, [r1]
	bx lr
	.align 2, 0
_080B2F54: .4byte gUnknown_03000708
	thumb_func_end SetShopMenuCallback

	thumb_func_start SetShopItemsForSale
SetShopItemsForSale: @ 80B2F58
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldr r3, _080B2F84
	str r1, [r3, 0x4]
	strb r2, [r3, 0x8]
	ldrh r0, [r1]
	cmp r0, 0
	beq _080B2F80
_080B2F6A:
	ldrb r0, [r3, 0x8]
	adds r0, 0x1
	strb r0, [r3, 0x8]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r2, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0
	bne _080B2F6A
_080B2F80:
	pop {r0}
	bx r0
	.align 2, 0
_080B2F84: .4byte gUnknown_03000708
	thumb_func_end SetShopItemsForSale

	thumb_func_start sub_80B2E38
sub_80B2E38: @ 80B2F88
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080B2FB0
	ldrh r1, [r2, 0x30]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080B2FB8
	ldr r4, _080B2FB4
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	beq _080B3044
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080B2FD2
	.align 2, 0
_080B2FB0: .4byte gMain
_080B2FB4: .4byte gUnknown_03000708
_080B2FB8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080B2FE0
	ldr r4, _080B2FDC
	ldrb r0, [r4, 0x9]
	ldrb r1, [r4, 0xA]
	cmp r0, r1
	beq _080B3044
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080B2FD2:
	bl MoveMenuCursor
	strb r0, [r4, 0x9]
	b _080B3044
	.align 2, 0
_080B2FDC: .4byte gUnknown_03000708
_080B2FE0:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B3030
	movs r0, 0x5
	bl PlaySE
	ldr r3, _080B3000
	ldrb r0, [r3, 0xC]
	cmp r0, 0
	bne _080B300C
	ldr r1, _080B3004
	ldr r2, _080B3008
	b _080B3010
	.align 2, 0
_080B3000: .4byte gUnknown_03000708
_080B3004: .4byte gUnknown_083CC6D0
_080B3008: .4byte gUnknown_083CC6E8
_080B300C:
	ldr r1, _080B3028
	ldr r2, _080B302C
_080B3010:
	ldrb r0, [r3, 0x9]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _080B3044
	.align 2, 0
_080B3028: .4byte gUnknown_083CC6D0
_080B302C: .4byte gUnknown_083CC6EB
_080B3030:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B3044
	movs r0, 0x5
	bl PlaySE
	adds r0, r4, 0
	bl HandleShopMenuQuit
_080B3044:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80B2E38

	thumb_func_start sub_80B2EFC
sub_80B2EFC: @ 80B304C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B3074
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080B3078
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080B307C
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080B3074: .4byte gTasks
_080B3078: .4byte BuyMenuDrawGraphics
_080B307C: .4byte sub_80B2FA0
	thumb_func_end sub_80B2EFC

	thumb_func_start sub_80B2F30
sub_80B2F30: @ 80B3080
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B30A8
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r2, _080B30AC
	lsrs r0, r2, 16
	strh r0, [r1, 0x18]
	strh r2, [r1, 0x1A]
	ldr r0, _080B30B0
	str r0, [r1]
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	pop {r0}
	bx r0
	.align 2, 0
_080B30A8: .4byte gTasks
_080B30AC: .4byte sub_80A6300
_080B30B0: .4byte sub_80B2FA0
	thumb_func_end sub_80B2F30

	thumb_func_start HandleShopMenuQuit
HandleShopMenuQuit: @ 80B30B4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0
	movs r2, 0xB
	movs r3, 0x8
	bl MenuZeroFillWindowRect
	bl sub_80BE3BC
	bl ScriptContext2_Disable
	adds r0, r4, 0
	bl DestroyTask
	ldr r0, _080B30EC
	ldr r0, [r0]
	cmp r0, 0
	beq _080B30E6
	bl _call_via_r0
_080B30E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B30EC: .4byte gUnknown_03000708
	thumb_func_end HandleShopMenuQuit

	thumb_func_start sub_80B2FA0
sub_80B2FA0: @ 80B30F0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B3124
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B311E
	ldr r0, _080B3128
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x18]
	lsls r0, 16
	ldrh r1, [r1, 0x1A]
	orrs r0, r1
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080B311E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3124: .4byte gPaletteFade
_080B3128: .4byte gTasks
	thumb_func_end sub_80B2FA0

	thumb_func_start ReturnToShopMenuAfterExitingSellMenu
ReturnToShopMenuAfterExitingSellMenu: @ 80B312C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B3148
	ldrb r0, [r0, 0xC]
	bl CreateShopMenu
	adds r0, r4, 0
	bl DestroyTask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3148: .4byte gUnknown_03000708
	thumb_func_end ReturnToShopMenuAfterExitingSellMenu

	thumb_func_start Task_ExitSellMenu
Task_ExitSellMenu: @ 80B314C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r5, r4, 0
	bl sub_807D770
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3190
	ldr r0, _080B3178
	ldrb r0, [r0, 0xC]
	cmp r0, 0x2
	bne _080B3184
	ldr r1, _080B317C
	ldr r2, _080B3180
	adds r0, r4, 0
	movs r3, 0
	bl DisplayItemMessageOnField
	b _080B3190
	.align 2, 0
_080B3178: .4byte gUnknown_03000708
_080B317C: .4byte gOtherText_CanIHelpYou
_080B3180: .4byte ReturnToShopMenuAfterExitingSellMenu
_080B3184:
	ldr r1, _080B3198
	ldr r2, _080B319C
	adds r0, r5, 0
	movs r3, 0
	bl DisplayItemMessageOnField
_080B3190:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3198: .4byte gOtherText_AnythingElse
_080B319C: .4byte ReturnToShopMenuAfterExitingSellMenu
	thumb_func_end Task_ExitSellMenu

	thumb_func_start sub_80B3050
sub_80B3050: @ 80B31A0
	push {lr}
	bl pal_fill_black
	ldr r0, _080B31B4
	movs r1, 0x8
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_080B31B4: .4byte Task_ExitSellMenu
	thumb_func_end sub_80B3050

	thumb_func_start sub_80B3068
sub_80B3068: @ 80B31B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl Task_ExitSellMenu
	pop {r0}
	bx r0
	thumb_func_end sub_80B3068

	thumb_func_start unref_sub_80B3078
unref_sub_80B3078: @ 80B31C8
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _080B31DC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldr r0, _080B31E0
	str r0, [r1]
	bx lr
	.align 2, 0
_080B31DC: .4byte gTasks
_080B31E0: .4byte Task_ExitSellMenu
	thumb_func_end unref_sub_80B3078

	thumb_func_start sub_80B3094
sub_80B3094: @ 80B31E4
	push {lr}
	bl AnimateSprites
	bl BuildOamBuffer
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_80B3094

	thumb_func_start sub_80B30AC
sub_80B30AC: @ 80B31FC
	push {r4,lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	ldr r3, _080B3240
	ldr r1, _080B3244
	ldr r0, _080B3248
	str r3, [r0]
	str r1, [r0, 0x4]
	ldr r4, _080B324C
	str r4, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r2, 0x80
	lsls r2, 4
	adds r1, r3, r2
	ldr r2, _080B3250
	str r1, [r0]
	str r2, [r0, 0x4]
	str r4, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r1, 0x80
	lsls r1, 5
	adds r3, r1
	ldr r1, _080B3254
	str r3, [r0]
	str r1, [r0, 0x4]
	str r4, [r0, 0x8]
	ldr r0, [r0, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3240: .4byte 0x020219cc
_080B3244: .4byte 0x0600e800
_080B3248: .4byte 0x040000d4
_080B324C: .4byte 0x80000400
_080B3250: .4byte 0x0600e000
_080B3254: .4byte 0x0600f000
	thumb_func_end sub_80B30AC

	thumb_func_start BuyMenuDrawGraphics
BuyMenuDrawGraphics: @ 80B3258
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	bl sub_80F9438
	bl remove_some_task
	ldr r0, _080B3354
	movs r5, 0
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	adds r0, 0x2
	strh r5, [r0]
	ldr r0, _080B3358
	mov r8, r0
	ldrb r0, [r0, 0x8]
	movs r1, 0x80
	orrs r0, r1
	mov r1, r8
	strb r0, [r1, 0x8]
	movs r1, 0xE0
	lsls r1, 19
	movs r6, 0
	str r6, [sp, 0x4]
	ldr r0, _080B335C
	add r2, sp, 0x4
	str r2, [r0]
	str r1, [r0, 0x4]
	ldr r1, _080B3360
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	ldr r0, _080B3364
	ldr r1, _080B3368
	bl LZDecompressVram
	ldr r0, _080B336C
	ldr r1, _080B3370
	bl sub_800D238
	ldr r0, _080B3374
	movs r1, 0xC0
	movs r2, 0x20
	bl LoadCompressedPalette
	bl FreeAllSpritePalettes
	bl ResetPaletteFade
	bl ResetSpriteData
	bl ResetTasks
	ldr r4, _080B3378
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	bl BuyMenuDrawMapGraphics
	ldr r0, _080B337C
	strb r6, [r0, 0x9]
	strb r5, [r0, 0xB]
	movs r0, 0
	movs r1, 0
	movs r2, 0x20
	movs r3, 0x20
	bl MenuZeroFillWindowRect
	ldr r0, _080B3380
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0
	bl sub_80B7C14
	movs r0, 0
	movs r1, 0x7
	bl sub_80B3764
	bl sub_80B37EC
	bl sub_80B3270
	ldr r0, _080B3384
	movs r1, 0x8
	bl CreateTask
	bl sub_80B3240
	movs r0, 0x1
	negs r0, r0
	str r6, [sp]
	movs r1, 0
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	mov r2, r8
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
	ldr r0, _080B3388
	bl SetVBlankCallback
	ldr r0, _080B338C
	bl SetMainCallback2
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3354: .4byte 0x04000014
_080B3358: .4byte gPaletteFade
_080B335C: .4byte 0x040000d4
_080B3360: .4byte 0x85000100
_080B3364: .4byte gBuyMenuFrame_Gfx
_080B3368: .4byte 0x06007c00
_080B336C: .4byte gBuyMenuFrame_Tilemap
_080B3370: .4byte 0x02018000
_080B3374: .4byte gMenuMoneyPal
_080B3378: .4byte gWindowConfig_81E6DFC
_080B337C: .4byte gUnknown_03000708
_080B3380: .4byte gSaveBlock1
_080B3384: .4byte sub_80B40E8
_080B3388: .4byte sub_80B30AC
_080B338C: .4byte sub_80B3094
	thumb_func_end BuyMenuDrawGraphics

	thumb_func_start sub_80B3240
sub_80B3240: @ 80B3390
	push {lr}
	sub sp, 0x4
	ldr r1, _080B33BC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	mov r0, sp
	adds r0, 0x2
	movs r1, 0xD1
	movs r2, 0x2
	bl LoadPalette
	mov r0, sp
	movs r1, 0xD8
	movs r2, 0x2
	bl LoadPalette
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B33BC: .4byte gUnknown_083CC710
	thumb_func_end sub_80B3240

	thumb_func_start sub_80B3270
sub_80B3270: @ 80B33C0
	push {lr}
	bl sub_80F944C
	ldr r0, _080B33F0
	ldrb r0, [r0, 0x8]
	cmp r0, 0x7
	bls _080B33EA
	movs r0, 0
	movs r1, 0xAC
	movs r2, 0xC
	bl CreateVerticalScrollIndicators
	movs r0, 0x1
	movs r1, 0xAC
	movs r2, 0x94
	bl CreateVerticalScrollIndicators
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
_080B33EA:
	pop {r0}
	bx r0
	.align 2, 0
_080B33F0: .4byte gUnknown_03000708
	thumb_func_end sub_80B3270

	thumb_func_start sub_80B32A4
sub_80B32A4: @ 80B33F4
	push {lr}
	ldr r0, _080B3408
	ldrb r0, [r0, 0xB]
	cmp r0, 0
	bne _080B340C
	movs r0, 0
	movs r1, 0x1
	bl sub_80F979C
	b _080B3414
	.align 2, 0
_080B3408: .4byte gUnknown_03000708
_080B340C:
	movs r0, 0
	movs r1, 0
	bl sub_80F979C
_080B3414:
	ldr r1, _080B342C
	ldrb r0, [r1, 0xB]
	adds r0, 0x7
	ldrb r1, [r1, 0x8]
	cmp r0, r1
	blt _080B3430
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	b _080B3438
	.align 2, 0
_080B342C: .4byte gUnknown_03000708
_080B3430:
	movs r0, 0x1
	movs r1, 0
	bl sub_80F979C
_080B3438:
	pop {r0}
	bx r0
	thumb_func_end sub_80B32A4

	thumb_func_start sub_80B32EC
sub_80B32EC: @ 80B343C
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldr r2, _080B3454
	adds r0, r2, 0
	strh r0, [r1]
	strh r0, [r1, 0x2]
	bx lr
	.align 2, 0
_080B3454: .4byte 0x0000c3e1
	thumb_func_end sub_80B32EC

	thumb_func_start BuyMenuDrawMapMetatileLayer
BuyMenuDrawMapMetatileLayer: @ 80B3458
	lsls r1, 16
	asrs r1, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r2
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, 0x2]
	strh r0, [r1, 0x2]
	adds r2, r1, 0
	adds r2, 0x40
	ldrh r0, [r3, 0x4]
	strh r0, [r2]
	adds r1, 0x42
	ldrh r0, [r3, 0x6]
	strh r0, [r1]
	bx lr
	thumb_func_end BuyMenuDrawMapMetatileLayer

	thumb_func_start BuyMenuDrawMapMetatile
BuyMenuDrawMapMetatile: @ 80B3480
	push {r4-r7,lr}
	adds r7, r2, 0
	lsls r3, 24
	lsrs r3, 24
	adds r2, r3, 0
	lsls r0, 17
	lsrs r0, 16
	lsls r1, 22
	movs r4, 0x80
	lsls r4, 15
	adds r1, r4
	lsrs r1, 16
	cmp r3, 0x1
	beq _080B34B4
	cmp r3, 0x1
	bgt _080B34A6
	cmp r3, 0
	beq _080B34AC
	b _080B3510
_080B34A6:
	cmp r2, 0x2
	beq _080B34E8
	b _080B3510
_080B34AC:
	ldr r5, _080B34B0
	b _080B34B6
	.align 2, 0
_080B34B0: .4byte 0x020221cc
_080B34B4:
	ldr r5, _080B34E0
_080B34B6:
	lsls r6, r0, 16
	asrs r6, 16
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	adds r3, r7, 0
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, _080B34E4
	adds r5, r0
	adds r3, r7, 0
	adds r3, 0x8
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl BuyMenuDrawMapMetatileLayer
	b _080B3510
	.align 2, 0
_080B34E0: .4byte 0x020229cc
_080B34E4: .4byte 0xfffff800
_080B34E8:
	ldr r5, _080B3518
	lsls r6, r0, 16
	asrs r6, 16
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	adds r3, r7, 0
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, _080B351C
	adds r5, r0
	adds r3, r7, 0
	adds r3, 0x8
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl BuyMenuDrawMapMetatileLayer
_080B3510:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3518: .4byte 0x020229cc
_080B351C: .4byte 0xfffff000
	thumb_func_end BuyMenuDrawMapMetatile

	thumb_func_start sub_80B33D0
sub_80B33D0: @ 80B3520
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	adds r4, r1, 0
	mov r8, r2
	lsls r4, 22
	ldr r5, _080B3568
	lsls r6, 17
	asrs r6, 16
	movs r0, 0x80
	lsls r0, 15
	adds r4, r0
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	mov r3, r8
	bl BuyMenuDrawMapMetatileLayer
	ldr r0, _080B356C
	adds r5, r0
	movs r0, 0x8
	add r8, r0
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	mov r3, r8
	bl BuyMenuDrawMapMetatileLayer
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3568: .4byte 0x020229cc
_080B356C: .4byte 0xfffff800
	thumb_func_end sub_80B33D0

	thumb_func_start sub_80B3420
sub_80B3420: @ 80B3570
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x3
	strh r0, [r1]
	ldrh r0, [r4]
	subs r0, 0x3
	strh r0, [r4]
	movs r1, 0
	ldr r0, _080B35F8
	mov r10, r0
	ldr r2, _080B35FC
	mov r9, r2
_080B35A2:
	movs r4, 0
	lsls r1, 16
	mov r8, r1
	asrs r7, r1, 16
_080B35AA:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	lsls r4, 16
	asrs r6, r4, 16
	adds r0, r6
	mov r2, sp
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	adds r1, r7
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r7, 0x5
	beq _080B3620
	cmp r6, 0x6
	beq _080B3620
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r0, r6
	mov r2, sp
	movs r3, 0x2
	ldrsh r1, [r2, r3]
	adds r1, r7
	bl MapGridGetMetatileLayerTypeAt
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r5, r10
	bhi _080B3600
	mov r1, r9
	ldr r0, [r1]
	ldr r0, [r0, 0x10]
	lsls r1, r5, 4
	ldr r2, [r0, 0xC]
	adds r2, r1
	b _080B3610
	.align 2, 0
_080B35F8: .4byte 0x000001ff
_080B35FC: .4byte gMapHeader
_080B3600:
	mov r2, r9
	ldr r0, [r2]
	ldr r1, [r0, 0x14]
	ldr r2, _080B361C
	adds r0, r5, r2
	lsls r0, 4
	ldr r2, [r1, 0xC]
	adds r2, r0
_080B3610:
	adds r0, r6, 0
	adds r1, r7, 0
	bl BuyMenuDrawMapMetatile
	b _080B3656
	.align 2, 0
_080B361C: .4byte 0xfffffe00
_080B3620:
	cmp r5, r10
	bhi _080B363C
	asrs r0, r4, 16
	mov r3, r9
	ldr r1, [r3]
	ldr r1, [r1, 0x10]
	lsls r3, r5, 4
	ldr r2, [r1, 0xC]
	adds r2, r3
	mov r3, r8
	asrs r1, r3, 16
	bl sub_80B33D0
	b _080B3656
_080B363C:
	asrs r0, r4, 16
	mov r2, r9
	ldr r1, [r2]
	ldr r2, [r1, 0x14]
	ldr r3, _080B369C
	adds r1, r5, r3
	lsls r1, 4
	ldr r2, [r2, 0xC]
	adds r2, r1
	mov r3, r8
	asrs r1, r3, 16
	bl sub_80B33D0
_080B3656:
	cmp r7, 0
	bne _080B3670
	asrs r1, r4, 16
	cmp r1, 0
	beq _080B3670
	cmp r1, 0x6
	beq _080B3670
	lsls r1, 17
	asrs r1, 16
	ldr r0, _080B36A0
	movs r2, 0x40
	bl sub_80B32EC
_080B3670:
	movs r1, 0x80
	lsls r1, 9
	adds r0, r4, r1
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x6
	ble _080B35AA
	adds r0, r1, 0
	add r0, r8
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, 0x5
	ble _080B35A2
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B369C: .4byte 0xfffffe00
_080B36A0: .4byte 0x020219cc
	thumb_func_end sub_80B3420

	thumb_func_start BuyMenuDrawMapGraphics
BuyMenuDrawMapGraphics: @ 80B36A4
	push {lr}
	bl sub_80F9020
	bl sub_80B356C
	bl sub_80B368C
	bl sub_80B3420
	pop {r0}
	bx r0
	thumb_func_end BuyMenuDrawMapGraphics

	thumb_func_start sub_80B356C
sub_80B356C: @ 80B36BC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	movs r0, 0
	mov r8, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl GetXYCoordsOneStepInFrontOfPlayer
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	movs r5, 0
	ldr r2, _080B37C4
	movs r1, 0x10
_080B36E8:
	lsls r0, r5, 3
	adds r0, r2
	strh r1, [r0]
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080B36E8
	movs r5, 0
	ldr r7, _080B37C8
	subs r1, r7, 0x6
	mov r9, r1
_080B3700:
	movs r4, 0
	adds r2, r5, 0x1
	mov r10, r2
_080B3706:
	mov r1, sp
	ldr r3, _080B37CC
	adds r0, r3, 0
	ldrh r1, [r1]
	adds r0, r1
	adds r0, r4
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _080B37D0
	adds r1, r2, 0
	mov r3, sp
	ldrh r3, [r3, 0x2]
	adds r1, r3
	adds r1, r5
	lsls r1, 16
	lsrs r1, 16
	ldr r2, [sp, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x10
	beq _080B37A0
	mov r0, r8
	lsls r3, r0, 3
	mov r1, r9
	adds r0, r3, r1
	movs r6, 0
	strh r2, [r0]
	mov r0, r9
	adds r0, 0x2
	adds r0, r3, r0
	strh r4, [r0]
	ldr r1, _080B37D4
	adds r0, r3, r1
	strh r5, [r0]
	ldr r1, _080B37D8
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r2, r0, r1
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x1
	bne _080B3766
	adds r0, r3, r7
	strh r6, [r0]
_080B3766:
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x2
	bne _080B3776
	adds r1, r3, r7
	movs r0, 0x1
	strh r0, [r1]
_080B3776:
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x3
	bne _080B3786
	adds r1, r3, r7
	movs r0, 0x2
	strh r0, [r1]
_080B3786:
	ldrb r0, [r2, 0x18]
	lsls r0, 28
	lsrs r0, 28
	cmp r0, 0x4
	bne _080B3796
	adds r1, r3, r7
	movs r0, 0x3
	strh r0, [r1]
_080B3796:
	mov r0, r8
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
_080B37A0:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	bls _080B3706
	mov r2, r10
	lsls r0, r2, 24
	lsrs r5, r0, 24
	cmp r5, 0x4
	bls _080B3700
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B37C4: .4byte gUnknown_020386A4
_080B37C8: .4byte gUnknown_020386AA
_080B37CC: .4byte 0x0000fffd
_080B37D0: .4byte 0x0000fffe
_080B37D4: .4byte gUnknown_020386A8
_080B37D8: .4byte gMapObjects
	thumb_func_end sub_80B356C

	thumb_func_start sub_80B368C
sub_80B368C: @ 80B37DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	movs r5, 0
	ldr r6, _080B3860
	adds r0, r6, 0x6
	mov r8, r0
	ldr r7, _080B3864
_080B37EE:
	lsls r4, r5, 3
	adds r1, r4, r6
	movs r2, 0
	ldrsh r0, [r1, r2]
	cmp r0, 0x10
	beq _080B3848
	adds r1, r0, 0
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0, 0x5]
	adds r1, r6, 0x2
	adds r1, r4, r1
	ldrh r2, [r1]
	lsls r2, 4
	adds r2, 0x8
	lsls r2, 16
	asrs r2, 16
	adds r1, r6, 0x4
	adds r1, r4, r1
	ldrh r3, [r1]
	lsls r3, 20
	movs r1, 0x80
	lsls r1, 14
	adds r3, r1
	asrs r3, 16
	movs r1, 0x2
	str r1, [sp]
	ldr r1, _080B3868
	bl AddPseudoFieldObject
	lsls r0, 24
	lsrs r0, 24
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	ldr r0, _080B386C
	adds r2, r0
	mov r1, r8
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r0, r2, 0
	bl StartSpriteAnim
_080B3848:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0xF
	bls _080B37EE
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3860: .4byte gUnknown_020386A4
_080B3864: .4byte gMapObjects
_080B3868: .4byte SpriteCallbackDummy
_080B386C: .4byte gSprites
	thumb_func_end sub_80B368C

	thumb_func_start sub_80B3720
sub_80B3720: @ 80B3870
	push {r4-r6,lr}
	movs r1, 0
	ldr r6, _080B38A4
	ldr r5, _080B38A8
	ldr r4, _080B38AC
	ldr r0, _080B38B0
	adds r3, r0, 0
_080B387E:
	lsls r0, r1, 16
	asrs r2, r0, 16
	lsls r1, r2, 1
	adds r0, r1, r4
	ldrh r0, [r0]
	cmp r0, 0
	beq _080B3892
	adds r1, r6
	adds r0, r3
	strh r0, [r1]
_080B3892:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	asrs r0, 16
	cmp r0, r5
	ble _080B387E
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B38A4: .4byte 0x020219cc
_080B38A8: .4byte 0x000003ff
_080B38AC: .4byte 0x02018000
_080B38B0: .4byte 0x0000c3e0
	thumb_func_end sub_80B3720

	thumb_func_start sub_80B3764
sub_80B3764: @ 80B38B4
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_80B3720
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl sub_80B39D0
	ldr r0, _080B38E8
	ldrb r0, [r0, 0x9]
	str r0, [sp]
	movs r0, 0xF
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x2
	movs r3, 0x8
	bl InitMenu
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B38E8: .4byte gUnknown_03000708
	thumb_func_end sub_80B3764

	thumb_func_start sub_80B379C
sub_80B379C: @ 80B38EC
	push {r4-r7,lr}
	movs r1, 0
	ldr r0, _080B3930
	mov r12, r0
	ldr r7, _080B3934
	ldr r0, _080B3938
	adds r6, r0, 0
_080B38FA:
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0xC
	adds r5, r1, 0x1
	lsls r4, r0, 5
	lsls r3, r1, 5
_080B3906:
	adds r1, r4, r2
	lsls r1, 1
	add r1, r12
	adds r0, r3, r2
	lsls r0, 1
	adds r0, r7
	ldrh r0, [r0]
	adds r0, r6, r0
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0xD
	bls _080B3906
	lsls r0, r5, 16
	lsrs r1, r0, 16
	cmp r1, 0x7
	bls _080B38FA
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3930: .4byte 0x020219cc
_080B3934: .4byte 0x02018300
_080B3938: .4byte 0x0000c3e0
	thumb_func_end sub_80B379C

	thumb_func_start sub_80B37EC
sub_80B37EC: @ 80B393C
	push {lr}
	bl sub_80B3A70
	pop {r0}
	bx r0
	thumb_func_end sub_80B37EC

	thumb_func_start sub_80B37F8
sub_80B37F8: @ 80B3948
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r1, _080B39D4
	ldrb r0, [r1, 0xB]
	ldrb r2, [r1, 0x9]
	adds r0, r2
	ldr r1, [r1, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	ldr r0, _080B39D8
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	adds r5, r0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	muls r0, r4
	movs r1, 0x6
	movs r2, 0x6
	movs r3, 0xB
	bl sub_80B7A94
	ldr r0, _080B39DC
	movs r1, 0xFC
	strb r1, [r0]
	movs r1, 0x14
	strb r1, [r0, 0x1]
	movs r1, 0x6
	strb r1, [r0, 0x2]
	adds r0, 0x3
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080B39E0
	movs r1, 0x1
	movs r2, 0xB
	bl MenuPrint
	ldr r0, _080B39E4
	movs r1, 0x2
	str r1, [sp]
	ldr r1, _080B39E8
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A3FA0
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B39D4: .4byte gUnknown_03000708
_080B39D8: .4byte gTasks
_080B39DC: .4byte gStringVar1
_080B39E0: .4byte gOtherText_xString1
_080B39E4: .4byte 0x020219cc
_080B39E8: .4byte 0x0000c3e1
	thumb_func_end sub_80B37F8

	thumb_func_start sub_80B389C
sub_80B389C: @ 80B39EC
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	mov r8, r2
	lsls r0, 16
	lsrs r2, r0, 16
	mov r9, r2
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r5, _080B3A7C
	mov r0, r8
	cmp r0, 0
	beq _080B3A18
	movs r0, 0xFC
	strb r0, [r5]
	movs r0, 0x1
	strb r0, [r5, 0x1]
	movs r0, 0x2
	strb r0, [r5, 0x2]
	adds r5, 0x3
_080B3A18:
	adds r0, r2, 0
	adds r1, r5, 0
	bl CopyItemName
	ldr r6, _080B3A7C
	lsls r7, r4, 3
	movs r0, 0x1
	str r0, [sp]
	adds r0, r6, 0
	movs r1, 0x70
	adds r2, r7, 0
	movs r3, 0x58
	bl sub_8072A18
	adds r5, r6, 0
	mov r0, r8
	cmp r0, 0
	beq _080B3A3E
	adds r5, r6, 0x3
_080B3A3E:
	mov r0, r9
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x4
	bl sub_80B79F8
	adds r0, r6, 0
	movs r1, 0xCA
	adds r2, r7, 0
	movs r3, 0x1
	bl MenuPrint_PixelCoords
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3A7C: .4byte gStringVar1
	thumb_func_end sub_80B389C

	thumb_func_start sub_80B3930
sub_80B3930: @ 80B3A80
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r4, r2, 0
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r2, _080B3AF0
	cmp r4, 0
	beq _080B3AAA
	movs r0, 0xFC
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x1]
	movs r0, 0x2
	strb r0, [r2, 0x2]
	adds r2, 0x3
_080B3AAA:
	lsls r6, r3, 5
	ldr r0, _080B3AF4
	mov r8, r0
	adds r1, r6, r0
	adds r0, r2, 0
	bl StringCopy
	ldr r5, _080B3AF0
	mov r0, r9
	lsls r7, r0, 3
	movs r0, 0x1
	str r0, [sp]
	adds r0, r5, 0
	movs r1, 0x70
	adds r2, r7, 0
	movs r3, 0x58
	bl sub_8072A18
	adds r2, r5, 0
	cmp r4, 0
	beq _080B3AD6
	adds r2, r5, 0x3
_080B3AD6:
	mov r0, r8
	subs r0, 0x1
	adds r3, r6, r0
	ldrh r1, [r3, 0x14]
	ldr r0, _080B3AF8
	cmp r1, r0
	bne _080B3AFC
	movs r0, 0x19
	mov r1, r9
	adds r2, r4, 0
	bl sub_80B7B34
	b _080B3B12
	.align 2, 0
_080B3AF0: .4byte gStringVar1
_080B3AF4: .4byte 0x083f7bf1
_080B3AF8: .4byte 0x00002710
_080B3AFC:
	ldrh r1, [r3, 0x14]
	adds r0, r2, 0
	movs r2, 0x4
	bl sub_80B79F8
	adds r0, r5, 0
	movs r1, 0xCA
	adds r2, r7, 0
	movs r3, 0x1
	bl MenuPrint_PixelCoords
_080B3B12:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3930

	thumb_func_start sub_80B39D0
sub_80B39D0: @ 80B3B20
	push {r4-r6,lr}
	adds r6, r1, 0
	adds r5, r2, 0
	b _080B3B6A
_080B3B28:
	ldrb r0, [r1, 0xC]
	cmp r0, 0
	bne _080B3B4C
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldr r1, [r1, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r4, 25
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	adds r2, r5, 0
	bl sub_80B389C
	b _080B3B68
_080B3B4C:
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldr r1, [r1, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r1, r4, 25
	movs r2, 0x80
	lsls r2, 18
	adds r1, r2
	lsrs r1, 24
	adds r2, r5, 0
	bl sub_80B3930
_080B3B68:
	adds r0, r4, 0x1
_080B3B6A:
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bgt _080B3B7E
	ldr r1, _080B3BB8
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldrb r2, [r1, 0x8]
	cmp r0, r2
	blt _080B3B28
_080B3B7E:
	cmp r4, 0x8
	beq _080B3BB0
	ldr r1, _080B3BB8
	ldrb r0, [r1, 0xB]
	adds r0, r4
	ldrb r1, [r1, 0x8]
	cmp r0, r1
	bne _080B3BB0
	lsls r3, r4, 1
	adds r4, r3, 0x2
	lsls r4, 24
	lsrs r4, 24
	adds r3, 0x3
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0xE
	adds r1, r4, 0
	movs r2, 0x1C
	bl MenuFillWindowRectWithBlankTile
	ldr r0, _080B3BBC
	movs r1, 0xE
	adds r2, r4, 0
	bl MenuPrint
_080B3BB0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B3BB8: .4byte gUnknown_03000708
_080B3BBC: .4byte gOtherText_CancelNoTerminator
	thumb_func_end sub_80B39D0

	thumb_func_start sub_80B3A70
sub_80B3A70: @ 80B3BC0
	push {r4,lr}
	sub sp, 0x8
	ldr r2, _080B3BEC
	ldrb r1, [r2, 0xB]
	ldrb r0, [r2, 0x9]
	adds r0, r1, r0
	ldrb r1, [r2, 0x8]
	cmp r0, r1
	beq _080B3C1C
	ldrb r4, [r2, 0xC]
	cmp r4, 0
	bne _080B3BF0
	ldr r1, [r2, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetDescription
	movs r1, 0x30
	str r1, [sp]
	str r4, [sp, 0x4]
	b _080B3C0A
	.align 2, 0
_080B3BEC: .4byte gUnknown_03000708
_080B3BF0:
	ldr r1, _080B3C18
	ldr r2, [r2, 0x4]
	lsls r0, 1
	adds r0, r2
	ldrh r0, [r0]
	lsls r0, 5
	adds r1, 0x18
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0x30
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
_080B3C0A:
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
	b _080B3C30
	.align 2, 0
_080B3C18: .4byte gDecorations
_080B3C1C:
	ldr r0, _080B3C38
	movs r1, 0x30
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x4
	movs r2, 0x68
	movs r3, 0x68
	bl sub_8072AB0
_080B3C30:
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3C38: .4byte gOtherText_QuitShopping
	thumb_func_end sub_80B3A70

	thumb_func_start sub_80B3AEC
sub_80B3AEC: @ 80B3C3C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _080B3CAC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B3C56
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B3CCA
_080B3C56:
	ldr r4, _080B3CB0
	ldrb r1, [r4, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, 0x4
	bne _080B3CC4
	ldr r0, _080B3CB4
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x9
	ble _080B3CC4
	movs r0, 0xC
	movs r1, 0x1
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3CC4
	ldr r1, _080B3CB8
	ldr r2, _080B3CBC
	ldr r3, _080B3CC0
	adds r0, r5, 0
	bl DisplayItemMessageOnField
	b _080B3CCA
	.align 2, 0
_080B3CAC: .4byte gMain
_080B3CB0: .4byte gUnknown_03000708
_080B3CB4: .4byte gTasks
_080B3CB8: .4byte gOtherText_FreePremierBall
_080B3CBC: .4byte sub_80B4378
_080B3CC0: .4byte 0x0000c3e1
_080B3CC4:
	adds r0, r5, 0
	bl sub_80B4378
_080B3CCA:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3AEC

	thumb_func_start sub_80B3B80
sub_80B3B80: @ 80B3CD0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x26
	bl sav12_xor_increment
	ldr r5, _080B3D10
	ldr r0, _080B3D14
	ldr r1, [r0]
	adds r0, r5, 0
	bl sub_80B79E0
	movs r0, 0x5F
	bl PlaySE
	ldr r0, [r5]
	movs r1, 0
	movs r2, 0
	bl sub_80B7BEC
	ldr r1, _080B3D18
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B3D1C
	str r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D10: .4byte 0x02025bc4
_080B3D14: .4byte gUnknown_020386A0
_080B3D18: .4byte gTasks
_080B3D1C: .4byte sub_80B3AEC
	thumb_func_end sub_80B3B80

	thumb_func_start sub_80B3BD0
sub_80B3BD0: @ 80B3D20
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B3D40
	ldrb r1, [r0, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	adds r0, r4, 0
	bl sub_80B4378
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3D40: .4byte gUnknown_03000708
	thumb_func_end sub_80B3BD0

	thumb_func_start sub_80B3BF4
sub_80B3BF4: @ 80B3D44
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B3DCC
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x9
	movs r3, 0x4
	bl sub_80A3FA0
	bl sub_80B379C
	bl sub_80B3420
	ldr r0, _080B3DD0
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	ldr r1, _080B3DD4
	ldr r1, [r1]
	bl IsEnoughMoney
	lsls r0, 24
	cmp r0, 0
	beq _080B3E68
	ldr r4, _080B3DD8
	ldrb r0, [r4, 0xC]
	cmp r0, 0
	bne _080B3DFC
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldr r2, _080B3DDC
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r2
	ldrh r1, [r1, 0xA]
	bl AddBagItem
	lsls r0, 24
	cmp r0, 0
	beq _080B3DEC
	ldr r1, _080B3DE0
	ldr r2, _080B3DE4
	ldr r3, _080B3DE8
	adds r0, r5, 0
	bl DisplayItemMessageOnField
	adds r0, r5, 0
	bl sub_80B4470
	b _080B3E74
	.align 2, 0
_080B3DCC: .4byte 0x020219cc
_080B3DD0: .4byte gSaveBlock1
_080B3DD4: .4byte gUnknown_020386A0
_080B3DD8: .4byte gUnknown_03000708
_080B3DDC: .4byte gTasks
_080B3DE0: .4byte gOtherText_HereYouGo
_080B3DE4: .4byte sub_80B3B80
_080B3DE8: .4byte 0x0000c3e1
_080B3DEC:
	ldr r1, _080B3DF4
	ldr r2, _080B3DF8
	b _080B3E28
	.align 2, 0
_080B3DF4: .4byte gOtherText_NoRoomFor
_080B3DF8: .4byte sub_80B3BD0
_080B3DFC:
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrb r0, [r0]
	bl IsThereStorageSpaceForDecoration
	lsls r0, 24
	cmp r0, 0
	beq _080B3E40
	ldrb r0, [r4, 0xC]
	cmp r0, 0x1
	bne _080B3E24
	ldr r1, _080B3E20
	b _080B3E26
	.align 2, 0
_080B3E20: .4byte gOtherText_HereYouGo2
_080B3E24:
	ldr r1, _080B3E34
_080B3E26:
	ldr r2, _080B3E38
_080B3E28:
	ldr r3, _080B3E3C
	adds r0, r5, 0
	bl DisplayItemMessageOnField
	b _080B3E74
	.align 2, 0
_080B3E34: .4byte gOtherText_HereYouGo3
_080B3E38: .4byte sub_80B3B80
_080B3E3C: .4byte 0x0000c3e1
_080B3E40:
	ldr r4, _080B3E58
	ldr r1, _080B3E5C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080B3E60
	ldr r3, _080B3E64
	adds r0, r5, 0
	adds r1, r4, 0
	bl DisplayItemMessageOnField
	b _080B3E74
	.align 2, 0
_080B3E58: .4byte gStringVar4
_080B3E5C: .4byte gOtherText_SpaceForIsFull
_080B3E60: .4byte sub_80B3BD0
_080B3E64: .4byte 0x0000c3e1
_080B3E68:
	ldr r1, _080B3E7C
	ldr r2, _080B3E80
	ldr r3, _080B3E84
	adds r0, r5, 0
	bl DisplayItemMessageOnField
_080B3E74:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B3E7C: .4byte gOtherText_NotEnoughMoney
_080B3E80: .4byte sub_80B3BD0
_080B3E84: .4byte 0x0000c3e1
	thumb_func_end sub_80B3BF4

	thumb_func_start sub_80B3D38
sub_80B3D38: @ 80B3E88
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r0, _080B3EC0
	movs r1, 0x4
	str r1, [sp]
	ldr r1, _080B3EC4
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x9
	movs r3, 0x4
	bl sub_80A3FA0
	ldr r1, _080B3EC8
	adds r0, r4, 0
	bl sub_80F914C
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3EC0: .4byte 0x020219cc
_080B3EC4: .4byte 0x0000c3e1
_080B3EC8: .4byte gUnknown_083CC708
	thumb_func_end sub_80B3D38

	thumb_func_start sub_80B3D7C
sub_80B3D7C: @ 80B3ECC
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B3F10
	ldrb r1, [r0, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	movs r0, 0x7
	movs r1, 0x8
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B3F14
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x8
	movs r2, 0x9
	movs r3, 0x4
	bl sub_80A3FA0
	adds r0, r4, 0
	bl sub_80B4378
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3F10: .4byte gUnknown_03000708
_080B3F14: .4byte 0x020219cc
	thumb_func_end sub_80B3D7C

	thumb_func_start sub_80B3DC8
sub_80B3DC8: @ 80B3F18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	adds r4, r6, 0
	ldr r7, _080B3FF8
	ldrb r1, [r7, 0xD]
	adds r0, r6, 0
	bl sub_80A52C4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080B3F3E
	adds r0, r6, 0
	bl sub_80B37F8
_080B3F3E:
	ldr r0, _080B3FFC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080B4028
	ldr r0, _080B4000
	mov r8, r0
	ldrb r0, [r7, 0xB]
	ldrb r1, [r7, 0x9]
	adds r0, r1
	ldr r1, [r7, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	ldr r0, _080B4004
	lsls r5, r6, 2
	adds r5, r6
	lsls r5, 3
	adds r5, r0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	muls r0, r4
	mov r2, r8
	str r0, [r2]
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B4008
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A3FA0
	bl sub_80B379C
	bl sub_80B3420
	ldrb r0, [r7, 0xB]
	ldrb r1, [r7, 0x9]
	adds r0, r1
	ldr r1, [r7, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _080B400C
	bl CopyItemName
	ldr r0, _080B4010
	movs r2, 0xA
	ldrsh r1, [r5, r2]
	movs r2, 0
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _080B4014
	mov r2, r8
	ldr r1, [r2]
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	ldr r4, _080B4018
	ldr r1, _080B401C
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080B4020
	ldr r3, _080B4024
	adds r0, r6, 0
	adds r1, r4, 0
	bl DisplayItemMessageOnField
	b _080B4040
	.align 2, 0
_080B3FF8: .4byte gUnknown_03000708
_080B3FFC: .4byte gMain
_080B4000: .4byte gUnknown_020386A0
_080B4004: .4byte gTasks
_080B4008: .4byte 0x020219cc
_080B400C: .4byte gStringVar1
_080B4010: .4byte gStringVar2
_080B4014: .4byte gStringVar3
_080B4018: .4byte gStringVar4
_080B401C: .4byte gOtherText_ThatWillBe
_080B4020: .4byte sub_80B3D38
_080B4024: .4byte 0x0000c3e1
_080B4028:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B4040
	ldrb r1, [r7, 0x9]
	adds r0, r1, 0
	movs r2, 0
	bl sub_80B39D0
	adds r0, r4, 0
	bl sub_80B4378
_080B4040:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B3DC8

	thumb_func_start sub_80B3EFC
sub_80B3EFC: @ 80B404C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _080B40C8
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r1
	movs r1, 0x1
	strh r1, [r0, 0xA]
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuDrawTextWindow
	adds r0, r5, 0
	bl sub_80B37F8
	ldr r6, _080B40CC
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	ldr r1, _080B40D0
	movs r2, 0x92
	lsls r2, 3
	adds r1, r2
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	ldr r0, [r1]
	adds r1, r4, 0
	bl __udivsi3
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x63
	bls _080B40B2
	movs r0, 0x63
_080B40B2:
	strb r0, [r6, 0xD]
	ldr r0, _080B40C8
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	ldr r0, _080B40D4
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B40C8: .4byte gTasks
_080B40CC: .4byte gUnknown_03000708
_080B40D0: .4byte gSaveBlock1
_080B40D4: .4byte sub_80B3DC8
	thumb_func_end sub_80B3EFC

	thumb_func_start sub_80B3F88
sub_80B3F88: @ 80B40D8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080B4170
	mov r8, r0
	ldr r1, [r0, 0x28]
	ldr r3, _080B4174
	adds r1, r3
	adds r2, r1, 0
	adds r2, 0x80
	ldr r7, [r0, 0x24]
	mov r10, r7
	ldr r0, _080B4178
	mov r9, r0
	movs r6, 0xD
_080B40FC:
	adds r3, r2, 0
	subs r3, 0x40
	str r3, [sp]
	movs r7, 0x40
	negs r7, r7
	adds r7, r1
	mov r12, r7
	adds r3, r2, 0
	adds r4, r1, 0
	movs r5, 0xE
_080B4110:
	ldrh r2, [r4]
	mov r1, r9
	ands r1, r2
	mov r7, r8
	ldrh r0, [r7, 0x1A]
	adds r0, 0x1
	cmp r1, r0
	ble _080B4124
	adds r0, r2, 0
	adds r0, 0x3C
_080B4124:
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x2
	subs r5, 0x1
	cmp r5, 0
	bge _080B4110
	ldr r2, [sp]
	mov r1, r12
	subs r6, 0x1
	cmp r6, 0
	bge _080B40FC
	ldr r1, _080B417C
	add r1, r10
	movs r0, 0xF0
	lsls r0, 3
	adds r2, r1, r0
	ldr r3, _080B4180
	ldr r5, _080B4184
	ldr r4, _080B4188
	movs r6, 0xD
_080B414C:
	str r1, [r3]
	str r2, [r3, 0x4]
	str r5, [r3, 0x8]
	ldr r0, [r3, 0x8]
	adds r2, r4
	adds r1, r4
	subs r6, 0x1
	cmp r6, 0
	bge _080B414C
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4170: .4byte gMenuWindow
_080B4174: .4byte 0x000003de
_080B4178: .4byte 0x000003ff
_080B417C: .4byte 0x00003a20
_080B4180: .4byte 0x040000d4
_080B4184: .4byte 0x800000f0
_080B4188: .4byte 0xfffffc40
	thumb_func_end sub_80B3F88

	thumb_func_start sub_80B403C
sub_80B403C: @ 80B418C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r0, _080B4228
	mov r8, r0
	ldr r2, [r0, 0x28]
	adds r1, r2, 0
	adds r1, 0x9E
	adds r2, r1, 0
	adds r1, 0x80
	ldr r3, [r0, 0x24]
	mov r10, r3
	ldr r7, _080B422C
	mov r9, r7
	movs r6, 0xD
_080B41B0:
	adds r0, r2, 0
	adds r0, 0x40
	str r0, [sp]
	movs r3, 0x40
	adds r3, r1
	mov r12, r3
	adds r3, r2, 0
	adds r4, r1, 0
	movs r5, 0xE
_080B41C2:
	ldrh r2, [r4]
	mov r1, r9
	ands r1, r2
	mov r7, r8
	ldrh r0, [r7, 0x1A]
	adds r0, 0x1
	cmp r1, r0
	ble _080B41D6
	adds r0, r2, 0
	subs r0, 0x3C
_080B41D6:
	strh r0, [r3]
	adds r3, 0x2
	adds r4, 0x2
	subs r5, 0x1
	cmp r5, 0
	bge _080B41C2
	ldr r2, [sp]
	mov r1, r12
	subs r6, 0x1
	cmp r6, 0
	bge _080B41B0
	movs r1, 0x96
	lsls r1, 4
	add r1, r10
	adds r2, r1, 0
	movs r0, 0xF0
	lsls r0, 3
	adds r1, r0
	ldr r3, _080B4230
	ldr r5, _080B4234
	movs r4, 0xF0
	lsls r4, 2
	movs r6, 0xD
_080B4204:
	str r1, [r3]
	str r2, [r3, 0x4]
	str r5, [r3, 0x8]
	ldr r0, [r3, 0x8]
	adds r2, r4
	adds r1, r4
	subs r6, 0x1
	cmp r6, 0
	bge _080B4204
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4228: .4byte gMenuWindow
_080B422C: .4byte 0x000003ff
_080B4230: .4byte 0x040000d4
_080B4234: .4byte 0x800000f0
	thumb_func_end sub_80B403C

	thumb_func_start sub_80B40E8
sub_80B40E8: @ 80B4238
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r7, r0, 24
	mov r8, r7
	ldr r0, _080B4284
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080B4252
	b _080B44BC
_080B4252:
	ldr r2, _080B4288
	ldrh r0, [r2, 0x30]
	movs r1, 0xF0
	ands r1, r0
	cmp r1, 0x40
	bne _080B429C
	ldr r4, _080B428C
	ldrb r0, [r4, 0x9]
	cmp r0, 0
	bne _080B4290
	ldrb r0, [r4, 0xB]
	cmp r0, 0
	bne _080B426E
	b _080B44BC
_080B426E:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0xB]
	subs r0, 0x1
	strb r0, [r4, 0xB]
	bl sub_80B3F88
	movs r0, 0
	movs r1, 0
	b _080B42CA
	.align 2, 0
_080B4284: .4byte gPaletteFade
_080B4288: .4byte gMain
_080B428C: .4byte gUnknown_03000708
_080B4290:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	b _080B42F0
_080B429C:
	cmp r1, 0x80
	bne _080B42FC
	ldr r4, _080B42DC
	ldrb r0, [r4, 0x9]
	cmp r0, 0x7
	bne _080B42E0
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _080B42B6
	b _080B44BC
_080B42B6:
	movs r0, 0x5
	bl PlaySE
	ldrb r0, [r4, 0xB]
	adds r0, 0x1
	strb r0, [r4, 0xB]
	bl sub_80B403C
	movs r0, 0x7
	movs r1, 0x7
_080B42CA:
	movs r2, 0
	bl sub_80B39D0
	bl sub_80B3A70
	bl sub_80B32A4
	b _080B44BC
	.align 2, 0
_080B42DC: .4byte gUnknown_03000708
_080B42E0:
	ldrb r2, [r4, 0x8]
	cmp r0, r2
	bne _080B42E8
	b _080B44BC
_080B42E8:
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
_080B42F0:
	bl MoveMenuCursor
	strb r0, [r4, 0x9]
	bl sub_80B3A70
	b _080B44BC
_080B42FC:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080B4308
	b _080B44A8
_080B4308:
	movs r0, 0x5
	bl PlaySE
	ldr r6, _080B43BC
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldrb r1, [r6, 0x8]
	cmp r0, r1
	bne _080B431E
	b _080B44A0
_080B431E:
	movs r0, 0
	bl sub_80F996C
	movs r0, 0x1
	bl sub_80F996C
	movs r0, 0x1
	movs r1, 0x1
	bl sub_80F979C
	ldrb r1, [r6, 0x9]
	adds r0, r1, 0
	movs r2, 0x1
	bl sub_80B39D0
	bl sub_8072DEC
	movs r0, 0
	movs r1, 0xC
	movs r2, 0xD
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	ldrb r0, [r6, 0xC]
	cmp r0, 0
	bne _080B43DC
	ldr r5, _080B43C0
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	bl ItemId_GetPrice
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPriceReduction
	lsls r4, 16
	lsrs r4, 16
	lsls r0, 24
	lsrs r0, 24
	asrs r4, r0
	str r4, [r5]
	ldr r0, _080B43C4
	movs r2, 0x92
	lsls r2, 3
	adds r0, r2
	ldr r0, [r0]
	adds r1, r4, 0
	bl IsEnoughMoney
	lsls r0, 24
	cmp r0, 0
	beq _080B440A
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldr r1, _080B43C8
	bl CopyItemName
	ldr r4, _080B43CC
	ldr r1, _080B43D0
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r2, _080B43D4
	ldr r3, _080B43D8
	adds r0, r7, 0
	adds r1, r4, 0
	bl DisplayItemMessageOnField
	b _080B44BC
	.align 2, 0
_080B43BC: .4byte gUnknown_03000708
_080B43C0: .4byte gUnknown_020386A0
_080B43C4: .4byte gSaveBlock1
_080B43C8: .4byte gStringVar1
_080B43CC: .4byte gStringVar4
_080B43D0: .4byte gOtherText_HowManyYouWant
_080B43D4: .4byte sub_80B3EFC
_080B43D8: .4byte 0x0000c3e1
_080B43DC:
	ldr r5, _080B4418
	ldr r4, _080B441C
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	lsls r0, 5
	adds r0, r4
	ldrh r1, [r0, 0x14]
	str r1, [r5]
	ldr r0, _080B4420
	movs r2, 0x92
	lsls r2, 3
	adds r0, r2
	ldr r0, [r0]
	bl IsEnoughMoney
	lsls r0, 24
	cmp r0, 0
	bne _080B4430
_080B440A:
	ldr r1, _080B4424
	ldr r2, _080B4428
	ldr r3, _080B442C
	adds r0, r7, 0
	bl DisplayItemMessageOnField
	b _080B44BC
	.align 2, 0
_080B4418: .4byte gUnknown_020386A0
_080B441C: .4byte gDecorations
_080B4420: .4byte gSaveBlock1
_080B4424: .4byte gOtherText_NotEnoughMoney
_080B4428: .4byte sub_80B3BD0
_080B442C: .4byte 0x0000c3e1
_080B4430:
	ldr r0, _080B4468
	ldrb r1, [r6, 0xB]
	ldrb r2, [r6, 0x9]
	adds r1, r2
	ldr r2, [r6, 0x4]
	lsls r1, 1
	adds r1, r2
	ldrh r1, [r1]
	lsls r1, 5
	adds r2, r4, 0x1
	adds r1, r2
	bl StringCopy
	ldr r0, _080B446C
	ldr r1, [r5]
	movs r2, 0
	movs r3, 0x8
	bl ConvertIntToDecimalStringN
	ldrb r0, [r6, 0xC]
	cmp r0, 0x1
	bne _080B4478
	ldr r0, _080B4470
	ldr r1, _080B4474
	bl StringExpandPlaceholders
	b _080B4480
	.align 2, 0
_080B4468: .4byte gStringVar1
_080B446C: .4byte gStringVar2
_080B4470: .4byte gStringVar4
_080B4474: .4byte gOtherText_ThatWillBe2
_080B4478:
	ldr r0, _080B4490
	ldr r1, _080B4494
	bl StringExpandPlaceholders
_080B4480:
	ldr r1, _080B4490
	ldr r2, _080B4498
	ldr r3, _080B449C
	mov r0, r8
	bl DisplayItemMessageOnField
	b _080B44BC
	.align 2, 0
_080B4490: .4byte gStringVar4
_080B4494: .4byte gOtherText_ThatWillBe3
_080B4498: .4byte sub_80B3D38
_080B449C: .4byte 0x0000c3e1
_080B44A0:
	adds r0, r7, 0
	bl sub_80B43F0
	b _080B44BC
_080B44A8:
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080B44BC
	movs r0, 0x5
	bl PlaySE
	mov r0, r8
	bl sub_80B43F0
_080B44BC:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B40E8

	thumb_func_start sub_80B4378
sub_80B4378: @ 80B44C8
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1D
	movs r3, 0x13
	bl MenuZeroFillWindowRect
	movs r0, 0
	movs r1, 0xA
	movs r2, 0xD
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	ldr r0, _080B4534
	movs r1, 0x2
	str r1, [sp]
	movs r1, 0
	str r1, [sp, 0x4]
	movs r1, 0x1
	movs r2, 0xB
	movs r3, 0xC
	bl sub_80A3FA0
	bl sub_80B3420
	movs r0, 0x6
	movs r1, 0x7
	bl sub_80B3764
	bl sub_80B37EC
	movs r0, 0
	bl sub_80F98DC
	movs r0, 0x1
	bl sub_80F98DC
	bl sub_80B32A4
	ldr r1, _080B4538
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B453C
	str r1, [r0]
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4534: .4byte 0x020219cc
_080B4538: .4byte gTasks
_080B453C: .4byte sub_80B40E8
	thumb_func_end sub_80B4378

	thumb_func_start sub_80B43F0
sub_80B43F0: @ 80B4540
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _080B4578
	ldr r0, _080B457C
	str r0, [r1]
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	ldr r1, _080B4580
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _080B4584
	str r1, [r0]
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4578: .4byte gUnknown_0300485C
_080B457C: .4byte sub_80B3050
_080B4580: .4byte gTasks
_080B4584: .4byte Task_ExitBuyMenu
	thumb_func_end sub_80B43F0

	thumb_func_start Task_ExitBuyMenu
Task_ExitBuyMenu: @ 80B4588
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _080B45B8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B45B2
	movs r0, 0
	movs r1, 0
	bl RemoveMoneyLabelObject
	bl BuyMenuFreeMemory
	ldr r0, _080B45BC
	bl SetMainCallback2
	adds r0, r4, 0
	bl DestroyTask
_080B45B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B45B8: .4byte gPaletteFade
_080B45BC: .4byte c2_exit_to_overworld_2_switch
	thumb_func_end Task_ExitBuyMenu

	thumb_func_start sub_80B4470
sub_80B4470: @ 80B45C0
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r2, 0
	ldr r0, _080B4618
	mov r12, r0
	ldr r6, _080B461C
	mov r8, r12
	adds r4, r6, 0
	ldr r1, _080B4620
	mov r9, r1
	lsls r0, r5, 2
	adds r0, r5
	lsls r7, r0, 3
_080B45E2:
	lsls r0, r2, 2
	mov r1, r8
	adds r3, r0, r1
	ldrb r0, [r4, 0xB]
	ldrb r1, [r4, 0x9]
	adds r0, r1
	ldr r1, [r4, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r3]
	ldrh r0, [r0]
	cmp r1, r0
	bne _080B462C
	ldrh r0, [r3, 0x2]
	cmp r0, 0
	beq _080B462C
	adds r2, r0, 0
	mov r4, r9
	adds r1, r7, r4
	movs r4, 0xA
	ldrsh r0, [r1, r4]
	adds r0, r2, r0
	cmp r0, 0xFF
	ble _080B4624
	movs r0, 0xFF
	strh r0, [r3, 0x2]
	b _080B466E
	.align 2, 0
_080B4618: .4byte gUnknown_02038724
_080B461C: .4byte gUnknown_03000708
_080B4620: .4byte gTasks
_080B4624:
	ldrh r0, [r1, 0xA]
	adds r0, r2, r0
	strh r0, [r3, 0x2]
	b _080B466E
_080B462C:
	adds r0, r2, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r2, 0x2
	bls _080B45E2
	ldr r3, _080B467C
	ldrb r0, [r3]
	cmp r0, 0x2
	bhi _080B466E
	adds r2, r0, 0
	lsls r2, 2
	add r2, r12
	ldrb r0, [r6, 0xB]
	ldrb r1, [r6, 0x9]
	adds r0, r1
	ldr r1, [r6, 0x4]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r1, [r3]
	lsls r1, 2
	add r1, r12
	ldr r2, _080B4680
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r2
	ldrh r0, [r0, 0xA]
	strh r0, [r1, 0x2]
	ldrb r0, [r3]
	adds r0, 0x1
	strb r0, [r3]
_080B466E:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B467C: .4byte gUnknown_02038730
_080B4680: .4byte gTasks
	thumb_func_end sub_80B4470

	thumb_func_start ClearItemPurchases
ClearItemPurchases: @ 80B4684
	push {lr}
	ldr r0, _080B4698
	movs r1, 0
	strb r1, [r0]
	ldr r0, _080B469C
	movs r1, 0x3
	bl ClearItemSlots
	pop {r0}
	bx r0
	.align 2, 0
_080B4698: .4byte gUnknown_02038730
_080B469C: .4byte gUnknown_02038724
	thumb_func_end ClearItemPurchases

	thumb_func_start CreatePokemartMenu
CreatePokemartMenu: @ 80B46A0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl CreateShopMenu
	adds r0, r4, 0
	bl SetShopItemsForSale
	bl ClearItemPurchases
	ldr r0, _080B46C0
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B46C0: .4byte EnableBothScriptContexts
	thumb_func_end CreatePokemartMenu

	thumb_func_start CreateDecorationShop1Menu
CreateDecorationShop1Menu: @ 80B46C4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl CreateShopMenu
	adds r0, r4, 0
	bl SetShopItemsForSale
	ldr r0, _080B46E0
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B46E0: .4byte EnableBothScriptContexts
	thumb_func_end CreateDecorationShop1Menu

	thumb_func_start CreateDecorationShop2Menu
CreateDecorationShop2Menu: @ 80B46E4
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	bl CreateShopMenu
	adds r0, r4, 0
	bl SetShopItemsForSale
	ldr r0, _080B4700
	bl SetShopMenuCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4700: .4byte EnableBothScriptContexts
	thumb_func_end CreateDecorationShop2Menu

	thumb_func_start sub_80B45B4
sub_80B45B4: @ 80B4704
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	mov r9, r1
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	ldr r2, _080B4798
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0x10]
	subs r0, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r0, [r1, 0x12]
	subs r0, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r4, [r1, 0xA]
	movs r2, 0xC
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B47C8
	movs r2, 0
	lsls r5, 16
	str r5, [sp, 0xC]
	lsls r0, r3, 16
	lsls r1, r4, 16
	asrs r0, 16
	str r0, [sp]
	asrs r1, 16
	str r1, [sp, 0x4]
	lsls r0, r1, 1
	mov r1, r9
	adds r7, r0, r1
_080B4758:
	movs r4, 0
	lsls r2, 16
	mov r8, r2
	asrs r0, r2, 16
	ldr r2, [sp]
	adds r6, r2, r0
_080B4764:
	ldr r0, [sp, 0xC]
	asrs r1, r0, 16
	lsls r4, 16
	asrs r0, r4, 16
	adds r5, r1, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	movs r2, 0
	ldrsh r1, [r7, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _080B47AC
	ldr r0, [sp, 0x4]
	cmp r0, 0x2
	beq _080B479C
	ldrh r0, [r7, 0x2]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	b _080B47AC
	.align 2, 0
_080B4798: .4byte gTasks
_080B479C:
	mov r1, r9
	ldrh r0, [r1]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
_080B47AC:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r4, r2
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B4764
	adds r0, r2, 0
	add r0, r8
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B4758
	b _080B4850
_080B47C8:
	movs r2, 0
	lsls r5, 16
	str r5, [sp, 0xC]
	lsls r0, r3, 16
	lsls r1, r4, 16
	asrs r0, 16
	str r0, [sp, 0x8]
	asrs r7, r1, 16
_080B47D8:
	movs r4, 0
	lsls r2, 16
	mov r8, r2
	asrs r0, r2, 16
	ldr r1, [sp, 0x8]
	adds r6, r1, r0
_080B47E4:
	ldr r2, [sp, 0xC]
	asrs r1, r2, 16
	lsls r4, 16
	asrs r0, r4, 16
	adds r5, r1, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	movs r1, 0x2
	subs r1, r7
	lsls r1, 1
	add r1, r9
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	bne _080B4836
	cmp r7, 0x2
	beq _080B4826
	movs r0, 0x1
	subs r0, r7
	lsls r0, 1
	add r0, r9
	ldrh r0, [r0]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
	b _080B4836
_080B4826:
	mov r1, r9
	ldrh r0, [r1, 0x4]
	mov r2, r10
	orrs r2, r0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridSetMetatileIdAt
_080B4836:
	movs r2, 0x80
	lsls r2, 9
	adds r0, r4, r2
	lsrs r4, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B47E4
	adds r0, r2, 0
	add r0, r8
	lsrs r2, r0, 16
	asrs r0, 16
	cmp r0, 0x2
	ble _080B47D8
_080B4850:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80B45B4

	thumb_func_start sub_80B4710
sub_80B4710: @ 80B4860
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	ldr r1, _080B4888
	adds r4, r0, r1
	movs r0, 0x1
	strh r0, [r4, 0x6]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x6
	bhi _080B48FA
	lsls r0, 2
	ldr r1, _080B488C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B4888: .4byte 0x03004b38
_080B488C: .4byte _080B4890
	.align 2, 0
_080B4890:
	.4byte _080B48AC
	.4byte _080B48B4
	.4byte _080B48BC
	.4byte _080B48C4
	.4byte _080B48CC
	.4byte _080B48E0
	.4byte _080B48F0
_080B48AC:
	ldr r1, _080B48B0
	b _080B48E2
	.align 2, 0
_080B48B0: .4byte gUnknown_083CC714
_080B48B4:
	ldr r1, _080B48B8
	b _080B48E2
	.align 2, 0
_080B48B8: .4byte gUnknown_083CC71A
_080B48BC:
	ldr r1, _080B48C0
	b _080B48CE
	.align 2, 0
_080B48C0: .4byte gUnknown_083CC720
_080B48C4:
	ldr r1, _080B48C8
	b _080B48E2
	.align 2, 0
_080B48C8: .4byte gUnknown_083CC726
_080B48CC:
	ldr r1, _080B48DC
_080B48CE:
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r3, 0
	bl sub_80B45B4
	b _080B48FA
	.align 2, 0
_080B48DC: .4byte gUnknown_083CC72C
_080B48E0:
	ldr r1, _080B48EC
_080B48E2:
	adds r0, r3, 0
	movs r2, 0
	bl sub_80B45B4
	b _080B48FA
	.align 2, 0
_080B48EC: .4byte gUnknown_083CC732
_080B48F0:
	ldr r1, _080B4924
	adds r0, r3, 0
	movs r2, 0
	bl sub_80B45B4
_080B48FA:
	ldrh r0, [r4]
	adds r0, 0x1
	movs r1, 0x7
	ands r0, r1
	strh r0, [r4]
	adds r5, r0, 0
	cmp r5, 0
	bne _080B491E
	bl DrawWholeMapView
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r0, 0x1
	movs r1, 0x3
	bl __modsi3
	strh r0, [r4, 0x2]
	strh r5, [r4, 0x6]
_080B491E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B4924: .4byte gUnknown_083CC738
	thumb_func_end sub_80B4710

	thumb_func_start sub_80B47D8
sub_80B47D8: @ 80B4928
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _080B496C
	adds r0, r6, 0
	movs r1, 0
	bl CreateTask
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080B4970
	adds r7, r0, r1
	adds r0, r7, 0
	adds r0, 0x8
	adds r1, r7, 0
	adds r1, 0xA
	bl PlayerGetDestCoords
	movs r0, 0
	strh r0, [r7]
	strh r0, [r7, 0x2]
	strh r5, [r7, 0x4]
	adds r0, r4, 0
	bl _call_via_r6
	adds r0, r4, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B496C: .4byte sub_80B4710
_080B4970: .4byte 0x03004b38
	thumb_func_end sub_80B47D8

	thumb_func_start sub_80B4824
sub_80B4824: @ 80B4974
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80B47D8
	ldr r1, _080B4988
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080B4988: .4byte gUnknown_02038731
	thumb_func_end sub_80B4824

	thumb_func_start sub_80B483C
sub_80B483C: @ 80B498C
	push {lr}
	ldr r0, _080B499C
	ldrb r0, [r0]
	bl DestroyTask
	pop {r0}
	bx r0
	.align 2, 0
_080B499C: .4byte gUnknown_02038731
	thumb_func_end sub_80B483C

	thumb_func_start sub_80B4850
sub_80B4850: @ 80B49A0
	push {lr}
	ldr r2, _080B49C4
	ldr r0, _080B49C8
	ldrb r1, [r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0xE
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _080B49CC
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x2
	bne _080B49CC
	movs r0, 0
	b _080B49CE
	.align 2, 0
_080B49C4: .4byte gTasks
_080B49C8: .4byte gUnknown_02038731
_080B49CC:
	movs r0, 0x1
_080B49CE:
	pop {r1}
	bx r1
	thumb_func_end sub_80B4850

	.align 2, 0 @ Don't pad with nop.
