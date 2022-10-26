import java.io.*;
import java.net.*;

public class SASC {
    public static void main(String[] args) {
        // クライアントソケットを生成

        try (Socket socket = new Socket("localhost", 10000);
                PrintWriter writer = new PrintWriter(socket.getOutputStream(), true);
                BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                // キーボード入力用のリーダーの作成
                BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in))) {

            // 「exit」を入力するまで繰り返し
            while (true) {
                System.out.print("Password >");
                String input = keyboard.readLine();
                writer.println(input);
                if (input.equals("exit")) {
                    break;
                }
                System.out.println("[Authentication]" + reader.readLine());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}