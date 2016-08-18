# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.config/fish/{path,exports,aliases,abbrs,extra};
    [ -r "$file" ] ; and [ -f "$file" ]; and . "$file"
end
set -e file

# "xterm-256color" doesn't seem to be a friend of tmux
set -x TERM screen-256color

# TMUX
tmux attach; or tmux new

# promptline.vim
function fish_prompt
    env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.config/fish/shell_prompt.sh left
end

function fish_right_prompt
    env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.config/fish/shell_prompt.sh right
end

# load autojump
if test -f /usr/share/autojump/autojump.fish; . /usr/share/autojump/autojump.fish; end

# thefuck alias requirement
eval (thefuck --alias | tr '\n' ';')
