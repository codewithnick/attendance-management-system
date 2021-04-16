/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class Format {
    public static String  Encode(String s)
    {
        String enc="";
        char ch;
        for (int i=0;i<s.length();i++){
            ch=s.charAt(i);
            ch=(char)((int)ch+4);
            if(ch>90){
                ch=(char)((int)ch-26);
                System.out.print(ch);
                enc=enc+ch;
            }
            
            }
        return enc;
        }
    public static String Decode(String s)
    {
        String dec="";
        char ch;
        for(int i=0;i<s.length();i++){
            ch=s.charAt(i);
            ch=(char)((int)ch-4);
            if(ch<64){
                ch=(char)((int)ch+26);
                System.out.print(ch);
                dec=dec+ch;
            }
                    
        }
        return dec;
        
    }
    
    public static void main(String [] args){
        String GG=Encode("shivam");
        String GG2=Decode(GG);
        System.out.println(GG);
        System.out.println(GG2);


    }
}

