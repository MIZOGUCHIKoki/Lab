import java.nio.charset.StandardCharsets;

public class toAscii {
    public static void main(String[] args) {

        String s = "abcdefg";

        char[] c = s.toCharArray();
        Int[] toAscii = new int[s.length];

        for (int i = 0; i < s.legth; i++) {
            toAscii[i] = (int) c[i];
            System.out.println(toAscii[i]);
        }
    }
}