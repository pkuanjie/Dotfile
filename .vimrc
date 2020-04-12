" ========== common config ==========
if !has('gui_running')
  set t_Co=256
endif
let mapleader=";"
set backspace=indent,eol,start
filetype on
filetype plugin on
vnoremap <Leader>y "+y
nmap <Leader>p "+p
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set incsearch
set ignorecase
set nocompatible
set wildmenu
set term=screen-256color
set completeopt=menu
set background=dark
hi Comment guifg=#5C6370 ctermfg=59
set laststatus=2
set ruler
set number
set hlsearch
set wrap
syntax enable
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" =====================

" ========== vim-plug ==========
" auto load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugin list
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'w0rp/ale'
"Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'vim-latex/vim-latex'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'

" ========== theme plugin ==========
"Plug 'liuchengxu/space-vim-dark'
Plug 'rakr/vim-one'

call plug#end()
" ====================

" ========== ycm ==========
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/Users/anjie/anaconda3/bin/python3'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_add_preview_to_completeopt=0
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc=0
let g:ycm_key_invoke_completion = '<C-a>'
let g:ycm_min_num_identifier_candidate_chars = 2
set completeopt=menu,menuone
"noremap <c-a> <NOP>
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,perl': ['re!\w{2}'],
            \ 'lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "objc":1,
            \ "sh":1,
            \ "zsh":1,
            \ "python":1,
            \ "html":1,
            \ }
" ====================

" ========== fzf config ==========
nnoremap <silent> <Leader>f :FZF<CR>
" ====================

" ========== vim-latex config ==========
imap <Leader>a <F5> 
imap <Leader>s <F7> 
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
" ====================

" ========== indentLine config ==========
let g:indentLine_fileType=['c', 'cpp', 'python']
" ====================

" ========== nerdtree config ==========
nnoremap <silent> <Leader>t :NERDTree<CR>
" ====================

" ========== ale config ==========
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
" ====================

" ========== rainbow_parentheses config ==========
let g:rainbow_active = 1
" ==========

" ========== airline config ==========
let g:airline_theme='one'
" ====================

" ========== colorscheme ==========
"colorscheme space-vim-dark
set background=dark " for the dark version
" set background=light " for the light version
colorscheme one
syntax on
" ====================

" ========== nerdcommenter config ==========
let g:NERDSpaceDelims=0
" ====================

" ========== indentLine ==========
let g:indentLine_color_term = 239
" ====================

" ========== Emmet config ==========
let g:user_emmet_leader_key='<Leader>j'
let g:user_emmet_mode='a'
" ====================

