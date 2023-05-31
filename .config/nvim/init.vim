"----------------------------------------
" 以下、NeoVimのみ有効となる設定
"----------------------------------------
if !exists('g:vscode')

  " vim-plug
  call plug#begin()
    " カラースキーム
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    " Plug 'bluz71/vim-moonfly-colors', , { 'as': 'moonfly' }
    " NERDTree
    Plug 'preservim/nerdtree'
    " Ruby向けにendを自動挿入してくれる
    Plug 'tpope/vim-endwise'
    " インデントに色を付けて見やすくする
    Plug 'nathanaelkane/vim-indent-guides'
    " Git関係
    Plug 'tpope/vim-fugitive'
    " lightline.vim
    Plug 'itchyny/lightline.vim'
    " telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
  call plug#end()


  " カラースキーム設定
  " tokyonight
  colorscheme tokyonight-night
  let g:lightline = {'colorscheme': 'tokyonight'}

  " moonfly
  " colorscheme moonfly
  " let g:lightline = { 'colorscheme': 'moonfly' }

  " NERDTree設定
  " NERDTreeエイリアス
  nnoremap <C-n> :NERDTree<CR>
  nnoremap <C-t> :NERDTreeToggle<CR>


  " Start NERDTree when Vim is started without file arguments.
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

  " vim-indent-guides設定
  " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
  let g:indent_guides_enable_on_vim_startup = 1


  " telescope設定
  " telescopeエイリアス
  nnoremap <C-p> <cmd>Telescope find_files<cr>
  nnoremap <C-g> <cmd>Telescope live_grep<cr>


  " 全角スペースを表示
  function! ZenkakuSpace()
      highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
  endfunction


  if has('syntax')
      augroup ZenkakuSpace
          autocmd!
          autocmd ColorScheme * call ZenkakuSpace()
          autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
      augroup END
      call ZenkakuSpace()
  endif


  " setting
  "文字コードをUFT-8に設定
  set fenc=utf-8
  " バックアップファイルを作らない
  set nobackup
  " スワップファイルを作らない
  set noswapfile
  " 編集中のファイルが変更されたら自動で読み直す
  set autoread
  " バッファが編集中でもその他のファイルを開けるように
  set hidden
  " 常にzshを開く
  set shell=/bin/zsh


  " 見た目系
  " 行番号を表示
  set number
  " 現在の行を強調
  set cursorline
  " 行末の1文字先までカーソルを移動できるように
  set virtualedit=onemore
  " ビープ音を可視化
  set visualbell
  " 括弧入力時の対応する括弧を表示
  set showmatch
  " コマンドラインの補完
  set wildmode=list:longest
  " 折り返し時に表示行単位での移動できるようにする
  nnoremap j gj
  nnoremap k gk
  " シンタックスハイライトの有効化
  syntax enable
  " 左下の -- 挿入 --などのモード表示を取り除く
  set noshowmode
  " タイトルを表示
  set title
  " 改行時に前の行のインデントを継続する
  set autoindent
  " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
  set smartindent


  " Tab系
  " 不可視文字を可視化(タブが「▸-」と表示される)
  set list listchars=tab:\▸\-
  " インデント幅
  set shiftwidth=4
  " タブキー押下時に挿入される文字幅を指定
  set softtabstop=4
  " ファイル内にあるタブ文字の表示幅
  set tabstop=4

  " 検索系
  " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
  set ignorecase
  " 検索文字列に大文字が含まれている場合は区別して検索する
  set smartcase
  " 検索文字列入力時に順次対象文字列にヒットさせる
  set incsearch
  " 検索時に最後まで行ったら最初に戻る
  set wrapscan
  " 検索語をハイライト表示
  set hlsearch
endif

"----------------------------------------
" 以下、VSCode-NeoVimでも有効となる設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" コマンドラインの履歴を10000件保存する
set history=10000
" Tab文字を半角スペースにする
set expandtab
" 折り返さない
set textwidth=0
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" ヤンクでクリップボードにコピー
set clipboard=unnamed
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a
