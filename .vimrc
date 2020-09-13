" -- Plugins --- "
call plug#begin('~/.vim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
"---syntax for different languages---
Plug 'sheerun/vim-polyglot'
" Plug 'JulesWang/css.vim'
" Plug 'posva/vim-vue'
" Plug 'othree/html5.vim'
" Plug 'digitaltoad/vim-pug'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'vim-python/python-syntax'
" Plug 'hynek/vim-python-pep8-indent'
call plug#end()

" -- colorscheme --"
" colorscheme codedark
" colorscheme tender
" colorscheme Molokai
colorscheme nord
" colorscheme codedark " colorscheme of VScode



" -- python-syntax -- "
let g:python_highlight_all=1


" -- html5.vim  -- "
let g:html_indent_inctags='html,head,body'


" -- tcomment_vim -- "
vmap <Tab> gc


" -- gitgutter -- "
let g:gitgutter_diff_base='HEAD'
let g:gitgutter_sign_allow_clobber = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
nnoremap <Tab><Down> :GitGutterNextHunk<CR>
nnoremap <Tab><Up> :GitGutterPrevHunk<CR>
nnoremap <Tab><Right> :GitGutterPreviewHunk<CR>
nnoremap <Tab><Left> :pclose<CR>


" -- NerdTree -- "
map <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" -- indentLine -- "
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_char = '|'


" -- lightline -- "
let g:lightline = { 'colorscheme': 'nord'}
set nocompatible
set noshowmode   "to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command
set laststatus=2


" -- posva/vim-vue -- "
let g:vue_pre_processors = ['pug', 'sass']


" -- coc.nvim -- "
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"-- ale (language server protocol client)
let g:ale_fix_on_save=1
let g:ale_fixers={
\ '*': ['prettier'],
\ 'json': ['fixjson'],
\ 'python': ['isort', 'autopep8']
\ }
let g:ale_linters_explicit=1
let g:ale_disable_lsp = 1

" --- Norml Setting --- "
filetype plugin indent on
syntax on
set backupdir=~/tmp,.,/var/tmp/vi,/tmp
set directory=~/tmp,/var/tmp/vi,/tmp,.
set nobackup		                        " keep a backup file
set t_Co=256
set incsearch
set hlsearch
set modeline
set modelines=2
set nofoldenable
set nowrap
set number
set ruler
set cursorline
set updatetime=100
set backspace=indent,eol,start " allow backspacing over everything in insert mode on MacOS
set iskeyword-=_

" --- Set shiftwidth and softtabstop --- "
autocmd FileType yaml,html,css,javascript,ls,vue setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType vue,javascript,json             setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType perl,python,java,c,cuda,cpp,php setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType sh,make setlocal shiftwidth=4 tabstop=4
autocmd BufNewFile *.h   setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType json let g:indentLine_conceallevel = 0

" --- Open new file with template --- "
autocmd BufNewFile *.py 0r $HOME/.vim/template/tmpl.py
autocmd BufNewFile *.sh exec ":call append(0, '#!/bin/bash')"
" autocmd BufWritePost *.py,*.sh silent ! chmod a+x %
" autocmd BufNewFile *.c silent! 0r $HOME/.vim/template/tmpl.c | 7delete | 3

nnoremap \| <C-W>\|
nnoremap <C-C> <C-A>
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
command W w
command Q q
command Wq wq
command WQ wq
command CopyModeOn set nonumber wrap
command CopyModeOff set number nowrap
command PasteModeOn set paste
command PasteModeOff set nopaste

hi Search guifg=#ffffff ctermfg=232 guibg=NONE ctermbg=185 gui=underline,Bold cterm=underline,Bold
