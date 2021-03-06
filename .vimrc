set nocompatible              " be iMproved, required

set guifont=Monaco:h15
set mouse=a 
filetype off                  " required

set number
set relativenumber 
set hlsearch
set incsearch
set exrc
set ruler

" much needed remaps for muscle retraining
" Forces jj for esc
" inoremap jj <ESC>
"inoremap <ESC> <NOP>
" Forces Ctrl-h for backspace
"inoremap <BACKSPACE> <NOP>
" Forces Ctrl-j for Return
"inoremap <Return> <NOP>

" Use char-wise yank when doing Shift+y
" nnoremap Y v$y

" set sane tabbing ( 2 spaces)
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" install NERDTree
Plugin 'scrooloose/nerdtree'

" install Ctrl-P
Plugin 'kien/ctrlp.vim'

" install Syntastic
Plugin 'vim-syntastic/syntastic'

" install Tagbar
" Plugin 'majutsushi/tagbar'

" install Tagbar
Plugin 'tpope/vim-fugitive'

" install Vim-go
Plugin 'fatih/vim-go'

" install vim git-gutter
"Plugin 'airblade/vim-gitgutter'

" tickscript
" Plugin 'nathanielc/vim-tickscript'

" Solarized
" Plugin 'altercation/vim-colors-solarized'

" Ack
Plugin 'mileszs/ack.vim'

" Vim Fireplace
Plugin 'tpope/vim-fireplace'

" Tabularize
Plugin 'godlygeek/tabular'

" taglist
" Plugin 'vim-scripts/taglist.vim'

" Powerline
Plugin 'powerline/powerline'

" viKube
Plugin 'c9s/helper.vim'
Plugin 'c9s/treemenu.vim'
Plugin 'c9s/vikube.vim'

" Goyo for markdown
Plugin 'junegunn/goyo.vim'

" protobuf
Plugin 'uarun/vim-protobuf'

" vim kotlin
Plugin 'udalov/kotlin-vim'

" vim ruby
Plugin 'vim-ruby/vim-ruby'

" vividchalk theme
Plugin 'tpope/vim-vividchalk'

" paredit for vim
Plugin 'vim-scripts/paredit.vim'

" surround vim
Plugin 'tpope/vim-surround'

" confluence wiki syntax
Plugin 'vim-scripts/confluencewiki.vim'

" vim crystal support
Plugin 'rhysd/vim-crystal'

" vim golden ratio
Plugin 'roman/golden-ratio'

" vim Terraform
" Plugin 'fatih/vim-hclfmt'
" Plugin 'hashivim/vim-terraform'
" Plugin 'juliosueiras/vim-terraform-completion'

" Vim LSP
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" map <C-+> :!ctags -R --exclude=.git --exclude=logs --exclude=doc .<CR>


" let Tlist_Use_Right_Window = 1 
"
set laststatus=2


" Ack global search keybind
map <D-*> :Ack <C-r><C-w><CR>

" auto imports
let g:go_fmt_command = "goimports"

" disable audio bells
set visualbell t_vb=

autocmd FileType clojure nmap <buffer> <C-]> ]<C-D>

" highlight current line
set cursorline
highlight CursorLine cterm=None ctermbg=darkred ctermfg=White
highlight Search cterm=NONE ctermfg=grey ctermbg=blue

" run nohlsearch when ctrl-l
nnoremap <C-l> :nohlsearch<CR><C-l>

" speed up UI
set ttyfast
set lazyredraw

colorscheme vividchalk

" autocmd vimenter * NERDTree
let g:NERDTreeDirArrows=0

filetype plugin indent on
syntax on 

" make syntax highlighting not break on long lines/files
set mmp=5000

" show awaiting vim command in the bottom right
set showcmd


if executable('terraform-lsp')
  " terraform lsp config
    au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform-lsp',
        \ 'cmd': {server_info->['terraform-lsp']},
        \ 'whitelist': ['terraform'],
        \ })
endif

let g:lsp_highlight_references_enabled = 1
let g:go_rename_command = "gopls"
