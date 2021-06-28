" --------------------------------------------
"            _                        _ _
"  _ ____   _(_)_ __ ___  _ __ ___    | (_) ___
" | '_ \ \ / / | '_ ` _ \| '__/ __|  _  | | |/ _ \
" | | | \ V /| | | | | | | | | (__  | |_| | |  __/
" |_| |_|\_/ |_|_| |_| |_|_|  \___|  \___/|_|\___|
" --------------------------------------------
" Author: @pkuanjie
" Date: 2021/6/24
" Note: Based on CoC (which is the best!), this config file only support neovim=0.5.
" --------------------------------------------


" ========================================
" Basic Settings
" ========================================
let g:python3_host_prog = "/usr/bin/python3"
" ========================================


" ========================================
" Basic Settings
" ========================================
set nocompatible

" Set <LEADER> as <SPACE>, ; as :
noremap <SPACE> <NOP>
let mapleader=" "
set encoding=UTF-8
let &t_ut=''
" set cursorline
if has("termguicolors")
    " enable true color
    set termguicolors
endif
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set number
set showmatch
set wildmenu
set autochdir
" set relativenumber
set list
set listchars=tab:\│\ ,trail:▫
set maxmempattern=10000
set hlsearch
set ignorecase
set smartcase
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set synmaxcol=300
set foldmethod=indent
set foldlevel=99
set scrolloff=5
set foldenable
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" fancy settings, let vim save the undo history even after shut down.
" !!! comment all backup settings according to the suggestion of the coc
" silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
" set backupdir=~/.config/nvim/tmp/backup,.
" set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

" Open the vimrc file anytime
nnoremap <LEADER>h :e ~/.config/nvim/init.vim<CR>

" Space to Tab
nnoremap <LEADER>st :%s/    /\t/g<CR>
nnoremap <LEADER>ts :%s/\t/    /g<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Spelling Check with <leader>sc
nnoremap <leader>sc :set spell!<CR>

" find and replace
nnoremap 'sa :%s//g<left><left>
nnoremap 'ss :%s//gc<left><left>

" markdown, latex, auto spell
autocmd BufRead,BufNewFile *.md,*.tex setlocal spell

" markdown shortcuts
" 快捷键    创建的文字
" ,n    ---
" ,b    粗体文字
" ,s    被划去的文字
" ,i    斜体文字
" ,d    代码块
" ,c    大的 代码块
" ,m    - [ ] 清单
" ,p    图片
" ,a    链接
" ,1    # H1
" ,2    ## H2
" ,3    ### H3
" ,4    #### H4
" ,l    --------
autocmd Filetype markdown inoremap <buffer> `f <Esc>/ <CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> `w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> `n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> `b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> `s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> `i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> `d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> `c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap <buffer> `m - [ ]
autocmd Filetype markdown inoremap <buffer> `p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> `a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> `1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> `l --------<Enter>

" Press leader twice to jump to the next '<++>' and edit it
noremap <leader><leader> <Esc>/<++><CR>:nohlsearch<CR>c4l

" bind <A-a> to use it for increasing numbers and <A-x> to decrease
nnoremap <M-a> <C-a>
nnoremap <M-x> <C-x>

" Search
nnoremap <LEADER><CR> :nohlsearch<CR>


" H key: go to the start of the line
nnoremap <c-a> ^
vnoremap <c-a> ^
inoremap <C-a> <ESC>I
" L key: go to the end of the line
nnoremap <c-e> g_
vnoremap <c-e> g_
inoremap <C-e> <ESC>A

" ========================================

" ========================================
" window management
" ========================================
" Use <space> + new arrow keys for moving the cursor around windows
nnoremap S <C-w>w
nnoremap K <C-w>k
nnoremap L <C-w>j
nnoremap H <C-w>h
nnoremap L <C-w>l

" can be used to close taglist, filetree, and windows at below, so use ctrl
" prefix
nnoremap <leader>q <C-w>o

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
nnoremap zk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
nnoremap zj :set splitbelow<CR>:split<CR>
nnoremap zh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
nnoremap zl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
nnoremap <M-up> :res +5<CR>
nnoremap <M-down> :res -5<CR>
nnoremap <M-left> :vertical resize-5<CR>
nnoremap <M-right> :vertical resize+5<CR>

" Place the two screens up and down
nnoremap z] <C-w>t<C-w>K
" Place the two screens side by side
nnoremap z[ <C-w>t<C-w>H

" swap two panes
nnoremap zr <C-w><C-r>

" Create a new tab with tu
nnoremap <tab>g :tab split<CR>
nnoremap <tab>e :tabe<CR>
nnoremap <tab>[ :tab split<CR>:set splitright<CR>:vsplit<CR>
nnoremap <tab>] :tab split<CR>:set splitbelow<CR>:split<CR>

" Move around tabs with tn and ti
nnoremap <C-j> :-tabnext<CR>
nnoremap <C-k> :+tabnext<CR>

" Move around buffers
nnoremap <C-p> :bprevious<CR>
nnoremap <C-n> :bnext<CR>

" Move tabs with tmn and tmi
nnoremap <tab>h :-tabmove<CR>
nnoremap <tab>l :+tabmove<CR>
" ========================================


" ========================================
" terminal config
" ========================================
" Opening a terminal window
noremap <leader>/ :set splitbelow<CR>:split<CR>:term<CR>

" Terminal Behaviors
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-c> <C-\><C-n>

" terminal colors
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

" ========================================
" Code Runner
" ========================================
" Compile function
noremap <leader>b :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitbelow
        exec "!g++ -std=c++11 % -Wall -o %<"
        :sp
        :res -15
        :term ./%<
    elseif &filetype == 'java'
        set splitbelow
        :sp
        :res -5
        term javac % && time java %<
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :term python %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'tex'
        silent! exec "VimtexStop"
        silent! exec "VimtexCompile"
    elseif &filetype == 'javascript'
        set splitbelow
        :sp
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc

vmap <leader>p :!python3<cr>

" ========================================
" Plugins
" ========================================
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim',
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mbbill/undotree'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kshenoy/vim-signature'
Plug 'ron89/thesaurus_query.vim'
Plug 'mhinz/vim-startify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'aperezdc/vim-template'
Plug 'svermeulen/vim-subversive'
Plug 'junegunn/goyo.vim'
Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-gitgutter'
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
Plug 'svermeulen/vim-yoink'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'farmergreg/vim-lastplace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'rhysd/vim-grammarous'
Plug 'vimwiki/vimwiki'

" Find & Replace
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'theniceboy/vim-snippets'
Plug 'theniceboy/antovim' " gs to switch e.g., true -> false
Plug 'junegunn/vim-after-object'

Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'lervag/vimtex'
Plug 'mzlogin/vim-markdown-toc'

" fancy treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'p00f/nvim-ts-rainbow'

" 0.5
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}

" colorschemes
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'

call plug#end()

" ----------------------------------------
" grammarous config
" ----------------------------------------
nmap <leader>gc :GrammarousCheck --no-comments-only<CR>

" Mappings  Description
" q Quit the info window
" <CR>  Move to the location of the error
" f Fix the error automatically
" r Remove the error without fix
" R Disable the grammar rule in the checked buffer
" n Move to the next error's location
" p Move to the previous error's location
" ? Show help of the mapping in info window
" ----------------------------------------

" ----------------------------------------
" antovim config
" ----------------------------------------
nmap <leader>rv :Antovim<CR>
" ----------------------------------------

" ----------------------------------------
" glow config
" ----------------------------------------
nmap <leader>gg :Glow<CR>
" ----------------------------------------

" ----------------------------------------
" nvim treesitter config
" ----------------------------------------
lua <<EOF
require'nvim-treesitter'.define_modules {
    fold = {
        attach = function(_, _)
            vim.cmd'set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()'
        end,
        detach = function() end,
    }
}

local langs = {
    "python",
    "bash",
    "html",
    "css",
    "lua",
    "latex",
    "bibtex",
    "yaml",
    "dockerfile",
    "c",
    "cpp",
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = langs,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection  = "gnn",
            node_incremental  = "grn",
            scope_incremental = "grc",
            node_decremental  = "grm",
        },
    },
    fold = {
        enable = true,
    },
    textobjects = {
        swap = {
            enable = true,
            swap_next = {
                ["<leader>pl"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>ph"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]]"] = "@function.outer",
                ["]a"] = "@class.outer",
            },
            goto_next_end = {
                ["]["] = "@function.outer",
                ["]e"] = "@class.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
                ["[a"] = "@class.outer",
            },
            goto_previous_end = {
                ["[]"] = "@function.outer",
                ["[e"] = "@class.outer",
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    }
}
EOF
" ----------------------------------------

" ----------------------------------------
" fzf-gitignore config
" ----------------------------------------
noremap <leader>gi :FzfGitignore<CR>
" ----------------------------------------

" ----------------------------------------
" vim-gitgutter config
" ----------------------------------------
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gh :GitGutterPrevHunk<CR>
nnoremap <LEADER>gl :GitGutterNextHunk<CR>
" ----------------------------------------

" ----------------------------------------
" vim markdown toc config
" ----------------------------------------
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" ----------------------------------------

" ----------------------------------------
" rnvimr config
" ----------------------------------------
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = {
            \ 'relative': 'editor',
            \ 'width': float2nr(round(0.5 * &columns)),
            \ 'height': float2nr(round(0.5 * &lines)),
            \ 'col': float2nr(round(0.15 * &columns)),
            \ 'row': float2nr(round(0.15 * &lines)),
            \ 'style': 'minimal'
            \ }
let g:rnvimr_presets = [{'width': 0.7, 'height': 0.7}]
" ----------------------------------------

" ----------------------------------------
" goyo config
" ----------------------------------------
map <leader>gy :Goyo<CR>
" ----------------------------------------

" ----------------------------------------
" vim subversive config
" ----------------------------------------
" s for substitute
nmap s <plug>(SubversiveSubstitute)
vmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)
" ----------------------------------------

" ----------------------------------------
" vim template config
" ----------------------------------------
let g:templates_directory=["$HOME/.config/nvim/templates"]
let g:username='@pkuanjie'
let g:email='pkuanjie@gmail.com'
let g:license='MIT'
" ----------------------------------------

" ----------------------------------------
"  fzf config
" ----------------------------------------
nnoremap <silent> 'f :Files<CR>
nnoremap <silent> 'b :Buffers<CR>
nnoremap <silent> 'h :History<CR>
nnoremap <silent> 'm :Maps<CR>
nnoremap <silent> 't :Tags<CR>
nnoremap <silent> 'a :Ag<CR>
" ----------------------------------------

" ----------------------------------------
"  vim indentline config
" ----------------------------------------
" This plugin has been deleted for a better speed, just use list char to
" instead
nnoremap <leader>id :set list!<CR>
" ----------------------------------------

" ----------------------------------------
"  vim yoink config
" ----------------------------------------
nmap - <plug>(YoinkPostPasteSwapBack)
nmap = <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

" Note that the swap operations above will only affect the current paste and the history order will be unchanged. However - if you do want to permanently cycle through the history, you can do that too:
nmap y[ <plug>(YoinkRotateBack)
nmap y] <plug>(YoinkRotateForward)

nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
" ----------------------------------------

" ----------------------------------------
"  vim splitjoin config
" ----------------------------------------
"  gS for split
"  gJ for join
" ----------------------------------------

" ----------------------------------------
"  Thesaurus_query config
" ----------------------------------------
let g:tq_map_keys = 0
nnoremap <leader>rp :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <leader>rp y:ThesaurusQueryReplace <C-r>"<CR>
" ----------------------------------------

" ----------------------------------------
"  vim signature config
" ----------------------------------------
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx         Remove mark 'x' where x is a-zA-Z
"
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>   Delete all marks from the current buffer
" ]`           Jump to next mark
" [`           Jump to prev mark
" ]'           Jump to start of next line containing a mark
" ['           Jump to start of prev line containing a mark
" `]           Jump by alphabetical order to next mark
" `[           Jump by alphabetical order to prev mark
" ']           Jump by alphabetical order to start of next line having a mark
" '[           Jump by alphabetical order to start of prev line having a mark
" m/           Open location list and display marks from current buffer
"
" m[0-9]       Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   Remove all markers of the same type
" ]-           Jump to next line having a marker of the same type
" [-           Jump to prev line having a marker of the same type
" ]=           Jump to next line having a marker of any type
" [=           Jump to prev line having a marker of any type
" m?           Open location list and display markers from current buffer
" m<BS>     Remove all markers

" ----------------------------------------

" ----------------------------------------
"  vista config
" ----------------------------------------
nnoremap 'v :Vista<CR>
" ----------------------------------------

" ----------------------------------------
"  undetree
" ----------------------------------------
nnoremap 'u :UndotreeToggle<CR>:UndotreeFocus<CR>
" ----------------------------------------

" ----------------------------------------
"  vim rainbow
" ----------------------------------------
let g:rainbow_active = 1
" ----------------------------------------

" ----------------------------------------
" vim after object config
" ----------------------------------------
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" # va=  visual after =
" # ca=  change after =
" # da=  delete after =
" # ya=  yank after =
" apple = 'juice'
" ----------------------------------------

" ----------------------------------------
" vim tabular config
" ----------------------------------------
nmap <leader>= :Tabularize /=<CR>
vmap <leader>= :Tabularize /=<CR>
nmap <leader>: :Tabularize /:\zs<CR>
vmap <leader>: :Tabularize /:\zs<CR>
" ----------------------------------------

" ----------------------------------------
" vim table mode config
" ----------------------------------------
" <leader>tm to start table mode

" || or __ to quickly enable / disable table mode in insert mode
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ----------------------------------------


" ----------------------------------------
" vim markdown preview config
" ----------------------------------------
nmap <leader>pv <Plug>MarkdownPreviewToggle
" ----------------------------------------

" ----------------------------------------
" coc explorer config
" ----------------------------------------
nnoremap 'e :CocCommand explorer<CR>
" ----------------------------------------

" ----------------------------------------
" colorscheme config
" ----------------------------------------
colorscheme OceanicNext
hi Search ctermbg=LightBlue guibg=LightBlue
hi Search ctermfg=Red guifg=Red
" ----------------------------------------

" ----------------------------------------
" ccc highlight config --- make sure this part is below the colorscheme part
" to override the default colorscheme settings
" ----------------------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight CocHighlightText ctermfg=LightMagenta guifg=LightMagenta guibg=Black ctermbg=Black
nnoremap <leader>pc :call CocAction('pickColor')<CR>
nnoremap <leader>cp :call CocAction('colorPresentation')<CR>
" ----------------------------------------

" ----------------------------------------
" airline config
" ----------------------------------------
" let g:airline_theme= 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_powerline_fonts = 0
" ----------------------------------------

" ----------------------------------------
" vim-visual-multi usage
" ----------------------------------------
let g:VM_maps = {}
let g:VM_maps['Find Under']      = '<leader>n'
let g:VM_maps['Find Subword Under'] = '<leader>n'

" select words with Ctrl-N (remapped to <leader>n) (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" select one character at a time with Shift-Arrows
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" start insert mode with i,a,I,A

" ----------------------------------------
" vim-surround usage
" ----------------------------------------
nmap <leader>[ ysiw[
nmap <leader>] ysiw]

nmap <leader>{ ysiw{
nmap <leader>} ysiw}

nmap <leader>( ysiw(
nmap <leader>) ysiw)

nmap <leader>' ysiw'

nmap <leader>` ysiw`

nmap <leader>" ysiw"

nmap <leader>$ ysiw$

nmap <leader>< ysiw<
nmap <leader>> ysiw>

nmap <leader>* ysiw*
"  cs <now surround> <target surround> cs'"
"  ysiw <surround sign> surround the current word surrounded by space
"  ysw <surround sign> surround the current word
"  yse <surround sign>
"  ys$ <surround sign>
"  ys0 <surround sign>
"  ...
"  yss <surround sign> surround the current line
"  ----------------------------------------

" ----------------------------------------
" coc-pairs config
" ----------------------------------------
autocmd FileType tex let b:coc_pairs = [["$", "$"]]
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
" ----------------------------------------

" ----------------------------------------
" coc config
" ----------------------------------------
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-css',
            \ 'coc-pyright',
            \ 'coc-html',
            \ 'coc-lua',
            \ 'coc-pairs',
            \ 'coc-explorer',
            \ 'coc-vimlsp',
            \ 'coc-diagnostic',
            \ 'coc-snippets',
            \ 'coc-highlight',
            \ 'coc-stylelint',
            \ 'coc-syntax',
            \ 'coc-translator',
            \ 'coc-tsserver',
            \ 'coc-yaml',
            \ 'coc-yank',
            \ 'coc-docker',
            \ 'coc-sourcekit',
            \ 'coc-tasks',
            \ 'coc-emoji',
            \ 'coc-word']

