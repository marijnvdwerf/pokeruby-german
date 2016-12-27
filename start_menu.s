	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start BuildStartMenuActions
BuildStartMenuActions: @ 80712D0
	push {lr}
	ldr r0, _080712E8 @ =0x0202e8fd
	movs r1, 0
	strb r1, [r0]
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _080712EC
	bl BuildStartMenuActions_Link
	b _080712FE
	.align 2, 0
_080712E8: .4byte 0x0202e8fd
_080712EC:
	bl GetSafariZoneFlag
	cmp r0, 0x1
	bne _080712FA
	bl BuildStartMenuActions_SafariZone
	b _080712FE
_080712FA:
	bl BuildStartMenuActions_Normal
_080712FE:
	pop {r0}
	bx r0
	thumb_func_end BuildStartMenuActions

	thumb_func_start AddStartMenuAction
AddStartMenuAction: @ 8071304
	push {lr}
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r0, _08071318 @ =0x0202e8fe
	ldr r1, _0807131C @ =0x0202e8fd
	bl AppendToList
	pop {r0}
	bx r0
	.align 2, 0
_08071318: .4byte 0x0202e8fe
_0807131C: .4byte 0x0202e8fd
	thumb_func_end AddStartMenuAction

	thumb_func_start BuildStartMenuActions_Normal
BuildStartMenuActions_Normal: @ 8071320
	push {lr}
	ldr r0, _08071384 @ =0x00000801
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08071336
	movs r0, 0
	bl AddStartMenuAction
_08071336:
	movs r0, 0x80
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0807134C
	movs r0, 0x1
	bl AddStartMenuAction
_0807134C:
	movs r0, 0x2
	bl AddStartMenuAction
	ldr r0, _08071388 @ =0x00000802
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08071366
	movs r0, 0x3
	bl AddStartMenuAction
_08071366:
	movs r0, 0x4
	bl AddStartMenuAction
	movs r0, 0x5
	bl AddStartMenuAction
	movs r0, 0x6
	bl AddStartMenuAction
	movs r0, 0x7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
_08071384: .4byte 0x00000801
_08071388: .4byte 0x00000802
	thumb_func_end BuildStartMenuActions_Normal

	thumb_func_start BuildStartMenuActions_SafariZone
BuildStartMenuActions_SafariZone: @ 807138C
	push {lr}
	movs r0, 0x8
	bl AddStartMenuAction
	movs r0, 0
	bl AddStartMenuAction
	movs r0, 0x1
	bl AddStartMenuAction
	movs r0, 0x2
	bl AddStartMenuAction
	movs r0, 0x4
	bl AddStartMenuAction
	movs r0, 0x6
	bl AddStartMenuAction
	movs r0, 0x7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	thumb_func_end BuildStartMenuActions_SafariZone

	thumb_func_start BuildStartMenuActions_Link
BuildStartMenuActions_Link: @ 80713BC
	push {lr}
	movs r0, 0x1
	bl AddStartMenuAction
	movs r0, 0x2
	bl AddStartMenuAction
	ldr r0, _080713F4 @ =0x00000802
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080713DE
	movs r0, 0x3
	bl AddStartMenuAction
_080713DE:
	movs r0, 0x9
	bl AddStartMenuAction
	movs r0, 0x6
	bl AddStartMenuAction
	movs r0, 0x7
	bl AddStartMenuAction
	pop {r0}
	bx r0
	.align 2, 0
_080713F4: .4byte 0x00000802
	thumb_func_end BuildStartMenuActions_Link

	thumb_func_start DisplaySafariBallsWindow
DisplaySafariBallsWindow: @ 80713F8
	push {lr}
	ldr r0, _08071424 @ =gStringVar1
	ldr r1, _08071428 @ =gNumSafariBalls
	ldrb r1, [r1]
	movs r2, 0xC
	movs r3, 0x1
	bl sub_8072C44
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x5
	bl MenuDrawTextWindow
	ldr r0, _0807142C @ =gOtherText_SafariStock
	movs r1, 0x1
	movs r2, 0x1
	bl MenuPrint
	pop {r0}
	bx r0
	.align 2, 0
_08071424: .4byte gStringVar1
_08071428: .4byte gNumSafariBalls
_0807142C: .4byte gOtherText_SafariStock
	thumb_func_end DisplaySafariBallsWindow

	thumb_func_start PrintStartMenuItemsMultistep
PrintStartMenuItemsMultistep: @ 8071430
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r6, r1, 0
	movs r0, 0
	ldrsh r4, [r7, r0]
	ldr r1, _0807147C @ =gStartMenuItems
	mov r8, r1
	lsls r0, r4, 25
	movs r1, 0x80
	lsls r1, 18
	adds r5, r0, r1
_0807144A:
	ldr r0, _08071480 @ =0x0202e8fe
	adds r0, r4, r0
	ldrb r0, [r0]
	lsls r0, 3
	add r0, r8
	ldr r0, [r0]
	lsrs r2, r5, 24
	movs r1, 0x17
	bl MenuPrint
	movs r0, 0x80
	lsls r0, 18
	adds r5, r0
	adds r4, 0x1
	ldr r0, _08071484 @ =0x0202e8fd
	ldrb r0, [r0]
	cmp r4, r0
	bge _08071488
	subs r6, 0x1
	cmp r6, 0
	bne _0807144A
	strh r4, [r7]
	movs r0, 0
	b _0807148C
	.align 2, 0
