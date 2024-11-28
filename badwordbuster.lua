local http = require("socket.http")
local url = require("socket.url")

-- Input text to be checked
local input_text = "Your input text goes here"

-- Create the prompt for Pollinations AI
local prompt = string.format("Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"%s\"", input_text)

-- Pollinations API URL
local api_url = "https://text.pollinations.ai/" .. url.escape(prompt)

-- Send GET request
local response, status = http.request(api_url)

if status == 200 then
    -- Analyze the response to determine if it's a bad word or safe
    if string.lower(response):find("badword") then
        print("The input contains bad words or inappropriate content.")
    else
        print("The input is safe and does not contain bad words.")
    end
else
    print("Error: Unable to process the request.")
end
