let mapleader="\<Space>"
" vimprocのdllを自前コンパイルではなくダウンロードする用
" http://thinca.hatenablog.com/entry/20160302/1456892154
let g:vimproc#download_windows_dll = 1

" Pythonのパス
let g:python3_host_prog = fnameescape(expand('C:\ProgramData\Anaconda3\python.exe'))

" Neovim設定ディレクトリ
let nvim_dir = substitute(expand($XDG_CONFIG_HOME) . '/nvim/', '\', '/', 'g')

" deinの関連のパス
let dein_path = 'github.com/Shougo/dein.vim'
let dein_url = 'https://' . dein_path

" プラグインをインストールするディレクトリ
let s:dein_dir = nvim_dir . '.cache/dein/'
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . 'repos/' . dein_path

" dein.vimがなければインストールする
if !isdirectory(s:dein_repo_dir)
  execute '!git clone ' . dein_url s:dein_repo_dir
endif

if &compatible
  set nocompatible
endif

" dein.vimをruntimepathへ追加
let &runtimepath = s:dein_repo_dir . "," . &runtimepath

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストファイル
  let s:toml = nvim_dir . '/plugins.toml'
  let s:lazy_toml = nvim_dir . '/plugins_lazy.toml'
  " プラグインリストを読み込みキャッシュする
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" 未インストールのプラグインがある場合はインストール
if dein#check_install()
  call dein#install()
endif

" カラースキーム
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme tender

set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start " バックスペースでなんでも消せるようにする
set nowritebackup
set nobackup
set noswapfile
set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set laststatus=2

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

"クリップボードはCtrl+p,y
nnoremap <C-p> "+p<CR>
inoremap <C-p> "+p<CR>
vnoremap <C-y> "+y<CR>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ノーマルモードでも改行
nnoremap <CR> i<CR><ESC>

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + jk でブロック移動
nnoremap <C-j> }
nnoremap <C-k> {
vnoremap <C-j> }
vnoremap <C-k> {

" Shift + hjkl でブロック移動
nnoremap <S-h> ^
"nnoremap <S-j> } S-j,kはeasymotionにした
"nnoremap <S-k> { S-j,kはeasymotionにした
nnoremap <S-l> $
vnoremap <S-h> ^
"vnoremap <S-j> } S-j,kはeasymotionにした
"vnoremap <S-k> { S-j,kはeasymotionにした
vnoremap <S-l> $

" インサートモードでも移動
"inoremap <C-a> <C-o>^
"inoremap <C-e> <C-o>$
"inoremap <C-b> <C-o>h
"inoremap <C-f> <C-o>l
"inoremap <C-h> <C-o>h
"inoremap <C-j> <C-o>j
"inoremap <C-k> <C-o>k
"inoremap <C-l> <C-o>l

" ウインドウサイズ変更
nnoremap <S-Left> <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up> <C-w>+<CR>
nnoremap <S-Down> <C-w>-<CR>
nnoremap <C-w>- <C-w>=<CR>

" ウインドウ移動
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" Jが潰れたので行結合は+にした。もとの+はj<S-h>で。
noremap + J

" ノーマルモードを抜けずに空行を挟む
nnoremap <silent> { :<c-u>call append(line('.')-1, '')<Cr>
nnoremap <silent> } :<c-u>call append(line('.'), '')<Cr>

function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction
