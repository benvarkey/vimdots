set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
if !empty(glob("~/.config/nvim/local.vim"))
    source ~/.config/nvim/local.vim
endif
