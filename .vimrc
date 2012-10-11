filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'surround.vim'
Bundle 'tpope/vim-markdown'
if has('mac')
	Bundle 'itspriddle/vim-marked'
endif
Bundle 'mattn/zencoding-vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'thinca/vim-visualstar'
Bundle 'tComment'
Bundle 'Align'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'open-browser.vim'

Bundle 'Shougo/unite.vim'
Bundle 'Sixeight/unite-grep'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'
Bundle "eagletmt/unite-haddock"

Bundle 'lambdalisue/vim-python-virtualenv'
Bundle "haskell.vim"
Bundle "ujihisa/neco-ghc"
Bundle "ujihisa/ref-hoogle"
Bundle "eagletmt/ghcmod-vim"

Bundle "sonesuke/tumblr-vim"
Bundle "sonesuke/pythonista-vim"
Bundle "spolu/dwm.vim"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'myusuf3/numbers.vim'

filetype plugin indent on

set number " 行番号
set incsearch " インクリメンタルサーチ
set antialias " アンチエイエリアス
set nobackup " バックアップを取らない
set noswapfile "スワップファイルを作らない
set nowrap " 折り返しをしない
set hidden " 編集中でも他のファイルを開けるようにする
set guioptions-=T
set guioptions-=m
set guioptions+=a
set backspace=indent,eol,start "バックスペースでインデントや改行を削除できるようにする
set whichwrap=b,s,h,l,<,>,[,] "カーソルを行頭、行末で止まらないようにする
set clipboard+=unnamed " OSのクリップボードを使用する
set mouse=a " ターミナルでマウスを使用できるようにする
set ttymouse=xterm2
set showmatch         " 括弧の対応をハイライト
set display=uhex      " 印字不可能文字を16進数で表示
set laststatus=2 " 常にステータスラインを表示
set ruler "カーソルが何行目の何列目に置かれているかを表示する
set cursorline
set lazyredraw " コマンド実行中は再描画しない
set ttyfast " 高速ターミナル接続を行う
set shortmess+=I
let mapleader=","

" japanese character code
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

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
autocmd BufWritePre *.py :RemoveUnwantedSpaces
autocmd FileType python nnoremap ttd :<C-u>call PythonTTD()<CR>
autocmd FileType python nnoremap ttc :<C-u>!py.test --cov-report term-missing --cov .<CR>

function! PythonTTD()
	write
	sleep 300ms
	!py.test --pep8 .
endfunction!

" ruby setting
autocmd FileType ruby setl autoindent
autocmd FileType ruby setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" markdown setting
autocmd FileType markdown setl autoindent
autocmd FileType markdown setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType markdown nnoremap ttd :<C-u>MarkedOpen<CR>

" haskell setting
autocmd Filetype haskell nnoremap ttd :<C-u>!doctest %<CR>

" unite {
nnoremap [unite]   <Nop>
nmap     , [unite]
nnoremap [unite]u  :<C-u>Unite<Space>
nnoremap <silent> [unite]f  :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]b  :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]m  :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]g  :<C-u>Unite grep:%:-iHRn<CR>
nnoremap <silent> [unite]h  :<C-u>Unite -start-insert help<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]w  :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> [unite]l  :<C-u>Unite line<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>

let g:unite_source_file_mru_limit = 200
let g:unite_source_history_yank_enable = 1
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"}

" neocomplcache {
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_snippets_dir = "$HOME//.vim//snippets"

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0

" SuperTab like snippets behavior.
imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 

" Plugin key-mappings.
" Ctrl-k expands snippet & moves to next position
" <CR> chooses highlighted value
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>   neocomplcache#undo_completion()
inoremap <expr><C-l>   neocomplcache#complete_common_string()
inoremap <expr><CR>    neocomplcache#complete_common_string()


" <CR>: close popup
" <s-CR>: close popup and save indent.
inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <TAB>: completion.
inoremap <expr><C-j>  pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>  pumvisible() ? "\<C-p>" : "\<C-k>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" }

" Fugitive {
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
"}

" easymotion {
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
"}

" tumblr {
let g:tumblr_email="iamsonesuke@gmail.com"
let g:tumblr_group="tech.timlip.com"
"}

