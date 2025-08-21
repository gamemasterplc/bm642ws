.n64

SCREEN_W equ 424
SCREEN_W_FLOAT equ 424.0
SCREEN_H equ 240
CFB_ADDR equ 0x80500000
ZBUF_ADDR equ 0x80700000

.open "extract/main.bin", 0x80000400

.org 0x8000153C
li t7, ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Fade Scissor

.org 0x800020B8
addiu a3, r0, SCREEN_W //Fix 3D Default Viewport Width

.org 0x800020D8
addiu a3, r0, SCREEN_W //Fix 2D Viewport Width

.org 0x800020E4
addiu a2, r0, SCREEN_W //Fix Clear Screen Size

.org 0x80002164
addiu a0, r0, 0x800 //Fix Overlay Display List Size

.org 0x800044DC
//Fix CFB1 Address
lui a1, hi(CFB_ADDR)
addiu a1, a1, lo(CFB_ADDR)

.org 0x800044F0
//Fix CFB2 Address
lui t9, hi(CFB_ADDR+(SCREEN_W*SCREEN_H*2))
addiu t9, t9, lo(CFB_ADDR+(SCREEN_W*SCREEN_H*2))

.org 0x8000467C
lui v0, hi(ZBUF_ADDR) //Fix Z Buffer High Half

.org 0x80004684
addiu v0, v0, lo(ZBUF_ADDR) //Fix Z Buffer Low Half

.org 0x80004B88
lui t9, hi(ZBUF_ADDR+0x80000000) //Fix Z Buffer High Half

.org 0x80004B94
addiu t9, t9, lo(ZBUF_ADDR+0x80000000) //Fix Z Buffer Low Half

.org 0x80004DBC
lui t4, hi(ZBUF_ADDR+0x80000000) //Fix Z Buffer High Half
addiu t4, t4, lo(ZBUF_ADDR+0x80000000) //Fix Z Buffer Low Half

.org 0x80004DE4
li t7, ((SCREEN_W << 14)|(SCREEN_H << 2)) //Fix Clear Scissor

