let g:mapleader = "\<Space>" 
runtime plugins.vim

augroup highlighting 
  autocmd!  
  autocmd ColorScheme * hi Error        ctermbg=none ctermfg=9 
  autocmd ColorScheme * hi ErrorMsg     ctermbg=none ctermfg=9 
  autocmd ColorScheme * hi WarningMsg   ctermbg=none ctermfg=11
  autocmd ColorScheme * hi Todo         ctermbg=none ctermfg=11 
  autocmd ColorScheme * hi SignColumn   ctermbg=none 
  autocmd ColorScheme * hi VertSplit    ctermbg=none ctermfg=0 
  autocmd ColorScheme * hi QuickFixLine ctermbg=8    ctermfg=15 
  autocmd ColorScheme * hi StatusLine   ctermbg=0    ctermfg=7  cterm=none 
  autocmd ColorScheme * hi StatusLineNC ctermbg=0    ctermfg=8  cterm=none
augroup highlighting 

colorscheme dim

nnoremap <silent><leader>o :%bd\|e#\|bw#<cr> 
nnoremap <silent><leader>cd :cd%:p:h<cr>:pwd<cr> 
nnoremap <silent><leader>hl :nohlsearch<cr>

set laststatus=2
set statusline=
set statusline+=\ \ \  
set statusline+=\ %n
set statusline+=%<\ 
set statusline+=\ %R 
set statusline+=\ %f
set statusline+=\ %M
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ \ 
set statusline+=\ 
set statusline+=\ %l
set statusline+=:
set statusline+=%c 
set statusline+=\ \ 

set mouse=a
set splitright
set splitbelow
set backspace=2
set history=1000
set undolevels=1000
set incsearch
set nostartofline
set showcmd
set clipboard+=unnamedplus
set undofile
set undodir=/tmp
set backupdir=/tmp
set directory=/tmp
set title
set wildignore+=node_modules/*,.git/*
set noerrorbells visualbell t_vb=
set viminfo+=n~/.config/nvim/viminfo
set number
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
set showtabline=0

" neovim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = { },
  },
  indentation = {
    enable = true,
    disable = { },
  },
  folding = {
    enable = true,
    disable = { },
  },
}
EOF

" ale
let g:ale_fixers = {
    \ 'css':              ['prettier'],
    \ 'scss':             ['prettier'],
    \ 'less':             ['prettier'],
    \ 'html':             ['prettier'],
    \ 'json':             ['prettier'],
    \ 'javascript':       ['prettier', 'eslint'],
    \ 'javascriptreact':  ['prettier', 'eslint'],
    \ 'typescript':       ['prettier', 'eslint'],
    \ 'typescriptreact':  ['prettier', 'eslint'],
    \ }
let g:ale_fix_on_save            = 1
let g:ale_set_highlights         = 1
let g:ale_sign_highlight_linenrs = 1
let g:ale_open_list              = 1
let g:ale_sign_error             = 'E'
let g:ale_sign_warning           = 'W'
let g:ale_sign_info              = 'I'
let g:ale_echo_msg_error_str     = 'E'
let g:ale_echo_msg_warning_str   = 'W'

set omnifunc=ale#completion#OmniFunc
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
      \ 'priority': 10,
      \ }))

hi ALEError        cterm=underline
hi link ALEErrorSign ErrorMsg
hi link ALEErrorSignLineNr ErrorMsg
hi ALEInfo         cterm=underline
hi link ALEInfoSign Normal
hi link ALEInfoSignLineNr Normal
hi ALEStyleError   cterm=underline
hi link ALEStyleErrorSign ErrorMsg
hi link ALEStyleErrorSignLineNr ErrorMsg
hi ALEStyleWarning cterm=underline
hi link ALEStyleWarningSign WarningMsg
hi link ALEWarningSign WarningMsg
hi link ALEStyleWarningSignLineNr WarningMsg
hi ALEWarning      cterm=underline
hi link ALEWarningSign WarningMsg
hi link ALEWarningSignLineNr WarningMsg

" fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" window/splitting movement
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" nvim-tree
let g:lua_tree_ignore = [ '.git', 'node_modules', '.DS_Store' ]
let g:lua_tree_auto_open = 1
let g:lua_tree_auto_close = 1
let g:lua_tree_git_hl = 1 
let g:lua_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ }

nnoremap <C-n> :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>

" asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" vrc
 let g:vrc_trigger = '<leader>vrc'
