set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'wincent/command-t'
Plugin 'kchmck/vim-coffee-script'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'fisadev/vim-isort'
Plugin 'haishanh/night-owl.vim'
Plugin 'vim-scripts/Gummybears'
Plugin 'srcery-colors/srcery-vim'
Plugin 'jceb/vim-orgmode'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"color desert
"filetype plugin indent on
 
" ctags
set tags=tags;/
 
" line numbers
set number
set relativenumber

"tabs are 2 spaces by default
set expandtab
set shiftwidth=2
set softtabstop=2
set splitright

"swap file locations
set dir=~/tmp,/var/tmp,/tmp

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"custom maps
let mapleader = '-'
let maplocalleader = '\'
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
noremap <right> <nop>
nnoremap É :
nmap ü -
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
"use reg a
nnoremap <leader>p "ap
vnoremap <leader>p "ap
nnoremap <leader>P "aP
vnoremap <leader>P "aP
nnoremap <leader>y "ay
vnoremap <leader>y "ay
nnoremap <leader>Y "aY
nnoremap <leader>d "ad
vnoremap <leader>d "ad
nnoremap <leader>D "aD
nnoremap <leader>S "aS
vnoremap <leader>s "as

"comment line
nnoremap <leader>cl ^i//<esc>

nnoremap <leader>ct :checktime<cr>

"uncomment line
nnoremap <leader>ul ^xx

"clean spaces at eol
nnoremap <leader>ts :%s/\s\+$//<cr>

"goto next class
nnoremap <leader>gc /class<cr>

"write and goto last buffer
nnoremap <leader>a :w<cr>:b#<cr>

"Y behaves as D
nnoremap Y y$

"toggle hl search
nnoremap <leader>hl :set hlsearch!<cr>
"-f launches FZF
nnoremap <leader>f :FZF<cr>

"quick substitue
nnoremap gs :%s//g<Left><Left>

"force write with sudo
cnoremap w!! w !sudo tee % >/dev/null

"quick next error
nnoremap -- :cn<cr>

"quick window change
nnoremap <S-Right> <C-W><Right>
nnoremap <S-Left> <C-W><Left>
nnoremap <S-Up> <C-W><Up>
nnoremap <S-Down> <C-W><Down>

"quick norm for lines
vnoremap -n :norm<space> 

"space is half pagedown, c-space is half page up
nnoremap <space> <C-D>
nnoremap <c-space> <C-U>

"shiftwidth set
nnoremap <leader>t :set shiftwidth=

augroup vimrclaci37
  autocmd!
  "json.jbuilder as ruby
  autocmd BufNewFile,BufRead *.json.jbuilder :setlocal syntax=ruby
  "resize windows normally
  autocmd VimResized * :wincmd =
  "autosource vimrc
  autocmd! bufwritepost $MYVIMRC source $MYVIMRC
augroup END

"undo file
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"Status line
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#CursorColumn#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

"abbrev typos
iabbrev retrun return
iabbrev cleint client
iabbrev Cleint Client
iabbrev finnally finally
iabbrev duoble double
iabbrev heigth height
iabbrev Heigth Height

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

augroup makeprgs
  autocmd!
  autocmd FileType python :set makeprg=python3\ -m\ pylint\ -f\ parseable\ --disable=C,R\ %
augroup END

augroup folding
  autocmd!
  autocmd FileType python setl foldmethod=indent
  autocmd FileType python norm zi
augroup END
"fold maps
nnoremap zo zO
nnoremap zO zo
nnoremap zc zC
nnoremap zC zc
nnoremap za zA
nnoremap zA za


"disable delete word in insertmode
inoremap <C-w> <esc><C-w>

"colorscheme changes
nnoremap <leader>ccd :color<space>desert<cr>
nnoremap <leader>ccc :color<space>mycontrast<cr>

syntax enable
colorscheme srcery

command! -nargs=* Git :! git <args>
