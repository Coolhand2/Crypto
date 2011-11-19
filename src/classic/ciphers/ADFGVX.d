module classic.ciphers.ADFGVX;

import std.stdio;
import std.string;

class ADFGVX {
    private char[][] _polybius;
    private char[] _letters = ['A','D','F','G','V','X'];

    public this( ) {
        string alphabet = "MBJYA,Z(?PS.)NX; DURITW:!HGLFECVO'KQ";

        _polybius = new char[][6];
        foreach( i, ref e; _polybius ) {
            e = new char[6];
        }
        for( int row = 0, count = 0; row < 6; row++ ) {
            for( int column = 0; column < 6; column++ ) {
                _polybius[row][column] = alphabet[count];
                count++;
            }
        }
    }

    public string encode( string plain, string key ) {
        char[] coordinates;
        char[][char] map;
        string cipher;

        foreach( char c ; plain.toUpper() ) {
            for( int y = 0; y < 6; y++ ) {
                for( int x = 0; x < 6; x++ ) {
                    if( _polybius[y][x] == c ) {
                        coordinates ~= _letters[x];
                        coordinates ~= _letters[y];
                    }
                }
            }
        }
        foreach( int i, char c; coordinates ) {
            map[key[i%key.length]] ~= c;
        }
        foreach( char c; map.keys.sort ) {
            cipher ~= map[c] ~ " ";
        }
        return cipher.strip();
    }

    public string decode( string cipher, string key ) {
        string plain;
        char[][char] map;
        string[] plainMap;
        char[] coordinates;

        plainMap = cipher.split(" ");
        foreach( char c; key ) {
            map[c] = [];
        }

        foreach( int i, string word; plainMap ) {
            foreach( char letter; word ) {
                map[map.keys.sort[i]] ~= letter;
            }
        }
        for( int i = 0; i < cipher.length; i++ ) {
            if( map[key[i % map.length]].length > 0 ) {
                coordinates ~= map[key[i % map.length]][0];
                map[key[i % map.length]] = map[key[i % map.length]][1 .. $];
            }
        }
        for( int i = 0; i < coordinates.length; i += 2 ) {
            int x, y;
            char cx = coordinates[i];
            char cy = coordinates[i+i];
            for( int k = 0; k < 6; k++ ) {
                if( cx == _letters[k] ) {
                    x = k;
                }
                if( cy == _letters[k] ) {
                    y = k;
                }
            }
            plain ~= _polybius[y][x];
        }

        return plain;
    }

    unittest {
        ADFGVX cipher = new ADFGVX( );
        string text = "HELLO, WORLD.";
        string key = "fubar";
        string test = cipher.encode( text, key );
        writeln( test );
        assert( test == "VFFDF XVVXX DVXGGD GXVGX VGAFV" );
    }

    unittest {
        ADFGVX cipher = new ADFGVX( );
        string text = "VFFDF XVVXX DVXGGD GXVGX VGAFV";
        string key = "fubar";
        string test = cipher.decode( text, key );

        assert( test == "HELLO, WORLD." );
    }
}
