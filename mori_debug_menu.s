	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_8083CF0
unref_sub_8083CF0: @ 8084144
	push {r4-r7,lr}
	ldr r0, _0808418C @ =0x04000128
	ldr r4, [r0]
	lsls r4, 26
	lsrs r4, 30
	ldr r0, _08084190 @ =gUnknown_03004DA0
	movs r1, 0xFF
	strb r1, [r0]
	ldr r1, _08084194 @ =gUnknown_0839B24A
	bl StringAppend
	movs r5, 0
	ldr r0, _08084198 @ =word_3002910
	movs r6, 0x1
	eors r4, r6
	lsls r4, 1
	adds r7, r4, r0
	movs r4, 0
_08084168:
	ldrh r0, [r7]
	asrs r0, r5
	ands r0, r6
	cmp r0, 0
	beq _0808417C
	ldr r1, _0808419C @ =gUnknown_0839B22C
	adds r1, r4, r1
	ldr r0, _08084190 @ =gUnknown_03004DA0
	bl StringAppend
_0808417C:
	adds r4, 0x3
	adds r5, 0x1
	cmp r5, 0x9
	ble _08084168
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808418C: .4byte 0x04000128
_08084190: .4byte gUnknown_03004DA0
_08084194: .4byte gUnknown_0839B24A
_08084198: .4byte word_3002910
_0808419C: .4byte gUnknown_0839B22C
	thumb_func_end unref_sub_8083CF0

	thumb_func_start sub_8083D4C
sub_8083D4C: @ 80841A0
	push {lr}
	ldr r0, _080841B4 @ =gMain
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080841B8
	movs r0, 0
	b _080841BE
	.align 2, 0
_080841B4: .4byte gMain
_080841B8:
	bl sub_8071C20
	movs r0, 0x1
_080841BE:
	pop {r1}
	bx r1
	thumb_func_end sub_8083D4C

	thumb_func_start MoriDebugMenu_SearchChild
MoriDebugMenu_SearchChild: @ 80841C4
	push {r4-r6,lr}
	sub sp, 0x34
	ldr r0, _08084238 @ =gPlayerParty
	movs r1, 0xB
	bl GetMonData
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_8041870
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	movs r6, 0xB
	adds r1, r4, 0
	muls r1, r6
	ldr r4, _0808423C @ =gSpeciesNames
	adds r1, r4
	mov r0, sp
	bl StringCopy
	ldr r1, _08084240 @ =gUnknown_0839B24D
	mov r0, sp
	bl StringAppend
	adds r1, r5, 0
	muls r1, r6
	adds r1, r4
	mov r0, sp
	bl StringAppend
	ldr r1, _08084244 @ =gUnknown_0839B255
	mov r0, sp
	bl StringAppend
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0xE
	movs r2, 0x1E
	movs r3, 0x13
	bl MenuDrawTextWindow
	mov r0, sp
	movs r1, 0x1
	movs r2, 0xF
	bl MenuPrint
	ldr r1, _08084248 @ =gCallback_03004AE8
	ldr r0, _0808424C @ =sub_8083D4C
	str r0, [r1]
	movs r0, 0
	add sp, 0x34
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08084238: .4byte gPlayerParty
_0808423C: .4byte gSpeciesNames
_08084240: .4byte gUnknown_0839B24D
_08084244: .4byte gUnknown_0839B255
_08084248: .4byte gCallback_03004AE8
_0808424C: .4byte sub_8083D4C
	thumb_func_end MoriDebugMenu_SearchChild

	thumb_func_start MoriDebugMenu_Egg
MoriDebugMenu_Egg: @ 8084250
	push {lr}
	ldr r0, _08084278 @ =0x020286d0
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0808426E
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	cmp r0, 0
	beq _0808426E
	bl sub_8041940
_0808426E:
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08084278: .4byte 0x020286d0
	thumb_func_end MoriDebugMenu_Egg

	thumb_func_start MoriDebugMenu_MaleEgg
MoriDebugMenu_MaleEgg: @ 808427C
	push {lr}
	ldr r0, _080842A4 @ =0x020286d0
	bl daycare_count_pokemon
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0808429A
	bl daycare_relationship_score_from_savegame
	lsls r0, 24
	cmp r0, 0
	beq _0808429A
	bl sub_8041950
_0808429A:
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080842A4: .4byte 0x020286d0
	thumb_func_end MoriDebugMenu_MaleEgg

	thumb_func_start MoriDebugMenu_1000Steps
MoriDebugMenu_1000Steps: @ 80842A8
	push {lr}
	movs r0, 0xFA
	lsls r0, 2
	bl sub_8041790
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenu_1000Steps

	thumb_func_start MoriDebugMenu_10000Steps
