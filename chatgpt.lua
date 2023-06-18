local url = "http://127.0.0.1:8000/minecraft"

function wipe()
    term.clear()
    term.setCursorPos(1, 1)
end

wipe()

term.setTextColor(colors.orange)

print("")
print("   _|_|_| _|                  _|      _|_|_|  _|_|_| _|_|_| ")
print(" _|       _|_|_|     _|_|_| _|_|_|_| _|       _|  _|   _|   ")
print(" _|       _|    _| _|    _|   _|     _|  _|_| _|_|_|   _|   ")
print(" _|       _|    _| _|    _|   _|     _|    _| _|       _|   ")
print("   _|_|_| _|    _|   _|_|_|    _|_|   _|_|_|  _|       _|   ")
print("")
term.setTextColor(colors.lightGray)
print("Send messages to ChatGPT. Type \"exit\" to go back to terminal.")
print("")

while true do
    term.setTextColor(colors.magenta)
    io.write("<me> ")
    term.setTextColor(colors.white)
    local message = io.read()
    
    if message == "exit" then
        wipe()
        break
    end
    
    local body = textutils.serialiseJSON({question = message})
    local response = http.post(url, body, headers)
    
    if response then
        local body = response.readAll()
        local answer = textutils.unserialiseJSON(body)
        term.setTextColor(colors.lime)
        io.write("<ChatGPT> ")
        term.setTextColor(colors.white)
        print(answer.message)
        print("")
        
        response.close()
    else
        print("Failed to connect to the server.")
    end
end
