sei ; Set interrupt disable flag
cld ; Clear decimal mode (2A03 does not have it due to MOS patent) flag
ldx #$ff ; Load 255 ($FF) into X register
txs			; Transfer X to stack pointer
lda #$00	; Load 0 ($00) into Accumulator
sta $2000	; Store (same as Load but does not affect flags) $2000 into Accumulator
sta $2001	; Store $2001 into Accumulator
lda $2002	; Load $2002 into Accumulator
bpl $801d	; Branch to $801D if negative flag clear
ldy #$02
sty $01
ldy #$00
tya
sta ($00), y
iny
bne $802b
dec $01
bpl $802b
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
dey
bne $8052
ldx #$81
ldy #$76
jsr $80c1
