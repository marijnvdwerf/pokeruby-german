	.include "constants/gba_constants.inc"
	.include "constants/species_constants.inc"
	.include "asm/macros.inc"

	.syntax unified

	.text

	thumb_func_start object_new_hidden_with_callback
object_new_hidden_with_callback: @ 80411D8
	push {r4-r6,lr}
	adds r6, r0, 0
	ldr r0, _0804120C @ =gSpriteTemplate_82087AC
	movs r1, 0xF8
	movs r2, 0xA8
	movs r3, 0xE
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08041210 @ =gSprites
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r3, r2, r5
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r4, 0x4
	orrs r1, r4
	strb r1, [r3]
	adds r5, 0x1C
	adds r2, r5
	str r6, [r2]
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804120C: .4byte gSpriteTemplate_82087AC
_08041210: .4byte gSprites
	thumb_func_end object_new_hidden_with_callback

	thumb_func_start StoreWordInTwoHalfwords
StoreWordInTwoHalfwords: @ 8041214
	strh r1, [r0]
	lsrs r1, 16
	strh r1, [r0, 0x2]
	bx lr
	thumb_func_end StoreWordInTwoHalfwords

	thumb_func_start LoadWordFromTwoHalfwords
LoadWordFromTwoHalfwords: @ 804121C
	ldrh r2, [r0]
	movs r3, 0x2
	ldrsh r0, [r0, r3]
	lsls r0, 16
	orrs r2, r0
	str r2, [r1]
	bx lr
	thumb_func_end LoadWordFromTwoHalfwords

	thumb_func_start sub_8040F08
sub_8040F08: @ 804122C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, 0x18]
	ldr r5, [sp, 0x1C]
	ldr r6, [sp, 0x20]
	ldr r7, [sp, 0x24]
	mov r8, r7
	str r1, [r0]
	str r2, [r0, 0x4]
	strh r3, [r0, 0x8]
	strh r4, [r0, 0xA]
	strh r5, [r0, 0xC]
	strh r6, [r0, 0xE]
	mov r1, r8
	strh r1, [r0, 0x10]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8040F08

	thumb_func_start sub_8040F34
sub_8040F34: @ 8041258
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x24
	mov r8, r0
	ldr r0, [sp, 0x38]
	ldr r4, [sp, 0x3C]
	ldr r5, [sp, 0x40]
	ldr r6, [sp, 0x44]
	lsls r6, 16
	lsrs r6, 16
	lsls r3, 16
	asrs r3, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	lsls r4, 16
	asrs r4, 16
	str r4, [sp, 0x4]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x8]
	str r6, [sp, 0xC]
	add r0, sp, 0x10
	bl sub_8040F08
	add r0, sp, 0x10
	mov r1, r8
	movs r2, 0x1
	bl BgAffineSet
	add sp, 0x24
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8040F34

	thumb_func_start sub_8040F80
sub_8040F80: @ 80412A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x3C
	str r2, [sp, 0x20]
	adds r4, r3, 0
	ldr r7, [sp, 0x5C]
	lsls r0, 24
	lsls r1, 24
	ldr r2, _0804132C @ =gUnknown_082087C4
	lsrs r1, 23
	lsrs r0, 21
	adds r1, r0
	adds r0, r2, 0x1
	adds r0, r1, r0
	ldrb r0, [r0]
	str r0, [sp, 0x24]
	adds r1, r2
	ldrb r1, [r1]
	str r1, [sp, 0x28]
	movs r1, 0
	cmp r1, r0
	bcc _080412D8
	b _0804145A
_080412D8:
	movs r0, 0x20
	ldr r2, [sp, 0x28]
	subs r0, r2
	lsls r0, 1
	str r0, [sp, 0x2C]
_080412E2:
	movs r2, 0
	adds r1, 0x1
	str r1, [sp, 0x34]
	ldr r3, [sp, 0x28]
	cmp r2, r3
	bcc _080412F0
	b _08041448
