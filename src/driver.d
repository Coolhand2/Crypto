module driver;

import
    ciphers.classic.ADFGVX,
    ciphers.classic.affine,
    ciphers.classic.atbash,
    ciphers.classic.autokey,
    ciphers.classic.caesar,
    std.algorithm,
    std.stdio;

void main( )
{
    ADFGVX adfgvx = new ADFGVX();
    Affine affine = new Affine();
    Atbash atbash = new Atbash();
    Autokey autokey = new Autokey();
    Caesar caesar = new Caesar();

    string message = "Hello, World!";
    string key = "Reddit Rules!";
    string cipher = "";

    int coprime = 72;
    affine.setCoprime(coprime);

    cipher = adfgvx.encode(message, key);
    cipher = affine.encode(cipher, coprime/2);
    cipher = atbash.encode(cipher);
    cipher = autokey.encode(cipher, key);
    cipher = caesar.encode(cipher, coprime/2);

    writeln("Coprime: ", coprime);
    writeln("Cipher: ", cipher);

    ///////////////////////////////////////////////////////////////////////////
    writeln("\nADFGVX Cipher:");
    ///////////////////////////////////////////////////////////////////////////
    message = "I am not yelling! Wait, why am I yelling?";
    key = "Holy crap, what the heck was that!?";
    cipher = adfgvx.encode(message,key);
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
    ///////////////////////////////////////////////////////////////////////////
    writeln("\nAtbash Cipher:");
    ///////////////////////////////////////////////////////////////////////////
    message = "It's a mercenary territory.";
    cipher = atbash.encode(message);
    writeln(cipher);
    message = atbash.decode(cipher);
    writeln(message);
    ///////////////////////////////////////////////////////////////////////////
    writeln("\nProving that Atbash is a special case of Affine!");
    ///////////////////////////////////////////////////////////////////////////
    int m = affine.getAlphabetLength() - 1;
    affine.setCoprime(m);
    cipher = affine.encode(message, m);
    writeln(cipher);
    message = affine.decode(cipher, m);
    writeln(message);
    ///////////////////////////////////////////////////////////////////////////

    ///////////////////////////////////////////////////////////////////////////
}
