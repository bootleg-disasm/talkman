;--------sub start-------
	LDA #$00				;8001
	STA PpuControl_2000
	STA PpuMask_2001
	LDY #$00
	LDA PpuStatus_2002
	LDA $14
	STA PpuAddr_2006
	JSR $8049
	LDA #$00
	STA PpuAddr_2006
	JSR $8049
	LDA ($12),Y
	BPL $8038
	CMP #$FF
	BEQ $8048
	AND #$7F
	STA $08
	JSR $8049
	LDA ($12),Y
	STA PpuData_2007
	DEC $08
	BNE $802A
	BEQ $801B
	STA $08
	JSR $8049
	LDA ($12),Y
	STA PpuData_2007
	DEC $08
	BNE $803F
	BEQ $801B
	RTS						;8048
;------------------------
;--------sub start-------
	INC $12					;8049
	BNE $804F
	INC $13
	RTS						;804F
;------------------------
;--------sub start-------
	LDA #$00				;8050
	STA PpuControl_2000
	STA PpuMask_2001
	LDA #$0C
	STA $0410
	LDA #$00
	STA $A000
	LDA #$00
	STA $6A
	JSR $E7C6
	LDA #$01
	JSR $E7C6
	LDA #$02
	JSR $E7C6
	JSR $D303
	JSR $8087
	JSR $821C
	LDA #$00
	STA $51
	STA $4F
	STA $1E
	STA $20
	RTS						;8086
;------------------------
;--------sub start-------
	LDA $4B					;8087
	ASL A
	ASL A
	ASL A
	TAX
	LDA $80F0,X
	STA $A9
	LDA $80F1,X
	STA $AA
	LDA $80F2,X
	STA $52
	LDA $80F3,X
	STA $53
	LDA $80F4,X
	STA $54
	LDA $80F5,X
	STA $55
	LDA $8168,X
	STA $12
	LDA $8169,X
	STA $13
	LDA $816A,X
	STA $14
	JSR $8001
	LDA $4B
	ASL A
	ASL A
	ASL A
	TAX
	LDA $816C,X
	STA $12
	LDA $816D,X
	STA $13
	LDA $816E,X
	STA $14
	JSR $8001
	LDA #$A0
	STA $4A
	LDA $4B
	ASL A
	ASL A
	TAX
	LDA $81E0,X
	STA $0410
	LDA $81E1,X
	STA $50
	LDA $81E2,X
	STA $070D
	RTS						;80EF
;------------------------
;---unidentified block---
							;80F0
;------------------------	;821B
;--------sub start-------
	LDX #$20				;821C
	LDA #$3F
	STA PpuAddr_2006
	LDA #$00
	STA PpuAddr_2006
	LDA #$0E
	STA PpuData_2007
	DEX
	BNE $822A
	RTS						;8230
;------------------------
;--------sub start-------
	LDA $06					;8231
	AND #$0F
	BNE $823A
	LDA #$FF
	RTS						;8239
;------------------------
	TAX						;823A
	LDA $05
	ASL A
	ASL A
	CLC
	ADC $8247,X
	TAY
	LDA ($12),Y
	RTS						;8246
;------------------------	;8247
;---unidentified block---

;------------------------	;829E
;--------sub start-------
	LDA $50					;829F
	ASL A
	TAY
	LDA $F428,Y
	STA $12
	LDA $F429,Y
	STA $13
	LDA $51
	ASL A
	TAY
	LDA $8306,Y
	STA $14
	LDA $8307,Y
	STA $15
	LDA $44
	BNE $82FC
	LDA $25
	AND #$03
	BNE $82FC
	LDX $4F
	LDA $82FD,X
	STA $05
	LDY #$00
	LDA ($14),Y
	BPL $82D7
	LDA ($12),Y
	JMP $82E0
	LDA ($12),Y
	SEC
	SBC $05
	BPL $82E0
	LDA #$FF
	STA $0600,Y
	INY
	CPY #$20
	BNE $82CE
	LDA #$3F
	STA $44
	LDA #$00
	STA $43
	STA $47
	LDA #$20
	STA $46
	LDA #$01
	STA $45
	INC $4F
	RTS						;82FC
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $06E2
	BEQ $9D00
	LDA $06B7
	BEQ $9D00
	LDX #$06
	STX $52
	INX
	STX $53
	LDA #$20
	STA $13
	LDA #$8D
	STA $12
	JSR $9D01
	LDA #$21
	STA $13
	LDA #$C1
	STA $12
	JSR $9D01
	RTS
;------------------------
;--------sub start-------
	LDX #$00
	STX $07
	LDY #$00
	LDA $13
	STA PpuAddr_2006
	LDA $12
	STA PpuAddr_2006
	LDA $F83E,X
	AND #$7F
	STA PpuData_2007
	INX
	INY
	CPY #$12
	BCC $9D11
	CLC
	LDA $12
	ADC #$20
	STA $12
	BCC $9D2A
	INC $13
	INC $07
	LDA $07
	CMP #$07
	BCC $9D05
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $59
	AND #$80
	STA $05
	LDA $59
	AND #$0F
	TAX
	LDA $F928,X
	ORA $05
	STA $7D
	LDA $5A
	AND #$80
	ORA #$80
	STA $05
	LDA $5A
	AND #$0F
	TAX
	LDA $F928,X
	ORA $05
	STA $7E
	RTS
;------------------------
;--------sub start-------
	LDA #$3F
	STA $44
	LDA #$00
	STA $43
	LDA #$20
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	LDX #$20
	LDA #$0E
	STA $0600,X
	DEX
	BPL $9DB7
	RTS
;------------------------
;--------sub start-------
	LDA #$21
	STA PpuAddr_2006
	LDA #$80
	STA PpuAddr_2006
	LDX #$00
	TXA
	STA PpuData_2007
	INX
	BNE $9DCB
	STA PpuData_2007
	INX
	BNE $9DD1
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$01
	STA $0681
	LDA #$00
	STA $5E
	STA $57
	LDA #$01
	STA $042C
	INC $49
	LDA #$00
	STA $56
	STA $06DD
	LDA #$02
	STA $6B
	LDA #$02
	STA $4E
	LDA #$80
	STA $041C
	LDA #$00
	STA $06B5
	STA $06B7
	STA $06D2
	STA $0467
	LDA #$D8
	STA $06B6
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA $48
	BNE $A00A
	LDA $49
	CMP #$2A
	BCS $A011
	LDA #$00
	STA $68
	JSR $D303
	LDA $48
	JSR $E777
;---unidentified block---

;------------------------
	LDA $49
	CMP #$05
	BCC $A032
	LDA #$01
	STA $06EC
	LDX #$00
	JSR $F974
	LDA $49
	CMP #$2B
	BCC $A047
	CMP #$34
	BCS $A047
	LDA $2D
	BEQ $A047
	LDA #$00
	STA $89
	JMP $A057
	LDA $49
	CMP #$08
	BCC $A05B
	LDA $49
	CMP #$1C
	BCS $A05B
	LDA $2D
	BEQ $A05B
	LDA #$03
	STA $49
	LDA $49
	JSR $E777
;---unidentified block---

;------------------------
	LDA $25
	CMP $4C
	BNE $A194
	RTS
;------------------------
	STA $4C
	JSR $BEAC
	BNE $A19F
	LDA #$2A
	STA $49
	RTS
;------------------------
	LDA #$09
	STA $4B
	JSR $8050
	JSR $9CD9
	LDA #$0C
	STA $0410
	LDA #$00
	STA $4F
	STA $5F
	STA $60
	STA $89
	LDA #$5C
	STA $041C
	LDA #$00
	STA $06C2
	STA $06C3
	STA $06CC
	STA $06CD
	LDA #$AE
	STA $06BA
	LDA #$20
	STA $06BB
	LDA #$10
	STA $06C0
	LDA #$05
	STA $06C1
	JSR $AA98
	JSR $9DBE
	LDA #$D8
	STA $20
	JSR $A5F4
	INC $49
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$02
	STA $4E
	LDA $59
	AND #$03
	TAX
	LDA $A1FC,X
	STA $7D
	STA $7E
	JSR $F9AC
	JSR $ADFD
	LDA $06CD
	BEQ $A228
	LDA #$00
	STA $89
	INC $49
	INC $59
	LDA $59
	STA $06CC
	RTS
;------------------------
	LDA $59
	CMP #$03
	BCC $A236
	LDA #$00
	STA $59
	INC $49
	RTS
;------------------------
	LDA $5F
	JSR $E777
;---unidentified block---

;------------------------
	JSR $AA06
	LDA #$2C
	STA $49
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$04
	STA $046B
	LDA #$07
	STA $040A
	LDA #$05
	STA $4F
	LDA #$00
	STA $A000
	INC $49
	RTS
;------------------------
	JMP $F044
	LDA #$02
	STA $046B
	LDA #$07
	STA $040A
	LDA #$00
	STA $A000
	INC $49
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$08
	STA $4B
	JSR $8050
	INC $49
	LDA #$04
	STA $4E
	LDA #$80
	STA $041C
	LDA #$00
	STA $0467
	LDA #$01
	STA $A000
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	RTS
;------------------------
	LDA #$00
	STA $43
	LDA #$3F
	STA $44
	LDA #$10
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	LDA $25
	AND #$1F
	BNE $A2EE
	DEC $4E
	BPL $A2EE
	INC $49
	RTS
;------------------------
	LDA $25
	AND #$08
	BEQ $A2FA
	LDA #$00
	JSR $A300
	RTS
;------------------------
	LDA #$01
	JSR $A300
	RTS
;------------------------
;--------sub start-------
	ASL A
	TAX
	LDA $F7BA,X
	STA $12
	LDA $F7BB,X
	STA $13
	LDY #$00
	LDA ($12),Y
	STA $0600,Y
	INY
	CPY #$40
	BCC $A30E
	RTS
;------------------------
	LDA #$00
	STA $4B
	JSR $8050
	JSR $9E0D
	LDA #$01
	STA $06E2
	LDA #$01
	STA $06B7
	LDA #$01
	STA $A000
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	RTS
;------------------------
	LDA #$04
	STA $4B
	JSR $8050
	INC $49
	LDA #$90
	STA $041C
	LDA #$40
	STA $20
	LDA #$01
	STA $A000
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	RTS
;------------------------
	LDA #$00
	STA $06C2
	STA $06C3
	STA $06CD
	LDA #$07
	STA $06CC
	LDA #$26
	STA $06BA
	LDA #$28
	STA $06BB
	LDA #$13
	STA $06C0
	LDA #$08
	STA $06C1
	LDX #$1F
	LDA #$00
	STA $0600,X
	DEX
	BPL $A38B
	LDA #$C0
	STA $43
	LDA #$2B
	STA $44
	LDA #$20
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	INC $49
	RTS
;------------------------
	LDA $25
	AND #$07
	BNE $A3B4
	LDA $20
	BEQ $A3B4
	DEC $20
	LDA $25
	AND #$0F
	BNE $A3C5
	INC $06D1
	LDA $06D1
	AND #$0F
	STA $06D1
	LDX $06D1
	LDA $9DFD,X
	BNE $A3FA
	CLC
	LDA $20
	EOR #$FF
	ADC #$01
	SEC
	SBC #$B9
	STA $12
	LDA #$70
	STA $64
	LDA $12
	STA $65
	LDA #$06
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$00
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	JSR $ADFD
	LDA $06CD
	BEQ $A408
	LDA #$04
	STA $4E
	INC $49
	RTS
;------------------------
	LDA #$00
	STA $06DE
	LDA #$06
	STA $4B
	JSR $8050
	INC $49
	LDA #$20
	STA $4E
	LDA #$74
	STA $041C
	LDA #$01
	STA $A000
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$00
	ASL A
	TAX
	LDA $8257,X
	STA $12
	LDA $8258,X
	STA $13
	LDA $2D
	STA $06
	LDA $06DE
	STA $05
	JSR $8231
	BMI $A46A
	STA $06DE
	LDA #$03
	STA $070F
	RTS
;------------------------
	JSR $A446
	LDA $06DE
	BNE $A479
	LDA $25
	AND #$10
	BNE $A49A
	LDA #$65
	STA $64
	LDA #$80
	STA $65
	LDA #$46
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$00
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	LDA $06DE
	BEQ $A4A5
	LDA $25
	AND #$10
	BNE $A4C6
	LDA #$60
	STA $64
	LDA #$90
	STA $65
	LDA #$45
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$00
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	JSR $BEAC
	BNE $A4D0
	LDA #$08
	STA $49
	RTS
;------------------------
	LDA $2D
	AND #$D0
	BEQ $A4E2
	LDA #$12
	STA $070D
	LDA $06DE
	BNE $A4E3
	INC $49
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$0C
	STA $0410
	LDA #$00
	STA PpuMask_2001
	STA $49
	LDA $5E
	BNE $A502
	LDA #$00
	STA $59
	LDA #$03
	STA $5A
	BNE $A512
	JSR $9D33
;---unidentified block---

;------------------------
	LDA #$00
	STA $49
	LDA #$01
	STA $48
	RTS
;------------------------
	LDA $06B5
	STA $64
	LDA #$52
	STA $65
	LDA #$42
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$02
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	LDA $06B6
	STA $64
	LDA #$48
	STA $65
	LDA #$43
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$02
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	LDA $06B5
	CMP #$68
	BCS $A572
	DEC $06B6
	DEC $06B6
	INC $06B5
	INC $06B5
	LDA $25
	AND #$1F
	BNE $A57E
	DEC $4E
	BPL $A57E
	INC $49
	RTS
;------------------------
;--------sub start-------
	LDA #$02
	JSR $A300
	LDA #$AB
	STA $43
	LDA #$21
	STA $44
	LDA #$0D
	STA $46
	LDA #$02
	STA $45
	LDA #$00
	STA $47
	RTS
;------------------------
	JSR $A6FF
	LDA #$07
	STA $4B
	JSR $8050
	LDA $06E2
	BEQ $A5AB
	JSR $A57F
	LDA #$00
	JSR $E7C6
	LDA #$03
	JSR $A300
	LDA #$88
	STA $43
	LDA #$21
	STA $44
	LDA #$11
	STA $46
	LDA #$02
	STA $45
	LDA #$00
	STA $47
	LDX #$1A
	STX $52
	INX
	STX $53
	INC $49
	LDA #$05
	STA $4E
	LDA #$80
	STA $041C
	LDA #$01
	STA $A000
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	NOP
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $06B7
	ASL A
	TAX
	LDA $A5EE,X
	STA $06DA
	LDA $A5EF,X
	STA $06DB
	LDX $06B7
	LDA $A5F2,X
	STA $06DC
	RTS
;------------------------
	JSR $A5F4
	NOP
	LDA $25
	AND #$1F
	BNE $A61D
	DEC $4E
	BMI $A636
	LDA $25
	AND #$10
	BNE $A624
	NOP
	LDA $2D
	AND #$D0
	BEQ $A638
	LDA #$1C
	STA $49
	STA $06D2
	LDA #$08
	STA $4E
	RTS
