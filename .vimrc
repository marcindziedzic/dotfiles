set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go'
Bundle 'Shougo/neocomplete'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" VCS plugins
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'

Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Bundle 'majutsushi/tagbar'
Plugin 'klen/python-mode'
Plugin 'ervandew/supertab'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'schickling/vim-bufonly'

set nofoldenable    " disable folding


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


" search and line numbers 
set relativenumber
set number
set incsearch
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" backup files disabled
set nobackup
set nowritebackup
set noswapfile

" Go related mappings ,docummentation  https://github.com/fatih/vim-go/blob/master/README.md
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

au FileType python let g:pymode_rope_goto_definition_bind = "gd"

" go-def settings
let g:godef_split=2
let g:godef_same_file_in_same_window=1

" go-vim settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" ultisnips configuration 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"

let mapleader=","

" Powerline setup
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

" NERDTree setup
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" remap move to the next and previous buffer
map gn :bn<cr>
map gp :bp<cr>
map gr :bd<cr>  

" EasyMotion configuration
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Custom ignore for ctrl-p
let g:ctrlp_custom_ignore = 'pyc'

" Tagbar configuration
nmap <F8> :TagbarToggle<CR>

" syntax for vim compiled from source
syntax on 
