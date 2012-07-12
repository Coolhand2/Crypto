module driver;

import
    classic.ciphers.ADFGVX,
    classic.ciphers.autokey,
    classic.ciphers.affine,

    classic.codes.rot13,

    std.algorithm,
    std.stdio;

void main( )
{
    Rot13 rot = new Rot13( );
    ADFGVX adfgvx = new ADFGVX();
    Autokey autokey = new Autokey();
    Affine affine = new Affine();
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
    cipher = autokey.encode(message, key);
    writeln(cipher);

    message = autokey.decode(cipher, key);
    writeln(message);
    ///////////////////////////////////////////////////////////////////////////
    writeln("\nAffine Cipher:");
    ///////////////////////////////////////////////////////////////////////////
    message = "Stop! This is a stickup! Hands in the air!";
    cipher = affine.encode(message, 123);
    writeln(cipher);

    message = affine.decode(cipher, 123);
    writeln(message);
}
