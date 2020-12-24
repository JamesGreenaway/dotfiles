call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'tpope/vim-fugitive' 
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
"Plug 'dense-analysis/ale' 
Plug '/usr/local/opt/fzf' 
Plug 'junegunn/fzf', { 'do': { -> fzf#install()} } 
Plug 'junegunn/fzf.vim' 
Plug 'AndrewRadev/tagalong.vim' 
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kassio/neoterm'
"Plug 'prabirshrestha/asyncomplete.vim'
Plug 'diepm/vim-rest-console'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

