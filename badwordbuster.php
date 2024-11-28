<?php
// Define the input text to be checked
$inputText = "Your input text goes here";

// Create the prompt for Pollinations AI
$prompt = "Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"$inputText\"";

// Pollinations API URL
$apiUrl = "https://text.pollinations.ai/" . urlencode($prompt);

// Initialize cURL
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute the cURL request and get the response
$response = curl_exec($ch);

// Check for any cURL errors
if (curl_errno($ch)) {
    echo "Error: " . curl_error($ch);
    curl_close($ch);
    exit;
}

curl_close($ch);

// Analyze the AI response to determine if it's a bad word or safe
$isBadWord = analyzeResponse($response);

// Display the result
if ($isBadWord) {
    echo "The input contains bad words or inappropriate content.";
} else {
    echo "The input is safe and does not contain bad words.";
}

/**
 * Function to analyze the AI response and check for bad words
 * @param string $response
 * @return bool
 */
function analyzeResponse($response)
{
    // Check if the AI response contains the word "badword"
    if (stripos($response, "badword") !== false) {
        return true; // Bad word found in the response
    }

    return false; // No bad words found
}
?>
