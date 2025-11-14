sei ; Set interrupt disable flag
cld ; Clear decimal mode (2A03 does not have it due to MOS patent) flag
ldx #$FF	; Load 255 ($FF) into X register
txs			; Transfer X to stack pointer
lda #$00	; Load 0 ($00) into Accumulator
sta $2000	; Store Accumulator (same as Load but doesn't set flags) into $2000
sta $2001	; Store Accumulator into $2001
BRANCH:
lda $2002	; Load Accumulator into $2002
bpl BRANCH	; Branch back to BRANCH if negative flag clear
ldy #$02	; Load 2 ($02) into Y register
sty $01		; Store Y register into $01
ldy #$00	; Load 0 ($00) into Y register
tya			; Transfer Y register to Accumulator
RAMACCSTORE:
sta ($00), y; Store accumulator into CPURAM $0000
iny			; Increment Y register
bne RAMACCSTORE	; Branch to RAMACCSTORE if zero flag clear
dec $01			; Decrement CPURAM $0001
bpl RAMACCSTORE	; Branch to RAMACCSTORE if positive (negative flag clear)
lda #$00
sta $10
lda #$00
sta $8000
lda #$1a
sta $8001
lda #$20
sta $2006
lda #$00
sta $2006
lda #$00
ldy #$00
ldx #$03
sta $2007
dey				; Decrement the Y register
bne $8052
ldx #$81
ldy #$76
jsr $80c1
