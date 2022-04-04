Invoke Sublime Text from terminal on macOS
```bash
sudo ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
# if the above command failed: ln: /usr/local/bin/subl: No such file or directory
sudo mkdir -p /usr/local/bin
```
