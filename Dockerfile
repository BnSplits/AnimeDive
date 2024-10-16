# Uses the official Arch Linux image as the base
FROM archlinux:latest

# Updates the system and installs basic dependencies
RUN pacman -Syu --noconfirm

# Installs Node.js LTS Iron, npm, Puppeteer, and required system dependencies
RUN pacman -S --noconfirm nodejs-lts-iron wget npm aria2 nss atk libcups libxss mesa alsa-lib pango cairo gtk3 \
    && pacman -Scc --noconfirm

# Installs megacmd
RUN wget https://mega.nz/linux/repo/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.zst && pacman -U --noconfirm "$PWD/megacmd-x86_64.pkg.tar.zst"

# Sets the working directory inside the container
WORKDIR /app

# Copies package.json and package-lock.json files (if present)
COPY src/package*.json ./src/

# Installs Node.js dependencies
RUN npm install --prefix ./src

# Copies the rest of the project files into the container
COPY . .

# Defines the command to run when the container starts
CMD ["node", "./src/script.js"]
