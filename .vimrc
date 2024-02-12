" 行番号を表示
set number

" マウス操作を有効にする（すべてのモードで）
set mouse=a

" タブをスペースに展開する
set expandtab

" 検索結果をハイライト表示
set hlsearch

" 大文字と小文字を区別しないで検索
set ignorecase

" 検索語の入力中にリアルタイムで結果を表示
set incsearch

" 検索語に大文字が含まれる場合のみ大文字と小文字を区別
set smartcase

" ステータスラインを常に表示（2 = 常に表示）
set laststatus=2

" 新しい行のインデントを自動で現在の行に合わせる
set autoindent

" カーソルのある行をハイライト表示
set cursorline

" Vimのクリップボードとシステムのクリップボードを共有
set clipboard+=unnamed

" シンタックスハイライトを有効にする
syntax on

" カーソルの形状を通常モードと挿入モードで変更する設定
" 通常モードではブロックカーソルにする
let &t_ti.="\e[1 q"
" 挿入モードに入る時は細いカーソルにする
let &t_SI.="\e[5 q"
" 挿入モードを抜ける時は再びブロックカーソルに戻す
let &t_EI.="\e[1 q"
" Vimを終了する時はカーソルを通常の状態に戻す
let &t_te.="\e[0 q"

" UltiSnipsスニペット展開のトリガー設定
" スニペットの展開にはTabキーを使用
let g:UltiSnipsExpandTrigger="<tab>"
" スニペット内の次のタブストップへジャンプするためにCtrl-bを使用
let g:UltiSnipsJumpForwardTrigger="<c-b>"
" スニペット内の前のタブストップへジャンプするためにCtrl-zを使用
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" cppファイルの設定
" C++ファイルでタブをスペースに展開する
au FileType cpp setlocal expandtab
" C++ファイルでのタブの幅を4スペースに設定
au FileType cpp setlocal tabstop=4
" C++ファイルでのインデントの幅を4スペースに設定
au FileType cpp setlocal shiftwidth=4
" C++ファイルでタブキーを押した時のスペースの挿入量を4に設定
au FileType cpp setlocal softtabstop=4
" cppファイルの設定

" Viとの互換性を無効にし、Vimのすべての拡張機能を有効にする
set nocompatible

" vim-plugプラグインマネージャーの初期化
call plug#begin('~/.vim/plugged')

" ステータスバーを美しく表示する
Plug 'vim-airline/vim-airline'
" vim-airlineのための追加テーマ
Plug 'vim-airline/vim-airline-themes'

" ファイルツリーを表示するプラグイン
Plug 'lambdalisue/fern.vim'
" fernでgitのステータスを表示するプラグイン
Plug 'lambdalisue/fern-git-status.vim'

" ファイル内のgit差分を表示する
Plug 'airblade/vim-gitgutter'

" フォントアイコンをサポートするためのプラグイン
Plug 'lambdalisue/nerdfont.vim'
" fernでNerd Fontアイコンを使用するためのプラグイン
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" アイコンに色をつけるプラグイン
Plug 'lambdalisue/glyph-palette.vim'

" 強力なファイル検索機能を提供するプラグイン
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" FZFをVimで使うためのプラグイン
Plug 'junegunn/fzf.vim'

" スニペット機能を提供するプラグイン
Plug 'SirVer/ultisnips'
" 豊富なスニペット集
Plug 'honza/vim-snippets'

" 高速なコード補完エンジン
Plug 'ycm-core/YouCompleteMe'

" Git操作をVim内で簡単に行う
Plug 'tpope/vim-fugitive'
" 括弧やクオートの追加、削除、変更を簡単に行う
Plug 'tpope/vim-surround'
" vim-surroundの操作を.で繰り返し可能にする
Plug 'tpope/vim-repeat'
" コメントアウトの操作を簡単に行う
Plug 'tpope/vim-commentary'

" 多言語にわたるシンタックスハイライトとインデントのサポート
Plug 'sheerun/vim-polyglot'
" JavaScriptのための改善されたシンタックスとインデントサポート
Plug 'pangloss/vim-javascript'
" タグを元にしたコードナビゲーション
Plug 'majutsushi/tagbar'
" テキストを簡単に整列させる
Plug 'junegunn/vim-easy-align'
" カップルで閉じる文字(例: 括弧)の自動挿入
Plug 'jiangmiao/auto-pairs'
" PHP開発のための強力な補完とリファクタリングツール
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

" カラーテーマ
Plug 'cocopon/iceberg.vim'

" vim-plugの設定終了
call plug#end()

" カラースキームをicebergに設定
colorscheme iceberg

" vim-airlineの設定
" タブライン（複数のファイルを開いている時にタブとして表示される部分）を有効にする
let g:airline#extensions#tabline#enabled = 1

" ステータスラインのセクションcに表示する内容を設定（ファイル名と変更マーク）
let g:airline_section_c = '%t %M'

" ステータスラインのセクションzに表示する内容を設定（行番号と列番号）
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'

" gitの変更がない場合は、ステータスラインにdiffの行数を表示しない
let g:airline#extensions#hunks#non_zero_only = 1

" タブラインの表示設定
" 分割ウィンドウはタブラインに表示しない
let g:airline#extensions#tabline#show_splits = 0
" タブをタブラインに表示する
let g:airline#extensions#tabline#show_tabs = 1
" タブ番号は表示しない
let g:airline#extensions#tabline#show_tab_nr = 0
" タブのタイプ（ファイル、バッファ等）を表示する
let g:airline#extensions#tabline#show_tab_type = 1
" タブライン上の閉じるボタンは表示しない
let g:airline#extensions#tabline#show_close_button = 0

" Ctrl+nでファイルツリーを表示/非表示するキーマッピング
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=30<CR>

" アイコン表示を有効化（fern用）
let g:fern#renderer = 'nerdfont'

" アイコンに色をつける設定
augroup my-glyph-palette
  autocmd!
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" git操作のキーマッピング
" g[で前の変更箇所へ移動
nnoremap g[ :GitGutterPrevHunk<CR>
" g]で次の変更箇所へ移動
nnoremap g] :GitGutterNextHunk<CR>
" ghで差分のハイライト表示をトグル
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行の差分をプレビュー
nnoremap gp :GitGutterPreviewHunk<CR>
" git差分表示用の色設定
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

" Vimの反応時間を短くする（デフォルトは4000ms）
set updatetime=250

" fzf.vimの設定
" Ctrl+pでgit管理下のファイル、または全ファイルを検索するための関数
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

" Ripgrepを使用した高速文字列検索のためのカスタムコマンド
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
" Ctrl+gでカスタムRgコマンドを起動し、文字列検索を開始
nnoremap <C-g> :Rg<CR>

" frでカーソル位置の単語をRipgrepで検索
nnoremap fr vawy:Rg <C-R>"<CR>
" 選択モードで選択したテキストをRipgrepで検索
xnoremap fr y:Rg <C-R>"<CR>

" fbで開いているバッファ間を検索・切り替え
nnoremap fb :Buffers<CR>
" fpで直前に開いていたバッファを開く
nnoremap fp :Buffers<CR><CR>
" flで現在開いているファイル内の文字列を検索
nnoremap fl :BLines<CR>
" fmでマークされた位置を検索
nnoremap fm :Marks<CR>
" fhでファイルの開閉履歴を検索
nnoremap fh :History<CR>
" fcでgitコミット履歴を検索
nnoremap fc :Commits<CR>

" ファイルタイプに応じたプラグインとインデント設定を有効化
filetype plugin indent on