;------------------------
	INC $49
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$05
	STA $4B
	JSR $8050
	INC $49
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	NOP
	RTS
;------------------------
	LDA $2D
	AND #$08
	BEQ $A65F
	LDA #$00
	STA $5E
	JMP $A669
	LDA $2D
	AND #$04
	BEQ $A669
	LDA #$01
	STA $5E
	LDA $25
	AND #$10
	BNE $A693
	LDX $5E
	LDA #$48
	STA $64
	LDA $A639,X
	STA $65
	LDA #$44
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$02
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	LDA $2D
	AND #$D0
	BEQ $A69B
	INC $49
	RTS
;------------------------
	LDA $25
	CMP $4C
	BNE $A6A3
	RTS
;------------------------
	STA $4C
	JSR $BEAC
	BNE $A6AC
	INC $49
	RTS
;------------------------
	LDA $49
	CMP #$14
	BCC $A6BD
	LDA #$01
	STA $06EC
	LDX #$02
	JSR $F974
	LDA $49
	JSR $E777
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$00
	STA $04F5
	STA $06EB
	RTS
;------------------------
	JSR $A6FF
	LDA #$10
	STA $06CE
	STA $06CF
	LDA $5E
	BNE $A767
	LDA #$09
	STA $4B
	JSR $8050
	JSR $9CD9
	LDA #$00
	STA $4F
	STA $5F
	STA $60
	LDA #$5C
	STA $041C
	LDA #$0F
	STA $49
	LDA #$00
	STA $06C2
	STA $06C3
	STA $06CD
	LDA #$AE
	STA $06BA
	LDA #$20
	STA $06BB
	LDA #$10
	STA $06C0
	LDA #$05
	STA $06C1
	JSR $B3E1
	JSR $B3AC
	JSR $AA98
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $5F,X
	BEQ $A863
	LDA $25
	AND #$01
	CMP $A87A,X
	BEQ $A863
	RTS
;------------------------
	LDA $5F,X
	JSR $E777
;---unidentified block---

;------------------------
	LDX $63
	LDA $59,X
	BPL $A8F3
	JMP $A8CE
	STA $0D
	LDX $63
	LDA $2D,X
	STA $0E
	LDA $5E
	BNE $A903
	LDA #$03
	BNE $A905
	LDA #$02
	ASL A
	TAX
	LDA $8257,X
	STA $12
	LDA $8258,X
	STA $13
	LDA $0E
	STA $06
	LDA $0D
	STA $05
	JSR $8231
	BMI $A93A
	LDX $63
	STA $59,X
	AND #$03
	TAX
	LDA $06D3,X
	BEQ $A92D
	JSR $B3C3
	JSR $A6FF
	LDA #$03
	STA $070F
	LDX $63
	INC $5F,X
	RTS
;------------------------
	LDX $63
	LDA $2D,X
	AND #$D0
	BEQ $A94B
	LDA #$07
	STA $5F,X
	LDA #$12
	STA $070F
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDX $63
	LDA #$48
	STA $61,X
	JSR $ABF7
	LDX $63
	INC $5F,X
	RTS
;------------------------
	JSR $ABA5
	LDX $63
	INC $5F,X
	RTS
;------------------------
	JSR $AB82
	LDX $63
	INC $5F,X
	RTS
;------------------------
	LDX $63
	LDA $59,X
	AND #$07
	ASL A
	TAX
	LDA $8561,X
	STA $12
	LDA $8562,X
	STA $13
	LDY #$00
	LDA ($12),Y
	STA $0600,Y
	INY
	CPY #$18
	BCC $A99A
	LDA $63
	BNE $A9BF
	LDA #$C0
	STA $43
	LDA #$23
	STA $44
	LDA #$18
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	JMP $A9D3
;---unidentified block---

;------------------------
	LDX $63
	INC $5F,X
	RTS
;------------------------
	LDX $63
	LDA $59,X
	ASL A
	STA $61,X
	JSR $AB32
	JSR $A9EA
	LDX $63
	INC $5F,X
	RTS
;------------------------
;--------sub start-------
	LDX $63
	LDA $59,X
	AND #$07
	TAX
	LDA $F964,X
	STA $54
	TAX
	INX
	STX $55
	LDA $5A
	AND #$07
	TAX
	LDA $F964,X
	STA $06B8
	RTS
;------------------------
;--------sub start-------
	LDX $63
	LDA $59,X
	AND #$07
	ASL A
	TAX
	LDA $830A,X
	STA $12
	LDA $830B,X
	STA $13
	LDX #$00
	LDY #$2D
	LDA ($12),Y
	ORA #$80
	STA $0600,X
	INX
	INY
	CPY #$51
	BCC $AA1C
	LDA #$E2
	STA $43
	LDA #$20
	STA $44
	LDA #$09
	STA $46
	LDA #$04
	STA $45
	LDA #$00
	STA $47
	LDX $63
	LDA #$00
	STA $5F,X
	STA $06CD
	STA $06C2
	LDA #$AE
	STA $06BA
	LDA #$20
	STA $06BB
	RTS
;------------------------
	LDX $63
	INC $5F,X
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $59,X
	AND #$07
	NOP
	ASL A
	TAX
	LDA $830A,X
	STA $12
	LDA $830B,X
	STA $13
	LDY #$00
	LDA ($12),Y
	ORA #$80
	STA $0600,Y
	INY
	CPY #$51
	BCC $AA6D
	RTS
;------------------------
;--------sub start-------
	LDA $59,X
	AND #$07
	NOP
	ASL A
	TAX
	LDA $8561,X
	STA $12
	LDA $8562,X
	STA $13
	LDY #$00
	LDA ($12),Y
	STA $0600,Y
	INY
	CPY #$18
	BCC $AA8D
	RTS
;------------------------
;--------sub start-------
	LDX #$00
	JSR $AA5A
	LDA #$42
	STA $43
	LDA #$20
	STA $44
	LDA #$09
	STA $46
	LDA #$09
	STA $45
	LDA #$00
	STA $47
	JSR $E7E1
	LDX #$00
	JSR $AA7A
	LDA #$C0
	STA $43
	LDA #$23
	STA $44
	LDA #$18
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	JSR $E7E1
	LDX #$01
	JSR $AA5A
	LDA #$95
	STA $43
	LDA #$21
	STA $44
	LDA #$09
	STA $46
	LDA #$09
	STA $45
	LDA #$00
	STA $47
	JSR $E7E1
	LDX #$01
	JSR $AA7A
	LDA #$D8
	STA $43
	LDA #$23
	STA $44
	LDA #$18
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	JSR $E7E1
	LDX #$00
	JSR $ABF7
	JSR $E7E1
	LDX #$01
	JSR $ABF7
	JSR $E7E1
	LDA $59
	AND #$07
	TAX
	LDA $F964,X
	STA $54
	TAX
	INX
	STX $55
	LDA $5A
	AND #$07
	TAX
	LDA $F964,X
	STA $06B8
	RTS
;------------------------
;--------sub start-------
	LDX $63
	LDA $59,X
	AND #$07
	ASL A
	TAX
	LDA $830A,X
	STA $12
	LDA $830B,X
	STA $13
	LDY #$00
	LDA ($12),Y
	ORA #$80
	STA $0600,Y
	INY
	CPY #$2D
	BCC $AB46
	LDA $63
	BNE $AB6D
	LDA #$42
	STA $43
	LDA #$20
	STA $44
	LDA #$09
	STA $46
	LDA #$05
	STA $45
	LDA #$00
	STA $47
	JMP $AB81
;---unidentified block---

;------------------------
	RTS
;------------------------
;--------sub start-------
	LDX $63
	LDX #$00
	LDA #$00
	STA $0600,X
	INX
	CPX #$24
	BCC $AB86
	LDA #$E2
	STA $43
	LDA #$20
	STA $44
	LDA #$09
	STA $46
	LDA #$04
	STA $45
	LDA #$00
	STA $47
	RTS
;------------------------
;--------sub start-------
	LDX $63
	LDX #$00
	LDA #$00
	STA $0600,X
	INX
	CPX #$2D
	BCC $ABA9
	LDA #$42
	STA $43
	LDA #$20
	STA $44
	LDA #$09
	STA $46
	LDA #$04
	STA $45
	LDA #$00
	STA $47
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $06B7
	BEQ $AC08
	CLC
	LDA $59,X
	AND #$0F
	ASL A
	ADC #$10
	TAY
	JMP $AC0C
;---unidentified block---

;------------------------
	LDA $F682,Y
	STA $12
	LDA $F683,Y
	STA $13
	LDY #$00
	LDA ($12),Y
	AND #$7F
	STA $0600,Y
	INY
	CPY #$14
	BCC $AC18
	LDA $AC3B,X
	STA $43
	LDA $AC3D,X
	STA $44
	LDA #$0A
	STA $46
	LDA #$02
	STA $45
	LDA #$00
	STA $47
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$02
	STA $06EC
	JSR $F974
	LDA $06DD
	BNE $AD09
	JSR $AD9C
	LDX #$00
	STX $63
	JSR $A855
	LDA $5F
	ORA $60
	BNE $ACFE
	LDA $44
	BNE $ACFE
	LDA $59
	AND #$07
	STA $06CC
	JSR $ADFD
	LDA $5F
	CMP #$08
	BNE $AD2F
	LDA #$14
	STA $070F
	LDA #$04
	STA $06CE
	LDA #$00
	STA $06C2
	STA $06C3
	STA $06CD
	LDA #$E2
	STA $06BA
	LDA #$21
	STA $06BB
	LDA $5A
	AND #$07
	STA $06CC
	JSR $A6FF
	INC $49
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$00
	STA $06DD
	LDA #$03
	STA $06EC
	JSR $F974
	LDA $25
	CMP $4C
	BNE $AD4C
	RTS
;------------------------
	STA $4C
	LDA $2D
	BNE $AD98
	JSR $AD9C
	LDA #$00
	STA $06D0
	JSR $ADFD
	LDX $06D0
	STX $12
	LDA $AD34,X
	STA $64
	LDA #$B6
	STA $65
	LDA $12
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$00
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	INC $06D0
	LDA $06D0
	CMP #$04
	BCC $AD5D
	LDA $06CD
	BEQ $AD9A
	LDA $04F5
	BNE $AD9A
	INC $49
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $25
	AND $06CE
	BNE $ADF3
	LDA $59
	BMI $ADF3
	ASL A
	TAX
	LDA $F948,X
	STA $64
	LDA $F949,X
	STA $65
	LDA #$4A
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$00
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	LDA $5A
	ASL A
	TAX
	LDA $F956,X
	STA $64
	LDA $F957,X
	STA $65
	LDA #$4C
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$00
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	RTS
;------------------------
	LDA #$00
	STA $49
	LDA #$02
	STA $48
	RTS
;------------------------
;--------sub start-------
	LDA $06E2
	BEQ $AE07
	LDA $06B7
	BNE $AE1F
	LDA $06CD
	BEQ $AE0D
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA $06CD
	BEQ $AE25
	RTS
;------------------------
	LDA $06C2
	JSR $E777
;---unidentified block---

;------------------------
	LDA #$00
	STA $06C3
	STA $06CA
	STA $06CB
	LDA $06BA
	STA $06BC
	STA $06BE
	LDA $06BB
	STA $06BD
	STA $06BF
	INC $06C2
	RTS
;------------------------
	LDX #$00
	LDA #$00
	STA $0600,X
	INX
	CPX #$20
	BCC $AE58
	LDA $06BA
	STA $43
	LDA $06BB
	STA $44
	LDA $06C0
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	INC $06C3
	LDA $06C3
	CMP $06C1
	BCC $AEC6
	INC $06C2
	LDA $06BC
	STA $06BA
	LDA $06BD
	STA $06BB
	LDA $06DA
	LDX #$86
	STX $8000
	STA $8001
	LDA $06CC
	ASL A
	TAX
	LDA $9300,X
	STA $06C4
	STA $06C6
	STA $06C8
	LDA $9301,X
	STA $06C5
	STA $06C7
	STA $06C9
	LDA #$30
	LDX #$86
	STX $8000
	STA $8001
	RTS
;------------------------
	JSR $B6F2
	RTS
;------------------------
;---unidentified block---

;------------------------
	JSR $A6FF
	LDA $57
	BEQ $B097
	LDA #$1D
	STA $49
	RTS
;------------------------
	LDA #$0A
	STA $4B
	JSR $8050
	LDA #$84
	STA $041C
	INC $49
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
;--------sub start-------
	LDA #$C1
	STA $06BA
	LDA #$22
	STA $06BB
	LDA #$1E
	STA $06C0
	LDA #$00
	STA $06CC
	STA $06CD
	STA $06C2
	LDA #$00
	STA $20
	RTS
;------------------------
	JSR $B137
	LDA $2D
	AND #$30
	BNE $B0E3
	LDA $06CD
	BEQ $B0E5
	LDA $04F5
	BNE $B0E5
	INC $49
	RTS
;------------------------
	LDA $25
	AND #$20
	BEQ $B10D
	LDA #$80
	STA $64
	LDA #$E0
	STA $65
	LDA #$44
	ASL A
	TAX
	LDA $F15D,X
	STA $12
	LDA $F15E,X
	STA $13
	LDA #$02
	STA $67
	LDA #$00
	STA $66
	JSR $BDD0
	LDA $2A
	BEQ $B113
	INC $49
	RTS
;------------------------
	LDA #$0B
	STA $4B
	JSR $8050
	LDA #$64
	STA $041C
	INC $49
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	JSR $B0B1
	LDA #$01
	STA $06CC
	RTS
;------------------------
;--------sub start-------
	LDA $06E2
	BEQ $B141
	LDA $06B7
	BNE $B157
	LDA $06CD
	BEQ $B147
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$03
	STA $06C1
	LDA #$1C
	STA $06C0
	LDA $06CD
	BEQ $B167
	RTS
;------------------------
	LDA $06C2
	JSR $E777
;---unidentified block---

;------------------------
	LDA $25
	AND #$0F
	BNE $B1B4
	LDA $06DB
	JSR $B646
	LDA $0600
	CMP #$7F
	BEQ $B1B9
	LDA $06BA
	STA $43
	LDA $06BB
	STA $44
	LDA $06C0
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	INC $06CB
	LDA $06CB
	CMP $06C1
	BCC $B1B5
	LDA #$05
	STA $06E3
	INC $06C2
	RTS
;------------------------
	JSR $B6F2
	RTS
;------------------------
;---unidentified block---

