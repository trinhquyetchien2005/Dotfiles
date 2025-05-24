#!/bin/bash

set -e

# === CAP NHAT HE THONG ===
echo "[+] Cap nhat he thong..."
sudo apt update && sudo apt upgrade -y

# === APT: Cong cu he thong ===
echo "[+] Cai dat cac cong cu bang apt..."
sudo apt install -y git zsh curl wget unzip zip build-essential \
  software-properties-common ca-certificates gnupg lsb-release \
  python3 python3-pip default-jdk adb redis-server tree neovim \
  fonts-firacode

# === SDKMAN: Java, Kotlin, Spring Boot ===
if [ ! -d "$HOME/.sdkman" ]; then
  echo "[+] Cai SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
sdk install java 21-tem && sdk install kotlin && sdk install gradle && sdk install springboot

# === Homebrew ===
if ! command -v brew &> /dev/null; then
  echo "[+] Cai Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# === BREW: CLI hien dai ===
echo "[+] Cai cong cu CLI bang brew..."
brew install starship fzf bat exa lazygit lazydocker docker-compose oh-my-posh

# === SNAP: IDE ===
echo "[+] Cai dat IDE bang snap..."
sudo snap install code --classic
sudo snap install intellij-idea-community --classic
sudo snap install android-studio --classic

# === Docker ===
echo "[+] Cai Docker chinh thuc..."
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER

# === LazyVim ===
echo "[+] Cai LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim

# === GRUB Theme ===
echo "[+] Cai theme GRUB..."
sudo apt install grub2-theme-starfield

# === WezTerm ===
echo "[+] Cai WezTerm..."
brew install --cask wezterm

# === Cai Zsh, Oh-My-Zsh, Starship ===
echo "[+] Cai Zsh + Oh My Zsh + Starship..."
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# === Cai them mot so plugin cho Zsh ===
echo "[+] Cai zsh-autosuggestions + zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Cap nhat plugins vao ~/.zshrc
sed -i 's/^plugins=(/plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ~/.zshrc

# === Reload ===
echo "[+] Cai dat hoan tat. Vui long restart hoac chay 'source ~/.zshrc'"
echo ">>> Ready to rock!"

