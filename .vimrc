let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/local/bin/python3'

set diffopt=filler,context:4,iwhite,vertical

syntax on
filetype plugin indent on

set nu
set list
set ruler

"set mouse=a

set listchars=tab:\\_,trail:~,extends:>,precedes:<,nbsp:`
if &encoding == "utf-8"
	set listchars=tab:\\_,trail:·,extends:>,precedes:<,nbsp:∆
endif

call plug#begin()

Plug 'tpope/vim-dispatch'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender'
Plug 'sainnhe/edge'
Plug 'sainnhe/forest-night'
Plug 'vim-airline/vim-airline'

Plug 'vimwiki/vimwiki', {'branch': 'dev'}

Plug 'tools-life/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'majutsushi/tagbar'
Plug 'farseer90718/vim-taskwarrior'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'beeender/Comrade'

"Plug 'sheerun/vim-polyglot'

call plug#end()

let g:deoplete#enable_at_startup = 1

set termguicolors
set background=dark
let g:forest_night_transparent_background = 1
let g:airline_theme = 'forest_night'

colorscheme forest-night

	set statusline+=%#warningmsg#
	set statusline+=%*

	filetype plugin on

"	"Showmatch significantly slows down omnicomplete
"	"when the first match contains parentheses.
"	set showmatch
"
"	"don't autoselect first item in omnicomplete, show if only one item (for preview)
"	"remove preview if you don't want to see any documentation whatsoever.
"	set completeopt=longest,menuone,preview
"	" Fetch full documentation during omnicomplete requests.
"	" There is a performance penalty with this (especially on Mono)
"	" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
"	" you need it with the :OmniSharpDocumentation command.
"	 let g:omnicomplete_fetch_documentation=1
	
	"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
	"You might also want to look at the echodoc plugin
	set splitbelow


" this setting controls how long to wait (in ms) before fetching type / symbol information.
"set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

set hidden

autocmd FileType cs set ts=2
autocmd FileType cs set sw=2
autocmd FileType cs set expandtab

autocmd FileType python set ts=4
autocmd FileType python set sw=4
autocmd FileType python set expandtab

autocmd FileType cpp set ts=2
autocmd FileType cpp set sw=2
autocmd FileType cpp set expandtab

autocmd FileType c set ts=2
autocmd FileType c set sw=2
autocmd FileType c set expandtab

nnoremap <leader>sc :lclose<cr>
nnoremap <leader>so :lopen<cr>

set previewheight=50
"let g:ycm_autoclose_preview_window_after_insertion = 1

hi Todo guifg=#222222



autocmd BufRead,BufNewFile *.cs#* setfiletype cs

function! KillTab()
	try
		exe ':tabclose'
	catch
		exe ':qa!'
	endtry
endfunction
nmap <c-q> :call KillTab()<cr>

let g:vimwiki_list = [ {'syntax': 'markdown', 'ext': '.md'}, {'path': '~/.jira_wiki/', 'syntax': 'markdown', 'ext': '.md'} ]

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

""use TAB as the mapping
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ?  "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ deoplete#mappings#manual_complete()
"function! s:check_back_space() abort ""     
"  let col = col(.) - 1
"  return !col || getline(.)[col - 1]  =~ s
"endfunction ""   
"
"inoremap <silent><expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
"inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
"
let g:vimwiki_global_ext = 0
let g:markdown_folding = 0

set foldenable!
