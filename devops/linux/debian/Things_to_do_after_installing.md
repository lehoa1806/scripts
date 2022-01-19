### 1. Update sources.list - Debian 10/Buster
```bash
sudo nano /etc/apt/sources.list
```
```text
# Main and Non-free
deb http://deb.debian.org/debian bullseye main contrib non-free
deb-src http://deb.debian.org/debian bullseye main contrib non-free

deb http://deb.debian.org/debian-security/ bullseye-security main contrib non-free
deb-src http://deb.debian.org/debian-security/ bullseye-security main contrib non-free

deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free

# Backport (from testing and unstable branches - not recommended),  Main and Non-free
# deb http://deb.debian.org/debian bullseye-backports main contrib non-free
# deb-src http://deb.debian.org/debian bullseye-backports main contrib non-free
```
### 2. Update
```bash
sudo apt update
sudo apt upgrade
```
### 3. Install core packages
```bash
sudo apt install apt-transport-https build-essential bzip2 ca-certificates curl fcitx-unikey git gnupg libbz2-dev libffi-dev liblzma-dev libncurses5-dev libncursesw5-dev libreadline-dev libreadline6-dev libsqlite3-dev libssl-dev llvm make openssl python-openssl tk-dev vim wget xz-utils zlib1g-dev zplug zsh
```
### 4. Install sys packages
Install TLP (laptop only)
```bash
sudo apt install tlp
sudo tlp start
```
Common commands:
```bash
# Show detailed system information and status of the TLP utility
sudo tlp-stat -s

# Show configuration parameters
sudo tlp-stat -c

# Show battery details
sudo tlp-stat -b
```
Install Nvidia gpu driver and Atheros wifi (PC only)
```bash
sudo apt -y install nvidia-detect
nvidia-detect
sudo apt install nvidia-driver
sudo apt-get install firmware-atheros
```
(reboot)
### 5. Install fcitx-unikey
```bash
sudo apt install fcitx-unikey

im-config -n fcitx
```
### 6. Install ZSH
```bash
export USER='hoalee1806'
chsh -s /usr/bin/zsh $USER

# Oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Set theme then restart terminal to install the theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/^ZSH_THEME.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo apt install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
Edit/update .zshrc (using this .zshrc template)
### 7. Install core apps
```bash
sudo apt install terminator goldendict thunderbird plank

# Brave browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Chromium
sudo apt install chromium

# Sublime text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text
```
```text
Chrome
Microsoft Edge
Opera
Vivaldi

Dropbox
Skype
Slack
```
### 8. Working tools
```bash
# pgAdmin 4
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
sudo apt update
sudo apt install pgadmin4
```
```text
# DBeaver
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
Pycharm

# Visual studio Code
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
```
### 9. Disable Suspend and Hibernation
```bash
# Check status
sudo systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target

# Disable
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# Enable
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```
### 10. Slack on Bullseye
```bash
wget http://ftp.us.debian.org/debian/pool/main/libi/libindicator/libindicator3-7_0.5.0-4_amd64.deb
wget http://ftp.us.debian.org/debian/pool/main/liba/libappindicator/libappindicator3-1_0.4.92-7_amd64.deb
sudo apt install ./libindicator3-7_0.5.0-4_amd64.deb
sudo apt install ./libappindicator3-1_0.4.92-7_amd64.deb
```
