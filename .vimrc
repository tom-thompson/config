"""" ~/.vimrc (configuration file for vim only)
"""" skeletons
"""function! SKEL_spec()
"""	0r /usr/share/vim/current/skeletons/skeleton.spec
"""	language time en_US
"""	if $USER != ''
"""		let login = $USER
"""	elseif $LOGNAME != ''
"""		let login = $LOGNAME
"""	else
"""		let login = 'unknown'
"""	endif
"""	let newline = stridx(login, "\n")
"""	if newline != -1
"""		let login = strpart(login, 0, newline)
"""	endif
"""	if $HOSTNAME != ''
"""		let hostname = $HOSTNAME
"""	else
"""		let hostname = system('hostname -f')
"""		if v:shell_error
"""		let hostname = 'localhost'
"""		endif
"""	endif
"""	let newline = stridx(hostname, "\n")
"""	if newline != -1
"""		let hostname = strpart(hostname, 0, newline)
"""	endif
"""	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
"""	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
"""	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
"""	setf spec
"""endfunction
"""autocmd BufNewFile	*.spec	call SKEL_spec()
"""" filetypes
"""filetype plugin on
"""filetype indent on
"""" ~/.vimrc ends here

set shell=/bin/bash

set completeopt=menuone,menu,longest,preview

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'nanotech/jellybeans.vim'
"Bundle 'kien/rainbow_parentheses.vim'
"Bundle 'VimIRC'

filetype on

let g:ycm_min_num_of_chars_for_completion = 1
let g:syntastic_always_populate_loc_list = 1
let g:ycm_register_as_syntastic_checker = 0
let g:syntastic_cpp_checkers = ['ycm', 'cpplint']
let g:syntastic_c_pcheckers = ['ycm', 'cpplint']
let g:syntastic_objc_pcheckers = ['ycm']
let g:syntastic_objcpp_checkers = ['ycm']
let g:syntastic_cpp_cpplint_thres = 0

set nu
set t_Co=256
set listchars=tab:\\_,trail:~,extends:>,precedes:<
set list
syntax on
colorscheme jellybeans

"""" tabbing settings based on filetype
"""set shiftwidth=4
"""autocmd FileType python set expandtab
"""autocmd FileType python set shiftwidth=4
"""autocmd FileType ruby set expandtab
"""autocmd FileType ruby set tabstop=2
"""autocmd FileType ruby set shiftwidth=2
"""autocmd Filetype lua set shiftwidth=4
"""autocmd Filetype lua set tabstop=4
autocmd FileType cpp set expandtab
autocmd FileType cpp set ts=2
autocmd FileType cpp set sw=2

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
"au Syntax * RainbowParenthesesLoadChevrons

filetype indent on
set autochdir

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_extra_conf_globlist = ['~/dev/*', '!~/*']