_080412F0:
	ldr r0, _08041330 @ =0x040000d4
	mov r8, r0
_080412F4:
	ldrh r1, [r4]
	ldr r0, _08041334 @ =0x000003ff
	ands r0, r1
	lsls r0, 5
	mov r12, r0
	movs r0, 0xC0
	lsls r0, 4
	ands r0, r1
	mov r3, sp
	strh r1, [r3, 0x38]
	cmp r0, 0
	bne _0804133C
	ldr r0, [sp, 0x20]
	add r0, r12
	mov r1, r8
	str r0, [r1]
	str r7, [r1, 0x4]
	ldr r3, _08041338 @ =0x84000008
	str r3, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r4, 0x2
	str r4, [sp, 0x30]
	adds r7, 0x20
	mov r10, r7
	adds r2, 0x1
	mov r9, r2
	b _08041436
	.align 2, 0
_0804132C: .4byte gUnknown_082087C4
_08041330: .4byte 0x040000d4
_08041334: .4byte 0x000003ff
_08041338: .4byte 0x84000008
_0804133C:
	movs r1, 0x80
	lsls r1, 4
	cmp r0, r1
	bne _0804138C
	movs r3, 0
	adds r4, 0x2
	str r4, [sp, 0x30]
	movs r0, 0x20
	adds r0, r7
	mov r10, r0
	adds r2, 0x1
	mov r9, r2
	ldr r4, _08041384 @ =0x040000d4
	ldr r6, _08041388 @ =0x84000001
	movs r5, 0x7
_0804135A:
	lsls r2, r3, 24
	asrs r2, 24
	subs r0, r5, r2
	lsls r0, 2
	add r0, r12
	ldr r1, [sp, 0x20]
	adds r0, r1, r0
	lsls r1, r2, 2
	adds r1, r7, r1
	str r0, [r4]
	str r1, [r4, 0x4]
	str r6, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r2, 0x1
	lsls r2, 24
	lsrs r3, r2, 24
	asrs r2, 24
	cmp r2, 0x7
	ble _0804135A
	b _08041436
	.align 2, 0
_08041384: .4byte 0x040000d4
_08041388: .4byte 0x84000001
_0804138C:
	movs r3, 0
	adds r4, 0x2
	str r4, [sp, 0x30]
	movs r0, 0x20
	adds r0, r7
	mov r10, r0
	adds r2, 0x1
	mov r9, r2
_0804139C:
	movs r2, 0
	lsls r4, r3, 24
	lsls r0, r4, 2
	lsrs r0, 24
	adds r6, r0, 0x3
	mov r1, r12
	adds r5, r1, r0
_080413AA:
	lsls r1, r2, 24
	asrs r1, 24
	subs r0, r6, r1
	mov r2, sp
	adds r3, r2, r0
	adds r0, r5, r1
	ldr r2, [sp, 0x20]
	adds r0, r2, r0
	ldrb r2, [r0]
	movs r0, 0xF
	ands r0, r2
	lsls r0, 4
	lsrs r2, 4
	orrs r0, r2
	strb r0, [r3]
	adds r1, 0x1
	lsls r1, 24
	lsrs r2, r1, 24
	asrs r1, 24
	cmp r1, 0x3
	ble _080413AA
	movs r3, 0x80
	lsls r3, 17
	adds r0, r4, r3
	lsrs r3, r0, 24
	asrs r0, 24
	cmp r0, 0x7
	ble _0804139C
	movs r0, 0x80
	lsls r0, 4
	mov r1, sp
	ldrh r1, [r1, 0x38]
	ands r0, r1
	cmp r0, 0
	beq _08041428
	movs r3, 0
	ldr r4, _08041420 @ =0x040000d4
	ldr r6, _08041424 @ =0x84000001
	movs r5, 0x7