let g:coc_disable_transparent_cursor = 0

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
set signcolumn=yes

" coc-translator
nmap ts <Plug>(coc-translator-p)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-n> to trigger completion.
inoremap <silent><expr> <c-n> coc#refresh()

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `g[` and `g]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Symbol renaming.
nmap <leader>x <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>ff  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" ----------------------------------------

" ----------------------------------------
"  coc list
" ----------------------------------------

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Mappings for CoCList
nnoremap <silent><nowait> <leader>yy :<C-u>CocList -A --normal yank<cr>
" Show commands.
nnoremap <silent><nowait> <leader>mm  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>oo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>bb  :<C-u>CocList -I symbols<cr>
" coc-task config
noremap <silent><nowait> <leader>tt :<C-u>CocList tasks<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>rr  :<C-u>CocListResume<CR>
" ----------------------------------------


" ----------------------------------------
" coc-snippets
" ----------------------------------------
" Use <C-l> for trigger snippet expand. instead use tab
" imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:snips_author = '@pkuanjie'
" ----------------------------------------

" ----------------------------------------
" nerdcommenter config
" ----------------------------------------

" Create default mappings
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

nmap '' <Plug>NERDCommenterToggle
vmap '' <Plug>NERDCommenterToggle
nmap '; <Plug>NERDCommenterSexy
vmap '; <Plug>NERDCommenterSexy
nmap 'y <Plug>NERDCommenterYank
vmap 'y <Plug>NERDCommenterYank
nmap '] <Plug>NERDCommenterAppend
vmap '] <Plug>NERDCommenterAppend
nmap '[ <Plug>NERDCommenterToEOL
vmap '[ <Plug>NERDCommenterToEOL

nnoremap <silent> 'p vip:call NERDComment('x', 'toggle')<CR>

" ----------------------------------------
"
" ========================================
" Ending
" ========================================
exec "nohlsearch"
" ========================================
"
