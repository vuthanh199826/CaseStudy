package model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {
    public static  final String NUMBER_REGEX = "^[0-9]{1,}$";

    public Validate() {
    }

    public boolean validate(String str, String REGEX){
        Pattern pattern = Pattern.compile(REGEX);
        Matcher matcher = pattern.matcher(str);
        return matcher.matches();
    }
}
