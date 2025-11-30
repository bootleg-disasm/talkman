#pragma author gmestanley
#pragma description Rinco Talkman built-in ROM

import nes;
import std.core;

namespace MulticartMenu {
    u8 menuCtrlCode[1152] @ 0x28010;
}

fn sndLengths() {
    if ($ < 0x7000) {
        match(std::core::array_index()) {
            (0): return 400;
            (1): return 752;
            (2): return 880;
            (3): return 912;
            (4): return 1376;
            (5): return 992;
            (6): return 256;
            (7): return 1632;
            (8): return 1744;
            (9): return 1360;
            (10): return 992;
            (11): return 736;
            (12): return 1024;
            (13): return 1104;
        }
    } else return 3696;
};

namespace CDZ {    
    struct SoundEffect {
        u8 used[sndLengths()];
        u8 unused[while($<addressof(this)+0x800*($ < 0x7000)+0x1000*($ > 0x7000))];
    };
    SoundEffect soundEffects[14] @ 0x10;
    SoundEffect seiyaSpecialArabic @ 0x7010;
    u8 shiryuSpecialArabic[3728] @ 0x8010;
    u8 sourceCode[368] @ 0x8EA0;
    u8 hyogaSpecialArabic[3318] @ 0x9010;
    u8 sndSourceCode[778] @ 0x9D06;
    u8 afroditeSpecialArabic[3346] @ 0xA010;
    u8 colorSourceCode[750] @ 0xAD22;
    u8 berengueSpecialArabic[3326] @ 0xB010;
    u8 titleSourceCode[770] @ 0xBD0E;

    struct DebugSymbol {
        if ($>=0xCCC6&&$!=0xD009&&$!=0xE78F) u8 unknown[10];
        if ($==0xD009) u8 unknown[7];
        if ($==0xE78F) u8 unknown[1];
        if ($==0xCCF4) {
            u8 corruptedSize;
            char symbol[4];
        }
        if ($==0xCD95) {
            u8 corruptedSize;
            char symbol[9];
        }
        if ($==0xCEC0) {
            u8 corruptedSize;
            char symbol[5];
        }
        if ($==0xCF57) {
            u8 corruptedSize;
            char symbol[8];
        }
        if ($<0xCCC6) char symbol[8];
        else if ($!=0xCCF9&&$!=0xCD9F&&$!=0xCEC6&&$!=0xCF60&&$!=0xD010&&$!=0xE790) std::string::SizedString<u8> symbol;
    };
    u8 atlasSpecialArabic[3246] @ 0xC010;
    DebugSymbol debugSymbols[while($<0xD010)] @ 0xCCBE;
    u8 abelSpecialArabic[3168] @ 0xD010;
    DebugSymbol debugSymbols2[while($<0xE790)] @ 0xDC70;

    struct RepeatedStructures {
        u8 unknownSubroutine2[252] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xE7B7;
        u8 unknownSubroutine3[32] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xE8F6;
        u8 irqHandler[22] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xE8DF;
        u8 returnedToSubroutineE000 @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xE8F5;
        u8 unknownSubroutine4[400] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xE916;
        u8 unknownSubroutine5[115] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xEB2F;
        u8 unknownSubroutine6[144] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xEF3F;
        u8 unknownSubroutine7[30] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF075;
        u8 unknownSubroutine8[51] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF10F;
        u8 unknownSubroutine9[39] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF142;
        u8 englishCharacterNames[140] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF6B2;
        u8 arabicCharacterNames[191] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF748;
        u8 streetFighterDisclaimer[34] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF80C;
        u8 unknownSubroutine10[30] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF984;
        u8 unknownSubroutine11[6] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF9A2;
        u8 unknownSubroutine12[24] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF9BC;
        u8 unknownSubroutine13[14] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF9D4;
        u8 unknownSubroutine14[27] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF9E2;
        u8 unknownSubroutine15[29] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xF9FD;
        u8 unknownSubroutine16[17] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFA61;
        u8 unknownSubroutine17[125] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFB25;
        u8 unknownSubroutine18[53] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFBA2;
        u8 unknownSubroutine19[60] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFBD7;
        u8 unknownSubroutine20[53] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFC13;
        u8 unknownSubroutine21[18] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFC55;
        u8 unknownSubroutine22[44] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFC67;
        u8 unknownSubroutine23[11] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFC93;
        u8 unknownSubroutine24[4] @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFC9E;
        u8 unknownSubroutine25 @ (0x40000+0x10000*std::core::array_index())*(std::core::array_index()>0)+0xFCA2;
    };
    RepeatedStructures repeatedStructures[4] @ 0xE7A0;
    
