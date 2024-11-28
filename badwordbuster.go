package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"net/url"
)

func main() {
	// Input text to be checked
	inputText := "Your input text goes here"

	// Create the prompt for Pollinations AI
	prompt := fmt.Sprintf("Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"%s\"", inputText)

	// Pollinations API URL
	apiUrl := fmt.Sprintf("https://text.pollinations.ai/%s", url.QueryEscape(prompt))

	// Send GET request
	resp, err := http.Get(apiUrl)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer resp.Body.Close()

	// Read the response
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("Error reading response:", err)
		return
	}

	// Analyze the response to determine if it's a bad word or safe
	if string(body) == "badword" {
		fmt.Println("The input contains bad words or inappropriate content.")
	} else {
		fmt.Println("The input is safe and does not contain bad words.")
	}
}
