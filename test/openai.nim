import ../src/chat/openai

const apiUrl = "https://openrouter.ai/api/v1/chat/completions"
let apiKey = "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"
let prompt = ""
let model = "meta-llama/llama-3.3-8b-instruct:free"
var response = openai(apiUrl, apiKey, prompt, model)
echo "Response:\n", response