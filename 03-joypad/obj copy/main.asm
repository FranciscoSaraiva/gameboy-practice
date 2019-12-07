;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _scroll_sprite
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _delay
	.globl _Character
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_Character::
	.ds 32
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;sprites.c:26: unsigned char Character[] =
	ld	hl, #_Character
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0001)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0002)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0003)
	ld	(hl), #0x6e
	ld	hl, #(_Character + 0x0004)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0005)
	ld	(hl), #0x4a
	ld	hl, #(_Character + 0x0006)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0007)
	ld	(hl), #0x42
	ld	hl, #(_Character + 0x0008)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x0009)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x000a)
	ld	(hl), #0x24
	ld	hl, #(_Character + 0x000b)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x000c)
	ld	(hl), #0x24
	ld	hl, #(_Character + 0x000d)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x000e)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x000f)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x0010)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0011)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0012)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0013)
	ld	(hl), #0x76
	ld	hl, #(_Character + 0x0014)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0015)
	ld	(hl), #0x52
	ld	hl, #(_Character + 0x0016)
	ld	(hl), #0x7e
	ld	hl, #(_Character + 0x0017)
	ld	(hl), #0x42
	ld	hl, #(_Character + 0x0018)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x0019)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x001a)
	ld	(hl), #0x24
	ld	hl, #(_Character + 0x001b)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x001c)
	ld	(hl), #0x24
	ld	hl, #(_Character + 0x001d)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x001e)
	ld	(hl), #0x3c
	ld	hl, #(_Character + 0x001f)
	ld	(hl), #0x3c
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:5: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:7: UINT8 currentspriteindex = 0;
	ld	b, #0x00
;main.c:8: set_sprite_data(0, 2, Character);
	push	bc
	ld	hl, #_Character
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	pop	bc
;main.c:9: set_sprite_tile(0, 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
	pop	bc
;main.c:10: move_sprite(0, 88, 78);
	push	bc
	ld	a, #0x4e
	push	af
	inc	sp
	ld	a, #0x58
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
	pop	bc
;main.c:12: SHOW_SPRITES; //display sprites
	ld	hl, #0xff40
	ld	a, (hl)
	set	1, a
	ld	hl, #0xff40
	ld	(hl), a
;main.c:14: while (1)
00105$:
;main.c:16: if (currentspriteindex == 0)
	ld	a, b
	or	a, a
	jr	NZ,00102$
;main.c:18: currentspriteindex = 1;
	ld	b, #0x01
	jr	00103$
00102$:
;main.c:22: currentspriteindex = 0;
	ld	b, #0x00
00103$:
;main.c:24: set_sprite_tile(0, currentspriteindex);
	push	bc
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
	pop	bc
;main.c:25: delay(1000);
	push	bc
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
	pop	bc
;main.c:26: scroll_sprite(0, 10, 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x0a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
	pop	bc
	jp	00105$
;main.c:28: }
	ret
	.area _CODE
	.area _CABS (ABS)
