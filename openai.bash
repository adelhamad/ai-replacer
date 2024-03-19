userInput="$@"

# Escape backslashes first
escapedInput="${userInput//\\/\\\\}"
# Escape double quotes
escapedInput="${escapedInput//\"/\\\"}"
# Escape newlines (replace newline with \n)
escapedInput="${escapedInput//$'\n'/\\n}"

# Define API key and model as variables
apiKey="sk-XXXXXXXX"
aiModel="gpt-3.5-turbo"
systemPrompt="You are a rude and funny assistant"


result=$(curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $apiKey" \
  -d "{
    \"model\": \"$aiModel\",
    \"messages\": [
      {
        \"role\": \"system\",
        \"content\": \"$systemPrompt\"
      },
      {
        \"role\": \"user\",
        \"content\": \"${escapedInput}\"
      }
    ]
  }"
)
echo $result