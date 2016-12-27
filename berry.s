	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start unref_sub_80B4884
unref_sub_80B4884: @ 80B49D4
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _080B49F0
	ldr r2, _080B49F4
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080B49F0: .4byte 0x02028894
_080B49F4: .4byte 0x01000298
	thumb_func_end unref_sub_80B4884

	thumb_func_start sub_80B48A8
sub_80B48A8: @ 80B49F8
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r3, _080B4A30
	movs r2, 0
	ldr r6, _080B4A34
	ldr r0, _080B4A38
	adds r4, r3, r0
_080B4A06:
	adds r0, r3, r2
	adds r1, r5, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, r6
	bls _080B4A06
	ldr r2, _080B4A3C
	adds r1, r4, r2
	ldr r2, _080B4A40
	adds r0, r4, r2
	str r0, [r1]
	ldr r0, _080B4A44
	adds r1, r4, r0
	adds r2, 0x2D
	adds r0, r4, r2
	str r0, [r1]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B4A30: .4byte 0x02028894
_080B4A34: .4byte 0x0000052f
_080B4A38: .4byte 0xffffcea0
_080B4A3C: .4byte 0x0000316c
_080B4A40: .4byte 0x0000361c
_080B4A44: .4byte 0x00003170
	thumb_func_end sub_80B48A8

	thumb_func_start sub_80B48F8
sub_80B48F8: @ 80B4A48
	push {r4-r7,lr}
	ldr r3, _080B4A84
	ldr r1, _080B4A88
	adds r4, r3, r1
	ldr r6, [r4]
	adds r1, 0x4
	adds r2, r3, r1
	ldr r7, [r2]
	movs r1, 0
	str r1, [r4]
	str r1, [r2]
	adds r4, r0, 0
	movs r2, 0
	ldr r5, _080B4A8C
_080B4A64:
	adds r0, r4, r1
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, r5
	bls _080B4A64
	ldr r1, _080B4A88
	adds r0, r3, r1
	str r6, [r0]
	adds r1, 0x4
	adds r0, r3, r1
	str r7, [r0]
	adds r0, r2, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B4A84: .4byte gSaveBlock1
_080B4A88: .4byte 0x0000316c
_080B4A8C: .4byte 0x0000052b
	thumb_func_end sub_80B48F8

	thumb_func_start sub_80B4940
sub_80B4940: @ 80B4A90
	push {r4,lr}
	ldr r4, _080B4AC0
	ldr r1, _080B4AC4
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B4AD4
	ldr r2, _080B4AC8
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, 0
	beq _080B4AD4
	ldr r1, _080B4ACC
	adds r0, r4, r1
	bl sub_80B48F8
	ldr r2, _080B4AD0
	adds r1, r4, r2
	ldr r1, [r1]
	cmp r0, r1
	bne _080B4AD4
	movs r0, 0x1
	b _080B4AD6
	.align 2, 0
_080B4AC0: .4byte gSaveBlock1
_080B4AC4: .4byte 0x00003174
_080B4AC8: .4byte 0x0000316a
_080B4ACC: .4byte 0x00003160
_080B4AD0: .4byte 0x0000368c
_080B4AD4:
	movs r0, 0
_080B4AD6:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80B4940

	thumb_func_start GetBerryInfo
GetBerryInfo: @ 80B4ADC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x2B
	bne _080B4AF8
	bl sub_80B4940
	cmp r0, 0
	beq _080B4AF8
	ldr r0, _080B4AF4
	b _080B4B0E
	.align 2, 0
_080B4AF4: .4byte 0x02028894
_080B4AF8:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2A
	bls _080B4B04
	movs r4, 0x1
_080B4B04:
	lsls r0, r4, 3
	subs r0, r4
	lsls r0, 2
	ldr r1, _080B4B14
	adds r0, r1
_080B4B0E:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B4B14: .4byte 0x083d92b0
	thumb_func_end GetBerryInfo

	thumb_func_start GetBerryTreeInfo
GetBerryTreeInfo: @ 80B4B18
	lsls r0, 24
	lsrs r0, 21
	ldr r1, _080B4B24
	adds r0, r1
	bx lr
	.align 2, 0
