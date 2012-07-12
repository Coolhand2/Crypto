module driver;

import
    classic.ciphers.ADFGVX,
    classic.ciphers.autokey,
    classic.ciphers.affine,
    classic.ciphers.caesar,
    std.algorithm,
    std.stdio;

void main( )
{
    ADFGVX adfgvx = new ADFGVX();
    Autokey autokey = new Autokey();
    Affine affine = new Affine();
    Caesar caesar = new Caesar();
    ///////////////////////////////////////////////////////////////////////////
    writeln("ADFGVX Cipher:");
    string message = "I am not yelling! Wait, why am I yelling?";
    string key = "What?";
    string cipher = adfgvx.encode(message,key);
    writeln(cipher);

    message = adfgvx.decode(cipher,key);
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
    ///////////////////////////////////////////////////////////////////////////
    writeln("\nCaesar Cipher:");
    ///////////////////////////////////////////////////////////////////////////
    message = "The quick borwn fox, jumped over the lazy dog!";
    cipher = caesar.encode(message, 3); //Same shift Caesar used...
    writeln(cipher);

    message = caesar.decode(cipher, 3);
    writeln(message);

}
