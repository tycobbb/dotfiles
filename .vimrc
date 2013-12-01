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


""
"" INDENTATION ""
""
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab


""
"" LINE NUMBERS ""
""
set number

