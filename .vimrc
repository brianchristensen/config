"""""""""""""""""""""""""""""""""""""
" Brian Christensen Vim configuration
"""""""""""""""""""""""""""""""""""""
set nocompatible

filetype off

" ----- Vundle Plugin Manager -----------------------------------------
"  Install vundle with this command: git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
"  Install plugins with this command: vim +PluginInstall +qall or by typing :PluginInstall inside Vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Themes/Color Pallete ------------------------------------------
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ----- IDE Features -------------------- -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'w0rp/ale'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-endwise'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-dadbod'
Plugin 'mileszs/ack.vim'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
" Automatic closing of brackets, etc.
Plugin 'Raimondi/delimitMate'
" Highlight and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
Plugin 'godlygeek/tabular'
" Automaticall insert the closing tag
Plugin 'alvan/vim-closetag'

" ----- Language support plugins --------------------------------------
" -- Elixir --
Plugin 'elixir-editors/vim-elixir'
Plugin 'mhinz/vim-mix-format'
Plugin 'slashmili/alchemist.vim'
" -- Javascript --
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'

call vundle#end()

" --- General settings ------------------------------------------------
set autoindent                              " Copy indent from last line when starting new line
set autoread                                " Reload files changed outside automatically
set backspace=indent,eol,start
set complete=.,w,b,u,t,i
set completeopt=longest,menu
set cursorline                              " Highlight current linei
set diffopt+=iwhite                         " Ignore whitespaces with vimdiff
set diffopt=filler                          " Add vertical spaces to keep right and left aligned
set encoding=utf-8 nobomb                   " BOM often causes trouble
set expandtab                               " Expand tabs to spaces
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set foldcolumn=0                            " Column to show folds
set foldenable                              " Enable folding
" set foldlevel=0                           " Close all folds by default
set foldlevelstart=99                       " Open all folds by default
set foldmethod=indent                       " Syntax are used to specify folds
set foldminlines=0                          " To allow folding single lines set this to 0
set foldnestmax=10
set history=1000                            " Increase history from 20 default to 1000
set hlsearch                                " Highlight searches
set ignorecase                              " Ignore case of searches
set incsearch                               " Highlight dynamically as pattern is typed
set laststatus=2                            " Always show status line
set lazyredraw                              " Don't redraw when we don't have to
set magic                                   " Enable extended regexes
set modeline
set nobackup
set noerrorbells                            " Disable error bells
set nojoinspaces                            " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode                              " Don't show the current mode (airline.vim takes care of us)
set nostartofline                           " Don't reset cursor to start of line when moving around
set notitle
set number                                  " Enable line numbers
set omnifunc=syntaxcomplete#Complete        " Set omni-completion method
" set relativenumber                        " Uncomment to go from absolute -> hybrid line numbers
set regexpengine=1
set ruler                                   " Show the cursor position
set scrolloff=2                             " Start scrolling two lines before horizontal border of window
set shiftwidth=1                            " The # of spaces for indenting
set shortmess=atI                           " Don't show the intro message when starting vim
set showcmd                                 " display incomplete commands
set smartcase                               " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab                                " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set splitbelow                              " New window goes below
set splitright                              " New windows goes right
set tags=./tags;
set timeout timeoutlen=1000 ttimeoutlen=10  " No delay for entering normal mode
set ttyfast                                 " Send more characters at a given time
set undodir=~/.vim/.undo
set undofile                                " Persistent Undo
set undolevels=1000
set undoreload=10000
set wildchar=<Tab>                          " Character for CLI expansion (TAB-completion)
set wildmenu                                " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest                   " Complete only until point of ambiguity
set wrap!                                   " Dont wrap at 80 chars
set wrapscan                                " Searches wrap around end of file
set wildignore+=**/*.jpg,*.jpeg,*.gif,**/*.png,*.gif,*.psd,*.o,*.obj,*.min.js
"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*

" Enable syntax highlighting
syntax on

" Enable mouse support
set mouse=a

" Set color scheme
colorscheme gruvbox
let g:airline_theme='gruvbox'
set background=dark
set termguicolors

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- Tabbing and Shift-Tabbing -------------------------------------
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
" shift-tab for command mode
nnoremap <S-Tab> <<
" shift-tab for insert mode
inoremap <S-Tab> <C-d>

" ----- Keyboard bindings ---------------------------------------------
" double escape will clear search highlights
nnoremap <esc><esc> :noh<return>
" clear last used search pattern by searching for empty string
:let @/ = ""
" file tab hotkeys
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" ----- Plugin-Specific Settings --------------------------------------
command! GdiffInTab tabedit %|vsplit|Gdiff

" ----- mileszs/ack.vim settings -----
let g:ackprg = 'ag --nogroup --nocolor --column' " enables silver searcher integration
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
cnoreabbrev ack Ack

" ----- ctrlpvim/ctrlp.vim settings -----
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ----- morhetz/gruvbox settings -----
let g:gruvbox_contrast_dark="hard"

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" IGNORE: The following is unnecessary - on Mac use iTerm2 with FiraCode font
" Fancy arrow symbols require a patched font on terminal-only systems
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:rehash256 = 1

" ----- slashmili/alchemist.vim settings -----

" ----- luochen1990/rainbow settings -----
let g:rainbow_active = 1

" ----- ntpeters/vim-better-whitespace -----
let g:better_whitespace_enabled=0 " highlight whitespace toggle
let g:strip_whitespace_on_save=0 " strip trailing whitespace on save toggle

" ----- alvan/vim-closetag settings -----
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 0
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup=0
" Show dotfiles
let NERDTreeShowHidden=1
" Ignore ctags
let NERDTreeIgnore=['tags']

" ----- scrooloose/syntastic settings -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✘'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
augroup mySyntastic
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- mhinz/vim-mix-format settings -----
let g:mix_format_on_save = 0
let g:mix_format_silent_errors = 0

" ----- Valloric/YouCompleteMe settings ---
"let g:ycm_path_to_python_interpreter="/Users/brian/anaconda/bin/python3.6"

" ----- Language specific ctag settings -------------------------------
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm'
    \ }
\ }

