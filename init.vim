set mouse=n

" tabs to 2 spaces and stuff
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set number

source ${HOME}/.config/nvim/plugins.vim
source ${HOME}/.config/nvim/keymap.vim

" ayu theme
set termguicolors
let ayucolor="mirage"
colorscheme ayu