;------------------------
	INC $06C2
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA $06BA
	STA $06BC
	STA $06BE
	LDA $06BB
	STA $06BD
	STA $06BF
	LDA #$00
	STA $06C3
	STA $06CA
	STA $06CB
	LDA $06DB
	LDX #$86
	STX $8000
	STA $8001
	LDA $06B7
	BEQ $B211
	LDA $06CC
	ASL A
	TAX
	LDA $9300,X
	STA $06C4
	STA $06C6
	STA $06C8
	LDA $9301,X
	STA $06C5
	STA $06C7
	STA $06C9
	JMP $B22E
;---unidentified block---

;------------------------
	LDA #$30
	LDX #$86
	STX $8000
	STA $8001
	INC $06C2
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	CLC
	LDA $06D3
	ADC $06D4
	ADC $06D5
	CMP #$03
	BCC $B3C3
	LDA #$03
	STA $48
	LDA #$00
	STA $49
	RTS
;------------------------
	LDA $040C
	BEQ $B3E0
	LDA $06D3
	BNE $B3D2
	LDA #$00
	STA $59
	RTS
;------------------------
	LDA $06D4
	BNE $B3DC
	LDA #$01
	STA $59
	RTS
;------------------------
	LDA #$02
	STA $59
	RTS
;------------------------
;--------sub start-------
	LDX #$00
	LDA $B41D,X
	STA $0600,X
	INX
	CPX #$0C
	BCC $B3E3
	LDX #$00
	STX $0D
	LDX $0D
	CPX #$07
	BCS $B41C
	LDA $06D3,X
	BEQ $B418
	LDA $0D
	TAY
	LDA $B429,Y
	STA $43
	LDA #$23
	STA $44
	LDA #$03
	STA $46
	LDA #$04
	STA $45
	LDA #$00
	STA $47
	JSR $E7E1
	INC $0D
	BNE $B3F2
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA $49
	JSR $E777
;---unidentified block---

;------------------------
	LDA #$01
	STA $06E2
	JSR $A6FF
	INC $49
	RTS
;------------------------
	LDA #$09
	STA $4B
	JSR $8050
	LDA #$00
	STA $4F
	JSR $9CD9
	LDA #$7C
	STA $041C
	LDA #$D0
	STA $20
	INC $49
	LDA #$00
	STA $06C2
	STA $06C3
	STA $06CD
	LDA #$AE
	STA $06BA
	LDA #$20
	STA $06BB
	LDA #$10
	STA $06C0
	LDA #$05
	STA $06C1
	LDA #$23
	STA PpuAddr_2006
	LDA #$00
	STA PpuAddr_2006
	LDX #$7F
	LDA #$00
	STA PpuData_2007
	DEX
	BPL $B498
	JSR $AA98
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	LDA #$AE
	STA $06BA
	LDA #$20
	STA $06BB
	LDA #$00
	STA $06C3
	LDA #$04
	STA $06C1
	LDA #$05
	STA $06EC
	LDA $59
	AND #$07
	TAX
	JSR $F974
	RTS
;------------------------
	LDA #$1E
	STA PpuMask_2001
	STA $04
	LDA $25
	AND #$03
	BNE $B4E1
	LDX #$00
	JSR $B558
	RTS
;------------------------
	LDA #$1E
	STA PpuMask_2001
	STA $04
	LDA $2D
	BNE $B4F2
	LDA $04F5
	BNE $B515
	LDA #$E2
	STA $06BA
	LDA #$21
	STA $06BB
	LDA #$00
	STA $06C3
	LDA #$04
	STA $06C1
	INC $49
	LDA #$06
	STA $06EC
	LDA $5A
	AND #$07
	TAX
	JSR $F974
	RTS
;------------------------
	LDA #$1E
	STA PpuMask_2001
	STA $04
	LDA $25
	AND #$03
	BNE $B52C
	LDX #$01
	JSR $B558
	LDA #$70
	STA $4E
	RTS
;------------------------
	LDA #$1E
	STA PpuMask_2001
	STA $04
	LDA $25
	CMP $4C
	BNE $B53B
	RTS
;------------------------
	STA $4C
	LDA $2D
	BNE $B546
	JSR $BEAC
	BNE $B548
	INC $49
	RTS
;------------------------
	LDA #$08
	STA $40
	LDA #$00
	STA $040A
	STA $20
	JSR $A6FF
	RTS
;------------------------
;--------sub start-------
	LDY #$31
	LDA $06B7
	BEQ $B560
	INY
	LDA #$86
	STA $8000
	STY $8001
	LDA $7D,X
	AND #$0F
	ASL A
	STA $18
	TXA
	EOR #$01
	TAY
	LDA $00B8,Y
	STA $06
	LDA $B8,X
	CMP $06
	BCC $B585
	CLC
	LDA $18
	ADC #$10
	STA $18
	LDX $04F9
	DEX
	STX $12
	LDX $04FA
	DEX
	STX $13
	LDA $12
	ORA $13
	AND #$03
	ASL A
	ASL A
	ASL A
	ASL A
	ASL A
	CLC
	ADC $18
	STA $18
	TAX
	LDA $8000,X
	STA $1C
	LDA $8001,X
	STA $1D
	LDY $06C3
	INY
	LDX #$00
	LDA ($1C),Y
	AND #$7F
	STA $0600,X
	INY
	INX
	CPX #$10
	BCC $B5B2
	LDA $06BA
	STA $43
	LDA $06BB
	STA $44
	LDA #$10
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	CLC
	LDA $06BA
	ADC #$20
	STA $06BA
	BCC $B5E3
	INC $06BB
	CLC
	LDA $06C3
	ADC #$12
	STA $06C3
	DEC $06C1
	BPL $B5F3
	INC $49
	LDA #$30
	LDX #$86
	STX $8000
	STA $8001
	RTS
;------------------------
	LDA $25
	AND #$0F
	BNE $B638
	JSR $B643
	LDA $0600
	CMP #$7F
	BEQ $B63D
	LDA $06BA
	STA $43
	LDA $06BB
	STA $44
	LDA $06C0
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	INC $06CB
	LDA $06CB
	CMP $06C1
	BCC $B639
	LDA #$05
	STA $06E3
	INC $06C2
	RTS
;------------------------
	JSR $B6F2
	RTS
;------------------------
	LDA #$01
	STA $06CD
	RTS
;------------------------
;--------sub start-------
	LDA $06DA
;--------sub start-------
	LDX #$86
	STX $8000
	STA $8001
	LDA $06C4
	STA $12
	LDA $06C5
	STA $13
	LDY #$01
	LDX #$00
	LDA ($12),Y
	AND #$7F
	STA $0600,X
	INY
	INX
	CPX $06C0
	BCC $B65C
	LDX $06C0
	INX
	INX
	STX $0A
	CLC
	LDA $06C4
	ADC $0A
	STA $06C4
	BCC $B67F
	INC $06C5
	LDA #$30
	LDX #$86
	STX $8000
	STA $8001
	RTS
;------------------------
	LDA $25
	AND #$1F
	BNE $B6AC
	DEC $06E3
	LDA $06E3
	BNE $B6AC
	LDA $06BE
	STA $06BA
	LDA $06BF
	STA $06BB
	LDA #$00
	STA $06C3
	INC $06C2
	RTS
;------------------------
	LDX #$00
	LDA #$00
	STA $0600,X
	INX
	CPX #$20
	BCC $B6AF
	LDA $06BA
	STA $43
	LDA $06BB
	STA $44
	LDA $06C0
	STA $46
	LDA #$01
	STA $45
	LDA #$00
	STA $47
	INC $06C3
	LDA $06C3
	CMP $06C1
	BCC $B6F2
	LDA $06BE
	STA $06BA
	LDA $06BF
	STA $06BB
	LDA #$02
	STA $06C2
	LDA #$00
	STA $06CB
	RTS
;------------------------
;--------sub start-------
	CLC
	LDA $06BA
	ADC #$20
	STA $06BA
	LDA #$00
	ADC $06BB
	STA $06BB
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA $49
	CMP #$07
	BCC $B85A
	LDA $49
	CMP #$12
	BCS $B85A
	LDA #$01
	STA $06EC
	LDX #$01
	JSR $F974
	LDA $49
	JSR $E777
;---unidentified block---

;------------------------
	LDA $5E
	BNE $B953
	LDA #$07
	STA $49
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$00
	STA $04
	STA $49
	STA $48
	STA $0467
	STA $040A
	LDA #$00
	STA $A000
	JSR $9D78
	JSR $9D9F
	LDA #$01
	STA $40
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA $57
	CMP #$02
	BNE $BB1F
	JSR $A6FF
	LDA #$0C
	STA $4B
	JSR $8050
	LDA #$4C
	STA $041C
	LDA #$04
	STA $4E
	LDA #$88
	STA PpuControl_2000
	STA $02
	CLI
	LDA #$1E
	STA $04
	INC $49
	RTS
;------------------------
	LDA #$13
	STA $49
	RTS
;------------------------
	LDA #$0D
	STA $50
	LDA #$00
	STA $51
	STA $4F
	LDA #$04
	STA $4E
	INC $49
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA $57
	CMP #$03
	BNE $BB7B
	JSR $A6FF
;---unidentified block---

;------------------------
	LDA #$17
	STA $49
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDY #$00
	LDA ($12),Y
	STA $09
	INY
	LDA ($12),Y
	STA $0C
	INY
	LDA ($12),Y
	STA $05
	INY
	LDA ($12),Y
	STA $06
	INY
	LDA ($12),Y
	STA $0F
	INY
	LDA ($12),Y
	STA $10
	LDA $67
	AND #$40
	BNE $BE0E
	LDA $05
	CLC
	ADC $64
	STA $8A
	LDX #$00
	LDA $8A
	STA $06A3,X
	CLC
	ADC #$08
	INX
	CPX $09
	BCC $BE00
	JMP $BE29
	LDA $05
	EOR #$FF
	SEC
	SBC #$07
	CLC
	ADC $64
	STA $8A
	LDX #$00
	LDA $8A
	STA $06A3,X
	SEC
	SBC #$08
	INX
	CPX $09
	BCC $BE1E
	LDA $06
	CLC
	ADC $65
	STA $8B
	LDX #$00
	LDA $8B
	STA $06AB,X
	CLC
	ADC #$08
	INX
	CPX $0C
	BCC $BE34
	LDX $68
	LDA #$06
	STA $69
	LDY #$00
	STY $0A
	LDA $06AB,Y
	STA $0B
	LDY #$00
	STY $08
	LDA $06A3,Y
	STA $0303,X
	LDA $0B
	STA $0300,X
	LDY $69
	LDA ($12),Y
	BNE $BE6B
	LDA #$FF
	STA $0300,X
	JMP $BE7D
	ORA $66
	STA $0301,X
	LDA ($0F),Y
	AND #$01
	ORA $67
	STA $0302,X
	INX
	INX
	INX
	INX
	INC $69
	INC $08
	LDY $08
	CPY $09
	BCC $BE52
	LDY $0A
	INY
	CPY $0C
	BCC $BE47
	STX $68
	RTS
;------------------------
;---unidentified block---

;------------------------
	JSR $829F
	LDA $4F
	CMP #$05
	BCS $BE9C
	RTS
;------------------------
	INC $49
	RTS
;------------------------
	JSR $829F
	LDA $4F
	CMP #$09
	BCS $BEA9
	RTS
;------------------------
	INC $49
	RTS
;------------------------
;--------sub start-------
	LDA $25
	AND #$1F
	BNE $BEB4
	DEC $4E
	LDA $4E
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$3F
	STA PpuAddr_2006
	LDA #$11
	STA PpuAddr_2006
	LDA $B6
	JSR $DB71
	LDA #$3F
	STA PpuAddr_2006
	LDA #$19
	STA PpuAddr_2006
	LDA $B7
	CMP $B6
	BNE $C022
	CLC
	ADC #$10
	JSR $DB8A
	RTS
;------------------------
;--------sub start-------
	LDA $89
	JSR $E777
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $6F
	CMP #$FF
	BNE $C066
	LDA #$20
	STA PpuAddr_2006
	LDA #$7E
	SEC
	SBC #$0C
	TAX
	LDA $7D
	BPL $C058
	LDX #$61
	STX PpuAddr_2006
	LDX #$0C
	LDA #$02
	STA PpuData_2007
	DEX
	BPL $C05F
	RTS
;------------------------
	LDA $02
	ORA #$04
	STA PpuControl_2000
	LDA $25
	AND #$01
	BNE $C07D
	LDX #$00
	JSR $C1E2
	LDX #$01
	JSR $C1E2
	JSR $C18B
	LDA $02
	STA PpuControl_2000
	LDA $89
	CMP #$03
	BEQ $C094
	CMP #$04
	BEQ $C094
	CMP #$05
	BEQ $C094
	RTS
;------------------------
	LDA #$20
	STA PpuAddr_2006
	LDA #$4F
	STA PpuAddr_2006
	LDA $B2
	CMP #$0F
	BCS $C0C9
	LDA $25
	AND #$04
	BNE $C0C9
	LDA $89
	CMP #$03
	BNE $C0C9
	LDX #$FF
	STX PpuData_2007
	STX PpuData_2007
	LDA #$20
	STA PpuAddr_2006
	LDA #$6F
	STA PpuAddr_2006
	STX PpuData_2007
	STX PpuData_2007
	RTS
;------------------------
	LDA $5E
	BEQ $C0FE
	LDX $063E
	LDA $C0FF,X
	STA PpuData_2007
	LDX $063F
	LDA $C0FF,X
	STA PpuData_2007
	LDA PpuStatus_2002
	LDA #$20
	STA PpuAddr_2006
	LDA #$6F
	STA PpuAddr_2006
	LDX $063E
	LDA $C109,X
	STA PpuData_2007
	LDX $063F
	LDA $C109,X
	STA PpuData_2007
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $89
	CMP #$03
	BEQ $C1E1
	LDA $6A
	BNE $C1E1
	LDA $040D
	BEQ $C1BB
	LDX #$20
	STX PpuAddr_2006
	LDX #$8D
	CMP #$02
	BCC $C1B2
	STX PpuAddr_2006
	LDA #$2F
	STA PpuData_2007
	LDA #$20
	STA PpuAddr_2006
	DEX
	STX PpuAddr_2006
	LDA #$2F
	STA PpuData_2007
	LDA $040E
	BEQ $C1E1
	LDX #$20
	STX PpuAddr_2006
	LDX #$92
	CMP #$02
	BCC $C1D8
	STX PpuAddr_2006
	LDA #$2F
	STA PpuData_2007
	LDA #$20
	STA PpuAddr_2006
	INX
	STX PpuAddr_2006
	LDA #$2F
	STA PpuData_2007
	RTS
;------------------------
;--------sub start-------
	TXA
	EOR #$01
	TAY
	LDA $00B8,Y
	CMP #$65
	BCC $C1F2
	LDA #$00
	STA $BA,X
	RTS
