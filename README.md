# cc-chatgpt

![Cover Image](./cover.png)

## Introduction
  
ChatGPT program to the ComputerCraft mod (Minecraft).  
In CC there are Lua script files, and the mod uses the HTTP API to communicate with programs which are outside of Minecraft.  
Therefore I wrote a local "server" (server.py) in Python which handles the HTTP requests and returns the response from ChatGPT into the game.
  
## Prerequisites
  
- OpenAI API key
- Python
- Python modules:
  - flask
  - dotenv
  - openai
  
## Installation
  
Install Python3 from the [Python website](https://www.python.org/)
  
```bash
# Whith pip you can install the necessary modules
pip install Flask
pip install python-dotenv
pip install openai
```
  
```bash
# Clone the repository into a folder of your choice
git clone https://github.com/eldiankyo/cc-chatgpt.git
```
  
Inside the folder root create a .env file with this content:

```bash
# Paste your OpenAI API key instead of YOUR_API_KEY. No need to put apostrofes or any symboles around.
API_KEY=YOUR_API_KEY
```
Open your Minecraft folder (On Windows it's inside APPDATA, on Unix/Linux it's ~/.minecraft)
- Copy the "chatgpt.lua" file into "minecraft-folder/saves/your-world/computercraft/0" folder
- The numbered folders (0, 1, 2...) represents the ingame computers of ComputerCraft.
  
Open the "minecraft-folder/saves/your-world/serverconfig/computercraft-server.toml" file, and add these lines to whitelist our server:
  
```bash
# You can modify the IP address here if you don't want to use this hard coded one, but then don't forget to modify the one in the "server.py" file too!
	[[http.rules]]
		host = "127.0.0.0/8"
		action = "allow"

	[[http.rules]]
		host = "$private"
		action = "deny"
```

Now you can run the server file in a terminal window:
```bash
python server.py
#or
python3 server.py
```

And in the on a computer which has the "chatgpt.lua" file:
```bash
chatgpt
```

Have fun!
