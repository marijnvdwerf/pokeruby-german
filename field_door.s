	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start CopyDoorTilesToVram
CopyDoorTilesToVram: @ 80586B8
	push {lr}
	ldr r1, _080586C8
	movs r2, 0x40
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_080586C8: .4byte 0x06007f00
	thumb_func_end CopyDoorTilesToVram

	thumb_func_start door_build_blockdef
door_build_blockdef: @ 80586CC
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r1, r6, 0
_080586D8:
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r3, r0, 16
	adds r2, 0x1
	adds r0, r5, r4
	orrs r3, r0
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _080586D8
	cmp r4, 0x7
	bgt _08058706
	lsls r0, r4, 1
	adds r1, r0, r6
_080586F6:
	ldrb r0, [r2]
	lsls r3, r0, 12
	adds r2, 0x1
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x7
	ble _080586F6
_08058706:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end door_build_blockdef

	thumb_func_start DrawCurrentDoorAnimFrame
DrawCurrentDoorAnimFrame: @ 805870C
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	movs r1, 0xFE
	lsls r1, 2
	mov r0, sp
	bl door_build_blockdef
	subs r1, r6, 0x1
	adds r0, r5, 0
	mov r2, sp
	bl DrawDoorMetatileAt
	movs r1, 0xFF
	lsls r1, 2
	adds r4, 0x4
	mov r0, sp
	adds r2, r4, 0
	bl door_build_blockdef
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl DrawDoorMetatileAt
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end DrawCurrentDoorAnimFrame

	thumb_func_start DrawClosedDoorTiles
DrawClosedDoorTiles: @ 805874C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	subs r1, r5, 0x1
	bl CurrentMapDrawMetatileAt
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DrawClosedDoorTiles

	thumb_func_start DrawDoor
DrawDoor: @ 8058768
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	ldrh r1, [r4, 0x2]
	ldr r0, _08058784
	cmp r1, r0
	bne _08058788
	adds r0, r6, 0
	adds r1, r7, 0
	bl DrawClosedDoorTiles
	b _0805879C
	.align 2, 0
_08058784: .4byte 0x0000ffff
_08058788:
	ldrh r1, [r4, 0x2]
	ldr r0, [r5, 0x4]
	adds r0, r1
	bl CopyDoorTilesToVram
	ldr r2, [r5, 0x8]
	adds r0, r6, 0
	adds r1, r7, 0
	bl DrawCurrentDoorAnimFrame
_0805879C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end DrawDoor

	thumb_func_start sub_8058464
sub_8058464: @ 80587A4
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _080587CA
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r1, 2
	adds r1, r5, r1
	movs r0, 0xC
	ldrsh r2, [r4, r0]
	movs r0, 0xE
	ldrsh r3, [r4, r0]
	adds r0, r6, 0
	bl DrawDoor
_080587CA:
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r1, r0
	bne _080587F8
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080587FE
	movs r0, 0
	b _08058800
_080587F8:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
_080587FE:
	movs r0, 0x1
_08058800:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8058464

	thumb_func_start Task_AnimateDoor
Task_AnimateDoor: @ 8058808
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	ldr r0, _0805883C
	adds r2, r0
	ldrh r1, [r2]
	lsls r1, 16
	ldrh r0, [r2, 0x2]
	orrs r1, r0
	ldrh r0, [r2, 0x4]
	lsls r0, 16
	ldrh r3, [r2, 0x6]
	orrs r0, r3
	bl sub_8058464
	cmp r0, 0
	bne _08058836
	adds r0, r4, 0
	bl DestroyTask
_08058836:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805883C: .4byte 0x03004b38
	thumb_func_end Task_AnimateDoor

	thumb_func_start GetLastDoorFrame
GetLastDoorFrame: @ 8058840
	push {lr}
	adds r1, r0, 0
	b _08058848
_08058846:
	adds r1, 0x4
_08058848:
	ldrb r0, [r1]
	cmp r0, 0
	bne _08058846
	subs r0, r1, 0x4
	pop {r1}
	bx r1
	thumb_func_end GetLastDoorFrame

	thumb_func_start GetDoorGraphics