_080B4B24: .4byte 0x02026d3c
	thumb_func_end GetBerryTreeInfo

	thumb_func_start FieldObjectInteractionWaterBerryTree
FieldObjectInteractionWaterBerryTree: @ 80B4B28
	push {lr}
	ldr r0, _080B4B50
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryTreeInfo
	adds r2, r0, 0
	ldrb r0, [r2, 0x1]
	lsls r0, 25
	lsrs r0, 25
	cmp r0, 0x2
	beq _080B4B64
	cmp r0, 0x2
	bgt _080B4B54
	cmp r0, 0x1
	beq _080B4B5E
	b _080B4B7A
	.align 2, 0
_080B4B50: .4byte gSelectedMapObject
_080B4B54:
	cmp r0, 0x3
	beq _080B4B6A
	cmp r0, 0x4
	beq _080B4B70
	b _080B4B7A
_080B4B5E:
	ldrb r0, [r2, 0x5]
	movs r1, 0x10
	b _080B4B74
_080B4B64:
	ldrb r0, [r2, 0x5]
	movs r1, 0x20
	b _080B4B74
_080B4B6A:
	ldrb r0, [r2, 0x5]
	movs r1, 0x40
	b _080B4B74
_080B4B70:
	ldrb r0, [r2, 0x5]
	movs r1, 0x80
_080B4B74:
	orrs r0, r1
	strb r0, [r2, 0x5]
	b _080B4B7E
_080B4B7A:
	movs r0, 0
	b _080B4B80
_080B4B7E:
	movs r0, 0x1
_080B4B80:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectInteractionWaterBerryTree

	thumb_func_start IsPlayerFacingPlantedBerryTree
IsPlayerFacingPlantedBerryTree: @ 80B4B84
	push {lr}
	bl GetFieldObjectScriptPointerForComparison
	ldr r1, _080B4BAC
	cmp r0, r1
	bne _080B4BB4
	ldr r0, _080B4BB0
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	bl GetStageByBerryTreeId
	lsls r0, 24
	cmp r0, 0
	bne _080B4BB4
	movs r0, 0x1
	b _080B4BB6
	.align 2, 0
_080B4BAC: .4byte BerryTreeScript
_080B4BB0: .4byte gSelectedMapObject
_080B4BB4:
	movs r0, 0
_080B4BB6:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerFacingPlantedBerryTree

	thumb_func_start WaterBerryTree
WaterBerryTree: @ 80B4BBC
	push {lr}
	bl GetFieldObjectScriptPointerForComparison
	ldr r1, _080B4BD4
	cmp r0, r1
	bne _080B4BD8
	bl FieldObjectInteractionWaterBerryTree
	lsls r0, 24
	lsrs r0, 24
	b _080B4BDA
	.align 2, 0
_080B4BD4: .4byte BerryTreeScript
_080B4BD8:
	movs r0, 0
_080B4BDA:
	pop {r1}
	bx r1
	thumb_func_end WaterBerryTree

	thumb_func_start sub_80B4A90
sub_80B4A90: @ 80B4BE0
	push {r4,lr}
	ldr r1, _080B4C04
	ldr r0, _080B4C08
	ldr r3, [r0]
	ldr r4, [r0, 0x4]
	movs r2, 0x7F
	movs r0, 0xD0
	lsls r0, 5
	adds r1, r0
_080B4BF2:
	str r3, [r1]
	str r4, [r1, 0x4]
	subs r1, 0x8
	subs r2, 0x1
	cmp r2, 0
	bge _080B4BF2
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B4C04: .4byte gSaveBlock1
_080B4C08: .4byte gUnknown_083CD780
	thumb_func_end sub_80B4A90

	thumb_func_start BerryTreeGrow
BerryTreeGrow: @ 80B4C0C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r1, [r4, 0x1]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080B4C1E
_080B4C1A:
	movs r0, 0
	b _080B4CAA
_080B4C1E:
	lsls r0, r1, 25
	lsrs r0, 25
	cmp r0, 0x5
	bhi _080B4CA8
	lsls r0, 2
	ldr r1, _080B4C30
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080B4C30: .4byte _080B4C34
	.align 2, 0
