set nocompatible
filetype off

"-----------------------------------------------
" Setting up Vundle - the vim plugin bundler 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Add your bundles here

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"Bundle 'vim-scripts/FuzzyFinder'
"Plugin 'wincent/command-t'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

" neat statusline and tabline
Plugin 'bling/vim-airline'

" CALENDAR
Plugin 'itchyny/calendar.vim'

" CODE FORMATTING
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmtlib'
Plugin 'google/vim-codefmt'

" GIT
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Tim Pope's bunch of plugins
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'

" Running ':Tab /=' will align selected or whole file's = in a column
" moreinfo http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Surrounds
" do cs"'  to change "Hellow" to 'Hellow', 'hellow' to <q>hellow</q>
Plugin 'tpope/vim-surround'

" AUTO-PAIRS : Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'

Plugin 'myusuf3/numbers.vim'

Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplete.vim'

Bundle 'edsono/vim-matchit' 

Bundle 'kshenoy/vim-signature'
Bundle 'mkitt/tabline.vim'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Snippet manager
" Bundle 'msanders/snipmate.vim'

" COLORSCHEMES
" http://stackoverflow.com/questions/1199267/braces-and-operators-coloring-in-vim-for-c
Bundle 'morhetz/gruvbox'

" Tag navigation
" ! currently switched to tabline feature of airline plugin
"Bundle 'majutsushi/tagbar'

" \p \P to move forward/backward in yankstack
Bundle 'maxbrunsfeld/vim-yankstack' 

Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'

" RAINBOW PARENTHESES IMPROVED
" braces coloring
Plugin 'oblitum/rainbow'

" Vim motion on speed!
" \\ w e b j k
" Plugin 'Lokaltog/vim-easymotion'

" TODO: set up
Bundle 'heavenshell/vim-jsdoc'

"JAVASCRIPT / JS
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Bundle 'walm/jshint.vim'
Bundle 'kchmck/vim-coffee-script'

" Webdev
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'lukaszb/vim-web-indent'

" Setting up Vundle - the vim plugin bundler end
"-----------------------------------------------
syntax on


" Vimballs
" - http://vim.wikia.com/wiki/Applying_substitutes_to_a_visual_block

" Buffer options
set hidden                  " hide buffers when they are abandoned
set autoread                " auto reload changed files

" Display options
set title                   " show file name in window title
set virtualedit=all
set novisualbell            " mute error bell
set nowrap
set linebreak               " break lines by words
set list listchars=tab:▸\ ,eol:¬,extends:☠,precedes:❤
" splits
" set splitbelow
" set splitright 
set background=dark     " you can use `dark` or `light` as your background
color mangofruit
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

" for 'c' adds $ sing at the end of changing block
set cpoptions+=$


set scrolljump=1
set scrolloff=5           " min 4 symbols below cursor
set sidescroll=4
set sidescrolloff=10

set showcmd

set whichwrap=b,s,<,>,[,],l,h
set completeopt=menu,preview
set infercase
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set ttyfast                 " Optimize for fast terminal connections
set shortmess=atI           " Don’t show the intro message when starting Vim

set pastetoggle=<F2>

" ======================================================
" Numbers, relative numbers
"nnoremap <F3> :NumbersToggle<CR>:set nu!<CR>
set nu
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" ======================================================
" works for gui only: diff cursor for i/n modes
set guicursor+=n-v-c:blinkon0
" ======================================================
" YANKSTACK
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
let g:yankstack_map_keys = 0
" ======================================================
" RAINBOW PARENTHESES IMPROVED
let g:rainbow_active = 1

let g:rainbow_load_separately = [
     \ [ '*.js' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
     \ [ '*.coffee' , [['(', ')'], ['\[', '\]'], ['{', '}']] ]
     \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = [244, 249]

" ======================================================
" JAVASCRIPT / JS
" Enables concealing characters. For example, function is replaced with ƒ
let g:javascript_conceal=1

" ======================================================
" EASYMOTION
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" ======================================================
" AIRLINE
" themes: 'bubblegum' 'understated'
let g:airline_theme='sol'
"user airline's tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
set laststatus=2
"if has("gui_running")
let g:airline_powerline_fonts=2
" Even special font for this crap
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11
"endif

function! AirlineOverride(...)
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create_left(['branch'])
    let g:airline_section_c = airline#section#create_left(['%f'])
    let g:airline_section_y = airline#section#create([])
endfunction
autocmd VimEnter * call AirlineOverride()

" ======================================================
" TERN
let g:tern_show_argument_hints = 'on_move'

" Tab options {{{
" Indentation tweaks:
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" }}}

" ======================================================
set autoindent              " copy indent from previous line
set smartindent             " enable nice indent
set expandtab               " tab with spaces
set smarttab                " indent using shiftwidth"
set shiftwidth=4          " number of spaces to use for each step of indent
set tabstop=8
set softtabstop=8           " tab like 4 spaces
set shiftround              " drop unused spaces

" Visuals
set fillchars+=vert:\ 
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
au VimEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Search options
set gdefault                " Add the g flag to search/replace by default
set hlsearch                " Highlight search results
set ignorecase              " Ignore case in search patterns
set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch               " While typing a search command, show where the pattern
nnoremap <silent><cr> :nohlsearch<cr>

" Matching characters
set showmatch               " Show matching brackets
set matchpairs+=<:>         " Make < and > match as well

" Localization
set langmenu=none            " Always use english menu
set nospell
set spelllang=en          " Languages
set encoding=utf-8           " Default encoding
set termencoding=utf-8
set fileformat=unix

set wildmenu

if has("gui_running") 
    set lines=999 columns=999 
endif 

" ======================================================
" Ultimate UI system for running fuzzy-search on different things {{{
" Shougo/unite.vim
" Always start insert mode
let g:unite_enable_start_insert = 2
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"

" `ag` is a faster and better replacement for the standard `find`, let Unite use
" it if it exists and configure to properly use `.gitignore` or `.hgignore`
" files if those exist.
" To install `ag`: brew install ag
" or: https://github.com/ggreer/the_silver_searcher
if executable("ag")
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Search settings
if exists("*unite")
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#set_profile('files', 'smartcase', 1)
endif
"}}}

" ======================================================
" Auto-completion plugin integrated with Unite and vimshell {{{
" 'Shougo/neocomplete.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" No limit on the results of these searches
let g:unite_source_file_rec_max_cache_files = 0
call unite#custom#source('file_rec/async', 'max_candidates', 0)

" Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}


" ======================================================
" NerdTree {{{
" open a NERDTree automatically when vim starts up if no files were specified
let g:nerdtree_tabs_open_on_console_startup = 1
" autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree

let g:NERDTreeWinPos = "right"
nnoremap <silent> <leader>t :NERDTreeTabsToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
" }}}

" Folding
if has('folding')
    set foldmethod=marker
    set foldlevel=99
    " toggle folds with space
    nmap <space> za
endif

" Open files
" Do not set autochdir (working dir should be root)
nnoremap <leader>e :e <c-r>=expand("%:h")<cr>/
nnoremap <leader>d :diffsplit <c-r>=expand("%:h")<cr>/
cmap <leader>e <c-r>=expand("%:h")<cr>/

let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
" set sessionoptions-=folds
"
" ======================================================
" Quick write session with F5
nmap <F5>:SaveSession! default<cr>
" And load session with F8
nmap <F8>:OpenSession! default<cr>

"REMAPPINGS
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" ======================
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" ======================================================
" No need to switch back to English in normal mode
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
