```bash
sudo apt-get update && sudo apt-get upgrade && sudo apt install mysql-server vim
sudo mysql_secure_installation
sudo mysql
"""""
" CREATE USER 'phabricator'@'localhost' IDENTIFIED BY 'XXXXXXXX'
" GRANT ALL PRIVILEGES ON * . * TO 'phabricator'@'localhost';
"""""

sudo vim /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2.service

cd ~/phabricator/
./bin/config set mysql.host localhost
./bin/config set mysql.port 3306
./bin/config set mysql.user phabricator 
./bin/config set mysql.pass XXXXXXXX
./bin/storage upgrade

./bin/phd start
./bin/config set phabricator.base-uri https://phabricator.yourdomain.com/

# Open phabricator url on webbrowser and create the first admin account
./bin/auth recover hoa  # verify that account
./bin/auth verify hoa@yourdomain.com
./bin/auth lock

mkdir files
./bin/config set storage.local-disk.path /home/ubuntu/phabricator/files/
sudo chown www-data:www-data files/
mkdir -p repo
./bin/config set repository.default-local-path /home/ubuntu/phabricator/repo/


sudo apt install python-pygments python3-pygments
sudo apt install php7.4-zip
sudo service apache2 restart

vim phabricator/support/preamble.php
sudo systemctl restart apache2.service

./bin/config set phabricator.base-uri https://phabricator.yourdomain.com/

sudo vim /etc/php/7.4/apache2/php.ini
sudo service apache2 restart

sudo vim /etc/mysql/my.cnf
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start

vim mailers.json
./bin/config set cluster.mailers --stdin < mailers.json
./bin/mail send-test --to your@email.com --subject Test < NOTICE

```
