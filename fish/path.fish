if test -d /opt/bin
    set PATH /opt/bin $PATH
end
set PATH ~/.local/bin $PATH
set PATH ~/.local/sbin $PATH

set -x PATH $PATH

set MANPATH /usr/share/man/ $MANPATH
set MANPATH ~/.local/share/man $MANPATH

set -x MANPATH $MANPATH
