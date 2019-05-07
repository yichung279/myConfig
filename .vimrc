" filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'
"---syntax for different languages---
Plugin 'vim-python/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'JulesWang/css.vim'
Plugin 'tpope/vim-haml'
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'gavocanov/vim-js-indent'
" Plugin 'mxw/vim-jsx' for react js
" Plugin 'gkz/vim-ls'  for Livescript

call vundle#end()
filetype plugin indent on

let g:python_highlight_all = 1
let g:html_indent_inctags='html,head,body'
let g:gitgutter_diff_base='HEAD'
" -- airline -- "
let g:airline_left_sep='>'
let g:airline_right_sep='<'
let g:airline_inactive_alt_sep=1
let g:airline_section_y=0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0
let g:airline_theme='light'
" -- indentLine -- "
let g:indentLine_color_term = 239
let g:indentLine_char = '¦'
let g:indentLine_conceallevel = 1
let g:pymode_lint_ignore = 'E502'

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
" autocmd BufNewFile *.c silent! 0r $HOME/.vim/template/tmpl.c | 7delete | 3

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
"---- auto noh after search ----"
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
command W w
command Q q
command Wq wq
