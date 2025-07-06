import httpclient, json
proc openai*(apiUrl: string, apiKey:string, prompt:string, model:string): string =
    let requestBody = %*{
        "model": model,
        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ]
    }
    var client = newHttpClient()
    client.headers = newHttpHeaders({
        "Content-Type": "application/json",
        "Authorization": "Bearer " & apiKey
    })
    try:
        let response = client.request(
            apiUrl,
            httpMethod = HttpPost,
            body = $requestBody
        )
        let parsedResponse = parseJson(response.body)
        return parsedResponse["choices"][0]["message"]["content"].getStr()
    except HttpRequestError as e:
        return "Request failed: " & e.msg