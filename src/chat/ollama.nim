import httpclient, json

proc ollama*(model: string, prompt: string): string =
    let requestBody = %*{
        "model": model,
        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ],
        "stream": false
    }
    var client = newHttpClient()
    try:
        let response = client.request(
            "http://localhost:11434/api/chat",
            httpMethod = HttpPost,
            body = $requestBody,
        )
        return response.body
        #let parsedResponse = parseJson(response.body)
        #return parsedResponse["message"]["content"].getStr()
    except JsonParsingError as e:
        return e.msg