;------------------------
	LDA $B8,X
	CMP #$65
	BCC $C221
	LDA $A3,X
	BNE $C225
	LDA $A1,X
	CMP #$2E
	BEQ $C212
	CMP #$31
	BEQ $C212
	CMP #$26
	BEQ $C225
	LDA #$2E
	STA $A1,X
	LDA #$00
	STA $A3,X
	LDA $6F
	BMI $C225
	LDA #$32
	STA $070D
	LDA #$02
	STA $A5
	BNE $C225
	LDA $BA,X
	BNE $C226
	RTS
;------------------------
	DEC $BA,X
	INC $B8,X
	LDA #$20
	STA PpuAddr_2006
	LDA $B8,X
	SEC
	SBC #$01
	LSR A
	LSR A
	LSR A
	STA $12
	TXA
	BNE $C251
	LDA #$61
	CLC
	ADC $12
	STA PpuAddr_2006
	LDA $B8
	SEC
	SBC #$01
	LSR A
	LSR A
	TAY
	LDA $C268,Y
	BNE $C264
	LDA #$7E
	SEC
	SBC $12
	STA PpuAddr_2006
	LDA $B8,X
	SEC
	SBC #$01
	LSR A
	LSR A
	TAY
	LDA $C282,Y
	STA PpuData_2007
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $09
	CMP #$01
	BCC $C2FA
	LDA $08
	CMP #$86
	BCC $C2FA
	LDA $07
	CMP #$9F
	BCC $C2FA
	LDA #$01
	STA $07
	STA $0400,X
	LDA #$86
	STA $08
	STA $0401,X
	LDA #$9F
	STA $09
	STA $0402,X
	JSR $D32D
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $B6
	ASL A
	TAX
	LDA $C3E6,X
	STA $3B
	LDA $C3E7,X
	STA $3C
	LDX #$00
	LDA #$FF
	STA $0600,X
	INX
	CPX #$38
	BCC $C382
	LDX #$00
	LDY #$00
	LDA ($3B),Y
	STA $07
	INY
	LDA ($3B),Y
	CMP #$FF
	BEQ $C39F
	SEC
	SBC #$3D
	STA $0600,X
	INY
	INX
	CPX $07
	BCC $C393
	LDA $B7
	ASL A
	TAX
	LDA $C3E6,X
	STA $3B
	LDA $C3E7,X
	STA $3C
	LDY #$00
	LDX #$1E
	DEX
	LDA ($3B),Y
	TAY
	LDA ($3B),Y
	CMP #$FF
	BEQ $C3C7
	SEC
	SBC #$3D
	STA $0600,X
	DEX
	DEY
	BNE $C3BB
	LDA PpuStatus_2002
	LDA #$20
	STA PpuAddr_2006
	LDA #$81
	STA PpuAddr_2006
	LDX #$00
	LDA $0600,X
	STA PpuData_2007
	INX
	CPX #$1E
	BCC $C3DA
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDX #$1C
	STX $46
	LDY #$00
	LDA $C54E,Y
	STA $0600,Y
	INY
	CPY #$1C
	BCC $C439
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	JSR $C433
	LDY #$00
	STY $8B
	LDX #$00
	STX $8A
	JSR $C49D
	INC $8B
	LDY $8B
	LDX #$03
	STX $8A
	JSR $C49D
;--------sub start-------
	RTS
;------------------------
;--------sub start-------
	LDA $00F6,Y
	ASL A
	TAX
	LDA $C542,X
	STA $05
	LDA $C543,X
	STA $06
	LDX $8A
;--------sub start-------
	CLC
	LDA $0400,X
	ADC $05
	STA $0400,X
	LDA $0401,X
	ADC $06
	STA $0401,X
	BCC $C4C4
	INC $0402,X
;--------sub start-------
	LDA $0400,X
	STA $07
	LDA $0401,X
	STA $08
	LDA $0402,X
	STA $09
	LDA #$1E
	STA $0D
	JSR $C2D3
	LDY $8B
	LDX $C54C,Y
	LDY #$04
	LDA $0673,Y
	STA $0600,X
	INX
	DEY
	BPL $C4E1
	LDY $8B
	LDX $C54C,Y
	JSR $C56A
	LDX $8A
	TXA
	EOR #$03
	TAY
	LDA $0402,Y
	CMP $0402,X
	BCC $C515
	BNE $C541
	LDA $0401,Y
	CMP $0401,X
	BCC $C515
	BNE $C541
	LDA $0400,Y
	CMP $0400,X
	BCS $C541
	LDA $0402,X
	CMP $0408
	BCC $C541
	LDA $0401,X
	CMP $0407
	BCC $C541
	BNE $C52F
	LDA $0406
	CMP $0400,X
	BCS $C541
	LDA $0400,X
	STA $0406
	LDA $0401,X
	STA $0407
	LDA $0402,X
	STA $0408
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDY #$05
	LDA $0600,X
	CMP #$1E
	BNE $C57C
	LDA #$FF
	STA $0600,X
	INX
	DEY
	BNE $C56C
	RTS
;------------------------
;--------sub start-------
	LDA #$20
	STA PpuAddr_2006
	LDA #$00
	STA PpuAddr_2006
	LDX #$00
	LDA #$00
	STA PpuData_2007
	INX
	CPX #$C0
	BCC $C58B
	RTS
;------------------------
;--------sub start-------
	LDA PpuStatus_2002
	LDA #$20
	STA PpuAddr_2006
	LDA #$61
	STA PpuAddr_2006
	LDX #$00
	LDA $C657,X
	CMP #$80
	BEQ $C5B0
	STA PpuData_2007
	INX
	BNE $C5A3
	LDA PpuStatus_2002
	LDA #$23
	STA PpuAddr_2006
	LDA #$C0
	STA PpuAddr_2006
	LDA #$00
	TAX
	STA PpuData_2007
	INX
	CPX #$08
	BCC $C5C0
	LDX #$00
	LDA PpuStatus_2002
	LDA #$23
	STA PpuAddr_2006
	LDA #$C8
	STA PpuAddr_2006
	LDA PpuData_2007
	LDA PpuData_2007
	AND #$F0
	STA $0600,X
	INX
	CPX #$08
	BCC $C5DA
	LDX #$00
	LDA PpuStatus_2002
	LDA #$23
	STA PpuAddr_2006
	LDA #$C8
	STA PpuAddr_2006
	LDA $0600,X
	STA PpuData_2007
	INX
	CPX #$08
	BCC $C5F6
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$87
	STA $87
	STA $8000
	LDA #$01
	CLC
	ADC #$20
	STA $8001
	JSR $A000
	RTS
;------------------------
	LDA $7D
	AND #$80
	BEQ $C695
	LDA #$00
	STA $2A
	STA $2D
	LDA $7E
	AND #$80
	BEQ $C6A1
	LDA #$00
	STA $2B
	STA $2E
	JSR $CEC9
	JSR $CA52
	JSR $CCC6
	LDA #$86
	STA $87
	STA $8000
	LDA #$0A
	CLC
	ADC #$20
	STA $8001
	JSR $97D9
	LDA #$87
	STA $87
	STA $8000
	LDA #$0D
	CLC
	ADC #$20
	STA $8001
	JSR $AB00
	JSR $A000
	INC $23
	JSR $CE48
	BCS $C6E2
	LDA $72
	ORA $73
	BNE $C6F4
	JSR $CE56
	RTS
;------------------------
	JSR $CE5E
	JSR $D06A
	JSR $CD05
	JSR $C778
	JSR $CFD5
	JSR $CC87
	JSR $D65D
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	JSR $D3F0
	LDA #$65
	CMP $B8
	BEQ $C788
	CMP $B9
	BEQ $C788
	JSR $D56A
	RTS
;------------------------
;---unidentified block---

;------------------------
	LDA #$00
	STA $A000
	LDY $56
	LDX $0465,Y
	BEQ $C79E
	LDY #$01
	LDY $C83D,X
	STY $0410
	LDA $C84D,Y
	STA $070D
	LDA #$00
	STA PpuControl_2000
	STA $02
	STA PpuMask_2001
	STA $04
	STA $04F5
	LDA $7D
	AND #$7F
	STA $B6
	LDA $7E
	AND #$7F
	STA $B7
	LDX $0410
	LDA $C85D,X
	STA $6E
	LDA $C82D,X
	STA $041C
	LDA #$00
	STA $0435
	STA $042D
	STA $1E
	STA $0442
	LDA #$00
	STA $20
	JSR $D303
	JSR $C86D
	JSR $C57D
	NOP
	NOP
	NOP
	JSR $CF72
	JSR $CEF8
	JSR $C778
	JSR $D65D
	JSR $C370
	JSR $C594
	LDA #$18
	STA $04
	LDA #$88
	STA PpuControl_2000
	STA $02
	LDA #$00
	STA $A000
	INC $89
	LDA $7D
	EOR $7E
	AND #$80
	BNE $C81C
	LDA $6A
	STA $6F
	LDA #$00
	STA $04F9
	STA $04FA
	STA $B2
	STA $B5
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$00
	STA $0445
	STA $0446
	LDA #$86
	STA $87
	STA $8000
	LDA #$00
	CLC
	ADC #$20
	STA $8001
	LDA #$87
	STA $87
	STA $8000
	LDA #$01
	CLC
	ADC #$20
	STA $8001
	JSR $8000
	RTS
;------------------------
;--------sub start-------
	LDA $B6
	CMP #$10
	BCC $C8A5
	SEC
	SBC #$10
	STA $B6
	JMP $C899
	LDA $B7
	CMP #$10
	BCC $C8B3
	SEC
	SBC #$10
	STA $B7
	JMP $C8A7
	RTS
;------------------------
	LDA $56
	BNE $C8C4
	LDA $5E
	BNE $C8C4
	INC $B2
	LDA $B2
	CMP #$30
	BCC $C8D6
	LDA #$3C
	STA $B2
	LDA #$00
	STA $B5
	LDA #$46
	STA $063E
	STA $063F
	INC $89
	RTS
;------------------------
	LDA $040A
	BNE $C8DF
	JSR $C483
	JSR $D274
	BCC $C8E6
	INC $89
	RTS
;------------------------
	LDA $B2
	BEQ $C900
	LDA $6F
	BEQ $C8F3
	JSR $D209
;---unidentified block---

;------------------------
	JMP $C964
;---unidentified block---

;------------------------
	LDA $B4
	BNE $C908
	LDA $B3
	BEQ $C964
	LDA $25
	AND #$03
	BNE $C918
	LDA #$1F
	STA $070D
	LDA #$03
	STA $070F
	LDY #$00
	LDX #$00
	LDA $B8
	CMP $B9
	BCC $C92F
	BNE $C927
	JMP $C964
;---unidentified block---

;------------------------
	STY $8B
	STX $8A
	JSR $C433
	LDX $8A
	LDA #$01
	STA $05
	LDA #$00
	STA $06
	JSR $C4AE
	LDA $8B
	EOR #$01
	STX $8A
	STA $8B
	LDA $8A
	EOR #$03
	TAX
	STX $8A
	JSR $C4C4
	JSR $C49C
	LDA $B3
	SEC
	SBC #$01
	STA $B3
	BCS $C963
	DEC $B4
	RTS
;------------------------
	INC $89
	RTS
;------------------------
	JSR $CA3E
	LDA $56
	BNE $C96E
	RTS
;------------------------
	INC $B1
	LDY #$00
	STY $7C
	JSR $C97D
;---unidentified block---

;------------------------
;--------sub start-------
	LDX #$07
	LDA $040D,Y
	CMP #$02
	BCS $C98F
	LDA $56
	BNE $C98F
	LDA $5E
	BEQ $C98F
	INX
	STX $89
	CPX #$08
	BEQ $C997
	PLA
	PLA
	RTS
;------------------------
	LDA $7C
	CMP #$10
	BCS $C9A1
	INC $7C
	RTS
;------------------------
	JSR $D292
	BCC $CA11
	LDA $B1
	CMP #$09
	BCS $C9B6
	LDA $6A
	BNE $C9B6
	LDA $89
	CMP #$08
	BEQ $CA08
	LDX #$01
	LDA $040E
	CMP $040D
	BCS $C9C1
	DEX
	STX $040C
	LDX $56
	BEQ $C9CC
	LDX #$01
	BNE $C9D4
	LDY $040C
	LDA $007D,Y
	BMI $C9E3
	LDA $0465,X
	CMP #$05
	BCC $C9E0
	LDA #$FF
	STA $0465,X
	INC $0465,X
	LDX #$02
	LDA $56
	BEQ $C9EA
	INX
	STX $40
	LDA #$0B
	STA $0410
	LDA #$00
	STA $20
	JSR $CA12
	LDA #$00
	STA $C006
	STA $0679
	STA $040D
	STA $040E
	STA $B1
	LDA #$00
	STA $067A
	STA $89
	STA $7C
	RTS
;------------------------
;--------sub start-------
	LDX #$00
	BEQ $CA18
	LDX #$80
	LDA #$F8
	STA $0300,X
	INX
	INX
	INX
	INX
	BNE $CA1A
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $7C
	CMP #$01
	BCC $CA4F
	LDA #$00
	STA $F6
	STA $F7
	STA $7C
	DEC $89
	RTS
;------------------------
	INC $7C
	RTS
;------------------------
;--------sub start-------
	LDA #$65
	CMP $B8
	BEQ $CA5C
	CMP $B9
	BNE $CA5D
	RTS
;------------------------
	LDX #$00
	STX $8B
	JSR $CA68
	INC $8B
	LDX $8B
;--------sub start-------
	LDA $72,X
	BNE $CAA6
	LDA $A1,X
	CMP #$28
	BEQ $CAA6
	LDA $B6,X
	ASL A
	CLC
	ADC $B6,X
	TAY
	STY $0422
	LDA $CAA7,Y
	BMI $CA87
	STA $0443
	JSR $CAD7
	LDY $0422
	INY
	LDA $CAA7,Y
	BMI $CA96
	STA $0443
	JSR $CADE
	LDY $0422
	INY
	INY
	LDA $CAA7,Y
	BMI $CAA6
	STA $0443
	JSR $CAE5
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$1E
	STA $0444
	BNE $CAEA
;--------sub start-------
	LDA #$17
	STA $0444
	LDX $8B
	LDA $97,X
	CMP $6E
	BNE $CB10
	JSR $CB11
;---unidentified block---

;------------------------
	RTS
;------------------------
;--------sub start-------
	LDA $0443
	ASL A
	TAY
	LDA $CBA0,Y
	STA $3B
	LDA $CBA1,Y
	STA $3C
	LDX $0443
	LDA $CB70,X
	CLC
	ADC $8B
	TAX
	STX $8A
	LDA $BC,X
	STA $12
	INC $12
	LDX $8B
	LDA $9D,X
	TAY
	LDA $2D,X
	BEQ $CB57
	CPY #$00
	BEQ $CB4B
	AND #$03
	BNE $CB47
	LDA $2D,X
	BNE $CB4B
	LDA $2D,X
	EOR #$03
	LDY $12
	LDX $8A
	CMP ($3B),Y
	BEQ $CB5D
	LDA #$00
	STA $BC,X
	JSR $CC6C
	PLA
	PLA
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDX $8A
	LDA $CE,X
	CMP #$0F
	BCC $CC84
	LDA #$00
	STA $CE,X
	LDA $BC,X
	CMP $DF,X
	BNE $CC82
	LDA #$00
	STA $BC,X
	STA $DF,X
	INC $CE,X
	RTS
