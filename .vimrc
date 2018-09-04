""
"" PLUGS
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'

"" editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'

"" syntax highlighting
Plug 'scrooloose/syntastic'
Plug 'mxw/vim-jsx'

"" html
Plug 'docunext/closetag.vim', { 'for': ['html', 'xml'] }

"" themes
Plug 'rakr/vim-one'

call plug#end()

""
"" SYNTAX HIGHLIGHTING
syntax enable
set background=dark
colorscheme one

"" filetype exceptions
au BufRead,BufNewFile Podfile,Gemfile,fastlane/*,.pryrc,*.podspec set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.zsh-theme set filetype=sh
au BufRead,BufNewFile *.less set filetype=css

""
"" KEYBINDINGS
imap <Up>    <NOP>
imap <Down>  <NOP>
imap <Left>  <NOP>
imap <Right> <NOP>
map  <Up>    <NOP>
map  <Down>  <NOP>
map  <Left>  <NOP>
map  <Right> <NOP>

"" plugins
noremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

""
"" EDITOR

"" indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set nowrap
set backspace=2

"" splits
set splitbelow
set splitright

"" line numbers
set number
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

""
"" BACKUP/UNDO
set backupdir=~/.vim/backup,/tmp
set backup

set undodir=~/.vim/undodir
set undofile

""
"" PLUGINS

"" ctrl-p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"" vim-airline
let g:airline_theme = 'one'
set laststatus=2

"" syntastic
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }

"" closetag
autocmd FileType html let b:closetag_html_style=1
autocmd FileType html source ~/.vim/plugged/closetag.vim/plugin/closetag.vim

