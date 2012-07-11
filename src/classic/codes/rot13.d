module classic.codes.rot13;

import std.string;

class Rot13{
    private string _alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz !@#$%^&*()_+-=[]\\{}|;':\",./<>?";
    private string _reverse =  "?></.,\":';|}{\\][=-+_)(*&^%$#@! zyxwvutsrqponmlkjihgfedcbaZYXWVUTSRQPONMLKJIHGFEDCBA";

    public string encode( string message ){
        string cipher = "";
        foreach( char c ; message ){
            int position = indexOf(_alphabet, c);
            cipher ~= _reverse[position];
        }
        return cipher;
    }
    public string decode( string cipher ){
        string message = "";
        foreach( char c ; cipher ){
            int position = indexOf(_reverse, c);
            message ~= _alphabet[position];
        }
        return message;
    }

    unittest{
        Rot13 r = new Rot13();
        string message = "HELLOWORLD";
        string cipher = r.encode(message);
        assert(cipher == ":.}}]*]-}/" );
    }
    unittest{
        Rot13 r = new Rot13();
        string cipher = ":.}}]*]-}/";
        string message = r.decode(cipher);
        assert(message == "HELLOWORLD" );
    }

    unittest{
        Rot13 r = new Rot13();
        string message = "helloworld";
        string cipher = r.encode(message);
        assert(cipher == "x ttqiqnt!" );
    }
    unittest{
        Rot13 r = new Rot13();
        string cipher = "x ttqiqnt!";
        string message = r.decode(cipher);
        assert(message == "helloworld" );
    }
    unittest{
        Rot13 r = new Rot13();
        string message = "Hello, World!";
        string code = r.encode(message);
        assert(code == ": ttqFe*qnt!d");
    }
    unittest{
        Rot13 r = new Rot13();
        string code = ": ttqFe*qnt!d";
        string message = r.decode(code);
        assert(message == "Hello, World!");
    }
}