_080B4C34:
	.4byte _080B4C1A
	.4byte _080B4C54
	.4byte _080B4C54
	.4byte _080B4C54
	.4byte _080B4C4C
	.4byte _080B4C6C
_080B4C4C:
	adds r0, r4, 0
	bl CalcBerryYield
	strb r0, [r4, 0x4]
_080B4C54:
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 25
	lsrs r1, 25
	adds r1, 0x1
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	b _080B4CA8
_080B4C6C:
	ldrb r0, [r4, 0x5]
	movs r1, 0x11
	negs r1, r1
	ands r1, r0
	movs r0, 0x21
	negs r0, r0
	ands r1, r0
	subs r0, 0x20
	ands r1, r0
	movs r0, 0x7F
	ands r1, r0
	movs r0, 0
	strb r0, [r4, 0x4]
	ldrb r2, [r4, 0x1]
	subs r0, 0x80
	ands r0, r2
	movs r2, 0x2
	orrs r0, r2
	strb r0, [r4, 0x1]
	adds r1, 0x1
	movs r0, 0xF
	ands r1, r0
	strb r1, [r4, 0x5]
	cmp r1, 0xA
	bne _080B4CA8
	ldr r0, _080B4CB0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
_080B4CA8:
	movs r0, 0x1
_080B4CAA:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B4CB0: .4byte gUnknown_083CD780
	thumb_func_end BerryTreeGrow

	thumb_func_start BerryTreeTimeUpdate
BerryTreeTimeUpdate: @ 80B4CB4
	push {r4-r7,lr}
	adds r6, r0, 0
	movs r2, 0
_080B4CBA:
	lsls r0, r2, 3
	ldr r1, _080B4CFC
	adds r4, r0, r1
	ldrb r0, [r4]
	adds r7, r2, 0x1
	cmp r0, 0
	beq _080B4D48
	ldrb r1, [r4, 0x1]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0
	beq _080B4D48
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _080B4D48
	ldrb r0, [r4]
	bl GetStageDurationByBerryType
	lsls r0, 16
	lsrs r0, 16
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 3
	subs r1, r0
	cmp r6, r1
	blt _080B4D04
	ldr r0, _080B4D00
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r4]
	str r1, [r4, 0x4]
	b _080B4D48
	.align 2, 0
_080B4CFC: .4byte 0x02026d3c
_080B4D00: .4byte gUnknown_083CD780
_080B4D04:
	adds r5, r6, 0
	cmp r5, 0
	beq _080B4D48
	ldrh r1, [r4, 0x2]
	cmp r1, r5
	ble _080B4D14
	subs r0, r1, r5
	b _080B4D46
_080B4D14:
	subs r5, r1
	ldrb r0, [r4]
	bl GetStageDurationByBerryType
	strh r0, [r4, 0x2]
	adds r0, r4, 0
	bl BerryTreeGrow
	cmp r0, 0
	beq _080B4D48
	ldrb r1, [r4, 0x1]
	movs r0, 0x7F
	ands r0, r1
	cmp r0, 0x5
	bne _080B4D38
	ldrh r0, [r4, 0x2]
	lsls r0, 2
	strh r0, [r4, 0x2]
_080B4D38:
	cmp r5, 0
	beq _080B4D48
	ldrh r0, [r4, 0x2]
	adds r1, r0, 0
	cmp r0, r5
	ble _080B4D14
	subs r0, r5
_080B4D46:
	strh r0, [r4, 0x2]
_080B4D48:
	adds r2, r7, 0
	cmp r2, 0x7F
	ble _080B4CBA
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end BerryTreeTimeUpdate

	thumb_func_start PlantBerryTree
PlantBerryTree: @ 80B4D54
	push {r4-r7,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r7, r3, 24
	bl GetBerryTreeInfo
	adds r6, r0, 0
	ldr r0, _080B4DB8
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r6]
	str r1, [r6, 0x4]
	strb r4, [r6]
	adds r0, r4, 0
	bl GetStageDurationByBerryType
	strh r0, [r6, 0x2]
	movs r1, 0x7F
	ands r1, r5
	ldrb r2, [r6, 0x1]
	movs r0, 0x80
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	cmp r5, 0x5
	bne _080B4DA6
	adds r0, r6, 0
	bl CalcBerryYield
	strb r0, [r6, 0x4]
	ldrh r0, [r6, 0x2]
	lsls r0, 2
	strh r0, [r6, 0x2]
