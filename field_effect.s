	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start FieldEffectStart
FieldEffectStart: @ 8085ABC
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl FieldEffectActiveListAdd
	ldr r0, _08085AFC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	str r0, [sp]
	add r4, sp, 0x4
	ldr r5, _08085B00
_08085ADA:
	ldr r0, [sp]
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r5
	ldr r2, [r0]
	mov r0, sp
	adds r1, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08085ADA
	ldr r0, [sp, 0x4]
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08085AFC: .4byte gFieldEffectScriptPointers
_08085B00: .4byte gFieldEffectScriptFuncs
	thumb_func_end FieldEffectStart

	thumb_func_start FieldEffectCmd_loadtiles
FieldEffectCmd_loadtiles: @ 8085B04
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl FieldEffectScript_LoadTiles
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadtiles

	thumb_func_start FieldEffectCmd_loadfadedpal
FieldEffectCmd_loadfadedpal: @ 8085B18
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl FieldEffectScript_LoadFadedPalette
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadfadedpal

	thumb_func_start FieldEffectCmd_loadpal
FieldEffectCmd_loadpal: @ 8085B2C
	push {lr}
	ldr r1, [r0]
	adds r1, 0x1
	str r1, [r0]
	bl FieldEffectScript_LoadPalette
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadpal

	thumb_func_start FieldEffectCmd_callnative
FieldEffectCmd_callnative: @ 8085B40
	push {lr}
	ldr r2, [r0]
	adds r2, 0x1
	str r2, [r0]
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_callnative

	thumb_func_start FieldEffectCmd_end
FieldEffectCmd_end: @ 8085B54
	movs r0, 0
	bx lr
	thumb_func_end FieldEffectCmd_end

	thumb_func_start FieldEffectCmd_loadgfx_callnative
FieldEffectCmd_loadgfx_callnative: @ 8085B58
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, 0
	bl FieldEffectScript_LoadFadedPalette
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadgfx_callnative

	thumb_func_start FieldEffectCmd_loadtiles_callnative
FieldEffectCmd_loadtiles_callnative: @ 8085B80
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadTiles
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadtiles_callnative

	thumb_func_start FieldEffectCmd_loadfadedpal_callnative
FieldEffectCmd_loadfadedpal_callnative: @ 8085BA4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [r4]
	adds r0, 0x1
	str r0, [r4]
	adds r0, r4, 0
	bl FieldEffectScript_LoadFadedPalette
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldEffectScript_CallNative
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldEffectCmd_loadfadedpal_callnative

	thumb_func_start FieldEffectScript_ReadWord
FieldEffectScript_ReadWord: @ 8085BC8
	ldr r2, [r0]
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	adds r0, r1
	bx lr
	thumb_func_end FieldEffectScript_ReadWord

	thumb_func_start FieldEffectScript_LoadTiles
FieldEffectScript_LoadTiles: @ 8085BE0
	push {r4,r5,lr}
	adds r4, r0, 0
	bl FieldEffectScript_ReadWord
	adds r5, r0, 0
	ldrh r0, [r5, 0x6]
	bl GetSpriteTileStartByTag
	lsls r0, 16
	ldr r1, _08085C0C
	cmp r0, r1
	bne _08085BFE
	adds r0, r5, 0
	bl LoadSpriteSheet
_08085BFE:
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085C0C: .4byte 0xffff0000
	thumb_func_end FieldEffectScript_LoadTiles

	thumb_func_start FieldEffectScript_LoadFadedPalette
FieldEffectScript_LoadFadedPalette: @ 8085C10
	push {r4,r5,lr}
	adds r5, r0, 0
	bl FieldEffectScript_ReadWord
	adds r4, r0, 0
	bl LoadSpritePalette
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	bl sub_807D78C
	ldr r0, [r5]
	adds r0, 0x4
	str r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_LoadFadedPalette

	thumb_func_start FieldEffectScript_LoadPalette
FieldEffectScript_LoadPalette: @ 8085C38
	push {r4,lr}
	adds r4, r0, 0
	bl FieldEffectScript_ReadWord
	bl LoadSpritePalette
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_LoadPalette

	thumb_func_start FieldEffectScript_CallNative
FieldEffectScript_CallNative: @ 8085C50
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldEffectScript_ReadWord
	bl _call_via_r0
	str r0, [r5]
	ldr r0, [r4]
	adds r0, 0x4
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectScript_CallNative

	thumb_func_start FieldEffectFreeGraphicsResources
