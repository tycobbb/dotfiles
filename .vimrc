
"" PATHOGEN ""
execute pathogen#infect()

""
"" SYNTAX HIGHLIGHTING ""
""
"" -- colors ""
""
syntax enable
colorscheme desert

""
"" -- vim-less ""
""
noremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

""
"" -- filetype exceptions ""
""
au BufRead,BufNewFile Podfile,Gemfile set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.zsh-theme set filetype=sh
au BufRead,BufNewFile *.less set filetype=css

""
"" KEYBINDINGS ""
""
imap <Up>    <NOP>
imap <Down>  <NOP>
imap <Left>  <NOP>
imap <Right> <NOP>
map  <Up>    <NOP>
map  <Down>  <NOP>
map  <Left>  <NOP>
map  <Right> <NOP>

""
"" INDENTATION ""
""
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap

""
"" SPLITTING ""
""
set splitbelow
set splitright

""
"" LINE NUMBERS ""
""
set number
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

""
"" BACKUP/UNDO ""
""
set backupdir=~/.vim/backup,/tmp
set backup

set undodir=~/.vim/undodir
set undofile

""
"" AUTOCOMPLETE ""
""
"" -- omnicompletion ""
""
filetype plugin on
set omnifunc=syntaxcomplete#Complete

""
"" -- supertab ""
""
"let g:SuperTabDefaultCompletionType = "context"

""
"" -- closetag ""
""
autocmd FileType html let b:closetag_html_style=1
autocmd FileType html source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

