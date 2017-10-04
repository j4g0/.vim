set nocompatible              " be iMproved, required
filetype plugin on            " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Reewr/vim-monokai-phoenix'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'junegunn/fzf'
Plugin 'vim-airline/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'garbas/vim-snipmate'
Plugin 'Quramy/tsuquyomi'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"General Settings
set relativenumber	"Show relative line number
set number		"Show absolute line number
set tabstop=2		"Show existing tab with 2 spaces
set shiftwidth=2	"when indenting with '>' use 2 spaces
set expandtab		"On pressing tab, insert 2 spaces
set laststatus=2
set ttimeoutlen=50

" FINDING FILES

" Search down into subfolders
" Provides tab-completition for all file-related tasks
set path+=** 

" Display all matching files when using tab complete
set wildmenu 

" ALLOWS TO
" - Hit tab to :find by partial search
" - Use * to make it fuzzy


" TAG JUMPING

" create the 'tags' file
command! MakeTags !ctags -R .

" ALLOWS TO
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


"AUTOCOMPLETE

" The good stuff is documented in |ins-completition|

" HIGHLIGHTS
" - ^x^n for JUST this file
" - ^x^f for filenames (works with set path)
" - ^x^] for tags only
" - ^n fo r anything specified by the 'complete' option

" ALLOWS TO
" - Use ^n and ^p to go back and forth in the suggestion list

colorscheme monokai-phoenix	"Set colorscheme

" MAPPINGS
let mapleader = "\<Space>"

nnoremap <leader>rv :source $MYVIMRC<CR>    
nnoremap <leader>nt :NERDTree<cr>
inoremap <C-k> <Esc>/<++><CR>"_c4l

nnoremap ,html :-1read $HOME/.vim/snippets/html/skel.html<CR>7jcit
inoremap ;; <Esc>A;<Esc>

" Simplify vim split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Pastetoggle on F2
set pastetoggle=<F2>

"Set syntax on blade files
augroup blade
  autocmd!
  autocmd BufNewFile,BufRead *.blade.php set filetype=blade
augroup END

"Set syntax on typescript files
augroup typescript
  autocmd!
  autocmd BufNewFile,BufRead *.ts set filetype=typescript
augroup END

"Set syntax on handlebar files
augroup handlebars
  autocmd!
  autocmd BufNewFile,BufRead *.handlebars set filetype=handlebars
  autocmd BufNewFile,BufRead *.handlebars set syntax=html
augroup END

"Map shift to esc in vim
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
