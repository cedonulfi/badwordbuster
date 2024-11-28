import requests

# Input text to be checked
input_text = "Your input text goes here"

# Create the prompt for Pollinations AI
prompt = f"Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"{input_text}\""

# Pollinations API URL
api_url = f"https://text.pollinations.ai/{requests.utils.quote(prompt)}"

# Make the API request
response = requests.get(api_url)

# Check if the request was successful
if response.status_code != 200:
    print(f"Error: {response.status_code}")
    exit()

# Analyze the response to determine if it's a bad word or safe
if 'badword' in response.text.lower():
    print("The input contains bad words or inappropriate content.")
else:
    print("The input is safe and does not contain bad words.")
