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
"" -- filetype exceptions ""
""
au BufRead,BufNewFile Podfile,Gemfile set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.zsh-theme set filetype=sh

""
"" INDENTATION ""
""
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap

""
"" SPLITTING
""
set splitbelow
set splitright

""
"" LINE NUMBERS
""
set number
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

""
"" BACKUP/UNDO
""
set backupdir=~/.vim/backup,/tmp
set backup

set undodir=~/.vim/undodir
set undofile