_0807147C: .4byte gStartMenuItems
_08071480: .4byte 0x0202e8fe
_08071484: .4byte 0x0202e8fd
_08071488:
	strh r4, [r7]
	movs r0, 0x1
_0807148C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end PrintStartMenuItemsMultistep

	thumb_func_start InitStartMenuMultistep
InitStartMenuMultistep: @ 8071498
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x5
	bhi _08071540
	lsls r0, 2
	ldr r1, _080714B4 @ =_080714B8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080714B4: .4byte _080714B8
	.align 2, 0
_080714B8:
	.4byte _08071512
	.4byte _080714D0
	.4byte _080714D6
	.4byte _080714F8
	.4byte _08071506
	.4byte _0807151A
_080714D0:
	bl BuildStartMenuActions
	b _08071512
_080714D6:
	ldr r0, _080714F4 @ =0x0202e8fd
	ldrb r3, [r0]
	lsls r3, 25
	movs r0, 0xC0
	lsls r0, 18
	adds r3, r0
	lsrs r3, 24
	movs r0, 0x16
	movs r1, 0
	movs r2, 0x1D
	bl MenuDrawTextWindow
	movs r0, 0
	strh r0, [r5]
	b _08071512
	.align 2, 0
_080714F4: .4byte 0x0202e8fd
_080714F8:
	bl GetSafariZoneFlag
	cmp r0, 0
	beq _08071512
	bl DisplaySafariBallsWindow
	b _08071512
_08071506:
	adds r0, r5, 0
	movs r1, 0x2
	bl PrintStartMenuItemsMultistep
	cmp r0, 0
	beq _08071540
_08071512:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08071540
_0807151A:
	ldr r0, _08071538 @ =0x0202e8fd
	ldrb r3, [r0]
	ldr r4, _0807153C @ =0x0202e8fc
	ldrb r0, [r4]
	str r0, [sp]
	movs r0, 0x6
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x17
	movs r2, 0x2
	bl InitMenu
	strb r0, [r4]
	movs r0, 0x1
	b _08071542
	.align 2, 0
_08071538: .4byte 0x0202e8fd
_0807153C: .4byte 0x0202e8fc
_08071540:
	movs r0, 0
_08071542:
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end InitStartMenuMultistep

	thumb_func_start InitStartMenu
InitStartMenu: @ 807154C
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0
	mov r1, sp
	strh r0, [r1]
	adds r1, 0x2
	strh r0, [r1]
	adds r4, r1, 0
_0807155C:
	mov r0, sp
	adds r1, r4, 0
	bl InitStartMenuMultistep
	cmp r0, 0
	beq _0807155C
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end InitStartMenu

	thumb_func_start Task_StartMenu
Task_StartMenu: @ 8071570
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0807159C @ =0x03004b38
	adds r4, r0, r1
	adds r1, r4, 0x2
	adds r0, r4, 0
	bl InitStartMenuMultistep
	cmp r0, 0x1
	bne _08071596
	movs r0, 0
	strh r0, [r4]
	adds r0, r5, 0
	bl SwitchTaskToFollowupFunc
_08071596:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807159C: .4byte 0x03004b38
	thumb_func_end Task_StartMenu

	thumb_func_start CreateStartMenuTask
CreateStartMenuTask: @ 80715A0
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, _080715C8 @ =gWindowConfig_81E6CE4
	bl InitMenuWindow
	ldr r4, _080715CC @ =Task_StartMenu
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl SetTaskFuncWithFollowupFunc
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080715C8: .4byte gWindowConfig_81E6CE4
_080715CC: .4byte Task_StartMenu
	thumb_func_end CreateStartMenuTask

	thumb_func_start sub_80712B4
sub_80712B4: @ 80715D0
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _080715F0 @ =gTasks
	adds r2, r0, r1
	movs r1, 0x8
	ldrsh r0, [r2, r1]
	cmp r0, 0
	beq _080715F4
	cmp r0, 0x1
	beq _0807160C
	b _08071622
	.align 2, 0
_080715F0: .4byte gTasks
_080715F4:
	ldr r1, _08071604 @ =gCallback_03004AE8
	ldr r0, _08071608 @ =StartMenu_InputProcessCallback
	str r0, [r1]
	ldrh r0, [r2, 0x8]
	adds r0, 0x1
	strh r0, [r2, 0x8]
	b _08071622
	.align 2, 0
_08071604: .4byte gCallback_03004AE8
_08071608: .4byte StartMenu_InputProcessCallback
_0807160C:
	ldr r0, _08071628 @ =gCallback_03004AE8
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08071622
	adds r0, r4, 0
	bl DestroyTask
_08071622:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071628: .4byte gCallback_03004AE8
	thumb_func_end sub_80712B4

	thumb_func_start sub_8071310
sub_8071310: @ 807162C
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0
	bne _08071642
	bl player_bitmagic
	bl sub_80594C0
	bl sub_80597F4
