# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.config/fish/{path,exports,aliases,abbrs,extra}.fish;
    [ -r "$file" ] ; and [ -f "$file" ]; and . "$file"
end
set -e file

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
if type -q thefuck; eval (thefuck --alias | tr '\n' ';'); end
