call plug#begin('~/.vim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'neoclide/coc-vetur'
Plug 'neoclide/coc-python'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
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

call plug#end()

filetype plugin indent on

let g:python_highlight_all = 1
let g:html_indent_inctags='html,head,body'
let g:gitgutter_diff_base='HEAD'
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
" -- NERDTree -- "
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" -- indentLine -- "
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
let g:indentLine_conceallevel = 2
let g:pymode_lint_ignore = 'E502'
" -- lightline -- "
set laststatus=2

set t_Co=256

set nocompatible
set incsearch
set hlsearch
set modelines=1
set nofoldenable
set nowrap
set ruler
set updatetime=100
" allow backspacing over everything in insert mode on MacOS
set backspace=indent,eol,start

syntax on
highlight Comment ctermfg=Blue
highlight DiffAdd ctermfg=White ctermbg=Green
highlight DiffChange ctermfg=White ctermbg=Yellow
highlight DiffDelete ctermfg=White ctermbg=Red
highlight DiffText ctermfg=DarkGray ctermbg=Gray
highlight Incsearch ctermfg=White
highlight LineNr ctermfg=DarkGray
highlight Visual ctermfg=White

highlight Directory ctermfg=Cyan
highlight Constant ctermfg=magenta
highlight Special ctermfg=Red
highlight PreProc ctermfg=Blue

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

" au BufRead,BufNewFile *.asm set filetype=nasm tabstop=4 shiftwidth=4

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

" autocmd BufNewFile *.html silent! 0r $HOME/.vim/template/tmpl.html | 12delete | 9
autocmd BufNewFile *.pug 0r $HOME/.vim/template/tmpl.pug
autocmd BufNewFile *.vue 0r $HOME/.vim/template/tmpl.vue
" autocmd BufNewFile *.pl silent! 0r $HOME/.vim/template/tmpl.pl | 4
autocmd BufNewFile *.py 0r $HOME/.vim/template/tmpl.py
"autocmd BufNewFile *.c silent! 0r $HOME/.vim/template/tmpl.c | 7delete | 3
autocmd BufNewFile *.sh exec ":call append(0, '#!/bin/sh')"
" autocmd BufNewFile *.py exec ":call append(0, '#!/usr/bin/env python')"

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
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
command W w
command Q q
command Wq wq

vmap <Tab> gc

" ----   coc.nvim ------
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<Right>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<Left>'
