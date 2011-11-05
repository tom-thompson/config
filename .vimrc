" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on
" ~/.vimrc ends here

" Settings for VimClojure
" let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
let vimclojure#HighlightBuiltins=1
" let g:clj_paren_rainbow=1           " Rainbow parentheses'!
let vimclojure#ParenRainbow=1


set ts=4
set nu
set t_Co=256
colorscheme inkpot
"set mouse=a
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
syntax on
set nocp
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
"autocmd FileType c++ set omnifunc=omni#cpp#complete#Main
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" configure tags
set tags+=~/.vim/tags/cpp

" build current project tags
map <C-F12> :!tags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" Omni settings
let OmniCpp_NamespaceSearch = 1
let OmniCpp_PlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 "shows parameters
let OmniCpp_MayCompleteDot = 1 "complete after .
let OmniCpp_MayCompleteArrow = 1 "complete after ->
let OmniCpp_MayCompleteScope = 1 "complete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"automatically open/close completion pop-ups
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" tabbing settings based on filetype
autocmd FileType python set expandtab
autocmd FileType python set shiftwidth=4
autocmd FileType ruby set expandtab
autocmd FileType ruby set tabstop=2