_080B4DA6:
	cmp r7, 0
	bne _080B4DB2
	ldrb r0, [r6, 0x1]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r6, 0x1]
_080B4DB2:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4DB8: .4byte gUnknown_083CD780
	thumb_func_end PlantBerryTree

	thumb_func_start RemoveBerryTree
RemoveBerryTree: @ 80B4DBC
	lsls r0, 24
	ldr r1, _080B4DD4
	lsrs r0, 21
	ldr r2, _080B4DD8
	adds r1, r2
	adds r0, r1
	ldr r1, _080B4DDC
	ldr r2, [r1, 0x4]
	ldr r1, [r1]
	str r1, [r0]
	str r2, [r0, 0x4]
	bx lr
	.align 2, 0
_080B4DD4: .4byte gSaveBlock1
_080B4DD8: .4byte 0x00001608
_080B4DDC: .4byte gUnknown_083CD780
	thumb_func_end RemoveBerryTree

	thumb_func_start GetBerryTypeByBerryTreeId
GetBerryTypeByBerryTreeId: @ 80B4DE0
	lsls r0, 24
	ldr r1, _080B4DF0
	lsrs r0, 21
	adds r0, r1
	ldr r1, _080B4DF4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B4DF0: .4byte gSaveBlock1
_080B4DF4: .4byte 0x00001608
	thumb_func_end GetBerryTypeByBerryTreeId

	thumb_func_start GetStageByBerryTreeId
GetStageByBerryTreeId: @ 80B4DF8
	lsls r0, 24
	ldr r1, _080B4E0C
	lsrs r0, 21
	adds r0, r1
	ldr r1, _080B4E10
	adds r0, r1
	ldrb r0, [r0]
	lsls r0, 25
	lsrs r0, 25
	bx lr
	.align 2, 0
_080B4E0C: .4byte gSaveBlock1
_080B4E10: .4byte 0x00001609
	thumb_func_end GetStageByBerryTreeId

	thumb_func_start ItemIdToBerryType
ItemIdToBerryType: @ 80B4E14
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080B4E30
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0x2A
	bhi _080B4E34
	adds r0, r1, 0
	adds r0, 0x7C
	lsls r0, 24
	lsrs r0, 24
	b _080B4E36
	.align 2, 0
_080B4E30: .4byte 0xff7b0000
_080B4E34:
	movs r0, 0x1
_080B4E36:
	pop {r1}
	bx r1
	thumb_func_end ItemIdToBerryType

	thumb_func_start BerryTypeToItemId
BerryTypeToItemId: @ 80B4E3C
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _080B4E58
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0x2A
	bhi _080B4E5C
	adds r0, r1, 0
	adds r0, 0x84
	lsls r0, 16
	lsrs r0, 16
	b _080B4E5E
	.align 2, 0
_080B4E58: .4byte 0xffff0000
_080B4E5C:
	movs r0, 0x85
_080B4E5E:
	pop {r1}
	bx r1
	thumb_func_end BerryTypeToItemId

	thumb_func_start GetBerryNameByBerryType
GetBerryNameByBerryType: @ 80B4E64
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	adds r1, r0, 0
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0xFF
	strb r0, [r4, 0x6]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetBerryNameByBerryType

	thumb_func_start ResetBerryTreeSparkleFlag
ResetBerryTreeSparkleFlag: @ 80B4E84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryTreeInfo
	ldrb r2, [r0, 0x1]
	movs r1, 0x7F
	ands r1, r2
	strb r1, [r0, 0x1]
	pop {r0}
	bx r0
	thumb_func_end ResetBerryTreeSparkleFlag

	thumb_func_start BerryTreeGetNumStagesWatered
BerryTreeGetNumStagesWatered: @ 80B4E9C
	push {lr}
	ldrb r2, [r0, 0x5]
	movs r0, 0x10
	ands r0, r2
	lsls r0, 24
	lsrs r0, 24
	negs r0, r0
	lsrs r1, r0, 31
	movs r0, 0x20
	ands r0, r2
	cmp r0, 0
	beq _080B4EB6
	adds r1, 0x1
