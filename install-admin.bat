:: This script needs to be executed as an administrator

schtasks /Create /RU Morgan /TN Syncthing /XML "C:\Users\Morgan\.dotfiles\schtasks\syncthing.xml"
