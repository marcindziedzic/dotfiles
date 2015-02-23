set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" VCS plugins
Bundle 'tpope/vim-fugitive'
Bundle 'mhinz/vim-signify'

" Python and Golang 
Bundle 'davidhalter/jedi-vim'
Bundle 'klen/python-mode'
Bundle 'fatih/vim-go'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-surround'

" Navigation
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'christoomey/vim-tmux-navigator'

" Other
Bundle 'schickling/vim-bufonly'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'flazz/vim-colorschemes'

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

" vim-jedi
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0

" Better navigating through omnicomplete option list borrowed from https://hithub.com/mbrochh/vim-as-a-python-ide
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim set completeopt=longest,menuone

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action == 'k'
			return "\<C-P>"
		endif
	endif
	return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" omnipopup color scheme
" :highlight Pmenu guibg=brown gui=bold

" klen/python-mode
let g:pymode_rope = 0
let g:pymode_folding = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_syntax_all = 1
" force python-mode to ignore warnings:
" * E702 - numtilple statements in one line (BREAKPOINTs)
let g:pymode_lint_ignore = "E702"

" go-def settings
let g:godef_split=2
let g:godef_same_file_in_same_window=1

" go-vim settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" neocomplete
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 0
" let g:neocomplete#enable_smart_case = 0
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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
nnoremap <F5> :w \| ! clear; py.test -vs %<CR>
inoremap <F5> <ESC> :w \| ! clear ; py.test -vs %<CR>

" syntax for vim compiled from source
syntax on 
colorscheme Monokai

