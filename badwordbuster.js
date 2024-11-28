const axios = require('axios');

// Input text to be checked
const inputText = "Your input text goes here";

// Create the prompt for Pollinations AI
const prompt = `Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': "${inputText}"`;

// Pollinations API URL
const apiUrl = `https://text.pollinations.ai/${encodeURIComponent(prompt)}`;

// Make the API request
axios.get(apiUrl)
  .then(response => {
    // Analyze the response to determine if it's a bad word or safe
    if (response.data.toLowerCase().includes('badword')) {
      console.log("The input contains bad words or inappropriate content.");
    } else {
      console.log("The input is safe and does not contain bad words.");
    }
  })
  .catch(error => {
    console.error(`Error: ${error}`);
  });