_08071642:
	ldr r0, _08071650 @ =sub_80712B4
	bl CreateStartMenuTask
	bl ScriptContext2_Enable
	pop {r0}
	bx r0
	.align 2, 0
_08071650: .4byte sub_80712B4
	thumb_func_end sub_8071310

	thumb_func_start StartMenu_InputProcessCallback
StartMenu_InputProcessCallback: @ 8071654
	push {r4,lr}
	ldr r4, _080716F8 @ =gMain
	ldrh r1, [r4, 0x2E]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08071674
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	negs r0, r0
	bl MoveMenuCursor
	ldr r1, _080716FC @ =0x0202e8fc
	strb r0, [r1]
_08071674:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807168E
	movs r0, 0x5
	bl PlaySE
	movs r0, 0x1
	bl MoveMenuCursor
	ldr r1, _080716FC @ =0x0202e8fc
	strb r0, [r1]
_0807168E:
	ldrh r1, [r4, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0807171C
	movs r0, 0x5
	bl PlaySE
	ldr r1, _08071700 @ =gStartMenuItems
	ldr r2, _08071704 @ =0x0202e8fe
	ldr r0, _080716FC @ =0x0202e8fc
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	ldr r0, _08071708 @ =StartMenu_PokedexCallback
	cmp r1, r0
	bne _080716C4
	movs r0, 0
	bl GetNationalPokedexCount
	lsls r0, 16
	cmp r0, 0
	beq _08071724
_080716C4:
	ldr r3, _0807170C @ =gCallback_03004AE8
	ldr r1, _08071700 @ =gStartMenuItems
	ldr r2, _08071704 @ =0x0202e8fe
	ldr r0, _080716FC @ =0x0202e8fc
	ldrb r0, [r0]
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 3
	adds r1, 0x4
	adds r0, r1
	ldr r1, [r0]
	str r1, [r3]
	ldr r0, _08071710 @ =StartMenu_SaveCallback
	cmp r1, r0
	beq _08071724
	ldr r0, _08071714 @ =StartMenu_ExitCallback
	cmp r1, r0
	beq _08071724
	ldr r0, _08071718 @ =StartMenu_RetireCallback
	cmp r1, r0
	beq _08071724
	movs r0, 0x1
	movs r1, 0
	bl fade_screen
	b _08071724
	.align 2, 0
_080716F8: .4byte gMain
_080716FC: .4byte 0x0202e8fc
_08071700: .4byte gStartMenuItems
_08071704: .4byte 0x0202e8fe
_08071708: .4byte StartMenu_PokedexCallback
_0807170C: .4byte gCallback_03004AE8
_08071710: .4byte StartMenu_SaveCallback
_08071714: .4byte StartMenu_ExitCallback
_08071718: .4byte StartMenu_RetireCallback
_0807171C:
	movs r0, 0xA
	ands r0, r1
	cmp r0, 0
	bne _08071728
_08071724:
	movs r0, 0
	b _0807172E
_08071728:
	bl sub_8071C20
	movs r0, 0x1
_0807172E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end StartMenu_InputProcessCallback

	thumb_func_start StartMenu_PokedexCallback
StartMenu_PokedexCallback: @ 8071734
	push {lr}
	ldr r0, _08071748 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807174C
	movs r0, 0
	b _0807175E
	.align 2, 0
_08071748: .4byte gPaletteFade
_0807174C:
	movs r0, 0x29
	bl sav12_xor_increment
	bl PlayRainSoundEffect
	ldr r0, _08071764 @ =CB2_InitPokedex
	bl SetMainCallback2
	movs r0, 0x1
_0807175E:
	pop {r1}
	bx r1
	.align 2, 0
_08071764: .4byte CB2_InitPokedex
	thumb_func_end StartMenu_PokedexCallback

	thumb_func_start StartMenu_PokemonCallback
StartMenu_PokemonCallback: @ 8071768
	push {lr}
	ldr r0, _0807177C @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071780
	movs r0, 0
	b _0807178C
	.align 2, 0
_0807177C: .4byte gPaletteFade
_08071780:
	bl PlayRainSoundEffect
	ldr r0, _08071790 @ =sub_8089A70
	bl SetMainCallback2
	movs r0, 0x1
_0807178C:
	pop {r1}
	bx r1
	.align 2, 0
_08071790: .4byte sub_8089A70
	thumb_func_end StartMenu_PokemonCallback

	thumb_func_start StartMenu_BagCallback
StartMenu_BagCallback: @ 8071794
	push {lr}
	ldr r0, _080717A8 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080717AC
	movs r0, 0
	b _080717B8
	.align 2, 0
_080717A8: .4byte gPaletteFade
_080717AC:
	bl PlayRainSoundEffect
	ldr r0, _080717BC @ =sub_80A53F8
	bl SetMainCallback2
	movs r0, 0x1
_080717B8:
	pop {r1}
	bx r1
	.align 2, 0
_080717BC: .4byte sub_80A53F8
	thumb_func_end StartMenu_BagCallback

	thumb_func_start StartMenu_PokenavCallback
StartMenu_PokenavCallback: @ 80717C0
	push {lr}
	ldr r0, _080717D4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080717D8
	movs r0, 0
	b _080717E4
	.align 2, 0
_080717D4: .4byte gPaletteFade
_080717D8:
	bl PlayRainSoundEffect
	ldr r0, _080717E8 @ =sub_80EBA5C
	bl SetMainCallback2
	movs r0, 0x1
_080717E4:
	pop {r1}
	bx r1
	.align 2, 0
_080717E8: .4byte sub_80EBA5C
	thumb_func_end StartMenu_PokenavCallback

	thumb_func_start StartMenu_PlayerCallback
StartMenu_PlayerCallback: @ 80717EC
	push {lr}
	ldr r0, _08071800 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08071804
	movs r0, 0
	b _08071810
	.align 2, 0
_08071800: .4byte gPaletteFade
_08071804:
	bl PlayRainSoundEffect
	ldr r0, _08071814 @ =sub_805469C
	bl sub_8093110
	movs r0, 0x1
_08071810:
	pop {r1}
	bx r1
	.align 2, 0
_08071814: .4byte sub_805469C
	thumb_func_end StartMenu_PlayerCallback

	thumb_func_start StartMenu_SaveCallback
StartMenu_SaveCallback: @ 8071818
	push {lr}
	bl sub_8072DEC
	ldr r1, _0807182C @ =gCallback_03004AE8
	ldr r0, _08071830 @ =SaveCallback1
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0807182C: .4byte gCallback_03004AE8
_08071830: .4byte SaveCallback1
	thumb_func_end StartMenu_SaveCallback

	thumb_func_start StartMenu_OptionCallback
StartMenu_OptionCallback: @ 8071834
	push {lr}
	ldr r0, _08071848 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0807184C
	movs r0, 0
	b _0807185E
	.align 2, 0
_08071848: .4byte gPaletteFade
_0807184C:
	bl PlayRainSoundEffect
	ldr r0, _08071864 @ =CB2_InitOptionMenu
	bl SetMainCallback2
	ldr r1, _08071868 @ =gMain
	ldr r0, _0807186C @ =sub_805469C
	str r0, [r1, 0x8]
	movs r0, 0x1
_0807185E:
	pop {r1}
	bx r1
	.align 2, 0
_08071864: .4byte CB2_InitOptionMenu
_08071868: .4byte gMain
_0807186C: .4byte sub_805469C
	thumb_func_end StartMenu_OptionCallback

	thumb_func_start StartMenu_ExitCallback
StartMenu_ExitCallback: @ 8071870
	push {lr}
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end StartMenu_ExitCallback

	thumb_func_start StartMenu_RetireCallback
StartMenu_RetireCallback: @ 807187C
	push {lr}
	bl sub_8071C20
	bl SafariZoneRetirePrompt
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end StartMenu_RetireCallback

	thumb_func_start StartMenu_PlayerLinkCallback
StartMenu_PlayerLinkCallback: @ 807188C
	push {lr}
	ldr r0, _080718A0 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080718A4
	movs r0, 0
	b _080718B4
	.align 2, 0
_080718A0: .4byte gPaletteFade
_080718A4:
	bl PlayRainSoundEffect
	ldr r0, _080718B8 @ =gUnknown_03004860
	ldrb r0, [r0]
	ldr r1, _080718BC @ =sub_805469C
	bl sub_8093130
	movs r0, 0x1
_080718B4:
	pop {r1}
	bx r1
	.align 2, 0
_080718B8: .4byte gUnknown_03004860
_080718BC: .4byte sub_805469C
	thumb_func_end StartMenu_PlayerLinkCallback

	thumb_func_start SaveCallback1
SaveCallback1: @ 80718C0
	push {lr}
	bl sub_807160C
	ldr r1, _080718D4 @ =gCallback_03004AE8
	ldr r0, _080718D8 @ =SaveCallback2
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080718D4: .4byte gCallback_03004AE8
_080718D8: .4byte SaveCallback2
	thumb_func_end SaveCallback1

	thumb_func_start SaveCallback2
SaveCallback2: @ 80718DC
	push {lr}
	bl RunSaveDialogCallback
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08071910
	cmp r0, 0x1
	ble _08071920
	cmp r0, 0x2
	beq _080718F8
	cmp r0, 0x3
	beq _08071910
	b _08071920
_080718F8:
	bl MenuZeroFillScreen
	bl InitStartMenu
	ldr r1, _08071908 @ =gCallback_03004AE8
	ldr r0, _0807190C @ =StartMenu_InputProcessCallback
	str r0, [r1]
	b _08071920
	.align 2, 0
_08071908: .4byte gCallback_03004AE8
_0807190C: .4byte StartMenu_InputProcessCallback
_08071910:
	bl MenuZeroFillScreen
	bl sub_8064E2C
	bl ScriptContext2_Disable
	movs r0, 0x1
	b _08071922
_08071920:
	movs r0, 0
_08071922:
	pop {r1}
	bx r1
	thumb_func_end SaveCallback2

	thumb_func_start sub_807160C
sub_807160C: @ 8071928
	push {lr}
	bl save_serialize_map
	ldr r1, _08071940 @ =0x030006a8
	ldr r0, _08071944 @ =SaveDialogCB_DisplayConfirmMessage
	str r0, [r1]
	ldr r1, _08071948 @ =0x030006ad
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08071940: .4byte 0x030006a8
_08071944: .4byte SaveDialogCB_DisplayConfirmMessage
_08071948: .4byte 0x030006ad
	thumb_func_end sub_807160C

	thumb_func_start RunSaveDialogCallback
RunSaveDialogCallback: @ 807194C
	push {lr}
	ldr r0, _08071964 @ =0x030006ad
	ldrb r0, [r0]
	cmp r0, 0
	beq _08071968
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	bne _08071968
	movs r0, 0
	b _0807197A
	.align 2, 0
_08071964: .4byte 0x030006ad
_08071968:
	ldr r1, _08071980 @ =0x030006ad
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08071984 @ =0x030006a8
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
_0807197A:
	pop {r1}
	bx r1
	.align 2, 0
_08071980: .4byte 0x030006ad
_08071984: .4byte 0x030006a8
	thumb_func_end RunSaveDialogCallback

	thumb_func_start InitSaveDialog
InitSaveDialog: @ 8071988
	push {lr}
	bl sub_807160C
	ldr r0, _0807199C @ =Task_SaveDialog
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_0807199C: .4byte Task_SaveDialog
	thumb_func_end InitSaveDialog

	thumb_func_start DisplaySaveMessageWithCallback
DisplaySaveMessageWithCallback: @ 80719A0
	push {r4,r5,lr}
	adds r2, r0, 0
	adds r5, r1, 0
	ldr r4, _080719CC @ =gStringVar4
	adds r0, r4, 0
	adds r1, r2, 0
	bl StringExpandPlaceholders
	bl MenuDisplayMessageBox
	adds r0, r4, 0
	bl sub_8072044
	ldr r1, _080719D0 @ =0x030006ad
	movs r0, 0x1
	strb r0, [r1]
	ldr r0, _080719D4 @ =0x030006a8
	str r5, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080719CC: .4byte gStringVar4
_080719D0: .4byte 0x030006ad
_080719D4: .4byte 0x030006a8
	thumb_func_end DisplaySaveMessageWithCallback

	thumb_func_start Task_SaveDialog
Task_SaveDialog: @ 80719D8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl RunSaveDialogCallback
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1
	beq _08071A04
	cmp r1, 0x1
	bgt _080719F4
	cmp r1, 0
	beq _08071A12
	b _08071A08
_080719F4:
	cmp r1, 0x3
	bgt _08071A08
	ldr r1, _08071A00 @ =gScriptResult
	movs r0, 0
	strh r0, [r1]
	b _08071A08
	.align 2, 0
_08071A00: .4byte gScriptResult
_08071A04:
	ldr r0, _08071A18 @ =gScriptResult
	strh r1, [r0]
_08071A08:
	adds r0, r4, 0
	bl DestroyTask
	bl EnableBothScriptContexts
_08071A12:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08071A18: .4byte gScriptResult
	thumb_func_end Task_SaveDialog

	thumb_func_start sub_8071700
sub_8071700: @ 8071A1C
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_80946C8
	pop {r0}
	bx r0
	thumb_func_end sub_8071700

	thumb_func_start HideSaveDialog
HideSaveDialog: @ 8071A2C
	push {lr}
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1A
	movs r3, 0xD
	bl MenuZeroFillWindowRect
	pop {r0}
	bx r0
	thumb_func_end HideSaveDialog

	thumb_func_start SaveDialogStartTimeout
SaveDialogStartTimeout: @ 8071A40
	ldr r1, _08071A48 @ =0x030006ac
	movs r0, 0x3C
	strb r0, [r1]
	bx lr
	.align 2, 0
_08071A48: .4byte 0x030006ac
	thumb_func_end SaveDialogStartTimeout

	thumb_func_start SaveDialogCheckForTimeoutOrKeypress
SaveDialogCheckForTimeoutOrKeypress: @ 8071A4C
	push {lr}
	ldr r1, _08071A6C @ =0x030006ac
	ldrb r0, [r1]
	subs r2, r0, 0x1
	strb r2, [r1]
	ldr r0, _08071A70 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08071A74
	lsls r0, r2, 24
	cmp r0, 0
	beq _08071A7A
	movs r0, 0
	b _08071A7C
	.align 2, 0
_08071A6C: .4byte 0x030006ac
_08071A70: .4byte gMain
_08071A74:
	movs r0, 0x5
	bl PlaySE
_08071A7A:
	movs r0, 0x1
_08071A7C:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCheckForTimeoutOrKeypress

	thumb_func_start SaveDialogCheckForTimeoutAndKeypress
SaveDialogCheckForTimeoutAndKeypress: @ 8071A80
	push {lr}
	ldr r1, _08071A9C @ =0x030006ac
	ldrb r0, [r1]
	cmp r0, 0
	bne _08071AA4
	ldr r0, _08071AA0 @ =gMain
	ldrh r1, [r0, 0x2C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08071AA8
	movs r0, 0x1
	b _08071AAA
	.align 2, 0
_08071A9C: .4byte 0x030006ac
_08071AA0: .4byte gMain
_08071AA4:
	subs r0, 0x1
	strb r0, [r1]
_08071AA8:
	movs r0, 0
_08071AAA:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCheckForTimeoutAndKeypress

	thumb_func_start SaveDialogCB_DisplayConfirmMessage
SaveDialogCB_DisplayConfirmMessage: @ 8071AB0
	push {lr}
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	bl HandleDrawSaveWindowInfo
	ldr r0, _08071ACC @ =gSaveText_WouldYouLikeToSave
	ldr r1, _08071AD0 @ =SaveDialogCB_DisplayConfirmYesNoMenu
	bl DisplaySaveMessageWithCallback
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071ACC: .4byte gSaveText_WouldYouLikeToSave
_08071AD0: .4byte SaveDialogCB_DisplayConfirmYesNoMenu
	thumb_func_end SaveDialogCB_DisplayConfirmMessage

	thumb_func_start SaveDialogCB_DisplayConfirmYesNoMenu
SaveDialogCB_DisplayConfirmYesNoMenu: @ 8071AD4
	push {lr}
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08071AEC @ =0x030006a8
	ldr r0, _08071AF0 @ =SaveDialogCB_ProcessConfirmYesNoMenu
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071AEC: .4byte 0x030006a8
_08071AF0: .4byte SaveDialogCB_ProcessConfirmYesNoMenu
	thumb_func_end SaveDialogCB_DisplayConfirmYesNoMenu

	thumb_func_start SaveDialogCB_ProcessConfirmYesNoMenu
SaveDialogCB_ProcessConfirmYesNoMenu: @ 8071AF4
	push {lr}
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08071B16
	cmp r1, 0
	bgt _08071B10
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08071B58
	b _08071B64
_08071B10:
	cmp r1, 0x1
	beq _08071B58
	b _08071B64
_08071B16:
	bl HideSaveDialog
	ldr r0, _08071B38 @ =gSaveFileStatus
	ldrh r0, [r0]
	cmp r0, 0
	beq _08071B26
	cmp r0, 0x2
	bne _08071B2E
_08071B26:
	ldr r0, _08071B3C @ =gUnknown_020297EC
	ldrb r0, [r0]
	cmp r0, 0
	bne _08071B48
_08071B2E:
	ldr r1, _08071B40 @ =0x030006a8
	ldr r0, _08071B44 @ =SaveDialogCB_SaveFileExists
	str r0, [r1]
	b _08071B64
	.align 2, 0
_08071B38: .4byte gSaveFileStatus
_08071B3C: .4byte gUnknown_020297EC
_08071B40: .4byte 0x030006a8
_08071B44: .4byte SaveDialogCB_SaveFileExists
_08071B48:
	ldr r1, _08071B50 @ =0x030006a8
	ldr r0, _08071B54 @ =SaveDialogCB_DisplaySavingMessage
	str r0, [r1]
	b _08071B64
	.align 2, 0
_08071B50: .4byte 0x030006a8
_08071B54: .4byte SaveDialogCB_DisplaySavingMessage
_08071B58:
	bl HideSaveDialog
	bl sub_8071700
	movs r0, 0x2
	b _08071B66
_08071B64:
	movs r0, 0
_08071B66:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCB_ProcessConfirmYesNoMenu

	thumb_func_start SaveDialogCB_SaveFileExists
SaveDialogCB_SaveFileExists: @ 8071B6C
	push {lr}
	ldr r0, _08071B88 @ =gUnknown_020297EC
	ldrb r0, [r0]
	ldr r2, _08071B8C @ =gSaveText_ThereIsAlreadyAFile
	cmp r0, 0x1
	bne _08071B7A
	ldr r2, _08071B90 @ =gSaveText_ThereIsADifferentFile
_08071B7A:
	ldr r1, _08071B94 @ =SaveDialogCB_DisplayOverwriteYesNoMenu
	adds r0, r2, 0
	bl DisplaySaveMessageWithCallback
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071B88: .4byte gUnknown_020297EC
_08071B8C: .4byte gSaveText_ThereIsAlreadyAFile
_08071B90: .4byte gSaveText_ThereIsADifferentFile
_08071B94: .4byte SaveDialogCB_DisplayOverwriteYesNoMenu
	thumb_func_end SaveDialogCB_SaveFileExists

	thumb_func_start SaveDialogCB_DisplayOverwriteYesNoMenu
SaveDialogCB_DisplayOverwriteYesNoMenu: @ 8071B98
	push {lr}
	movs r0, 0x14
	movs r1, 0x8
	movs r2, 0x1
	bl DisplayYesNoMenu
	ldr r1, _08071BB0 @ =0x030006a8
	ldr r0, _08071BB4 @ =SaveDialogCB_ProcessOverwriteYesNoMenu
	str r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071BB0: .4byte 0x030006a8
_08071BB4: .4byte SaveDialogCB_ProcessOverwriteYesNoMenu
	thumb_func_end SaveDialogCB_DisplayOverwriteYesNoMenu

	thumb_func_start SaveDialogCB_ProcessOverwriteYesNoMenu
SaveDialogCB_ProcessOverwriteYesNoMenu: @ 8071BB8
	push {lr}
	bl ProcessMenuInputNoWrap_
	lsls r0, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _08071BDA
	cmp r1, 0
	bgt _08071BD4
	movs r0, 0x1
	negs r0, r0
	cmp r1, r0
	beq _08071BF0
	b _08071BFC
_08071BD4:
	cmp r1, 0x1
	beq _08071BF0
	b _08071BFC
_08071BDA:
	bl HideSaveDialog
	ldr r1, _08071BE8 @ =0x030006a8
	ldr r0, _08071BEC @ =SaveDialogCB_DisplaySavingMessage
	str r0, [r1]
	b _08071BFC
	.align 2, 0
_08071BE8: .4byte 0x030006a8
_08071BEC: .4byte SaveDialogCB_DisplaySavingMessage
_08071BF0:
	bl HideSaveDialog
	bl sub_8071700
	movs r0, 0x2
	b _08071BFE
_08071BFC:
	movs r0, 0
_08071BFE:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCB_ProcessOverwriteYesNoMenu

	thumb_func_start SaveDialogCB_DisplaySavingMessage
SaveDialogCB_DisplaySavingMessage: @ 8071C04
	push {lr}
	ldr r0, _08071C14 @ =BattleTower_BattleRoom_Text_1C6CE1
	ldr r1, _08071C18 @ =SaveDialogCB_DoSave
	bl DisplaySaveMessageWithCallback
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071C14: .4byte BattleTower_BattleRoom_Text_1C6CE1
_08071C18: .4byte SaveDialogCB_DoSave
	thumb_func_end SaveDialogCB_DisplaySavingMessage

	thumb_func_start SaveDialogCB_DoSave
SaveDialogCB_DoSave: @ 8071C1C
	push {r4,lr}
	movs r0, 0
	bl sav12_xor_increment
	ldr r4, _08071C3C @ =gUnknown_020297EC
	ldrb r0, [r4]
	cmp r0, 0x1
	bne _08071C40
	movs r0, 0x4
	bl sub_8125D44
	lsls r0, 24
	lsrs r1, r0, 24
	movs r0, 0
	strb r0, [r4]
	b _08071C4A
	.align 2, 0
_08071C3C: .4byte gUnknown_020297EC
_08071C40:
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r1, r0, 24
_08071C4A:
	cmp r1, 0x1
	bne _08071C60
	ldr r0, _08071C58 @ =BattleTower_BattleRoom_Text_1C6D05
	ldr r1, _08071C5C @ =SaveDialogCB_SaveSuccess
	bl DisplaySaveMessageWithCallback
	b _08071C68
	.align 2, 0
_08071C58: .4byte BattleTower_BattleRoom_Text_1C6D05
_08071C5C: .4byte SaveDialogCB_SaveSuccess
_08071C60:
	ldr r0, _08071C74 @ =gSystemText_SaveErrorExchangeBackup
	ldr r1, _08071C78 @ =SaveDialogCB_SaveError
	bl DisplaySaveMessageWithCallback
_08071C68:
	bl SaveDialogStartTimeout
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08071C74: .4byte gSystemText_SaveErrorExchangeBackup
_08071C78: .4byte SaveDialogCB_SaveError
	thumb_func_end SaveDialogCB_DoSave

	thumb_func_start SaveDialogCB_SaveSuccess
SaveDialogCB_SaveSuccess: @ 8071C7C
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08071C94
	movs r0, 0x37
	bl PlaySE
	ldr r1, _08071C9C @ =0x030006a8
	ldr r0, _08071CA0 @ =SaveDialogCB_ReturnSuccess
	str r0, [r1]
_08071C94:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071C9C: .4byte 0x030006a8
_08071CA0: .4byte SaveDialogCB_ReturnSuccess
	thumb_func_end SaveDialogCB_SaveSuccess

	thumb_func_start SaveDialogCB_ReturnSuccess
SaveDialogCB_ReturnSuccess: @ 8071CA4
	push {lr}
	bl IsSEPlaying
	lsls r0, 24
	cmp r0, 0
	bne _08071CC2
	bl SaveDialogCheckForTimeoutOrKeypress
	lsls r0, 24
	cmp r0, 0
	beq _08071CC2
	bl sub_8071700
	movs r0, 0x1
	b _08071CC4
_08071CC2:
	movs r0, 0
_08071CC4:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCB_ReturnSuccess

	thumb_func_start SaveDialogCB_SaveError
SaveDialogCB_SaveError: @ 8071CC8
	push {lr}
	bl MenuUpdateWindowText
	lsls r0, 24
	cmp r0, 0
	beq _08071CE0
	movs r0, 0x16
	bl PlaySE
	ldr r1, _08071CE8 @ =0x030006a8
	ldr r0, _08071CEC @ =SaveDialogCB_ReturnError
	str r0, [r1]
_08071CE0:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08071CE8: .4byte 0x030006a8
_08071CEC: .4byte SaveDialogCB_ReturnError
	thumb_func_end SaveDialogCB_SaveError

	thumb_func_start SaveDialogCB_ReturnError
SaveDialogCB_ReturnError: @ 8071CF0
	push {lr}
	bl SaveDialogCheckForTimeoutAndKeypress
	lsls r0, 24
	cmp r0, 0
	beq _08071D04
	bl sub_8071700
	movs r0, 0x3
	b _08071D06
_08071D04:
	movs r0, 0
_08071D06:
	pop {r1}
	bx r1
	thumb_func_end SaveDialogCB_ReturnError

	thumb_func_start sub_80719F0
sub_80719F0: @ 8071D0C
	push {lr}
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_80719F0

	thumb_func_start sub_80719FC
sub_80719FC: @ 8071D18
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _08071D2A
	b _08071E2C
_08071D2A:
	lsls r0, 2
	ldr r1, _08071D34 @ =_08071D38
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071D34: .4byte _08071D38
	.align 2, 0
_08071D38:
	.4byte _08071D4C
	.4byte _08071DC0
	.4byte _08071DD2
	.4byte _08071DF4
	.4byte _08071E28
_08071D4C:
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	bl remove_some_task
	movs r2, 0xA0
	lsls r2, 19
	mov r0, sp
	strh r4, [r0]
	ldr r1, _08071DB4 @ =0x040000d4
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08071DB8 @ =0x81000200
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08071DBC @ =0x81000800
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08071D8A:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08071D8A
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	b _08071E2C
	.align 2, 0
_08071DB4: .4byte 0x040000d4
_08071DB8: .4byte 0x81000200
_08071DBC: .4byte 0x81000800
_08071DC0:
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	bl dp12_8087EA4
	b _08071E2C
_08071DD2:
	ldr r4, _08071DF0 @ =gWindowConfig_81E6CE4
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl InitMenuWindow
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x80
	lsls r2, 1
	adds r0, r2, 0
	strh r0, [r1]
	b _08071E2C
	.align 2, 0
_08071DF0: .4byte gWindowConfig_81E6CE4
_08071DF4:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0x10
	movs r2, 0
	bl BlendPalettes
	ldr r0, _08071E1C @ =sub_80719F0
	bl SetVBlankCallback
	ldr r3, _08071E20 @ =0x04000208
	ldrh r2, [r3]
	movs r0, 0
	strh r0, [r3]
	ldr r4, _08071E24 @ =0x04000200
	ldrh r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r3]
	b _08071E2C
	.align 2, 0
_08071E1C: .4byte sub_80719F0
_08071E20: .4byte 0x04000208
_08071E24: .4byte 0x04000200
_08071E28:
	movs r0, 0x1
	b _08071E36
_08071E2C:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	movs r0, 0
_08071E36:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80719FC

	thumb_func_start sub_8071B28
sub_8071B28: @ 8071E44
	push {lr}
	ldr r0, _08071E64 @ =0x03001bac
	bl sub_80719FC
	cmp r0, 0
	beq _08071E5E
	ldr r0, _08071E68 @ =Task_8071B64
	movs r1, 0x50
	bl CreateTask
	ldr r0, _08071E6C @ =sub_8071B54
	bl SetMainCallback2
_08071E5E:
	pop {r0}
	bx r0
	.align 2, 0
_08071E64: .4byte 0x03001bac
_08071E68: .4byte Task_8071B64
_08071E6C: .4byte sub_8071B54
	thumb_func_end sub_8071B28

	thumb_func_start sub_8071B54
sub_8071B54: @ 8071E70
	push {lr}
	bl RunTasks
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_8071B54

	thumb_func_start Task_8071B64
Task_8071B64: @ 8071E80
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08071EB0 @ =0x03004b38
	adds r4, r0, r1
	ldr r0, _08071EB4 @ =gPaletteFade
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _08071F30
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0x4
	bhi _08071F30
	lsls r0, 2
	ldr r1, _08071EB8 @ =_08071EBC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08071EB0: .4byte 0x03004b38
_08071EB4: .4byte gPaletteFade
_08071EB8: .4byte _08071EBC
	.align 2, 0
_08071EBC:
	.4byte _08071ED0
	.4byte _08071EF0
	.4byte _08071EFA
	.4byte _08071F0A
	.4byte _08071F22
_08071ED0:
	bl MenuDisplayMessageBox
	ldr r0, _08071EEC @ =gSystemText_Saving
	movs r1, 0x2
	movs r2, 0xF
	bl MenuPrint
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	b _08071F16
	.align 2, 0
_08071EEC: .4byte gSystemText_Saving
_08071EF0:
	bl SetSecretBase2Field_9_AndHideBG
	bl sub_8125E2C
	b _08071F1A
_08071EFA:
	bl sub_8125E6C
	lsls r0, 24
	cmp r0, 0
	beq _08071F30
	bl ClearSecretBase2Field_9_2
	b _08071F1A
_08071F0A:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0
	movs r3, 0x10
_08071F16:
	bl BeginNormalPaletteFade
_08071F1A:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _08071F30
_08071F22:
	ldr r0, _08071F38 @ =gMain
	ldr r0, [r0, 0x8]
	bl SetMainCallback2
	adds r0, r5, 0
	bl DestroyTask
_08071F30:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071F38: .4byte gMain
	thumb_func_end Task_8071B64

	.align 2, 0 @ Don't pad with nop.
