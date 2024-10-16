Here is the translation of your script into English:

```bash
#!/usr/bin/bash

# Define the local directory
ANIMES_DIR="$HOME/Animes"
CONFIG_FILE="./infos.jsonc"  # Specifies the path to your infos.json file on the host

# Check if the local directory exists
if [ ! -d "$ANIMES_DIR" ]; then
  echo "The directory $ANIMES_DIR does not exist. Creating the directory."
  mkdir -p "$ANIMES_DIR"
  echo "Directory $ANIMES_DIR successfully created."
else
  echo "The directory $ANIMES_DIR already exists."
fi

# Check if the configuration file infos.json exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Error: The configuration file $CONFIG_FILE does not exist. Please create it before running the container."
  exit 1
else
  echo "The configuration file $CONFIG_FILE was found."
fi

# Run docker with configuration file mounting
docker run -it --rm -v "$ANIMES_DIR:/app/src/Animes" -v "$CONFIG_FILE:/app/infos.jsonc" anime-fetcher-docker:latest

# Set proper permissions for the anime directory
echo "Modifying permissions for the $ANIMES_DIR directory..."
sudo chown -R $USER:$(id -gn) "$ANIMES_DIR"
echo "Permissions successfully modified for $ANIMES_DIR."
```
