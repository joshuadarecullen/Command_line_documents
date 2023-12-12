" 1. COSMETICS:
" 2. LEADER KEY MAPPING:
" 3. VIM PACKAGES:
" 4. BASIC SETUP:
" 5. SEARCHING THE CURRENT FILE:
" 6. KEY MAPPINGS:
" 7. FOLDS:
" 8. WORKING WITH SPLITS:
" 9. SPELL CHECKER:
" 10. EXECUTE CURRENT SHELL IN PYTHON:
" 11. FINDING FILES:
" TAG JUMPING:
" AUTOCOMPLETE:
" FILE BROWSING:


" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'frazrepo/vim-rainbow'
Plug 'mbbill/undotree'
Plug 'nvie/vim-flake8'
Plug 'karoliskoncevicius/vim-sendtowindow'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ycm-core/YouCompleteMe'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Important!!
if has('termguicolors')
  set termguicolors
endif

set background=dark

" Available values: 'hard', 'medium'(default), 'soft'
colorscheme gruvbox
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_termcolors=256
" let g:gruvbox_material_better_performance = 1

" sexy rainbow prettiness for my brackets:
au FileType c,cpp,objc,objcpp,py call rainbow#load()
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']" endif

" LEADER KEY MAPPING:
let mapleader = ","

" BASIC SETUP:
syntax enable
filetype plugin indent on

set list
set listchars=tab:>-

set scrolloff=100 " Amount of context lines above and below cursor
set nocompatible  " Disable compatibility with vi which can cause unexpected issues.
set noerrorbells  " No error bells when you hit the bottm
set cursorline    " Highlight cursor horizontally.
set cursorcolumn  " Highlight cursor vertically.
set relativenumber
set nu            " Line numberings
set shiftwidth=4  " Set shift width to 4 spaces.
set tabstop=4     " Set tab width to 4 columns.
set softtabstop=4
set expandtab     " Use space characters instead of tabs.
set nobackup      " Do not save backup files.
set noswapfile    " Self explanitory
set nowrap        " Do not wrap lines.

set list
set listchars=tab:>\ ,trail:-

set undodir=/.vim/undodir
set undofile
set backspace=start,eol,indent " Allows use of backspace


" SEARCHING THE CURRENT FILE:
set incsearch     " incrementally highlight matching characters as you search
set smartcase     " search non case specific until specified
set showcmd       " Show partial command you type in the last line of the screen.
set showmode      " Show the mode you are on the last line.
set showmatch     " Show matching words during a search.
set hlsearch      " Use highlighting when doing a search.
set history=100   " Set the commands to save in history default number is 20.


" KEY MAPPINGS:
" nmap <F8> :TlistToggle<CR>               Tag list
nnoremap <leader>e :Files<Cr>

nnoremap <leader>c :nohlsearch<CR>      " Mapping for clearing highlighted text
nnoremap <leader><space> za             " Enable folding with doubletap spacebar:

" adjusting split sizes: (silent = not shown on command line)
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Change 3 split windows from vert to horitz or hortz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tv <C-w>t<C-w>K

" netrw toggle:
nnoremap <leader>dd :Lexplore %:p:h<CR> " Open Netrw on the directory of the current file
nnoremap <Leader>da :Lexplore<CR>       " Toggle the Netrw window

nnoremap <leader>f :find 
nnoremap <leader>t :term <CR>
nnoremap <leader>tp :term <CR>python3<CR>
nnoremap <leader>u :UndotreeShow<CR>

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>kk :m .-2<CR>==


" FOLDS:
set foldenable
set foldmethod=manual "zM and zR to close / open all folds zo and zc on single, zf to create fold

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" WORKING WITH SPLITS:
set splitbelow
set splitright

" SPELL CHECKER:
map<F6> :setlocal spell! spelllang=en_uk<CR>

" EXECUTE CURRENT SHELL IN PYTHON:
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .
" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
" BUILD INTEGRATION:
" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix
" Configure the `make` command to run RSpec
" set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back