_080413F8:
	lsls r1, r3, 24
	asrs r1, 24
	subs r0, r5, r1
	lsls r0, 2
	mov r3, sp
	adds r2, r3, r0
	lsls r0, r1, 2
	adds r0, r7, r0
	str r2, [r4]
	str r0, [r4, 0x4]
	str r6, [r4, 0x8]
	ldr r0, [r4, 0x8]
	adds r1, 0x1
	lsls r1, 24
	lsrs r3, r1, 24
	asrs r1, 24
	cmp r1, 0x7
	ble _080413F8
	b _08041436
	.align 2, 0
_08041420: .4byte 0x040000d4
_08041424: .4byte 0x84000001
_08041428:
	mov r0, sp
	mov r1, r8
	str r0, [r1]
	str r7, [r1, 0x4]
	ldr r2, _0804146C @ =0x84000008
	str r2, [r1, 0x8]
	ldr r0, [r1, 0x8]
_08041436:
	ldr r4, [sp, 0x30]
	mov r7, r10
	mov r3, r9
	lsls r0, r3, 24
	lsrs r2, r0, 24
	ldr r0, [sp, 0x28]
	cmp r2, r0
	bcs _08041448
	b _080412F4
_08041448:
	ldr r1, [sp, 0x2C]
	adds r4, r1
	ldr r2, [sp, 0x34]
	lsls r0, r2, 24
	lsrs r1, r0, 24
	ldr r3, [sp, 0x24]
	cmp r1, r3
	bcs _0804145A
	b _080412E2
_0804145A:
	add sp, 0x3C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804146C: .4byte 0x84000008
	thumb_func_end sub_8040F80

	thumb_func_start sub_804114C
sub_804114C: @ 8041470
	push {lr}
	adds r2, r0, 0
	movs r1, 0
	movs r3, 0x1
_08041478:
	adds r0, r2, 0
	ands r0, r3
	cmp r0, 0
	beq _08041484
	adds r0, r1, 0
	b _08041492
_08041484:
	lsrs r2, 1
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08041478
	movs r0, 0
_08041492:
	pop {r1}
	bx r1
	thumb_func_end sub_804114C

	thumb_func_start sub_8041174
sub_8041174: @ 8041498
	push {r4-r7,lr}
	adds r7, r0, 0
	adds r4, r1, 0
	ldr r2, _080414C8 @ =0x00001121
	movs r3, 0
	cmp r3, r4
	bge _080414E4
	movs r6, 0x1
	ldr r0, _080414CC @ =0x00008408
	adds r5, r0, 0
_080414AC:
	adds r0, r7, r3
	ldrb r0, [r0]
	eors r2, r0
	movs r1, 0
	adds r3, 0x1
_080414B6:
	adds r0, r2, 0
	ands r0, r6
	cmp r0, 0
	beq _080414D0
	lsrs r0, r2, 1
	eors r0, r5
	lsls r0, 16
	lsrs r2, r0, 16
	b _080414D2
	.align 2, 0
_080414C8: .4byte 0x00001121
_080414CC: .4byte 0x00008408
_080414D0:
	lsrs r2, 1
_080414D2:
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0x7
	bls _080414B6
	lsls r0, r3, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _080414AC
_080414E4:
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8041174

	thumb_func_start unref_sub_80411CC
unref_sub_80411CC: @ 80414F0
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r2, _0804152C @ =0x00001121
	movs r3, 0
	cmp r3, r4
	bge _0804151E
	ldr r6, _08041530 @ =gCrc16Table
_08041500:
	lsrs r1, r2, 8
	adds r0, r5, r3
	ldrb r0, [r0]
	eors r2, r0
	lsls r0, r2, 24
	lsrs r0, 23
	adds r0, r6
	ldrh r0, [r0]
	adds r2, r0, 0
	eors r2, r1
	adds r0, r3, 0x1
	lsls r0, 16
	lsrs r3, r0, 16
	cmp r3, r4
	blt _08041500
_0804151E:
	mvns r0, r2
	lsls r0, 16
	lsrs r0, 16
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804152C: .4byte 0x00001121
_08041530: .4byte gCrc16Table
	thumb_func_end unref_sub_80411CC

	.align 2, 0 @ Don't pad with nop.
