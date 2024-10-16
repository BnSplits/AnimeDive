---

# Anime Fetcher

Anime Fetcher is a program for downloading anime using Puppeteer to retrieve episodes from the site [anime-sama.fr](https://anime-sama.fr) and Mega to store the files.

## Prerequisites

Before you begin, make sure you have the following installed on your machine:

- **Docker**
- **Docker Buildx** (only necessary for Linux systems)

   > **Note**: If you are using another operating system (such as Windows or macOS), Docker Buildx is not required for building images.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/BnSplits/anime_fetcher.git
   cd anime_fetcher
   ```

2. **Prepare the configuration file:**

   Before building the Docker image, you need to create a `infos.jsonc` configuration file with your MEGA login information. Place this file in the root of the project with the following content:

   ```jsonc
   {
     "mail": "your-email@mail.com",
     "psw": "your-password"
   }
   ```

3. **Build the Docker image:**

   Use the `build-docker.sh` script to build the Docker image:

   ```bash
   ./build-docker.sh
   ```

   This script uses Docker Buildx to create the image with the tag `anime-fetcher-docker:latest`.

   > **Note for Linux users**: Docker Buildx is required to build the image on Linux. For other systems, Docker Buildx is not required.

   > **Additional note**: If you want to export this Docker image after building it, use the `./export-docker.sh` script.

## Usage

1. **Import an existing Docker image (optional):**

   If you already have an exported Docker image, you can import it before running the program. Use the `./import-docker.sh` script to load the exported image:

   ```bash
   ./import-docker.sh
   ```

2. **Run the Docker container:**

   Before running the container, ensure that the `infos.jsonc` configuration file is present. Use the `launch-docker.sh` script to start the container:

   ```bash
   ./launch-docker.sh
   ```

   This script checks for the local directory for episodes (`~/Animes`) and the configuration file. It will mount these elements into the container and execute the program.

   ### Note for Windows users

   On Windows, the `$HOME/Animes/` folder does not exist natively. Make sure to define a valid path to store the episodes by modifying the script or using a path like `C:/Users/[YourUser]/Animes/` when running the container. For example, you can mount a specific directory into the container as follows:

   ```bash
   docker run -it --rm -v "C:/Users/[YourUser]/Animes:/app/src/Animes ..."
   ```

   This will create the necessary folder for downloads on a Windows system.

3. **Interacting with the program:**

   The program will guide you through the following steps:

   - Enter the name of the anime you want to download.
   - Select the season or movie.
   - Choose between VF and VOSTFR (if available).
   - Select the episodes to download.
   - Choose whether to keep the episodes locally or only on Mega.

## License

This project is licensed under the [MIT](https://opensource.org/licenses/MIT) license.

---