FieldEffectFreeGraphicsResources: @ 8085C6C
	push {r4,r5,lr}
	adds r1, r0, 0
	adds r1, 0x40
	ldrh r5, [r1]
	ldrb r4, [r0, 0x5]
	lsrs r4, 4
	bl DestroySprite
	adds r0, r5, 0
	bl FieldEffectFreeTilesIfUnused
	adds r0, r4, 0
	bl FieldEffectFreePaletteIfUnused
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectFreeGraphicsResources

	thumb_func_start FieldEffectStop
FieldEffectStop: @ 8085C90
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	bl FieldEffectFreeGraphicsResources
	adds r0, r4, 0
	bl FieldEffectActiveListRemove
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectStop

	thumb_func_start FieldEffectFreeTilesIfUnused
FieldEffectFreeTilesIfUnused: @ 8085CA8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetSpriteTileTagByTileStart
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08085D04
	cmp r3, r0
	beq _08085CFC
	movs r2, 0
	ldr r5, _08085D08
_08085CC2:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r5
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08085CEC
	adds r0, r1, 0
	adds r0, 0x3F
	ldrb r0, [r0]
	lsls r0, 25
	cmp r0, 0
	bge _08085CEC
	adds r0, r1, 0
	adds r0, 0x40
	ldrh r0, [r0]
	cmp r4, r0
	beq _08085CFC
_08085CEC:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _08085CC2
	adds r0, r3, 0
	bl FreeSpriteTilesByTag
_08085CFC:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085D04: .4byte 0x0000ffff
_08085D08: .4byte gSprites
	thumb_func_end FieldEffectFreeTilesIfUnused

	thumb_func_start FieldEffectFreePaletteIfUnused
FieldEffectFreePaletteIfUnused: @ 8085D0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl GetSpritePaletteTagByPaletteNum
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08085D5C
	cmp r5, r0
	beq _08085D54
	movs r2, 0
	ldr r6, _08085D60
	adds r3, r4, 0
_08085D28:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r6
	adds r0, r1, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08085D44
	ldrb r0, [r1, 0x5]
	lsrs r0, 4
	cmp r0, r3
	beq _08085D54
_08085D44:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _08085D28
	adds r0, r5, 0
	bl FreeSpritePaletteByTag
_08085D54:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085D5C: .4byte 0x0000ffff
_08085D60: .4byte gSprites
	thumb_func_end FieldEffectFreePaletteIfUnused

	thumb_func_start FieldEffectActiveListClear
FieldEffectActiveListClear: @ 8085D64
	push {r4,lr}
	movs r2, 0
	ldr r4, _08085D84
	movs r3, 0xFF
_08085D6C:
	adds r0, r2, r4
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _08085D6C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085D84: .4byte 0x030006e0
	thumb_func_end FieldEffectActiveListClear

	thumb_func_start FieldEffectActiveListAdd
FieldEffectActiveListAdd: @ 8085D88
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _08085DA0
_08085D92:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, 0xFF
	bne _08085DA4
	strb r3, [r1]
	b _08085DAE
	.align 2, 0
_08085DA0: .4byte 0x030006e0
_08085DA4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _08085D92
_08085DAE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListAdd

	thumb_func_start FieldEffectActiveListRemove
FieldEffectActiveListRemove: @ 8085DB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _08085DD0
	movs r5, 0xFF
_08085DC0:
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, r3
	bne _08085DD4
	orrs r0, r5
	strb r0, [r1]
	b _08085DDE
	.align 2, 0
_08085DD0: .4byte 0x030006e0
_08085DD4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x1F
	bls _08085DC0
_08085DDE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldEffectActiveListRemove

	thumb_func_start FieldEffectActiveListContains
FieldEffectActiveListContains: @ 8085DE4
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	movs r1, 0
	ldr r3, _08085DFC
_08085DEE:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _08085E00
	movs r0, 0x1
	b _08085E0C
	.align 2, 0
_08085DFC: .4byte 0x030006e0
_08085E00:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08085DEE
	movs r0, 0
_08085E0C:
	pop {r1}
	bx r1
	thumb_func_end FieldEffectActiveListContains

	.align 2, 0 @ Don't pad with nop.
