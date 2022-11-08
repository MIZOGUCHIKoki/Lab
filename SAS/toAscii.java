import java.nio.charset.StandardCharsets;

public class toAscii {
    public static void main(String[] args) {

        String password = "pw";
        int key = 1234;

        char[] passwordC = password.toCharArray();
        int[] toAscii = new int[passwordC.length];

        StringBuilder buf1 = new StringBuilder();
        StringBuilder buf2 = new StringBuilder();

        String plain;
        int cryptogram;

        for (int i = 0; i < passwordC.length; i++) {
            toAscii[i] = (int) passwordC[i];
            buf1.append(toAscii[i]);
            // System.out.println("Plain: " + toAscii[i]);
            int j = toAscii[i] ^ key;
            buf2.append(j);
            // System.out.println("Encrypto: " + j);
            // j = key ^ j;
            // System.out.println("Decrypto: " + j);
            // System.out.println();
        }
        plain = buf1.toString();
        System.out.println("plain: " + buf1.toString());
        System.out.println("Cryptogram: " + buf2.toString());
    }
}