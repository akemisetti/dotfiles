
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$HOME/.local/lib/python3.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" remove white space
autocmd BufWritePre * %s/\s\+$//e

set bs=2 " make backspace behave like normal again

" Rebind <Leader> key
let mapleader = " "

" leader key mapping
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows
nnoremap ; za
nnoremap <esc><esc> :noh<return>
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

noremap <Leader>Y "+y
noremap <Leader>P "+p

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
" https://blog.bugsnag.com/tmux-and-vim/
" handled in .tmux.conf
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'

call vundle#end()

filetype plugin indent on
syntax enable

set number
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set showmatch
set hidden
set showcmd
set ignorecase
set wildmode=list:longest
set scrolloff=3
set laststatus=2
set clipboard=unnamedplus
set visualbell

" set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=100
highlight ColorColumn ctermbg=233
set history=1000
set undolevels=700
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set smartcase
set nobackup
set nowritebackup
set noswapfile

" paste toggle
set pastetoggle=<F2>
set encoding=utf-8
set nofoldenable

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>h  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

runtime macros/matchit.vim

" For full syntax highlighting:
let python_highlight_all=1
syntax on

map <C-f> :NERDTreeToggle<CR>

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'Scripts/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

set background=dark
colorscheme solarized


" https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
" https://github.com/thesheff17/youtube/blob/master/vim/vimrc2
" https://items.sjbach.com/319/configuring-vim-right
