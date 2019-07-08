package values.users;

public class Gender {
    public enum genderList {
        MALE("男", "01"),
        FEMALE("女", "02"),
        OTHER("他", "05");

        private String name;
        private String cd;

        genderList(String name, String cd){
            this.name = name;
            this.cd = cd;
        }
        public String genderName() {
            return this.name;
        }
        public String cd() {
            return this.cd;
        }
    }

}
