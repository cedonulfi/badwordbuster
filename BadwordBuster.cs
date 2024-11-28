using System;
using System.Net.Http;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        // Input text to be checked
        string inputText = "Your input text goes here";

        // Create the prompt for Pollinations AI
        string prompt = $"Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"{inputText}\"";

        // Pollinations API URL
        string apiUrl = $"https://text.pollinations.ai/{Uri.EscapeDataString(prompt)}";

        using (HttpClient client = new HttpClient())
        {
            try
            {
                // Send GET request
                var response = await client.GetStringAsync(apiUrl);

                // Analyze the response to determine if it's a bad word or safe
                if (response.ToLower().Contains("badword"))
                {
                    Console.WriteLine("The input contains bad words or inappropriate content.");
                }
                else
                {
                    Console.WriteLine("The input is safe and does not contain bad words.");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"Error: {e.Message}");
            }
        }
    }
}
