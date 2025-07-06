import ../src/chat/ollama
let model = "gemma3:1b"
let prompt = "我想知道Strawberry中有几个r？"
var response = ollama(model, prompt)
echo "response:", response