    u8 ending[115030] @ 0x1000A;
    u8 endingNarration[67967] @ 0x2C160;
    u8 sndSourceCodeCopy[778] @ 0x41D06;
    u8 titleSourceCodeCopy[217] @ 0x43F37;
    u8 titleSourceCodeCopy2[217] @ 0x45F37;
    u8 sndSourceCodeCopy2[778] @ 0x47D06;
    u8 englishIngameCutscenesText[1806] @ 0x4941C;
    u8 sndSourceCodeCopy3[778] @ 0x49D06;
    u8 englishNarration[2731] @ 0x4B320;
    u8 sndSourceCodeHalfCopy[581] @ 0x4BDCB;
    u8 arabicText[816] @ 0x4D310;
    u8 englishNarrationCopy[1931] @ 0x4D640;
    u8 sndSourceCodeHalfCopy2[581] @ 0x4DDCB;
    u8 sndSourceCodeQuarterCopy[217] @ 0x4FF37;
    
    struct Vectors {
        u16 nmi;
        u16 resetVector [[comment("Entry Point")]];
        u16 externalIRQ;
    };
    
    struct RepeatedStructures50000h {
        u8 titleSourceCodeCopy3[217] @ 0x50000+0x10000*std::core::array_index()+0x9F37;
        u8 titleSourceCodeCopy4[217] @ 0x50000+0x10000*std::core::array_index()+0xBF37;
        std::string::SizedString<u8> characterNamesA[9] @ 0x50000+0x10000*std::core::array_index()+0xC408;
        u8 unknownSubroutine30[35] @ 0x50000+0x10000*std::core::array_index()+0xD2A2;
        u8 unknownSubroutine29[2] @ 0x50000+0x10000*std::core::array_index()+0xD2C5;
        u8 unknownSubroutine28[51] @ 0x50000+0x10000*std::core::array_index()+0xD2C7;
        u8 unknownSubroutine27[17] @ 0x50000+0x10000*std::core::array_index()+0xD313;
        u8 unknownSubroutine26[25] @ 0x50000+0x10000*std::core::array_index()+0xD324;
        u8 unknownSubroutineZ[25] @ 0x50000+0x10000*std::core::array_index()+0xD33D;
        u8 unknownSubroutineY[17] @ 0x50000+0x10000*std::core::array_index()+0xD356;
        u8 unknownSubroutineX[15] @ 0x50000+0x10000*std::core::array_index()+0xD367;
        u8 unknownSubroutineW[33] @ 0x50000+0x10000*std::core::array_index()+0xD376;
        u8 unknownSubroutineV[24] @ 0x50000+0x10000*std::core::array_index()+0xD397;
        u8 unknownSubroutineU[19] @ 0x50000+0x10000*std::core::array_index()+0xD3AF;
        u8 unknownSubroutineT[12] @ 0x50000+0x10000*std::core::array_index()+0xD3C2;
        u8 unknownSubroutineS[50] @ 0x50000+0x10000*std::core::array_index()+0xD3CE;
        u8 unknownSubroutineR[16] @ 0x50000+0x10000*std::core::array_index()+0xD400;
        u8 unknownSubroutineQ[362] @ 0x50000+0x10000*std::core::array_index()+0xD410;
        u8 unknownSubroutineP[11] @ 0x50000+0x10000*std::core::array_index()+0xD57A;
        u8 unknownSubroutineO[21] @ 0x50000+0x10000*std::core::array_index()+0xD585;
        u8 unknownSubroutineN[39] @ 0x50000+0x10000*std::core::array_index()+0xD59A;
        u8 unknownSubroutineM[20] @ 0x50000+0x10000*std::core::array_index()+0xD5C1;
        u8 unknownSubroutineL[13] @ 0x50000+0x10000*std::core::array_index()+0xD60C;
        u8 unknownSubroutineK[40] @ 0x50000+0x10000*std::core::array_index()+0xD619;
        u8 unknownSubroutineJ[662] @ 0x50000+0x10000*std::core::array_index()+0xD66D;
        u8 unknownSubroutineI[47] @ 0x50000+0x10000*std::core::array_index()+0xD903;
        u8 unknownSubroutineH[22] @ 0x50000+0x10000*std::core::array_index()+0xD94C;
        u8 unknownSubroutineG[140] @ 0x50000+0x10000*std::core::array_index()+0xD965;
        u8 unknownSubroutineF[93] @ 0x50000+0x10000*std::core::array_index()+0xD9F3;
        u8 unknownSubroutineE[2] @ 0x50000+0x10000*std::core::array_index()+0xD9F1;
        u8 unknownSubroutineD[82] @ 0x50000+0x10000*std::core::array_index()+0xDA50;
        u8 unknownSubroutineC[174] @ 0x50000+0x10000*std::core::array_index()+0xDAA2;
        u8 unknownSubroutineB[25] @ 0x50000+0x10000*std::core::array_index()+0xDB81;
        u8 unknownSubroutineA[50] @ 0x50000+0x10000*std::core::array_index()+0xDB9A;
        u8 unknownSubroutine0[119] @ 0x50000+0x10000*std::core::array_index()+0xDBCC;
        u8 debugSymbolsQuarterCopy[47] @ 0x50000+0x10000*std::core::array_index()+0xDFE1;
        u8 debugSymbolsQuarterCopy2[77] @ 0x50000+0x10000*std::core::array_index()+0xE513;
        u8 unknownSubroutine[21] @ 0x50000+0x10000*std::core::array_index()+0xE787;
        u8 unknownSubroutineAlpha[21] @ 0x50000+0x10000*std::core::array_index()+0xFFE0;
        Vectors vectors @ 0x50000+0x10000*std::core::array_index()+0x1000A;
    };
    RepeatedStructures50000h repeatedStructures50000h[3] @ 0x50000;
    
