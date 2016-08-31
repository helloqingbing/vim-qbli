"==========================================
" Author:  Qingbing Li
" Version: 0.1
" Email: liqingbing1987@163.com
" BlogPost: http://helloqingbing.sinaapp.com
" ReadMe: README.md
" Last_modify: 2016-03-15
" Sections:
"       -> Initial Plugin 
"       -> General Settings 
"       -> Display Settings 
"       -> FileEncode Settings 
"       -> Others 
"       -> HotKey Settings  
"       -> FileType Settings  
"       -> Theme Settings  
"==========================================

"==========================================
" Initial Plugin 
"==========================================
" modify leader key
let mapleader = ','
let g:mapleader = ','

syntax on
" install bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

"==========================================
" General Settings
"==========================================
set history=200
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set autoread
set shortmess=atI
set paste
"set backupext=.bak
"set backupdir=/tmp/vimbk/

set nobackup
set noswapfile

set background=dark
set t_Co=256
colorscheme molokai
set scrolloff=2

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" quite vim ,save screen
" set t_ti= t_te=

" set mouse-=a
" set mouse=a
set mouse=n
" Hide the mouse cursor while typing
" set mousehide

set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
set title
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
" set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set wrap
"==========================================
" Display Settings
"==========================================

" Display current line and column nubmer
set ruler
" Show command on the status bar
set showcmd
" show current mode
set showmode

set scrolloff=7

" set winwidth=79

"set statusline=%<%F\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2
function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "g")
    return curdir
endfunction
"[1] fsck_cbfstest.cxx |  pwd: /c4_working/work_ilc4/sade/src/dart/Dart/server/src/cbfs/test/fsck  | 108,101 43% | ascii=0,hex=0 | utf-8 | c4dev @ sles12-lij76-dev-01\
"set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\

set statusline=[%n]\ %{CurDir()}//%f%m%r%h\ \ %=\ [%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P 

set number
" set nowrap

" brace match
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


set hlsearch
set incsearch
set ignorecase
set smartcase

" folder code
set foldenable
" folder method
" manual    manually
" indent    indent
" expr      
" syntax    
" diff      
" marker    
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=5
set foldclose=""
set nofoldenable
nnoremap <space> @=(foldclosed(line("."))<0?'zc':'zo')<CR>
" Smart indent
set smartindent
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

set nrformats=

" relative line number, can use nj/nk break
" set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" miniBuffer"
noremap <tab> :bp<CR>
noremap <tab> :bn<CR>

" Omni-completion
filetype plugin indent on
set completeopt=longest,menu

" highlight current line
set cursorline
"hi CursorLine  cterm=NONE   ctermbg=darkgray ctermfg=black
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
" number color
highlight LineNr cterm=NONE ctermbg=black ctermfg=white
" hi LineNr guifg=white
"==========================================
" FileEncode Settings 
"==========================================
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

set formatoptions+=m
set formatoptions+=B



"=================================================
" Hotkey
"=================================================
" ,s auto save the edit file
func! SaveFile()
    exec 'w'
endfunc

map <leader>s :call SaveFile()<CR>
imap <leader>s <ESC>:call SaveFile()<CR>
vmap <leader>s <ESC>:call SaveFile()<CR>

nnoremap <silent> <F12> :A<CR>

func! QuitFile()
    exec 'q'
endfunc

map <leader>q :call QuitFile()<CR>
imap <leader>q <ESC>:call QuitFile()<CR>
vmap <leader>q <ESC>:call QuitFile()<CR>

map <C-a> ggVG
set tags=/c4_working/work_ilc5/sade/src/tags
map <F3> :tselect<CR>

" F2 turn on/off line number
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
