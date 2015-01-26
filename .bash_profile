# try to restore a previous GNU screen session
if [ -z "$STY" ]; then
    screen  -d -RR
fi

