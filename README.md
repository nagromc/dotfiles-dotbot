`~morgan`
=========

Yeah, yet another dotfiles repo. But this is mine. And I ❤ it.

Relies on the great [`dotbot`](https://github.com/anishathalye/dotbot) dotfiles installer.

Dependencies
------------

My dotfiles uses the following awesomeness:

- [`dotbot`](https://github.com/anishathalye/dotbot)
- [`fish`](http://fishshell.com/)
- [`vim`](http://www.vim.org/)
- [`pathogen.vim`](https://github.com/tpope/vim-pathogen)
- [`promptline.vim`](https://github.com/edkolev/promptline.vim)
- [`vim-airline`](https://github.com/bling/vim-airline)
- [`tmux`](https://tmux.github.io/)
- [`tmuxline.vim`](https://github.com/edkolev/tmuxline.vim)
- [`tmux-resurrect`](https://github.com/tmux-plugins/tmux-resurrect)
- [`tig`](http://jonas.nitro.dk/tig/)
- [`mintty`](http://mintty.github.io/)
- [`powerline`](https://github.com/powerline/powerline) [fonts](https://github.com/powerline/fonts)
- [Solarized](http://ethanschoonover.com/solarized) color scheme

You will need a terminal emulator that supports 256 colors such as [`gnome-terminal`](http://directory.fsf.org/wiki/Gnome-terminal), [`mintty`](http://mintty.github.io/), [`PuTTY`](http://www.putty.org/), …

Installation
------------

1. Install the [required softwares](#dependencies) that will not be installed by `dotbot`:

        $ sudo apt-get install fish tmux vim tig

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

| File…                 | …will extend                 |
| --------------------- | ---------------------------- |
| `~/.vimrc_local`      | `~/.vimrc`                   |
| `~/.ssh/config_local` | `~/.ssh/config`              |
| `~/.gitconfig_local`  | `~/.gitconfig`               |
| `~/.extra`            | `~/.config/fish/config.fish` |
