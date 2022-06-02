"Plugins////////////////////////////////////////////////////////////////
set nocompatible "Что то там с Vi связанное
let g:polyglot_disabled = ['markdown'] "Polyglot default
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Дерево проекта
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Nice tree
Plug 'ryanoasis/vim-devicons' " icons 
Plug 'airblade/vim-gitgutter' "Что-то про гит
Plug 'bignimbus/pop-punk.vim' "colorschemes
Plug 'mbbill/undotree' " Буфер изменений на f5
Plug 'vim-airline/vim-airline' "Бар внизу
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary' "gc закоментировать
Plug 'mihaifm/bufstop' "буфер нвигация
Plug 'tpope/vim-surround' "Обернуть в теги
Plug 'tpope/vim-repeat' " Репит для оборота в теги
Plug 'mattn/emmet-vim' " Html снипет
"js +ts plugins
"Plug 'HerringtonDarkholme/yats.vim' "Подсветка для TS
Plug 'sheerun/vim-polyglot' "Подсветка для всех языков!!

"Plug 'pangloss/vim-javascript' "Подсветка ситаксиса js
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'dense-analysis/ale' "вместо coc.nvim

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

set number
set expandtab
set tabstop=2
set hlsearch
set incsearch
set mouse=a
let mapleader=" "
set mousemodel=popup
set scrolloff=8
set updatetime=750
set clipboard=unnamedplus " общий clipboard в linux и vim
set showcmd " показывет "
set backspace=eol,start,indent "Типо нормализует backspace(?)
set whichwrap+=<,>,h,l " хз что это, что то со строками(?)
set signcolumn=yes

"Coc-depend////////////////////////////////////////////////////////////////
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=UTF-8

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"colorScheme////////////////////////////////////////////////////////////////
colorscheme pop-punk
set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

" Restore last position////////////////////////////////////////////////////////////////
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"mappings////////////////////////////////////////////////////////////////
"nerdtree NERDTree
"map <C-n> :NERDTreeToggle<CR>
"map <F6> :UndotreeToggle<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1

"mapings for buffer 1. закрыть текущий буфер(типо закрыть)
"qa закрыть все буферы кроме текущего
nmap <leader>qa :bufdo bd<cr> 
nmap <leader>qq :bd<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bp<cr>

"buffer toggle
map <leader>b :Bufstop<CR>
let g:BufstopAutoSpeedToggle = 1
"map <leader>b :ls<CR>:b " показывает реальные бафферы
" Window navigation////////////////////////////////////////////////////////////////
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Airline////////////////////////////////////////////////////////////////
" для красоты
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline_theme = 'pop_punk'
let g:airline_section_z = airline#section#create('%3p%% %#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__# %3v') " эта штука нормализует нижний бар
"vim-coc////////////////////////////////////////////////////////////////
let g:coc_disable_startup_warning = 1

"vim-coc tab autocomplite
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"vim-coc Выбрать форматер
"nmap <leader> ca <Plug>(coc-codeaction)
xmap <leader>a  <Plug>(coc-codeaction)
nmap <leader>a  <Plug>(coc-codeaction)

"vim-coc найти определение
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"vim-coc fix
nmap <leader>qf <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" rename in all files
nmap <leader>rn <Plug>(coc-rename)

" All extencions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"
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

" Add `:Format` command to format current buffer with pretter.
"command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Format :call CocAction('runCommand', 'prettier.formatFile')
nmap  <leader>f :Format<cr>
" это что gd работало
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-css', 'coc-html']

"coc-eslint
":CocCommand eslint.executeAutofix

" Fzf fzf maps
map <Leader>mf :Files<CR>
map <Leader>ma :Rg<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --follow'

