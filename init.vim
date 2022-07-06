"" Personal ViM Config

""" Main Configurations
filetype plugin indent on
set completeopt=menuone,noinsert,noselect
set splitright
set splitbelow
set list listchars=trail:»,tab:»-
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set textwidth=0
set hidden
set number
set relativenumber
set title
syntax on

" Snippets
noremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wall -g<CR>:packadd termdebug<CR>:Termdebug a.out<CR>
inoremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -Wall -g<CR>:packadd termdebug<CR>:Termdebug a.out<CR>

noremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
inoremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>

"noremap <F10> <ESC> :w <CR> :!clang++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
"inoremap <F10> <ESC> :w <CR> :!clang++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>

noremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < main<CR>
inoremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o "%<" "%" && "./%<" < main<CR>

" Buffer Setup
nnoremap <F5> :buffers<CR>:buffer<Space>
set wildchar=<Tab> wildmenu wildmode=full



if (has("termguicolors"))
    set termguicolors
endif

let mapleader = " "
nnoremap <leader>v :e $MYVIMRC<CR>

""" Vim-Plug
call plug#begin('~/.config/nvim/plugged')

""" VIM Plugins

" Aesthetics - Main
Plug 'jiangmiao/auto-pairs'
Plug 'bryanmylee/vim-colorscheme-icons'             " File Icons
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'                      " VIM Airline
Plug 'vim-airline/vim-airline-themes'


" Quality of Life
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'

""" LUA Configurations
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'applejwjcat/dashboard-nvim'

""" NVIM Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" require plugin configs
lua require('itani')

""" Plugins
""
" Colorscheme
colorscheme codedark





" VIM Airline
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline_theme='onedark'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_powerline_fonts=1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

"NVIM Dashboard
let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_header = [
    \' ██▓███   ██░ ██  ██▓ ██▓     ██▓     ██▓ ██▓███    ██████ ',
    \'▓██░  ██▒▓██░ ██▒▓██▒▓██▒    ▓██▒    ▓██▒▓██░  ██▒▒██    ▒ ',
    \'▓██░ ██▓▒▒██▀▀██░▒██▒▒██░    ▒██░    ▒██▒▓██░ ██▓▒░ ▓██▄   ',
    \'▒██▄█▓▒ ▒░▓█ ░██ ░██░▒██░    ▒██░    ░██░▒██▄█▓▒ ▒  ▒   ██▒',
    \'▒██▒ ░  ░░▓█▒░██▓░██░░██████▒░██████▒░██░▒██▒ ░  ░▒██████▒▒',
    \'▒▓▒░ ░  ░ ▒ ░░▒░▒░▓  ░ ▒░▓  ░░ ▒░▓  ░░▓  ▒▓▒░ ░  ░▒ ▒▓▒ ▒ ░',
    \'░▒ ░      ▒ ░▒░ ░ ▒ ░░ ░ ▒  ░░ ░ ▒  ░ ▒ ░░▒ ░     ░ ░▒  ░ ░',
    \'░░        ░  ░░ ░ ▒ ░  ░ ░     ░ ░    ▒ ░░░       ░  ░  ░  ',
    \'          ░  ░  ░ ░      ░  ░    ░  ░ ░                 ░  ',
    \]


let g:mapleader="\<Space>"
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :Telescope oldfiles<CR>
nnoremap <silent> <Leader>ff :Telescope find_files<CR>
nnoremap <silent> <Leader>tc :Telescope colorscheme<CR>
nnoremap <silent> <Leader>fa :Telescope grep_string<CR>
nnoremap <silent> <Leader>fb :Telescope marks<CR>
nnoremap <silent> <Leader>cf :DashboardNewFile<CR>
let g:indentLine_fileTypeExclude = ['dashboard']

let g:dashboard_custom_shortcut={
  \ 'last_session'       : 'SPC s l',
  \ 'find_history'       : 'SPC f h',
  \ 'find_file'          : 'SPC f f',
  \ 'new_file'           : 'SPC c f',
  \ 'change_colorscheme' : 'SPC t c',
  \ 'find_word'          : 'SPC f a',
  \ 'book_marks'         : 'SPC f b',
  \ }

" fzf.vim
nnoremap <leader><space> :GFiles<CR>
" vim-fugitive
nnoremap <leader>gg :G<CR>

" Telescope
" NERD Tree
nnoremap \\ :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Tagbar
let g:tagbar_width = 30
nmap \| :TagbarToggle<CR>

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>"
