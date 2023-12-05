" プラグイン設定
" :PlugInstallで適用される
call plug#begin()

"  カラースキームの適用
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Rails向けのコマンドを提供する
" Plug 'tpope/vim-rails'

" Ruby向けにendを自動挿入してくれる
" Plug 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
" Plug 'tomtom/tcomment_vim'

" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'

" ツリー作成
Plug 'preservim/nerdtree'

" ヤンク箇所を光らせる
Plug 'machakann/vim-highlightedyank'

call plug#end()

if !exists('g:vscode')
" VSCodeでは反映しない設定の記述はここに書く

    "----------------------------------------
	" 操作
	"----------------------------------------
	" 常にzshを開く
	set shell=/bin/zsh
	" ファイルを上書きする前にバックアップを作ることを無効化
	set nowritebackup
	" ファイルを上書きする前にバックアップを作ることを無効化
	set nobackup
	" vim の矩形選択で文字が無くても右へ進める
	set virtualedit=block
	" 挿入モードでバックスペースで削除できるようにする
	set backspace=indent,eol,start
	" wildmenuオプションを有効(vimバーからファイルを選択できる)
	set wildmenu

    "----------------------------------------
	" 検索
	"----------------------------------------
	" 検索するときに大文字小文字を区別しない
	set ignorecase
	" 小文字で検索すると大文字と小文字を無視して検索
	set smartcase
	" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
	set wrapscan
	" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
	set incsearch
	" 検索結果をハイライト表示
	set hlsearch

	"----------------------------------------
	" 表示設定
	"----------------------------------------
	" 構文毎に文字色を変化させる
	syntax on
	" カラースキーマの指定
    " tokyonight-night
    colorscheme tokyonight-night
    let g:lightline = {'colorscheme': 'tokyonight'}

	" 行番号の色
	highlight LineNr ctermfg=darkyellow

	" 全角スペースの表示
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

    " vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
    let g:indent_guides_enable_on_vim_startup = 1

	" HTML/XML閉じタグ自動補完
	augroup MyXML
		autocmd!
		autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
		autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
	augroup END

	" 編集箇所のカーソルを記憶
	if has("autocmd")
		augroup redhat
			" In text files, always limit the width of text to 78 characters
			autocmd BufRead *.txt set tw=78
			" When editing a file, always jump to the last cursor position
			autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\   exe "normal! g'\"" |
			\ endif
		augroup END
	endif

	" 挿入モード時、ステータスラインの色を変更
	let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
	if has('syntax')
		augroup InsertHook
			autocmd!
			autocmd InsertEnter * call s:StatusLine('Enter')
			autocmd InsertLeave * call s:StatusLine('Leave')
		augroup END
	endif
	let s:slhlcmd = ''
	function! s:StatusLine(mode)
		if a:mode == 'Enter'
			silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
			silent exec g:hi_insert
		else
			highlight clear StatusLine
			silent exec s:slhlcmd
		endif
	endfunction
	function! s:GetHighlight(hi)
		redir => hl
		exec 'highlight '.a:hi
		redir END
		let hl = substitute(hl, '[\r\n]', '', 'g')
		let hl = substitute(hl, 'xxx', '', '')
		return hl
	endfunction

	" Start NERDTree when Vim is started without file arguments.
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists	('s:std_in') | NERDTree | endif


    " Highlight the yanked text for 1 second (default is 1)
    let g:highlightedyank_highlight_duration = 300
end

"----------------------------------------
" 表示設定
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
" コメントの色を水色
hi Comment ctermfg=3
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
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
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号の表示
set number
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
