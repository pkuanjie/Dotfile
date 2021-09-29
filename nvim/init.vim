" --------------------------------------------
"            _                        _ _
"  _ ____   _(_)_ __ ___  _ __ ___    | (_) ___
" | '_ \ \ / / | '_ ` _ \| '__/ __|  _  | | |/ _ \
" | | | \ V /| | | | | | | | | (__  | |_| | |  __/
" |_| |_|\_/ |_|_| |_| |_|_|  \___|  \___/|_|\___|
" --------------------------------------------
" Author: @pkuanjie
" Date: 2021/6/24
" Note: Based on CoC (which is the best!), this config file only support neovim=0.5.
" --------------------------------------------


" ========================================
" Init Settings
" ========================================
let g:python3_host_prog = "/usr/bin/python3"
" ========================================

" ========================================
" color prefix
" ========================================
" hi x016_Grey0 ctermfg=16 guifg=#000000 "rgb=0,0,0
" hi x017_NavyBlue ctermfg=17 guifg=#00005f "rgb=0,0,95
" hi x018_DarkBlue ctermfg=18 guifg=#000087 "rgb=0,0,135
" hi x019_Blue3 ctermfg=19 guifg=#0000af "rgb=0,0,175
" hi x020_Blue3 ctermfg=20 guifg=#0000d7 "rgb=0,0,215
" hi x021_Blue1 ctermfg=21 guifg=#0000ff "rgb=0,0,255
" hi x022_DarkGreen ctermfg=22 guifg=#005f00 "rgb=0,95,0
" hi x023_DeepSkyBlue4 ctermfg=23 guifg=#005f5f "rgb=0,95,95
" hi x024_DeepSkyBlue4 ctermfg=24 guifg=#005f87 "rgb=0,95,135
" hi x025_DeepSkyBlue4 ctermfg=25 guifg=#005faf "rgb=0,95,175
" hi x026_DodgerBlue3 ctermfg=26 guifg=#005fd7 "rgb=0,95,215
" hi x027_DodgerBlue2 ctermfg=27 guifg=#005fff "rgb=0,95,255
" hi x028_Green4 ctermfg=28 guifg=#008700 "rgb=0,135,0
" hi x029_SpringGreen4 ctermfg=29 guifg=#00875f "rgb=0,135,95
" hi x030_Turquoise4 ctermfg=30 guifg=#008787 "rgb=0,135,135
" hi x031_DeepSkyBlue3 ctermfg=31 guifg=#0087af "rgb=0,135,175
" hi x032_DeepSkyBlue3 ctermfg=32 guifg=#0087d7 "rgb=0,135,215
" hi x033_DodgerBlue1 ctermfg=33 guifg=#0087ff "rgb=0,135,255
" hi x034_Green3 ctermfg=34 guifg=#00af00 "rgb=0,175,0
" hi x035_SpringGreen3 ctermfg=35 guifg=#00af5f "rgb=0,175,95
" hi x036_DarkCyan ctermfg=36 guifg=#00af87 "rgb=0,175,135
" hi x037_LightSeaGreen ctermfg=37 guifg=#00afaf "rgb=0,175,175
" hi x038_DeepSkyBlue2 ctermfg=38 guifg=#00afd7 "rgb=0,175,215
" hi x039_DeepSkyBlue1 ctermfg=39 guifg=#00afff "rgb=0,175,255
" hi x040_Green3 ctermfg=40 guifg=#00d700 "rgb=0,215,0
" hi x041_SpringGreen3 ctermfg=41 guifg=#00d75f "rgb=0,215,95
" hi x042_SpringGreen2 ctermfg=42 guifg=#00d787 "rgb=0,215,135
" hi x043_Cyan3 ctermfg=43 guifg=#00d7af "rgb=0,215,175
" hi x044_DarkTurquoise ctermfg=44 guifg=#00d7d7 "rgb=0,215,215
" hi x045_Turquoise2 ctermfg=45 guifg=#00d7ff "rgb=0,215,255
" hi x046_Green1 ctermfg=46 guifg=#00ff00 "rgb=0,255,0
" hi x047_SpringGreen2 ctermfg=47 guifg=#00ff5f "rgb=0,255,95
" hi x048_SpringGreen1 ctermfg=48 guifg=#00ff87 "rgb=0,255,135
" hi x049_MediumSpringGreen ctermfg=49 guifg=#00ffaf "rgb=0,255,175
" hi x050_Cyan2 ctermfg=50 guifg=#00ffd7 "rgb=0,255,215
" hi x051_Cyan1 ctermfg=51 guifg=#00ffff "rgb=0,255,255
" hi x052_DarkRed ctermfg=52 guifg=#5f0000 "rgb=95,0,0
" hi x053_DeepPink4 ctermfg=53 guifg=#5f005f "rgb=95,0,95
" hi x054_Purple4 ctermfg=54 guifg=#5f0087 "rgb=95,0,135
" hi x055_Purple4 ctermfg=55 guifg=#5f00af "rgb=95,0,175
" hi x056_Purple3 ctermfg=56 guifg=#5f00d7 "rgb=95,0,215
" hi x057_BlueViolet ctermfg=57 guifg=#5f00ff "rgb=95,0,255
" hi x058_Orange4 ctermfg=58 guifg=#5f5f00 "rgb=95,95,0
" hi x059_Grey37 ctermfg=59 guifg=#5f5f5f "rgb=95,95,95
" hi x060_MediumPurple4 ctermfg=60 guifg=#5f5f87 "rgb=95,95,135
" hi x061_SlateBlue3 ctermfg=61 guifg=#5f5faf "rgb=95,95,175
" hi x062_SlateBlue3 ctermfg=62 guifg=#5f5fd7 "rgb=95,95,215
" hi x063_RoyalBlue1 ctermfg=63 guifg=#5f5fff "rgb=95,95,255
" hi x064_Chartreuse4 ctermfg=64 guifg=#5f8700 "rgb=95,135,0
" hi x065_DarkSeaGreen4 ctermfg=65 guifg=#5f875f "rgb=95,135,95
" hi x066_PaleTurquoise4 ctermfg=66 guifg=#5f8787 "rgb=95,135,135
" hi x067_SteelBlue ctermfg=67 guifg=#5f87af "rgb=95,135,175
" hi x068_SteelBlue3 ctermfg=68 guifg=#5f87d7 "rgb=95,135,215
" hi x069_CornflowerBlue ctermfg=69 guifg=#5f87ff "rgb=95,135,255
" hi x070_Chartreuse3 ctermfg=70 guifg=#5faf00 "rgb=95,175,0
" hi x071_DarkSeaGreen4 ctermfg=71 guifg=#5faf5f "rgb=95,175,95
" hi x072_CadetBlue ctermfg=72 guifg=#5faf87 "rgb=95,175,135
" hi x073_CadetBlue ctermfg=73 guifg=#5fafaf "rgb=95,175,175
" hi x074_SkyBlue3 ctermfg=74 guifg=#5fafd7 "rgb=95,175,215
" hi x075_SteelBlue1 ctermfg=75 guifg=#5fafff "rgb=95,175,255
" hi x076_Chartreuse3 ctermfg=76 guifg=#5fd700 "rgb=95,215,0
" hi x077_PaleGreen3 ctermfg=77 guifg=#5fd75f "rgb=95,215,95
" hi x078_SeaGreen3 ctermfg=78 guifg=#5fd787 "rgb=95,215,135
" hi x079_Aquamarine3 ctermfg=79 guifg=#5fd7af "rgb=95,215,175
" hi x080_MediumTurquoise ctermfg=80 guifg=#5fd7d7 "rgb=95,215,215
" hi x081_SteelBlue1 ctermfg=81 guifg=#5fd7ff "rgb=95,215,255
" hi x082_Chartreuse2 ctermfg=82 guifg=#5fff00 "rgb=95,255,0
" hi x083_SeaGreen2 ctermfg=83 guifg=#5fff5f "rgb=95,255,95
" hi x084_SeaGreen1 ctermfg=84 guifg=#5fff87 "rgb=95,255,135
" hi x085_SeaGreen1 ctermfg=85 guifg=#5fffaf "rgb=95,255,175
" hi x086_Aquamarine1 ctermfg=86 guifg=#5fffd7 "rgb=95,255,215
" hi x087_DarkSlateGray2 ctermfg=87 guifg=#5fffff "rgb=95,255,255
" hi x088_DarkRed ctermfg=88 guifg=#870000 "rgb=135,0,0
" hi x089_DeepPink4 ctermfg=89 guifg=#87005f "rgb=135,0,95
" hi x090_DarkMagenta ctermfg=90 guifg=#870087 "rgb=135,0,135
" hi x091_DarkMagenta ctermfg=91 guifg=#8700af "rgb=135,0,175
" hi x092_DarkViolet ctermfg=92 guifg=#8700d7 "rgb=135,0,215
" hi x093_Purple ctermfg=93 guifg=#8700ff "rgb=135,0,255
" hi x094_Orange4 ctermfg=94 guifg=#875f00 "rgb=135,95,0
" hi x095_LightPink4 ctermfg=95 guifg=#875f5f "rgb=135,95,95
" hi x096_Plum4 ctermfg=96 guifg=#875f87 "rgb=135,95,135
" hi x097_MediumPurple3 ctermfg=97 guifg=#875faf "rgb=135,95,175
" hi x098_MediumPurple3 ctermfg=98 guifg=#875fd7 "rgb=135,95,215
" hi x099_SlateBlue1 ctermfg=99 guifg=#875fff "rgb=135,95,255
" hi x100_Yellow4 ctermfg=100 guifg=#878700 "rgb=135,135,0
" hi x101_Wheat4 ctermfg=101 guifg=#87875f "rgb=135,135,95
" hi x102_Grey53 ctermfg=102 guifg=#878787 "rgb=135,135,135
" hi x103_LightSlateGrey ctermfg=103 guifg=#8787af "rgb=135,135,175
" hi x104_MediumPurple ctermfg=104 guifg=#8787d7 "rgb=135,135,215
" hi x105_LightSlateBlue ctermfg=105 guifg=#8787ff "rgb=135,135,255
" hi x106_Yellow4 ctermfg=106 guifg=#87af00 "rgb=135,175,0
" hi x107_DarkOliveGreen3 ctermfg=107 guifg=#87af5f "rgb=135,175,95
" hi x108_DarkSeaGreen ctermfg=108 guifg=#87af87 "rgb=135,175,135
" hi x109_LightSkyBlue3 ctermfg=109 guifg=#87afaf "rgb=135,175,175
" hi x110_LightSkyBlue3 ctermfg=110 guifg=#87afd7 "rgb=135,175,215
" hi x111_SkyBlue2 ctermfg=111 guifg=#87afff "rgb=135,175,255
" hi x112_Chartreuse2 ctermfg=112 guifg=#87d700 "rgb=135,215,0
" hi x113_DarkOliveGreen3 ctermfg=113 guifg=#87d75f "rgb=135,215,95
" hi x114_PaleGreen3 ctermfg=114 guifg=#87d787 "rgb=135,215,135
" hi x115_DarkSeaGreen3 ctermfg=115 guifg=#87d7af "rgb=135,215,175
" hi x116_DarkSlateGray3 ctermfg=116 guifg=#87d7d7 "rgb=135,215,215
" hi x117_SkyBlue1 ctermfg=117 guifg=#87d7ff "rgb=135,215,255
" hi x118_Chartreuse1 ctermfg=118 guifg=#87ff00 "rgb=135,255,0
" hi x119_LightGreen ctermfg=119 guifg=#87ff5f "rgb=135,255,95
" hi x120_LightGreen ctermfg=120 guifg=#87ff87 "rgb=135,255,135
" hi x121_PaleGreen1 ctermfg=121 guifg=#87ffaf "rgb=135,255,175
" hi x122_Aquamarine1 ctermfg=122 guifg=#87ffd7 "rgb=135,255,215
" hi x123_DarkSlateGray1 ctermfg=123 guifg=#87ffff "rgb=135,255,255
" hi x124_Red3 ctermfg=124 guifg=#af0000 "rgb=175,0,0
" hi x125_DeepPink4 ctermfg=125 guifg=#af005f "rgb=175,0,95
" hi x126_MediumVioletRed ctermfg=126 guifg=#af0087 "rgb=175,0,135
" hi x127_Magenta3 ctermfg=127 guifg=#af00af "rgb=175,0,175
" hi x128_DarkViolet ctermfg=128 guifg=#af00d7 "rgb=175,0,215
" hi x129_Purple ctermfg=129 guifg=#af00ff "rgb=175,0,255
" hi x130_DarkOrange3 ctermfg=130 guifg=#af5f00 "rgb=175,95,0
" hi x131_IndianRed ctermfg=131 guifg=#af5f5f "rgb=175,95,95
" hi x132_HotPink3 ctermfg=132 guifg=#af5f87 "rgb=175,95,135
" hi x133_MediumOrchid3 ctermfg=133 guifg=#af5faf "rgb=175,95,175
" hi x134_MediumOrchid ctermfg=134 guifg=#af5fd7 "rgb=175,95,215
" hi x135_MediumPurple2 ctermfg=135 guifg=#af5fff "rgb=175,95,255
" hi x136_DarkGoldenrod ctermfg=136 guifg=#af8700 "rgb=175,135,0
" hi x137_LightSalmon3 ctermfg=137 guifg=#af875f "rgb=175,135,95
" hi x138_RosyBrown ctermfg=138 guifg=#af8787 "rgb=175,135,135
" hi x139_Grey63 ctermfg=139 guifg=#af87af "rgb=175,135,175
" hi x140_MediumPurple2 ctermfg=140 guifg=#af87d7 "rgb=175,135,215
" hi x141_MediumPurple1 ctermfg=141 guifg=#af87ff "rgb=175,135,255
" hi x142_Gold3 ctermfg=142 guifg=#afaf00 "rgb=175,175,0
" hi x143_DarkKhaki ctermfg=143 guifg=#afaf5f "rgb=175,175,95
" hi x144_NavajoWhite3 ctermfg=144 guifg=#afaf87 "rgb=175,175,135
" hi x145_Grey69 ctermfg=145 guifg=#afafaf "rgb=175,175,175
" hi x146_LightSteelBlue3 ctermfg=146 guifg=#afafd7 "rgb=175,175,215
" hi x147_LightSteelBlue ctermfg=147 guifg=#afafff "rgb=175,175,255
" hi x148_Yellow3 ctermfg=148 guifg=#afd700 "rgb=175,215,0
" hi x149_DarkOliveGreen3 ctermfg=149 guifg=#afd75f "rgb=175,215,95
" hi x150_DarkSeaGreen3 ctermfg=150 guifg=#afd787 "rgb=175,215,135
" hi x151_DarkSeaGreen2 ctermfg=151 guifg=#afd7af "rgb=175,215,175
" hi x152_LightCyan3 ctermfg=152 guifg=#afd7d7 "rgb=175,215,215
" hi x153_LightSkyBlue1 ctermfg=153 guifg=#afd7ff "rgb=175,215,255
" hi x154_GreenYellow ctermfg=154 guifg=#afff00 "rgb=175,255,0
" hi x155_DarkOliveGreen2 ctermfg=155 guifg=#afff5f "rgb=175,255,95
" hi x156_PaleGreen1 ctermfg=156 guifg=#afff87 "rgb=175,255,135
" hi x157_DarkSeaGreen2 ctermfg=157 guifg=#afffaf "rgb=175,255,175
" hi x158_DarkSeaGreen1 ctermfg=158 guifg=#afffd7 "rgb=175,255,215
" hi x159_PaleTurquoise1 ctermfg=159 guifg=#afffff "rgb=175,255,255
" hi x160_Red3 ctermfg=160 guifg=#d70000 "rgb=215,0,0
" hi x161_DeepPink3 ctermfg=161 guifg=#d7005f "rgb=215,0,95
" hi x162_DeepPink3 ctermfg=162 guifg=#d70087 "rgb=215,0,135
" hi x163_Magenta3 ctermfg=163 guifg=#d700af "rgb=215,0,175
" hi x164_Magenta3 ctermfg=164 guifg=#d700d7 "rgb=215,0,215
" hi x165_Magenta2 ctermfg=165 guifg=#d700ff "rgb=215,0,255
" hi x166_DarkOrange3 ctermfg=166 guifg=#d75f00 "rgb=215,95,0
" hi x167_IndianRed ctermfg=167 guifg=#d75f5f "rgb=215,95,95
" hi x168_HotPink3 ctermfg=168 guifg=#d75f87 "rgb=215,95,135
" hi x169_HotPink2 ctermfg=169 guifg=#d75faf "rgb=215,95,175
" hi x170_Orchid ctermfg=170 guifg=#d75fd7 "rgb=215,95,215
" hi x171_MediumOrchid1 ctermfg=171 guifg=#d75fff "rgb=215,95,255
" hi x172_Orange3 ctermfg=172 guifg=#d78700 "rgb=215,135,0
" hi x173_LightSalmon3 ctermfg=173 guifg=#d7875f "rgb=215,135,95
" hi x174_LightPink3 ctermfg=174 guifg=#d78787 "rgb=215,135,135
" hi x175_Pink3 ctermfg=175 guifg=#d787af "rgb=215,135,175
" hi x176_Plum3 ctermfg=176 guifg=#d787d7 "rgb=215,135,215
" hi x177_Violet ctermfg=177 guifg=#d787ff "rgb=215,135,255
" hi x178_Gold3 ctermfg=178 guifg=#d7af00 "rgb=215,175,0
" hi x179_LightGoldenrod3 ctermfg=179 guifg=#d7af5f "rgb=215,175,95
" hi x180_Tan ctermfg=180 guifg=#d7af87 "rgb=215,175,135
" hi x181_MistyRose3 ctermfg=181 guifg=#d7afaf "rgb=215,175,175
" hi x182_Thistle3 ctermfg=182 guifg=#d7afd7 "rgb=215,175,215
" hi x183_Plum2 ctermfg=183 guifg=#d7afff "rgb=215,175,255
" hi x184_Yellow3 ctermfg=184 guifg=#d7d700 "rgb=215,215,0
" hi x185_Khaki3 ctermfg=185 guifg=#d7d75f "rgb=215,215,95
" hi x186_LightGoldenrod2 ctermfg=186 guifg=#d7d787 "rgb=215,215,135
" hi x187_LightYellow3 ctermfg=187 guifg=#d7d7af "rgb=215,215,175
" hi x188_Grey84 ctermfg=188 guifg=#d7d7d7 "rgb=215,215,215
" hi x189_LightSteelBlue1 ctermfg=189 guifg=#d7d7ff "rgb=215,215,255
" hi x190_Yellow2 ctermfg=190 guifg=#d7ff00 "rgb=215,255,0
" hi x191_DarkOliveGreen1 ctermfg=191 guifg=#d7ff5f "rgb=215,255,95
" hi x192_DarkOliveGreen1 ctermfg=192 guifg=#d7ff87 "rgb=215,255,135
" hi x193_DarkSeaGreen1 ctermfg=193 guifg=#d7ffaf "rgb=215,255,175
" hi x194_Honeydew2 ctermfg=194 guifg=#d7ffd7 "rgb=215,255,215
" hi x195_LightCyan1 ctermfg=195 guifg=#d7ffff "rgb=215,255,255
" hi x196_Red1 ctermfg=196 guifg=#ff0000 "rgb=255,0,0
" hi x197_DeepPink2 ctermfg=197 guifg=#ff005f "rgb=255,0,95
" hi x198_DeepPink1 ctermfg=198 guifg=#ff0087 "rgb=255,0,135
" hi x199_DeepPink1 ctermfg=199 guifg=#ff00af "rgb=255,0,175
" hi x200_Magenta2 ctermfg=200 guifg=#ff00d7 "rgb=255,0,215
" hi x201_Magenta1 ctermfg=201 guifg=#ff00ff "rgb=255,0,255
" hi x202_OrangeRed1 ctermfg=202 guifg=#ff5f00 "rgb=255,95,0
" hi x203_IndianRed1 ctermfg=203 guifg=#ff5f5f "rgb=255,95,95
" hi x204_IndianRed1 ctermfg=204 guifg=#ff5f87 "rgb=255,95,135
" hi x205_HotPink ctermfg=205 guifg=#ff5faf "rgb=255,95,175
" hi x206_HotPink ctermfg=206 guifg=#ff5fd7 "rgb=255,95,215
" hi x207_MediumOrchid1 ctermfg=207 guifg=#ff5fff "rgb=255,95,255
" hi x208_DarkOrange ctermfg=208 guifg=#ff8700 "rgb=255,135,0
" hi x209_Salmon1 ctermfg=209 guifg=#ff875f "rgb=255,135,95
" hi x210_LightCoral ctermfg=210 guifg=#ff8787 "rgb=255,135,135
" hi x211_PaleVioletRed1 ctermfg=211 guifg=#ff87af "rgb=255,135,175
" hi x212_Orchid2 ctermfg=212 guifg=#ff87d7 "rgb=255,135,215
" hi x213_Orchid1 ctermfg=213 guifg=#ff87ff "rgb=255,135,255
" hi x214_Orange1 ctermfg=214 guifg=#ffaf00 "rgb=255,175,0
" hi x215_SandyBrown ctermfg=215 guifg=#ffaf5f "rgb=255,175,95
" hi x216_LightSalmon1 ctermfg=216 guifg=#ffaf87 "rgb=255,175,135
" hi x217_LightPink1 ctermfg=217 guifg=#ffafaf "rgb=255,175,175
" hi x218_Pink1 ctermfg=218 guifg=#ffafd7 "rgb=255,175,215
" hi x219_Plum1 ctermfg=219 guifg=#ffafff "rgb=255,175,255
" hi x220_Gold1 ctermfg=220 guifg=#ffd700 "rgb=255,215,0
" hi x221_LightGoldenrod2 ctermfg=221 guifg=#ffd75f "rgb=255,215,95
" hi x222_LightGoldenrod2 ctermfg=222 guifg=#ffd787 "rgb=255,215,135
" hi x223_NavajoWhite1 ctermfg=223 guifg=#ffd7af "rgb=255,215,175
" hi x224_MistyRose1 ctermfg=224 guifg=#ffd7d7 "rgb=255,215,215
" hi x225_Thistle1 ctermfg=225 guifg=#ffd7ff "rgb=255,215,255
" hi x226_Yellow1 ctermfg=226 guifg=#ffff00 "rgb=255,255,0
" hi x227_LightGoldenrod1 ctermfg=227 guifg=#ffff5f "rgb=255,255,95
" hi x228_Khaki1 ctermfg=228 guifg=#ffff87 "rgb=255,255,135
" hi x229_Wheat1 ctermfg=229 guifg=#ffffaf "rgb=255,255,175
" hi x230_Cornsilk1 ctermfg=230 guifg=#ffffd7 "rgb=255,255,215
" hi x231_Grey100 ctermfg=231 guifg=#ffffff "rgb=255,255,255
" hi x232_Grey3 ctermfg=232 guifg=#080808 "rgb=8,8,8
" hi x233_Grey7 ctermfg=233 guifg=#121212 "rgb=18,18,18
" hi x234_Grey11 ctermfg=234 guifg=#1c1c1c "rgb=28,28,28
" hi x235_Grey15 ctermfg=235 guifg=#262626 "rgb=38,38,38
" hi x236_Grey19 ctermfg=236 guifg=#303030 "rgb=48,48,48
" hi x237_Grey23 ctermfg=237 guifg=#3a3a3a "rgb=58,58,58
" hi x238_Grey27 ctermfg=238 guifg=#444444 "rgb=68,68,68
" hi x239_Grey30 ctermfg=239 guifg=#4e4e4e "rgb=78,78,78
" hi x240_Grey35 ctermfg=240 guifg=#585858 "rgb=88,88,88
" hi x241_Grey39 ctermfg=241 guifg=#626262 "rgb=98,98,98
" hi x242_Grey42 ctermfg=242 guifg=#6c6c6c "rgb=108,108,108
" hi x243_Grey46 ctermfg=243 guifg=#767676 "rgb=118,118,118
" hi x244_Grey50 ctermfg=244 guifg=#808080 "rgb=128,128,128
" hi x245_Grey54 ctermfg=245 guifg=#8a8a8a "rgb=138,138,138
" hi x246_Grey58 ctermfg=246 guifg=#949494 "rgb=148,148,148
" hi x247_Grey62 ctermfg=247 guifg=#9e9e9e "rgb=158,158,158
" hi x248_Grey66 ctermfg=248 guifg=#a8a8a8 "rgb=168,168,168
" hi x249_Grey70 ctermfg=249 guifg=#b2b2b2 "rgb=178,178,178
" hi x250_Grey74 ctermfg=250 guifg=#bcbcbc "rgb=188,188,188
" hi x251_Grey78 ctermfg=251 guifg=#c6c6c6 "rgb=198,198,198
" hi x252_Grey82 ctermfg=252 guifg=#d0d0d0 "rgb=208,208,208
" hi x253_Grey85 ctermfg=253 guifg=#dadada "rgb=218,218,218
" hi x254_Grey89 ctermfg=254 guifg=#e4e4e4 "rgb=228,228,228
" hi x255_Grey93 ctermfg=255 guifg=#eeeeee "rgb=238,238,238
" ========================================

" ========================================
" Basic Settings
" ========================================
set nocompatible

" Set <LEADER> as <SPACE>
noremap <SPACE> <NOP>
let mapleader=" "
set encoding=UTF-8
let &t_ut=''
" set cursorline
if has("termguicolors")
    " enable true color
    set termguicolors
endif
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set number
set showmatch
set wildmenu
set autochdir
" set relativenumber
set list
set listchars=tab:\│\ ,trail:▫
set maxmempattern=10000
set hlsearch
set ignorecase
set smartcase
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set synmaxcol=300
set foldmethod=indent
set foldlevel=99
set scrolloff=5
set foldenable
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=150
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
set signcolumn=yes
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" fancy settings, let vim save the undo history even after shut down.
" !!! comment all backup settings according to the suggestion of the coc
" silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
" set backupdir=~/.config/nvim/tmp/backup,.
" set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

" Open the vimrc file anytime
nnoremap <LEADER>h :e ~/.config/nvim/init.vim<CR>

" Space to Tab
nnoremap <LEADER>st :%s/    /\t/g<CR>
nnoremap <LEADER>ts :%s/\t/    /g<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Spelling Check with <leader>sc
nnoremap <leader>sc :set spell!<CR>

" find and replace
nnoremap 'sa :%s//g<left><left>
nnoremap 'ss :%s//gc<left><left>

" markdown, latex, auto spell
autocmd BufRead,BufNewFile *.md,*.tex setlocal spell

" markdown shortcuts
" 快捷键    创建的文字
" ,n    ---
" ,b    粗体文字
" ,s    被划去的文字
" ,i    斜体文字
" ,d    代码块
" ,c    大的 代码块
" ,m    - [ ] 清单
" ,p    图片
" ,a    链接
" ,1    # H1
" ,2    ## H2
" ,3    ### H3
" ,4    #### H4
" ,l    --------
autocmd Filetype markdown inoremap <buffer> `f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <buffer> `n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> `b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> `s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> `i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> `d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> `c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> `m - [ ]
autocmd Filetype markdown inoremap <buffer> `p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> `a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> `1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `l --------<Enter>

" Press leader twice to jump to the next '<++>' and edit it
noremap <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4l

" bind <A-a> to use it for increasing numbers and <A-x> to decrease
nnoremap <M-a> <C-a>
nnoremap <M-x> <C-x>

" Search
nnoremap <LEADER><CR> :nohlsearch<CR>


" H key: go to the start of the line
nnoremap <c-a> ^
vnoremap <c-a> ^
inoremap <C-a> <ESC>I
" L key: go to the end of the line
nnoremap <c-e> g_
vnoremap <c-e> g_
inoremap <C-e> <ESC>A

" ========================================

" ========================================
" window management
" ========================================
" Use <space> + new arrow keys for moving the cursor around windows
nnoremap S <C-w>w
nnoremap K <C-w>k
nnoremap L <C-w>j
nnoremap H <C-w>h
nnoremap L <C-w>l

" can be used to close taglist, filetree, and windows at below, so use ctrl
" prefix
nnoremap <leader>q <C-w>o

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap zk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap zj :set splitbelow<CR>:split<CR>
nnoremap zh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap zl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
nnoremap <M-up> :res +5<CR>
nnoremap <M-down> :res -5<CR>
nnoremap <M-left> :vertical resize-5<CR>
nnoremap <M-right> :vertical resize+5<CR>

" Place the two screens up and down
nnoremap z] <C-w>t<C-w>K
" Place the two screens side by side
nnoremap z[ <C-w>t<C-w>H

" swap two panes
nnoremap zr <C-w><C-r>

" Create a new tab with tu
nnoremap <tab>g :tab split<CR>
nnoremap <tab>e :tabe<CR>
nnoremap <tab>[ :tab split<CR>:set splitright<CR>:vsplit<CR>
nnoremap <tab>] :tab split<CR>:set splitbelow<CR>:split<CR>

" Move around tabs with tn and ti
nnoremap <C-h> :-tabnext<CR>
nnoremap <C-l> :+tabnext<CR>

" Move around buffers
nnoremap <C-p> :bprevious<CR>
nnoremap <C-n> :bnext<CR>

" Move tabs with tmn and tmi
nnoremap <tab>- :-tabmove<CR>
nnoremap <tab>= :+tabmove<CR>
" ========================================


" ========================================
" terminal config
" ========================================
" Opening a terminal window
noremap <leader>/ :set splitbelow<CR>:split<CR>:term<CR>

" Terminal Behaviors
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-c> <C-\><C-n>

" terminal colors
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ========================================
" Code Runner
" ========================================
" Compile function
noremap <leader>bd :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'java'
        set splitbelow
        :sp
        :res -5
        term javac % && time java %<
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

vmap <leader>p :!python3<cr>

" ========================================
" Plugins
" ========================================
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mbbill/undotree'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kshenoy/vim-signature'
Plug 'ron89/thesaurus_query.vim'
Plug 'mhinz/vim-startify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'aperezdc/vim-template'
Plug 'svermeulen/vim-subversive'
Plug 'junegunn/goyo.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
Plug 'svermeulen/vim-yoink'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jmcantrell/vim-virtualenv'
Plug 'farmergreg/vim-lastplace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'rhysd/vim-grammarous'

" Find & Replace
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'theniceboy/vim-snippets'
Plug 'theniceboy/antovim' " gs to switch e.g., true -> false
Plug 'junegunn/vim-after-object'

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'lervag/vimtex'
Plug 'mzlogin/vim-markdown-toc'

" fancy treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'p00f/nvim-ts-rainbow'

" 0.5
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

" colorschemes
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'
Plug 'EdenEast/nightfox.nvim'
Plug 'navarasu/onedark.nvim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ----------------------------------------
" grammarous config
" ----------------------------------------
nmap <leader>gc :GrammarousCheck --no-comments-only<CR>

" Mappings  Description
" q Quit the info window
" <CR>  Move to the location of the error
" f Fix the error automatically
" r Remove the error without fix
" R Disable the grammar rule in the checked buffer
" n Move to the next error's location
" p Move to the previous error's location
" ? Show help of the mapping in info window
" ----------------------------------------

" ----------------------------------------
" antovim config
" ----------------------------------------
nmap <leader>rv :Antovim<CR>
" ----------------------------------------

" ----------------------------------------
" glow config
" ----------------------------------------
nmap <leader>gg :Glow<CR>
" ----------------------------------------

" ----------------------------------------
" nvim treesitter config
" ----------------------------------------
lua <<EOF
require'nvim-treesitter'.define_modules {
    fold = {
        attach = function(_, _)
            vim.cmd'set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()'
        end,
        detach = function() end,
    }
}

local langs = {
    "python",
    "bash",
    "html",
    "css",
    "lua",
    "latex",
    "bibtex",
    "yaml",
    "dockerfile",
    "c",
    "cpp",
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = langs,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection  = "gnn",
            node_incremental  = "grn",
            scope_incremental = "grc",
            node_decremental  = "grm",
        },
    },
    fold = {
        enable = true,
    },
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<leader>pl"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>ph"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]]"] = "@function.outer",
                ["]a"] = "@class.outer",
            },
            goto_next_end = {
                ["]["] = "@function.outer",
                ["]e"] = "@class.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                ["[a"] = "@class.outer",
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
                ["[e"] = "@class.outer",
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    }
}
EOF
" ----------------------------------------

