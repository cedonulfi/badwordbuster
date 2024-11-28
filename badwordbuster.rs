use reqwest::blocking::get;
use reqwest::Error;

fn main() -> Result<(), Error> {
    // Input text to be checked
    let input_text = "Your input text goes here";

    // Create the prompt for Pollinations AI
    let prompt = format!("Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"{}\"", input_text);

    // Pollinations API URL
    let api_url = format!("https://text.pollinations.ai/{}", urlencoding::encode(&prompt));

    // Send GET request
    let response = get(&api_url)?.text()?;

    // Analyze the response to determine if it's a bad word or safe
    if response.to_lowercase().contains("badword") {
        println!("The input contains bad words or inappropriate content.");
    } else {
        println!("The input is safe and does not contain bad words.");
    }

    Ok(())
}