    u8 arabicDialogueCopy[1824] @ 0x51320;
    u8 sndSourceCodeQuarterCopy2[217] @ 0x51F37;
    u8 arabicCutscenesCopy[1824] @ 0x53460;
    u8 sndSourceCodeQuarterCopy3[217] @ 0x53F37;
    u8 assemblyInstruction[32] @ 0x55FF0;
    u8 arabicUnknownCopy[124] @ 0x55714;
    u8 resetHandler[318] @ 0x5E560;
    u8 nmiHandler[233] @ 0x5E69E;
    u8 credits[153] @ 0x61B5C;
    u8 options[36] @ 0x61C23;
    u8 englishDialogue[3150] @ 0x62070;
    u8 creditsCopy[152] @ 0x63B5E;
    u8 optionsCopy[38] @ 0x63C22;
    u8 arabicCopy[5592] @ 0x64070;
    u8 creditsCopy2[152] @ 0x65B5E;
    u8 optionsCopy2[38] @ 0x65C22;
    u8 arabicCopy2[4056] @ 0x66670;
    u8 creditsCopy3[152] @ 0x67B5E;
    u8 optionsCopy3[38] @ 0x67C22;
    u8 arabicDialogue[1824] @ 0x71320;
    u8 arabicCutscenes[1824] @ 0x73460;
    u8 arabicUnknown[124] @ 0x75714;
    u8 seiyaDescription[47168] @ 0x80010;
    u8 shiryuDescription[43296] @ 0x8B860;
    u8 hyogaDescription[37007] @ 0x96180;


