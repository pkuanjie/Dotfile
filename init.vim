" --------------------------------------------
"             _                          _ _
"  _ ____   _(_)_ __ ___  _ __ ___      | (_) ___
" | '_ \ \ / / | '_ ` _ \| '__/ __|  _  | | |/ _ \
" | | | \ V /| | | | | | | | | (__  | |_| | |  __/
" |_| |_|\_/ |_|_| |_| |_|_|  \___|  \___/|_|\___|
" --------------------------------------------
" Author: @pkuanjie
" Thanks: @theniceboy
" Date: 2021/6/18
" --------------------------------------------

" ========================================
" Basic Settings
" ========================================
let mapleader=";"
set encoding=UTF-8
set cursorline
if has("termguicolors")
	" enable true color
	set termguicolors
endif
set tabstop=4
if !exists('g:vscode')
	set number
endif
set showmatch
set hlsearch
set ignorecase smartcase
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set foldmethod=indent
set foldlevel=99
set foldenable
syntax on

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Spelling Check with <space>sc
noremap <leader>sp :set spell!<CR>

" find and replace
noremap \s :%s//g<left><left>

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" markdown, latex, auto spell
autocmd BufRead,BufNewFile *.md,*.tex setlocal spell

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" bind <A-a> to use it for increasing numbers and <A-x> to decrease
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" ========================================

" ========================================
" Plugins
" ========================================
if !exists('g:vscode')
	call plug#begin()
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'joshdick/onedark.vim'
	Plug 'morhetz/gruvbox'
	Plug 'sheerun/vim-polyglot'
	Plug 'jiangmiao/auto-pairs'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdcommenter'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'gcmt/wildfire.vim'
	Plug 'tpope/vim-surround'
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	Plug 'mbbill/undotree'
	Plug 'liuchengxu/vista.vim'
	Plug 'Chiel92/vim-autoformat'
	Plug 'junegunn/vim-peekaboo'
	Plug 'kshenoy/vim-signature'
	Plug 'ron89/thesaurus_query.vim'
	Plug 'mhinz/vim-startify'
	Plug 'jbgutierrez/vim-better-comments'
	Plug 'AndrewRadev/splitjoin.vim'
	Plug 'DougBeney/pickachu'

	" General Highlighter
	Plug 'RRethy/vim-illuminate'
	Plug 'ryanoasis/vim-devicons'

	Plug 'luochen1990/rainbow'
	" Find & Replace
	Plug 'Yggdroot/indentLine'
	Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
	Plug 'theniceboy/vim-snippets'
	Plug 'theniceboy/antovim' " gs to switch e.g., true -> false
	Plug 'junegunn/vim-after-object'
	Plug 'easymotion/vim-easymotion'
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

	Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
	Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
	Plug 'dkarter/bullets.vim'
	Plug 'lervag/vimtex'

	" colorschemes
	Plug 'jacoborus/tender.vim'

	call plug#end()
else
	call plug#begin()
	Plug 'preservim/nerdcommenter'
	call plug#end()
endif


" ----------------------------------------
"  vim semshi config
" ----------------------------------------
let g:semshi#mark_selected_nodes = 0
let g:semshi#error_sign = v:false
" ----------------------------------------

" ----------------------------------------
"  vim indentline config
" ----------------------------------------
let g:indentLine_color_term = 238
let g:indentLine_color_gui = '#444444'
" ----------------------------------------

" ----------------------------------------
"  vim splitjoin config
" ----------------------------------------
"  gS for split
"  gJ for join
" ----------------------------------------

" ----------------------------------------
"  vim easymotion config
" ----------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" ----------------------------------------

" ----------------------------------------
"  vim signature config
" ----------------------------------------
let g:tq_map_keys = 0
nnoremap <leader>rc :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <leader>rc y:ThesaurusQueryReplace <C-r>"<CR>
" ----------------------------------------

" ----------------------------------------
"  vim signature config
" ----------------------------------------
" mx           Toggle mark 'x' and display it in the leftmost column
" dmx          Remove mark 'x' where x is a-zA-Z
"
" m,           Place the next available mark
" m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
" m-           Delete all marks from the current line
" m<Space>     Delete all marks from the current buffer
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
" m<BS>        Remove all markers

" ----------------------------------------

" ----------------------------------------
"  vim autoformat config
" ----------------------------------------
noremap <leader>fm :Autoformat<CR>
let g:formatter_yapf_style = 'pep8'
" ----------------------------------------

" ----------------------------------------
"  vista config
" ----------------------------------------
nnoremap <leader>vv :Vista<CR>
" ----------------------------------------

" ----------------------------------------
"  undetree
" ----------------------------------------
nnoremap <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
" ----------------------------------------

" ----------------------------------------
"  vim rainbow
" ----------------------------------------
let g:rainbow_active = 1
" ----------------------------------------

" ----------------------------------------
" vim after object config
" ----------------------------------------
" # va=  visual after =
" # ca=  change after =
" # da=  delete after =
" # ya=  yank after =
" apple = 'juice'
" ----------------------------------------

" ----------------------------------------
" vim after object config
" ----------------------------------------
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
endif
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
" vim instant markdown config
" ----------------------------------------
filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
" ----------------------------------------

" ----------------------------------------
" vim illuminate config
" ----------------------------------------
" Don't highlight word under cursor (default: 1)
let g:Illuminate_highlightUnderCursor = 0

let g:Illuminate_ftblacklist = ['nerdtree']
let g:Illuminate_delay = 400
augroup illuminate_augroup
	autocmd!
	autocmd VimEnter * hi illuminatedWord ctermbg=12 guibg='#11515F'
augroup END
" ----------------------------------------

" ----------------------------------------
" coc explorer config
" ----------------------------------------
nnoremap tt :CocCommand explorer<CR>
" ----------------------------------------

" ----------------------------------------
" colorscheme config
" ----------------------------------------
colorscheme tender 
" ----------------------------------------

" ----------------------------------------
" airline config
" ----------------------------------------
let g:airline_theme='tender'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
" ----------------------------------------

" ----------------------------------------
" vim-visual-multi usage
" ----------------------------------------
"select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
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
" auto-pairs config
" ----------------------------------------
" System Shortcuts:
"   <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
"   <BS>  : Delete brackets in pair
"   <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
"   <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
"   <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
"   <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)
" ----------------------------------------

" ----------------------------------------
" coc config
" ----------------------------------------
let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-pyright', 'coc-html', 'coc-explorer', 'coc-vimlsp', 'coc-diagnostic', 'coc-prettier', 'coc-snippets', 'coc-stylelint', 'coc-syntax', 'coc-translator', 'coc-tsserver', 'coc-yaml', 'coc-yank']

let g:coc_disable_transparent_cursor = 1

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
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
"     inoremap <silent><expr> <c-space> coc#refresh()
" else
"     inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `g[` and `g]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

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
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
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
" ----------------------------------------

" ----------------------------------------
" nerdcommenter config
" ----------------------------------------
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
" ----------------------------------------

" ========================================
"
