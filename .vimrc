filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundle 'thinca/vim-ref'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'surround.vim'
Bundle 'tpope/vim-markdown'
Bundle 'itspriddle/vim-marked'
Bundle 'mattn/zencoding-vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-visualstar'
Bundle 'tComment'
Bundle 'Align'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-coffee-script'
Bundle 'open-browser.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'kana/textobj-user'
Bundle 'kana/vim-textobj-indent.git'

Bundle 'Shougo/unite.vim'
Bundle 'Sixeight/unite-grep'
Bundle 'tsukkee/unite-tag'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'
Bundle "eagletmt/unite-haddock"

Bundle 'jimenezrick/vimerl'
Bundle "sontek/rope-vim"
Bundle 'lambdalisue/vim-python-virtualenv'
Bundle "haskell.vim"
Bundle "ujihisa/neco-ghc"
Bundle "ujihisa/ref-hoogle"
Bundle "eagletmt/ghcmod-vim"
Bundle "sonesuke/tumblr-vim"
Bundle "spolu/dwm.vim"

filetype plugin indent on

set number " 行番号
set incsearch " インクリメンタルサーチ
set antialias " アンチエイエリアス
set nobackup " バックアップを取らない
set noswapfile "スワップファイルを作らない
set nowrap " 折り返しをしない
set hidden " 編集中でも他のファイルを開けるようにする
set guioptions-=T
set backspace=indent,eol,start "バックスペースでインデントや改行を削除できるようにする
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set clipboard+=unnamed " OSのクリップボードを使用する
set mouse=a " ターミナルでマウスを使用できるようにする
set guioptions+=a
set ttymouse=xterm2
set showmatch         " 括弧の対応をハイライト
set display=uhex      " 印字不可能文字を16進数で表示
set laststatus=2 " 常にステータスラインを表示
set ruler "カーソルが何行目の何列目に置かれているかを表示する
set cursorline
set lazyredraw " コマンド実行中は再描画しない
set ttyfast " 高速ターミナル接続を行う
set imdisable "IME自動切り替えをOFFにする

" タブ移動リマップ
nnoremap tn gt
nnoremap tp gT
nnoremap tc :tabnew<CR>
nnoremap tk :tabclose<CR>

" remap ESC
inoremap jj <Esc>

" clear highlight
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" Replace a word at cursol with yanked words.
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" python setting
let python_highlight_all=1
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd BufWritePre *.py :%s/\s\+$//ge
autocmd FileType python nnoremap ttd :<C-u>!py.test --pep8 --cov-report term-missing --cov .<CR>

" ruby setting
autocmd FileType ruby setl autoindent
autocmd FileType ruby setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" coffee-script setting
autocmd FileType coffee setl autoindent
autocmd FileType coffee setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" markdown setting
autocmd FileType markdown setl autoindent
autocmd FileType markdown setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType markdown nnoremap ttd :<C-u>MarkedOpen<CR>

" haskell setting
autocmd Filetype haskell nnoremap ttd :<C-u>!doctest %<CR>

" unite
nnoremap [unite]   <Nop>
nmap     , [unite]
nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep:%:-iHRn<CR>
nnoremap <silent> [unite]t  :<C-u>Unite tag<CR>
nnoremap <silent> [unite]h  :<C-u>Unite -start-insert help<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]l  :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]r  :<C-u>Unite source resume<CR>

let g:unite_source_file_mru_limit = 200
" let g:unite_source_history_yank_enable = 1
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " Use neocomplcache.

" tumblr
let g:tumblr_email="iamsonesuke@gmail.com"
let g:tumblr_group="tech.timlip.com"

" japanese character code
:set encoding=utf-8
:set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