.org 0x80009138
lui a2, hi(0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Fix High Half of Fade Rectangle

.org 0x80009148
addiu a2, a2, lo(0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Fix Low Half of Fade Rectangle

.org 0x8002B470
addiu a3, r0, (SCREEN_W-16) //Fix Battle Exit Viewport Width

.org 0x8002D8C4
addiu a3, r0, (SCREEN_W-16) //Fix Battle 1P Viewport Width

.org 0x8002E7C0
addiu a3, r0, (SCREEN_W-16) //Fix Gamescene Viewport Width

.org 0x8002FAD0
lui at, (0xE400|(SCREEN_W >> 2)) //Fix Width of Background Rectangle

.org 0x8002FAF8
lui t7, (163840/SCREEN_W) //Fix X Scale of Background Rectangle

.org 0x800312B4
li.u at, (SCREEN_W_FLOAT/2) //Fix Game Over Screen Centering

.org 0x8003134C
addiu t6, r0, (SCREEN_W-16) //Fix Width of Continue Fade

.org 0x800314B0
addiu a0, r0, ((SCREEN_W/2)-30) //Fix X Position of Game Over Empty String

.org 0x800314DC
addiu a0, r0, ((SCREEN_W/2)+120) //Fix X Position of Game Over Lives Count

.org 0x8003171C
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Game Over Exit Choice

.org 0x80031768
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Game Over Exit Cursor

.org 0x800317E0
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Game Over Choice

.org 0x80031830
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Game Over Cursor

.org 0x80032944
li.u at, ((SCREEN_W_FLOAT/2)-4) //Fix X Position of Pause Screen Volume

.org 0x800329C4
li.u at, ((SCREEN_W_FLOAT/2)+120) //Fix X Position of Pause Screen Volume Cursor

.org 0x80032A28
li.u at, ((SCREEN_W_FLOAT/2)+16) //Fix X Position of Pause Screen Stereo Text

.org 0x80032A4C
li.u at, ((SCREEN_W_FLOAT/2)+85) //Fix X Position of Pause Screen Mono Text

.org 0x80032A70
li.u at, ((SCREEN_W_FLOAT/2)-80) //Fix X Position of Pause Screen Choices

.org 0x80032B00
li.u at, ((SCREEN_W_FLOAT/2)+22) //Fix X Position of Pause Screen On Text

.org 0x80032B24
li.u at, ((SCREEN_W_FLOAT/2)+78) //Fix X Position of Pause Screen Off Text

.org 0x80032B7C
addiu t7, t6, ((SCREEN_W/2)-8) //Fix Default X Position of Music Volume Cursor

.org 0x80032BA0
addiu t9, t8, ((SCREEN_W/2)-8) //Fix Default X Position of SE Volume Cursor

.org 0x80033014
addiu t6, t9, ((SCREEN_W/2)-8) //Fix X Position of Music Volume Cursor

.org 0x80033110
addiu t9, t8, ((SCREEN_W/2)-8) //Fix Default X Position of SE Volume Cursor

.org 0x80033394
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Battle Pause Text

.org 0x800335D0
addiu t8, r0, 228 //Fix Game Pause Viewport Height

.org 0x800335D8
addiu a1, r0, 8 //Fix Game Pause Viewport Start X
addiu a2, r0, 6 //Fix Game Pause Viewport Start Y

.org 0x800335E4
addiu a3, r0, (SCREEN_W-16) //Fix Game Pause Viewport Width

.org 0x800336CC
addiu a0, r0, (SCREEN_W/2) //Fix Initial X Position of Mode Cursor

.org 0x80033748
addiu a0, r0, (SCREEN_W-60) //Fix Initial X Position of Control Cursor

.org 0x80033774
li.u a1, (SCREEN_W_FLOAT-126) //Fix X Position of Control Icon

.org 0x800337B4
li.u a1, (SCREEN_W_FLOAT-60) //Fix X Position of Control CPU Icon

.org 0x800337F4
li.u a1, (SCREEN_W_FLOAT-60) //Fix X Position of Control 2P Icon

.org 0x80033884
li.u a1, (SCREEN_W_FLOAT-80) //Fix X Position of Exit World Icon

.org 0x800338B8
li.u a1, (SCREEN_W_FLOAT-48) //Fix X Position of Options Button

.org 0x80033924
addiu t7, r0, ((SCREEN_W/3)-10) //Fix X Position of Lives

.org 0x80033D4C
li.u a1, (SCREEN_W_FLOAT-60) //Fix X Position of Control Cursor

.org 0x80033D8C
li.u a1, (SCREEN_W_FLOAT-60) //Fix X Position of Control Cursor

.org 0x80033DFC
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Exit World Text

.org 0x80033E3C
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Exit World Cursor

.org 0x80034134
li.u a1, ((SCREEN_W_FLOAT/3)-18.666666) //Fix X Position of Fire Number

.org 0x800341D4
li.u a1, (((SCREEN_W_FLOAT*2)/3)-93.333333) //Fix X Position of Bomb Number

.org 0x80034478
addiu s4, s4, (SCREEN_W-90) //Fix X Position of Game Gold Number

.org 0x8003457C
li.u a1, (SCREEN_W_FLOAT-184) //Fix X Position of 1st Dead Heart

.org 0x8003460C
addiu t8, s3, (SCREEN_W-184) //Fix X Position of Lost Hearts

.org 0x80034880
li.u a1, ((SCREEN_W_FLOAT/3)-34.666666) //Fix X Position of Fire Icon

.org 0x800348B8
li.u a1, (((SCREEN_W_FLOAT*2)/3)-109.333333) //Fix X Position of Bomb Icon

.org 0x800348E8
li.u a1, (SCREEN_W_FLOAT-106) //Fix X Position of Game Gold Icon

.org 0x80034B94
addiu s4, s4, ((SCREEN_W/2)-8) //Fix X Position of Timer Digits

.org 0x80034C78
addiu s4, s4, ((SCREEN_W/2)+12) //Fix X Position of Small Timer Digits

.org 0x8003547C
addiu t6, r0, (((SCREEN_W*3)/4)+16) //Fix X Position of Team 2 Score

.org 0x800354EC
addiu t6, t8, ((SCREEN_W/4)-16) //Fix X Position of Team 1 Score

.org 0x800356D0
addiu t6, r0, (((SCREEN_W*3)/4)+16) //Fix X Position of Team 2 Score

.org 0x80035738
addiu t7, t9, ((SCREEN_W/4)-16) //Fix X Position of Team 1 Score

.org 0x80035C68
addiu s4, s4, ((SCREEN_W/2)-8) //Fix X Position of Center Timer

.org 0x80035D4C
addiu s4, s4, ((SCREEN_W/2)+12) //Fix X Position of Small Timer

.org 0x80036938
li.u a1, ((SCREEN_W_FLOAT/2)-40) //Fix X Position of Player Number in Winning

.org 0x80036A28
li.u a1, ((SCREEN_W_FLOAT/2)-40) //Fix X Position of Player Number in Winning

.org 0x80036A5C
li.u a1, ((SCREEN_W_FLOAT/2)-40) //Fix X Position of Player Number in Winning

.org 0x80036AB8
li.u a1, ((SCREEN_W_FLOAT/2)-40) //Fix X Position of Player Number in Winning

.org 0x80036BB0
li.u a1, ((SCREEN_W_FLOAT/2)+50) //Fix X Position of Win Text in Winning

.org 0x80036D10
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Time Up Text

.org 0x80036E8C
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Draw Game Text

.org 0x8003718C
addiu s2, s2, ((SCREEN_W/2)-89) //Fix X Position of Ready Letters

.org 0x80037470
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Infinity Timer

.org 0x800374A0
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Top Infinity Timer

.org 0x80038EBC
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Saving Message

.org 0x80038ED0
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Saving Message with Sound

.org 0x800394A4
lui t5, hi(0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Fix High Half of Pause Fade Rectangle

.org 0x800394B0
addiu t5, t5, lo(0xF6000000|((SCREEN_W-1) << 14)|((SCREEN_H-1) << 2)) //Fix Low Half of Pause Fade Rectangle

.org 0x800395C0
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Hurry Up Text

.org 0x80039680
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Hurry Up Text

.org 0x80053084
addiu t4, r0, SCREEN_W //Fix Width of Event Fades

.org 0x80055FA0
li.u at, (SCREEN_W_FLOAT-66) //Fix X Position of Speaker Icon

.org 0x800561A0
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Textboxes

.org 0x8008EF78
.dw (0xFF100000|(SCREEN_W-1)) //Fix Framebuffer Reset

.org 0x8008F7C8
.dw ((SCREEN_W/2)-9) //Fix Width of P1 Battle Split Viewport

.org 0x8008F7D0
.dw (SCREEN_W/2) //Fix X Position of P2 Battle Split Viewport

.org 0x8008F7D8
.dw ((SCREEN_W/2)-9) //Fix Width of P2 Battle Split Viewport

.org 0x8008F7E8
.dw ((SCREEN_W/2)-9) //Fix Width of P3 Battle Split Viewport

.org 0x8008F7F0
.dw (SCREEN_W/2) //Fix X Position of P4 Battle Split Viewport

.org 0x8008F7F8
.dw ((SCREEN_W/2)-9) //Fix Width of P4 Battle Split Viewport

.org 0x8008F94C
.dw ((SCREEN_W/2)-50) //Fix X Position of P1 Split Score

.org 0x8008F954
.dw (SCREEN_W-56) //Fix X Position of P2 Split Score

.org 0x8008F95C
.dw ((SCREEN_W/2)-50) //Fix X Position of P1 Split Score

.org 0x8008F964
.dw (SCREEN_W-56) //Fix X Position of P2 Split Score

.org 0x8008F974
.dw ((SCREEN_W/4)+8) //Fix X Position of P2 Counter In Battle

.org 0x8008F97C
.dw (((SCREEN_W*3)/4)-30) //Fix X Position of P3 Counter In Battle

.org 0x8008F984
.dw (SCREEN_W-46) //Fix X Position of P4 Counter In Battle

.org 0x8008F994
.dw ((SCREEN_W/3)+8) //Fix X Position of P2 Small Icon In Battle

.org 0x8008F99C
.dw (((SCREEN_W*2)/3)-27) //Fix X Position of P3 Small Icon In Battle

.org 0x8008F9A4
.dw (SCREEN_W-62) //Fix X Position of P4 Small Icon In Battle

.org 0x8008F9B4
.dw ((SCREEN_W/3)+16) //Fix X Position of Battle P2 Score

.org 0x8008F9BC
.dw (((SCREEN_W*2)/3)-19) //Fix X Position of Battle P3 Score

.org 0x8008F9C4
.dw (SCREEN_W-54) //Fix X Position of Battle P4 Score

.org 0x8008F9D4
.dw ((SCREEN_W/2)+24) //Fix X Position of P2 Split Counter

.org 0x8008F9E4
.dw ((SCREEN_W/2)+24) //Fix X Position of P4 Split Counter

.org 0x8008F9F4
.dw (SCREEN_W-30) //Fix X Position of Team 2 Hearts

.org 0x8008FA04
.dw (SCREEN_W-30) //Fix X Position of Team 2 King Icon

.org 0x8008FB0C
.dw ((SCREEN_W/4)+8) //Fix X Position of P1 Win Text

.org 0x8008FB14
.dw (((SCREEN_W*3)/4)-8) //Fix X Position of P2 Win Text

.org 0x8008FB1C
.dw ((SCREEN_W/4)+8) //Fix X Position of P1 Win Text

.org 0x8008FB24
.dw (((SCREEN_W*3)/4)-8) //Fix X Position of P2 Win Text

.org 0x8008FB4C
.dw (SCREEN_W/2) //Fix X Position of Game Over Sprite 1

.org 0x8008FB68
.dw (SCREEN_W/2) //Fix X Position of Game Over Sprite 2

.org 0x8008FB84
.dw (SCREEN_W/2) //Fix X Position of Game Over Sprite 3

.org 0x8008FBA4
.float (SCREEN_W_FLOAT/2) //Fix X Position of Option 1 in Game Over

.org 0x8008FBB4
.float (SCREEN_W_FLOAT/2) //Fix X Position of Option 2 in Game Over

.org 0x8008FBC4
.float (SCREEN_W_FLOAT/2) //Fix X Position of Option 3 in Game Over

.org 0x8008FBD0
.dw (SCREEN_W/2) //Fix X Position of Game Over Exit Sprite 1

.org 0x8008FBEC
.dw (SCREEN_W/2) //Fix X Position of Game Over Exit Sprite 2

.org 0x8008FC08
.dw (SCREEN_W/2) //Fix X Position of Game Over Quit Sprite 1

.org 0x8008FC24
.dw (SCREEN_W/2) //Fix X Position of Game Over Quit Sprite 2

.org 0x8008FE34
.dw (SCREEN_W-80) //Fix X Position of Exit World Cursor

.org 0x8008FE50
.dw ((SCREEN_W/2)+6) //Fix X Position of Exit World No Cursor

.org 0x8008FE6C
.dw ((SCREEN_W/2)+6) //Fix X Position of Exit World Yes Cursor

.org 0x80092B88
.dw SCREEN_W //VI Framebuffer Width

.org 0x80092BA0
.dw ((SCREEN_W*512)/320) //VI Framebuffer Width

.org 0x80092BA8
.dw (SCREEN_W*2) //VI Field 1 Framebuffer Offset

.org 0x80092BBC
.dw (SCREEN_W*2) //VI Field 2 Framebuffer Offset

.org 0x80093448
.dw SCREEN_W //VI MPAL Framebuffer Width

.org 0x80093460
.dw ((SCREEN_W*512)/320) //VI MPAL Framebuffer Width

.org 0x80093468
.dw (SCREEN_W*2) //VI MPAL Field 1 Framebuffer Offset

.org 0x8009347C
.dw (SCREEN_W*2) //VI MPAL Field 2 Framebuffer Offset

.org 0x80094A88
.float (SCREEN_W_FLOAT/SCREEN_H) //Fix Default Aspect Ratio

.org 0x80095820
.float (SCREEN_W_FLOAT/SCREEN_H) //Fix Battle Exit Aspect Ratio

.org 0x80095830
.float (SCREEN_W_FLOAT/SCREEN_H) //Fix Gamescene Default Aspect Ratio

.org 0x80095880
.float (SCREEN_W_FLOAT/SCREEN_H) //Fix Gamescene Exit Aspect Ratio

.close

.open "extract/evblock/25.bin", 0x60000000 //Controller Pak Screen

.org 0x60001C8C
addiu a0, r0, (SCREEN_W/2) //Fix X Position of 1st Row on Controller Pak Screen

.org 0x60001E64
addiu a0, r0, ((SCREEN_W/2)-38) //Fix X Position of Text on Game Pak Screen

.org 0x60002050
li.u at, (SCREEN_W_FLOAT/2) //Fix Center X Position of Controller Pak Screen

.org 0x6000219C
addiu a0, r0, ((SCREEN_W/2)-60) //Fix X Position of Cursor on Controller Pak Screen

.org 0x600022B8
addiu a0, r0, ((SCREEN_W/2)-60) //Fix X Position of Cursor on Controller Pak Screen

.org 0x600023D0
addiu a0, r0, ((SCREEN_W/2)-60) //Fix X Position of Cursor on Controller Pak Screen

.org 0x600024D8
addiu a0, r0, ((SCREEN_W/2)-60) //Fix X Position of Cursor on Controller Pak Screen

.org 0x600025E4
addiu a0, r0, ((SCREEN_W/2)-60) //Fix X Position of Cursor on Controller Pak Screen

.org 0x60002704
addiu a0, r0, (SCREEN_W/2) //Fix X Position of 1st Row on Controller Pak Screen

.org 0x600027BC
addiu a0, r0, ((SCREEN_W/2)+120) //Fix X Position of Page Number on Controller Pak Screen

.org 0x60002BAC
addiu a0, r0, ((SCREEN_W/2)-5) //Fix X Position of Rows on Controller Pak Screen

.org 0x60002EC4
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Bottom Row on Controller Pak Screen

.org 0x600030CC
addiu a0, r0, ((SCREEN_W/2)+120) //Fix X Position of Page Number on Controller Pak Screen

.org 0x60003214
.dw (SCREEN_W/2) //Fix X Position of Erase Game Pak Memory Text

.org 0x60003228
.dw (SCREEN_W/2) //Fix X Position of Erase Game Pak Question Top Line

.org 0x6000323C
.dw (SCREEN_W/2) //Fix X Position of Erase Game Pak Question Bottom Line

.org 0x60003250
.dw (SCREEN_W/2) //Fix X Position of Erase Game Pak Question Choices

.org 0x60003264
.dw (SCREEN_W/2) //Fix X Position of Are You Sure Question

.org 0x60003278
.dw (SCREEN_W/2) //Fix X Position of Erased Text

.org 0x6000328C
.dw (SCREEN_W/2) //Fix X Position of Top Text in Controller Pak Menu

.org 0x600032A0
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x600032B4
.dw ((SCREEN_W/2)-5) //Fix X Position of Column Names in Controller Pak Menu

.org 0x600032C8
.dw ((SCREEN_W/2)+36) //Fix X Position of Remaining Pages Text in Controller Pak Menu

.org 0x600032DC
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x600032F0
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x60003304
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x60003318
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x6000332C
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x60003340
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x60003354
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x60003368
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x6000337C
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x60003390
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x600033A4
.dw (SCREEN_W/2) //Fix X Position of Choices in Controller Pak Menu

.org 0x600033B8
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x600033CC
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x600033E0
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x600033F4
.dw (SCREEN_W/2) //Fix X Position of Delete Text in Controller Pak Menu

.org 0x60003408
.dw (SCREEN_W/2) //Fix X Position of Background in Controller Pak Menu

.org 0x6000341C
.dw (SCREEN_W/2) //Fix X Position of Continue Choices in Controller Pak Menu

.org 0x60003430
.dw (SCREEN_W/2) //Fix X Position of Center Text in Controller Pak Menu

.org 0x60003444
.dw (SCREEN_W/2) //Fix X Position of Bottom Text in Controller Pak Menu

.org 0x6000346C
.dw ((SCREEN_W/2)-38) //Fix X Position of Left Choice in Game Pak Menu

.org 0x60003488
.dw ((SCREEN_W/2)+36) //Fix X Position of Right Choice in Game Pak Menu

.org 0x600034A4
.dw ((SCREEN_W/2)-60) //Fix X Position of Left Choice in Controller Pak Menu

.org 0x600034C0
.dw ((SCREEN_W/2)+42) //Fix X Position of Right Choice in Controller Pak Menu

.org 0x600034DC
.dw ((SCREEN_W/2)-40) //Fix X Position of Left Choice in Controller Pak Menu

.org 0x600034F8
.dw ((SCREEN_W/2)+44) //Fix X Position of Right Choice in Controller Pak Menu

.org 0x60003514
.dw (SCREEN_W/2) //Fix X Position of Bottom Choice

.org 0x60003530
.dw (SCREEN_W/2) //Fix X Position of Top Choice

.org 0x6000354C
.dw (SCREEN_W/2) //Fix X Position of Bottom Choice

.org 0x60003568
.dw ((SCREEN_W/2)-40) //Fix X Position of Left Choice

.org 0x60003584
.dw ((SCREEN_W/2)+48) //Fix X Position of Right Choice

.org 0x600035A0
.dw ((SCREEN_W/2)-34) //Fix X Position of Left Choice

.org 0x600035BC
.dw ((SCREEN_W/2)+36) //Fix X Position of Right Choice

.org 0x600035D8
.dw ((SCREEN_W/2)-38) //Fix X Position of Left Choice

.org 0x600035F4
.dw ((SCREEN_W/2)+36) //Fix X Position of Right Choice

.close

.open "extract/evblock/26.bin", 0x60000000 //Logos/Title

.org 0x600021F4
li.u at, (((SCREEN_W_FLOAT*750)/320)-50) //Fix Start X Position of Screen Enter

.org 0x60002BF0
addiu a1, r0, 160 //Fix Width of Options Background

.org 0x60002BF8
addiu a2, r0, 100 //Fix Height of Options Background

.org 0x60002F10
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Logos

.org 0x60003008
addiu a0, r0, (SCREEN_W/2) //Fix Legal Screen

.org 0x60003064
li.u a1, ((SCREEN_W_FLOAT/2)-80) //Fix Legal Screen Copyright

.org 0x600030E0
addiu a0, r0, (SCREEN_W/2) //Fix Controller Warning Screen

.org 0x600031B0
//Fix BG Scaling of Title Screen
li.u a1, (SCREEN_W_FLOAT/160)
li.u a2, (SCREEN_W_FLOAT/160)

.org 0x60003230
addiu t4, r0, (SCREEN_W-8) //Fix Title SCreen Sprite Width

.org 0x60003AA0
addiu a1, r0, 160 //Fix Width of Options Background

.org 0x60003AA8
addiu a2, r0, 60 //Fix Height of Options Background

.org 0x60003AE0
addiu t4, t3, ((SCREEN_W/2)-8) //Fix X Position of Music Cursor

.org 0x60003B10
addiu t7, t6, ((SCREEN_W/2)-8) //Fix X Position of SE Cursor

.org 0x60004010
addiu t0, t1, ((SCREEN_W/2)-8) //Fix X Position of Music Cursor

.org 0x6000412C
addiu t6, t5, ((SCREEN_W/2)-8) //Fix X Position of SE Cursor

.org 0x60004454
.dw (SCREEN_W/2) //Fix X Position of Title BG Sprite

.org 0x60004468
.dw (SCREEN_W/2) //Fix X Position of Title Logo Sprite

.org 0x6000447C
.dw (SCREEN_W/2) //Fix X Position of Title Story Mode Sprite

.org 0x60004490
.dw (SCREEN_W/2) //Fix X Position of Title Battle Mode Sprite

.org 0x600044A4
.dw (SCREEN_W/2) //Fix X Position of Title Custom Mode Sprite

.org 0x600044B8
.dw (SCREEN_W/2) //Fix X Position of Title Option Mode Sprite

.org 0x600044CC
.dw (SCREEN_W/2) //Fix X Position of Title Tutorial Mode Sprite

.org 0x600044E0
.dw (SCREEN_W/2) //Fix X Position of Title Copyright Sprite

.org 0x6000456C
.dw (SCREEN_W/2) //Fix X Position of Options Background

.org 0x60004580
.dw (SCREEN_W/2) //Fix X Position of Options Header

.org 0x60004594
.dw ((SCREEN_W/2)+56) //Fix X Position of Music Volume

.org 0x600045A8
.dw ((SCREEN_W/2)+56) //Fix X Position of SE Volume

.org 0x600045BC
.dw ((SCREEN_W/2)-4) //Fix X Position of Music Volume Left

.org 0x600045D0
.dw ((SCREEN_W/2)-4) //Fix X Position of SE Volume Left

.org 0x600045E4
.dw ((SCREEN_W/2)+120) //Fix X Position of Music Volume Right

.org 0x600045F8
.dw ((SCREEN_W/2)+120) //Fix X Position of SE Volume Right

.org 0x6000460C
.dw (SCREEN_W/2) //Fix X Position of Return Icon

.org 0x60004620
.dw ((SCREEN_W/2)+16) //Fix X Position of Stereo Icon

.org 0x60004634
.dw ((SCREEN_W/2)+85) //Fix X Position of Mono Icon

.org 0x60004648
.dw ((SCREEN_W/2)-80) //Fix X Position of Audio Icon

.org 0x6000465C
.dw ((SCREEN_W/2)-80) //Fix X Position of Music Icon

.org 0x60004670
.dw ((SCREEN_W/2)-80) //Fix X Position of SE Icon

.org 0x60004684
.dw ((SCREEN_W/2)-80) //Fix X Position of Skip Demo

.org 0x60004698
.dw ((SCREEN_W/2)-80) //Fix X Position of BGM Test

.org 0x600046AC
.dw (SCREEN_W/2) //Fix X Position of Help

.org 0x600046C0
.dw ((SCREEN_W/2)-80) //Fix X Position of Unknown Choice 1

.org 0x600046D4
.dw ((SCREEN_W/2)-80) //Fix X Position of Unknown Choice 1

.org 0x600046E8
.dw (SCREEN_W/2) //Fix X Position of BGM Number

.org 0x600046FC
.dw ((SCREEN_W/2)+22) //Fix X Position of Skip Demo On Option

.org 0x60004710
.dw ((SCREEN_W/2)+78) //Fix X Position of Skip Demo Off Option

.org 0x6000474C
.dw ((SCREEN_W/2)-60) //Fix X Position of Title Screen Letter Sprite 1

.org 0x60004760
.dw ((SCREEN_W/2)-48) //Fix X Position of Title Screen Letter Sprite 2

.org 0x60004774
.dw ((SCREEN_W/2)-36) //Fix X Position of Title Screen Letter Sprite 3

.org 0x60004788
.dw ((SCREEN_W/2)-24) //Fix X Position of Title Screen Letter Sprite 4

.org 0x6000479C
.dw ((SCREEN_W/2)-12) //Fix X Position of Title Screen Letter Sprite 5

.org 0x600047B0
.dw ((SCREEN_W/2)-0) //Fix X Position of Title Screen Letter Sprite 6

.org 0x600047C4
.dw ((SCREEN_W/2)+12) //Fix X Position of Title Screen Letter Sprite 7

.org 0x600047D8
.dw ((SCREEN_W/2)+24) //Fix X Position of Title Screen Letter Sprite 8

.org 0x600047EC
.dw ((SCREEN_W/2)+36) //Fix X Position of Title Screen Letter Sprite 9

.org 0x60004800
.dw ((SCREEN_W/2)+48) //Fix X Position of Title Screen Letter Sprite 10

.org 0x6000489C
.dw (SCREEN_W/2) //Fix X Position of Tutorial Menu Background

.org 0x600048B0
.dw (SCREEN_W/2) //Fix X Position of Tutorial Header

.org 0x600048C4
.dw (SCREEN_W/2) //Fix X Position of Tutorial 1 Choice

.org 0x600048D8
.dw (SCREEN_W/2) //Fix X Position of Tutorial 2 Choice

.org 0x60004920
.float ((((SCREEN_W_FLOAT*750)/320)-400)/30) //Fix Speed of Exit Movement on Title Screen

.org 0x60004928
.float ((((SCREEN_W_FLOAT*750)/320)-400)/30) //Fix Speed of Exit Movement on Title Screen

.close

.open "extract/evblock/28.bin", 0x60000000 //Battle Screens

.org 0x60003914
addiu a1, r0, ((SCREEN_W/2)-8) //Fix Width of Background in Main Menu

.org 0x60003DA0
li.u at, (SCREEN_W_FLOAT/2) //Fix Battle Type Icon Centering

.org 0x60003EA8
li.u a1, (SCREEN_W_FLOAT/2) //Fix Final Battle Type Icon Centering

.org 0x60003FCC
li.u at, ((SCREEN_W_FLOAT/2)-120) //Fix Text Rectangle Centering

.org 0x600040D0
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Battle Text Description

.org 0x60004484
li.u at, (SCREEN_W_FLOAT/2) //Fix Battle Type Icon Decentering

.org 0x60004788
li.u a1, (SCREEN_W_FLOAT/2) //Fix Final Battle Type Icon Centering

.org 0x60004834
li.u a1, (SCREEN_W_FLOAT/2) //Fix Final Battle Type Icon Centering

.org 0x60004880
li.u at, ((SCREEN_W_FLOAT/2)-136) //Fix Battle Options Menu Centering

.org 0x60005CA8
li.u a1, (SCREEN_W_FLOAT/2) //Fix Final Battle Type Icon Centering

.org 0x60005D54
li.u a1, (SCREEN_W_FLOAT/2) //Fix Final Battle Type Icon Centering

.org 0x60005DE4
li.u at, ((SCREEN_W_FLOAT/2)-120) //Fix Text Rectangle Centering

.org 0x60005EDC
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Challenge Text Description

.org 0x60006550
li.u at, ((SCREEN_W_FLOAT/2)-132) //Fix Initial X Position of Character Select Cursor

.org 0x600065B8
li.u at, ((SCREEN_W_FLOAT/2)-132) //Fix X Position of Character Select Background

.org 0x600067E8
addiu a1, r0, ((SCREEN_W/2)-8) //Fix Width of Background in Character Select

.org 0x60006AAC
addiu t0, t5, ((SCREEN_W/2)-132) //Fix X Offset of Character Select Cursor

.org 0x6000761C
li.u at, ((SCREEN_W_FLOAT/2)-112) //Fix Stage Rectangle

.org 0x60007684
li.u at, ((SCREEN_W_FLOAT/2)-96) //Fix Stage Name Rectangle

.org 0x60007744
addiu a1, r0, ((SCREEN_W/2)-8) //Fix Width of Background in Stage Select

.org 0x60007CD4
li.u at, ((SCREEN_W_FLOAT/2)-132) //Fix X Position of Top Team

.org 0x60007D3C
li.u at, ((SCREEN_W_FLOAT/2)-132) //Fix X Position of Bottom Team

.org 0x60007DA4
li.u at, ((SCREEN_W_FLOAT/2)-128) //Fix X Position of White Rectangle

.org 0x60007F14
addiu a1, r0, ((SCREEN_W/2)-8) //Fix Width of Background in Team Select

.org 0x60008364
li.u at, ((SCREEN_W_FLOAT/2)-70) //Fix X Position of King Life Box

.org 0x600088A8
addiu t9, t8, ((SCREEN_W/2)-128) //Fix X Position of White Rectangle

.org 0x600088D8
addiu t2, t5, ((SCREEN_W/2)-102) //Fix X Position of White Rectangle Cursor

.org 0x60008A7C
li.u at, ((SCREEN_W_FLOAT/2)-88) //Fix X Position of Win Team 1 Bar

.org 0x60008AE4
li.u at, ((SCREEN_W_FLOAT/2)-88) //Fix X Position of Win Team 2 Bar

.org 0x60008B50
li.u at, ((SCREEN_W_FLOAT/2)-88) //Fix X Position of Win Player 1 Bar

.org 0x60008BB4
li.u at, ((SCREEN_W_FLOAT/2)-88) //Fix X Position of Win Player 2 Bar

.org 0x60008C18
li.u at, ((SCREEN_W_FLOAT/2)-88) //Fix X Position of Win Player 3 Bar

.org 0x60008C80
li.u at, ((SCREEN_W_FLOAT/2)-88) //Fix X Position of Win Player 4 Bar

.org 0x60008DDC
li.u a1, (SCREEN_W_FLOAT/160) //Fix BG X Scaling of Win Background

.org 0x60008DE4
li.u a2, (SCREEN_W_FLOAT/160) //Fix BG Y Scaling of Win Background

.org 0x6000A76C
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Victory Text

.org 0x6000A858
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Battle Win Text

.org 0x6000A8E0
li.u a1, ((SCREEN_W_FLOAT/2)+41) //Fix X Position of Battle Win Trophy

.org 0x6000AA04
addiu a0, r0, (SCREEN_W/2) //Fix X Position of New Battle Mode Text

.org 0x6000AEAC
.dw (SCREEN_W/2) //Fix X Position of Stage Select Background

.org 0x6000AEC0
.dw ((SCREEN_W/2)-40) //Fix X Position of Stage Text

.org 0x6000AED4
.dw ((SCREEN_W/2)+44) //Fix X Position of Select Text

.org 0x6000AEE8
.dw ((SCREEN_W/2)-124) //Fix X Position of Left Arrow

.org 0x6000AEFC
.dw ((SCREEN_W/2)+124) //Fix X Position of Right Arrow

.org 0x6000AF10
.dw (SCREEN_W/2) //Fix X Position of Stage Name

.org 0x6000B0C8
.dw (SCREEN_W/2) //Fix X Position of Battle Type Background

.org 0x6000B0DC
.dw ((SCREEN_W/2)-72) //Fix X Position of Battle Text

.org 0x6000B0F0
.dw ((SCREEN_W/2)-8) //Fix X Position of Battle Text

.org 0x6000B104
.dw ((SCREEN_W/2)+64) //Fix X Position of Select Text

.org 0x6000B118
.dw ((SCREEN_W/2)+112) //Fix X Position of Options Button

.org 0x6000B12C
.dw ((SCREEN_W/2)-88) //Fix X Position of Battle Mode 1 Icon

.org 0x6000B140
.dw ((SCREEN_W/2)+88) //Fix X Position of Battle Mode 2 Icon

.org 0x6000B154
.dw (SCREEN_W/2) //Fix X Position of Battle Mode 3 Icon

.org 0x6000B168
.dw ((SCREEN_W/2)-88) //Fix X Position of Battle Mode 1 Icon

.org 0x6000B17C
.dw ((SCREEN_W/2)+88) //Fix X Position of Battle Mode 2 Icon

.org 0x6000B190
.dw ((SCREEN_W/2)-72) //Fix X Position of Trophy 1 Icon

.org 0x6000B1A4
.dw ((SCREEN_W/2)-56) //Fix X Position of Trophy 2 Icon

.org 0x6000B1B8
.dw ((SCREEN_W/2)-40) //Fix X Position of Trophy 3 Icon

.org 0x6000B1CC
.dw ((SCREEN_W/2)-24) //Fix X Position of Trophy 4 Icon

.org 0x6000B1E0
.dw ((SCREEN_W/2)-8) //Fix X Position of Trophy 5 Icon

.org 0x6000B1F4
.dw ((SCREEN_W/2)-48) //Fix X Position of Battle Text

.org 0x6000B208
.dw ((SCREEN_W/2)+32) //Fix X Position of Battle Text

.org 0x6000B21C
.dw ((SCREEN_W/2)-112) //Fix X Position of Challenge Button

.org 0x6000B230
.dw ((SCREEN_W/2)-98) //Fix X Position of Time Option

.org 0x6000B244
.dw ((SCREEN_W/2)-8) //Fix X Position of Time 30 Option

.org 0x6000B258
.dw ((SCREEN_W/2)+32) //Fix X Position of Time 60 Option

.org 0x6000B26C
.dw ((SCREEN_W/2)+72) //Fix X Position of Time 99 Option

.org 0x6000B280
.dw ((SCREEN_W/2)+112) //Fix X Position of Time Infinity Option

.org 0x6000B294
.dw ((SCREEN_W/2)-104) //Fix X Position of Win Option

.org 0x6000B2A8
.dw ((SCREEN_W/2)+32) //Fix X Position of Win 1 Option

.org 0x6000B2BC
.dw ((SCREEN_W/2)+72) //Fix X Position of Win 3 Option

.org 0x6000B2D0
.dw ((SCREEN_W/2)+112) //Fix X Position of Win 5 Option

.org 0x6000B2E4
.dw ((SCREEN_W/2)-60) //Fix X Position of Suddendeath Option

.org 0x6000B2F8
.dw ((SCREEN_W/2)+48) //Fix X Position of Suddendeath On Option

.org 0x6000B30C
.dw ((SCREEN_W/2)+104) //Fix X Position of Suddendeath Off Option

.org 0x6000B320
.dw ((SCREEN_W/2)-83) //Fix X Position of Shuffle Option

.org 0x6000B334
.dw ((SCREEN_W/2)+48) //Fix X Position of Shuffle On Option

.org 0x6000B348
.dw ((SCREEN_W/2)+104) //Fix X Position of Shuffle Off Option

.org 0x6000B35C
.dw ((SCREEN_W/2)-90) //Fix X Position of Ghost Option

.org 0x6000B370
.dw ((SCREEN_W/2)+48) //Fix X Position of Ghost On Option

.org 0x6000B384
.dw ((SCREEN_W/2)+104) //Fix X Position of Ghost Off Option

.org 0x6000B398
.dw ((SCREEN_W/2)-80) //Fix X Position of Japanese Option

.org 0x6000B3AC
.dw ((SCREEN_W/2)+32) //Fix X Position of Japanese 2 Option

.org 0x6000B3C0
.dw ((SCREEN_W/2)+72) //Fix X Position of Japanese 4 Option

.org 0x6000B3D4
.dw ((SCREEN_W/2)+112) //Fix X Position of Japanese 6 Option

.org 0x6000B474
.dw ((SCREEN_W/2)-96) //Fix X Position of Character 1

.org 0x6000B488
.dw ((SCREEN_W/2)-96) //Fix X Position of Character 2

.org 0x6000B49C
.dw ((SCREEN_W/2)-96) //Fix X Position of Character 3

.org 0x6000B4B0
.dw ((SCREEN_W/2)-48) //Fix X Position of Character 4

.org 0x6000B4C4
.dw ((SCREEN_W/2)-48) //Fix X Position of Character 5

.org 0x6000B4D8
.dw ((SCREEN_W/2)-48) //Fix X Position of Character 6

.org 0x6000B4EC
.dw ((SCREEN_W/2)-0) //Fix X Position of Character 7

.org 0x6000B500
.dw ((SCREEN_W/2)-0) //Fix X Position of Character 8

.org 0x6000B514
.dw ((SCREEN_W/2)-0) //Fix X Position of Character 9

.org 0x6000B528
.dw ((SCREEN_W/2)+48) //Fix X Position of Character 10

.org 0x6000B53C
.dw ((SCREEN_W/2)+48) //Fix X Position of Character 11

.org 0x6000B550
.dw ((SCREEN_W/2)+48) //Fix X Position of Character 12

.org 0x6000B564
.dw ((SCREEN_W/2)+96) //Fix X Position of Character 13

.org 0x6000B578
.dw ((SCREEN_W/2)+96) //Fix X Position of Character 14

.org 0x6000B58C
.dw ((SCREEN_W/2)+96) //Fix X Position of Character 15

.org 0x6000B59C
.dw ((SCREEN_W/2)-96) //Fix X Position of Character 1 Cursor

.org 0x6000B5B8
.dw ((SCREEN_W/2)-96) //Fix X Position of Character 2 Cursor

.org 0x6000B5D4
.dw ((SCREEN_W/2)-96) //Fix X Position of Character 3 Cursor

.org 0x6000B5F0
.dw ((SCREEN_W/2)-48) //Fix X Position of Character 4 Cursor

.org 0x6000B60C
.dw ((SCREEN_W/2)-48) //Fix X Position of Character 5 Cursor

.org 0x6000B628
.dw ((SCREEN_W/2)-48) //Fix X Position of Character 6 Cursor

.org 0x6000B644
.dw ((SCREEN_W/2)-0) //Fix X Position of Character 7 Cursor

.org 0x6000B660
.dw ((SCREEN_W/2)-0) //Fix X Position of Character 8 Cursor

.org 0x6000B67C
.dw ((SCREEN_W/2)-0) //Fix X Position of Character 9 Cursor

.org 0x6000B698
.dw ((SCREEN_W/2)+48) //Fix X Position of Character 10 Cursor

.org 0x6000B6B4
.dw ((SCREEN_W/2)+48) //Fix X Position of Character 11 Cursor

.org 0x6000B6D0
.dw ((SCREEN_W/2)+48) //Fix X Position of Character 12 Cursor

.org 0x6000B6EC
.dw ((SCREEN_W/2)+96) //Fix X Position of Character 13 Cursor

.org 0x6000B708
.dw ((SCREEN_W/2)+96) //Fix X Position of Character 14 Cursor

.org 0x6000B724
.dw ((SCREEN_W/2)+96) //Fix X Position of Character 15 Cursor

.org 0x6000B76C
.dw (SCREEN_W/2) //Fix X Position of Character Select Background

.org 0x6000B780
.dw ((SCREEN_W/2)-40) //Fix X Position of Character Text

.org 0x6000B794
.dw ((SCREEN_W/2)+60) //Fix X Position of Select Text

.org 0x6000B7A8
.dw ((SCREEN_W/2)-124) //Fix X Position of P1 Player Number

.org 0x6000B7BC
.dw ((SCREEN_W/2)-56) //Fix X Position of P2 Player Number

.org 0x6000B7D0
.dw ((SCREEN_W/2)+12) //Fix X Position of P3 Player Number

.org 0x6000B7E4
.dw ((SCREEN_W/2)+80) //Fix X Position of P4 Player Number

.org 0x6000B7F8
.dw ((SCREEN_W/2)-116) //Fix X Position of P1 Player Text

.org 0x6000B80C
.dw ((SCREEN_W/2)-48) //Fix X Position of P2 Player Text

.org 0x6000B820
.dw ((SCREEN_W/2)+20) //Fix X Position of P3 Player Text

.org 0x6000B834
.dw ((SCREEN_W/2)+88) //Fix X Position of P4 Player Text

.org 0x6000B848
.dw ((SCREEN_W/2)-102) //Fix X Position of P1 Player Type Text

.org 0x6000B85C
.dw ((SCREEN_W/2)-34) //Fix X Position of P2 Player Type Text

.org 0x6000B870
.dw ((SCREEN_W/2)+34) //Fix X Position of P3 Player Type Text

.org 0x6000B884
.dw ((SCREEN_W/2)+102) //Fix X Position of P4 Player Type Text

.org 0x6000B898
.dw ((SCREEN_W/2)-102) //Fix X Position of P1 Nothing Text

.org 0x6000B8AC
.dw ((SCREEN_W/2)-34) //Fix X Position of P2 Nothing Text

.org 0x6000B8C0
.dw ((SCREEN_W/2)+34) //Fix X Position of P3 Nothing Text

.org 0x6000B8D4
.dw ((SCREEN_W/2)+102) //Fix X Position of P4 Nothing Text

.org 0x6000B8E8
.dw ((SCREEN_W/2)+96) //Fix X Position of P4 Nothing Text

.org 0x6000B95C
.dw (SCREEN_W/2) //Fix X Position of Team Setup Background

.org 0x6000B970
.dw ((SCREEN_W/2)-44) //Fix X Position of Member Text

.org 0x6000B984
.dw ((SCREEN_W/2)+44) //Fix X Position of Select Text

.org 0x6000B998
.dw ((SCREEN_W/2)+18) //Fix X Position of Top Team Text

.org 0x6000B9AC
.dw ((SCREEN_W/2)+18) //Fix X Position of Bottom Team Text

.org 0x6000B9C0
.dw (SCREEN_W/2) //Fix X Position of Vs Text

.org 0x6000B9D4
.dw (SCREEN_W/2) //Fix X Position of King Life Text

.org 0x6000B9E8
.dw (SCREEN_W/2) //Fix X Position of King Life Values

.org 0x6000B9FC
.dw ((SCREEN_W/2)-80) //Fix X Position of King Life Cursor

.org 0x6000BA10
.dw ((SCREEN_W/2)-28) //Fix X Position of Top Team Icon

.org 0x6000BA24
.dw ((SCREEN_W/2)-28) //Fix X Position of Bottom Team Icon

.org 0x6000BA38
.dw ((SCREEN_W/2)-102) //Fix X Position of Team Cursor

.org 0x6000BB08
.dw ((SCREEN_W/2)-72) //Fix X Position of Win Count

.org 0x6000BB1C
.dw ((SCREEN_W/2)+16) //Fix X Position of Win Count

.org 0x6000BE8C
.dw ((SCREEN_W/2)-35) //Fix X Position of King Life 4 Cursor
.dw ((SCREEN_W/2)-5) //Fix X Position of King Life 7 Cursor
.dw ((SCREEN_W/2)+31) //Fix X Position of King Life 10 Cursor

.org 0x6000BFE0
.float -(((SCREEN_W_FLOAT/2)-41.45)*8.941368913) //Fix X Position of Character Select 3D Background
.float -(((SCREEN_W_FLOAT/2)-41.45)*8.941368913) //Fix X Position of Stage Select 3D Background
.float -(((SCREEN_W_FLOAT/2)-41.45)*8.941368913) //Fix X Position of Team Select 3D Background

.close

.open "extract/evblock/27.bin", 0x60000000 //File Select

.org 0x60001D58
li.u at, (SCREEN_W_FLOAT/160) //Fix BG Scaling of File Select

.org 0x60001E2C
li.u at, ((SCREEN_W_FLOAT/2)-128) //Fix X Position of File Select Cursor

.org 0x600021C8
li.u at, ((SCREEN_W_FLOAT/2)+16) //Fix X Position of File Select Copy Cursor

.org 0x60002BDC
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Game Pak Memory Problem Text

.org 0x60002E14
.dw (SCREEN_W/2) //Fix X Position of File Select Background

.org 0x60002E28
.dw (SCREEN_W/2) //Fix X Position of File Select Text

.org 0x60002E3C
.dw (SCREEN_W/2) //Fix X Position of File 1 New Text

.org 0x60002E50
.dw (SCREEN_W/2) //Fix X Position of File 2 New Text

.org 0x60002E64
.dw (SCREEN_W/2) //Fix X Position of File 3 New Text

.org 0x60002E78
.dw (SCREEN_W/2) //Fix X Position of File 1 Text

.org 0x60002E8C
.dw (SCREEN_W/2) //Fix X Position of File 2 Text

.org 0x60002EA0
.dw (SCREEN_W/2) //Fix X Position of File 3 Text

.org 0x60002EB4
.dw ((SCREEN_W/2)+72) //Fix X Position of File 1 Money

.org 0x60002EC8
.dw ((SCREEN_W/2)+72) //Fix X Position of File 2 Money

.org 0x60002EDC
.dw ((SCREEN_W/2)+72) //Fix X Position of File 3 Money

.org 0x60002EF0
.dw ((SCREEN_W/2)-104) //Fix X Position of File 1 Emblem 1

.org 0x60002F04
.dw ((SCREEN_W/2)-88) //Fix X Position of File 1 Emblem 2

.org 0x60002F18
.dw ((SCREEN_W/2)-72) //Fix X Position of File 1 Emblem 3

.org 0x60002F2C
.dw ((SCREEN_W/2)-56) //Fix X Position of File 1 Emblem 4

.org 0x60002F40
.dw ((SCREEN_W/2)-40) //Fix X Position of File 1 Emblem 5

.org 0x60002F54
.dw ((SCREEN_W/2)-24) //Fix X Position of File 1 Emblem 6

.org 0x60002F68
.dw ((SCREEN_W/2)-8) //Fix X Position of File 1 Emblem 7

.org 0x60002F7C
.dw ((SCREEN_W/2)-104) //Fix X Position of File 2 Emblem 1

.org 0x60002F90
.dw ((SCREEN_W/2)-88) //Fix X Position of File 2 Emblem 2

.org 0x60002FA4
.dw ((SCREEN_W/2)-72) //Fix X Position of File 2 Emblem 3

.org 0x60002FB8
.dw ((SCREEN_W/2)-56) //Fix X Position of File 2 Emblem 4

.org 0x60002FCC
.dw ((SCREEN_W/2)-40) //Fix X Position of File 2 Emblem 5

.org 0x60002FE0
.dw ((SCREEN_W/2)-24) //Fix X Position of File 2 Emblem 6

.org 0x60002FF4
.dw ((SCREEN_W/2)-8) //Fix X Position of File 2 Emblem 7

.org 0x60003008
.dw ((SCREEN_W/2)-104) //Fix X Position of File 3 Emblem 1

.org 0x6000301C
.dw ((SCREEN_W/2)-88) //Fix X Position of File 3 Emblem 2

.org 0x60003030
.dw ((SCREEN_W/2)-72) //Fix X Position of File 3 Emblem 3

.org 0x60003044
.dw ((SCREEN_W/2)-56) //Fix X Position of File 3 Emblem 4

.org 0x60003058
.dw ((SCREEN_W/2)-40) //Fix X Position of File 3 Emblem 5

.org 0x6000306C
.dw ((SCREEN_W/2)-24) //Fix X Position of File 3 Emblem 6

.org 0x60003080
.dw ((SCREEN_W/2)-8) //Fix X Position of File 3 Emblem 7

.org 0x60003094
.dw ((SCREEN_W/2)-72) //Fix X Position of Erase File Text

.org 0x600030A8
.dw ((SCREEN_W/2)+72) //Fix X Position of Copy File Text

.org 0x600030BC
.dw (SCREEN_W/2) //Fix X Position of Erase Confirm Text

.org 0x600030D0
.dw (SCREEN_W/2) //Fix X Position of Copy Confirm Text

.org 0x600030E4
.dw ((SCREEN_W/2)-32) //Fix X Position of Yes Text

.org 0x600030F8
.dw ((SCREEN_W/2)+24) //Fix X Position of No Text

.org 0x6000310C
.dw ((SCREEN_W/2)+24) //Fix X Position of File 1 Money Icon

.org 0x60003120
.dw ((SCREEN_W/2)+24) //Fix X Position of File 2 Money Icon

.org 0x60003134
.dw ((SCREEN_W/2)+24) //Fix X Position of File 3 Money Icon

.org 0x60003148
.dw ((SCREEN_W/2)-108) //Fix X Position of Erase File Source

.org 0x6000315C
.dw ((SCREEN_W/2)-72) //Fix X Position of Erase File Arrow

.org 0x60003170
.dw ((SCREEN_W/2)-36) //Fix X Position of Erase File Destination

.org 0x60003184
.dw ((SCREEN_W/2)+36) //Fix X Position of Copy File Source

.org 0x60003198
.dw ((SCREEN_W/2)+72) //Fix X Position of Copy File Arrow

.org 0x600031AC
.dw ((SCREEN_W/2)+108) //Fix X Position of Copy File Destination

.org 0x600031C0
.dw (SCREEN_W/2) //Fix X Position of Erase File Header

.org 0x600031D4
.dw (SCREEN_W/2) //Fix X Position of Copy File Header

.org 0x600031E8
.dw (SCREEN_W/2) //Fix X Position of File Erased Text

.org 0x600031FC
.dw (SCREEN_W/2) //Fix X Position of File Copied Text

.close

.open "extract/evblock/29.bin", 0x60000000 //Customize Menus

.org 0x6000231C
li.u at, ((SCREEN_W_FLOAT/2)-128) //Fix X Position of Customize Controller Pak Window

.org 0x60002B54
li.u at, ((SCREEN_W_FLOAT/2)+16) //Fix X Position of Customize Selection

.org 0x60002D4C
addiu a1, r0, (SCREEN_W/2) //Fix Width of Customize Background

.org 0x60003150
li.u at, ((SCREEN_W_FLOAT/2)-128) //Fix X Position of Customize File Cursor

.org 0x6000341C
swc1 f26, 0x1C(v0) //Fix Initial X Position of Customize Select

.org 0x60003424
addiu t4, r0, 96 //Fix Width X Position of Customize Select

.org 0x60003498
addiu a1, r0, (SCREEN_W/2) //Fix Width of Customize Background

.org 0x600034A0
addiu a2, r0, 120 //Fix Height of Customize Background

.org 0x600035CC
//Fix Selection Rectangle for Customize
addiu t2, r0, 96
swc1 f26, 0x1C(t8)

.org 0x600036E0
li.u at, ((SCREEN_W_FLOAT/2)-130) //Fix X Position of Changes Made Window

.org 0x60003944
li.u at, ((SCREEN_W_FLOAT/2)-125) //Fix X Position of Save Menu Cursor

.org 0x600039C4
addiu a1, r0, (SCREEN_W/2) //Fix Width of Customize Name Background

.org 0x600039CC
addiu a2, r0, 120 //Fix Height of Customize Background

.org 0x60003E3C
li.u at, ((SCREEN_W_FLOAT/2)-64) //Fix Initial X Position of Save Menu Cursor

.org 0x6000424C
addiu t0, t9, ((SCREEN_W/2)-64) //Fix X Position of Save Menu Cursor

.org 0x6000438C
addiu a1, r0, (SCREEN_W/2) //Fix Width of Customize Name Background

.org 0x60004394
addiu a2, r0, 120 //Fix Height of Customize Background

.org 0x600043F4
li.u at, ((SCREEN_W_FLOAT/2)-136) //Fix Initial X Position of Name Cursor

.org 0x60004498
addiu s6, s6, ((SCREEN_W/2)-64) //Fix Initial X Position of Next Name Letter

.org 0x60004C04
addiu t0, t7, ((SCREEN_W/2)-136) //Fix X Position of Customize Letter Cursor

.org 0x60004C60
li.u at, ((SCREEN_W_FLOAT/2)+96) //Fix X Position of Customize Confirm Cursor

.org 0x60004F34
li.u at, (SCREEN_W_FLOAT/2) //Fix Initial X Position of Customize Part Cursor

.org 0x60005078
addiu a1, r0, (SCREEN_W/2) //Fix Width of Customize Name Background

.org 0x60005080
addiu a2, r0, 120 //Fix Height of Customize Background

.org 0x600050D4
addiu a0, r0, (SCREEN_W/2) //Fix Width of Customize Part Instructions

.org 0x60005518
addiu t0, t9, (SCREEN_W/2) //Fix X Position of Customize Part Cursor

.org 0x60005804
.dw (SCREEN_W/2) //Fix X Position of Customize Background

.org 0x60005818
.dw ((SCREEN_W/2)-74) //Fix X Position of Custom Text

.org 0x6000582C
.dw (SCREEN_W/2) //Fix X Position of Data Text

.org 0x60005840
.dw ((SCREEN_W/2)+74) //Fix X Position of Select Text

.org 0x60005854
.dw ((SCREEN_W/2)-88) //Fix X Position of File Number

.org 0x60005868
.dw ((SCREEN_W/2)-56) //Fix X Position of Rendered Name

.org 0x6000587C
.dw (SCREEN_W/2) //Fix X Position of No File Text

.org 0x60005890
.dw ((SCREEN_W/2)+56) //Fix X Position of Head Icon

.org 0x600058A4
.dw ((SCREEN_W/2)+96) //Fix X Position of Body Icon

.org 0x600058B8
.dw ((SCREEN_W/2)+56) //Fix X Position of Arm Icon

.org 0x600058CC
.dw ((SCREEN_W/2)+96) //Fix X Position of Leg Icon

.org 0x600058E0
.dw ((SCREEN_W/2)+72) //Fix X Position of Head Count 1

.org 0x600058F4
.dw ((SCREEN_W/2)+80) //Fix X Position of Head Count 2

.org 0x60005908
.dw ((SCREEN_W/2)+112) //Fix X Position of Body Count 1

.org 0x6000591C
.dw ((SCREEN_W/2)+120) //Fix X Position of Body Count 2

.org 0x60005930
.dw ((SCREEN_W/2)+72) //Fix X Position of Arm Count 1

.org 0x60005944
.dw ((SCREEN_W/2)+80) //Fix X Position of Arm Count 2

.org 0x60005958
.dw ((SCREEN_W/2)+112) //Fix X Position of Leg Count 1

.org 0x6000596C
.dw ((SCREEN_W/2)+120) //Fix X Position of Leg Count 2

.org 0x60005980
.dw ((SCREEN_W/2)-88) //Fix X Position of File Number

.org 0x60005994
.dw ((SCREEN_W/2)-56) //Fix X Position of Rendered Name

.org 0x600059A8
.dw (SCREEN_W/2) //Fix X Position of No File Text

.org 0x600059BC
.dw ((SCREEN_W/2)+56) //Fix X Position of Head Icon

.org 0x600059D0
.dw ((SCREEN_W/2)+96) //Fix X Position of Body Icon

.org 0x600059E4
.dw ((SCREEN_W/2)+56) //Fix X Position of Arm Icon

.org 0x600059F8
.dw ((SCREEN_W/2)+96) //Fix X Position of Leg Icon

.org 0x60005A0C
.dw ((SCREEN_W/2)+72) //Fix X Position of Head Count 1

.org 0x60005A20
.dw ((SCREEN_W/2)+80) //Fix X Position of Head Count 2

.org 0x60005A34
.dw ((SCREEN_W/2)+112) //Fix X Position of Body Count 1

.org 0x60005A48
.dw ((SCREEN_W/2)+120) //Fix X Position of Body Count 2

.org 0x60005A5C
.dw ((SCREEN_W/2)+72) //Fix X Position of Arm Count 1

.org 0x60005A70
.dw ((SCREEN_W/2)+80) //Fix X Position of Arm Count 2

.org 0x60005A84
.dw ((SCREEN_W/2)+112) //Fix X Position of Leg Count 1

.org 0x60005A98
.dw ((SCREEN_W/2)+120) //Fix X Position of Leg Count 2

.org 0x60005AAC
.dw ((SCREEN_W/2)-88) //Fix X Position of File Number

.org 0x60005AC0
.dw ((SCREEN_W/2)-56) //Fix X Position of Rendered Name

.org 0x60005AD4
.dw (SCREEN_W/2) //Fix X Position of No File Text

.org 0x60005AE8
.dw ((SCREEN_W/2)+56) //Fix X Position of Head Icon

.org 0x60005AFC
.dw ((SCREEN_W/2)+96) //Fix X Position of Body Icon

.org 0x60005B10
.dw ((SCREEN_W/2)+56) //Fix X Position of Arm Icon

.org 0x60005B24
.dw ((SCREEN_W/2)+96) //Fix X Position of Leg Icon

.org 0x60005B38
.dw ((SCREEN_W/2)+72) //Fix X Position of Head Count 1

.org 0x60005B4C
.dw ((SCREEN_W/2)+80) //Fix X Position of Head Count 2

.org 0x60005B60
.dw ((SCREEN_W/2)+112) //Fix X Position of Body Count 1

.org 0x60005B74
.dw ((SCREEN_W/2)+120) //Fix X Position of Body Count 2

.org 0x60005B88
.dw ((SCREEN_W/2)+72) //Fix X Position of Arm Count 1

.org 0x60005B9C
.dw ((SCREEN_W/2)+80) //Fix X Position of Arm Count 2

.org 0x60005BB0
.dw ((SCREEN_W/2)+112) //Fix X Position of Leg Count 1

.org 0x60005BC4
.dw ((SCREEN_W/2)+120) //Fix X Position of Leg Count 2

.org 0x60005CD0
.dw (SCREEN_W/2) //Fix X Position of Customize File Background

.org 0x60005CE4
.dw (SCREEN_W/2) //Fix X Position of Customize File Header

.org 0x60005CF8
.dw ((SCREEN_W/2)+24) //Fix X Position of Customize Icon 1

.org 0x60005D0C
.dw ((SCREEN_W/2)+24) //Fix X Position of Customize Icon 2

.org 0x60005D20
.dw ((SCREEN_W/2)+24) //Fix X Position of Customize Icon 3

.org 0x60005D34
.dw ((SCREEN_W/2)+24) //Fix X Position of Customize Icon 4

.org 0x60005D48
.dw ((SCREEN_W/2)+24) //Fix X Position of Customize Icon 5

.org 0x60005D5C
.dw ((SCREEN_W/2)+24) //Fix X Position of Customize Icon 6

.org 0x60005D70
.dw ((SCREEN_W/2)+72) //Fix X Position of Customize Label 1

.org 0x60005D84
.dw ((SCREEN_W/2)+72) //Fix X Position of Customize Label 2

.org 0x60005D98
.dw ((SCREEN_W/2)+72) //Fix X Position of Customize Label 3

.org 0x60005DAC
.dw ((SCREEN_W/2)+72) //Fix X Position of Customize Label 4

.org 0x60005DC0
.dw ((SCREEN_W/2)+72) //Fix X Position of Customize Label 5

.org 0x60005DD4
.dw ((SCREEN_W/2)+72) //Fix X Position of Customize Label 6

.org 0x60005DE8
.dw ((SCREEN_W/2)+64) //Fix X Position of Customize Cancel

.org 0x60005DFC
.dw ((SCREEN_W/2)-72) //Fix X Position of Customize Name

.org 0x60005E10
.dw (SCREEN_W/2) //Fix X Position of Changes Made Warning Line 1

.org 0x60005E24
.dw (SCREEN_W/2) //Fix X Position of Changes Made Warning Line 2

.org 0x60005E38
.dw ((SCREEN_W/2)+36) //Fix X Position of Changes Made Warning Yes

.org 0x60005E4C
.dw ((SCREEN_W/2)-36) //Fix X Position of Changes Made Warning Yes

.org 0x60005E60
.dw (SCREEN_W/2) //Fix X Position of Changes Made Save Complete

.org 0x60005E74
.dw (SCREEN_W/2) //Fix X Position of Custom Part Menu Background

.org 0x60005E88
.dw (SCREEN_W/2) //Fix X Position of Custom Part Menu Header

.org 0x60005E9C
.dw ((SCREEN_W/2)+24) //Fix X Position of Custom Part Type Icon

.org 0x60005EB0
.dw ((SCREEN_W/2)+72) //Fix X Position of Custom Part Type Label

.org 0x60005EC4
.dw ((SCREEN_W/2)+16) //Fix X Position of Custom Part 1

.org 0x60005ED8
.dw ((SCREEN_W/2)+48) //Fix X Position of Custom Part 2

.org 0x60005EEC
.dw ((SCREEN_W/2)+80) //Fix X Position of Custom Part 3

.org 0x60005F00
.dw ((SCREEN_W/2)+112) //Fix X Position of Custom Part 4

.org 0x60005F14
.dw ((SCREEN_W/2)+16) //Fix X Position of Custom Part 5

.org 0x60005F28
.dw ((SCREEN_W/2)+48) //Fix X Position of Custom Part 6

.org 0x60005F3C
.dw ((SCREEN_W/2)+80) //Fix X Position of Custom Part 7

.org 0x60005F50
.dw ((SCREEN_W/2)+112) //Fix X Position of Custom Part 8

.org 0x60005F64
.dw ((SCREEN_W/2)+16) //Fix X Position of Custom Part 9

.org 0x60005F78
.dw ((SCREEN_W/2)+48) //Fix X Position of Custom Part 10

.org 0x60005F8C
.dw ((SCREEN_W/2)+80) //Fix X Position of Custom Part 11

.org 0x60005FA0
.dw ((SCREEN_W/2)+112) //Fix X Position of Custom Part 12

.org 0x60005FB4
.dw ((SCREEN_W/2)+16) //Fix X Position of Custom Part 13

.org 0x60005FC8
.dw ((SCREEN_W/2)+48) //Fix X Position of Custom Part 14

.org 0x60005FDC
.dw ((SCREEN_W/2)+80) //Fix X Position of Custom Part 15

.org 0x60005FF0
.dw ((SCREEN_W/2)+112) //Fix X Position of Custom Part 16

.org 0x60006004
.dw ((SCREEN_W/2)-72) //Fix X Position of Custom Player Name

.org 0x60006018
.dw ((SCREEN_W/2)+64) //Fix X Position of Custom Part Name

.org 0x600062E4
.dw (SCREEN_W/2) //Fix X Position of Custom Name Background

.org 0x600062F8
.dw (SCREEN_W/2) //Fix X Position of Custom Name Logo

.org 0x6000630C
.dw ((SCREEN_W/2)-92) //Fix X Position of Name Icon

.org 0x60006320
.dw ((SCREEN_W/2)+116) //Fix X Position of Confirm Icon

.org 0x60006334
.dw ((SCREEN_W/2)+100) //Fix X Position of Alphabet Switch

.org 0x60006348
.dw ((SCREEN_W/2)-64) //Fix X Position of Player Name

.org 0x6000635C
.dw (SCREEN_W/2) //Fix X Position of Alphabet Row 1

.org 0x60006370
.dw (SCREEN_W/2) //Fix X Position of Alphabet Row 2

.org 0x60006384
.dw (SCREEN_W/2) //Fix X Position of Alphabet Row 3

.org 0x60006398
.dw (SCREEN_W/2) //Fix X Position of Alphabet Row 4

.org 0x600063AC
.dw (SCREEN_W/2) //Fix X Position of Alphabet Row 5

.org 0x600063C0
.dw ((SCREEN_W/2)-48) //Fix X Position of Alphabet Row 6

.org 0x6000648C
.dw (SCREEN_W/2) //Fix X Position of Save Menu Background

.org 0x600064A0
.dw (SCREEN_W/2) //Fix X Position of Save Menu Header

.org 0x600064B4
.dw (SCREEN_W/2) //Fix X Position of Save Menu Transfer Arrow

.org 0x600064C8
.dw ((SCREEN_W/2)-88) //Fix X Position of Save Menu Modified Text

.org 0x600064DC
.dw ((SCREEN_W/2)+88) //Fix X Position of Save Menu Game Pak Text

.org 0x600064F0
.dw ((SCREEN_W/2)+56) //Fix X Position of Save Menu Controller Pak Text

.org 0x60006504
.dw (SCREEN_W/2) //Fix X Position of Save Menu Are You Sure

.org 0x60006518
.dw ((SCREEN_W/2)-36) //Fix X Position of Save Menu No Option

.org 0x6000652C
.dw ((SCREEN_W/2)+36) //Fix X Position of Save Menu Yes Option

.org 0x60006540
.dw ((SCREEN_W/2)-72) //Fix X Position of Save Menu Left Name

.org 0x60006554
.dw ((SCREEN_W/2)+72) //Fix X Position of Save Menu Right Name

.org 0x60006568
.dw (SCREEN_W/2) //Fix X Position of Save Menu Game Pak Option

.org 0x6000657C
.dw (SCREEN_W/2) //Fix X Position of Save Menu Controller Pak Option

.org 0x60006590
.dw ((SCREEN_W/2)+72) //Fix X Position of Save Menu No File Text

.org 0x600065A4
.dw (SCREEN_W/2) //Fix X Position of Save Complete Text

.org 0x600065B8
.dw (SCREEN_W/2) //Fix X Position of Waiting Controller Pak Text

.org 0x600065CC
.dw (SCREEN_W/2) //Fix X Position of Error Occurred Text

.org 0x600065E0
.dw (SCREEN_W/2) //Fix X Position of No Controller Pak Text

.org 0x600065F4
.dw (SCREEN_W/2) //Fix X Position of New Controller Pak Text

.org 0x60006608
.dw (SCREEN_W/2) //Fix X Position of Damaged Controller Pak Text

.org 0x6000661C
.dw (SCREEN_W/2) //Fix X Position of Controller Pak Repair Options

.org 0x60006630
.dw (SCREEN_W/2) //Fix X Position of Controller Pak Not Connected Options

.org 0x60006644
.dw (SCREEN_W/2) //Fix X Position of Connect Controller Pak Options

.org 0x60006658
.dw (SCREEN_W/2) //Fix X Position of Controller Pak Error Detected

.org 0x6000666C
.dw (SCREEN_W/2) //Fix X Position of Yes No Options

.org 0x60006680
.dw (SCREEN_W/2) //Fix X Position of Continue Without Saving Options

.org 0x60006694
.dw (SCREEN_W/2) //Fix X Position of Retry Cancel Options

.org 0x600066A8
.dw (SCREEN_W/2) //Fix X Position of Erase Warning

.org 0x600066BC
.dw (SCREEN_W/2) //Fix X Position of Yes No Options

.org 0x600066D0
.dw (SCREEN_W/2) //Fix X Position of Insert Controller Pak Text

.org 0x600066E4
.dw (SCREEN_W/2) //Fix X Position of Unable to Save Text

.org 0x600066F8
.dw (SCREEN_W/2) //Fix X Position of Unable to Repair Text

.org 0x6000670C
.dw (SCREEN_W/2) //Fix X Position of Continue Cancel Text

.org 0x60006720
.dw (SCREEN_W/2) //Fix X Position of Continue Without Saving Options

.org 0x60006750
.dw ((SCREEN_W/2)-44) //Fix X Position of Retry Cursor

.org 0x6000676C
.dw ((SCREEN_W/2)+36) //Fix X Position of Cancel Cursor

.org 0x60006788
.dw (SCREEN_W/2) //Fix X Position of Cursor

.org 0x600067A4
.dw (SCREEN_W/2) //Fix X Position of Cursor

.org 0x600067C0
.dw (SCREEN_W/2) //Fix X Position of Cursor

.org 0x600067DC
.dw (SCREEN_W/2) //Fix X Position of Cursor

.org 0x600067F8
.dw (SCREEN_W/2) //Fix X Position of Cursor

.org 0x60006814
.dw ((SCREEN_W/2)-34) //Fix X Position of Retry Cursor

.org 0x60006830
.dw ((SCREEN_W/2)+36) //Fix X Position of Cancel Cursor

.org 0x60006850
.dw ((SCREEN_W/2)-36) //Fix X Position of Retry Cursor

.org 0x6000686C
.dw ((SCREEN_W/2)+36) //Fix X Position of Cancel Cursor


.org 0x60006924
.float -(((SCREEN_W_FLOAT/2)-68)*8.786451859) //Fix X Position of Customize 3D Background

.close

.open "extract/evblock/31.bin", 0x60000000 //Shop/World Map

.org 0x60000FF0
ori t2, t2, (SCREEN_W-1) //Fix Shop Rectangle Framebuffer

.org 0x60002B50
li.u at, ((SCREEN_W_FLOAT/2)-80) //Fix X Position of Quit Game Box

.org 0x60002D74
li.u at, (SCREEN_W_FLOAT/2) //Fix Centering Map Icons

.org 0x60002F60
li.u a1, (SCREEN_W_FLOAT/2) //Fix Level Name Text

.org 0x600030DC
li.u a1, (SCREEN_W_FLOAT/160) //Fix X Scale of Shop Background

.org 0x60003148
addiu t4, r0, (SCREEN_W-32) //Fix Width of Shop Bar

.org 0x60003404
li.u at, ((SCREEN_W_FLOAT/2)-120) //Fix X Position of Shop Textbox

.org 0x6000363C
addiu a0, r0, ((SCREEN_W/2)-120) //Fix X Position of Shop Description

.org 0x60003A8C
addiu a0, r0, ((SCREEN_W/2)-120) //Fix X Position of Shop Buy

.org 0x60003AF8
addiu a0, r0, ((SCREEN_W/2)-104) //Fix X Position of Shop First Buy

.org 0x60003BB8
addiu a0, r0, ((SCREEN_W/2)-120) //Fix X Position of Shop First Buy Text

.org 0x6000411C
addiu a0, r0, ((SCREEN_W/2)-104) //Fix X Position of Shop Buy Choice

.org 0x60004960
addiu a0, r0, ((SCREEN_W/2)-120) //Fix X Position of Shop Description

.org 0x60004990
addiu a0, r0, ((SCREEN_W/2)-120) //Fix X Position of Shop Description

.org 0x60004A78
addiu a0, r0, ((SCREEN_W/2)-120) //Fix X Position of Shop Exit

.org 0x60004C40
.dw ((SCREEN_W/2)-100) //Fix X Position of World Select Icon

.org 0x60004C54
.dw ((SCREEN_W/2)-72) //Fix X Position of Map 1 Icon

.org 0x60004C68
.dw ((SCREEN_W/2)-126) //Fix X Position of Map 2 Icon

.org 0x60004C7C
.dw ((SCREEN_W/2)+24) //Fix X Position of Map 3 Icon

.org 0x60004C90
.dw ((SCREEN_W/2)-104) //Fix X Position of Map 4 Icon

.org 0x60004CA4
.dw ((SCREEN_W/2)+95) //Fix X Position of Map 5 Icon

.org 0x60004CB8
.dw ((SCREEN_W/2)-38) //Fix X Position of Map 6 Icon

.org 0x60004CCC
.dw ((SCREEN_W/2)+71) //Fix X Position of Map 7 Icon

.org 0x60004CE0
.dw ((SCREEN_W/2)+2) //Fix X Position of Map 8 Icon

.org 0x60004CF4
.dw ((SCREEN_W/2)-56) //Fix X Position of Shop Icon

.org 0x60004D08
.dw ((SCREEN_W/2)+112) //Fix X Position of World Select Help

.org 0x60004D1C
.dw ((SCREEN_W/2)+36) //Fix X Position of World Name

.org 0x60004D30
.dw ((SCREEN_W/2)+8) //Fix X Position of Quit Yes

.org 0x60004D44
.dw ((SCREEN_W/2)+8) //Fix X Position of Quit No

.org 0x60004D58
.dw ((SCREEN_W/2)+8) //Fix X Position of Quit No

.org 0x60004D6C
.dw (SCREEN_W/2) //Fix X Position of World Select Swirl

.org 0x60004D80
.dw (SCREEN_W/2) //Fix X Position of World Select Inner Swirl

.org 0x60004D94
.dw (SCREEN_W/2) //Fix X Position of World Select Inner Swirl

.org 0x60004DA8
.dw ((SCREEN_W/2)-72) //Fix X Position of Map 1 Icon

.org 0x60004DBC
.dw ((SCREEN_W/2)-126) //Fix X Position of Map 2 Icon

.org 0x60004DD0
.dw ((SCREEN_W/2)+24) //Fix X Position of Map 3 Icon

.org 0x60004DE4
.dw ((SCREEN_W/2)-104) //Fix X Position of Map 4 Icon

.org 0x60004DF8
.dw ((SCREEN_W/2)+95) //Fix X Position of Map 5 Icon

.org 0x60004E0C
.dw ((SCREEN_W/2)-38) //Fix X Position of Map 6 Icon

.org 0x60004E20
.dw ((SCREEN_W/2)+71) //Fix X Position of Map 7 Icon

.org 0x60004E34
.dw ((SCREEN_W/2)+2) //Fix X Position of Map 8 Icon

.org 0x60004F2C
.dw ((SCREEN_W/2)-40) //Fix X Position of Map 1 Cursor

.org 0x60004F48
.dw ((SCREEN_W/2)-40) //Fix X Position of Map 1 Cursor

.org 0x60004F64
.dw ((SCREEN_W/2)-128) //Fix X Position of Map 2 Cursor

.org 0x60004F80
.dw ((SCREEN_W/2)+48) //Fix X Position of Map 3 Cursor

.org 0x60004F9C
.dw ((SCREEN_W/2)-40) //Fix X Position of Map 1 Cursor

.org 0x60004FB8
.dw ((SCREEN_W/2)-128) //Fix X Position of Map 2 Cursor

.org 0x60004FD4
.dw ((SCREEN_W/2)+48) //Fix X Position of Map 3 Cursor

.org 0x60004FF0
.dw ((SCREEN_W/2)-120) //Fix X Position of Map 4 Cursor

.org 0x6000500C
.dw ((SCREEN_W/2)+88) //Fix X Position of Map 5 Cursor

.org 0x60005028
.dw ((SCREEN_W/2)-40) //Fix X Position of Map 1 Cursor

.org 0x60005044
.dw ((SCREEN_W/2)-128) //Fix X Position of Map 2 Cursor

.org 0x60005060
.dw ((SCREEN_W/2)+48) //Fix X Position of Map 3 Cursor

.org 0x6000507C
.dw ((SCREEN_W/2)-120) //Fix X Position of Map 4 Cursor

.org 0x60005098
.dw ((SCREEN_W/2)+88) //Fix X Position of Map 5 Cursor

.org 0x600050B4
.dw ((SCREEN_W/2)-48) //Fix X Position of Map 6 Cursor

.org 0x600050D0
.dw ((SCREEN_W/2)+88) //Fix X Position of Map 7 Cursor

.org 0x600050EC
.dw ((SCREEN_W/2)+8) //Fix X Position of Map 8 Cursor

.org 0x60005118
.dw ((SCREEN_W/2)-24) //Fix X Position of Yes Cursor

.org 0x60005134
.dw ((SCREEN_W/2)-24) //Fix X Position of No Cursor

.org 0x60005158
.dw ((SCREEN_W/2)-96) //Fix X Position of Dot 1

.org 0x6000516C
.dw ((SCREEN_W/2)-106) //Fix X Position of Dot 2

.org 0x60005180
.dw ((SCREEN_W/2)-116) //Fix X Position of Dot 3

.org 0x60005194
.dw ((SCREEN_W/2)-36) //Fix X Position of Dot 4

.org 0x600051A8
.dw ((SCREEN_W/2)-18) //Fix X Position of Dot 5

.org 0x600051BC
.dw ((SCREEN_W/2)-2) //Fix X Position of Dot 6

.org 0x600051D0
.dw ((SCREEN_W/2)-132) //Fix X Position of Dot 7

.org 0x600051E4
.dw ((SCREEN_W/2)-129) //Fix X Position of Dot 8

.org 0x600051F8
.dw ((SCREEN_W/2)-120) //Fix X Position of Dot 9

.org 0x6000520C
.dw ((SCREEN_W/2)+62) //Fix X Position of Dot 10

.org 0x60005220
.dw ((SCREEN_W/2)+79) //Fix X Position of Dot 11

.org 0x60005234
.dw ((SCREEN_W/2)+90) //Fix X Position of Dot 12

.org 0x60005248
.dw ((SCREEN_W/2)-80) //Fix X Position of Dot 13

.org 0x6000525C
.dw ((SCREEN_W/2)-63) //Fix X Position of Dot 14

.org 0x60005270
.dw ((SCREEN_W/2)-46) //Fix X Position of Dot 15

.org 0x60005284
.dw ((SCREEN_W/2)+74) //Fix X Position of Dot 16

.org 0x60005298
.dw ((SCREEN_W/2)+61) //Fix X Position of Dot 17

.org 0x600052AC
.dw ((SCREEN_W/2)+46) //Fix X Position of Dot 18

.org 0x600052C0
.dw ((SCREEN_W/2)-88) //Fix X Position of Dot 19

.org 0x600052D4
.dw ((SCREEN_W/2)-72) //Fix X Position of Dot 20

.org 0x600052E8
.dw ((SCREEN_W/2)-54) //Fix X Position of Dot 21

.org 0x600052FC
.dw ((SCREEN_W/2)+96) //Fix X Position of Dot 22

.org 0x60005310
.dw ((SCREEN_W/2)+93) //Fix X Position of Dot 23

.org 0x60005324
.dw ((SCREEN_W/2)+88) //Fix X Position of Dot 24

.org 0x60005338
.dw ((SCREEN_W/2)-27) //Fix X Position of Dot 25

.org 0x6000534C
.dw ((SCREEN_W/2)-16) //Fix X Position of Dot 26

.org 0x60005360
.dw ((SCREEN_W/2)-8) //Fix X Position of Dot 27

.org 0x60005374
.dw ((SCREEN_W/2)+59) //Fix X Position of Dot 28

.org 0x60005388
.dw ((SCREEN_W/2)+49) //Fix X Position of Dot 29

.org 0x6000539C
.dw ((SCREEN_W/2)+38) //Fix X Position of Dot 30

.org 0x600053BC
.dw (SCREEN_W/2) //Fix X Position of Shop Background

.org 0x600053D0
.dw (SCREEN_W/2) //Fix X Position of Shop Title

.org 0x60005420
.dw ((SCREEN_W*262)/320) //Fix X Position of Shop Host

.org 0x60005448
.dw 88+(((SCREEN_W-320)*1)/4) //X Position of Hint Icon

.org 0x6000545C
.dw 132+(((SCREEN_W-320)*2)/4) //X Position of Etc Icon

.org 0x60005470
.dw 176+(((SCREEN_W-320)*3)/4) //X Position of Exit Icon

.org 0x60005484
.dw 208+(((SCREEN_W-320)*4)/4) //X Position of Money Icon

.org 0x60005498
.dw 256+(((SCREEN_W-320)*4)/4) //X Position of Money Count

.org 0x60005580
.dw ((SCREEN_W/2)-104) //Fix X Position of Shop Choice 1

.org 0x6000559C
.dw ((SCREEN_W/2)-104) //Fix X Position of Shop Choice 2

.close

.open "extract/evblock/32.bin", 0x60000000 //Opening

.org 0x60002878
li.u a1, (SCREEN_W_FLOAT/2) //Fix X Position of Opening Text

.org 0x60002A6C
addiu a0, r0, (SCREEN_W/2) //Fix Initial X Position of Opening Text

.org 0x6000311C
addiu t8, r0, SCREEN_W //Fix Width of Opening Filter

.org 0x60003220
addiu t8, r0, SCREEN_W //Fix Width of Opening Filter

.org 0x600057B4
addiu t2, r0, SCREEN_W //Fix Noise Effect Width

.org 0x60005810
j 0x600058E4 //Skip Noise Effect Shrink

.org 0x60005ADC
addiu a0, r0, (SCREEN_W/2) //Fix Default X Position of Credits Text

.org 0x60005B20
li.u at, (SCREEN_W_FLOAT/2) //Fix X Position of Credits Text

.org 0x60005E38
addiu a0, r0, (SCREEN_W/2) //Fix Default X Position of Credits Text

.org 0x60005EB4
li.u at, (SCREEN_W_FLOAT+16) //Fix End X Position of Left Text Exit

.org 0x60005ED8
li.u at, (SCREEN_W_FLOAT+336) //Fix Start X Position of Right Text

.org 0x60005EE4
li.u at, (SCREEN_W_FLOAT-16) //Fix End X Position of Right Text

.org 0x60005F44
li.u at, (SCREEN_W_FLOAT+16) //Fix End X Position of Left Text Exit

.org 0x60005F68
li.u at, (SCREEN_W_FLOAT+336) //Fix Start X Position of Right Text

.org 0x60005F7C
li.u at, (SCREEN_W_FLOAT-16) //Fix End X Position of Right Text

.org 0x60006230
addiu t8, r0, SCREEN_W //Fix Width of Credits Filter

.org 0x60006AA8
.float ((((SCREEN_W_FLOAT-16)*380)/304)+8) //Fix Start X Position of Opening Character 1

.org 0x60006AC4
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 1

.org 0x60006AE0
.float ((((SCREEN_W_FLOAT-16)*76)/304)+8) //Fix Focus X Position of Opening Character 1

.org 0x60006AE8
.float -((((SCREEN_W_FLOAT-16)*60)/304)+8) //Fix End X Position of Opening Character 1

.org 0x60006AFC
.float -((((SCREEN_W_FLOAT-16)*60)/304)+8) //Fix Start X Position of Opening Character 2

.org 0x60006B18
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 2

.org 0x60006B34
.float ((((SCREEN_W_FLOAT-16)*228)/304)+8) //Fix Focus X Position of Opening Character 2

.org 0x60006B3C
.float ((((SCREEN_W_FLOAT-16)*380)/304)+8) //Fix End X Position of Opening Character 2

.org 0x60006B50
.float (SCREEN_W_FLOAT*2) //Fix Start X Position of Opening Text

.org 0x60006B88
.float -SCREEN_W_FLOAT //Fix End X Position of Opening Text

.org 0x60006BA4
.float ((((SCREEN_W_FLOAT-16)*252)/304)+8) //Fix Start X Position of Opening Character 3

.org 0x60006BC0
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 3

.org 0x60006BDC
.float ((((SCREEN_W_FLOAT-16)*252)/304)+8) //Fix Focus X Position of Opening Character 3

.org 0x60006BE4
.float ((((SCREEN_W_FLOAT-16)*252)/304)+8) //Fix End X Position of Opening Character 3

.org 0x60006BF8
.float ((((SCREEN_W_FLOAT-16)*52)/304)+8) //Fix Start X Position of Opening Character 4

.org 0x60006C14
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 4

.org 0x60006C30
.float ((((SCREEN_W_FLOAT-16)*52)/304)+8) //Fix Focus X Position of Opening Character 4

.org 0x60006C38
.float ((((SCREEN_W_FLOAT-16)*52)/304)+8) //Fix End X Position of Opening Character 4

.org 0x60006C4C
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix Start X Position of Opening Character 5

.org 0x60006C68
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 5

.org 0x60006C84
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix Focus X Position of Opening Character 5

.org 0x60006C8C
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix End X Position of Opening Character 5

.org 0x60006CA0
.float (SCREEN_W_FLOAT*2) //Fix Start X Position of Opening Text

.org 0x60006CD8
.float -SCREEN_W_FLOAT //Fix End X Position of Opening Text

.org 0x60006CF4
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix Start X Position of Opening Character 6

.org 0x60006D10
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 6

.org 0x60006D2C
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix Focus X Position of Opening Character 6

.org 0x60006D34
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix End X Position of Opening Character 6

.org 0x60006D48
.float ((((SCREEN_W_FLOAT-16)*52)/304)+8) //Fix Start X Position of Opening Character 7

.org 0x60006D64
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 7

.org 0x60006D80
.float ((((SCREEN_W_FLOAT-16)*52)/304)+8) //Fix Focus X Position of Opening Character 7

.org 0x60006D88
.float ((((SCREEN_W_FLOAT-16)*52)/304)+8) //Fix End X Position of Opening Character 7

.org 0x60006D9C
.float ((((SCREEN_W_FLOAT-16)*252)/304)+8) //Fix Start X Position of Opening Character 8

.org 0x60006DB8
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 8

.org 0x60006DD4
.float ((((SCREEN_W_FLOAT-16)*252)/304)+8) //Fix Focus X Position of Opening Character 8

.org 0x60006DDC
.float ((((SCREEN_W_FLOAT-16)*252)/304)+8) //Fix End X Position of Opening Character 8

.org 0x60006DF0
.float ((((SCREEN_W_FLOAT-16)*76)/304)+8) //Fix Start X Position of Opening Character 9

.org 0x60006E0C
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 9

.org 0x60006E28
.float ((((SCREEN_W_FLOAT-16)*76)/304)+8) //Fix Focus X Position of Opening Character 9

.org 0x60006E30
.float ((((SCREEN_W_FLOAT-16)*76)/304)+8) //Fix End X Position of Opening Character 9

.org 0x60006E44
.float ((((SCREEN_W_FLOAT-16)*228)/304)+8) //Fix Start X Position of Opening Character 10

.org 0x60006E60
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 10

.org 0x60006E7C
.float ((((SCREEN_W_FLOAT-16)*228)/304)+8) //Fix Focus X Position of Opening Character 10

.org 0x60006E84
.float ((((SCREEN_W_FLOAT-16)*228)/304)+8) //Fix End X Position of Opening Character 10

.org 0x60006E98
.float (SCREEN_W_FLOAT*2) //Fix Start X Position of Opening Text

.org 0x60006ED0
.float -SCREEN_W_FLOAT //Fix End X Position of Opening Text

.org 0x60006EEC
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix Start X Position of Opening Character 11

.org 0x60006F08
.float (((SCREEN_W_FLOAT-16)*1.34)/304) //Fix X Scale of Opening Character 11

.org 0x60006F24
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix Focus X Position of Opening Character 11

.org 0x60006F2C
.float ((((SCREEN_W_FLOAT-16)*152)/304)+8) //Fix End X Position of Opening Character 11

.org 0x60006F40
.float (SCREEN_W_FLOAT/2) //Fix X Position of Opening Logo Background

.org 0x60006F5C
.float (SCREEN_W_FLOAT/160) //Fix X Scale of Opening Logo Background
.float (SCREEN_W_FLOAT/160) //Fix X Scale of Opening Logo Background

.org 0x60006F94
.float SCREEN_W_FLOAT //Fix Start X Position of Logo Symbol

.org 0x60006FCC
.float ((SCREEN_W_FLOAT/2)-75) //Fix End X Position of Logo Symbol

.org 0x60006FE8
.float SCREEN_W_FLOAT //Fix Start X Position of Logo Bomberman

.org 0x60007020
.float ((SCREEN_W_FLOAT/2)+5) //Fix End X Position of Logo Bomberman

.org 0x6000703C
.float SCREEN_W_FLOAT //Fix Start X Position of Logo 64

.org 0x60007074
.float ((SCREEN_W_FLOAT/2)+85) //Fix End X Position of Logo 64

.org 0x60007090
.float (SCREEN_W_FLOAT/2) //Fix X Position of Logo Shootoff

.org 0x6000711C
.float (SCREEN_W_FLOAT/2) //Fix X Position of Logo Return

.org 0x60007138
.float (SCREEN_W_FLOAT/2) //Fix Center Slice Start

.org 0x60007170
.float (SCREEN_W_FLOAT/2) //Fix Center Slice Start

.org 0x6000718C
.float (SCREEN_W_FLOAT/2) //Fix Center Slice Start

.org 0x600071C4
.float (SCREEN_W_FLOAT/2) //Fix Center Slice Start

.org 0x600071E0
.float (SCREEN_W_FLOAT/2) //Fix Center Slice Start

.org 0x60007218
.float (SCREEN_W_FLOAT/2) //Fix Center Slice Start

.org 0x60007234
.float (SCREEN_W_FLOAT/2) //Fix Left Slice Start

.org 0x6000726C
.float -(SCREEN_W_FLOAT/2) //Fix Left Slice End

.org 0x60007288
.float (SCREEN_W_FLOAT/2) //Fix Right Slice Start

.org 0x600072C0
.float ((SCREEN_W_FLOAT*3)/2) //Fix Right Slice End

.org 0x6000770C
.float (SCREEN_W_FLOAT/2) //Fix X Position of Hudson Text

.org 0x600077B4
.float (SCREEN_W_FLOAT/2) //Fix X Position of Team Text

.org 0x6000785C
.float (SCREEN_W_FLOAT/2) //Fix X Position of Game Name

.close

.open "extract/evblock/41.bin", 0x60000000 //Warship Noah

.org 0x60007074
addiu s2, r0, (SCREEN_W-64) //Fix X Position of Timer

.org 0x60007994
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Up Text

.org 0x600079CC
addiu a0, r0, (SCREEN_W/2) //Fix X Position of Down Text

.org 0x60009508
.dw (SCREEN_W/2) //Fix X Position of Up Cursor

.org 0x60009524
.dw (SCREEN_W/2) //Fix X Position of Down Cursor

.close

.open "extract/evblock/43.bin", 0x60000000 //Tutorial

.org 0x600011FC
addiu a3, r0, (SCREEN_W-40) //Fix X Position of Tutorial Second Button

.org 0x60001208
addiu a1, r0, (SCREEN_W-80) //Fix X Position of Tutorial Plus

.org 0x60001228
li.u a1, (SCREEN_W_FLOAT-120) //Fix X Position of Tutorial First Button

.org 0x6000124C
addiu a3, r0, (SCREEN_W-80) //Fix X Position of Tutorial A Button

.org 0x60001260
addiu a3, r0, (SCREEN_W-80) //Fix X Position of Tutorial A Button

.org 0x600012E0
addiu a3, r0, (SCREEN_W-120) //Fix X Position of Tutorial First Button

.org 0x600012EC
addiu a1, r0, (SCREEN_W-80) //Fix X Position of Tutorial Plus

.org 0x6000130C
li.u a1, (SCREEN_W_FLOAT-40) //Fix X Position of Tutorial Second Button

.org 0x60001330
addiu a3, r0, (SCREEN_W-80) //Fix X Position of Tutorial Buttons

.org 0x60001344
addiu a3, r0, (SCREEN_W-80) //Fix X Position of Tutorial Buttons

.org 0x60001484
addiu a1, r0, (SCREEN_W-80) //Fix X Position of Tutorial Plus

.org 0x600014A0
li.u a1, (SCREEN_W_FLOAT-120) //Fix X Position of Tutorial First Button

.org 0x600014B4
li.u a1, (SCREEN_W_FLOAT-120) //Fix X Position of Tutorial First Button

.org 0x600014F4
li.u a1, (SCREEN_W_FLOAT-80) //Fix X Position of Tutorial Button

.org 0x60001510
li.u a1, (SCREEN_W_FLOAT-80) //Fix X Position of Tutorial Button

.close

.open "extract/evblock/80.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/81.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/82.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/83.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/84.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/85.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/86.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/87.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close

.open "extract/evblock/88.bin", 0x43000000

.org 0x430030FC
ori t7, t7, (SCREEN_W-1) //Fix HP Bar Framebuffer

.close