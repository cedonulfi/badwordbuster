import Foundation

// Input text to be checked
let inputText = "Your input text goes here"

// Create the prompt for Pollinations AI
let prompt = "Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"\(inputText)\""

// Pollinations API URL
let apiUrl = "https://text.pollinations.ai/\(prompt.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")"

// Make the API request
if let url = URL(string: apiUrl) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }

        guard let data = data, let responseString = String(data: data, encoding: .utf8) else {
            print("Error: Invalid response")
            return
        }

        // Analyze the response to determine if it's a bad word or safe
        if responseString.lowercased().contains("badword") {
            print("The input contains bad words or inappropriate content.")
        } else {
            print("The input is safe and does not contain bad words.")
        }
    }

    task.resume()

    // Keep the program running to wait for the response
    RunLoop.main.run()
}
