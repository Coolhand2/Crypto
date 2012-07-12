module driver;

import
    classic.ciphers.ADFGVX,
    classic.ciphers.autokey,

    classic.codes.rot13,

    std.algorithm,
    std.stdio;

void main( )
{
    Rot13 rot = new Rot13( );
    ADFGVX adfgvx = new ADFGVX();
    Autokey a = new Autokey();
    ///////////////////////////////////////////////////////////////////////////
    writeln("ADFGVX Cipher:");
    string message = "I am not yelling! Wait, why am I yelling?";
    string key = "What?";
    string cipher = adfgvx.encode(message,key);
    writeln(cipher);

    message = adfgvx.decode(cipher,key);
    writeln(message);
    ///////////////////////////////////////////////////////////////////////////
    writeln("\nROT13 Code:");
    ///////////////////////////////////////////////////////////////////////////
    message = "What in the hell?";
    cipher = rot.encode(message);
    writeln(cipher);

    message = rot.decode(cipher);
    writeln(message);
    ///////////////////////////////////////////////////////////////////////////
    writeln("\nAutokey Cipher:");
    ///////////////////////////////////////////////////////////////////////////
    message = "What and the shit, is this Herb? I mean, c'mon!";
    key = "Herp a derp, rope a dope!";
    cipher = a.encode(message, key);
    writeln(cipher);

    message = a.decode(cipher, key);
    writeln(message);
}
