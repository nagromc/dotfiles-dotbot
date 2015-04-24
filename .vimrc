" syntax highlighting
syntax on

" tab = 4 columns
set tabstop=4

" use spaces instead of tabs
set expandtab

" 256 colors terminal
set t_Co=256

filetype plugin indent on

" pathogen VIM plugin manager
execute pathogen#infect()

" force shell because vim doesn't seem to work well with fishshell
set shell=/bin/sh

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" tmuxline.vim
" To see the updates, run ':w | :source ~/.vimrc | Tmuxline'.
" Once finished, run ':TmuxlineSnapshot! ~/.tmuxline.vim.conf' to save the
" changes.
let g:tmuxline_theme = 'powerline'
let g:tmuxline_preset = {
        \'a'    : ['#H', '#(whoami)'],
        \'b'    : '',
        \'c'    : '',
        \'win'  : ['#I', '#W'],
        \'cwin' : ['#I', '#W', '#F'],
        \'x'    : '',
        \'y'    : '#(uptime | sed "s/.*load average: //")',
        \'z'    : '%R'}
" do not let Airline override Tmuxline conf
let g:airline#extensions#tmuxline#enabled = 0

" promptline.vim
" To see the updates, run ':w | source ~/.vimrc | PromptlineSnapshot! ~/.shell_prompt.sh' in vim, then run 'source ~/.shell_prompt.sh' in a bash prompt, or 'source .config/fish/config.fish' in a fish prompt
let g:promptline_theme = 'powerlineclone'
"let g:promptline_preset = 'full'
"unlet g:promptline_preset
let g:promptline_preset = {
        \'a'    : [ promptline#slices#host(), promptline#slices#user() ],
        \'b'    : [ promptline#slices#cwd() ],
        \'c'    : [ ],
        \'x'    : [ promptline#slices#git_status(), promptline#slices#vcs_branch() ],
        \'y'    : [ '$(date "+%H:%M:%S")' ],
        \'z'    : [ ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

