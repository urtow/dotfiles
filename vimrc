set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Highlight current line (weeeeee) ===---
Plugin 'vim-scripts/highlight_current_line.vim'

"---------=== Shell in Vim ===---------
Plugin 'vim-scripts/conque-Shell'

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-fugitive'		" Git from VIM console

"--------------=== Pytest support ===-----------------
Plugin 'alfredodeza/pytest.vim'		" Support to run pytest test from vim

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

"-----NerdTree settings------------
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

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
let g:pymode_lint_ignore="E501,W601,C0110"
" " провека кода после сохранения
let g:pymode_lint_write = 1
"
" " поддержка virtualenv
let g:pymode_virtualenv = 1
"
" " установка breakpoints
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

" Автоформатирование json файлов, прикрутить hotkey
com! FormatJSON %!python -m json.tool
function! FormatJSON() 
	:%!python -m json.tool 
endfunction

autocmd FileType json setlocal expandtab shiftwidth=4 tabstop=4 formatoptions+=croq softtabstop=4 smartindent 

let g:vim_json_syntax_conceal = 0
" Включить подсветку синтаксиса
syntax on

" Автодополнение по Alt + Space
inoremap <M-space> <C-x><C-o>

" Вертикальный сплит справа, а не слева
set splitright

" Правильная работа backspace
set backspace=2

" Пусть все файлы хранятся где надо
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Перемещение по табам Alt+стрелки
inoremap <M-Left> :tabp<CR>
