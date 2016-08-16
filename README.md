`~morgan`
=========

Yeah, yet another dotfiles repo. But this is mine. And I ❤ it.

Relies on the great [`dotbot`](https://github.com/anishathalye/dotbot) dotfiles installer.

Dependencies
------------

My dotfiles uses the following awesomeness:

- [`dotbot`](https://github.com/anishathalye/dotbot)
- [`fish`](http://fishshell.com/), and these great utilities:
    - [`autojump`](https://github.com/wting/autojump)
    - [`fzf`](https://github.com/junegunn/fzf)
    - [`thefuck`](https://github.com/nvbn/thefuck)
- [Vim](http://www.vim.org/), and these shiny plugins:
    - [Auto Pairs](https://github.com/jiangmiao/auto-pairs)
    - [`commentary.vim`](https://github.com/tpope/vim-commentary)
    - [`ctrlp.vim`](https://github.com/ctrlpvim/ctrlp.vim)
    - [NERD Commenter](https://github.com/scrooloose/nerdtree)
    - [NERD Tree](https://github.com/scrooloose/nerdtree)
    - [`pathogen.vim`](https://github.com/tpope/vim-pathogen)
    - [`promptline.vim`](https://github.com/edkolev/promptline.vim)
    - [`sensible.vim`](https://github.com/tpope/vim-sensible)
    - [`surround.vim`](https://github.com/tpope/vim-surround)
    - [Tagbar](https://github.com/majutsushi/tagbar)
    - [`tmuxline.vim`](https://github.com/edkolev/tmuxline.vim)
    - [`vim-airline`](https://github.com/bling/vim-airline)
    - [`vim-gitgutter`](https://github.com/airblade/vim-gitgutter)
    - [`vim-joy`](https://github.com/rking/vim-joy)
- [`tmux`](https://tmux.github.io/), and this brilliant plugin:
    - [`tmux-resurrect`](https://github.com/tmux-plugins/tmux-resurrect)
- [OpenSSH](http://www.openssh.com/)
- [Git](http://git-scm.com/), and these impressive softs:
    - [`git-flow` (AVH Edition)](https://github.com/petervanderdoes/gitflow-avh)
    - [Tig](http://jonas.nitro.dk/tig/)
- [Atom](https://atom.io/), and these [magnificent packages](https://raw.githubusercontent.com/nagromc/dotfiles/master/atom/package-list)
- [`npm`](https://www.npmjs.com/), and these amazing packages:
    - [`apm`](https://github.com/atom/apm)
    - [Bower](http://bower.io/)
- [`mintty`](http://mintty.github.io/)
- [Powerline](https://github.com/powerline/powerline) [fonts](https://github.com/powerline/fonts)
- [Solarized](http://ethanschoonover.com/solarized) color scheme
- [Monokai](http://www.monokai.nl/blog/2006/07/15/textmate-color-theme/) color scheme

You will need a terminal emulator that supports 256 colors such as [`gnome-terminal`](http://directory.fsf.org/wiki/Gnome-terminal), [`mintty`](http://mintty.github.io/), [`PuTTY`](http://www.putty.org/), …

Installation
------------

1. Install the [required softwares](#dependencies) that will not be installed by `dotbot`:

        $ sudo apt-get install fish tmux vim tig git-flow autojump highlight rxvt-unicode-256color
        $ mkdir -p ~/opt/ && wget https://nodejs.org/dist/latest/node-vx.x.x-linux-x64.tar.gz -O - | tar -xz -C ~/opt/ --strip-components=1
        $ npm install -g npm bower grunt grunt-cli gulp yo
        $ git clone --depth 1 https://github.com/junegunn/fzf.git ~/dev/fzf; and ~/dev/fzf
        $ sudo pip install thefuck

2. Change the default shell:

    - In a UNIX environment:

            $ chsh -s /usr/bin/fish

    - In Cygwin:

            $ mkpasswd -c | awk -F: '{$7="/usr/bin/fish"}1' OFS=: >> /etc/passwd

3. Then, run the `dotbot`'s installer:

        $ ./install

4. Welcome to your new, pretty, smooth, fast, powerful, awesome terminal.

Local configuration
-------------------

If you don't want to share private data, or if you have a specific environment you don't want to commit for every machine, you might want to add or override configuration with local dotfiles.

Those files can be added to extend the dotfiles:

| File…                  | …will extend                 |
| ---------------------- | ---------------------------- |
| `~/.vimrc_local`       | `~/.vimrc`                   |
| `~/.ssh/config_local`  | `~/.ssh/config`              |
| `~/.gitconfig_local`   | `~/.gitconfig`               |
| `~/.config/fish/extra` | `~/.config/fish/config.fish` |
| `~/.tmux_local.conf`   | `~/.tmux.conf`               |
