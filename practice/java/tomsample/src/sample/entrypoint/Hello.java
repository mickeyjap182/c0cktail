package sample.entrypoint;

import values.users.Gender.genderList;
import entities.User;

import java.util.HashMap;

public class Hello {
    public static String show() {
        return "Hello! World!";
    }

    public static String tester() {
        StringBuffer message = new StringBuffer("");

        for( genderList gen : genderList.values()) {
            message.append(gen.cd() + ":" + gen.genderName() + "<br>");
        }
        return message.toString();
    }


    public static HashMap<String, User> getList() {

        User ken = new User();
        ken.name = "Ken Sato";
        ken.genderCd = genderList.MALE.cd();
        ken.id = 10001;

        User hanako = new User();
        hanako.name = "Hanako Yamada";
        hanako.genderCd = genderList.FEMALE.cd();
        hanako.id = 10002;
        User xss = new User();
        xss.name = "XSS Tester<input type='text' name='xss'>";
        xss.genderCd = genderList.OTHER.cd();
        xss.id = 10003;

        HashMap<String, User> userList = new HashMap<>();
        userList.put("Ken", ken);
        userList.put("Hanako", hanako);
        userList.put("xss", xss);

        return userList;
    }
}
