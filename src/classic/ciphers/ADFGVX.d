module classic.ciphers.ADFGVX;

import std.string;

class ADFGVX {
    private char[][] _polybius;
    private char[] _letters = ['A','D','F','G','V','X'];

    public this( ) {
        //TODO: Randomize the cration of this alphabet.
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
        key = _unique(key);

        //Get the coordinates of each letter in the message.
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

        //Map these coordinates under the key letters, going across.
        foreach( int i, char c; coordinates ) {
            map[key[i%key.length]] ~= c;
        }

        //Transpose the collection of letters under each key letter into a single
        // line, after sorting the resulting map into alphabetical according to
        // the key characters.
        foreach( char c; map.keys.sort ) {
            cipher ~= map[c] ~ " ";
        }

        //Return the cipher text, stripping whitespace at each end of the message.
        return cipher.strip();
    }

    public string decode( string cipher, string key ) {
        string plain;
        char[][char] map;
        string[] plainMap;
        char[] coordinates;
        key = _unique(key);

        //Get a "plain" mapping of the message, by splitting the cipher into an array.
        plainMap = cipher.split(" ");

        //Initialize the map that we'll be using to translate back into the plaintext.
        foreach( char c; key ) {
            map[c] = [];
        }

        //De-sort the collection into the actual map we'll be reconstructing the
        // coordinate string from.
        foreach( int i, string word; plainMap ) {
            foreach( char letter; word ) {
                map[map.keys.sort[i]] ~= letter;
            }
        }
        //Go through the map, and actual reconstruct the coordinate list.
        for( int i = 0; i < cipher.length; i++ ) {
            if( map[key[i % map.length]].length > 0 ) {
                coordinates ~= map[key[i % map.length]][0];
                map[key[i % map.length]] = map[key[i % map.length]][1 .. $];
            }
        }
        //Go through the coordinate list two at a time, grabbing the letters
        // at the X and Y coordinates.
        for( int i = 0; i < coordinates.length - 1; i += 2 ) {
            int x, y;
            char cx = coordinates[i];
            char cy = coordinates[i+1];
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

    private string _unique(string str){
        char[] matches = [];
        foreach(char c; str){
            bool inside = false;
            foreach( char k ; matches ){
                if( k == c )
                    inside = true;
            }
            if(!inside){
                matches ~= c;
            }
        }
        return cast(string)matches;
    }

    //Test that a known plain text translates into a known cipher text.
    unittest {
        ADFGVX cipher = new ADFGVX( );
        string text = "HELLO, WORLD.";
        string key = "fubar";
        string test = cipher.encode( text, key );
        writeln( test );
        assert( test == "VFFDF XVVXX DVXGGD GXVGX VGAFV" );
    }

    //Test that a known cipher text translates into a known plain text.
    unittest {
        ADFGVX cipher = new ADFGVX( );
        string text = "VFFDF XVVXX DVXGGD GXVGX VGAFV";
        string key = "fubar";
        string test = cipher.decode( text, key );

        assert( test == "HELLO, WORLD." );
    }
}