;------------------------
;--------sub start-------
	LDY #$00
	JSR $CC8D
	INY
;--------sub start-------
	LDA $00A1,Y
	CMP #$2A
	BNE $CC9F
	LDA $007D,Y
	BPL $CCA3
	LDA #$00
	STA $6F
	BEQ $CCA3
	CMP #$29
	BNE $CCB3
	LDA $00A3,Y
	CMP #$0B
	BCC $CCB3
	LDA #$05
	STA $89
	JSR $D5FC
	PLA
	PLA
	RTS
;------------------------
;--------sub start-------
	LDY $8B
	STA $00A1,Y
	LDA #$00
	STA $00A3,Y
	STY $9F
	LDA $6E
	STA $0097,Y
	RTS
;------------------------
;--------sub start-------
	LDY #$00
	STY $8B
	JSR $CCD0
	INY
	STY $8B
;--------sub start-------
	LDA #$65
	CMP $B8
	BEQ $CCDA
	CMP $B9
	BNE $CCEC
	LDA #$00
	STA $72
	STA $73
	STA $75
	STA $70
	STA $71
	LDA #$01
	STA $0442
	RTS
;------------------------
	JSR $D165
	JSR $CDE4
	JSR $CD72
	JSR $CDA7
	JSR $D1BC
	JSR $D0B3
	JSR $D0E9
	JSR $CD28
	RTS
;------------------------
;--------sub start-------
	LDX #$00
	JSR $CD0B
	INX
;--------sub start-------
	LDA $F0,X
	CMP #$03
	BCS $CD27
	LDA $A1,X
	CMP #$09
	BEQ $CD1B
	CMP #$0A
	BNE $CD27
	LDA $A3,X
	CMP #$01
	BNE $CD27
	INC $F0,X
	LDA #$00
	STA $F4,X
	RTS
;------------------------
;--------sub start-------
	LDY $8B
	LDA $00F0,Y
	CMP #$03
	BCC $CD4C
	LDA $00A1,Y
	CMP #$27
	BNE $CD4C
	LDA $00A3,Y
	CMP #$01
	BNE $CD4C
	LDA #$28
	STA $00A1,Y
	LDA #$00
	STA $00F0,Y
	STA $00A3,Y
	LDA $00F4,Y
	CMP #$70
	BCC $CD68
	LDA #$00
	STA $00F4,Y
	LDA $00F0,Y
	CMP $00F2,Y
	BNE $CD65
	LDA #$00
	STA $00F0,Y
	STA $00F2,Y
	LDA $00F4,Y
	CLC
	ADC #$01
	STA $00F4,Y
	RTS
;------------------------
;--------sub start-------
	LDA $00A1,Y
	CMP #$06
	BNE $CDA6
	LDX #$0E
	LDA $002D,Y
	AND #$40
	BEQ $CD89
	LDA #$07
	STA $070F
	BNE $CD98
	LDA $002D,Y
	AND #$80
	BEQ $CDA6
	LDA #$08
	STA $070F
	INX
	INX
	INX
	LDA $00A3,Y
	CMP #$07
	BCC $CDA0
	INX
	TXA
	STA $00A1,Y
	STY $9F
	RTS
;------------------------
;--------sub start-------
	LDX #$19
	LDA $00A1,Y
	CMP #$07
	BEQ $CDB9
	LDA $00A1,Y
	CMP #$08
	BNE $CDE3
	LDX #$1F
	LDA $002D,Y
	AND #$80
	BEQ $CDC7
	LDA #$08
	STA $070F
	BNE $CDD5
	LDA $002D,Y
	AND #$40
	BEQ $CDE3
	LDA #$07
	STA $070F
	INX
	INX
	LDA $00A3,Y
	CMP #$07
	BCC $CDDD
	INX
	TXA
	STA $00A1,Y
	STY $9F
	RTS
;------------------------
;--------sub start-------
	JSR $D0A3
	LDA $002A,Y
	AND #$04
	BNE $CE11
	LDA $002D,Y
	AND #$40
	BEQ $CE05
	LDX #$0C
	LDA $AF
	CMP #$1B
	BCC $CDFE
	DEX
	TXA
	JSR $CCB4
	JMP $CD72
	LDA $002D,Y
	AND #$80
	BEQ $CE11
	JSR $CE14
	BNE $CDFE
	JMP $CD72
;--------sub start-------
	LDA $AF
	CMP #$1E
	BCS $CE45
	LDA #$01
	LDX $9D,Y
	BEQ $CE22
	LDA #$02
	AND $002A,Y
	BEQ $CE42
	TYA
	EOR #$01
	TAX
	LDA $9D,X
	CMP $009D,Y
	BEQ $CE42
	LDA $97,X
	CMP $6E
	BNE $CE42
	LDX $B6,Y
	LDA $DC83,X
	BNE $CE42
	LDX #$18
	RTS
;------------------------
	LDX #$25
	RTS
;------------------------
	LDX #$10
	RTS
;------------------------
;--------sub start-------
	LDA $A7
	CMP $A5
	BCC $CE53
	LDA #$00
	STA $A7
	RTS
;------------------------
	INC $A7
	RTS
;------------------------
;--------sub start-------
	LDA $5E
	BEQ $CE5D
	JSR $C29C
	RTS
;------------------------
;--------sub start-------
	LDA $7C
	BEQ $CE70
	LDA #$02
	STA $070F
	LDA #$00
	STA $7C
	INC $89
	RTS
;------------------------
;---unidentified block---

;------------------------
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $95
	CMP $96
	BCS $CED6
	LDA $96
	SEC
	SBC $95
	BNE $CED9
	SEC
	SBC $96
	STA $AF
	LDX #$00
	LDA $97
	CMP $98
	BCS $CEEA
	LDA $98
	SEC
	SBC $97
	BNE $CEEE
	INX
	SEC
	SBC $98
	STA $B0
	STX $A0
	LDA #$1C
	STA $067B
	RTS
;------------------------
;--------sub start-------
	LDA #$02
	STA $A5
	LDA #$00
	STA $066C
	STA $066D
	STA $B5
	STA $B2
	STA $A1
	STA $A2
	STA $A3
	STA $A4
	STA $92
	STA $94
	STA $9D
	STA $B8
	STA $B9
	STA $BA
	STA $BB
	STA $F0
	STA $F1
	STA $8E
	STA $0411
	STA $70
	STA $71
	STA $72
	STA $73
	STA $74
	STA $75
	STA $FC
	STA $FD
	LDA #$40
	STA $90
	STA $0414
	LDA #$01
	STA $9E
	LDA #$90
	STA $91
	LDA #$F0
	STA $93
	LDA $6E
	STA $97
	STA $98
	STA $7F
	STA $80
	LDA #$00
	TAX
	STA $BC,X
	INX
	CPX #$3C
	BCC $CF57
	JSR $C897
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDY $0410
	LDX $CF62,Y
	STX $34
	INX
	INX
	STX $35
	LDA $0410
	ASL A
	TAY
	LDA $DDC7,Y
	STA $12
	LDA $DDC8,Y
	STA $13
	LDY #$00
	LDX #$00
	LDA ($12),Y
	STA $0640,X
	INX
	INY
	CPY #$10
	BCC $CF91
	LDX #$10
	LDA $B6
	JSR $CFBB
	LDX #$18
	LDA $B7
	CMP $B6
	BNE $CFAE
	CLC
	ADC #$10
	JSR $CFBB
	LDX $0410
	LDA $DDB3,X
	STA $0650
	RTS
;------------------------
;--------sub start-------
	ASL A
	TAY
	LDA $DC93,Y
	STA $12
	LDA $DC94,Y
	STA $13
	LDY #$00
	LDA ($12),Y
	STA $0640,X
	INX
	INY
	CPY #$08
	BCC $CFC9
	RTS
;------------------------
;--------sub start-------
	LDA $73
	AND #$7F
	CMP #$27
	BEQ $D01F
	CMP #$29
	BEQ $D01F
	LDA $A1
	CMP #$06
	BCC $CFF7
	CMP #$26
	BCC $D01F
	CMP #$2E
	BEQ $D01F
	CMP #$18
	BEQ $D01F
	CMP #$31
	BEQ $D01F
	LDX #$00
	SEC
	LDA $91
	SBC $93
	LDA $92
	SBC $94
	BMI $D005
	INX
	STX $9D
	CPX $0463
	BEQ $D01F
	STX $0463
	LDA $A1
	CMP #$03
	BNE $D01F
	LDA #$00
	STA $A1
	STA $A3
	LDA $6E
	STA $97
	LDA $72
	AND #$7F
	CMP #$27
	BEQ $D069
	CMP #$29
	BEQ $D069
	LDA $A2
	CMP #$06
	BCC $D041
	CMP #$26
	BCC $D069
	CMP #$2E
	BEQ $D069
	CMP #$18
	BEQ $D069
	CMP #$31
	BEQ $D069
	LDX #$00
	SEC
	LDA $91
	SBC $93
	LDA $92
	SBC $94
	BPL $D04F
	INX
	STX $9E
	CPX $0464
	BEQ $D069
	STX $0464
	LDA $A2
	CMP #$03
	BNE $D069
	LDA #$00
	STA $A2
	STA $A4
	LDA $6E
	STA $98
	RTS
;------------------------
;--------sub start-------
	CLC
	LDA $91
	ADC $93
	STA $12
	LDA $92
	ADC $94
	STA $13
	LSR $13
	ROR $12
	LDA $12
	SEC
	SBC #$80
	STA $12
	LDA $13
	SBC #$00
	STA $13
	BNE $D096
	LDX $0410
	LDA $12
	CMP $D097,X
	BCS $D096
	STA $90
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $00A1,Y
	BEQ $D0B2
;--------sub start-------
	CMP #$02
	BCC $D0B0
	CMP #$06
	BCC $D0B2
	PLA
	PLA
	RTS
;------------------------
;--------sub start-------
	JSR $D0A3
	LDA $002A,Y
	AND #$08
	BEQ $D0E4
	LDA $002A,Y
	AND #$01
	BEQ $D0D1
	LDX #$08
	LDA $009D,Y
	BNE $D0CC
	DEX
	TXA
	JSR $CCB4
	RTS
;------------------------
	LDA $002A,Y
	AND #$02
	BEQ $D0E5
	LDX #$08
	LDA $009D,Y
	BEQ $D0E0
	DEX
	TXA
	JSR $CCB4
	RTS
;------------------------
	LDA #$06
	BNE $D0E1
;--------sub start-------
	LDA $00A1,Y
	BEQ $D0F6
	CMP #$03
	BEQ $D0F6
	CMP #$04
	BNE $D124
	TYA
	EOR #$01
	TAX
	LDA $72,X
	AND #$7F
	BNE $D108
	LDA $A1,X
	TAX
	LDA $D125,X
	BEQ $D124
	LDA #$01
	LDX $9D,Y
	BNE $D110
	LDA #$02
	AND $002A,Y
	BEQ $D124
	LDA #$05
	STA $00A1,Y
	LDA #$00
	STA $00A3,Y
	LDA $6E
	STA $0097,Y
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $56
	BNE $D196
	LDA $007D,Y
	AND #$80
	BNE $D196
	LDA $00A1,Y
	BNE $D1AB
	LDA $8E
	BNE $D1AB
	LDA $002A,Y
	AND #$01
	BEQ $D197
	LDX #$04
	LDA $009D,Y
	BNE $D188
	DEX
	TXA
	STA $00A1,Y
	LDA #$00
	STA $00A3,Y
	LDA $6E
	STA $0097,Y
	RTS
;------------------------
	LDA $002A,Y
	AND #$02
	BEQ $D1AB
	LDX #$04
	LDA $009D,Y
	BEQ $D1A6
	DEX
	TXA
	JSR $CCB4
	RTS
;------------------------
	LDA $002A,Y
	AND #$03
	BNE $D1AA
	LDA $00A1,Y
	JSR $D0A8
	LDA #$00
	BEQ $D1A7
;--------sub start-------
	TYA
	EOR #$01
	TAX
	LDA $00A1,Y
	CMP #$06
	BCS $D208
	LDA $002A,Y
	AND #$04
	BEQ $D208
	LDA $002D,Y
	AND #$80
	BEQ $D1D9
	LDA #$13
	BNE $D205
	LDA $002D,Y
	AND #$40
	BEQ $D1E4
	LDA #$14
	BNE $D205
	LDA $A1,X
	CMP #$0B
	BCC $D203
	CMP #$26
	BCS $D203
	CMP #$18
	BEQ $D203
	LDA #$01
	LDX $9D,Y
	BNE $D1FA
	LDA #$02
	AND $002A,Y
	BEQ $D203
	LDA #$02
	BNE $D205
	LDA #$01
	JSR $CCB4
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDX $040A
	CPX #$07
	BCS $D291
	LDY $040B
	BNE $D285
	LDY #$01
	STY $040B
	DEC $040B
	BNE $D290
	JSR $D2B7
	INC $040A
	CLC
	RTS
;------------------------
;--------sub start-------
	LDX $040A
	BEQ $D2B5
	LDY $040B
	BNE $D2A1
	LDY #$01
	STY $040B
	DEC $040B
	BNE $D2B3
	DEC $040A
	DEX
	JSR $D2B7
	CPX #$00
	BNE $D2B3
	STX $04
	CLC
	RTS
;------------------------
	SEC
	RTS
;------------------------
;--------sub start-------
	LDY $0409
	LDA $0640,Y
	CMP $D2EA,X
	BCS $D2C6
	LDA #$0E
	BCC $D2CE
	LDA $D2EA,X
	EOR #$3F
	AND $0640,Y
	STA $0600,Y
	DEY
	BPL $D2BA
	LDA $D2F1,X
	STA $04
	LDA #$3F
	STA $44
	LDA #$00
	STA $43
	LDA #$01
	STA $45
	LDA #$20
	STA $46
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$F8
	LDX #$00
	STA $0200,X
	STA $0300,X
	INX
	INX
	INX
	INX
	BNE $D307
	RTS
;------------------------
;--------sub start-------
	LDA #$00
	LDX #$18
	ASL $07
	ROL $08
	ROL $09
	ROL A
	CMP $16
	BCC $D327
	SBC $16
	INC $07
	DEX
	BNE $D318
	STA $12
	RTS
