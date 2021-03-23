set path+=** " use find to get any file
set wildmenu " when tabbing, show files
syntax enable
set nohlsearch " don't highlight words when searching

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set smarttab
set shiftround
set copyindent 
set backspace=indent,eol,start

set t_Co=256

" paste without yanking
vnoremap p "_dP

" command! MakeTags !ctags .

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
"let g:netrw_list_hide=newrw_gitignore#Hide()
let g:netrw_list_hide=',\(^\|\s\s)\zs\.\S\+'

" plugins
"Plugin 'valloric/youcompleteme'
color one
"colorscheme one
"color dracula
"colorscheme dracula

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" enable filetype detection:
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on " file type based indentation

" for C-like programming where comments have explicit end characters, if
" starting a new line in the middle of a comment automatically insert the
" comment leader characters:
autocmd FileType c,cc,cpp,java set formatoptions+=ro shiftwidth=2 softtabstop=2
autocmd FileType c set omnifunc=ccomplete#Complete

" fixed indentation should be OK for XML and CSS. People have fast internet
" anyway. Indentation set to 2.
autocmd FileType html,xhtml,css,xml,xslt,javascript set shiftwidth=2 softtabstop=2

" two space indentation for some files
autocmd FileType vim set shiftwidth=2 softtabstop=2

" for CSS, also have things in braces indented:
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" add completion for xHTML
autocmd FileType xhtml,html set omnifunc=htmlcomplete#CompleteTags

" add completion for XML
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0 tabstop=8 shiftwidth=8

" ensure normal tabs in assembly files and set to NASM syntax highlighting
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm
