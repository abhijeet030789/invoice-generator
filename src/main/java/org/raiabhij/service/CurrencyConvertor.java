package org.raiabhij.service;
/**
 * Created by raiabhij on 8/19/2017.
 */
public class CurrencyConvertor {
    private static String string;
    private static String st1[] = { "", "One", "Two", "Three", "Four", "Five", "Six", "Seven",
            "Eight", "Nine", };
    private static String st2[] = { "Hundred", "Thousand", "Lakh", "Crore" };
    private static String st3[] = { "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen",
            "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Ninteen", };
    private static String st4[] = { "Twenty", "Thirty", "Fourty", "Fifty", "Sixty", "Seventy",
            "Eighty", "Ninty" };

    private static String convert(int number) {
        int n = 1;
        int word;
        string = "";
        while (number != 0) {
            switch (n) {
                case 1:
                    word = number % 100;
                    pass(word);
                    if (number > 100 && number % 100 != 0) {
                        show("and ");
                    }
                    number /= 100;
                    break;

                case 2:
                    word = number % 10;
                    if (word != 0) {
                        show(" ");
                        show(st2[0]);
                        show(" ");
                        pass(word);
                    }
                    number /= 10;
                    break;

                case 3:
                    word = number % 100;
                    if (word != 0) {
                        show(" ");
                        show(st2[1]);
                        show(" ");
                        pass(word);
                    }
                    number /= 100;
                    break;

                case 4:
                    word = number % 100;
                    if (word != 0) {
                        show(" ");
                        show(st2[2]);
                        show(" ");
                        pass(word);
                    }
                    number /= 100;
                    break;

                case 5:
                    word = number % 100;
                    if (word != 0) {
                        show(" ");
                        show(st2[3]);
                        show(" ");
                        pass(word);
                    }
                    number /= 100;
                    break;

            }
            n++;
        }
        return string;
    }

    private static void pass(int number) {
        int word, q;
        if (number < 10) {
            show(st1[number]);
        }
        if (number > 9 && number < 20) {
            show(st3[number - 10]);
        }
        if (number > 19) {
            word = number % 10;
            if (word == 0) {
                q = number / 10;
                show(st4[q - 2]);
            } else {
                q = number / 10;
                show(st1[word]);
                show(" ");
                show(st4[q - 2]);
            }
        }
    }

    private static void show(String s) {
        String st;
        st = string;
        string = s;
        string += st;
    }

    public static String getAmountInWords(double amount){
        int rupees = (int) Math.floor( amount );
        int paise = (int) Math.floor( ( amount - rupees ) * 100.0f ) ;
        String paiseInWords = convert(paise);
        if(!"".equals(paiseInWords)){
            return convert(rupees) + " rupees and "+ convert(paise) + " paise only";
        }
        return "Rupees " + convert(rupees) + "  only";
    }

    public static void main(String[] args) {
        System.out.println(getAmountInWords(152345555.8778));
    }
}