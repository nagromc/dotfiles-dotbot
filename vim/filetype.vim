" custom filetype
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd! BufRead,BufNewFile ~/.gitconfig_local setfiletype gitconfig
    autocmd! BufRead,BufNewFile ~/.ssh/config_local setfiletype sshconfig
augroup END