    u8 introOpeningCutscene[6144] @ 0x300010;
    u8 unknownPortugueseAlphabet[256] @ 0x301810;
    u8 arabicQuoteMarks[32] @ 0x301910;
    u8 unknownPortugueseFontA[16] @ 0x301930;
    u8 arabicTextboxBorders[128] @ 0x301980;
    u8 arabicTextAbjad[1552] @ 0x301A00;
    u8 portraitsHyogaToAtlas[8192] @ 0x302010;
    u8 gameOver[4096] @ 0x304010;
    u8 portraitAbel[2048] @ 0x306010;

    struct EnglishCharacterNames {
        u8 sTopUppercase[16];
        u8 eTop[16];
        u8 iTop[16];
        u8 yTop[16];
        u8 aTop[16];
        u8 hbTop[16];
        u8 rTop[16];
        u8 uTop[16];
        u8 hTopUppercase[16];
        u8 oTop[16];
        u8 sBottomUppercase[16];
        u8 eBottom[16];
        u8 iBottom[16];
        u8 yBottom[16];
        u8 aBottom[16];
        u8 hnAUppercaseBottom[16];
        u8 rBottom[16];
        u8 uBottom[16];
        u8 oBottom[16];
        u8 gTop[16];
        u8 aTopUppercase[16];
        u8 fTop[16];
        u8 dTop[16];
        u8 tTop[16];
        u8 bTopUppercase[16];
        u8 nTop[16];
        u8 lTop[16];
        u8 sTop[16];
        u8 gBottom[16];
        u8 dBottom[16];
        u8 tBottom[16];
        u8 bBottomUppercase[16];
        u8 sBottom[16];
        u8 bBottom[16];
    };
    u8 lowercaseLatinAlphabet[960] @ 0x306810;
    EnglishCharacterNames englishCharacterNamesCHR @ 0x306BD0;
    u8 englishCharacterNameSymbols[64] @ 0x306DF0;
    u8 accentedPortugueseLetters[112] @ 0x306E30;
    u8 englishDialogueBorders[128] @ 0x306EA0;
    u8 accentedLetters[64] @ 0x306FB0;
    u8 i[16] @ 0x306FF0;

    u8 gameLogo[4096] @ 0x307010;
    u8 titleScreenPortraits[8192] @ 0x30A010;
    u8 smallPortraitsCharSelection[1584] @ 0x30E010;
    u8 scorpioIcon[192] @ 0x30E570;
    u8 versusScreenLines[688] @ 0x30E710;
    u8 zodiacSignIcons[576] @ 0x30EAD0;
    u8 rest[832] @ 0x30ED10;
    u8 gameplayOpponentNameAlphabet[416] @ 0x30F050;
    u8 debugFont[256] @ 0x323E10;
    u8 copyrightTilemap[512] @ 0x3315B0;
    u8 rincoLogo[896] @ 0x3317B0;
    u8 victoryCounts[32] @ 0x3334F0;
    u8 borderLeft[64] @ 0x333510;
    u8 storyModeTop[160] @ 0x333550;
    u8 borderRight[16] @ 0x3335F0;
    u8 storyModeBottom[176] @ 0x333600;
    u8 vs1p2pTop[96] @ 0x3336B0;
    u8 vs1p2pBottom[112] @ 0x333710;
    u8 borderBottom[48] @ 0x333780;
    u8 englishTop[48] @ 0x3337B0;
    u8 englishBottom[144] @ 0x333830;
    u8 hyogaSpecialCHR[4096] @ 0x33B010;
    u8 portraitsSeiyaShiryu[4096] @ 0x33D010;
    u8 seiyaSpecialCHR[8192] @ 0x33E010;
    u8 debugFont2[256] @ 0x35DE10;
    u8 preGameGraphics[4096] @ 0x37E010;
}

namespace TheDragon {
    u8 unknownSubroutineTD[] @ 0x180010;
    u8 snd3insult[5902] @ 0x1A26E0;
    u8 snd8yell[15664] @ 0x1A8110;
    u8 snd9[3728] @ 0x1AC110;
}

namespace CaptainBassam {
    u8 unknownSubroutineBASSAM[] @ 0x2C0010;
}