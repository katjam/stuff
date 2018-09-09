set nocompatible               " Be iMproved
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" BEGIN PLUGINS

Plugin 'VundleVim/Vundle.vim'

" Utils
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'edsono/vim-matchit'
Plugin 'Valloric/MatchTagAlways'
Plugin 'AndrewRadev/switch.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Emmet.vim'
Plugin 'ervandew/supertab'
Plugin 'Shougo/vimfiler.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'chrisbra/NrrwRgn'
Plugin 'vim-scripts/scratch.vim'
" UI
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
" Snippets
Plugin 'SirVer/ultisnips'
" Filetypes
Plugin 'vim-ruby/vim-ruby'
Plugin 'othree/html5-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'wlangstroth/vim-haskell'
Plugin 'hspec/hspec.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'vim-syntastic/syntastic'
" Theme
Plugin 'morhetz/gruvbox'

" Elm
Plugin 'lambdatoast/elm.vim'
Plugin 'elmcast/elm-vim'

" Required:
call vundle#end()

" END PLUGINS

" BEGIN CONFIG
filetype plugin indent on
syntax enable
set shell=/bin/zsh
set history=1000
set undolevels=1000
set mouse=a
set nocompatible   " Disable vi-compatibility
set t_Co=256
"colorscheme xoria256
set guifont=menlo\ for\ powerline:h16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set smartindent
set foldenable
set foldmethod=indent
set foldlevelstart=99
set wildmenu
set wildmode=list:longest
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=500 ttimeoutlen=0
"set visualbell           " don't beep
"set noerrorbells         " don't beep
"set hidden
set tags=./tags,tags;$HOME
set splitbelow
set splitright
"Show (partial) command in the status line
set showcmd
" Swap files out of the project root
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set encoding=utf-8 " Necessary to show Unicode glyphs
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline) 
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set list                          " Show unprintable characters
set listchars=tab:>\              " Char representing a tab
set listchars+=extends:?          " Char representing an extending line
set listchars+=precedes:?         " Char representing an extending line in the other direction
set listchars+=nbsp:.             " Non breaking space
set listchars+=trail:.            " Show trailing spaces as dots
set showbreak=?                   " Show wraped lines with this char
set t_Co=256                      " More colors please
set scrolloff=3                   " Min. lines to keep above or below the cursor when scrolling
set ruler                         " Show current cursor position
" set scrolljump=5                  " Scroll more than one line
set wrap                          " Wrap long lines
set incsearch                     " Perform incremental searching
set hlsearch                      " Highlight search matches
set linebreak                     " Don't break lines in the middle of words
set fillchars+=vert:\             " Don't show pipes in vertical splits

highlight Search cterm=underline


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
 " Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>' 
" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
" let g:phpcomplete_index_composer_command = 'composer'
let g:gitgutter_max_signs = 1024

" Fast saves
nmap <leader>w :w!<cr>
nmap <leader>f gg=G<cr>
" Easy escape insert mode
imap jj <esc> 
"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>
nmap <C-b> :NERDTreeToggle<cr>
"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>
" Create split below
nmap :sp :rightbelow sp<cr>
" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr> 
" Edit todo list for project
nmap ,todo :e todo.txt<cr>
nmap <C-r> :redo
" Visual mode surround bindings
xmap " S"
xmap ' S'
xmap [ S[
xmap ( S(
xmap { S{
" Paste toggle
set pastetoggle=<F4>
nmap <F5> gg"+yG<cr>

" gruvbox
set background=dark
colorscheme gruvbox

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>
nmap ,lf :call FacadeLookup()<cr>

" git
noremap <leader>g :Git 
noremap <leader>gb :Gblame<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>gp :Git push<cr>
noremap <leader>gr :Gremove<cr>
noremap <leader>gs :Gstatus<cr>
noremap <leader>ga :Gwrite<cr>
noremap <leader>gg :w<cr>:Gwrite<cr>:Gcommit -m 'update'<cr>:Git push<cr><cr>:e<cr>
hi Cursor ctermfg=red ctermbg=white

" autocmd FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch 
" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
" Remove search results
command! H let @/=""
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" }}}

" ==== Abbreviations =============== {{{
" ==================================

" When typing %% expand it into the path to the current file
cnoremap %% <C-R>=expand('%:h') . '/'<cr>

iabbrev @@ drew@phenocode.com
 
" Abbreviations
abbrev pft PHPUnit_Framework_TestCase
abbrev gm !php artisan generate:model
abbrev gmig !php artisan generate:migration
 
" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }
 
    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
 
" Create/edit file in the current directory
nmap :ed :edit %:p:h/
 
" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')
    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif
    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>

nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <leader>b :Unite -quick-match buffer<cr>

" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ') 
    let segments = split(namespace, '\')
    let typehint = segments[-1]
    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['
    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g'
endfunction
nmap ,2  :call AddDependency()<cr>

" Unite
let g:unite_source_history_yank_enable = 1
"call unite#filters#matcher_default#use(['matcher_fuzzy'])


" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Elm format
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_jump_to_error = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" php-cs-fixer
let g:php_cs_fixer_rules = "@PSR2"
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
