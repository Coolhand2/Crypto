module ciphers.classic.caesar;

import std.string;

class Caesar{
    private string _alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz `1234567890-=[]\\;',./~!@#$%^&*()_+{}|:\"<>?";
    private string _substitute = "";

    public string encode(string message, int shift){
        _createSubs(shift);
        string cipher = "";
        foreach(char c; message){
            int position = indexOf(_alphabet, c);
            cipher ~= _substitute[position];
        }
        return cipher;
    }

    public string decode(string cipher, int shift){
        _createSubs(shift);
        string message = "";
        foreach( char c; cipher){
            int position = indexOf(_substitute, c);
            message ~= _alphabet[position];
        }
        return message;
    }

    private void _createSubs(int shift){
        _substitute = "";
        for(int i = 0; i < _alphabet.length; i++){
            _substitute ~= _alphabet[(i+shift)%_alphabet.length];
        }
    }

    unittest{
        Caesar c = new Caesar();
        string message = "THEQUICKBROWNFOXJUMPEDOVERTHELAZYDOG";
        string test = "WKHTXLFNEURZQIRaMXPSHGRYHUWKHODcbGRJ";
        int shift = 3; //Hey, it's what Caesar used himself!
        string cipher = c.encode(message, shift);
        assert(cipher == test);
    }
    unittest{
        Caesar c = new Caesar();
        string cipher = "WKHTXLFNEURZQIRaMXPSHGRYHUWKHODcbGRJ";
        string test = "THEQUICKBROWNFOXJUMPEDOVERTHELAZYDOG";
        int shift = 3;
        string message = c.decode(cipher, shift);
        assert(message == test);
    }
}
