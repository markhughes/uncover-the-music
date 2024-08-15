function AvatarConstants()
{
}
function AvatarEngine(mcavatar, sAttributes, sMission, sGender, mcRoot)
{
   var _loc1_ = this;
   _loc1_.isBadge = false;
   _loc1_.isGame = true;
   _loc1_.isConf = false;
   _loc1_._bdebug = false;
   _loc1_.debug("AvatarEngine Constructor");
   _loc1_.bReady = false;
   _loc1_._sAvatar_string = sAttributes;
   _loc1_._sAvatar_mission = sMission;
   _loc1_._sAvatar_gender = sGender;
   _loc1_.mcavatar = mcavatar;
   _loc1_._spos = "std";
   _loc1_._sposant = "std";
   _loc1_.shmask = shmask;
   _loc1_.hrmask = hrmask;
   _loc1_.chmask = chmask;
   _loc1_.fcmask = fcmask;
   _loc1_._mcRoot = mcRoot;
   _loc1_.init();
   _loc1_.initFunctions(_loc1_);
}
stop();
AvatarConstants._acolors = new Array(1);
AvatarConstants._acolors[0] = new Array("0xEEEEEE");
AvatarConstants._acolors[1] = new Array(106);
AvatarConstants._acolors[1][0] = "0xFFC273";
AvatarConstants._acolors[1][1] = "0xE6F0FA";
AvatarConstants._acolors[1][2] = "0xCCFFFF";
AvatarConstants._acolors[1][3] = "0xF1D6DF";
AvatarConstants._acolors[1][4] = "0xFFCCCC";
AvatarConstants._acolors[1][5] = "0xFEB3E5";
AvatarConstants._acolors[1][6] = "0xFFABCD";
AvatarConstants._acolors[1][7] = "0xCC99CC";
AvatarConstants._acolors[1][8] = "0xB784BD";
AvatarConstants._acolors[1][9] = "0x946F8B";
AvatarConstants._acolors[1][10] = "0x87837C";
AvatarConstants._acolors[1][11] = "0x7F6F59";
AvatarConstants._acolors[1][12] = "0x3F372C";
AvatarConstants._acolors[1][13] = "0x464650";
AvatarConstants._acolors[1][14] = "0xA5BDCC";
AvatarConstants._acolors[1][15] = "0xCCCCCC";
AvatarConstants._acolors[1][16] = "0xEBE3D8";
AvatarConstants._acolors[1][17] = "0xFFD099";
AvatarConstants._acolors[1][18] = "0xFFC08C";
AvatarConstants._acolors[1][19] = "0xFFA033";
AvatarConstants._acolors[1][20] = "0xFF7300";
AvatarConstants._acolors[1][21] = "0xFF5500";
AvatarConstants._acolors[1][22] = "0xEB4A00";
AvatarConstants._acolors[1][23] = "0xCC3300";
AvatarConstants._acolors[1][24] = "0xCC6633";
AvatarConstants._acolors[1][25] = "0xDE672C";
AvatarConstants._acolors[1][26] = "0xFF9966";
AvatarConstants._acolors[1][27] = "0xFFA666";
AvatarConstants._acolors[1][28] = "0xFFC273";
AvatarConstants._acolors[1][29] = "0xD1BEA7";
AvatarConstants._acolors[1][30] = "0x99713D";
AvatarConstants._acolors[1][31] = "0x7F541C";
AvatarConstants._acolors[1][32] = "0x8C550E";
AvatarConstants._acolors[1][33] = "0x995700";
AvatarConstants._acolors[1][34] = "0x733D11";
AvatarConstants._acolors[1][35] = "0x4C300B";
AvatarConstants._acolors[1][36] = "0x7F3900";
AvatarConstants._acolors[1][37] = "0xB35000";
AvatarConstants._acolors[1][38] = "0xB3692C";
AvatarConstants._acolors[1][39] = "0xCC7400";
AvatarConstants._acolors[1][40] = "0xCC9933";
AvatarConstants._acolors[1][41] = "0xBF8E4C";
AvatarConstants._acolors[1][42] = "0xCC8951";
AvatarConstants._acolors[1][43] = "0xCC9966";
AvatarConstants._acolors[1][44] = "0xCC9999";
AvatarConstants._acolors[1][45] = "0xCCCC66";
AvatarConstants._acolors[1][46] = "0xD9C657";
AvatarConstants._acolors[1][47] = "0xE6D450";
AvatarConstants._acolors[1][48] = "0xFFD900";
AvatarConstants._acolors[1][49] = "0xFFFF33";
AvatarConstants._acolors[1][50] = "0xCCCC00";
AvatarConstants._acolors[1][51] = "0xCCFF00";
AvatarConstants._acolors[1][52] = "0x66FF00";
AvatarConstants._acolors[1][53] = "0x33FF33";
AvatarConstants._acolors[1][54] = "0x66CC00";
AvatarConstants._acolors[1][55] = "0x99CC66";
AvatarConstants._acolors[1][56] = "0x90C589";
AvatarConstants._acolors[1][57] = "0x66CC66";
AvatarConstants._acolors[1][58] = "0x72CC66";
AvatarConstants._acolors[1][59] = "0x66CC99";
AvatarConstants._acolors[1][60] = "0x00CC66";
AvatarConstants._acolors[1][61] = "0x33FF99";
AvatarConstants._acolors[1][62] = "0x66FFCC";
AvatarConstants._acolors[1][63] = "0x99FFFF";
AvatarConstants._acolors[1][64] = "0x66FFFF";
AvatarConstants._acolors[1][65] = "0x33FFFF";
AvatarConstants._acolors[1][66] = "0x00FFFF";
AvatarConstants._acolors[1][67] = "0x0099CC";
AvatarConstants._acolors[1][68] = "0x1E82B4";
AvatarConstants._acolors[1][69] = "0x3399CC";
AvatarConstants._acolors[1][70] = "0x3399FF";
AvatarConstants._acolors[1][71] = "0x3366FF";
AvatarConstants._acolors[1][72] = "0x3300FF";
AvatarConstants._acolors[1][73] = "0x0000FF";
AvatarConstants._acolors[1][74] = "0x3333CC";
AvatarConstants._acolors[1][75] = "0x6633CC";
AvatarConstants._acolors[1][76] = "0x6600CC";
AvatarConstants._acolors[1][77] = "0x6600FF";
AvatarConstants._acolors[1][78] = "0x9933CC";
AvatarConstants._acolors[1][79] = "0x9900FF";
AvatarConstants._acolors[1][80] = "0x9900CC";
AvatarConstants._acolors[1][81] = "0xCC33FF";
AvatarConstants._acolors[1][82] = "0xCC66FF";
AvatarConstants._acolors[1][83] = "0xCC99FF";
AvatarConstants._acolors[1][84] = "0xF380FF";
AvatarConstants._acolors[1][85] = "0xFF3399";
AvatarConstants._acolors[1][86] = "0xCC3366";
AvatarConstants._acolors[1][87] = "0xCC0066";
AvatarConstants._acolors[1][88] = "0xCC0033";
AvatarConstants._acolors[1][89] = "0xC80A00";
AvatarConstants._acolors[1][90] = "0xC52727";
AvatarConstants._acolors[1][91] = "0xE34449";
AvatarConstants._acolors[1][92] = "0xFF334E";
AvatarConstants._acolors[1][93] = "0xB3CC9F";
AvatarConstants._acolors[1][94] = "0x829682";
AvatarConstants._acolors[1][95] = "0x878951";
AvatarConstants._acolors[1][96] = "0x57751E";
AvatarConstants._acolors[1][97] = "0x438F5B";
AvatarConstants._acolors[1][98] = "0x438F99";
AvatarConstants._acolors[1][99] = "0x9999CC";
AvatarConstants._acolors[1][100] = "0x6267B3";
AvatarConstants._acolors[1][101] = "0x6699FF";
AvatarConstants._acolors[1][102] = "0x80B3FF";
AvatarConstants._acolors[1][103] = "0x99CCFF";
AvatarConstants._acolors[1][104] = "0xA1C0EE";
AvatarConstants._acolors[1][105] = "0xCCCCFF";
AvatarConstants._acolors[2] = AvatarConstants._acolors[1];
AvatarConstants._acolors[3] = AvatarConstants._acolors[1];
AvatarConstants._acolors[4] = new Array(36);
AvatarConstants._acolors[4][0] = "0xF5E2CB";
AvatarConstants._acolors[4][1] = "0xFFF0F5";
AvatarConstants._acolors[4][2] = "0xFFD1CC";
AvatarConstants._acolors[4][3] = "0xD7AAA7";
AvatarConstants._acolors[4][4] = "0xE3C2AE";
AvatarConstants._acolors[4][5] = "0xF5E1D6";
AvatarConstants._acolors[4][6] = "0xFFE0C4";
AvatarConstants._acolors[4][7] = "0xFFDCB1";
AvatarConstants._acolors[4][8] = "0xE6C29C";
AvatarConstants._acolors[4][9] = "0xF5E2CB";
AvatarConstants._acolors[4][10] = "0xCCAD8B";
AvatarConstants._acolors[4][11] = "0xBD9778";
AvatarConstants._acolors[4][12] = "0xB39474";
AvatarConstants._acolors[4][13] = "0xA58869";
AvatarConstants._acolors[4][14] = "0x970E65";
AvatarConstants._acolors[4][15] = "0x856C53";
AvatarConstants._acolors[4][16] = "0x735C45";
AvatarConstants._acolors[4][17] = "0x7B0000";
AvatarConstants._acolors[4][18] = "0x940A00";
AvatarConstants._acolors[4][19] = "0xA01900";
AvatarConstants._acolors[4][20] = "0xA53900";
AvatarConstants._acolors[4][21] = "0xBB6D4A";
AvatarConstants._acolors[4][22] = "0xBE723C";
AvatarConstants._acolors[4][23] = "0xC77A58";
AvatarConstants._acolors[4][24] = "0xCC8443";
AvatarConstants._acolors[4][25] = "0xD99164";
AvatarConstants._acolors[4][26] = "0xD0926E";
AvatarConstants._acolors[4][27] = "0xDEAB7F";
AvatarConstants._acolors[4][28] = "0xDFA675";
AvatarConstants._acolors[4][29] = "0xE3A173";
AvatarConstants._acolors[4][30] = "0xFFFFC0";
AvatarConstants._acolors[4][31] = "0xF3E8AA";
AvatarConstants._acolors[4][32] = "0xDCD08F";
AvatarConstants._acolors[4][33] = "0xDCCB6E";
AvatarConstants._acolors[4][34] = "0xEDE4C8";
AvatarConstants._acolors[4][35] = "0xD9F7FF";
AvatarConstants._acolors[5] = new Array(106);
AvatarConstants._acolors[5][0] = "0xEEEEEE";
AvatarConstants._acolors[5][1] = "0xFAFAF0";
AvatarConstants._acolors[5][2] = "0xEEEEEE";
AvatarConstants._acolors[5][3] = "0xCCCCCC";
AvatarConstants._acolors[5][4] = "0x888888";
AvatarConstants._acolors[5][5] = "0x464650";
AvatarConstants._acolors[5][6] = "0x444444";
AvatarConstants._acolors[5][7] = "0x222222";
AvatarConstants._acolors[5][8] = "0xFFCCCC";
AvatarConstants._acolors[5][9] = "0xFFA6C1";
AvatarConstants._acolors[5][10] = "0xCC9999";
AvatarConstants._acolors[5][11] = "0x66CC00";
AvatarConstants._acolors[5][12] = "0x66CC66";
AvatarConstants._acolors[5][13] = "0x51CC51";
AvatarConstants._acolors[5][14] = "0x66FF00";
AvatarConstants._acolors[5][15] = "0x33FF33";
AvatarConstants._acolors[5][16] = "0x99CC66";
AvatarConstants._acolors[5][17] = "0x8AB37D";
AvatarConstants._acolors[5][18] = "0x6EB359";
AvatarConstants._acolors[5][19] = "0x999966";
AvatarConstants._acolors[5][20] = "0x57751E";
AvatarConstants._acolors[5][21] = "0x3D995A";
AvatarConstants._acolors[5][22] = "0x337F4C";
AvatarConstants._acolors[5][23] = "0x4F6647";
AvatarConstants._acolors[5][24] = "0x00CC66";
AvatarConstants._acolors[5][25] = "0x66CC99";
AvatarConstants._acolors[5][26] = "0xB3FFB3";
AvatarConstants._acolors[5][27] = "0xCCFFCC";
AvatarConstants._acolors[5][28] = "0x33FF99";
AvatarConstants._acolors[5][29] = "0x66FFCC";
AvatarConstants._acolors[5][30] = "0xCCFFFF";
AvatarConstants._acolors[5][31] = "0x99FFFF";
AvatarConstants._acolors[5][32] = "0x66FFFF";
AvatarConstants._acolors[5][33] = "0x33FFFF";
AvatarConstants._acolors[5][34] = "0x00FFFF";
AvatarConstants._acolors[5][35] = "0x62C5C5";
AvatarConstants._acolors[5][36] = "0x3399FF";
AvatarConstants._acolors[5][37] = "0x3366FF";
AvatarConstants._acolors[5][38] = "0x3300FF";
AvatarConstants._acolors[5][39] = "0x0000FF";
AvatarConstants._acolors[5][40] = "0x3333CC";
AvatarConstants._acolors[5][41] = "0x7259B3";
AvatarConstants._acolors[5][42] = "0x6633CC";
AvatarConstants._acolors[5][43] = "0x6600CC";
AvatarConstants._acolors[5][44] = "0x6600FF";
AvatarConstants._acolors[5][45] = "0x660099";
AvatarConstants._acolors[5][46] = "0x9900CC";
AvatarConstants._acolors[5][47] = "0x9933CC";
AvatarConstants._acolors[5][48] = "0x9900FF";
AvatarConstants._acolors[5][49] = "0xCC33FF";
AvatarConstants._acolors[5][50] = "0xCC66CC";
AvatarConstants._acolors[5][51] = "0xCC66FF";
AvatarConstants._acolors[5][52] = "0xCC99FF";
AvatarConstants._acolors[5][53] = "0xCC99CC";
AvatarConstants._acolors[5][54] = "0xB784BD";
AvatarConstants._acolors[5][55] = "0xB4A0C8";
AvatarConstants._acolors[5][56] = "0x9696B4";
AvatarConstants._acolors[5][57] = "0x9999CC";
AvatarConstants._acolors[5][58] = "0x6267B3";
AvatarConstants._acolors[5][59] = "0x5C8AE6";
AvatarConstants._acolors[5][60] = "0x6699FF";
AvatarConstants._acolors[5][61] = "0x80B3FF";
AvatarConstants._acolors[5][62] = "0x99CCFF";
AvatarConstants._acolors[5][63] = "0xCCCCFF";
AvatarConstants._acolors[5][64] = "0xF2BDFF";
AvatarConstants._acolors[5][65] = "0xF380FF";
AvatarConstants._acolors[5][66] = "0xE1488D";
AvatarConstants._acolors[5][67] = "0xFF3366";
AvatarConstants._acolors[5][68] = "0xFF3399";
AvatarConstants._acolors[5][69] = "0xCC3366";
AvatarConstants._acolors[5][70] = "0xA8404A";
AvatarConstants._acolors[5][71] = "0x87333B";
AvatarConstants._acolors[5][72] = "0xCF295B";
AvatarConstants._acolors[5][73] = "0xCC0066";
AvatarConstants._acolors[5][74] = "0xCC0033";
AvatarConstants._acolors[5][75] = "0xC80A00";
AvatarConstants._acolors[5][76] = "0xFF3333";
AvatarConstants._acolors[5][77] = "0xEE3C2F";
AvatarConstants._acolors[5][78] = "0xCC3300";
AvatarConstants._acolors[5][79] = "0xCC6633";
AvatarConstants._acolors[5][80] = "0xEE7028";
AvatarConstants._acolors[5][81] = "0xEE8728";
AvatarConstants._acolors[5][82] = "0xFF9966";
AvatarConstants._acolors[5][83] = "0xFF9F40";
AvatarConstants._acolors[5][84] = "0xEEC858";
AvatarConstants._acolors[5][85] = "0xFFD200";
AvatarConstants._acolors[5][86] = "0xFFDB57";
AvatarConstants._acolors[5][87] = "0xFFDF80";
AvatarConstants._acolors[5][88] = "0xFFE6A6";
AvatarConstants._acolors[5][89] = "0xA1C9E6";
AvatarConstants._acolors[5][90] = "0x58A6CE";
AvatarConstants._acolors[5][91] = "0x3399CC";
AvatarConstants._acolors[5][92] = "0x2E7EB8";
AvatarConstants._acolors[5][93] = "0x517187";
AvatarConstants._acolors[5][94] = "0x5D95BA";
AvatarConstants._acolors[5][95] = "0x0099CC";
AvatarConstants._acolors[5][96] = "0xAE7734";
AvatarConstants._acolors[5][97] = "0x9C6036";
AvatarConstants._acolors[5][98] = "0x733D11";
AvatarConstants._acolors[5][99] = "0x7D5626";
AvatarConstants._acolors[5][100] = "0xCC9933";
AvatarConstants._acolors[5][101] = "0xCC9966";
AvatarConstants._acolors[5][102] = "0xFFFF33";
AvatarConstants._acolors[5][103] = "0xCCFF00";
AvatarConstants._acolors[5][104] = "0xCCCC00";
AvatarConstants._acolors[5][105] = "0xCCCC66";
AvatarConstants._acolors[6] = AvatarConstants._acolors[5];
AvatarConstants._acolors[7] = AvatarConstants._acolors[5];
AvatarConstants._acolors[8] = new Array(106);
AvatarConstants._acolors[8][0] = "0x7F6640";
AvatarConstants._acolors[8][1] = "0xEEEEEE";
AvatarConstants._acolors[8][2] = "0xCCCCCC";
AvatarConstants._acolors[8][3] = "0xB0B0B0";
AvatarConstants._acolors[8][4] = "0xAAAAAA";
AvatarConstants._acolors[8][5] = "0x888888";
AvatarConstants._acolors[8][6] = "0x707070";
AvatarConstants._acolors[8][7] = "0x595959";
AvatarConstants._acolors[8][8] = "0x575757";
AvatarConstants._acolors[8][9] = "0x444444";
AvatarConstants._acolors[8][10] = "0x383838";
AvatarConstants._acolors[8][11] = "0x3D4A66";
AvatarConstants._acolors[8][12] = "0x564D6E";
AvatarConstants._acolors[8][13] = "0x565E7A";
AvatarConstants._acolors[8][14] = "0x54678C";
AvatarConstants._acolors[8][15] = "0x6B7699";
AvatarConstants._acolors[8][16] = "0x6BBD59";
AvatarConstants._acolors[8][17] = "0x66CC00";
AvatarConstants._acolors[8][18] = "0x66CC66";
AvatarConstants._acolors[8][19] = "0x00CC66";
AvatarConstants._acolors[8][20] = "0x66CC99";
AvatarConstants._acolors[8][21] = "0x11AEA8";
AvatarConstants._acolors[8][22] = "0x99CC66";
AvatarConstants._acolors[8][23] = "0x758C69";
AvatarConstants._acolors[8][24] = "0x707F68";
AvatarConstants._acolors[8][25] = "0x56704C";
AvatarConstants._acolors[8][26] = "0x999966";
AvatarConstants._acolors[8][27] = "0x999900";
AvatarConstants._acolors[8][28] = "0x66FF00";
AvatarConstants._acolors[8][29] = "0x33FF33";
AvatarConstants._acolors[8][30] = "0x33FF99";
AvatarConstants._acolors[8][31] = "0x66FFCC";
AvatarConstants._acolors[8][32] = "0xCCFFFF";
AvatarConstants._acolors[8][33] = "0x99FFFF";
AvatarConstants._acolors[8][34] = "0x66FFFF";
AvatarConstants._acolors[8][35] = "0x33FFFF";
AvatarConstants._acolors[8][36] = "0x00FFFF";
AvatarConstants._acolors[8][37] = "0x3366FF";
AvatarConstants._acolors[8][38] = "0x3300FF";
AvatarConstants._acolors[8][39] = "0x0000FF";
AvatarConstants._acolors[8][40] = "0x3333CC";
AvatarConstants._acolors[8][41] = "0x6600FF";
AvatarConstants._acolors[8][42] = "0x6633CC";
AvatarConstants._acolors[8][43] = "0x6600CC";
AvatarConstants._acolors[8][44] = "0x765C94";
AvatarConstants._acolors[8][45] = "0x996699";
AvatarConstants._acolors[8][46] = "0x9900CC";
AvatarConstants._acolors[8][47] = "0x9933CC";
AvatarConstants._acolors[8][48] = "0x9900FF";
AvatarConstants._acolors[8][49] = "0xCC33FF";
AvatarConstants._acolors[8][50] = "0xCC66FF";
AvatarConstants._acolors[8][51] = "0xCC99FF";
AvatarConstants._acolors[8][52] = "0xCC99CC";
AvatarConstants._acolors[8][53] = "0xCF76C7";
AvatarConstants._acolors[8][54] = "0xCC00CC";
AvatarConstants._acolors[8][55] = "0xB784BD";
AvatarConstants._acolors[8][56] = "0x0099CC";
AvatarConstants._acolors[8][57] = "0x3399CC";
AvatarConstants._acolors[8][58] = "0x476A9E";
AvatarConstants._acolors[8][59] = "0x687C7F";
AvatarConstants._acolors[8][60] = "0x536F91";
AvatarConstants._acolors[8][61] = "0x738EBF";
AvatarConstants._acolors[8][62] = "0x698CBF";
AvatarConstants._acolors[8][63] = "0x6267B3";
AvatarConstants._acolors[8][64] = "0x9999CC";
AvatarConstants._acolors[8][65] = "0xCCCCFF";
AvatarConstants._acolors[8][66] = "0xCCE1FF";
AvatarConstants._acolors[8][67] = "0x9ABCEE";
AvatarConstants._acolors[8][68] = "0x6699FF";
AvatarConstants._acolors[8][69] = "0x3399FF";
AvatarConstants._acolors[8][70] = "0x6D87EE";
AvatarConstants._acolors[8][71] = "0x99CCFF";
AvatarConstants._acolors[8][72] = "0xFFFF33";
AvatarConstants._acolors[8][73] = "0xCCFF00";
AvatarConstants._acolors[8][74] = "0xCCCC00";
AvatarConstants._acolors[8][75] = "0xCCCC66";
AvatarConstants._acolors[8][76] = "0xCCCC99";
AvatarConstants._acolors[8][77] = "0xCCC099";
AvatarConstants._acolors[8][78] = "0xCC9933";
AvatarConstants._acolors[8][79] = "0xCC9966";
AvatarConstants._acolors[8][80] = "0xE1B028";
AvatarConstants._acolors[8][81] = "0xE6B65C";
AvatarConstants._acolors[8][82] = "0xE6C695";
AvatarConstants._acolors[8][83] = "0xBF9D69";
AvatarConstants._acolors[8][84] = "0x99743D";
AvatarConstants._acolors[8][85] = "0x7F6C63";
AvatarConstants._acolors[8][86] = "0x7F6640";
AvatarConstants._acolors[8][87] = "0x734837";
AvatarConstants._acolors[8][88] = "0x995A42";
AvatarConstants._acolors[8][89] = "0xB36344";
AvatarConstants._acolors[8][90] = "0xCC6633";
AvatarConstants._acolors[8][91] = "0xFF9966";
AvatarConstants._acolors[8][92] = "0xFF7738";
AvatarConstants._acolors[8][93] = "0xFF3366";
AvatarConstants._acolors[8][94] = "0xFF2E4A";
AvatarConstants._acolors[8][95] = "0xFF3399";
AvatarConstants._acolors[8][96] = "0xCC3366";
AvatarConstants._acolors[8][97] = "0xCC0066";
AvatarConstants._acolors[8][98] = "0xCC0033";
AvatarConstants._acolors[8][99] = "0xDC3330";
AvatarConstants._acolors[8][100] = "0xCC3300";
AvatarConstants._acolors[8][101] = "0x996666";
AvatarConstants._acolors[8][102] = "0xCC6699";
AvatarConstants._acolors[8][103] = "0xCC9999";
AvatarConstants._acolors[8][104] = "0xFFAEAE";
AvatarConstants._acolors[8][105] = "0xFFCCCC";
AvatarConstants._acolors[9] = AvatarConstants._acolors[8];
AvatarConstants._acolors[10] = AvatarConstants._acolors[8];
AvatarConstants._acolors[11] = new Array(106);
AvatarConstants._acolors[11][0] = "0xC27B38";
AvatarConstants._acolors[11][1] = "0xEEEEEE";
AvatarConstants._acolors[11][2] = "0xCCCCCC";
AvatarConstants._acolors[11][3] = "0x909090";
AvatarConstants._acolors[11][4] = "0x888888";
AvatarConstants._acolors[11][5] = "0x8B93B0";
AvatarConstants._acolors[11][6] = "0x9999CC";
AvatarConstants._acolors[11][7] = "0xCCCCFF";
AvatarConstants._acolors[11][8] = "0xC2CFFF";
AvatarConstants._acolors[11][9] = "0xB3D5FF";
AvatarConstants._acolors[11][10] = "0x99CCFF";
AvatarConstants._acolors[11][11] = "0x80B3FF";
AvatarConstants._acolors[11][12] = "0x3399FF";
AvatarConstants._acolors[11][13] = "0x6699FF";
AvatarConstants._acolors[11][14] = "0x33CCFF";
AvatarConstants._acolors[11][15] = "0x66CCFF";
AvatarConstants._acolors[11][16] = "0x606B46";
AvatarConstants._acolors[11][17] = "0x738571";
AvatarConstants._acolors[11][18] = "0x999966";
AvatarConstants._acolors[11][19] = "0xCCCC66";
AvatarConstants._acolors[11][20] = "0xCCCC00";
AvatarConstants._acolors[11][21] = "0xEED85C";
AvatarConstants._acolors[11][22] = "0xFFCC00";
AvatarConstants._acolors[11][23] = "0xFFCC66";
AvatarConstants._acolors[11][24] = "0xEEDCB0";
AvatarConstants._acolors[11][25] = "0x66CC00";
AvatarConstants._acolors[11][26] = "0x66CC66";
AvatarConstants._acolors[11][27] = "0x5DAB3C";
AvatarConstants._acolors[11][28] = "0x99CC66";
AvatarConstants._acolors[11][29] = "0x99CC99";
AvatarConstants._acolors[11][30] = "0x66CC99";
AvatarConstants._acolors[11][31] = "0x00CC66";
AvatarConstants._acolors[11][32] = "0x66FF00";
AvatarConstants._acolors[11][33] = "0x33FF33";
AvatarConstants._acolors[11][34] = "0x99FF33";
AvatarConstants._acolors[11][35] = "0xCCFF00";
AvatarConstants._acolors[11][36] = "0xFFFF33";
AvatarConstants._acolors[11][37] = "0xFFFF00";
AvatarConstants._acolors[11][38] = "0xFFFF99";
AvatarConstants._acolors[11][39] = "0xFFFFCC";
AvatarConstants._acolors[11][40] = "0x33FF99";
AvatarConstants._acolors[11][41] = "0x66FFCC";
AvatarConstants._acolors[11][42] = "0xCCFFFF";
AvatarConstants._acolors[11][43] = "0x99FFFF";
AvatarConstants._acolors[11][44] = "0x66FFFF";
AvatarConstants._acolors[11][45] = "0x33FFFF";
AvatarConstants._acolors[11][46] = "0x00FFFF";
AvatarConstants._acolors[11][47] = "0x3366FF";
AvatarConstants._acolors[11][48] = "0x3300FF";
AvatarConstants._acolors[11][49] = "0x0000FF";
AvatarConstants._acolors[11][50] = "0x3333CC";
AvatarConstants._acolors[11][51] = "0x3300CC";
AvatarConstants._acolors[11][52] = "0x6267B3";
AvatarConstants._acolors[11][53] = "0x332B54";
AvatarConstants._acolors[11][54] = "0x365D7A";
AvatarConstants._acolors[11][55] = "0x5797C7";
AvatarConstants._acolors[11][56] = "0x3399CC";
AvatarConstants._acolors[11][57] = "0x0099CC";
AvatarConstants._acolors[11][58] = "0x6600FF";
AvatarConstants._acolors[11][59] = "0x6633CC";
AvatarConstants._acolors[11][60] = "0x6600CC";
AvatarConstants._acolors[11][61] = "0x9900FF";
AvatarConstants._acolors[11][62] = "0x9966FF";
AvatarConstants._acolors[11][63] = "0x9966CC";
AvatarConstants._acolors[11][64] = "0x9900CC";
AvatarConstants._acolors[11][65] = "0x9933CC";
AvatarConstants._acolors[11][66] = "0xCC33FF";
AvatarConstants._acolors[11][67] = "0xCC66FF";
AvatarConstants._acolors[11][68] = "0xCC99FF";
AvatarConstants._acolors[11][69] = "0xCC99CC";
AvatarConstants._acolors[11][70] = "0xB784BD";
AvatarConstants._acolors[11][71] = "0x875679";
AvatarConstants._acolors[11][72] = "0xF1D6DF";
AvatarConstants._acolors[11][73] = "0xFFCCCC";
AvatarConstants._acolors[11][74] = "0xFFB3B3";
AvatarConstants._acolors[11][75] = "0xCC9999";
AvatarConstants._acolors[11][76] = "0xCC6699";
AvatarConstants._acolors[11][77] = "0xCC00CC";
AvatarConstants._acolors[11][78] = "0xCC66CC";
AvatarConstants._acolors[11][79] = "0xFF00CC";
AvatarConstants._acolors[11][80] = "0xFF33FF";
AvatarConstants._acolors[11][81] = "0xFF66CC";
AvatarConstants._acolors[11][82] = "0xFF3366";
AvatarConstants._acolors[11][83] = "0xFF3399";
AvatarConstants._acolors[11][84] = "0xCC3366";
AvatarConstants._acolors[11][85] = "0xCC0066";
AvatarConstants._acolors[11][86] = "0xCC0033";
AvatarConstants._acolors[11][87] = "0xC80A00";
AvatarConstants._acolors[11][88] = "0xCC3300";
AvatarConstants._acolors[11][89] = "0xEE3437";
AvatarConstants._acolors[11][90] = "0xFF0000";
AvatarConstants._acolors[11][91] = "0xFF3333";
AvatarConstants._acolors[11][92] = "0xFF6666";
AvatarConstants._acolors[11][93] = "0xFF6600";
AvatarConstants._acolors[11][94] = "0xEE7140";
AvatarConstants._acolors[11][95] = "0xFF9966";
AvatarConstants._acolors[11][96] = "0xE3A76F";
AvatarConstants._acolors[11][97] = "0xCC9966";
AvatarConstants._acolors[11][98] = "0xCC9933";
AvatarConstants._acolors[11][99] = "0xCC9900";
AvatarConstants._acolors[11][100] = "0xC27B38";
AvatarConstants._acolors[11][101] = "0xCC6633";
AvatarConstants._acolors[11][102] = "0x9E7054";
AvatarConstants._acolors[11][103] = "0x91542E";
AvatarConstants._acolors[11][104] = "0x733D11";
AvatarConstants._acolors[11][105] = "0x5E514D";
AvatarConstants._acolors[12] = AvatarConstants._acolors[11];
AvatarConstants._acolors[13] = AvatarConstants._acolors[11];
AvatarConstants._acolors[14] = AvatarConstants._acolors[11];
AvatarConstants._obd_arr = new Array(2);
i = 0;
while(i < AvatarConstants._obd_arr.length)
{
   AvatarConstants._obd_arr[i] = new Array(3);
   i++;
}
AvatarConstants._obd_arr[0][0] = "001";
AvatarConstants._obd_arr[1][0] = "002";
AvatarConstants._obd_arr[0][1] = AvatarConstants._acolors[4];
AvatarConstants._obd_arr[1][1] = AvatarConstants._acolors[4];
AvatarConstants._obd_arr[0][2] = "001";
AvatarConstants._obd_arr[1][2] = "002";
AvatarConstants._orh_arr = new Array(1);
i = 0;
while(i < AvatarConstants._orh_arr.length)
{
   AvatarConstants._orh_arr[i] = new Array(3);
   i++;
}
AvatarConstants._orh_arr[0][0] = "001";
AvatarConstants._orh_arr[0][1] = AvatarConstants._acolors[4];
AvatarConstants._orh_arr[0][2] = "*";
AvatarConstants._olh_arr = new Array(1);
i = 0;
while(i < AvatarConstants._olh_arr.length)
{
   AvatarConstants._olh_arr[i] = new Array(3);
   i++;
}
AvatarConstants._olh_arr[0][0] = "001";
AvatarConstants._olh_arr[0][1] = AvatarConstants._acolors[4];
AvatarConstants._olh_arr[0][2] = "*";
AvatarConstants._ohr_arr = new Array(18);
i = 0;
while(i < AvatarConstants._ohr_arr.length)
{
   AvatarConstants._ohr_arr[i] = new Array(3);
   i++;
}
AvatarConstants._ohr_arr[0][0] = "001";
AvatarConstants._ohr_arr[1][0] = "002";
AvatarConstants._ohr_arr[2][0] = "003";
AvatarConstants._ohr_arr[3][0] = "004";
AvatarConstants._ohr_arr[4][0] = "005";
AvatarConstants._ohr_arr[5][0] = "006";
AvatarConstants._ohr_arr[6][0] = "007";
AvatarConstants._ohr_arr[7][0] = "008";
AvatarConstants._ohr_arr[8][0] = "009";
AvatarConstants._ohr_arr[9][0] = "010";
AvatarConstants._ohr_arr[10][0] = "011";
AvatarConstants._ohr_arr[11][0] = "012";
AvatarConstants._ohr_arr[12][0] = "013";
AvatarConstants._ohr_arr[13][0] = "014";
AvatarConstants._ohr_arr[14][0] = "017";
AvatarConstants._ohr_arr[15][0] = "018";
AvatarConstants._ohr_arr[16][0] = "019";
AvatarConstants._ohr_arr[17][0] = "020";
AvatarConstants._ohr_arr[0][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[1][1] = AvatarConstants._acolors[0];
AvatarConstants._ohr_arr[2][1] = AvatarConstants._acolors[0];
AvatarConstants._ohr_arr[3][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[4][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[5][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[6][1] = AvatarConstants._acolors[2];
AvatarConstants._ohr_arr[7][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[8][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[9][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[10][1] = AvatarConstants._acolors[3];
AvatarConstants._ohr_arr[11][1] = AvatarConstants._acolors[3];
AvatarConstants._ohr_arr[12][1] = AvatarConstants._acolors[0];
AvatarConstants._ohr_arr[13][1] = AvatarConstants._acolors[13];
AvatarConstants._ohr_arr[14][1] = AvatarConstants._acolors[0];
AvatarConstants._ohr_arr[15][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[16][1] = AvatarConstants._acolors[0];
AvatarConstants._ohr_arr[17][1] = AvatarConstants._acolors[1];
AvatarConstants._ohr_arr[0][2] = "001";
AvatarConstants._ohr_arr[1][2] = "001";
AvatarConstants._ohr_arr[2][2] = "001";
AvatarConstants._ohr_arr[3][2] = "002";
AvatarConstants._ohr_arr[4][2] = "002";
AvatarConstants._ohr_arr[5][2] = "002";
AvatarConstants._ohr_arr[6][2] = "*";
AvatarConstants._ohr_arr[7][2] = "*";
AvatarConstants._ohr_arr[8][2] = "*";
AvatarConstants._ohr_arr[9][2] = "*";
AvatarConstants._ohr_arr[10][2] = "*";
AvatarConstants._ohr_arr[11][2] = "*";
AvatarConstants._ohr_arr[12][2] = "*";
AvatarConstants._ohr_arr[13][2] = "*";
AvatarConstants._ohr_arr[14][2] = "*";
AvatarConstants._ohr_arr[15][2] = "*";
AvatarConstants._ohr_arr[16][2] = "*";
AvatarConstants._ohr_arr[17][2] = "*";
AvatarConstants._ohd_arr = new Array(32);
i = 0;
while(i < AvatarConstants._ohd_arr.length)
{
   AvatarConstants._ohd_arr[i] = new Array(3);
   i++;
}
AvatarConstants._ohd_arr[0][0] = "001";
AvatarConstants._ohd_arr[1][0] = "001";
AvatarConstants._ohd_arr[2][0] = "001";
AvatarConstants._ohd_arr[3][0] = "001";
AvatarConstants._ohd_arr[4][0] = "001";
AvatarConstants._ohd_arr[5][0] = "001";
AvatarConstants._ohd_arr[6][0] = "001";
AvatarConstants._ohd_arr[7][0] = "001";
AvatarConstants._ohd_arr[8][0] = "002";
AvatarConstants._ohd_arr[9][0] = "002";
AvatarConstants._ohd_arr[10][0] = "002";
AvatarConstants._ohd_arr[11][0] = "002";
AvatarConstants._ohd_arr[12][0] = "002";
AvatarConstants._ohd_arr[13][0] = "002";
AvatarConstants._ohd_arr[14][0] = "002";
AvatarConstants._ohd_arr[15][0] = "002";
AvatarConstants._ohd_arr[16][0] = "003";
AvatarConstants._ohd_arr[17][0] = "003";
AvatarConstants._ohd_arr[18][0] = "003";
AvatarConstants._ohd_arr[19][0] = "003";
AvatarConstants._ohd_arr[20][0] = "003";
AvatarConstants._ohd_arr[21][0] = "003";
AvatarConstants._ohd_arr[22][0] = "003";
AvatarConstants._ohd_arr[23][0] = "003";
AvatarConstants._ohd_arr[24][0] = "004";
AvatarConstants._ohd_arr[25][0] = "004";
AvatarConstants._ohd_arr[26][0] = "004";
AvatarConstants._ohd_arr[27][0] = "004";
AvatarConstants._ohd_arr[28][0] = "004";
AvatarConstants._ohd_arr[29][0] = "004";
AvatarConstants._ohd_arr[30][0] = "004";
AvatarConstants._ohd_arr[31][0] = "004";
AvatarConstants._ohd_arr[0][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[1][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[2][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[3][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[4][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[5][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[6][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[7][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[8][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[9][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[10][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[11][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[12][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[13][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[14][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[15][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[16][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[17][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[18][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[19][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[20][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[21][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[22][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[23][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[24][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[25][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[26][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[27][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[28][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[29][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[30][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[31][1] = AvatarConstants._acolors[4];
AvatarConstants._ohd_arr[0][2] = "001";
AvatarConstants._ohd_arr[1][2] = "001";
AvatarConstants._ohd_arr[2][2] = "001";
AvatarConstants._ohd_arr[3][2] = "001";
AvatarConstants._ohd_arr[4][2] = "001";
AvatarConstants._ohd_arr[5][2] = "001";
AvatarConstants._ohd_arr[6][2] = "001";
AvatarConstants._ohd_arr[7][2] = "001";
AvatarConstants._ohd_arr[8][2] = "001";
AvatarConstants._ohd_arr[9][2] = "001";
AvatarConstants._ohd_arr[10][2] = "001";
AvatarConstants._ohd_arr[11][2] = "001";
AvatarConstants._ohd_arr[12][2] = "001";
AvatarConstants._ohd_arr[13][2] = "001";
AvatarConstants._ohd_arr[14][2] = "001";
AvatarConstants._ohd_arr[15][2] = "001";
AvatarConstants._ohd_arr[16][2] = "002";
AvatarConstants._ohd_arr[17][2] = "002";
AvatarConstants._ohd_arr[18][2] = "002";
AvatarConstants._ohd_arr[19][2] = "002";
AvatarConstants._ohd_arr[20][2] = "002";
AvatarConstants._ohd_arr[21][2] = "002";
AvatarConstants._ohd_arr[22][2] = "002";
AvatarConstants._ohd_arr[23][2] = "002";
AvatarConstants._ohd_arr[24][2] = "002";
AvatarConstants._ohd_arr[25][2] = "002";
AvatarConstants._ohd_arr[26][2] = "002";
AvatarConstants._ohd_arr[27][2] = "002";
AvatarConstants._ohd_arr[28][2] = "002";
AvatarConstants._ohd_arr[29][2] = "002";
AvatarConstants._ohd_arr[30][2] = "002";
AvatarConstants._ohd_arr[31][2] = "002";
AvatarConstants._oey_arr = new Array(32);
i = 0;
while(i < AvatarConstants._oey_arr.length)
{
   AvatarConstants._oey_arr[i] = new Array(3);
   i++;
}
AvatarConstants._oey_arr[0][0] = "001";
AvatarConstants._oey_arr[1][0] = "002";
AvatarConstants._oey_arr[2][0] = "003";
AvatarConstants._oey_arr[3][0] = "004";
AvatarConstants._oey_arr[4][0] = "001";
AvatarConstants._oey_arr[5][0] = "002";
AvatarConstants._oey_arr[6][0] = "003";
AvatarConstants._oey_arr[7][0] = "004";
AvatarConstants._oey_arr[8][0] = "001";
AvatarConstants._oey_arr[9][0] = "002";
AvatarConstants._oey_arr[10][0] = "003";
AvatarConstants._oey_arr[11][0] = "004";
AvatarConstants._oey_arr[12][0] = "001";
AvatarConstants._oey_arr[13][0] = "002";
AvatarConstants._oey_arr[14][0] = "003";
AvatarConstants._oey_arr[15][0] = "004";
AvatarConstants._oey_arr[16][0] = "005";
AvatarConstants._oey_arr[17][0] = "006";
AvatarConstants._oey_arr[18][0] = "007";
AvatarConstants._oey_arr[19][0] = "008";
AvatarConstants._oey_arr[20][0] = "005";
AvatarConstants._oey_arr[21][0] = "006";
AvatarConstants._oey_arr[22][0] = "007";
AvatarConstants._oey_arr[23][0] = "008";
AvatarConstants._oey_arr[24][0] = "005";
AvatarConstants._oey_arr[25][0] = "006";
AvatarConstants._oey_arr[26][0] = "007";
AvatarConstants._oey_arr[27][0] = "008";
AvatarConstants._oey_arr[28][0] = "005";
AvatarConstants._oey_arr[29][0] = "006";
AvatarConstants._oey_arr[30][0] = "007";
AvatarConstants._oey_arr[31][0] = "008";
AvatarConstants._oey_arr[0][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[1][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[2][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[3][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[4][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[5][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[6][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[7][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[8][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[9][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[10][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[11][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[12][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[13][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[14][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[15][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[16][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[17][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[18][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[19][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[20][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[21][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[22][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[23][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[24][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[25][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[26][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[27][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[28][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[29][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[30][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[31][1] = AvatarConstants._acolors[0];
AvatarConstants._oey_arr[0][2] = "001";
AvatarConstants._oey_arr[1][2] = "001";
AvatarConstants._oey_arr[2][2] = "001";
AvatarConstants._oey_arr[3][2] = "001";
AvatarConstants._oey_arr[4][2] = "001";
AvatarConstants._oey_arr[5][2] = "001";
AvatarConstants._oey_arr[6][2] = "001";
AvatarConstants._oey_arr[7][2] = "001";
AvatarConstants._oey_arr[8][2] = "001";
AvatarConstants._oey_arr[9][2] = "001";
AvatarConstants._oey_arr[10][2] = "001";
AvatarConstants._oey_arr[11][2] = "001";
AvatarConstants._oey_arr[12][2] = "001";
AvatarConstants._oey_arr[13][2] = "001";
AvatarConstants._oey_arr[14][2] = "001";
AvatarConstants._oey_arr[15][2] = "001";
AvatarConstants._oey_arr[16][2] = "002";
AvatarConstants._oey_arr[17][2] = "002";
AvatarConstants._oey_arr[18][2] = "002";
AvatarConstants._oey_arr[19][2] = "002";
AvatarConstants._oey_arr[20][2] = "002";
AvatarConstants._oey_arr[21][2] = "002";
AvatarConstants._oey_arr[22][2] = "002";
AvatarConstants._oey_arr[23][2] = "002";
AvatarConstants._oey_arr[24][2] = "002";
AvatarConstants._oey_arr[25][2] = "002";
AvatarConstants._oey_arr[26][2] = "002";
AvatarConstants._oey_arr[27][2] = "002";
AvatarConstants._oey_arr[28][2] = "002";
AvatarConstants._oey_arr[29][2] = "002";
AvatarConstants._oey_arr[30][2] = "002";
AvatarConstants._oey_arr[31][2] = "002";
AvatarConstants._ofc_arr = new Array(32);
i = 0;
while(i < AvatarConstants._ofc_arr.length)
{
   AvatarConstants._ofc_arr[i] = new Array(3);
   i++;
}
AvatarConstants._ofc_arr[0][0] = "001";
AvatarConstants._ofc_arr[1][0] = "001";
AvatarConstants._ofc_arr[2][0] = "001";
AvatarConstants._ofc_arr[3][0] = "001";
AvatarConstants._ofc_arr[4][0] = "002";
AvatarConstants._ofc_arr[5][0] = "002";
AvatarConstants._ofc_arr[6][0] = "002";
AvatarConstants._ofc_arr[7][0] = "002";
AvatarConstants._ofc_arr[8][0] = "001";
AvatarConstants._ofc_arr[9][0] = "001";
AvatarConstants._ofc_arr[10][0] = "001";
AvatarConstants._ofc_arr[11][0] = "001";
AvatarConstants._ofc_arr[12][0] = "002";
AvatarConstants._ofc_arr[13][0] = "002";
AvatarConstants._ofc_arr[14][0] = "002";
AvatarConstants._ofc_arr[15][0] = "002";
AvatarConstants._ofc_arr[16][0] = "003";
AvatarConstants._ofc_arr[17][0] = "003";
AvatarConstants._ofc_arr[18][0] = "003";
AvatarConstants._ofc_arr[19][0] = "003";
AvatarConstants._ofc_arr[20][0] = "004";
AvatarConstants._ofc_arr[21][0] = "004";
AvatarConstants._ofc_arr[22][0] = "004";
AvatarConstants._ofc_arr[23][0] = "004";
AvatarConstants._ofc_arr[24][0] = "003";
AvatarConstants._ofc_arr[25][0] = "003";
AvatarConstants._ofc_arr[26][0] = "003";
AvatarConstants._ofc_arr[27][0] = "003";
AvatarConstants._ofc_arr[28][0] = "004";
AvatarConstants._ofc_arr[29][0] = "004";
AvatarConstants._ofc_arr[30][0] = "004";
AvatarConstants._ofc_arr[31][0] = "004";
AvatarConstants._ofc_arr[0][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[1][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[2][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[3][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[4][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[5][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[6][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[7][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[8][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[9][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[10][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[11][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[12][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[13][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[14][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[15][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[16][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[17][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[18][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[19][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[20][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[21][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[22][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[23][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[24][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[25][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[26][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[27][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[28][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[29][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[30][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[31][1] = AvatarConstants._acolors[4];
AvatarConstants._ofc_arr[0][2] = "001";
AvatarConstants._ofc_arr[1][2] = "001";
AvatarConstants._ofc_arr[2][2] = "001";
AvatarConstants._ofc_arr[3][2] = "001";
AvatarConstants._ofc_arr[4][2] = "001";
AvatarConstants._ofc_arr[5][2] = "001";
AvatarConstants._ofc_arr[6][2] = "001";
AvatarConstants._ofc_arr[7][2] = "001";
AvatarConstants._ofc_arr[8][2] = "001";
AvatarConstants._ofc_arr[9][2] = "001";
AvatarConstants._ofc_arr[10][2] = "001";
AvatarConstants._ofc_arr[11][2] = "001";
AvatarConstants._ofc_arr[12][2] = "001";
AvatarConstants._ofc_arr[13][2] = "001";
AvatarConstants._ofc_arr[14][2] = "001";
AvatarConstants._ofc_arr[15][2] = "001";
AvatarConstants._ofc_arr[16][2] = "002";
AvatarConstants._ofc_arr[17][2] = "002";
AvatarConstants._ofc_arr[18][2] = "002";
AvatarConstants._ofc_arr[19][2] = "002";
AvatarConstants._ofc_arr[20][2] = "002";
AvatarConstants._ofc_arr[21][2] = "002";
AvatarConstants._ofc_arr[22][2] = "002";
AvatarConstants._ofc_arr[23][2] = "002";
AvatarConstants._ofc_arr[24][2] = "002";
AvatarConstants._ofc_arr[25][2] = "002";
AvatarConstants._ofc_arr[26][2] = "002";
AvatarConstants._ofc_arr[27][2] = "002";
AvatarConstants._ofc_arr[28][2] = "002";
AvatarConstants._ofc_arr[29][2] = "002";
AvatarConstants._ofc_arr[30][2] = "002";
AvatarConstants._ofc_arr[31][2] = "002";
AvatarConstants._och_arr = new Array(25);
i = 0;
while(i < AvatarConstants._och_arr.length)
{
   AvatarConstants._och_arr[i] = new Array(3);
   i++;
}
AvatarConstants._och_arr[0][0] = "001";
AvatarConstants._och_arr[1][0] = "002";
AvatarConstants._och_arr[2][0] = "001";
AvatarConstants._och_arr[3][0] = "002";
AvatarConstants._och_arr[4][0] = "003";
AvatarConstants._och_arr[5][0] = "003";
AvatarConstants._och_arr[6][0] = "004";
AvatarConstants._och_arr[7][0] = "004";
AvatarConstants._och_arr[8][0] = "005";
AvatarConstants._och_arr[9][0] = "006";
AvatarConstants._och_arr[10][0] = "007";
AvatarConstants._och_arr[11][0] = "008";
AvatarConstants._och_arr[12][0] = "007";
AvatarConstants._och_arr[13][0] = "008";
AvatarConstants._och_arr[14][0] = "009";
AvatarConstants._och_arr[15][0] = "010";
AvatarConstants._och_arr[16][0] = "011";
AvatarConstants._och_arr[17][0] = "012";
AvatarConstants._och_arr[18][0] = "013";
AvatarConstants._och_arr[19][0] = "014";
AvatarConstants._och_arr[20][0] = "015";
AvatarConstants._och_arr[21][0] = "018";
AvatarConstants._och_arr[22][0] = "019";
AvatarConstants._och_arr[23][0] = "020";
AvatarConstants._och_arr[24][0] = "021";
AvatarConstants._och_arr[0][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[1][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[2][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[3][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[4][1] = AvatarConstants._acolors[6];
AvatarConstants._och_arr[5][1] = AvatarConstants._acolors[6];
AvatarConstants._och_arr[6][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[7][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[8][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[9][1] = AvatarConstants._acolors[6];
AvatarConstants._och_arr[10][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[11][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[12][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[13][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[14][1] = AvatarConstants._acolors[6];
AvatarConstants._och_arr[15][1] = AvatarConstants._acolors[6];
AvatarConstants._och_arr[16][1] = AvatarConstants._acolors[7];
AvatarConstants._och_arr[17][1] = AvatarConstants._acolors[7];
AvatarConstants._och_arr[18][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[19][1] = AvatarConstants._acolors[6];
AvatarConstants._och_arr[20][1] = AvatarConstants._acolors[14];
AvatarConstants._och_arr[21][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[22][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[23][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[24][1] = AvatarConstants._acolors[5];
AvatarConstants._och_arr[0][2] = "001";
AvatarConstants._och_arr[1][2] = "001";
AvatarConstants._och_arr[2][2] = "001";
AvatarConstants._och_arr[3][2] = "001";
AvatarConstants._och_arr[4][2] = "001";
AvatarConstants._och_arr[5][2] = "001";
AvatarConstants._och_arr[6][2] = "001";
AvatarConstants._och_arr[7][2] = "001";
AvatarConstants._och_arr[8][2] = "001";
AvatarConstants._och_arr[9][2] = "001";
AvatarConstants._och_arr[10][2] = "002";
AvatarConstants._och_arr[11][2] = "#";
AvatarConstants._och_arr[12][2] = "002";
AvatarConstants._och_arr[13][2] = "#";
AvatarConstants._och_arr[14][2] = "002";
AvatarConstants._och_arr[15][2] = "#";
AvatarConstants._och_arr[16][2] = "002";
AvatarConstants._och_arr[17][2] = "#";
AvatarConstants._och_arr[18][2] = "002";
AvatarConstants._och_arr[19][2] = "002";
AvatarConstants._och_arr[20][2] = "001";
AvatarConstants._och_arr[21][2] = "001";
AvatarConstants._och_arr[22][2] = "002";
AvatarConstants._och_arr[23][2] = "001";
AvatarConstants._och_arr[24][2] = "002";
AvatarConstants._ols_arr = new Array(25);
i = 0;
while(i < AvatarConstants._ols_arr.length)
{
   AvatarConstants._ols_arr[i] = new Array(3);
   i++;
}
AvatarConstants._ols_arr[0][0] = "002";
AvatarConstants._ols_arr[1][0] = "002";
AvatarConstants._ols_arr[2][0] = "001";
AvatarConstants._ols_arr[3][0] = "001";
AvatarConstants._ols_arr[4][0] = "002";
AvatarConstants._ols_arr[5][0] = "001";
AvatarConstants._ols_arr[6][0] = "002";
AvatarConstants._ols_arr[7][0] = "001";
AvatarConstants._ols_arr[8][0] = "001";
AvatarConstants._ols_arr[9][0] = "001";
AvatarConstants._ols_arr[10][0] = "002";
AvatarConstants._ols_arr[11][0] = "002";
AvatarConstants._ols_arr[12][0] = "001";
AvatarConstants._ols_arr[13][0] = "001";
AvatarConstants._ols_arr[14][0] = "001";
AvatarConstants._ols_arr[15][0] = "001";
AvatarConstants._ols_arr[16][0] = "000";
AvatarConstants._ols_arr[17][0] = "000";
AvatarConstants._ols_arr[18][0] = "001";
AvatarConstants._ols_arr[19][0] = "001";
AvatarConstants._ols_arr[20][0] = "003";
AvatarConstants._ols_arr[21][0] = "004";
AvatarConstants._ols_arr[22][0] = "005";
AvatarConstants._ols_arr[23][0] = "006";
AvatarConstants._ols_arr[24][0] = "000";
AvatarConstants._ols_arr[0][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[1][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[2][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[3][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[4][1] = AvatarConstants._acolors[6];
AvatarConstants._ols_arr[5][1] = AvatarConstants._acolors[6];
AvatarConstants._ols_arr[6][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[7][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[8][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[9][1] = AvatarConstants._acolors[6];
AvatarConstants._ols_arr[10][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[11][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[12][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[13][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[14][1] = AvatarConstants._acolors[6];
AvatarConstants._ols_arr[15][1] = AvatarConstants._acolors[6];
AvatarConstants._ols_arr[16][1] = AvatarConstants._acolors[0];
AvatarConstants._ols_arr[17][1] = AvatarConstants._acolors[0];
AvatarConstants._ols_arr[18][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[19][1] = AvatarConstants._acolors[6];
AvatarConstants._ols_arr[20][1] = AvatarConstants._acolors[14];
AvatarConstants._ols_arr[21][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[22][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[23][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[24][1] = AvatarConstants._acolors[5];
AvatarConstants._ols_arr[0][2] = "001";
AvatarConstants._ols_arr[1][2] = "001";
AvatarConstants._ols_arr[2][2] = "001";
AvatarConstants._ols_arr[3][2] = "001";
AvatarConstants._ols_arr[4][2] = "001";
AvatarConstants._ols_arr[5][2] = "001";
AvatarConstants._ols_arr[6][2] = "001";
AvatarConstants._ols_arr[7][2] = "001";
AvatarConstants._ols_arr[8][2] = "001";
AvatarConstants._ols_arr[9][2] = "001";
AvatarConstants._ols_arr[10][2] = "002";
AvatarConstants._ols_arr[11][2] = "002";
AvatarConstants._ols_arr[12][2] = "002";
AvatarConstants._ols_arr[13][2] = "002";
AvatarConstants._ols_arr[14][2] = "002";
AvatarConstants._ols_arr[15][2] = "002";
AvatarConstants._ols_arr[16][2] = "002";
AvatarConstants._ols_arr[17][2] = "002";
AvatarConstants._ols_arr[18][2] = "002";
AvatarConstants._ols_arr[19][2] = "002";
AvatarConstants._ols_arr[20][2] = "001";
AvatarConstants._ols_arr[21][2] = "001";
AvatarConstants._ols_arr[22][2] = "002";
AvatarConstants._ols_arr[23][2] = "001";
AvatarConstants._ols_arr[24][2] = "002";
AvatarConstants._ors_arr = new Array(25);
i = 0;
while(i < AvatarConstants._ors_arr.length)
{
   AvatarConstants._ors_arr[i] = new Array(3);
   i++;
}
AvatarConstants._ors_arr[0][0] = "002";
AvatarConstants._ors_arr[1][0] = "002";
AvatarConstants._ors_arr[2][0] = "001";
AvatarConstants._ors_arr[3][0] = "001";
AvatarConstants._ors_arr[4][0] = "002";
AvatarConstants._ors_arr[5][0] = "001";
AvatarConstants._ors_arr[6][0] = "002";
AvatarConstants._ors_arr[7][0] = "001";
AvatarConstants._ors_arr[8][0] = "001";
AvatarConstants._ors_arr[9][0] = "001";
AvatarConstants._ors_arr[10][0] = "002";
AvatarConstants._ors_arr[11][0] = "002";
AvatarConstants._ors_arr[12][0] = "001";
AvatarConstants._ors_arr[13][0] = "001";
AvatarConstants._ors_arr[14][0] = "001";
AvatarConstants._ors_arr[15][0] = "001";
AvatarConstants._ors_arr[16][0] = "000";
AvatarConstants._ors_arr[17][0] = "000";
AvatarConstants._ors_arr[18][0] = "001";
AvatarConstants._ors_arr[19][0] = "001";
AvatarConstants._ors_arr[20][0] = "003";
AvatarConstants._ors_arr[21][0] = "004";
AvatarConstants._ors_arr[22][0] = "005";
AvatarConstants._ors_arr[23][0] = "006";
AvatarConstants._ors_arr[24][0] = "000";
AvatarConstants._ors_arr[0][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[1][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[2][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[3][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[4][1] = AvatarConstants._acolors[6];
AvatarConstants._ors_arr[5][1] = AvatarConstants._acolors[6];
AvatarConstants._ors_arr[6][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[7][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[8][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[9][1] = AvatarConstants._acolors[6];
AvatarConstants._ors_arr[10][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[11][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[12][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[13][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[14][1] = AvatarConstants._acolors[6];
AvatarConstants._ors_arr[15][1] = AvatarConstants._acolors[6];
AvatarConstants._ors_arr[16][1] = AvatarConstants._acolors[1];
AvatarConstants._ors_arr[17][1] = AvatarConstants._acolors[1];
AvatarConstants._ors_arr[18][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[19][1] = AvatarConstants._acolors[6];
AvatarConstants._ors_arr[20][1] = AvatarConstants._acolors[14];
AvatarConstants._ors_arr[21][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[22][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[23][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[24][1] = AvatarConstants._acolors[5];
AvatarConstants._ors_arr[0][2] = "001";
AvatarConstants._ors_arr[1][2] = "001";
AvatarConstants._ors_arr[2][2] = "001";
AvatarConstants._ors_arr[3][2] = "001";
AvatarConstants._ors_arr[4][2] = "001";
AvatarConstants._ors_arr[5][2] = "001";
AvatarConstants._ors_arr[6][2] = "001";
AvatarConstants._ors_arr[7][2] = "001";
AvatarConstants._ors_arr[8][2] = "001";
AvatarConstants._ors_arr[9][2] = "001";
AvatarConstants._ors_arr[10][2] = "002";
AvatarConstants._ors_arr[11][2] = "002";
AvatarConstants._ors_arr[12][2] = "002";
AvatarConstants._ors_arr[13][2] = "002";
AvatarConstants._ors_arr[14][2] = "002";
AvatarConstants._ors_arr[15][2] = "002";
AvatarConstants._ors_arr[16][2] = "002";
AvatarConstants._ors_arr[17][2] = "002";
AvatarConstants._ors_arr[18][2] = "002";
AvatarConstants._ors_arr[19][2] = "002";
AvatarConstants._ors_arr[20][2] = "001";
AvatarConstants._ors_arr[21][2] = "001";
AvatarConstants._ors_arr[22][2] = "002";
AvatarConstants._ors_arr[23][2] = "001";
AvatarConstants._ors_arr[24][2] = "002";
AvatarConstants._olg_arr = new Array(10);
i = 0;
while(i < AvatarConstants._olg_arr.length)
{
   AvatarConstants._olg_arr[i] = new Array(3);
   i++;
}
AvatarConstants._olg_arr[0][0] = "001";
AvatarConstants._olg_arr[1][0] = "002";
AvatarConstants._olg_arr[2][0] = "003";
AvatarConstants._olg_arr[3][0] = "004";
AvatarConstants._olg_arr[4][0] = "005";
AvatarConstants._olg_arr[5][0] = "006";
AvatarConstants._olg_arr[6][0] = "007";
AvatarConstants._olg_arr[7][0] = "008";
AvatarConstants._olg_arr[8][0] = "009";
AvatarConstants._olg_arr[9][0] = "010";
AvatarConstants._olg_arr[0][1] = AvatarConstants._acolors[8];
AvatarConstants._olg_arr[1][1] = AvatarConstants._acolors[8];
AvatarConstants._olg_arr[2][1] = AvatarConstants._acolors[8];
AvatarConstants._olg_arr[3][1] = AvatarConstants._acolors[10];
AvatarConstants._olg_arr[4][1] = AvatarConstants._acolors[10];
AvatarConstants._olg_arr[5][1] = AvatarConstants._acolors[10];
AvatarConstants._olg_arr[6][1] = AvatarConstants._acolors[8];
AvatarConstants._olg_arr[7][1] = AvatarConstants._acolors[9];
AvatarConstants._olg_arr[8][1] = AvatarConstants._acolors[8];
AvatarConstants._olg_arr[9][1] = AvatarConstants._acolors[8];
AvatarConstants._olg_arr[0][2] = "001";
AvatarConstants._olg_arr[1][2] = "001";
AvatarConstants._olg_arr[2][2] = "001";
AvatarConstants._olg_arr[3][2] = "002";
AvatarConstants._olg_arr[4][2] = "002";
AvatarConstants._olg_arr[5][2] = "002";
AvatarConstants._olg_arr[6][2] = "*";
AvatarConstants._olg_arr[7][2] = "*";
AvatarConstants._olg_arr[8][2] = "*";
AvatarConstants._olg_arr[9][2] = "001";
AvatarConstants._osh_arr = new Array(8);
i = 0;
while(i < AvatarConstants._osh_arr.length)
{
   AvatarConstants._osh_arr[i] = new Array(2);
   i++;
}
AvatarConstants._osh_arr[0][0] = "001";
AvatarConstants._osh_arr[1][0] = "002";
AvatarConstants._osh_arr[2][0] = "003";
AvatarConstants._osh_arr[3][0] = "004";
AvatarConstants._osh_arr[4][0] = "005";
AvatarConstants._osh_arr[5][0] = "006";
AvatarConstants._osh_arr[6][0] = "008";
AvatarConstants._osh_arr[7][0] = "009";
AvatarConstants._osh_arr[0][1] = AvatarConstants._acolors[11];
AvatarConstants._osh_arr[1][1] = AvatarConstants._acolors[12];
AvatarConstants._osh_arr[2][1] = AvatarConstants._acolors[11];
AvatarConstants._osh_arr[3][1] = AvatarConstants._acolors[11];
AvatarConstants._osh_arr[4][1] = AvatarConstants._acolors[12];
AvatarConstants._osh_arr[5][1] = AvatarConstants._acolors[11];
AvatarConstants._osh_arr[6][1] = AvatarConstants._acolors[11];
AvatarConstants._osh_arr[7][1] = AvatarConstants._acolors[0];
AvatarConstants._osh_arr[0][2] = "001";
AvatarConstants._osh_arr[1][2] = "001";
AvatarConstants._osh_arr[2][2] = "002";
AvatarConstants._osh_arr[3][2] = "002";
AvatarConstants._osh_arr[4][2] = "*";
AvatarConstants._osh_arr[5][2] = "*";
AvatarConstants._osh_arr[6][2] = "001";
AvatarConstants._osh_arr[7][2] = "*";
AvatarEngine.prototype.reset = function()
{
   var _loc1_ = this;
   _loc1_.debug("reset " + arguments);
   _loc1_.isBadge = false;
   _loc1_.isGame = true;
   _loc1_.isConf = false;
   _loc1_.bReady = false;
   _loc1_._sAvatar_string = sAttributes;
   _loc1_._sAvatar_mission = sMission;
   _loc1_._sAvatar_gender = sGender;
   _loc1_.mcavatar = mcavatar;
   _loc1_._spos = "std";
   _loc1_._sposant = "std";
   _loc1_.shmask = shmask;
   _loc1_.hrmask = hrmask;
   _loc1_.chmask = chmask;
   _loc1_.fcmask = fcmask;
   _loc1_._mcRoot = mcRoot;
   _loc1_.initFunctions(_loc1_);
   _loc1_.init();
};
AvatarEngine.prototype.init = function()
{
   var _loc1_ = this;
   _loc1_.debug("init " + arguments);
   _loc1_._ifakedir = 2;
   _loc1_.flip = false;
   if(_loc1_._mcRoot._parent.bVector != true)
   {
      _loc1_._idir = 2;
   }
   else
   {
      _loc1_._idir = 3;
   }
   if(_loc1_._sAvatar_string == null || _loc1_._sAvatar_string == "")
   {
      _loc1_.init_default();
      tra;
   }
   else
   {
      _loc1_.decode();
   }
   _loc1_._bexep = false;
   _loc1_.aDirectionOrder = new Array();
   _loc1_.aDirectionOrder[0] = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12);
   _loc1_.aDirectionOrder[1] = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12);
   _loc1_.aDirectionOrder[2] = new Array(1,2,3,0,4,5,6,7,8,9,10,11,12);
   _loc1_.aDirectionOrder[3] = new Array(0,1,2,4,5,3,6,7,8,9,10,11,12);
   _loc1_.aDirectionOrder[4] = new Array(1,2,3,0,4,5,6,7,8,9,10,11,12);
   _loc1_.aDirectionOrder[5] = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12);
   _loc1_.aDirectionOrder[6] = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12);
   _loc1_.aDirectionOrder[7] = new Array(0,1,2,3,4,5,6,7,8,9,10,11,12);
   _loc1_.order(_loc1_._idir);
   _loc1_._awalk_body = new Array(["wlk",0],["wlk",1],["wlk",2],["wlk",3]);
   _loc1_._awalk_legs = new Array(["wlk",0],["wlk",1],["wlk",2],["wlk",3]);
   _loc1_._awalk_shoes = new Array(["wlk",0],["wlk",1],["wlk",2],["wlk",3]);
   _loc1_._awalk_armsr = new Array(["wlk",1],["std",0],["wlk",3],["std",0]);
   _loc1_._awalk_shouldersr = new Array(["wlk",1],["std",0],["wlk",3],["std",0]);
   _loc1_._awalk_armsl = new Array(["wlk",1],["std",0],["wlk",3],["std",0]);
   _loc1_._awalk_shouldersl = new Array(["wlk",1],["std",0],["wlk",3],["std",0]);
   _loc1_._adance_body = new Array(["std",0],["wlk",0],["std",0],["wlk",2]);
   _loc1_._adance_legs = new Array(["std",0],["wlk",0],["std",0],["wlk",2]);
   _loc1_._adance_shoes = new Array(["std",0],["wlk",0],["std",0],["wlk",2]);
   _loc1_._adance_armsl = new Array(["wlk",1],["std",0],["wlk",1],["crr",0]);
   _loc1_._adance_shouldersl = new Array(["wlk",1],["std",0],["wlk",1],["crr",0]);
   _loc1_._adance_armsr = new Array(["wlk",3],["crr",0],["wlk",3],["std",0]);
   _loc1_._adance_shouldersr = new Array(["wlk",3],["crr",0],["wlk",3],["std",0]);
   _loc1_._adance_chest = new Array(["tlk",0],["tlk",1],["wlk",3],["std",0]);
   _loc1_._adrink_armsr = new Array(["drk",0],["crr",0]);
   _loc1_._adrink_bottle = new Array(["drk",0],["crr",0]);
   _loc1_._atalk_hd = new Array(["std",0],["spk",0]);
   _loc1_._atalk_fc = new Array(["std",0],["spk",0]);
   _loc1_._atalk_hr = new Array(["std",0],["spk",0]);
   _loc1_._temp = 0;
   _loc1_._walkstep = 0;
   _loc1_._dancestep = 0;
   _loc1_.bReady = true;
   _loc1_.bd_index = _loc1_.aDirectionOrder[_loc1_._idir][0];
   _loc1_.sh_index = _loc1_.aDirectionOrder[_loc1_._idir][1];
   _loc1_.lg_index = _loc1_.aDirectionOrder[_loc1_._idir][2];
   _loc1_.lh_index = _loc1_.aDirectionOrder[_loc1_._idir][3];
   _loc1_.ls_index = _loc1_.aDirectionOrder[_loc1_._idir][4];
   _loc1_.ch_index = _loc1_.aDirectionOrder[_loc1_._idir][5];
   _loc1_.hd_index = _loc1_.aDirectionOrder[_loc1_._idir][6];
   _loc1_.fc_index = _loc1_.aDirectionOrder[_loc1_._idir][7];
   _loc1_.bottle_index = _loc1_.aDirectionOrder[_loc1_._idir][8];
   _loc1_.rh_index = _loc1_.aDirectionOrder[_loc1_._idir][9];
   _loc1_.rs_index = _loc1_.aDirectionOrder[_loc1_._idir][10];
   _loc1_.ey_index = _loc1_.aDirectionOrder[_loc1_._idir][11];
   _loc1_.hr_index = _loc1_.aDirectionOrder[_loc1_._idir][12];
   _loc1_.config = new Array();
   _loc1_.config[_loc1_.bd_index] = new Array("bd",true,"std","_bd_" + _loc1_.bd[0] + "_",_loc1_.bd[1],0);
   _loc1_.config[_loc1_.sh_index] = new Array("sh",true,"std","_sh_" + _loc1_.sh[0] + "_",_loc1_.sh[1],0);
   _loc1_.config[_loc1_.lg_index] = new Array("lg",true,"std","_lg_" + _loc1_.lg[0] + "_",_loc1_.lg[1],0);
   _loc1_.config[_loc1_.hd_index] = new Array("hd",true,"std","_hd_" + _loc1_.hd[0] + "_",_loc1_.hd[1],0);
   _loc1_.config[_loc1_.fc_index] = new Array("fc",true,"std","_fc_" + _loc1_.fc[0] + "_",_loc1_.fc[1],0);
   _loc1_.config[_loc1_.ey_index] = new Array("ey",true,"std","_ey_" + _loc1_.ey[0] + "_",_loc1_.ey[1],0);
   _loc1_.config[_loc1_.hr_index] = new Array("hr",true,"std","_hr_" + _loc1_.hr[0] + "_",_loc1_.hr[1],0);
   _loc1_.config[_loc1_.bottle_index] = new Array("ri",true,"std","_ri_" + _loc1_.lh[0] + "_",_loc1_.lh[1],0);
   _loc1_.config[_loc1_.lh_index] = new Array("lh",true,"std","_lh_" + _loc1_.lh[0] + "_",_loc1_.lh[1],0);
   _loc1_.config[_loc1_.ls_index] = new Array("ls",true,"std","_ls_" + _loc1_.ls[0] + "_",_loc1_.ls[1],0);
   _loc1_.config[_loc1_.ch_index] = new Array("ch",true,"std","_ch_" + _loc1_.ch[0] + "_",_loc1_.ch[1],0);
   _loc1_.config[_loc1_.rh_index] = new Array("rh",true,"std","_rh_" + _loc1_.rh[0] + "_",_loc1_.rh[1],0);
   _loc1_.config[_loc1_.rs_index] = new Array("rs",true,"std","_rs_" + _loc1_.rs[0] + "_",_loc1_.rs[1],0);
   _loc1_.checkBadgeFunc();
   _loc1_.checkConfFunc();
};
AvatarEngine.prototype.checkBadgeFunc = function()
{
   var _loc1_ = this;
   _loc1_.debug("checkBadgeFunc " + arguments);
   if(_loc1_._mcRoot._parent.isBadge)
   {
      _loc1_.tini = getTimer();
      if(_loc1_._mcRoot._parent.signin != 1)
      {
         _loc1_._mcRoot.avatar_str = _loc1_._mcRoot._parent.avatar_str;
         _loc1_.randomizeme();
      }
      else
      {
         _loc1_._sAvatar_string = _loc1_._mcRoot._parent.avatar_str;
         _loc1_.decode();
         _loc1_.order(_loc1_._idir);
         _loc1_.draw();
      }
      _loc1_._mcRoot._xscale = -200;
      _loc1_._mcRoot._yscale = 200;
      _loc1_.isBadge = true;
      _loc1_._mcRoot._parent.load._visible = false;
   }
};
AvatarEngine.prototype.checkConfFunc = function()
{
   var _loc1_ = this;
   _loc1_.debug("checkConfFunc " + arguments);
   if(_loc1_._mcRoot._parent.isConf)
   {
      _loc1_._mcRoot._xscale = 200;
      _loc1_._mcRoot._yscale = 200;
      _loc1_.isConf = true;
      var _loc2_ = new Object();
      _loc2_.x = _loc1_._mcroot._parent.mc_hr.loader._x;
      _loc2_.y = _loc1_._mcroot._parent.mc_hr.loader._y;
      _loc1_._mcroot._parent.mc_hr.localToGlobal(_loc2_);
      _loc1_._mcroot.globalToLocal(_loc2_);
      if(_loc1_._mcRoot._parent.bVector != true)
      {
         _loc1_._mcroot.mc_hr._x = _loc2_.x;
         _loc1_._mcroot.mc_hr._y = _loc2_.y;
         _loc1_._mcroot.mc_hr._xscale = 50;
         _loc1_._mcroot.mc_hr._yscale = 50;
      }
      else
      {
         _loc1_._mcroot.mc_hr._xscale = 30;
         _loc1_._mcroot.mc_hr._yscale = 30;
      }
      _loc2_.x = _loc1_._mcroot._parent.mc_hd.loader._x;
      _loc2_.y = _loc1_._mcroot._parent.mc_hd.loader._y;
      _loc1_._mcroot._parent.mc_hd.localToGlobal(_loc2_);
      _loc1_._mcroot.globalToLocal(_loc2_);
      if(_loc1_._mcRoot._parent.bVector != true)
      {
         _loc1_._mcroot.mc_hd._x = _loc2_.x;
         _loc1_._mcroot.mc_hd._y = _loc2_.y;
         _loc1_._mcroot.mc_hd._xscale = 50;
         _loc1_._mcroot.mc_hd._yscale = 50;
      }
      else
      {
         _loc1_._mcroot.mc_hd._xscale = 30;
         _loc1_._mcroot.mc_hd._yscale = 30;
      }
      _loc2_.x = _loc1_._mcroot._parent.mc_ch.loader._x;
      _loc2_.y = _loc1_._mcroot._parent.mc_ch.loader._y;
      _loc1_._mcroot._parent.mc_ch.localToGlobal(_loc2_);
      _loc1_._mcroot.globalToLocal(_loc2_);
      if(_loc1_._mcRoot._parent.bVector != true)
      {
         _loc1_._mcroot.mc_ch._x = _loc2_.x;
         _loc1_._mcroot.mc_ch._y = _loc2_.y;
         _loc1_._mcroot.mc_ch._xscale = 50;
         _loc1_._mcroot.mc_ch._yscale = 50;
      }
      else
      {
         _loc1_._mcroot.mc_ch._xscale = 30;
         _loc1_._mcroot.mc_ch._yscale = 30;
      }
      _loc2_.x = _loc1_._mcroot._parent.mc_lg.loader._x;
      _loc2_.y = _loc1_._mcroot._parent.mc_lg.loader._y;
      _loc1_._mcroot._parent.mc_lg.localToGlobal(_loc2_);
      _loc1_._mcroot.globalToLocal(_loc2_);
      if(_loc1_._mcRoot._parent.bVector != true)
      {
         _loc1_._mcroot.mc_lg._x = _loc2_.x;
         _loc1_._mcroot.mc_lg._y = _loc2_.y;
         _loc1_._mcroot.mc_lg._xscale = 50;
         _loc1_._mcroot.mc_lg._yscale = 50;
      }
      else
      {
         _loc1_._mcroot.mc_lg._xscale = 16;
         _loc1_._mcroot.mc_lg._yscale = 16;
      }
      _loc2_.x = _loc1_._mcroot._parent.mc_sh.loader._x;
      _loc2_.y = _loc1_._mcroot._parent.mc_sh.loader._y;
      _loc1_._mcroot._parent.mc_sh.localToGlobal(_loc2_);
      _loc1_._mcroot.globalToLocal(_loc2_);
      if(_loc1_._mcRoot._parent.bVector != true)
      {
         _loc1_._mcroot.mc_sh._x = _loc2_.x;
         _loc1_._mcroot.mc_sh._y = _loc2_.y;
         _loc1_._mcroot.mc_sh._xscale = 50;
         _loc1_._mcroot.mc_sh._yscale = 50;
      }
      else
      {
         _loc1_._mcroot.mc_sh._xscale = 20;
         _loc1_._mcroot.mc_sh._yscale = 20;
      }
   }
};
AvatarEngine.prototype.draw = function()
{
   var _loc1_ = this;
   _loc1_.debug("draw " + arguments);
   var _loc3_ = "";
   if(_loc1_._mcRoot._parent.bVector == true)
   {
      if(_loc1_._sAvatar_gender == "F")
      {
         _loc3_ = "_002";
      }
      else
      {
         _loc3_ = "_001";
      }
   }
   if(_loc1_.isConf)
   {
      _loc1_.initIndex();
      var _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][12];
      _loc1_._mcroot.mc_hr.attachMovie("center",_loc1_.config[_loc2_][0],_loc2_);
      _loc1_._mcroot.mc_hr.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][6];
      _loc1_._mcroot.mc_hd.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][7];
      _loc1_._mcroot.mc_hd.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][11];
      _loc1_._mcroot.mc_hd.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][4];
      _loc1_._mcroot.mc_ch.attachMovie("center",_loc1_.config[_loc2_][0],_loc2_);
      _loc1_._mcroot.mc_ch.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][5];
      _loc1_._mcroot.mc_ch.attachMovie("center",_loc1_.config[_loc2_][0],_loc2_);
      _loc1_._mcroot.mc_ch.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][10];
      _loc1_._mcroot.mc_ch.attachMovie("center",_loc1_.config[_loc2_][0],_loc2_);
      _loc1_._mcroot.mc_ch.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][2];
      _loc1_._mcroot.mc_lg.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc2_ = _loc1_.aDirectionOrder[_loc1_._idir][1];
      _loc1_._mcroot.mc_sh.attachMovie("h_" + _loc1_.config[1][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_);
      _loc1_.trans(_loc1_.hr[1],"hr_col",_loc1_._mcroot._parent.hr_col.colo);
      _loc1_.trans(_loc1_.hd[1],"hd_col",_loc1_._mcroot._parent.hd_col.colo);
      _loc1_.trans(_loc1_.ch[1],"ch_col",_loc1_._mcroot._parent.ch_col.colo);
      _loc1_.trans(_loc1_.lg[1],"lg_col",_loc1_._mcroot._parent.lg_col.colo);
      _loc1_.trans(_loc1_.sh[1],"sh_col",_loc1_._mcroot._parent.sh_col.colo);
   }
   _loc2_ = 0;
   while(_loc2_ < _loc1_.config.length)
   {
      if(_loc1_.config[_loc2_][1] == true)
      {
         _loc1_.mcavatar.attachMovie("center",_loc1_.config[_loc2_][0],_loc2_ + 1);
         _loc1_.mcavatar.attachMovie("h_" + _loc1_.config[_loc2_][2] + _loc1_.config[_loc2_][3] + _loc1_._idir + "_" + _loc1_.config[_loc2_][5] + _loc3_,_loc1_.config[_loc2_][0],_loc2_ + 1);
         _loc1_.trans(_loc1_.config[_loc2_][4],_loc1_.config[_loc2_][0] + "_co",_loc1_.mcavatar[_loc1_.config[_loc2_][0]]);
         _loc1_.config[_loc2_][1] = false;
         _loc1_.mcavatar[_loc1_.config[_loc2_][0]].setMask(_loc1_._mcRoot["mask" + _loc1_.config[_loc2_][0]]);
      }
      _loc2_ = _loc2_ + 1;
   }
   if(!_loc1_._mcRoot._parent.bVector)
   {
      if(_loc1_.flip)
      {
         _loc1_.mcavatar._xscale = 100;
      }
      else
      {
         _loc1_.mcavatar._xscale = -100;
      }
   }
};
AvatarEngine.prototype.depth = function(dir)
{
   var _loc1_ = this;
   var _loc2_ = dir;
   _loc1_.debug("depth " + arguments);
   _loc1_.bd_index = _loc1_.aDirectionOrder[_loc2_][0];
   _loc1_.sh_index = _loc1_.aDirectionOrder[_loc2_][1];
   _loc1_.lg_index = _loc1_.aDirectionOrder[_loc2_][2];
   _loc1_.lh_index = _loc1_.aDirectionOrder[_loc2_][3];
   _loc1_.ls_index = _loc1_.aDirectionOrder[_loc2_][4];
   _loc1_.ch_index = _loc1_.aDirectionOrder[_loc2_][5];
   _loc1_.hd_index = _loc1_.aDirectionOrder[_loc2_][6];
   _loc1_.fc_index = _loc1_.aDirectionOrder[_loc2_][7];
   _loc1_.bottle_index = _loc1_.aDirectionOrder[_loc2_][8];
   _loc1_.rh_index = _loc1_.aDirectionOrder[_loc2_][9];
   _loc1_.rs_index = _loc1_.aDirectionOrder[_loc2_][10];
   _loc1_.ey_index = _loc1_.aDirectionOrder[_loc2_][11];
   _loc1_.hr_index = _loc1_.aDirectionOrder[_loc2_][12];
};
AvatarEngine.prototype.order = function(dir)
{
   var _loc1_ = this;
   _loc1_.debug("order " + arguments);
   _loc1_.config[_loc1_.bd_index] = new Array("bd",true,"std","_bd_" + _loc1_.bd[0] + "_",_loc1_.bd[1],0);
   _loc1_.config[_loc1_.sh_index] = new Array("sh",true,"std","_sh_" + _loc1_.sh[0] + "_",_loc1_.sh[1],0);
   _loc1_.config[_loc1_.lg_index] = new Array("lg",true,"std","_lg_" + _loc1_.lg[0] + "_",_loc1_.lg[1],0);
   _loc1_.config[_loc1_.hd_index] = new Array("hd",true,"std","_hd_" + _loc1_.hd[0] + "_",_loc1_.hd[1],0);
   _loc1_.config[_loc1_.fc_index] = new Array("fc",true,"std","_fc_" + _loc1_.fc[0] + "_",_loc1_.fc[1],0);
   _loc1_.config[_loc1_.ey_index] = new Array("ey",true,"std","_ey_" + _loc1_.ey[0] + "_",_loc1_.ey[1],0);
   _loc1_.config[_loc1_.hr_index] = new Array("hr",true,"std","_hr_" + _loc1_.hr[0] + "_",_loc1_.hr[1],0);
   _loc1_.config[_loc1_.bottle_index] = new Array("ri",true,"std","_ri_" + _loc1_.lh[0] + "_",_loc1_.lh[1],0);
   _loc1_.config[_loc1_.lh_index] = new Array("lh",true,"std","_lh_" + _loc1_.lh[0] + "_",_loc1_.lh[1],0);
   _loc1_.config[_loc1_.ls_index] = new Array("ls",true,"std","_ls_" + _loc1_.ls[0] + "_",_loc1_.ls[1],0);
   _loc1_.config[_loc1_.ch_index] = new Array("ch",true,"std","_ch_" + _loc1_.ch[0] + "_",_loc1_.ch[1],0);
   _loc1_.config[_loc1_.rh_index] = new Array("rh",true,"std","_rh_" + _loc1_.rh[0] + "_",_loc1_.rh[1],0);
   _loc1_.config[_loc1_.rs_index] = new Array("rs",true,"std","_rs_" + _loc1_.rs[0] + "_",_loc1_.rs[1],0);
};
AvatarEngine.prototype.anim = function()
{
   var _loc1_ = this;
   _loc1_.debug("anim " + arguments);
   if(_loc1_._spos == "wlk")
   {
      var _loc3_ = 2;
      if(_loc1_._temp == _loc3_)
      {
         _loc1_._walkstep = _loc1_._walkstep + 1;
         _loc1_.config[_loc1_.bd_index][1] = true;
         _loc1_.config[_loc1_.lg_index][1] = true;
         _loc1_.config[_loc1_.sh_index][1] = true;
         _loc1_.config[_loc1_.lh_index][1] = true;
         _loc1_.config[_loc1_.rh_index][1] = true;
         _loc1_.config[_loc1_.ls_index][1] = true;
         _loc1_.config[_loc1_.rs_index][1] = true;
         _loc1_.config[_loc1_.bd_index][2] = _loc1_._awalk_body[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.lg_index][2] = _loc1_._awalk_legs[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.sh_index][2] = _loc1_._awalk_shoes[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.lh_index][2] = _loc1_._awalk_armsr[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.rh_index][2] = _loc1_._awalk_armsl[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.ls_index][2] = _loc1_._awalk_shouldersr[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.rs_index][2] = _loc1_._awalk_shouldersl[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.bd_index][5] = _loc1_._awalk_body[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.lg_index][5] = _loc1_._awalk_legs[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.sh_index][5] = _loc1_._awalk_shoes[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.lh_index][5] = _loc1_._awalk_armsr[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.rh_index][5] = _loc1_._awalk_armsl[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.ls_index][5] = _loc1_._awalk_shouldersr[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.rs_index][5] = _loc1_._awalk_shouldersl[_loc1_._walkstep % 4][1];
         _loc1_._temp = 0;
         _loc1_.draw();
      }
      _loc1_._temp = _loc1_._temp + 1;
   }
   else if(_loc1_._spos == "dnc")
   {
      _loc3_ = 12;
      var _loc2_ = 2;
      if(_loc1_._temp % 3 == _loc2_)
      {
         _loc1_.config[_loc1_.bd_index][1] = true;
         _loc1_.config[_loc1_.lg_index][1] = true;
         _loc1_.config[_loc1_.sh_index][1] = true;
         _loc1_.config[_loc1_.bd_index][2] = _loc1_._adance_body[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.lg_index][2] = _loc1_._adance_legs[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.sh_index][2] = _loc1_._adance_shoes[_loc1_._walkstep % 4][0];
         _loc1_.config[_loc1_.bd_index][5] = _loc1_._adance_body[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.lg_index][5] = _loc1_._adance_legs[_loc1_._walkstep % 4][1];
         _loc1_.config[_loc1_.sh_index][5] = _loc1_._adance_shoes[_loc1_._walkstep % 4][1];
         _loc1_._walkstep = _loc1_._walkstep + 1;
         _loc1_.draw();
      }
      if(_loc1_._temp % 12 == 0 || _loc1_._temp % 12 == 2 || _loc1_._temp % 12 == 6 || _loc1_._temp % 12 == 8)
      {
         _loc1_.config[_loc1_.lh_index][1] = true;
         _loc1_.config[_loc1_.rh_index][1] = true;
         _loc1_.config[_loc1_.ls_index][1] = true;
         _loc1_.config[_loc1_.rs_index][1] = true;
         _loc1_.config[_loc1_.lh_index][2] = _loc1_._adance_armsr[_loc1_._dancestep % 4][0];
         _loc1_.config[_loc1_.rh_index][2] = _loc1_._adance_armsl[_loc1_._dancestep % 4][0];
         _loc1_.config[_loc1_.ls_index][2] = _loc1_._adance_shouldersr[_loc1_._dancestep % 4][0];
         _loc1_.config[_loc1_.rs_index][2] = _loc1_._adance_shouldersl[_loc1_._dancestep % 4][0];
         _loc1_.config[_loc1_.rh_index][5] = _loc1_._adance_armsr[_loc1_._dancestep % 4][1];
         _loc1_.config[_loc1_.lh_index][5] = _loc1_._adance_armsl[_loc1_._dancestep % 4][1];
         _loc1_.config[_loc1_.rs_index][5] = _loc1_._adance_shouldersr[_loc1_._dancestep % 4][1];
         _loc1_.config[_loc1_.ls_index][5] = _loc1_._adance_shouldersl[_loc1_._dancestep % 4][1];
         _loc1_._dancestep = _loc1_._dancestep + 1;
         _loc1_.draw();
      }
      _loc1_._temp = _loc1_._temp + 1;
   }
   else if(_loc1_._spos == "drk")
   {
      _loc3_ = 8;
      if(_loc1_._temp == _loc3_)
      {
         _loc1_._walkstep = _loc1_._walkstep + 1;
         _loc1_.config[_loc1_.rh_index][1] = true;
         _loc1_.config[_loc1_.rs_index][1] = true;
         _loc1_.config[_loc1_.bottle_index][1] = true;
         _loc1_.config[_loc1_.rh_index][2] = _loc1_._adrink_armsr[_loc1_._walkstep % 2][0];
         _loc1_.config[_loc1_.rs_index][2] = _loc1_._adrink_armsr[_loc1_._walkstep % 2][0];
         _loc1_.config[_loc1_.bottle_index][2] = _loc1_._adrink_bottle[_loc1_._walkstep % 2][0];
         _loc1_.config[_loc1_.rh_index][5] = _loc1_._adrink_armsr[_loc1_._walkstep % 2][1];
         _loc1_.config[_loc1_.rs_index][5] = _loc1_._adrink_armsr[_loc1_._walkstep % 2][1];
         _loc1_.config[_loc1_.bottle_index][5] = _loc1_._adrink_bottle[_loc1_._walkstep % 2][1];
         _loc1_._temp = 0;
         _loc1_.draw();
      }
      _loc1_._temp = _loc1_._temp + 1;
   }
   else if(_loc1_._spos == "spk")
   {
      _loc3_ = 2;
      if(_loc1_._temp == _loc3_)
      {
         _loc1_._walkstep = _loc1_._walkstep + 1;
         _loc1_.config[_loc1_.hd_index][1] = true;
         _loc1_.config[_loc1_.fc_index][1] = true;
         _loc1_.config[_loc1_.hr_index][1] = true;
         _loc1_.config[_loc1_.hd_index][2] = _loc1_._atalk_hd[_loc1_._walkstep % 2][0];
         _loc1_.config[_loc1_.fc_index][2] = _loc1_._atalk_fc[_loc1_._walkstep % 2][0];
         _loc1_.config[_loc1_.hr_index][2] = _loc1_._atalk_hr[_loc1_._walkstep % 2][0];
         _loc1_.config[_loc1_.hd_index][5] = _loc1_._atalk_hd[_loc1_._walkstep % 2][1];
         _loc1_.config[_loc1_.fc_index][5] = _loc1_._atalk_fc[_loc1_._walkstep % 2][1];
         _loc1_.config[_loc1_.hr_index][5] = _loc1_._atalk_hr[_loc1_._walkstep % 2][1];
         _loc1_._temp = 0;
         _loc1_.draw();
      }
      _loc1_._temp = _loc1_._temp + 1;
   }
};
AvatarEngine.prototype.walk = function()
{
   var _loc1_ = this;
   _loc1_.debug("walk " + arguments);
   _loc1_._spos = "wlk";
   _loc1_.cleananim();
};
AvatarEngine.prototype.drink = function()
{
   var _loc1_ = this;
   _loc1_.debug("drink " + arguments);
   _loc1_._spos = "drk";
   _loc1_.cleananim();
   _loc1_._temp = 8;
};
AvatarEngine.prototype.dance = function()
{
   var _loc1_ = this;
   _loc1_.debug("dance " + arguments);
   _loc1_._spos = "dnc";
   _loc1_.cleananim();
};
AvatarEngine.prototype.talk = function()
{
   var _loc1_ = this;
   _loc1_.debug("talk " + arguments);
   _loc1_._spos = "spk";
   _loc1_.cleananim();
};
AvatarEngine.prototype.stand = function()
{
   var _loc2_ = this;
   _loc2_.debug("stand " + arguments);
   _loc2_._spos = "std";
   _loc2_.cleananim();
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.config.length)
   {
      _loc2_.config[_loc1_][1] = true;
      _loc2_.config[_loc1_][2] = "std";
      _loc2_.config[_loc1_][5] = 0;
      _loc1_ = _loc1_ + 1;
   }
   _loc2_.draw();
};
AvatarEngine.prototype.sit = function()
{
   var _loc1_ = this;
   _loc1_.debug("sit " + arguments);
   if(_loc1_._idir == 0 || _loc1_._idir == 2)
   {
      _loc1_._spos = "sit";
      _loc1_.cleananim();
      _loc1_.config[_loc1_.bd_index][1] = true;
      _loc1_.config[_loc1_.lg_index][1] = true;
      _loc1_.config[_loc1_.sh_index][1] = true;
      _loc1_.config[_loc1_.bd_index][2] = "sit";
      _loc1_.config[_loc1_.lg_index][2] = "sit";
      _loc1_.config[_loc1_.sh_index][2] = "sit";
      _loc1_.draw();
   }
};
AvatarEngine.prototype.cleananim = function(direction)
{
   var _loc2_ = this;
   _loc2_.debug("cleananim " + arguments);
   _loc2_._temp = 0;
   _loc2_._walkstep = 0;
   _loc2_._dancestep = 0;
   if(_loc2_._sposant != _loc2_._spos && !(_loc2_._sposant == "sit" && _loc2_._spos == "spk"))
   {
      var _loc1_ = 0;
      while(_loc1_ < _loc2_.config.length)
      {
         if(_loc2_.config[_loc1_][5] != 0 || _loc2_.config[_loc1_][2] != "std")
         {
            _loc2_.config[_loc1_][5] = 0;
            _loc2_.config[_loc1_][2] = "std";
            _loc2_.config[_loc1_][1] = true;
         }
         _loc1_ = _loc1_ + 1;
      }
      _loc2_._sposant = _loc2_._spos;
   }
};
AvatarEngine.prototype.changedir = function(direction)
{
   var _loc1_ = this;
   var _loc3_ = direction;
   _loc1_.debug("changedir " + arguments);
   if(_loc3_ != 7 && _loc3_ != 1 && _loc3_ != 3 && _loc3_ != 5 && (_loc1_._spos == "sit" || _loc1_._spos == "spk" && _loc1_._sposant == "sit") || _loc1_._spos != "sit" && !(_loc1_._spos == "spk" && _loc1_._sposant == "sit"))
   {
      _loc1_._idir = _loc3_;
      _loc1_._ifakedir = _loc3_;
      if(_loc1_._ifakedir == 4)
      {
         _loc1_._idir = 2;
         _loc1_.flip = true;
      }
      else if(_loc1_._ifakedir == 5)
      {
         _loc1_._idir = 1;
         _loc1_.flip = true;
      }
      else if(_loc1_._ifakedir == 6)
      {
         _loc1_._idir = 0;
         _loc1_.flip = true;
      }
      else
      {
         _loc1_.flip = false;
      }
      var _loc2_ = 0;
      while(_loc2_ < _loc1_.config.length)
      {
         _loc1_.config[_loc2_][1] = true;
         _loc2_ = _loc2_ + 1;
      }
      _loc1_.draw();
   }
};
AvatarEngine.prototype.decode = function()
{
   var _loc2_ = this;
   _loc2_.debug("decode " + arguments);
   _loc2_._sAvatar_string = _loc2_._sAvatar_string.split("&");
   var _loc1_ = 0;
   while(_loc1_ < _loc2_._sAvatar_string.length)
   {
      _loc2_._sAvatar_string[_loc1_] = _loc2_._sAvatar_string[_loc1_].split("=");
      _loc2_._sAvatar_string[_loc1_][1] = _loc2_._sAvatar_string[_loc1_][1].split("/");
      _loc2_[_loc2_._sAvatar_string[_loc1_][0]] = _loc2_._sAvatar_string[_loc1_][1];
      _loc1_ = _loc1_ + 1;
   }
};
AvatarEngine.prototype.trans = function(sRgb, sNameCol, sNameMC)
{
   var _loc2_ = sRgb;
   var _loc3_ = this;
   _loc3_.debug("trans " + arguments);
   _loc2_ = _loc2_.split(",");
   var iR = _loc2_[0] * 100 / 256;
   var iG = _loc2_[1] * 100 / 256;
   var iB = _loc2_[2] * 100 / 256;
   _loc3_.mcavatar._parent[sNamecol] = new Color(sNameMC);
   var _loc1_ = new Object();
   _loc1_.ra = iR;
   _loc1_.rb = 0;
   _loc1_.ga = iG;
   _loc1_.gb = 0;
   _loc1_.ba = iB;
   _loc1_.bb = 0;
   if(_loc3_._mcRoot._parent.bVector != true)
   {
      _loc1_.aa = 100;
      _loc1_.ab = 255;
   }
   _loc3_.mcavatar._parent[sNamecol].setTransform(_loc1_);
   _loc3_.testColorList();
};
AvatarEngine.prototype.hdToDc = function(sHd)
{
   var _loc1_ = sHd;
   this.debug("hdtoDc " + arguments);
   return parseInt(_loc1_.substr(-6,2),16) + "," + parseInt(_loc1_.substr(-4,2),16) + "," + parseInt(_loc1_.substr(-2,2),16);
};
AvatarEngine.prototype.dctohc = function(RGB)
{
   var _loc1_ = RGB;
   _loc1_ = _loc1_.split(",");
   _loc1_[0] = Number(_loc1_[0]).toString(16);
   if(_loc1_[0].length == 1)
   {
      _loc1_[0] = "0" + _loc1_[0];
   }
   _loc1_[1] = Number(_loc1_[1]).toString(16);
   if(_loc1_[1].length == 1)
   {
      _loc1_[1] = "0" + _loc1_[1];
   }
   _loc1_[2] = Number(_loc1_[2]).toString(16);
   if(_loc1_[2].length == 1)
   {
      _loc1_[2] = "0" + _loc1_[2];
   }
   var _loc2_ = "0x" + _loc1_[0] + _loc1_[1] + _loc1_[2];
   return parseInt(_loc2_);
};
AvatarEngine.prototype.debug = function(sMessage, bForce)
{
   if(this._bdebug || bForce)
   {
   }
};
AvatarEngine.prototype.init_default = function()
{
   var _loc1_ = this;
   _loc1_.bd = new Array(2);
   if(_loc1_._sAvatar_gender == "F")
   {
      _loc1_.bd[0] = "002";
   }
   else
   {
      _loc1_.bd[0] = "001";
   }
   _loc1_.bd[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._obd_arr[0][1][0]);
   if(_loc1_.bd[0] == "001")
   {
      _loc1_.hr = new Array(2);
      _loc1_.hr[0] = _loc1_._mcRoot.AvatarConstants._ohr_arr[0][0];
      _loc1_.hr[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ohr_arr[0][1][0]);
      _loc1_.hd = new Array(2);
      _loc1_.hd[0] = _loc1_._mcRoot.AvatarConstants._ohd_arr[0][0];
      _loc1_.hd[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ohd_arr[0][1][0]);
      _loc1_.ey = new Array(2);
      _loc1_.ey[0] = _loc1_._mcRoot.AvatarConstants._oey_arr[0][0];
      _loc1_.ey[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._oey_arr[0][1][0]);
      _loc1_.fc = new Array(2);
      _loc1_.fc[0] = _loc1_._mcRoot.AvatarConstants._ofc_arr[0][0];
      _loc1_.fc[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ofc_arr[0][1][0]);
      _loc1_.ch = new Array(2);
      _loc1_.ch[0] = _loc1_._mcRoot.AvatarConstants._och_arr[0][0];
      _loc1_.ch[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._och_arr[0][1][0]);
      _loc1_.rs = new Array(2);
      _loc1_.rs[0] = _loc1_._mcRoot.AvatarConstants._ors_arr[0][0];
      _loc1_.rs[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ors_arr[0][1][0]);
      _loc1_.ls = new Array(2);
      _loc1_.ls[0] = _loc1_._mcRoot.AvatarConstants._ols_arr[0][0];
      _loc1_.ls[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ols_arr[0][1][0]);
      _loc1_.lh = new Array(2);
      _loc1_.lh[0] = _loc1_._mcRoot.AvatarConstants._olh_arr[0][0];
      _loc1_.lh[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._olh_arr[0][1][0]);
      _loc1_.rh = new Array(2);
      _loc1_.rh[0] = _loc1_._mcRoot.AvatarConstants._orh_arr[0][0];
      _loc1_.rh[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._orh_arr[0][1][0]);
      _loc1_.lg = new Array(2);
      _loc1_.lg[0] = _loc1_._mcRoot.AvatarConstants._olg_arr[0][0];
      _loc1_.lg[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._olg_arr[0][1][0]);
      _loc1_.sh = new Array(2);
      _loc1_.sh[0] = _loc1_._mcRoot.AvatarConstants._osh_arr[0][0];
      _loc1_.sh[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._osh_arr[0][1][0]);
   }
   else
   {
      _loc1_.hr = new Array(2);
      _loc1_.hr[0] = _loc1_._mcRoot.AvatarConstants._ohr_arr[3][0];
      _loc1_.hr[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ohr_arr[3][1][0]);
      _loc1_.hd = new Array(2);
      _loc1_.hd[0] = _loc1_._mcRoot.AvatarConstants._ohd_arr[16][0];
      _loc1_.hd[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ohd_arr[16][1][0]);
      _loc1_.ey = new Array(2);
      _loc1_.ey[0] = _loc1_._mcRoot.AvatarConstants._oey_arr[16][0];
      _loc1_.ey[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._oey_arr[16][1][0]);
      _loc1_.fc = new Array(2);
      _loc1_.fc[0] = _loc1_._mcRoot.AvatarConstants._ofc_arr[16][0];
      _loc1_.fc[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ofc_arr[16][1][0]);
      _loc1_.ch = new Array(2);
      _loc1_.ch[0] = _loc1_._mcRoot.AvatarConstants._och_arr[10][0];
      _loc1_.ch[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._och_arr[10][1][0]);
      _loc1_.rs = new Array(2);
      _loc1_.rs[0] = _loc1_._mcRoot.AvatarConstants._ors_arr[10][0];
      _loc1_.rs[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ors_arr[10][1][0]);
      _loc1_.ls = new Array(2);
      _loc1_.ls[0] = _loc1_._mcRoot.AvatarConstants._ols_arr[10][0];
      _loc1_.ls[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ols_arr[10][1][0]);
      _loc1_.lh = new Array(2);
      _loc1_.lh[0] = _loc1_._mcRoot.AvatarConstants._olh_arr[0][0];
      _loc1_.lh[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._olh_arr[0][1][0]);
      _loc1_.rh = new Array(2);
      _loc1_.rh[0] = _loc1_._mcRoot.AvatarConstants._orh_arr[0][0];
      _loc1_.rh[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._orh_arr[0][1][0]);
      _loc1_.lg = new Array(2);
      _loc1_.lg[0] = _loc1_._mcRoot.AvatarConstants._olg_arr[3][0];
      _loc1_.lg[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._olg_arr[3][1][0]);
      _loc1_.sh = new Array(2);
      _loc1_.sh[0] = _loc1_._mcRoot.AvatarConstants._osh_arr[2][0];
      _loc1_.sh[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._osh_arr[2][1][0]);
   }
};
AvatarEngine.prototype.initFunctions = function(oAvatarEngine, oController)
{
   var _loc1_ = this;
   var _loc2_ = arguments;
   _loc1_._mcRoot.buildavatar = function(sgender, smission, sattributes)
   {
      var _loc1_ = this;
      _loc1_._oAvatarEngine.debug("buildavatar " + arguments);
      _loc1_._oAvatarEngine = new AvatarEngine(center,sattributes,smission,sgender,_loc1_);
      _loc1_._oAvatarEngine.order(_loc1_._oAvatarEngine._idir);
      _loc1_._oAvatarEngine.draw();
   };
   _loc1_._mcRoot.onEnterFrame = function()
   {
      var _loc1_ = this;
      _loc1_._oAvatarEngine.debug("onEnterFrame " + arguments);
      if(_loc1_._oAvatarEngine.isBadge)
      {
         _loc1_._oAvatarEngine.tactual = getTimer();
         if(_loc1_._oAvatarEngine.tactual - _loc1_._oAvatarEngine.tini > 3000 && _loc1_._oAvatarEngine._mcRoot._parent.signin != 1)
         {
            _loc1_._oAvatarEngine.randomizeme();
            _loc1_._oAvatarEngine.tini = _loc1_._oAvatarEngine.tactual;
         }
      }
      else if(!_loc1_._oAvatarEngine.isConf)
      {
         _loc1_._oAvatarEngine.anim();
      }
   };
   _loc1_._mcRoot.changedir = function(direction)
   {
      this._oAvatarEngine.debug("changedir " + arguments);
      this._oAvatarEngine.changedir(direction);
   };
   _loc1_._mcRoot.begindance = function()
   {
      this._oAvatarEngine.debug("beginDance " + arguments);
      this._oAvatarEngine.dance();
   };
   _loc1_._mcRoot.begindrink = function()
   {
      this._oAvatarEngine.debug("beginDrink " + arguments);
      this._oAvatarEngine.drink();
   };
   _loc1_._mcRoot.begintalk = function()
   {
      this._oAvatarEngine.debug("begintalk " + arguments);
      this._oAvatarEngine.talk();
   };
   _loc1_._mcRoot.beginwalk = function()
   {
      this._oAvatarEngine.debug("beginwalk " + arguments);
      this._oAvatarEngine.walk();
   };
   _loc1_._mcRoot.sit = function()
   {
      this._oAvatarEngine.debug("sit " + arguments);
      this._oAvatarEngine.sit();
   };
   _loc1_._mcRoot.stoped = function()
   {
      this._oAvatarEngine.debug("stoped " + arguments);
      this._oAvatarEngine.stand();
   };
};
AvatarEngine.prototype.isReady = function()
{
   oAvatarEngine.debug("isReady " + arguments);
   return this.bReady;
};
AvatarEngine.prototype.randomizeme = function()
{
   var _loc1_ = this;
   _loc1_.debug("randomizeme " + arguments,true);
   var _loc2_ = random(_loc1_._mcRoot.AvatarConstants._obd_arr.length);
   var hr = random(_loc1_._mcRoot.AvatarConstants._ohr_arr.length);
   while(_loc1_._mcRoot.AvatarConstants._ohr_arr[hr][2] != _loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][2] && _loc1_._mcRoot.AvatarConstants._ohr_arr[hr][2] != "*")
   {
      hr = random(_loc1_._mcRoot.AvatarConstants._ohr_arr.length);
   }
   var hd = random(_loc1_._mcRoot.AvatarConstants._ohd_arr.length);
   while(_loc1_._mcRoot.AvatarConstants._ohd_arr[hd][2] != _loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][2] && _loc1_._mcRoot.AvatarConstants._ohd_arr[hd][2] != "*")
   {
      hd = random(_loc1_._mcRoot.AvatarConstants._ohd_arr.length);
   }
   var ey = random(_loc1_._mcRoot.AvatarConstants._oey_arr.length);
   while(_loc1_._mcRoot.AvatarConstants._oey_arr[ey][2] != _loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][2] && _loc1_._mcRoot.AvatarConstants._oey_arr[ey][2] != "*")
   {
      ey = random(_loc1_._mcRoot.AvatarConstants._oey_arr.length);
   }
   var fc = random(_loc1_._mcRoot.AvatarConstants._ofc_arr.length);
   while(_loc1_._mcRoot.AvatarConstants._ofc_arr[fc][2] != _loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][2] && _loc1_._mcRoot.AvatarConstants._ofc_arr[fc][2] != "*")
   {
      fc = random(_loc1_._mcRoot.AvatarConstants._ofc_arr.length);
   }
   var rh = 0;
   var lh = 0;
   var _loc3_ = random(_loc1_._mcRoot.AvatarConstants._och_arr.length);
   while(_loc1_._mcRoot.AvatarConstants._och_arr[_loc3_][2] != _loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][2] && _loc1_._mcRoot.AvatarConstants._och_arr[_loc3_][2] != "*")
   {
      _loc3_ = random(_loc1_._mcRoot.AvatarConstants._och_arr.length);
   }
   var rs = _loc3_;
   var ls = _loc3_;
   var lg = random(_loc1_._mcRoot.AvatarConstants._olg_arr.length);
   while(_loc1_._mcRoot.AvatarConstants._olg_arr[lg][2] != _loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][2] && _loc1_._mcRoot.AvatarConstants._olg_arr[lg][2] != "*")
   {
      lg = random(_loc1_._mcRoot.AvatarConstants._olg_arr.length);
   }
   var sh = random(_loc1_._mcRoot.AvatarConstants._osh_arr.length);
   while(_loc1_._mcRoot.AvatarConstants._osh_arr[sh][2] != _loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][2] && _loc1_._mcRoot.AvatarConstants._osh_arr[sh][2] != "*")
   {
      sh = random(_loc1_._mcRoot.AvatarConstants._osh_arr.length);
   }
   var skin = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ohd_arr[_loc2_][1][random(_loc1_._mcRoot.AvatarConstants._ohd_arr[hd][1].length)]);
   _loc1_.bd = new Array(_loc1_._mcRoot.AvatarConstants._obd_arr[_loc2_][0],skin);
   _loc1_.hd = new Array(_loc1_._mcRoot.AvatarConstants._ohd_arr[hd][0],skin);
   _loc1_.ey = new Array(_loc1_._mcRoot.AvatarConstants._oey_arr[ey][0],_loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._oey_arr[ey][1][random(_loc1_._mcRoot.AvatarConstants._oey_arr[ey][1].length)]));
   _loc1_.hr = new Array(_loc1_._mcRoot.AvatarConstants._ohr_arr[hr][0],_loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ohr_arr[hr][1][random(_loc1_._mcRoot.AvatarConstants._ohr_arr[hr][1].length)]));
   _loc1_.fc = new Array(_loc1_._mcRoot.AvatarConstants._ofc_arr[fc][0],skin);
   _loc1_.rh = new Array(_loc1_._mcRoot.AvatarConstants._orh_arr[rh][0],skin);
   _loc1_.lh = _loc1_.rh;
   var chcolor = random(_loc1_._mcRoot.AvatarConstants._och_arr[_loc3_][1].length);
   _loc1_.ch = new Array(_loc1_._mcRoot.AvatarConstants._och_arr[_loc3_][0],_loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._och_arr[_loc3_][1][chcolor]));
   _loc1_.ls = new Array(_loc1_._mcRoot.AvatarConstants._ols_arr[_loc3_][0],_loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._och_arr[_loc3_][1][chcolor]));
   _loc1_.rs = _loc1_.ls;
   _loc1_.lg = new Array(_loc1_._mcRoot.AvatarConstants._olg_arr[lg][0],_loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._olg_arr[lg][1][random(_loc1_._mcRoot.AvatarConstants._olg_arr[lg][1].length)]));
   _loc1_.sh = new Array(_loc1_._mcRoot.AvatarConstants._osh_arr[sh][0],_loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._osh_arr[sh][1][random(_loc1_._mcRoot.AvatarConstants._osh_arr[sh][1].length)]));
   _loc1_.order(_loc1_._idir);
   _loc1_.draw();
};
AvatarEngine.prototype.moveLeft = function(sPart)
{
   var _loc1_ = this;
   var _loc3_ = sPart;
   var indexname = "conf" + _loc3_ + "index";
   var partarray = _loc1_._mcRoot.AvatarConstants["_o" + _loc3_ + "_arr"];
   var _loc2_ = _loc1_[indexname] - 1;
   if(_loc2_ < 0)
   {
      _loc2_ = partarray.length - 1;
   }
   if(partarray[_loc2_][2] == _loc1_.bd[0] || partarray[_loc2_][2] == "*")
   {
      _loc1_[indexname] = _loc2_;
      _loc1_[_loc3_][0] = partarray[_loc2_][0];
      _loc1_[_loc3_][1] = _loc1_.hdtodc(partarray[_loc2_][1][0]);
      _loc1_[indexnameAux] = 0;
      if(_loc3_ == "ch")
      {
         _loc1_.ls[0] = _loc1_._mcRoot.AvatarConstants._ols_arr[_loc2_][0];
         _loc1_.ls[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ols_arr[_loc2_][1][0]);
         _loc1_.rs[0] = _loc1_._mcRoot.AvatarConstants._ors_arr[_loc2_][0];
         _loc1_.rs[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ors_arr[_loc2_][1][0]);
      }
      if(_loc3_ == "hd")
      {
         _loc1_.fc[0] = _loc1_._mcRoot.AvatarConstants._ofc_arr[_loc2_][0];
         _loc1_.fc[1] = _loc1_[_loc3_][1];
         _loc1_.ey[0] = _loc1_._mcRoot.AvatarConstants._oey_arr[_loc2_][0];
         _loc1_.bd[1] = _loc1_[_loc3_][1];
         _loc1_.rh[1] = _loc1_[_loc3_][1];
         _loc1_.lh[1] = _loc1_[_loc3_][1];
      }
      _loc1_.order(_loc1_._idir);
      _loc1_.draw();
   }
   else
   {
      _loc1_[indexname] = _loc2_;
      _loc1_.moveLeft(_loc3_);
   }
};
AvatarEngine.prototype.moveRight = function(sPart)
{
   var _loc1_ = this;
   var _loc3_ = sPart;
   var indexnameAux = "confColor" + _loc3_ + "index";
   var indexname = "conf" + _loc3_ + "index";
   var partarray = _loc1_._mcRoot.AvatarConstants["_o" + _loc3_ + "_arr"];
   var _loc2_ = _loc1_[indexname] + 1;
   if(_loc2_ > partarray.length - 1)
   {
      _loc2_ = 0;
   }
   if(partarray[_loc2_][2] == _loc1_.bd[0] || partarray[_loc2_][2] == "*")
   {
      _loc1_[indexname] = _loc2_;
      _loc1_[_loc3_][0] = partarray[_loc2_][0];
      _loc1_[_loc3_][1] = _loc1_.hdtodc(partarray[_loc2_][1][0]);
      _loc1_[indexnameAux] = 0;
      if(_loc3_ == "ch")
      {
         _loc1_.ls[0] = _loc1_._mcRoot.AvatarConstants._ols_arr[_loc2_][0];
         _loc1_.ls[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ols_arr[_loc2_][1][0]);
         _loc1_.rs[0] = _loc1_._mcRoot.AvatarConstants._ors_arr[_loc2_][0];
         _loc1_.rs[1] = _loc1_.hdtodc(_loc1_._mcRoot.AvatarConstants._ors_arr[_loc2_][1][0]);
      }
      if(_loc3_ == "hd")
      {
         _loc1_.fc[0] = _loc1_._mcRoot.AvatarConstants._ofc_arr[_loc2_][0];
         _loc1_.fc[1] = _loc1_[_loc3_][1];
         _loc1_.ey[0] = _loc1_._mcRoot.AvatarConstants._oey_arr[_loc2_][0];
         _loc1_.bd[1] = _loc1_[_loc3_][1];
         _loc1_.rh[1] = _loc1_[_loc3_][1];
         _loc1_.lh[1] = _loc1_[_loc3_][1];
      }
      _loc1_.order(_loc1_._idir);
      _loc1_.draw();
   }
   else
   {
      _loc1_[indexname] = _loc2_;
      _loc1_.moveRight(_loc3_);
   }
};
AvatarEngine.prototype.rightColor = function(sPart)
{
   var _loc1_ = this;
   var _loc2_ = sPart;
   var indexname = "confColor" + _loc2_ + "index";
   var indexnameAux = "conf" + _loc2_ + "index";
   var partarray = _loc1_._mcRoot.AvatarConstants["_o" + _loc2_ + "_arr"];
   var _loc3_ = _loc1_[indexname] + 1;
   if(_loc3_ > partarray[_loc1_[indexnameAux]][1].length - 1)
   {
      _loc3_ = 0;
   }
   _loc1_[indexname] = _loc3_;
   _loc1_[_loc2_][1] = _loc1_.hdtodc(partarray[_loc1_[indexnameAux]][1][_loc3_]);
   if(_loc2_ == "ch")
   {
      _loc1_.ls[1] = _loc1_[_loc2_][1];
      _loc1_.rs[1] = _loc1_[_loc2_][1];
   }
   if(_loc2_ == "hd")
   {
      _loc1_.fc[1] = _loc1_[_loc2_][1];
      _loc1_.bd[1] = _loc1_[_loc2_][1];
      _loc1_.rh[1] = _loc1_[_loc2_][1];
      _loc1_.lh[1] = _loc1_[_loc2_][1];
   }
   _loc1_.order(_loc1_._idir);
   _loc1_.draw();
};
AvatarEngine.prototype.leftColor = function(sPart)
{
   var _loc1_ = this;
   var _loc2_ = sPart;
   var indexname = "confColor" + _loc2_ + "index";
   var indexnameAux = "conf" + _loc2_ + "index";
   var partarray = _loc1_._mcRoot.AvatarConstants["_o" + _loc2_ + "_arr"];
   var _loc3_ = _loc1_[indexname] - 1;
   if(_loc3_ < 0)
   {
      _loc3_ = partarray[_loc1_[indexnameAux]][1].length - 1;
   }
   _loc1_[indexname] = _loc3_;
   _loc1_[_loc2_][1] = _loc1_.hdtodc(partarray[_loc1_[indexnameAux]][1][_loc3_]);
   if(_loc2_ == "ch")
   {
      _loc1_.ls[1] = _loc1_[_loc2_][1];
      _loc1_.rs[1] = _loc1_[_loc2_][1];
   }
   if(_loc2_ == "hd")
   {
      _loc1_.fc[1] = _loc1_[_loc2_][1];
      _loc1_.bd[1] = _loc1_[_loc2_][1];
      _loc1_.rh[1] = _loc1_[_loc2_][1];
      _loc1_.lh[1] = _loc1_[_loc2_][1];
   }
   _loc1_.order(_loc1_._idir);
   _loc1_.draw();
};
AvatarEngine.prototype.initIndex = function()
{
   var _loc1_ = this;
   oAvatarEngine.debug("initIndex " + arguments);
   _loc1_.confHrindex = _loc1_.search(_loc1_._mcRoot.AvatarConstants._ohr_arr,_loc1_.hr[0]);
   _loc1_.confHdindex = _loc1_.searchm(new Array(_loc1_._mcRoot.AvatarConstants._ohd_arr,_loc1_._mcRoot.AvatarConstants._ofc_arr,_loc1_._mcRoot.AvatarConstants._oey_arr),new Array(_loc1_.hd[0],_loc1_.fc[0],_loc1_.ey[0]));
   _loc1_.confChindex = _loc1_.searchm(new Array(_loc1_._mcRoot.AvatarConstants._och_arr,_loc1_._mcRoot.AvatarConstants._ors_arr,_loc1_._mcRoot.AvatarConstants._ols_arr),new Array(_loc1_.ch[0],_loc1_.rs[0],_loc1_.ls[0]));
   _loc1_.confLgindex = _loc1_.search(_loc1_._mcRoot.AvatarConstants._olg_arr,_loc1_.lg[0]);
   _loc1_.confShindex = _loc1_.search(_loc1_._mcRoot.AvatarConstants._osh_arr,_loc1_.sh[0]);
   _loc1_.confColorHrindex = _loc1_.searchcolor(_loc1_.confHrindex,_loc1_._mcRoot.AvatarConstants._ohr_arr,_loc1_.hr[1]);
   _loc1_.confColorHdindex = _loc1_.searchcolor(_loc1_.confHdindex,_loc1_._mcRoot.AvatarConstants._ohd_arr,_loc1_.hd[1]);
   _loc1_.confColorChindex = _loc1_.searchcolor(_loc1_.confChindex,_loc1_._mcRoot.AvatarConstants._och_arr,_loc1_.ch[1]);
   _loc1_.confColorLgindex = _loc1_.searchcolor(_loc1_.confLgindex,_loc1_._mcRoot.AvatarConstants._olg_arr,_loc1_.lg[1]);
   _loc1_.confColorShindex = _loc1_.searchcolor(_loc1_.confShindex,_loc1_._mcRoot.AvatarConstants._osh_arr,_loc1_.sh[1]);
};
AvatarEngine.prototype.search = function(big_array, element)
{
   var _loc2_ = big_array;
   var _loc3_ = -1;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_.length)
   {
      if(_loc2_[_loc1_][0] == element)
      {
         _loc3_ = _loc1_;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   return _loc3_;
};
AvatarEngine.prototype.paintPart = function(sPart, iIndex)
{
   var _loc1_ = this;
   var _loc2_ = sPart;
   var indexname = "confColor" + _loc2_ + "index";
   var indexnameAux = "conf" + _loc2_ + "index";
   var partarray = _loc1_._mcRoot.AvatarConstants["_o" + _loc2_ + "_arr"];
   var _loc3_ = iIndex;
   _loc1_[indexname] = _loc3_;
   _loc1_[_loc2_][1] = _loc1_.hdtodc(partarray[_loc1_[indexnameAux]][1][_loc3_]);
   if(_loc2_ == "ch")
   {
      _loc1_.ls[1] = _loc1_[_loc2_][1];
      _loc1_.rs[1] = _loc1_[_loc2_][1];
   }
   if(_loc2_ == "hd")
   {
      _loc1_.fc[1] = _loc1_[_loc2_][1];
      _loc1_.bd[1] = _loc1_[_loc2_][1];
      _loc1_.rh[1] = _loc1_[_loc2_][1];
      _loc1_.lh[1] = _loc1_[_loc2_][1];
   }
   _loc1_.order(_loc1_._idir);
   _loc1_.draw();
};
AvatarEngine.prototype.testColorList = function(sCurrentPart)
{
   var _loc1_ = this;
   _loc1_._mcRoot.sColor = "hair: \n" + _loc1_.dctohc(_loc1_.hr[1]).toString(16);
   _loc1_._mcRoot.sColor += "\nbody: \n" + _loc1_.dctohc(_loc1_.hd[1]).toString(16);
   _loc1_._mcRoot.sColor += "\nshirt: \n" + _loc1_.dctohc(_loc1_.ch[1]).toString(16);
   _loc1_._mcRoot.sColor += "\npants: \n" + _loc1_.dctohc(_loc1_.lg[1]).toString(16);
   _loc1_._mcRoot.sColor += "\nshoes: \n" + _loc1_.dctohc(_loc1_.sh[1]).toString(16);
};
AvatarEngine.prototype.getColorList = function(sCurrentPart)
{
   var _loc1_ = this[sCurrentPart];
   var _loc2_ = _loc1_[0];
   _loc1_ = this._mcRoot.AvatarConstants["_o" + sCurrentPart + "_arr"];
   var _loc3_ = this.search(_loc1_,_loc2_);
   return _loc1_[_loc3_][1];
};
AvatarEngine.prototype.getCurrentColor = function(sCurrentPart)
{
   return this.dctohc(this[sCurrentPart][1]).toString(16);
};
AvatarEngine.prototype.searchcolor = function(actual, big_array, element)
{
   var _loc2_ = big_array;
   var _loc3_ = actual;
   var num = -1;
   var _loc1_ = 0;
   while(_loc1_ < _loc2_[_loc3_][1].length)
   {
      if(parseInt(_loc2_[_loc3_][1][_loc1_]) == this.dctohc(element))
      {
         num = _loc1_;
         break;
      }
      _loc1_ = _loc1_ + 1;
   }
   return num;
};
AvatarEngine.prototype.searchm = function(big_array, element)
{
   var _loc3_ = big_array;
   var num = -1;
   var _loc2_ = 0;
   while(_loc2_ < _loc3_[0].length)
   {
      var equal = 0;
      var _loc1_ = 0;
      while(_loc1_ < _loc3_.length)
      {
         if(_loc3_[_loc1_][_loc2_][0] == element[_loc1_])
         {
            equal++;
         }
         _loc1_ = _loc1_ + 1;
      }
      if(equal == _loc3_.length)
      {
         num = _loc2_;
         break;
      }
      _loc2_ = _loc2_ + 1;
   }
   return num;
};
AvatarEngine.prototype.generateString = function()
{
   var _loc2_ = this;
   var _loc1_ = "";
   _loc1_ += "hr=" + _loc2_.hr[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.hr[1];
   _loc1_ += "&hd=" + _loc2_.hd[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.hd[1];
   _loc1_ += "&ey=" + _loc2_.ey[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.ey[1];
   _loc1_ += "&fc=" + _loc2_.fc[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.fc[1];
   _loc1_ += "&bd=" + _loc2_.bd[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.bd[1];
   _loc1_ += "&lh=001";
   _loc1_ += "/";
   _loc1_ += _loc2_.bd[1];
   _loc1_ += "&rh=001";
   _loc1_ += "/";
   _loc1_ += _loc2_.bd[1];
   _loc1_ += "&ch=" + _loc2_.ch[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.ch[1];
   if(_loc2_.ls[0] == "000")
   {
      _loc1_ += "&ls=" + _loc2_.ls[0];
      _loc1_ += "/";
      _loc1_ += _loc2_.hdtodc(_loc2_._mcRoot.AvatarConstants._acolors[0][0]);
      _loc1_ += "&rs=" + _loc2_.rs[0];
      _loc1_ += "/";
      _loc1_ += _loc2_.hdtodc(_loc2_._mcRoot.AvatarConstants._acolors[0][0]);
   }
   else
   {
      _loc1_ += "&ls=" + _loc2_.ls[0];
      _loc1_ += "/";
      _loc1_ += _loc2_.ls[1];
      _loc1_ += "&rs=" + _loc2_.rs[0];
      _loc1_ += "/";
      _loc1_ += _loc2_.rs[1];
   }
   _loc1_ += "&lg=" + _loc2_.lg[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.lg[1];
   _loc1_ += "&sh=" + _loc2_.sh[0];
   _loc1_ += "/";
   _loc1_ += _loc2_.sh[1];
   return _loc1_;
};
AvatarEngine.prototype.traceme = function()
{
   var _loc1_ = this;
};
this._oAvatarEngine = new AvatarEngine(this.center,"","","",this);
