import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class BadwordBuster {

    public static void main(String[] args) {
        try {
            // Input text to be checked
            String inputText = "Your input text goes here";

            // Create the prompt for Pollinations AI
            String prompt = "Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"" + inputText + "\"";

            // Pollinations API URL
            String apiUrl = "https://text.pollinations.ai/" + URLEncoder.encode(prompt, "UTF-8");

            // Send GET request
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Analyze the response to determine if it's a bad word or safe
            if (response.toString().toLowerCase().contains("badword")) {
                System.out.println("The input contains bad words or inappropriate content.");
            } else {
                System.out.println("The input is safe and does not contain bad words.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
