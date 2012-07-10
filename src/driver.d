module driver;

import
    classic.ciphers.ADFGVX,

    classic.codes.rot13,

    std.algorithm,
    std.stdio;

void main( )
{
    Rot13 rot = new Rot13( );
    ADFGVX adfgvx = new ADFGVX();

    //writeln(adfgvx.encode("WHAT THE HELL IS THIS CRAP? THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG. NOT THE OTHER WAY AROUND!", "THISISFUBAREDSHITSIR"));
    //writeln(adfgvx.decode("FGAGVFVFVX VFVFVVGDDF DVFVFDAGDD GDDXXXAXVG GVDAVXVVGD GXVGDVVVXVAXGGXVVVAX DVVDGGGFVAFDVXFDVDFAGXVVDXAXFXFDVFFVVVF GVVGGVAGFGFFVFFVXAA VAVFVVFVFXDGFXXAGFFADVXGVVDFVDGGFXGGFAFV VVXDVGXDFFADGVFGXVGA GFGGFFFFGG","THISISFUBAREDSHITSIR"));
    string key = "THISISFUBAREDSHITSIR";
    char [] cKey;
    foreach( char c ; key ){
        cKey ~= c;
    }
    writeln(cKey);
    auto aKey = uniq(cKey);
    writeln(aKey);
}