;------------------------
;--------sub start-------
	LDY #$00
	STY $17
	LDA #$0A
	STA $16
	JSR $D314
	LDA $12
	CLC
	ADC $0D
	STA $0673,Y
	INY
	CPY #$05
	BCC $D335
	RTS
;------------------------
;--------sub start-------
	TYA
	EOR #$01
	TAX
	LDA $72,X
	AND #$7F
	CMP #$27
	BEQ $D356
	CMP #$29
	BNE $D357
	RTS
;------------------------
	LDX $8A
	LDA $A2
	CMP #$03
	BNE $D366
	LDA $A1
	CMP #$03
	BNE $D366
	RTS
;------------------------
	LDA $89
	CMP #$03
	BNE $D39E
	LDA $00A1,Y
	CMP #$06
	BCC $D377
	CMP #$28
	BNE $D39E
	LDA $AF
	CMP #$18
	BCS $D39E
	LDA $B0
	CMP #$10
	BCS $D39E
	LDA #$04
	STA $12
;--------sub start-------
	LDA $009D,Y
	BNE $D39F
	LDA $0095,Y
	CMP #$20
	BCC $D39E
	LDA $91,X
	SEC
	SBC $12
	STA $91,X
	BCS $D39E
	DEC $92,X
	RTS
;------------------------
	LDA $0095,Y
	CMP #$E0
	BCS $D39E
	LDA $91,X
	CLC
	ADC $12
	STA $91,X
	BCC $D39E
	INC $92,X
	RTS
;------------------------
;--------sub start-------
	NOP
	LDA $AF
	CMP #$50
	BCC $D3BE
	LDA #$00
	STA $8E
	RTS
;------------------------
	LDA $8E
	BNE $D3DC
	LDA $00A1,Y
	CMP #$2D
	BEQ $D3D5
	CMP #$30
	BEQ $D3D5
	CMP #$0A
	BEQ $D3D5
	CMP #$2E
	BNE $D3EF
	LDA $00A3,Y
	CMP #$02
	BNE $D3EF
	LDA #$01
	STA $8E
	TYA
	EOR #$01
	TAY
	TXA
	EOR #$02
	TAX
	LDA #$08
	STA $12
	JSR $D387
	RTS
;------------------------
;--------sub start-------
	LDX #$00
	STX $8A
	STX $8B
	JSR $D400
	LDX #$02
	STX $8A
	DEX
	STX $8B
;--------sub start-------
	LDY $8B
	LDX $B6,Y
	LDA $DC73,X
	STA $0D
	AND #$7F
	STA $05
	LDA #$86
	STA $87
	STA $8000
	LDA $05
	CLC
	ADC #$20
	STA $8001
	LDA $0D
	BMI $D42B
	LDA $8000
	STA $3D
	LDA $8001
	JMP $D433
	LDA $9000
	STA $3D
	LDA $9001
	STA $3E
	LDA $00A1,Y
	ASL A
	BCC $D43D
	INC $3E
	TAY
	LDA ($3D),Y
	STA $3B
	INY
	LDA ($3D),Y
	STA $3C
	LDY #$00
	LDA ($3B),Y
	ASL A
	TAX
	LDA $E000,X
	STA $3D
	LDA $E001,X
	STA $3E
	LDY $8B
	LDA $00A3,Y
	ASL A
	TAY
	LDA ($3D),Y
	STA $05
	INY
	LDA ($3D),Y
	STA $06
	INY
	LDA #$00
	STA $18
	LDA ($3D),Y
	CMP #$80
	BNE $D474
	INC $18
	LDX $8A
	LDY $8B
	TYA
	EOR #$01
	TAY
	LDA $0072,Y
	LDY $8B
	AND #$7F
	CMP #$2D
	BCS $D4D0
	LDA $05
	BPL $D4AD
	EOR #$FF
	STA $05
	INC $05
	LDA $009D,Y
	BNE $D4B2
	LDA $0095,Y
	SEC
	SBC $05
	CMP #$20
	BCC $D4C7
	LDA $91,X
	SEC
	SBC $05
	STA $91,X
	BCS $D4C7
	DEC $92,X
	BEQ $D4C7
	LDA $009D,Y
	BNE $D496
	LDA $0095,Y
	CLC
	ADC $05
	CMP #$E0
	BCS $D4C7
	LDA $91,X
	CLC
	ADC $05
	STA $91,X
	BCC $D4C7
	INC $92,X
	LDA $0097,Y
	CLC
	ADC $06
	STA $0097,Y
	LDY $8B
	LDA $00A3,Y
	TAY
	INY
	LDA ($3B),Y
	STA $12
	LDA $0D
	BMI $D4E9
	LDA $8002
	STA $3D
	LDA $8003
	BNE $D4F1
	LDA $9002
	STA $3D
	LDA $9003
	STA $3E
	LDA $12
	ASL A
	BCC $D4FA
	INC $3E
	TAY
	LDX $8A
	LDA ($3D),Y
	STA $76,X
	INY
	LDA ($3D),Y
	STA $77,X
	LDY $8B
	JSR $D346
	JSR $D3B2
	LDY $8B
	LDA $D63B,Y
	STA $045B,Y
	LDX $8A
	LDA $009D,Y
	BEQ $D51F
	LDA #$40
	STA $0461,Y
	LDA $91,X
	SEC
	SBC $90
	STA $0095,Y
	STA $045D,Y
	LDX #$08
	STX $12
	LDA $0097,Y
	SEC
	SBC $12
	STA $045F,Y
	LDX $8B
	TXA
	EOR #$01
	TAY
	LDA $0072,Y
	AND #$7F
	CMP #$2D
	BCS $D569
	INC $A3,X
	LDY $A1,X
	LDA $A3,X
	CMP #$01
	BNE $D55B
	LDA $D5C5,Y
	BEQ $D55B
	STA $070F
	LDA $18
	BEQ $D569
	LDA #$00
	STA $A1,X
	STA $A3,X
	LDA $6E
	STA $97,X
	RTS
;------------------------
;--------sub start-------
	LDY #$00
	STY $8B
	JSR $D575
	LDY #$01
	STY $8B
;--------sub start-------
	LDA $0097,Y
	CMP $6E
	BCC $D58A
	CMP $007F,Y
	BEQ $D58A
	STA $007F,Y
	LDA #$05
	STA $070F
	RTS
;------------------------
	STA $007F,Y
	LDY $8B
	LDA $00A1,Y
	CMP #$17
	BEQ $D5A4
	CMP #$0D
	BEQ $D5A4
	CMP #$18
	BEQ $D5A4
	CMP #$1E
	BEQ $D5A4
	BNE $D5B1
	LDA $00A3,Y
	CMP #$03
	BNE $D5B1
	LDA #$04
	STA $070F
	RTS
;------------------------
	LDA $00A1,Y
	CMP #$0D
	BNE $D5C4
	LDA $00A3,Y
	CMP #$04
	BNE $D5C4
	LDA #$11
	STA $070F
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $56
	BEQ $D609
	LDA #$00
	STA $B2
	STA $B3
	STA $B4
	RTS
;------------------------
	LDA #$01
	STA $B4
	LDA $B2
	CLC
	ADC #$2C
	STA $B3
	BCC $D618
	INC $B4
	LDX $B8
	CPX $B9
	BCC $D620
	LDX $B9
	DEX
	BEQ $D608
	LDA $B3
	SEC
	SBC #$01
	STA $B3
	BCS $D62E
	DEC $B4
	JMP $D620
;---unidentified block---

;------------------------
;--------sub start-------
	LDY #$00
	STY $8B
	STY $8A
	LDA $73
	AND #$7F
	CMP #$2D
	BCS $D67A
	LDA $72
	BEQ $D67A
	JSR $D8F3
	BCC $D67A
	LDA $25
	AND #$01
	BEQ $D6DA
	LDX $B6
	LDA $DC73,X
	STA $05
	LDA #$86
	STA $87
	STA $8000
	LDA $05
	CLC
	ADC #$20
	STA $8001
	LDA $76
	STA $3B
	LDA $77
	STA $3C
	LDY #$00
	LDA ($3B),Y
	AND #$7F
	TAX
	LDA $D63D,X
	STA $99
	INY
	LDA ($3B),Y
	TAX
	LDA $D63D,X
	STA $9B
	LDY #$04
	LDA ($3B),Y
	AND #$1F
	STA $0A
	LDA ($3B),Y
	AND #$20
	BEQ $D6C3
	LDA $0A
	EOR #$FF
	STA $0A
	INC $0A
	LDA $045B
	STA $1A
	LDA $045D
	STA $07
	LDA $045F
	CLC
	ADC $0A
	STA $0A
	LDA $0461
	STA $1B
	JSR $D75B
	LDY #$02
	STY $8A
	DEY
	STY $8B
	LDA $72
	AND #$7F
	CMP #$2D
	BCS $D6FB
	LDA $73
	BEQ $D6FB
	JSR $D8F3
	BCC $D6FB
	LDA $25
	AND #$01
	BNE $D75B
	LDX $B7
	LDA $DC73,X
	STA $05
	LDA #$86
	STA $87
	STA $8000
	LDA $05
	CLC
	ADC #$20
	STA $8001
	LDA $78
	STA $3B
	LDA $79
	STA $3C
	LDY #$00
	LDA ($3B),Y
	AND #$7F
	TAX
	LDA $D63D,X
	STA $9A
	INY
	LDA ($3B),Y
	TAX
	LDA $D63D,X
	STA $9C
	LDY #$04
	LDA ($3B),Y
	AND #$1F
	STA $0A
	LDA ($3B),Y
	AND #$20
	BEQ $D744
	LDA $0A
	EOR #$FF
	STA $0A
	INC $0A
	LDA $045C
	STA $1A
	LDA $045E
	STA $07
	LDA $0460
	CLC
	ADC $0A
	STA $0A
	LDA $0462
	STA $1B
;--------sub start-------
	LDA #$87
	STA $87
	STA $8000
	LDA #$0D
	CLC
	ADC #$20
	STA $8001
	LDY $8B
	LDX $D63B,Y
	LDY #$00
	LDA #$F8
	STA $0300,X
	INX
	INX
	INX
	INX
	INY
	CPY #$20
	BCC $D773
	LDY #$00
	LDX $8B
	LDA ($3B),Y
	STA $6C,X
	AND #$7F
	STA $05
	INY
	LDA ($3B),Y
	STA $06
	INY
	LDA ($3B),Y
	STA $0F
	INY
	LDA ($3B),Y
	STA $A9,X
	STA $0429
	INY
	LDA ($3B),Y
	AND #$C0
	EOR $1B
	STA $042A
	INY
	LDA ($3B),Y
	AND #$7F
	STA $FC,X
	LDA #$00
	STA $1C
	STA $18
	STA $16
	LDA $05
	STA $09
	LDA $042A
	BNE $D7DD
	LDA $0F
	BPL $D7D0
	AND #$7F
	CLC
	ADC $07
	STA $07
	STA $08
	BCC $D80B
	BCS $D803
	LDA $07
	SEC
	SBC $0F
	STA $07
	STA $08
	BCC $D803
	BCS $D80B
	LDA $0F
	BPL $D7F5
	AND #$7F
	STA $0F
	LDA $07
	SEC
	SBC #$08
	SEC
	SBC $0F
	STA $07
	STA $08
	BCC $D803
	BCS $D80B
	LDA $07
	SEC
	SBC #$08
	CLC
	ADC $0F
	STA $07
	STA $08
	BCC $D80B
	LDA #$01
	STA $1C
	STA $16
	STA $18
	LDX $06
	LDA $0A
	SEC
	SBC $D63D,X
	STA $0A
	STA $0B
	DEC $0B
	LDY $0429
	LDX $8B
	LDA $B000,Y
	STA $3D
	LDA $B001,Y
	STA $3E
	LDA #$00
	TAX
	LDY $8B
	BEQ $D833
	LDX #$80
	LDA #$02
	STX $0D
	ORA $042A
	STA $0E
	LDY #$06
	STY $14
	LDX $1A
	LDY $14
	LDA ($3B),Y
	CMP #$FF
	BEQ $D886
	AND #$7F
	ORA $0D
	STA $0301,X
	LDA $0301,X
	AND #$07
	TAY
	LDA $D631,Y
	STA $15
	LDA $0301,X
	AND #$7F
	LSR A
	LSR A
	LSR A
	TAY
	LDA $15
	AND ($3D),Y
	BEQ $D86B
	LDA #$01
	ORA $0E
	STA $0302,X
	LDA $18
	BEQ $D878
	LDA #$F8
	BNE $D87F
	LDA $08
	STA $0303,X
	LDA $0B
	STA $0300,X
	INX
	INX
	INX
	INX
	INC $14
	LDA $042A
	BNE $D8A4
	LDA $08
	CLC
	ADC #$08
	STA $08
	LDY $16
	BNE $D8A0
	BCC $D8BF
	LDA #$01
	STA $16
	BCS $D8C1
	BCC $D8C1
	BCS $D8BB
	LDA $08
	SEC
	SBC #$08
	STA $08
	LDY $16
	BNE $D8B7
	BCS $D8BF
	LDA #$01
	STA $16
	BNE $D8C1
	LDA #$01
	BCS $D8C1
	LDA #$00
	STA $16
	LDA #$00
	STA $18
	DEC $09
	BNE $D8F0
	LDA $1C
	STA $16
	STA $18
	LDA $0B
	CLC
	ADC #$08
	STA $0B
	LDA $05
	STA $09
	LDA $07
	STA $08
	DEC $06
	BNE $D8F0
	LDA #$87
	STA $87
	STA $8000
	LDA #$01
	CLC
	ADC #$20
	STA $8001
	RTS
;------------------------
	JMP $D840
;--------sub start-------
	LDX $74,Y
	BEQ $D902
	LDA $25
	AND #$00
	BNE $D952
	INX
	STX $74,Y
	BNE $D952
	LDA $0072,Y
	BMI $D922
	TAX
	LDA #$00
	STA $1B
	LDY $8A
	LDA $0092,Y
	STA $0437,Y
	LDA $0091,Y
	STA $0436,Y
	LDA $0437,Y
	ADC #$00
	JMP $D93C
;---unidentified block---

