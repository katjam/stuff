if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

" call neobundle#rc(expand('~/.vim/bundle/'))
" Required:
call neobundle#begin(expand('/home/katja/.vim/bundle'))

" BEGIN PLUGINS

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', { 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \ } }
" Unite
NeoBundle "Shougo/unite.vim"
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'tsukkee/unite-help'
" Utils
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'Valloric/MatchTagAlways'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-scripts/Emmet.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'vim-scripts/scratch.vim'
NeoBundle 'Raimondi/delimitMate/'
NeoBundle 'FredKSchott/CoVim.git'
NeoBundle "Shougo/neocomplete.vim"
" NeoBundle "Townk/vim-autoclose"
" NERDTree & Commenter
NeoBundle "scrooloose/nerdcommenter"
NeoBundle "scrooloose/nerdtree"
" phpcomplete & laravel plugin
" NeoBundle "m2mdas/phpcomplete-extended"
" NeoBundle "m2mdas/phpcomplete-extended-laravel"
" UI
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
" Snippets
NeoBundle 'SirVer/ultisnips'
" Filetypes
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'wlangstroth/vim-haskell'
NeoBundle 'hspec/hspec.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
" Colors
NeoBundle "chriskempson/vim-tomorrow-theme"
NeoBundle "vim-scripts/xoria256.vim"
" Required:
call neobundle#end()

NeoBundleCheck

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
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
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

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>
nmap ,lf :call FacadeLookup()<cr>

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

" The prefix key
nnoremap [unite] <Nop>
nmap <space> [unite]

" General purpose
nnoremap [unite]<space> :Unite -no-split -start-insert source<cr>

" Files
nnoremap [unite]f :Unite -no-split -start-insert file_rec/async<cr>

" Files in laravel
nnoremap [unite]lm :Unite -no-split -start-insert -input=app/models/ file_rec/async<cr>
nnoremap [unite]lv :Unite -no-split -start-insert -input=app/views/ file_rec/async<cr>
nnoremap [unite]la :Unite -no-split -start-insert -input=app/assets/ file_rec/async<cr>
nnoremap [unite]lc :Unite -no-split -start-insert -input=app/controllers/ file_rec/async<cr>
nnoremap [unite]lg :Unite -no-split -start-insert -input=app/ file_rec/async

" Grepping
nnoremap [unite]g :Unite -no-split grep:.<cr>
nnoremap [unite]d :Unite -no-split grep:.:-s:\(TODO\|FIXME\)<cr>

" Content
nnoremap [unite]o :Unite -no-split -start-insert -auto-preview outline<cr>
nnoremap [unite]l :Unite -no-split -start-insert line<cr>
nnoremap [unite]t :!retag<cr>:Unite -no-split -auto-preview -start-insert tag<cr>

" Quickly switch between recent things
nnoremap [unite]F :Unite -no-split buffer tab file_mru directory_mru<cr>
nnoremap [unite]b :Unite -no-split buffer<cr>
nnoremap [unite]m :Unite -no-split file_mru<cr>

" Yank history
nnoremap [unite]y :Unite -no-split history/yank<cr>

" }}}

" ==== Abbreviations =============== {{{
" ==================================

" When typing %% expand it into the path to the current file
cnoremap %% <C-R>=expand('%:h') . '/'<cr>

iabbrev @@ drew@phenocode.com
 
" Abbreviations
abbrev pft PHPUnit_Framework_TestCase
abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
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

" Autocomplete
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