_080B4EB6:
	movs r0, 0x40
	ands r0, r2
	cmp r0, 0
	beq _080B4EC4
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_080B4EC4:
	movs r0, 0x80
	ands r0, r2
	cmp r0, 0
	beq _080B4ED2
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
_080B4ED2:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end BerryTreeGetNumStagesWatered

	thumb_func_start GetNumStagesWateredByBerryTreeId
GetNumStagesWateredByBerryTreeId: @ 80B4ED8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryTreeInfo
	bl BerryTreeGetNumStagesWatered
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetNumStagesWateredByBerryTreeId

	thumb_func_start CalcBerryYieldInternal
CalcBerryYieldInternal: @ 80B4EF0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	bne _080B4F06
	lsls r0, r6, 24
	b _080B4F3A
_080B4F06:
	subs r1, r0, r6
	subs r0, r2, 0x1
	adds r5, r1, 0
	muls r5, r0
	adds r4, r1, 0
	muls r4, r2
	bl Random
	lsls r0, 16
	lsrs r0, 16
	subs r4, r5
	adds r4, 0x1
	adds r1, r4, 0
	bl __umodsi3
	adds r5, r0
	movs r0, 0x3
	ands r0, r5
	cmp r0, 0x1
	bls _080B4F34
	lsrs r0, r5, 2
	adds r0, 0x1
	b _080B4F36
_080B4F34:
	lsrs r0, r5, 2
_080B4F36:
	adds r0, r6
	lsls r0, 24
_080B4F3A:
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CalcBerryYieldInternal

	thumb_func_start CalcBerryYield
