module ciphers.classic.atbash;

import std.string;

class Atbash{
    private string _alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz `1234567890-=[]\\;',./~!@#$%^&*()_+{}|:\"<>?";
    private string _reverse = "";

    public this( ){
        int size = _alphabet.length - 1;
        for( int i = 0; i < size; i++){
            _reverse ~= _alphabet[size - i];
        }
    }

    public string encode(string message){
        string cipher = "";
        foreach( char c; message ){
            int position = indexOf(_alphabet,c);
            cipher ~= _reverse[position];
        }
        return cipher;
    }

    public string decode(string cipher){
        string message = "";
        foreach( char c; cipher ){
            int position = indexOf(_reverse, c);
            message ~= _alphabet[position];
        }
        return message;
    }
}
