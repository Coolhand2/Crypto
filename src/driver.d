module driver;

import classic.ciphers.ADFGVX;
import std.stdio;

void main( )
{
    ADFGVX c = new ADFGVX( );
    string plain = "Hello, World.";
    string key = "fubar";

    string a = c.encode( plain, key );
    string b = c.decode( a, key );

    writefln( "Plaintext: %s", plain );
    writefln( "Key: %s", key );
    writefln( "Ciphertext: %s", a );
    writefln( "Decode Result: %s", b );

}