" ----------------------------------------
" vimwiki config
" ----------------------------------------
let g:vimwiki_key_mappings = {
            \ 'all_maps': 1,
            \ 'global': 1,
            \ 'headers': 1,
            \ 'text_objs': 1,
            \ 'table_format': 1,
            \ 'table_mappings': 0,
            \ 'lists': 1,
            \ 'links': 1,
            \ 'html': 1,
            \ 'mouse': 0,
            \ }
" ----------------------------------------

" ----------------------------------------
" fzf-gitignore config
" ----------------------------------------
noremap <leader>gi :FzfGitignore<CR>
" ----------------------------------------

" ----------------------------------------
" vim markdown toc config
" ----------------------------------------
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" ----------------------------------------

" ----------------------------------------
" rnvimr config
" ----------------------------------------
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.5 * &columns)),
            \ 'height': float2nr(round(0.5 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
let g:rnvimr_presets = [{'width': 0.7, 'height': 0.7}]
" ----------------------------------------

" ----------------------------------------
" goyo config
" ----------------------------------------
map <leader>gy :Goyo<CR>
" ----------------------------------------

" ----------------------------------------
" vim subversive config
" ----------------------------------------
" s for substitute
nmap s <plug>(SubversiveSubstitute)
vmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
" ----------------------------------------

" ----------------------------------------
" vim template config
" ----------------------------------------
let g:templates_directory=["$HOME/.config/nvim/templates"]
let g:username='@pkuanjie'
let g:email='pkuanjie@gmail.com'
let g:license='MIT'
" ----------------------------------------

" ----------------------------------------
"  fzf config
" ----------------------------------------
nnoremap <silent> 'f :Files<CR>
nnoremap <silent> 'b :Buffers<CR>
nnoremap <silent> 'h :History<CR>
nnoremap <silent> 'm :Maps<CR>
nnoremap <silent> 't :Tags<CR>
nnoremap <silent> 'a :Ag<CR>
" ----------------------------------------

" ----------------------------------------
"  vim indentline config
" ----------------------------------------
" This plugin has been deleted for a better speed, just use list char to
" instead
nnoremap <leader>id :set list!<CR>
" ----------------------------------------

" ----------------------------------------
"  vim yoink config
" ----------------------------------------
nmap - <plug>(YoinkPostPasteSwapBack)
nmap = <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

" Note that the swap operations above will only affect the current paste and the history order will be unchanged. However - if you do want to permanently cycle through the history, you can do that too:
nmap y[ <plug>(YoinkRotateBack)
nmap y] <plug>(YoinkRotateForward)

nmap ym <plug>(YoinkPostPasteToggleFormat)
" ----------------------------------------

" ----------------------------------------
"  vim splitjoin config
" ----------------------------------------
"  gS for split
"  gJ for join
" ----------------------------------------

" ----------------------------------------
"  Thesaurus_query config
" ----------------------------------------
let g:tq_map_keys = 0
nnoremap <leader>rp :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <leader>rp y:ThesaurusQueryReplace <C-r>"<CR>
" ----------------------------------------

" ----------------------------------------
"  vim signature config
" ----------------------------------------
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx         Remove mark 'x' where x is a-zA-Z
"
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>   Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer
"
" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
" m<BS>     Remove all markers

" ----------------------------------------

" ----------------------------------------
"  vista config
" ----------------------------------------
nnoremap 'v :Vista<CR>
" ----------------------------------------

" ----------------------------------------
"  undetree
" ----------------------------------------
nnoremap 'u :UndotreeToggle<CR>:UndotreeFocus<CR>
" ----------------------------------------

" ----------------------------------------
"  vim rainbow
" ----------------------------------------
let g:rainbow_active = 1
" ----------------------------------------

" ----------------------------------------
" vim after object config
" ----------------------------------------
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" # va=  visual after =
" # ca=  change after =
" # da=  delete after =
" # ya=  yank after =
" apple = 'juice'
" ----------------------------------------

" ----------------------------------------
" vim tabular config
" ----------------------------------------
nmap <leader>= :Tabularize /=<CR>
vmap <leader>= :Tabularize /=<CR>
nmap <leader>: :Tabularize /:\zs<CR>
vmap <leader>: :Tabularize /:\zs<CR>
" ----------------------------------------

" ----------------------------------------
" vim table mode config
" ----------------------------------------
" <leader>tm to start table mode

" || or __ to quickly enable / disable table mode in insert mode
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ----------------------------------------

" ----------------------------------------
" vim markdown preview config
" ----------------------------------------
nmap <leader>pv <Plug>MarkdownPreviewToggle
" ----------------------------------------

" ----------------------------------------
" coc explorer config
" ----------------------------------------
nnoremap 'e :CocCommand explorer<CR>
" ----------------------------------------

" ----------------------------------------
" colorscheme config
" ----------------------------------------
let g:onedark_style = 'darker'
colorscheme onedark 
hi Search ctermbg=LightBlue guibg=LightBlue
hi Search ctermfg=Red guifg=Red
" ----------------------------------------

" ----------------------------------------
" ccc highlight config --- make sure this part is below the colorscheme part
" to override the default colorscheme settings
" ----------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText ctermfg=LightMagenta guifg=LightMagenta guibg=Black ctermbg=Black
nnoremap <leader>pc :call CocAction('pickColor')<CR>
nnoremap <leader>cp :call CocAction('colorPresentation')<CR>
" ----------------------------------------

" ----------------------------------------
" airline config
" ----------------------------------------
" let g:airline_theme= 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ':'
" ----------------------------------------

" ----------------------------------------
" vim-visual-multi usage
" ----------------------------------------
let g:VM_maps = {}
let g:VM_maps['Find Under']      = '<leader>n'
let g:VM_maps['Find Subword Under'] = '<leader>n'

" select words with Ctrl-N (remapped to <leader>n) (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" select one character at a time with Shift-Arrows
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" start insert mode with i,a,I,A

" ----------------------------------------
" vim-surround usage
" ----------------------------------------
nmap <leader>[ ysiw[
nmap <leader>] ysiw]

nmap <leader>{ ysiw{
nmap <leader>} ysiw}

nmap <leader>( ysiw(
nmap <leader>) ysiw)

nmap <leader>' ysiw'

nmap <leader>` ysiw`

nmap <leader>" ysiw"

nmap <leader>$ ysiw$

nmap <leader>< ysiw<
nmap <leader>> ysiw>

nmap <leader>* ysiw*
"  cs <now surround> <target surround> cs'"
"  ysiw <surround sign> surround the current word surrounded by space
"  ysw <surround sign> surround the current word
"  yse <surround sign>
"  ys$ <surround sign>
"  ys0 <surround sign>
"  ...
"  yss <surround sign> surround the current line
"  ----------------------------------------

" ----------------------------------------
" coc-pairs config
" ----------------------------------------
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
" ----------------------------------------

" ----------------------------------------
" coc config
" ----------------------------------------
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-css',
            \ 'coc-pyright',
            \ 'coc-html',
            \ 'coc-git',
            \ 'coc-lua',
            \ 'coc-pairs',
            \ 'coc-explorer',
            \ 'coc-vimlsp',
            \ 'coc-diagnostic',
            \ 'coc-snippets',
            \ 'coc-highlight',
            \ 'coc-stylelint',
            \ 'coc-syntax',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-yaml',
            \ 'coc-yank',
            \ 'coc-docker',
            \ 'coc-sourcekit',
            \ 'coc-tasks',
            \ 'coc-emoji',
            \ 'coc-clangd',
            \ 'coc-word']

let g:coc_disable_transparent_cursor = 0


" coc-translator
nmap ts <Plug>(coc-translator-p)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-n> to trigger completion.
inoremap <silent><expr> <c-n> coc#refresh()

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `g[` and `g]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Symbol renaming.
nmap <leader>x <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>ff  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" ----------------------------------------

" ----------------------------------------
"  coc list
" ----------------------------------------

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Mappings for CoCList
nnoremap <silent><nowait> <leader>yy :<C-u>CocList -A --normal yank<cr>
" Show commands.
nnoremap <silent><nowait> <leader>mm  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>oo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>bb  :<C-u>CocList -I symbols<cr>
" coc-task config
noremap <silent><nowait> <leader>tt :<C-u>CocList tasks<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>rr  :<C-u>CocListResume<CR>
" ----------------------------------------

" ----------------------------------------
" coc-git
" ----------------------------------------
" navigate chunks of current buffer
nmap <leader>g[ <Plug>(coc-git-prevchunk)
nmap <leader>g] <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap <leader>c[ <Plug>(coc-git-prevconflict)
nmap <leader>c] <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap <leader>gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <leader>gc <Plug>(coc-git-commit)
" create text object for git chunks
omap <leader>ig <Plug>(coc-git-chunk-inner)
xmap <leader>ig <Plug>(coc-git-chunk-inner)
omap <leader>ag <Plug>(coc-git-chunk-outer)
xmap <leader>ag <Plug>(coc-git-chunk-outer)
" ----------------------------------------

" ----------------------------------------
" coc-snippets
" ----------------------------------------
" Use <C-l> for trigger snippet expand. instead use tab
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:snips_author = '@pkuanjie'
" ----------------------------------------

" ----------------------------------------
" coc virtual text highlight config
" ----------------------------------------
hi CocHintVirtualText  ctermfg=Blue guifg=#15aabf ctermbg=234 guibg=#1c1c1c
hi CocInfoVirtualText  ctermfg=Yellow guifg=#fab005 ctermbg=234 guibg=#1c1c1c
hi CocWarningVirtualText  ctermfg=Brown guifg=#ff922b ctermbg=234 guibg=#1c1c1c
hi CocErrorVirtualText  ctermfg=Red guifg=#ff0000 ctermbg=234 guibg=#1c1c1c
" ----------------------------------------

" ----------------------------------------
" nerdcommenter config
" ----------------------------------------

" Create default mappings
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

nmap '' <Plug>NERDCommenterToggle
vmap '' <Plug>NERDCommenterToggle
nmap '; <Plug>NERDCommenterSexy
vmap '; <Plug>NERDCommenterSexy
nmap 'y <Plug>NERDCommenterYank
vmap 'y <Plug>NERDCommenterYank
nmap '] <Plug>NERDCommenterAppend
vmap '] <Plug>NERDCommenterAppend
nmap '[ <Plug>NERDCommenterToEOL
vmap '[ <Plug>NERDCommenterToEOL

nnoremap <silent> 'p vip:call NERDComment('x', 'toggle')<CR>

" ----------------------------------------
"
" ========================================
" Ending
" ========================================
exec "nohlsearch"
" ========================================
"