CalcBerryYield: @ 80B4F44
	push {r4-r6,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	bl GetBerryInfo
	ldrb r6, [r0, 0xB]
	ldrb r5, [r0, 0xA]
	adds r0, r4, 0
	bl BerryTreeGetNumStagesWatered
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl CalcBerryYieldInternal
	lsls r0, 24
	lsrs r0, 24
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end CalcBerryYield

	thumb_func_start GetBerryCountByBerryTreeId
GetBerryCountByBerryTreeId: @ 80B4F70
	lsls r0, 24
	ldr r1, _080B4F80
	lsrs r0, 21
	adds r0, r1
	ldr r1, _080B4F84
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080B4F80: .4byte gSaveBlock1
_080B4F84: .4byte 0x0000160c
	thumb_func_end GetBerryCountByBerryTreeId

	thumb_func_start GetStageDurationByBerryType
GetStageDurationByBerryType: @ 80B4F88
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetBerryInfo
	ldrb r1, [r0, 0x14]
	lsls r0, r1, 4
	subs r0, r1
	lsls r0, 18
	lsrs r0, 16
	pop {r1}
	bx r1
	thumb_func_end GetStageDurationByBerryType

	thumb_func_start FieldObjectInteractionGetBerryTreeData
FieldObjectInteractionGetBerryTreeData: @ 80B4FA0
	push {r4-r6,lr}
	ldr r0, _080B4FDC
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r5, 0
	bl GetBerryTypeByBerryTreeId
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r5, 0
	bl ResetBerryTreeSparkleFlag
	ldr r0, _080B4FE0
	ldrb r0, [r0]
	ldr r2, _080B4FE4
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_8060234
	lsls r0, 24
	cmp r0, 0
	beq _080B4FEC
	ldr r1, _080B4FE8
	movs r0, 0xFF
	strh r0, [r1]
	b _080B4FFA
	.align 2, 0
_080B4FDC: .4byte gSelectedMapObject
_080B4FE0: .4byte gScriptLastTalked
_080B4FE4: .4byte gSaveBlock1
_080B4FE8: .4byte gSpecialVar_0x8004
_080B4FEC:
	ldr r4, _080B5024
	adds r0, r5, 0
	bl GetStageByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080B4FFA:
	ldr r4, _080B5028
	adds r0, r5, 0
	bl GetNumStagesWateredByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r4, _080B502C
	adds r0, r5, 0
	bl GetBerryCountByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	ldr r1, _080B5030
	adds r0, r6, 0
	bl GetBerryNameByBerryType
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5024: .4byte gSpecialVar_0x8004
_080B5028: .4byte gSpecialVar_0x8005
_080B502C: .4byte gSpecialVar_0x8006
_080B5030: .4byte gStringVar1
	thumb_func_end FieldObjectInteractionGetBerryTreeData

	thumb_func_start sub_80B4EE4
sub_80B4EE4: @ 80B5034
	push {lr}
	ldr r0, _080B5040
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080B5040: .4byte sub_80A68CC
	thumb_func_end sub_80B4EE4

	thumb_func_start FieldObjectInteractionPlantBerryTree
FieldObjectInteractionPlantBerryTree: @ 80B5044
	push {r4,lr}
	ldr r0, _080B5074
	ldrh r0, [r0]
	bl ItemIdToBerryType
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _080B5078
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl PlantBerryTree
	bl FieldObjectInteractionGetBerryTreeData
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B5074: .4byte gScriptItemId
_080B5078: .4byte gSelectedMapObject
	thumb_func_end FieldObjectInteractionPlantBerryTree

	thumb_func_start FieldObjectInteractionPickBerryTree
FieldObjectInteractionPickBerryTree: @ 80B507C
	push {r4-r6,lr}
	ldr r0, _080B50C0
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r5, 0
	bl GetBerryTypeByBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _080B50C4
	bl BerryTypeToItemId
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl GetBerryCountByBerryTreeId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl AddBagItem
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B50C0: .4byte gSelectedMapObject
_080B50C4: .4byte gSpecialVar_0x8004
	thumb_func_end FieldObjectInteractionPickBerryTree

	thumb_func_start FieldObjectInteractionRemoveBerryTree
FieldObjectInteractionRemoveBerryTree: @ 80B50C8
	push {lr}
	ldr r0, _080B50EC
	ldrb r0, [r0]
	bl FieldObjectGetBerryTreeId
	lsls r0, 24
	lsrs r0, 24
	bl RemoveBerryTree
	ldr r0, _080B50F0
	ldrb r0, [r0]
	ldr r2, _080B50F4
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_8060288
	pop {r0}
	bx r0
	.align 2, 0
_080B50EC: .4byte gSelectedMapObject
_080B50F0: .4byte gScriptLastTalked
_080B50F4: .4byte gSaveBlock1
	thumb_func_end FieldObjectInteractionRemoveBerryTree

	thumb_func_start PlayerHasBerries
PlayerHasBerries: @ 80B50F8
	push {lr}
	movs r0, 0x4
	bl IsBagPocketNonEmpty
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end PlayerHasBerries

	thumb_func_start ResetBerryTreeSparkleFlags
ResetBerryTreeSparkleFlags: @ 80B5108
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
	bl GetCameraCoords
	mov r0, sp
	ldrh r2, [r0]
	ldrh r1, [r4]
	adds r1, 0x3
	adds r3, r2, 0
	adds r3, 0xE
	lsls r1, 16
	movs r5, 0x80
	lsls r5, 12
	adds r0, r1, r5
	lsrs r0, 16
	mov r10, r0
	mov r5, sp
	lsls r2, 16
	asrs r2, 16
	mov r9, r2
	ldr r4, _080B51A0
	lsls r3, 16
	asrs r3, 16
	mov r8, r3
	asrs r7, r1, 16
	movs r6, 0xF
_080B514C:
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _080B5188
	ldrb r0, [r4, 0x6]
	cmp r0, 0xC
	bne _080B5188
	ldrh r0, [r4, 0x10]
	strh r0, [r5]
	ldrh r0, [r4, 0x12]
	mov r1, sp
	strh r0, [r1, 0x2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r9, r1
	bgt _080B5188
	cmp r1, r8
	bgt _080B5188
	lsls r0, 16
	asrs r1, r0, 16
	cmp r7, r1
	bgt _080B5188
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	cmp r1, r0
	bgt _080B5188
	ldrb r0, [r4, 0x1D]
	bl ResetBerryTreeSparkleFlag
_080B5188:
	adds r4, 0x24
	subs r6, 0x1
	cmp r6, 0
	bge _080B514C
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B51A0: .4byte gMapObjects
	thumb_func_end ResetBerryTreeSparkleFlags

	.align 2, 0 @ Don't pad with nop.
