module ciphers.classic.autokey;

import std.string;

class Autokey{
    private char[char][char] _tabula;
    private string _alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz `1234567890-=[]\\;',./~!@#$%^&*()_+{}|:\"<>?";
    public this( ){
        int i = 0;
        int n = 0;
        foreach( char c; _alphabet ){
            foreach( char k; _alphabet ){
                _tabula[c][k] = _alphabet[(n+i)%_alphabet.length];
                n++;
            }
            i++;
        }
    }
    public string encode(string message, string key){
        string cipher = "";
        key ~= message;
        int size = message.length;
        for( int i = 0; i < size; i++ ){
            char c = message[i];
            char k = key[i];
            char j = _tabula[c][k];
            cipher ~= j;
        }
        return cipher;
    }

    public string decode(string cipher, string key){
        string message = "";
        int size = cipher.length;
        for( int i = 0; i < size; i++ ){
            char c = cipher[i];
            char k = key[i];
            char letter = _find(c, k);
            message ~= letter;
            key ~= letter;
        }
        return message;
    }

    private char _find(char c, char k){
        int position = 0;
        for( int i = 0; i < _alphabet.length; i++ ){
            char j = _alphabet[i];
            if( _tabula[k][j] == c ){
                return j;
            }
        }
        return ' ';
    }

    unittest{
        Autokey a = new Autokey();
        string message = "MEETATTHEFOUNTAIN";
        string key = "KILT";
        string test = "WMPmMXXaEYhbRYOca";

        string cipher = a.encode(message, key);
        assert(test == cipher);
    }

    unittest{
        Autokey a = new Autokey();
        string cipher = "WMPmMXXaEYhbRYOca";
        string key = "KILT";
        string test = "MEETATTHEFOUNTAIN";
        string message = a.decode(cipher, key);
        assert(test == message);
    }
}