MoriDebugMenu_10000Steps: @ 80842BC
	push {lr}
	ldr r0, _080842D0 @ =0x00002710
	bl sub_8041790
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080842D0: .4byte 0x00002710
	thumb_func_end MoriDebugMenu_10000Steps

	thumb_func_start MoriDebugMenu_MoveTutor
MoriDebugMenu_MoveTutor: @ 80842D4
	push {lr}
	bl sub_8132670
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenu_MoveTutor

	thumb_func_start MoriDebugMenu_BreedEgg
MoriDebugMenu_BreedEgg: @ 80842E4
	push {r4-r6,lr}
	sub sp, 0x4
	movs r5, 0
	movs r6, 0
_080842EC:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _08084334 @ =gPlayerParty
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl GetMonData
	cmp r0, 0
	beq _08084310
	mov r0, sp
	strb r6, [r0]
	adds r0, r4, 0
	movs r1, 0x20
	mov r2, sp
	bl SetMonData
_08084310:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _080842EC
	ldr r0, _08084338 @ =gSaveBlock1
	ldr r1, _0808433C @ =0x000030b6
	adds r0, r1
	movs r1, 0xFD
	strb r1, [r0]
	bl sub_8071C20
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08084334: .4byte gPlayerParty
_08084338: .4byte gSaveBlock1
_0808433C: .4byte 0x000030b6
	thumb_func_end MoriDebugMenu_BreedEgg

	thumb_func_start MoriDebugMenu_LongName
MoriDebugMenu_LongName: @ 8084340
	push {lr}
	ldr r0, _08084358 @ =gPlayerParty
	ldr r2, _0808435C @ =gUnknown_0839B257
	movs r1, 0x2
	bl SetMonData
	bl sub_8071C20
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08084358: .4byte gPlayerParty
_0808435C: .4byte gUnknown_0839B257
	thumb_func_end MoriDebugMenu_LongName

	thumb_func_start MoriDebugMenu_PokeblockCase
MoriDebugMenu_PokeblockCase: @ 8084360
	push {r4,lr}
	movs r4, 0
_08084364:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_810CA6C
	adds r4, 0x1
	cmp r4, 0x27
	ble _08084364
	bl sub_8071C20
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenu_PokeblockCase

	thumb_func_start MoriDebugMenuProcessInput
MoriDebugMenuProcessInput: @ 8084380
	push {lr}
	bl ProcessMenuInput
	lsls r0, 24
	asrs r1, r0, 24
	movs r0, 0x2
	negs r0, r0
	cmp r1, r0
	beq _080843A6
	adds r0, 0x1
	cmp r1, r0
	beq _080843B4
	ldr r2, _080843AC @ =gCallback_03004AE8
	ldr r0, _080843B0 @ =gMoriDebugMenuActions
	lsls r1, 3
	adds r0, 0x4
	adds r1, r0
	ldr r0, [r1]
	str r0, [r2]
_080843A6:
	movs r0, 0
	b _080843BA
	.align 2, 0
_080843AC: .4byte gCallback_03004AE8
_080843B0: .4byte gMoriDebugMenuActions
_080843B4:
	bl sub_8071C20
	movs r0, 0x1
_080843BA:
	pop {r1}
	bx r1
	thumb_func_end MoriDebugMenuProcessInput

	thumb_func_start InitMoriDebugMenu
InitMoriDebugMenu: @ 80843C0
	push {lr}
	sub sp, 0x8
	bl MenuZeroFillScreen
	movs r0, 0
	movs r1, 0
	movs r2, 0xA
	movs r3, 0x13
	bl MenuDrawTextWindow
	ldr r3, _08084404 @ =gMoriDebugMenuActions
	movs r0, 0x1
	movs r1, 0x1
	movs r2, 0x9
	bl PrintMenuItems
	movs r0, 0
	str r0, [sp]
	movs r0, 0x9
	str r0, [sp, 0x4]
	movs r0, 0
	movs r1, 0x1
	movs r2, 0x1
	movs r3, 0x9
	bl InitMenu
	ldr r1, _08084408 @ =gCallback_03004AE8
	ldr r0, _0808440C @ =MoriDebugMenuProcessInput
	str r0, [r1]
	movs r0, 0
	add sp, 0x8
	pop {r1}
	bx r1
	.align 2, 0
_08084404: .4byte gMoriDebugMenuActions
_08084408: .4byte gCallback_03004AE8
_0808440C: .4byte MoriDebugMenuProcessInput
	thumb_func_end InitMoriDebugMenu

	.align 2, 0 @ Don't pad with nop.
