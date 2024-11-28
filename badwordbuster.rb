require 'net/http'
require 'uri'
require 'json'

# Input text to be checked
input_text = "Your input text goes here"

# Create the prompt for Pollinations AI
prompt = "Is the following text contain bad words, racism, bullying, or inappropriate content? Please answer 'badword' if it contains bad words and explain why. If it's safe, answer 'safe': \"#{input_text}\""

# Pollinations API URL
uri = URI.parse("https://text.pollinations.ai/#{URI.encode(prompt)}")

# Make the API request
response = Net::HTTP.get(uri)

# Analyze the response to determine if it's a bad word or safe
if response.downcase.include?('badword')
  puts "The input contains bad words or inappropriate content."
else
  puts "The input is safe and does not contain bad words."
end