;------------------------
	STA $0437,Y
	LDY $8B
	LDA $0097,Y
	STA $043C,Y
	JSR $D9E3
	LDX $74,Y
	INX
	STX $74,Y
	JMP $D955
	JSR $D9E3
	LDX $8A
	LDA $0436,X
	SEC
	SBC $90
	STA $043A,Y
	STA $07
	LDA $043C,Y
	STA $0A
	LDA $D63B,Y
	STA $1A
	LDX #$00
	LDA $0072,Y
	BPL $D97B
	LDY #$05
	LDA ($3B),Y
	BMI $D97B
	LDX #$40
	STX $1B
	LDY #$04
	LDA ($3B),Y
	AND #$0F
	STA $0B
	LDA ($3B),Y
	AND #$10
	BEQ $D993
	LDA $0B
	EOR #$FF
	STA $0B
	INC $0B
	LDA $0A
	CLC
	ADC $0B
	STA $0A
	LDY #$00
	LDA ($3B),Y
	TAX
	LDA $D63D,X
	LDY $8B
	STA $043E,Y
	LDY #$01
	LDA ($3B),Y
	TAX
	LDA $D63D,X
	LDY $8B
	STA $0440,Y
	LDA $0072,Y
	AND #$01
	BNE $D9CC
	TYA
	EOR #$01
	TAX
	LDA $A1,X
	CMP #$27
	BEQ $D9CC
	CMP #$29
	BEQ $D9CC
	JSR $DAD3
	LDA $043A,Y
	CMP #$F8
	BCS $D9D7
	CMP #$08
	BCS $D9E1
	LDA #$00
	STA $0072,Y
	STA $0074,Y
	CLC
	RTS
;------------------------
	SEC
	RTS
;------------------------
;--------sub start-------
	LDA $0072,Y
	ASL A
	TAY
	LDA #$86
	STA $87
	STA $8000
	LDA #$0A
	CLC
	ADC #$20
	STA $8001
	LDA $8000,Y
	STA $3D
	LDA $8001,Y
	STA $3E
	LDY $8B
	LDA $0074,Y
	ASL A
	ASL A
	TAY
	LDA ($3D),Y
	CMP #$80
	BEQ $DA32
	AND #$C0
	CMP #$80
	BNE $DA40
	LDA ($3D),Y
	AND #$3F
	LDY $8B
	STA $05
	LDA $0074,Y
	SEC
	SBC $05
	STA $0074,Y
	BPL $DA06
	LDA #$FF
	STA $0074,Y
	LDA #$00
	JMP $DA06
	LDA #$00
	LDY $8B
	STA $0072,Y
	STA $0074,Y
	CLC
	PLA
	PLA
	RTS
;------------------------
	LDA ($3D),Y
	STA $07
	INY
	LDA ($3D),Y
	STA $0A
	INY
	LDA ($3D),Y
	STA $3B
	INY
	LDA ($3D),Y
	STA $3C
	LDY $8B
	LDA $0A
	CLC
	ADC $043C,Y
	STA $043C,Y
	LDX $8A
	LDA $07
	BPL $DA7E
	EOR #$FF
	STA $07
	INC $07
	LDA $0072,Y
	BMI $DA83
	LDA $0436,X
	SEC
	SBC $07
	STA $0436,X
	BCS $DA91
	DEC $0437,X
	RTS
;------------------------
	LDA $0072,Y
	BMI $DA6F
	LDA $0436,X
	CLC
	ADC $07
	STA $0436,X
	BCC $DA91
	INC $0437,X
	RTS
;------------------------
;--------sub start-------
	LDA $043E,Y
	STA $05
	LDA $0440,Y
	STA $06
	LDA $043A,Y
	CMP $95,X
	BCS $DAAF
	LDA $95,X
	SEC
	SBC $043A,Y
	CMP $05
	BCS $DAC7
	BCC $DAB6
	SEC
	SBC $95,X
	CMP $05
	BCS $DAC7
	LDA $043C,Y
	CMP $97,X
	BCS $DAC9
	LDA $97,X
	SEC
	SBC $043C,Y
	CMP $9B,X
	BCC $DAD1
	CLC
	RTS
;------------------------
;---unidentified block---

;------------------------
	SEC
	RTS
;------------------------
;--------sub start-------
	JSR $DA92
	BCC $DB3D
	LDA $A1,X
	CMP #$2B
	BEQ $DB3A
	CMP #$2C
	BEQ $DB3A
	CMP #$02
	BEQ $DB1A
	CMP #$05
	BEQ $DB12
	LDA #$01
	STA $7C
	LDA $0072,Y
	AND #$7F
	TAY
	LDA $DB40,Y
	LDA #$10
	STA $BA,X
	TXA
	EOR #$01
	TAY
	LDA #$01
	STA $00F6,Y
	LDA $97,X
	CMP $6E
	BNE $DB0E
	LDA #$30
	BNE $DB20
	LDA #$2E
	BNE $DB20
	LDA #$03
	STA $BA,X
	LDA #$2C
	BNE $DB20
	LDA #$03
	STA $BA,X
	LDA #$2B
	STA $A1,X
	LDA #$00
	STA $A3,X
	LDA $6E
	STA $97,X
	LDA $0072,Y
	CLC
	ADC #$01
	STA $0072,Y
	LDA #$01
	STA $0074,Y
	BNE $DB3D
	CLC
	PLA
	PLA
	LDY $8B
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDX $FC
	BEQ $DBA3
	TXA
	ASL A
	ASL A
	ASL A
	TAX
	INX
	LDY #$01
	LDA $DEB1,X
	STA PpuData_2007
	INX
	INY
	CPY #$08
	BCC $DB7D
	RTS
;------------------------
;--------sub start-------
	LDX $FD
	BEQ $DBA3
	TXA
	ASL A
	ASL A
	ASL A
	TAX
	INX
	LDY #$01
	LDA $DF41,X
	STA PpuData_2007
	INX
	INY
	CPY #$08
	BCC $DB96
	RTS
;------------------------
	ASL A
	TAY
	LDA $DC93,Y
	STA $12
	LDA $DC94,Y
	STA $13
	LDY #$01
	LDA ($12),Y
	STA PpuData_2007
	INY
	CPY #$08
	BCC $DBB1
	RTS
;------------------------
;--------sub start-------
	LDA $89
	BNE $DBEC
	LDA $7D
	STA $B6
	JSR $CF72
	LDA #$02
	STA $A5
	LDA #$40
	STA $90
	LDA #$90
	STA $91
	LDA #$F0
	STA $93
	LDA #$DA
	STA $6E
	STA $97
	STA $98
	JSR $C778
	JSR $D65D
	LDA #$03
	STA $89
	JMP $DC1F
	LDA $A3
	BNE $DC10
	LDA #$87
	STA $87
	STA $8000
	LDA #$0D
	CLC
	ADC #$20
	STA $8001
	JSR $A000
	LDA $22
	AND #$3F
	TAX
	LDA $DC33,X
	STA $A1
	LDA #$00
	STA $A3
	LDA #$70
	STA $AF
	JSR $CE48
	BCC $DC1C
	JSR $C778
	JSR $D65D
	LDA #$F8
	LDX #$80
	STA $0200,X
	STA $0300,X
	INX
	INX
	INX
	INX
	BNE $DC23
	STA $070F
	RTS
;------------------------
;---unidentified block---

;------------------------
;----------main----------
	SEI					; Set interrupt disable flag
	CLD					; Clear decimal mode (2A03 does not have it due to MOS patent) flag
	LDX #$FF			; Load $FF into X
	TXS					; Transfer X to stack pointer
	LDA #$00			; Load $00 into accumulator
	STA PpuMask_2001
	STA PpuControl_2000
	STA $8000
	LDA #$00
	STA ApuStatus_4015
	STA $5000
	LDA PpuStatus_2002
	LDA #$01
	STA $A000
	STA $A000
	LDA PpuStatus_2002
	BMI $E573
	LDA PpuStatus_2002
	BPL $E578
	LDA #$0F
	STA ApuStatus_4015
	LDA #$00
	STA DmcFreq_4010
	LDA #$40
	STA Ctrl2_FrameCtr_4017
	LDA #$00
	STA $0100
	STA $E000
	LDA PpuStatus_2002
	LDA #$10
	TAX
	STA PpuAddr_2006
	STA PpuAddr_2006
	EOR #$00
	DEX
	BNE $E59A
	STA $E000
	LDA #$00
	STA $0100
	LDA #$00
	STA $042D
	LDA #$0C
	STA $0410
	JSR $E7A7
	LDA #$02
	STA $042C
	JSR $D303
	LDA #$86
	STA $0087
	STA $8000
	LDA #$0B
	CLC
	ADC #$20
	STA $8001
	LDA #$87
	STA $0087
	STA $8000
	LDA #$0C
	CLC
	ADC #$20
	STA $8001
	JSR $85C4
	LDA #$00
	STA $28
	LDA #$01
	STA $0081
	LDA #$88
	STA $0406
	LDA #$13
	STA $0407
	LDA #$00
	STA $0408
	LDA #$01
	STA $041A
	LDA #$00
	STA $0416
	LDA #$02
	STA $0419
	LDA #$1F
	STA $0409
	LDA #$00
	STA $0435
	LDA #$4C
	STA $0423
	CLI
	LDA #$88
	STA $02
	STA PpuControl_2000
	LDA #$00
	STA $04
	STA PpuMask_2001
	LDA PpuStatus_2002
	INC $22
	LDA $0082
	BEQ $E62D
	DEC $0082
	LDA #$01
	STA $0088
	JSR $F992
	JSR $FB15
	LDA $06E0
	BNE $E64F
	LDA $04F5
	BEQ $E64F
	BIT $F083
	LDA #$86
	STA $0087
	STA $8000
	LDA #$0B
	CLC
	ADC #$20
	STA $8001
	LDA #$87
	STA $0087
	STA $8000
	LDA #$0C
	CLC
	ADC #$20
	STA $8001
	LDA $06DF
	BEQ $E679
	LDA #$00
	STA $070D
	LDA $06E1
	BEQ $E683
	LDA #$00
	STA $070F
	JSR $864A
	LDA #$00
	STA $0088
	JMP $E62D
;----------nmi---------
	PHP					; Push processor status on stack
	PHA					; Push accumulator on stack
	TXA					; Transfer X to accumulator
	PHA					; Push accumulator on stack
	TYA					; Transfer Y to accumulator
	PHA					; Push accumulator on stack
	LDA #$00
	STA OamAddr_2003
	LDA PpuStatus_2002
	AND #$20
	STA $0668
	LDA #$02
	STA SpriteDma_4014
	LDA $0089
	CMP #$03
	BEQ $E6B1
	CMP #$04
	BNE $E6B4
	JSR $C000
	NOP
	LDA $0088
	BNE $E6CA
	LDA $44
	BEQ $E6C1
	JSR $E7E1
	LDA $40
	CMP #$01
	BNE $E6CA
	JSR $C041
	LDA PpuStatus_2002
	LDA $1E
	STA PpuScroll_2005
	LDA $20
	STA PpuScroll_2005
	LDA $02
	STA PpuControl_2000
	LDA $04
	STA PpuMask_2001
	LDA $0081
	BEQ $E6EF
	LDA $0416
	STA $0418
	JSR $E872
	NOP
	LDA #$80
	STA $8000
	LDA $00A9
	STA $8001
	LDA #$81
	STA $8000
	LDA $00AA
	STA $8001
	LDA $40
	BNE $E735
	LDX #$82
	LDA $52
	STX $8000
	STA $8001
	LDX #$83
	LDA $53
	STX $8000
	STA $8001
	LDX #$84
	LDA $54
	STX $8000
	STA $8001
	LDX #$85
	LDA $55
	STX $8000
	STA $8001
	JMP $E75B
	LDA #$82
	STA $8000
	LDX $34
	STX $8001
	LDA #$83
	STA $8000
	INX
	STX $8001
	LDA #$84
	STA $8000
	LDX $35
	STX $8001
	LDA #$85
	STA $8000
	INX					; Increment X
	STX $8001
	JSR $E81D
	LDA $0088
	BNE $E76A
	INC $25
	LDA #$01
	STA $0082
	LDA $0087
	STA $8000
	PLA					; Pull accumulator from stack
	TAY					; Transfer accumulator to Y
	PLA					; Pull accumulator from stack
	TAX					; Transfer accumulator to X
	PLA					; Pull accumulator from stack
	PLP					; Pull processor status from stack
	RTI					; Return from interrupt
;------------------------
;--------sub start-------
	ASL A
	TAY
	PLA
	STA $14
	PLA
	STA $15
	INY
	LDA ($14),Y
	STA $12
	INY
	LDA ($14),Y
	STA $13
	JMP ($0012)
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$00
	TAY
	STA $00
	STA $01
	STA ($00),Y
	INY
	BNE $E7AE
	LDX #$02
	STX $01
	STA ($00),Y
	INY
	BNE $E7B7
	INC $01
	INX
	CPX #$08
	BCC $E7B7
	STA $01
	RTS
;------------------------
;--------sub start-------
	ASL A
	ASL A
	CLC
	ADC #$20
	LDX #$00
	STA PpuAddr_2006
	STX PpuAddr_2006
	LDY #$03
	LDA #$FF
	STA PpuData_2007
	DEX
	BNE $E7D7
	DEY
	BPL $E7D7
	RTS
;------------------------
;--------sub start-------
	LDA $47
	ORA $02
	AND #$7F
	STA PpuControl_2000
	LDY #$00
	LDX #$00
	LDA PpuStatus_2002
	LDA $44
	STA PpuAddr_2006
	LDA $43
	STA PpuAddr_2006
	LDA $0600,X
	STA PpuData_2007
	INY
	INX
	CPY $46
	BCC $E7FB
	LDA $43
	CLC
	ADC #$20
	STA $43
	BCC $E812
	INC $44
	LDY #$00
	DEC $45
	BNE $E7EE
	LDA #$00
	STA $44
	RTS
;------------------------
;--------sub start-------
	JSR $E833
	LDX #$00
	JSR $E826
	INX
;--------sub start-------
	LDA $2A,X
	EOR $2F,X
	AND $2A,X
	STA $2D,X
	LDA $2A,X
	STA $2F,X
	RTS
;------------------------
;--------sub start-------
	LDA #$01
	STA Ctrl1_4016
	LDA #$00
	STA Ctrl1_4016
	LDA #$01
	STA Ctrl1_4016
	NOP
	NOP
	LDA #$00
	STA Ctrl1_4016
	NOP
	NOP
	LDA #$01
	LSR A
	TAX
	STA Ctrl1_4016
	JSR $E856
	INX
;--------sub start-------
	LDA #$00
	STA $05
	LDY #$08
	PHA
	LDA Ctrl1_4016,X
	STA $07
	LSR A
	LSR A
	ROL $05
	LSR $07
	PLA
	ROL A
	DEY
	BNE $E85C
	ORA $05
	STA $2A,X
	RTS
;------------------------
;--------sub start-------
	LDA $0089
	CMP #$0A
	BNE $E880
	LDA $04
	AND #$F7
	STA PpuMask_2001
	LDA #$4C
	STA $0423
	LDA $0410
	ASL A
	TAX
	LDA $E8A3,X
	STA $0424
	LDA $E8A4,X
	STA $0425
	LDA $041C
	STA $C000
	STA $C001
	STA $E003
	RTS
;------------------------
;---unidentified block---

