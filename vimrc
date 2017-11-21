set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'      " Lean & mean sta    tus/tabline for vim
Plugin 'vim-airline/vim-airline-themes'  " Themes for airline
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-fugitive'		" Git from VIM console
Plugin 'vim-scripts/highlight_current_line.vim'  " Highlight current line (weeeeee) 
Plugin 'xolox/vim-session'		" Extend Session Manager
Plugin 'xolox/vim-misc'			" dependecies for vim-session
Plugin 'ervandew/supertab'		" Tab auto complete
"Plugin 'saltstack/salt-vim'     " SLS syntax  
Plugin 'godlygeek/tabular.git'   " Tabularize /= for make equal tabs, see more here http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'pearofducks/ansible-vim'    " For Ansible
 " --- RobotFramework ---
"Plugin 'mfukar/robotframework-vim'
" --- Golang ---
Plugin 'fatih/vim-go'

"--------------=== JSON Support ===--------------------
Plugin 'elzr/vim-json'			" JSON plugin for vim


call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

set enc=utf-8       " utf-8 по дефолту в файлах
set ls=2            " всегда показываем статусбар
set incsearch       " инкреминтируемый поиск
set hlsearch	    " подсветка результатов поиска
set nu 	            " показывать номера строк
set scrolloff=5     " 5 строк при скролле за раз	


augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END


"------Airline Settings-----------
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#tab_nr_type = 1

"----TaskList settings--------------
" отобразить список тасков на F2
map <F2> :TaskList<CR> 	   

"-----Python-mode settings----------

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" " проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110,W0401"
" " провека кода после сохранения
let g:pymode_lint_write = 1
"
" " поддержка virtualenv
let g:pymode_virtualenv = 1
"
" " установка breakpoints
let g:pymode_breakpoint_cmd = "__import__(\"ipdb\").set_trace()  # BREAK POINT" 
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

"
" " подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

" Disable autocomplite on dot
let g:jedi#popup_on_dot = 0

" --- Python ---
autocmd FileType python set completeopt-=preview " раскомментируйте, в
"  случае, если не надо, чтобы jedi-vim показывал документацию по
"  методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Настройка Session manager
let g:session_autosave = 'no'
" Короткая команда для сохранения сессии
com! SS SaveSession

" Перечитать мой vimrc
com! RereadVimrc so $MYVIMRC
" Короткая команда для перечитывания конфига
com! RVC RereadVimrc

autocmd FileType json setlocal expandtab shiftwidth=4 tabstop=4 formatoptions+=croq softtabstop=4 smartindent 
autocmd FileType robot setlocal expandtab shiftwidth=4 tabstop=4 formatoptions+=croq softtabstop=4 smartindent 
autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=4 formatoptions+=croq softtabstop=4 smartindent

let g:vim_json_syntax_conceal = 0
" Включить подсветку синтаксиса
syntax on

" Автодополнение по Alt + Space
inoremap <M-space> <C-x><C-o>

" Правильная работа backspace
set backspace=2

" Пусть все файлы хранятся где надо
"set undodir=~/.vim/.undo//
"set backupdir=~/.vim/.backup//
"set directory=~/.vim/.swp//

" Tabs navigation
"nnoremap th  :tabfirst<CR>
"nnoremap tj  :tabnext<CR>
"nnoremap tk  :tabprev<CR>
"nnoremap tl  :tablast<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>
"nnoremap td  :tabclose<CR>

" Enhance command-line completion
" Only available when compiled with the +wildmenu feature
set wildmenu
" Set completion mode
" When more than one match, list all matches and complete first match
" Then complete the next full match
set wildmode=list:longest,full
" Ignore following files when completing file/directory names
" Version control
set wildignore+=.hg,.git,.svn
" OS X
set wildignore+=*.DS_Store
" Python byte code
set wildignore+=*.pyc
" Binary images
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg


" Switch tabs with <Tab>
nmap <Tab> gt
nmap <S-Tab> gT

" Shortcuts started from ,
let mapleader = ","

" Paste mode
" Если включен - вставка кода as is, а не творить полную хрень
set pastetoggle=<leader>p

" ,m
" Toggle mouse support in Normal mode
set mouse=a
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction
nnoremap <leader>m :call ToggleMouse()<CR>

" ,v
" Open .vimrc in new tab
nmap <leader>v :tabedit $MYVIMRC<CR>
:cabbrev e NERDTreeClose<CR>:e!

" ,j
" Автоформатирование json файлов
nmap <leader>j :FormatJSON<CR>
com! FormatJSON %!jsonlint -s -t '    '

"-----NerdTree settings------------
" ,t
map <leader>t :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" Vertical split under currenrt buffer
set splitbelow

" Горизонтальный сплит справа, а не слева
set splitright

" Disable ex mode, and map quit to Q
map Q <Nop>
map Q q

" Create a new window relative to the current one
nnoremap <Leader><left>  :<C-u>leftabove  vnew<CR>
nnoremap <Leader><right> :<C-u>rightbelow vnew<CR>
nnoremap <Leader><up>    :<C-u>leftabove  new<CR>
nnoremap <Leader><down>  :<C-u>rightbelow new<CR>

" Spell check for python files and gitcommit
autocmd FileType gitcommit setlocal spell
autocmd BufRead,BufNewFile,BufWrite *.py setlocal spell

" salt-vim settings
let g:sls_use_jinja_syntax = 1  

" Complete for words
" set complete+=kspell

" Uncomment this if want to autoread file if it's changed
"set autoread
"augroup checktime
"    au!
"    if !has("gui_running")
"        "silent! necessary otherwise throws errors when using command
"        "line window.
"        autocmd BufEnter        * silent! checktime
"        autocmd CursorHold      * silent! checktime
"        autocmd CursorHoldI     * silent! checktime
"        "these two _may_ slow things down. Remove if they do.
"        autocmd CursorMoved     * silent! checktime
"        autocmd CursorMovedI    * silent! checktime
"    endif
"augroup END
