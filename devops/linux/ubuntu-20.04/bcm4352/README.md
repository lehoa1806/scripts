# Mount USB installer as a repository
```bash
mkdir /media/cdrom
mount --bind /media/User/Ubuntu\ 20.04.3\ LTS\ amd64/ /media/cdrom
```
# Install dependencies and BCM driver
```bash
sudo dpkg -i libc6-dev_2.31-0ubuntu9_amd64.deb 
sudo apt-get install -f
sudo dpkg -i linux-libc-dev_5.4.0-94.106_amd64.deb
sudo apt-get install -f
sudo apt-get install fakeroot
sudo dpkg -i dctrl-tools_2.24-3_amd64.deb
sudo apt-get install dkms
sudo dpkg -i bcmwl-kernel-source_6.30.223.271+bdcom-0ubuntu7~20.04.3_amd64.deb
sudo apt-get install -f
```
