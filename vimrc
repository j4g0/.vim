"                               vimrc by j4g0
"-------------------------------------------------------------------------------



"                              VUNDLE SETTINGS
"-------------------------------------------------------------------------------

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
"Plugin 'Reewr/vim-monokai-phoenix'
Plugin 'lifepillar/vim-solarized8'
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'ap/vim-css-color'
Bundle 'captbaritone/better-indent-support-for-php-with-html'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


"                              GENERAL SETTINGS
"       Check :option-list or :options for a complete list of options
"-------------------------------------------------------------------------------
set relativenumber	"Show relative line number
set number		      "Show absolute line number
set tabstop=2		    "Show existing tab with 2 spaces
set shiftwidth=2	  "when indenting with '>' use 2 spaces
set expandtab		    "On pressing tab, insert 2 spaces
set laststatus=2
"set timeoutlen=50
set incsearch       "incremental search
set nohlsearch      "highlight search"
set history=1000    "command history"
set ruler           "show cursor position"
set showcmd         "show incomplete commands"
set scrolloff=10    
set noautoindent    "auto indentation after line break"
set nosmartindent   "smart indent"
set hidden          "all buffers are hidden"
set termguicolors   "24bit true color - requires vim vers.8
set background=dark "Prequesite for Solarized dark
colorscheme solarized8
"colorscheme monokai-phoenix	"Set colorscheme


"                               FINDING FILES
"-------------------------------------------------------------------------------

" Search down into subfolders
" Provides tab-completition for all file-related tasks
set path+=** 

" Display all matching files when using tab complete
set wildmenu 

" ALLOWS TO
" - Hit tab to :find by partial search
" - Use * to make it fuzzy


"                                TAG JUMPING
"-------------------------------------------------------------------------------
" create the 'tags' file
command! MakeTags !ctags -R .

" ALLOWS TO
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack


"                                AUTOCOMPLETE
"-------------------------------------------------------------------------------
" The good stuff is documented in |ins-completition|

" HIGHLIGHTS
" - ^x^n for JUST this file
" - ^x^f for filenames (works with set path)
" - ^x^] for tags only
" - ^n fo r anything specified by the 'complete' option

" ALLOWS TO
" - Use ^n and ^p to go back and forth in the suggestion list


"                           YouCompleteMe Settings
"-------------------------------------------------------------------------------
" Start autocompletition after 4 chars
let g:ycm_min_num_of_chars_for_completition = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

"                                  MAPPINGS
"-------------------------------------------------------------------------------
let mapleader = "\<Space>"    "set leader key

"set key to reload vimrc
nnoremap <leader>rv :source $MYVIMRC<CR>    

"set key to start NERDTree
nnoremap <leader>nt :NERDTree<cr>

"set key to change at the custom <++> placeholder
inoremap <C-k> <Esc>/<++><CR>"_c4l

"set key to insert html snippet from file
nnoremap ,html :-1read $HOME/.vim/snippets/html/skel.html<CR>7jcit;

nnoremap ,php a<?php ?><Esc>bbea<Space>


" Inster Shell header outdated due to auto load
" nnoremap ,shell :-1read $HOME/.vim/snippets/shell/shell_header<CR>4jw

inoremap ;; <Esc>A;<Esc>

" Simplify vim split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Pastetoggle on F2
set pastetoggle=<F2>

" Emmet Keybindings
let g:user_emmet_leader_key = '<c-e>'

"Set syntax on blade files
augroup blade
  autocmd!
  autocmd BufNewFile,BufRead *.blade.php set filetype=blade
augroup END

"Set syntax on vue files
augroup vue
  autocmd!
  autocmd BufNewFile,BufRead *.vue set filetype=vue
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

"Auto insert and update header to shell scripts
augroup shell
  autocmd BufNewFile *.sh so $HOME/.vim/snippets/shell/shell_header
  autocmd BufNewFile *.sh exe "1," . 10 . "g/File Name     :.*/s//File Name     : " .expand("%")
  autocmd BufNewFile *.sh exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d.%m.%Y")
  autocmd BufWritePre,FileWritePre *.sh execute "normal ma"
  autocmd BufWritePre,FileWritePre *.sh exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
  autocmd BufWritePre,FileWritePre *.sh execute "normal `a"
augroup END

"Map shift to esc in vim
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
