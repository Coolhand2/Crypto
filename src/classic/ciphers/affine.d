module classic.ciphers.affine;

import std.string;
import std.random;
import std.stdio;

class Affine{
    string _alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz `1234567890-=[]\\;',./~!@#$%^&*()_+{}|:\"<>?";
    string _substitute = "";
    int _a = 0;
    int _m = 0;
    public this( ){
        _m = _alphabet.length;
        _a = _coprime();
    }

    public string encode(string message, int shift){
        string cipher = "";
        _createSubs(shift);
        foreach( char c; message ){
            int position = indexOf(_alphabet, c);
            cipher ~= _substitute[position];
        }
        return cipher;
    }
    public string decode(string cipher, int shift){
        string message = "";
        _createSubs(shift);
        foreach( char c; cipher ){
            int position = indexOf(_substitute, c);
            message ~= _alphabet[position];
        }
        return message;
    }

    public int getCoprime(){
        return _a;
    }
    public void setCoprime(int a){
        _a = a;
    }

    private void _createSubs(int b){
        _substitute = "";
        for( int x = 0; x < _alphabet.length; x++ ){
            _substitute ~= _alphabet[((_a*x)+b)%_m];
        }
    }

    private int _coprime(){
        int[] coprimes = [];
        for( int i = 0; i < _m; i++ ){
            if( _gcd(i, _m) == 1 )
                coprimes ~= i;
        }
        return coprimes[uniform(0, coprimes.length)];
    }

    private int _gcd(int i, int m){
        if( m == 0 )
            return i;
        else
            return _gcd(m, i %m);
    }

    unittest{
        Affine a = new Affine();
        string message = "AFFINECIPHER";
        string test = "Ihhw/cSw(rc>";
        a.setCoprime(5);
        string cipher = a.encode(message, 8);
        assert(cipher == test);
    }

    unittest{
        Affine a = new Affine();
        string cipher = "Ihhw/cSw(rc>";
        string test = "AFFINECIPHER";
        a.setCoprime(5);
        string message = a.decode(cipher, 8);
        assert(message == test);
    }
}
