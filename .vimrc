filetype off
 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'surround.vim'
NeoBundle 'tpope/vim-markdown'
if has('mac')
	NeoBundle 'itspriddle/vim-marked'
endif
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'tComment'
NeoBundle 'Align'
NeoBundle 'DrawIt'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

NeoBundle 'lambdalisue/vim-python-virtualenv'
NeoBundle 'bruno-/vim-vertical-move'
NeoBundle 'osyo-manga/vim-over'

if has('mac')
	NeoBundle "sonesuke/tumblr-vim"
endif
NeoBundle "spolu/dwm.vim"

" NeoBundleLazy "davidhalter/jedi-vim", {
"       \ "autoload": {
"       \   "filetypes": ["python", "python3", "djangohtml"],
"       \ },
"       \ "build": {
"       \   "mac": "pip install jedi",
"       \   "unix": "pip install jedi",
"       \ }}
" let s:hooks = neobundle#get_hooks("jedi-vim")
" function! s:hooks.on_source(bundle)
" 	" jediにvimの設定を任せると'completeopt+=preview'するので
" 	" 自動設定機能をOFFにし手動で設定を行う
" 	let g:jedi#auto_vim_configuration = 0
" 	" 補完の最初の項目が選択された状態だと使いにくいためオフにする
" 	let g:jedi#popup_select_first = 0
" endfunction

NeoBundle 'tpope/vim-endwise'
NeoBundle 'airblade/vim-gitgutter.git'
if has('mac')
	NeoBundle 'glidenote/newdayone.vim'
endif

syntax on
NeoBundle "w0ng/vim-hybrid"
colorscheme hybrid
if !has('gui_running')
	set t_Co=256
	let g:hybrid_use_Xresources = 1
endif
NeoBundleCheck

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
set infercase
set shortmess+=I
set virtualedit+=block

" avoid miss type of C-@
imap <C-@> <C-[>

" japanese character code
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

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
autocmd FileType python nnoremap ttf :<C-u>%!autopep8 %<CR>
autocmd FileType python nnoremap ttd :<C-u>call PythonTTD()<CR>
autocmd FileType python nnoremap ttc :<C-u>!py.test --cov-report term-missing --cov .<CR>

function! PythonTTD()
	write
	sleep 300ms
	!py.test --pep8 .
endfunction!

" iec61131-3
autocmd BufNewFile,BufRead *.iec setf iec
autocmd FileType iec setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" ruby setting
autocmd FileType ruby setl autoindent
autocmd FileType ruby setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType ruby nnoremap ttd :<C-u>!rspec .<CR>

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
nnoremap <silent> [unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>
nnoremap <silent> [unite]h  :<C-u>Unite -start-insert help<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]w  :<C-u>UniteWithCursorWord line<CR>
nnoremap <silent> [unite]l  :<C-u>Unite line<CR>
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>

let g:unite_source_file_mru_limit = 200
let g:unite_source_history_yank_enable = 1
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

"}

" OmniComplete {
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
				\if &omnifunc == "" |
				\setlocal omnifunc=syntaxcomplete#Complete |
				\endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
" some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

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
let g:neocomplcache_snippets_disable_runtime_snippets = 1
let g:neocomplcache#sources#rsense#home_directory = expand('/usr/local/Cellar/rsense/0.3/')
let g:neocomplcache_skip_auto_completion_time = '0.3'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0

" SuperTab like snippets behavior.
" imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
" smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

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
" inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
" inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"
" endwise.vim とneocomplcache でマップが競合している問題を解消するハック
" <CR> をアンマップしてから再定義している
" http://d.hatena.ne.jp/rhysd/20111010/1318264556
"
iunmap <CR>
imap <buffer> <expr><CR>
      \ pumvisible() ? neocomplcache#smart_close_popup()."\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd"


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


" tumblr {
let g:tumblr_email="iamsonesuke@gmail.com"
let g:tumblr_group="tech.timlip.com"
"}

" gist {
let g:gist_show_privates = 1
let g:gist_post_private = 1
"}

" vim-airline {
let g:airline_theme='luna'
let g:airline_powerline_fonts=1
" }