;------------------------
;-----------irq----------
	PHP			; Push processor status on stack
	PHA			; Push accumulator on stack
	TXA			; Transfer X to accumulator
	PHA			; Push accumulator on stack
	TYA			; Transfer Y to accumulator
	PHA			; Push accumulator on stack
	JSR $0423
	LDA $0087	; Load $87 into A
	STA $8000	; Store $8000 into accumulator
	PLA			; Pull accumulator from stack
	TAY			; Transfer accumulator to Y
	PLA			; Pull accumulator from stack
	TAX			; Transfer accumulator to X
	PLA			; Pull accumulator from stack
	PLP			; Pull processor status from stack
	RTI			; Return from interrupt
;---------E000-----------
;-returned to subroutine-
	RTS
;------------------------
	LDA $0435
	BNE $E8EE
	JMP $E9A9
	CMP #$01
	BNE $E8F5
	JMP $EA05
	CMP #$02
	BNE $E8FC
	JMP $EA05
	CMP #$03
	BNE $E903
	JMP $EA05
	JMP $EA3B
;---unidentified block---

;------------------------
	JMP $EA6F
	LDA $04
	STA PpuMask_2001
	STA $E000
	STA $E001
	LDA $0410
	ASL A
	ASL A
	CLC
	ADC $0410
	CLC
	ADC $0435
	TAX
	LDY #$02
	DEY
	BNE $E9C4
	LDA $EA9D,X
	STA $C000
	STA $C001
	LDA PpuStatus_2002
	LDA $0090
	STA PpuScroll_2005
	LDA #$00
	STA PpuScroll_2005
	LDY $EADE,X
	INC $0435
	LDX #$82
	STX $8000
	STY $8001
	INX
	INY
	STX $8000
	STY $8001
	INX
	INY
	STX $8000
	STY $8001
	INX
	INY
	STX $8000
	STY $8001
	RTS
;------------------------
	STA $E000
	STA $E001
	LDA $0410
	ASL A
	ASL A
	CLC
	ADC $0410
	CLC
	ADC $0435
	TAX
	LDY #$13
	DEY
	BNE $EA1B
	LDA $EA9D,X
	STA $C000
	STA $C001
	LDA PpuStatus_2002
	LDA $0090
	STA PpuScroll_2005
	LDA #$00
	STA PpuScroll_2005
	LDY $EADE,X
	JMP $E9E1
	LDA $04
	STA PpuMask_2001
	STA $E000
	LDA $0410
	ASL A
	ASL A
	CLC
	ADC $0410
	CLC
	ADC $0435
	TAX
	LDY #$02
	DEY
	BNE $EA53
	LDA PpuStatus_2002
	LDA $0090
	STA PpuScroll_2005
	LDA #$00
	STA PpuScroll_2005
	LDA #$00
	STA $0435
	LDY $EADE,X
	JMP $E9E4
	LDA $04
	STA PpuMask_2001
	STA $E000
	LDY #$02
	DEY
	BNE $EA79
	LDA PpuStatus_2002
	LDA $0090
	STA PpuScroll_2005
	LDA #$00
	STA PpuScroll_2005
	LDA #$00
	STA $0435
	LDY $0472
	JMP $E9E4
;---unidentified block---

;------------------------
	STA $E000
	LDA #$00
	STA $0435
	RTS
;------------------------
	LDA $0435
	BNE $EB53
	STA $E000
	STA $E001
	LDA #$50
	STA $C000
	STA $C001
	LDA #$84
	STA $8000
	LDX $06B8
	STX $8001
	INX
	LDA #$85
	STA $8000
	STX $8001
	INC $0435
	RTS
;------------------------
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$38
	STA $8001
	LDA #$83
	STA $8000
	LDA #$39
	STA $8001
	LDA #$84
	STA $8000
	LDA #$3A
	STA $8001
	LDA #$85
	STA $8000
	LDA #$3B
	STA $8001
	JMP $EB1F
	LDA $0435
	BNE $EBE5
	STA $E000
	STA $E001
	LDA #$50
	STA $C000
	STA $C001
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$28
	STA $8001
	LDA #$83
	STA $8000
	LDA #$29
	STA $8001
	LDA #$84
	STA $8000
	LDA #$2A
	STA $8001
	LDA #$85
	STA $8000
	LDA #$2B
	STA $8001
	INC $0435
	RTS
;------------------------
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$2C
	STA $8001
	LDA #$83
	STA $8000
	LDA #$2D
	STA $8001
	LDA #$84
	STA $8000
	LDA #$2E
	STA $8001
	LDA #$85
	STA $8000
	LDA #$2F
	STA $8001
	JMP $EB1F
	LDA $0435
	BNE $EC77
	STA $E000
	STA $E001
	LDA #$24
	STA $C000
	STA $C001
	LDA #$80
	STA $8000
	LDA #$E4
	STA $8001
	LDA #$81
	STA $8000
	LDA #$E6
	STA $8001
	LDA #$82
	STA $8000
	LDA #$68
	STA $8001
	LDA #$83
	STA $8000
	LDA #$69
	STA $8001
	LDA #$84
	STA $8000
	LDA #$6A
	STA $8001
	LDA #$85
	STA $8000
	LDA #$6B
	STA $8001
	INC $0435
	RTS
;------------------------
	LDA $06B7
	BEQ $ECBB
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$06
	STA $8001
	LDA #$83
	STA $8000
	LDA #$07
	STA $8001
	LDA #$84
	STA $8000
	LDA #$06
	STA $8001
	LDA #$85
	STA $8000
	LDA #$07
	STA $8001
	JMP $EB1F
;---unidentified block---

;------------------------
	LDA $0435
	BNE $ED4D
	STA $E000
	STA $E001
	LDA #$48
	STA $C000
	STA $C001
	LDA #$80
	STA $8000
	LDA #$E4
	STA $8001
	LDA #$81
	STA $8000
	LDA #$E6
	STA $8001
	LDA #$82
	STA $8000
	LDA #$4C
	STA $8001
	LDA #$83
	STA $8000
	LDA #$4D
	STA $8001
	LDA #$84
	STA $8000
	LDA #$4E
	STA $8001
	LDA #$85
	STA $8000
	LDA #$4F
	STA $8001
	INC $0435
	RTS
;------------------------
	LDA $06B7
	BEQ $ED91
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$06
	STA $8001
	LDA #$83
	STA $8000
	LDA #$07
	STA $8001
	LDA #$84
	STA $8000
	LDA #$06
	STA $8001
	LDA #$85
	STA $8000
	LDA #$07
	STA $8001
	JMP $EB1F
;---unidentified block---

;------------------------
	LDA PpuStatus_2002
	LDX #$04
	DEX
	BPL $EE97
	LDA #$28
	STA PpuAddr_2006
	LDA #$00
	STA PpuAddr_2006
	LDA #$00
	STA PpuScroll_2005
	STA PpuScroll_2005
	LDA $06B7
	BEQ $EEF0
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$06
	STA $8001
	LDA #$83
	STA $8000
	LDA #$07
	STA $8001
	LDA #$84
	STA $8000
	LDA #$06
	STA $8001
	LDA #$85
	STA $8000
	LDA #$07
	STA $8001
	JMP $EB1F
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$1A
	STA $8001
	LDA #$83
	STA $8000
	LDA #$1B
	STA $8001
	LDA #$84
	STA $8000
	LDA #$1A
	STA $8001
	LDA #$85
	STA $8000
	LDA #$1B
	STA $8001
	JMP $EB1F
	LDA $0435
	BNE $EF82
	STA $E000
	STA $E001
	LDA #$48
	STA $C000
	STA $C001
	LDA #$80
	STA $8000
	LDA #$E4
	STA $8001
	LDA #$81
	STA $8000
	LDA #$E6
	STA $8001
	LDA #$82
	STA $8000
	LDA #$78
	STA $8001
	LDA #$83
	STA $8000
	LDA #$79
	STA $8001
	LDA #$84
	STA $8000
	LDA #$7A
	STA $8001
	LDA #$85
	STA $8000
	LDA #$7B
	STA $8001
	INC $0435
	RTS
;------------------------
	LDA #$80
	STA $8000
	LDA #$F8
	STA $8001
	LDA #$81
	STA $8000
	LDA #$FA
	STA $8001
	LDA #$82
	STA $8000
	LDA #$7C
	STA $8001
	LDA #$83
	STA $8000
	LDA #$7D
	STA $8001
	LDA #$84
	STA $8000
	LDA #$7E
	STA $8001
	LDA #$85
	STA $8000
	LDA #$7F
	STA $8001
	JMP $EB1F
;---unidentified block---

;------------------------
	LDA #$21
	LDX #$87
	STX $8000
	STA $8001
	JSR $A000
	LDA $0467
	CMP #$04
	BNE $F064
	LDA #$0C
	STA $0410
	LDA #$00
	STA $0467
	INC $49
	RTS
;------------------------
;--------sub start-------
	STA $04EF
	STA $04F0
	LDA #$01
	STA $04F5
	LDA #$00
	STA $04F1
	STA $04F2
	LDA $04F7
	AND #$7F
	CLC
	ADC #$60
	STA $7B
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA $040C
	BEQ $F132
	LDA #$00
	STA $06DD
	STA $0049
	LDA #$01
	STA $0048
	LDA $59
	AND #$03
	TAX
	LDA #$01
	STA $06D3,X
	CLC
	LDA $06D3
	ADC $06D4
	ADC $06D5
	CMP #$03
	BCC $F131
	DEC $006B
	LDA #$03
	STA $0048
	RTS
;------------------------
	LDA #$01
	STA $0048
	LDX $0057
	LDA #$01
	STA $06D6,X
	INC $5A
	INC $0057
	LDA $0057
	CMP #$04
	BCC $F158
	LDA #$00
	STA $0057
	STA $0049
	LDA #$04
	STA $0048
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDA #$86
	STA $0087
	STA $8000
	LDA #$33
	STA $8001
	JSR $8000
	LDA #$30
	LDX #$86
	STX $0087
	STX $8000
	STA $8001
	RTS
;------------------------
;--------sub start-------
	LDA $0040
	JSR $E777
;---unidentified block---

;------------------------
;--------sub start-------
	JSR $DBBC
	LDA #$30
	LDX #$86
	STX $8000
	STA $8001
	LDA #$22
	LDX #$87
	STX $8000
	STA $8001
	RTS
;------------------------
	LDA #$00
	STA $0040
	STA $0049
	LDA #$05
	STA $0048
	RTS
;------------------------
	LDA #$01
	STA $0040
	LDA #$0A
	STA $0089
	LDA #$04
	STA $0467
	LDA #$00
	STA $0468
	STA $046E
	STA $0473
	RTS
;------------------------
	LDA #$30
	LDX #$86
	STX $0087
	STX $8000
	STA $8001
	LDA #$22
	LDX #$87
	STX $0087
	STX $8000
	STA $8001
	JMP $A000
;---unidentified block---

;------------------------
	LDA #$00
	STA $0049
	STA $0040
	LDA $005E
	BNE $FA62
	JSR $F0FF
	RTS
;------------------------
;---unidentified block---

;------------------------
;--------sub start-------
	LDX #$20
	LDA $00AF
	CMP #$20
	BCS $FB25
	LDA $00B0
	CMP #$30
	BCC $FB2C
	LDA $0668
	AND #$20
	BNE $FB4F
	LDA $0072
	BNE $FB4F
	LDA $0073
	BNE $FB4F
	LDA $009F
	BNE $FB45
	LDA $0025
	AND #$01
	BEQ $FB5D
	JMP $FBCE
	LDA $0025
	AND #$01
	BEQ $FB92
	JMP $FC03
	LDA $0025
	AND #$02
	BNE $FBC7
	LDA $0025
	AND #$01
	BNE $FB92
	DEX
	LDA $0300,X
	STA $0200,X
	LDA $0320,X
	STA $0220,X
	LDA $0340,X
	STA $0240,X
	LDA $0360,X
	STA $0260,X
	LDA $0380,X
	STA $0280,X
	LDA $03A0,X
	STA $02A0,X
	LDA $03C0,X
	STA $02C0,X
	LDA $03E0,X
	STA $02E0,X
	TXA
	BNE $FB5D
	RTS
;------------------------
	DEX
	LDA $0300,X
	STA $0280,X
	LDA $0320,X
	STA $02A0,X
	LDA $0340,X
	STA $02C0,X
	LDA $0360,X
	STA $02E0,X
	LDA $0380,X
	STA $0200,X
	LDA $03A0,X
	STA $0220,X
	LDA $03C0,X
	STA $0240,X
	LDA $03E0,X
	STA $0260,X
	TXA
	BNE $FB92
	RTS
;------------------------
	LDA $0025
	AND #$01
	BNE $FC03
	DEX
	LDA $0300,X
	STA $0240,X
	LDA $0320,X
	STA $0260,X
	LDA $0340,X
	STA $0200,X
	LDA $0360,X
	STA $0220,X
	LDA $0380,X
	STA $02C0,X
	LDA $03A0,X
	STA $02E0,X
	LDA $03C0,X
	STA $0280,X
	LDA $03E0,X
	STA $02A0,X
	TXA
	BNE $FBCE
	RTS
;------------------------
	DEX
	LDA $0300,X
	STA $02C0,X
	LDA $0320,X
	STA $02E0,X
	LDA $0340,X
	STA $0280,X
	LDA $0360,X
	STA $02A0,X
	LDA $0380,X
	STA $0240,X
	LDA $03A0,X
	STA $0260,X
	LDA $03C0,X
	STA $0200,X
	LDA $03E0,X
	STA $0220,X
	TXA
	BNE $FC03
	RTS
;------------------------
	LDA $2A
	AND #$30
	EOR #$30
	BNE $FC54
	JMP $8000
	RTS
;------------------------
	LDA $0056
	BEQ $FC57
	LDA $002D
	AND #$10
	BEQ $FC83
	LDA #$09
	STA $0089
	RTS
;------------------------
	LDA $002D
	AND #$10
	BEQ $FC7D
	LDA $0089
	CMP #$03
	BNE $FC83
	LDA $0442
	BNE $FC83
	JSR $FC92
	LDA $0024
	EOR #$01
	STA $0024
	LDA $0709
	EOR #$01
	STA $0709
	LDA $0024
	BEQ $FC83
	RTS
;------------------------
	LDA $0089
	CMP #$03
	BNE $FC8A
	JSR $FC8E
	RTS
;------------------------
;--------sub start-------
	JSR $C026
	RTS
;------------------------
;--------sub start-------
	RTS
;------------------------
;----------reset--------- ; 07FFE0
	SEI					; Set interrupt disable flag
	CLD					; Clear decimal mode (2A03 does not have it due to MOS patent) flag
	LDA #$06			; Load $06 into Accumulator
	STA $8000			; Store Accumulator into $8000
	LDA #$14			; Load $14 into Accumulator
	STA $8001			; Store Accumulator into $8001
	JMP $8000			; Jump to $8000 (so, $078000)
	; (repeat of last two instructions?)
	STA $8001
	JMP $8000
;---unidentified block---

;------------------------