GetDoorGraphics: @ 8058854
	push {lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	b _0805886A
_0805885E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _08058868
	adds r0, r2, 0
	b _08058872
_08058868:
	adds r2, 0xC
_0805886A:
	ldr r0, [r2, 0x4]
	cmp r0, 0
	bne _0805885E
	movs r0, 0
_08058872:
	pop {r1}
	bx r1
	thumb_func_end GetDoorGraphics

	thumb_func_start StartDoorAnimationTask
StartDoorAnimationTask: @ 8058878
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	mov r8, r3
	ldr r4, _080588C4
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080588CC
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _080588C8
	adds r1, r2
	strh r7, [r1, 0xC]
	mov r2, r8
	strh r2, [r1, 0xE]
	strh r5, [r1, 0x2]
	lsrs r2, r5, 16
	strh r2, [r1]
	strh r6, [r1, 0x6]
	lsrs r2, r6, 16
	strh r2, [r1, 0x4]
	lsls r0, 24
	asrs r0, 24
	b _080588D0
	.align 2, 0
_080588C4: .4byte Task_AnimateDoor
_080588C8: .4byte 0x03004b38
_080588CC:
	movs r0, 0x1
	negs r0, r0
_080588D0:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end StartDoorAnimationTask

	thumb_func_start DrawClosedDoor
DrawClosedDoor: @ 80588DC
	push {lr}
	adds r0, r1, 0
	adds r1, r2, 0
	bl DrawClosedDoorTiles
	pop {r0}
	bx r0
	thumb_func_end DrawClosedDoor

	thumb_func_start DrawOpenedDoor
DrawOpenedDoor: @ 80588EC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl GetDoorGraphics
	adds r4, r0, 0
	cmp r4, 0
	beq _08058922
	ldr r1, _08058928
	adds r0, r1, 0
	bl GetLastDoorFrame
	adds r1, r0, 0
	adds r0, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl DrawDoor
_08058922:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058928: .4byte gDoorOpenAnimFrames
	thumb_func_end DrawOpenedDoor

	thumb_func_start StartDoorOpenAnimation
StartDoorOpenAnimation: @ 805892C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl GetDoorGraphics
	cmp r0, 0
	beq _08058960
	ldr r1, _0805895C
	adds r2, r5, 0
	adds r3, r6, 0
	bl StartDoorAnimationTask
	lsls r0, 24
	asrs r0, 24
	b _08058964
	.align 2, 0
_0805895C: .4byte gDoorOpenAnimFrames
_08058960:
	movs r0, 0x1
	negs r0, r0
_08058964:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StartDoorOpenAnimation

	thumb_func_start StartDoorCloseAnimation
StartDoorCloseAnimation: @ 805896C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl GetDoorGraphics
	cmp r0, 0
	beq _080589A0
	ldr r1, _0805899C
	adds r2, r5, 0
	adds r3, r6, 0
	bl StartDoorAnimationTask
	lsls r0, 24
	asrs r0, 24
	b _080589A4
	.align 2, 0
_0805899C: .4byte gDoorCloseAnimFrames
_080589A0:
	movs r0, 0x1
	negs r0, r0
_080589A4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end StartDoorCloseAnimation

	thumb_func_start cur_mapdata_get_door_x2_at
cur_mapdata_get_door_x2_at: @ 80589AC
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl GetDoorGraphics
	cmp r0, 0
	beq _080589D0
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	b _080589D4
_080589D0:
	movs r0, 0x1
	negs r0, r0
_080589D4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_get_door_x2_at

	thumb_func_start unref_sub_805869C
unref_sub_805869C: @ 80589DC
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080589F0
	adds r1, r3, 0
	bl StartDoorOpenAnimation
	pop {r0}
	bx r0
	.align 2, 0
_080589F0: .4byte gDoorAnimGraphicsTable
	thumb_func_end unref_sub_805869C

	thumb_func_start FieldSetDoorOpened
FieldSetDoorOpened: @ 80589F4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	cmp r0, 0
	beq _08058A16
	ldr r0, _08058A1C
	adds r1, r4, 0
	adds r2, r5, 0
	bl DrawOpenedDoor
_08058A16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058A1C: .4byte gDoorAnimGraphicsTable
	thumb_func_end FieldSetDoorOpened

	thumb_func_start FieldSetDoorClosed
FieldSetDoorClosed: @ 8058A20
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	cmp r0, 0
	beq _08058A42
	ldr r0, _08058A48
	adds r1, r4, 0
	adds r2, r5, 0
	bl DrawClosedDoor
_08058A42:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058A48: .4byte gDoorAnimGraphicsTable
	thumb_func_end FieldSetDoorClosed

	thumb_func_start FieldAnimateDoorClose
FieldAnimateDoorClose: @ 8058A4C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	cmp r0, 0
	beq _08058A78
	ldr r0, _08058A74
	adds r1, r4, 0
	adds r2, r5, 0
	bl StartDoorCloseAnimation
	lsls r0, 24
	asrs r0, 24
	b _08058A7C
	.align 2, 0
_08058A74: .4byte gDoorAnimGraphicsTable
_08058A78:
	movs r0, 0x1
	negs r0, r0
_08058A7C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldAnimateDoorClose

	thumb_func_start FieldAnimateDoorOpen
FieldAnimateDoorOpen: @ 8058A84
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsDoor
	lsls r0, 24
	cmp r0, 0
	beq _08058AB0
	ldr r0, _08058AAC
	adds r1, r4, 0
	adds r2, r5, 0
	bl StartDoorOpenAnimation
	lsls r0, 24
	asrs r0, 24
	b _08058AB4
	.align 2, 0
_08058AAC: .4byte gDoorAnimGraphicsTable
_08058AB0:
	movs r0, 0x1
	negs r0, r0
_08058AB4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldAnimateDoorOpen

	thumb_func_start FieldIsDoorAnimationRunning
FieldIsDoorAnimationRunning: @ 8058ABC
	push {lr}
	ldr r0, _08058ACC
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058ACC: .4byte Task_AnimateDoor
	thumb_func_end FieldIsDoorAnimationRunning

	thumb_func_start sub_8058790
sub_8058790: @ 8058AD0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _08058AE8
	adds r1, r3, 0
	bl cur_mapdata_get_door_x2_at
	lsls r0, 24
	cmp r0, 0
	beq _08058AEC
	movs r0, 0x12
	b _08058AEE
	.align 2, 0
_08058AE8: .4byte gDoorAnimGraphicsTable
_08058AEC:
	movs r0, 0x8
_08058AEE:
	pop {r1}
	bx r1
	thumb_func_end sub_8058790

	.align 2, 0 @ Don't pad with nop.
