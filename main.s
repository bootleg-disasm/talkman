sei							; Set interrupt disable flag
cld							; Clear decimal mode (2A03 does not have it due to MOS patent) flag
ldx #$FF					; Load 255 ($FF) into X register
; A=?? X=FF Y=?? SP=?? czidbvn
txs							; Transfer X to stack pointer
; A=?? X=FF Y=?? SP=FF czidbvn
lda #$00					; Load 0 ($00) into Accumulator
; A=00 X=FF Y=?? SP=FF czidbvn
sta $2000					; Store Accumulator into $2000
sta $2001					; Store Accumulator into $2001
BRANCH:
lda $2002					; Load the contents of $2002 into Accumulator
bpl BRANCH					; Branch back to BRANCH if negative flag clear
ldy #$02					; Load 2 ($02) into Y register
; A=00 X=FF Y=02 SP=FF czidbvn
sty $01						; Store Y register into $01
ldy #$00					; Load 0 ($00) into Y register
; A=00 X=FF Y=00 SP=FF czidbvn
sty $00						; Store Y register into $00
tya							; Transfer Y register to Accumulator (useless instruction)
; A=00 X=FF Y=00 SP=FF czidbvn
RAMACCSTORE:
sta ($00), y				; Store Accumulator indirectly into CPURAM $0000, using Y ($00) and operand ($00)
iny							; Increment Y register
; A=00 X=FF Y=01 SP=FF czidbvn
bne RAMACCSTORE			 ; Branch to RAMACCSTORE if not equal
dec $01						; Decrement CPURAM $0001
; A=00 X=FF Y=01 SP=FF czidbvn $0001=FF
bpl RAMACCSTORE			 ; Branch to RAMACCSTORE if positive (negative flag clear)
lda #$00					; Load 0 ($00) into Accumulator
; A=00 X=FF Y=01 SP=FF czidbvn
sta $10						; Store Accumulator into $0010
lda #$00					; Load 0 ($00) into Accumulator
; A=00 X=FF Y=01 SP=FF czidbvn
sta $8000					; Store Accumulator into $8000
lda #$1a					; Load 26 ($1A) into Accumulator
; A=1A X=FF Y=01 SP=FF czidbvn
sta $8001					; Store Accumulator into $8001
lda #$20					; Load 32 ($20) into Accumulator
; A=20 X=FF Y=01 SP=FF czidbvn
sta $2006					; Store Accumulator into $2006
lda #$00					; Load 0 ($00) into Accumulator
; A=00 X=FF Y=01 SP=FF czidbvn
sta $2006					; Store Accumulator into $2006
lda #$00					; Load 0 ($00) into Accumulator
; A=00 X=FF Y=01 SP=FF czidbvn
ldy #$00					; Load 0 ($00) into Y register
; A=00 X=FF Y=00 SP=FF czidbvn
ldx #$03					; Load 3 ($03) into X register
; A=00 X=03 Y=00 SP=FF czidbvn
LOOP:
sta $2007					; Store Accumulator into $2007
dey							; Decrement Y register
; A=00 X=03 Y=FF SP=FF czidbvn
bne LOOP					; Branch to LOOP if not equal
dex							; Decrement X register
; A=00 X=02 Y=FF SP=FF czidbvn
bpl LOOP					; Branch to LOOP if positive (negative flag clear)
ldx #$81					; Load 129 ($81) into X register
ldy #$76					; Load 118 ($76) into Y register
; A=00 X=81 Y=76 SP=FF czidbvn
jsr $80c1
lda #$00					; Load 0 ($00) into Accumulator
sta $2005					; Store Accumulator into $2005
sta $2005					; Store Accumulator into $2005
lda #$00					; Load 0 ($00) into Accumulator
sta $2000					; Store Accumulator into $2000
lda #$1E					; Load 30 ($1E) into Accumulator

asl a
asl a
asl a
asl a


dey
rts