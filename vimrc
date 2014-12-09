"about Pathogen
execute pathogen#infect()

"about auto EX mode
set wildmenu
set wildmode=full
set history=300

"about tags
set tags+=D:/Vim/LibTag/opencv

"about highlight search result and reconstruct window&buffer
set hlsearch
set incsearch
nnoremap <silent> <C-l> : <C-u>nohlsearch<CR><C-l>

"set the colorscheme
"au GUIEnter * simalt ~x

"filetype indent
filetype plugin indent on

"set <leader>
let mapleader=','

"Line Number
set nu

"C/C++ syntax
syntax on
set t_Co=256
set background=dark

" set the backspace ,so it can delete indent,CR,space..etc on Windows System
set backspace=indent,eol,start

nmap <leader>ge $
nmap <leader>gb 0

" high light the C/C++ or other files
syntax on							
set nu								
set langmenu=en_US.UTF-8			
set encoding=utf-8					
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" about the TAB and indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent

" ------------ >NERDTree

" automatically open NERDTree when vim start
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" automatically close vim when the NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" autoset the work focus at the editor buffer
"autocmd VimEnter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w

" ----------- >YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif        
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jc :YcmCompleter GoToDefinition<CR>
"let g:ycm_confirm_extra_conf=0    "打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_enable_diagnostic_signs=0 "不对当前文档进行语法检测
let g:ycm_collect_identifiers_from_tags_files = 0  "collect complete indentifiers from tag files (Ctags)

" ----------- >Tagbar
autocmd VimEnter * nested :TagbarOpen
let g:tagbar_show_linenumbers = 2
autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----------- >UltiSnips
let g:UltiSnipsExpandTrigger="<c-i>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/ultisnips/snipfiles/"]

" 括号自动补全
"inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
"inoremap < <><ESC>i
"inoremap " ""<ESC>i

" GUI Setting
if has('gui_running')

	set cursorline
	set fu
	set guifont=Monaco:h13
	colorscheme bandit 
else
	colorscheme desert
endif

" Vi auto commentary
autocmd FileType apache set commentstring=#\ %s

" about Power Line
set laststatus=2

" about Open File On Command Line
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" about Ctags
map <C-F12> :!ctags -R .<CR><CR>"

noremap <C-TAB>   :MBEbn<CR>

" C-support VIM
let g:C_LineEndCommColDefault    = 60
