# Ubuntu 20.04
## 1. Environments
```bash
# Check if java was installed
type -p java

# Search for available java packages
sudo apt search openjdk

# Install openjdk-11-jdk (check for [supported java versions](https://www.jenkins.io/doc/administration/requirements/java/))
sudo apt install openjdk-11-jdk

# Check installed java version
java -version
```
## 2. Installing Jenkins
```bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update && sudo apt install jenkins
```
## 3. Starting Jenkins
```bash
sudo systemctl start jenkins
sudo systemctl status jenkins
```
## 4. Setup firewall
```bash
sudo ufw allow 8080
```
### 5. Authenticate at the first access
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
