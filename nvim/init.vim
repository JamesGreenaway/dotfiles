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
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
set previewheight=5

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

"" ale
"let g:ale_fixers = {
"    \ 'css':              ['prettier'],
"    \ 'scss':             ['prettier'],
"    \ 'less':             ['prettier'],
"    \ 'html':             ['prettier'],
"    \ 'json':             ['prettier'],
"    \ 'javascript':       ['prettier', 'eslint'],
"    \ 'javascriptreact':  ['prettier', 'eslint'],
"    \ 'typescript':       ['prettier', 'eslint'],
"    \ 'typescriptreact':  ['prettier', 'eslint'],
"    \ }
"let g:ale_fix_on_save            = 1
"let g:ale_set_highlights         = 1
"let g:ale_sign_highlight_linenrs = 1
"let g:ale_open_list              = 1
"let g:ale_hover_cursor        = 0
"let g:ale_echo_cursor = 0
"let g:ale_hover_to_preview       = 1
"let g:ale_completion_delay       = 50
"let g:ale_sign_error             = 'E'
"let g:ale_sign_warning           = 'W'
"let g:ale_sign_info              = 'I'
"let g:ale_echo_msg_error_str     = 'E'
"let g:ale_echo_msg_warning_str   = 'W'
"
"set omnifunc=ale#completion#OmniFunc
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({
"      \ 'priority': 10,
"      \ }))
"
"hi ALEError        cterm=underline
"hi link ALEErrorSign ErrorMsg
"hi link ALEErrorSignLineNr ErrorMsg
"hi ALEInfo         cterm=underline
"hi link ALEInfoSign Normal
"hi link ALEInfoSignLineNr Normal
"hi ALEStyleError   cterm=underline
"hi link ALEStyleErrorSign ErrorMsg
"hi link ALEStyleErrorSignLineNr ErrorMsg
"hi ALEStyleWarning cterm=underline
"hi link ALEStyleWarningSign WarningMsg
"hi link ALEWarningSign WarningMsg
"hi link ALEStyleWarningSignLineNr WarningMsg
"hi ALEWarning      cterm=underline
"hi link ALEWarningSign WarningMsg
"hi link ALEWarningSignLineNr WarningMsg
"
"imap <C-Space> <Plug>(ale_complete)

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

"" asyncomplete
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"
" vrc
let g:vrc_trigger = '<silent><leader>vrc'
let g:vrc_curl_opts={
    \'--include': '',
    \'--location': '',
    \'--show-error': '',
    \'--silent': ''
    \ }

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn  <Plug>(coc-rename)
xmap <leader>f   <Plug>(coc-format-selected)
nmap <leader>f   <Plug>(coc-format-selected)
xmap <leader>a   <Plug>(coc-codeaction-selected)
nmap <leader>a   <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
