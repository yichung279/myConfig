" -- Plugins --- "
call plug#begin('~/.vim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
"---syntax for different languages---
Plug 'vim-python/python-syntax'
Plug 'hynek/vim-python-pep8-indent'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'JulesWang/css.vim'
Plug 'tpope/vim-haml'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'gavocanov/vim-js-indent'
Plug 'flazz/vim-colorschemes'
call plug#end()

" -- colorscheme --"
" colorscheme codedark
colorscheme tender
" colorscheme Molokai

" -- python-syntax -- "
let g:python_highlight_all=1

" -- html5.vim  -- "
let g:html_indent_inctags='html,head,body'

" -- tcomment_vim -- ""
vmap <Tab> gc

" -- gitgutter -- "
let g:gitgutter_diff_base='HEAD'
let g:gitgutter_sign_allow_clobber = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
nnoremap <Tab><Down> :GitGutterNextHunk<CR>
nnoremap <Tab><Up> :GitGutterPrevHunk<CR>

" -- NERDTree -- "
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -- indentLine -- "
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_conceallevel = 2
let g:pymode_lint_ignore = 'E502'

" -- lightline -- "
let g:lightline = { 'colorscheme': 'wombat'}
set nocompatible
set noshowmode   "to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command
set laststatus=2

" -- coc.nvim -- "
let g:coc_global_extensions=['coc-snippets', 'coc-pairs', 'coc-prettier', 'coc-json']
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap rn <Plug>(coc-rename)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:coc_snippet_next = '<Right>'
let g:coc_snippet_prev = '<Left>'
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" --- Norml Setting --- "
filetype plugin indent on
syntax on
set t_Co=256
set incsearch
set hlsearch
set modeline
set modelines=2
set nofoldenable
set nowrap
set number
set ruler
set updatetime=100
" allow backspacing over everything in insert mode on MacOS
set backspace=indent,eol,start

" --- Set shiftwidth and softtabstop --- "
autocmd FileType yaml,html,css,javascript,ls,vue setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal filetype=javascript.jsx
autocmd FileType javascript.jsx setlocal autoindent
autocmd FileType pug,sass,styl setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType perl,python,java setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh,make setlocal shiftwidth=4 tabstop=4
autocmd FileType c,cuda,cpp setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab
autocmd BufNewFile *.h setlocal shiftwidth=4 tabstop=4 expandtab

autocmd BufNewFile,BufEnter *.vue setfiletype vue
autocmd FileType vue setlocal autoindent expandtab shiftwidth=2 softtabstop=2 commentstring=//\ %s comments=://
\ | syntax include @PUG syntax/pug.vim | unlet b:current_syntax
\ | syntax include @JS syntax/javascript.vim | unlet b:current_syntax
\ | syntax include @SASS syntax/sass.vim | unlet b:current_syntax
\ | syntax region vueTemplate matchgroup=vueTag start=/^<template.*>$/ end='</template>' contains=@PUG keepend
\ | syntax region vueScript matchgroup=vueTag start=/^<script.*>$/ end='</script>' contains=@JS keepend
\ | syntax region vueStyle matchgroup=vueTag start=/^<style.*>$/ end='</style>' contains=@SASS keepend
\ | syntax match htmlArg /v-text\|v-html\|v-if\|v-show\|v-else\|v-for\|v-on\|v-bind\|v-model\|v-pre\|v-cloak\|v-once/ contained
\ | syntax keyword htmlArg contained key ref slot
\ | syntax keyword htmlTagName contained component transition transition-group keep-alive slot
\ | syntax sync fromstart
highlight vueTag ctermfg=Blue

" --- Open new file with template --- "
autocmd BufNewFile *.py 0r $HOME/.vim/template/tmpl.py
autocmd BufNewFile *.sh exec ":call append(0, '#!/bin/bash')"
" autocmd BufNewFile *.c silent! 0r $HOME/.vim/template/tmpl.c | 7delete | 3
" autocmd BufNewFile *.html silent! 0r $HOME/.vim/template/tmpl.html | 12delete | 9
" autocmd BufNewFile *.pug 0r $HOME/.vim/template/tmpl.pug
" autocmd BufNewFile *.vue 0r $HOME/.vim/template/tmpl.vue

" --- Alias --- "
nnoremap <Tab> <C-W>w
nnoremap <C-W><C-W> <C-W>p
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap < <C-W><
nnoremap > <C-W>>
nnoremap _ <C-W>_
nnoremap = <C-W>=
nnoremap \| <C-W>\|
nnoremap <C-C> <C-A>
nnoremap tt :TagbarToggle<CR>
nnoremap ps :set paste<CR> o
nnoremap nps :set nopaste<CR>
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
command W w
command Q q
command Wq wq
command WQ wq

" -- tmux window name -- "
autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
set title
