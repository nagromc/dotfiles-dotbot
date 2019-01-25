set -x EDITOR vi
set -x fish_path ~/.config/fish/fisherman
set -x LESS ' --RAW-CONTROL-CHARS --quit-if-one-screen --no-init --ignore-case --jump-target=5 --shift .2'
set -x LESSOPEN "| /usr/bin/highlight --quiet --out-format=xterm256 --style=molokai %s"
set -x PAGER less
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -x SUDO_EDITOR vim
set -x TEXMFHOME ~/.texmf
set -x VISUAL vim

if [ ! "$TERM" = ""  ]
    # LESS_TERMCAP to get colors in manpages
    set -x LESS_TERMCAP_mb (tput bold; tput setaf 2) # green
    set -x LESS_TERMCAP_md (tput bold; tput setaf 6) # cyan
    set -x LESS_TERMCAP_me (tput sgr0)
    set -x LESS_TERMCAP_so (tput bold; tput setaf 3; tput setab 4) # yellow on blue
    set -x LESS_TERMCAP_se (tput rmso; tput sgr0)
    set -x LESS_TERMCAP_us (tput smul; tput bold; tput setaf 7) # white
    set -x LESS_TERMCAP_ue (tput rmul; tput sgr0)
    set -x LESS_TERMCAP_mr (tput rev)
    set -x LESS_TERMCAP_mh (tput dim)
    set -x LESS_TERMCAP_ZN (tput ssubm)
    set -x LESS_TERMCAP_ZV (tput rsubm)
    set -x LESS_TERMCAP_ZO (tput ssupm)
    set -x LESS_TERMCAP_ZW (tput rsupm)
end
