set number 	" Show number before line
set ic		" Ignore register
set hls is	" Highlight seatch
set nowrap	" Without warp
set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
syntax on		" Highligh syntax
filetype plugin on
set tabpagemax=99
set autoindent
set showtabline=2	"Show tabs always

autocmd BufNewFile,BufRead *.c set syn=cpp 
autocmd BufNewFile,BufRead *.asm set syn=tasm 

" -> Theme
colorscheme ron
" Theme -<
" -> Menu colors
highlight Pmenu ctermbg=darkgray gui=bold
highlight PmenuSel ctermbg=black gui=bold
" Menu colors -<

" -> Numb col colors
highlight LineNr ctermfg=244
highlight LineNr ctermbg=235
" Numb col colors -<

" Keys
" Tabs
map 1 1gt
map 2 2gt
map 3 3gt
map 4 4gt
map 5 5gt
map 6 6gt
map 7 7gt
map 8 8gt
map 9 9gt

"Run and compile
nmap <F11> :!g++ % -o %< -Wall	
nmap <F10> :!./%<
nmap <F12> :make

"Switch hexmode
nnoremap <C-H> :Hexmode<CR>
noremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>


"Resolving problem with make
let &efm='' 
let &efm.='%-GIn file included from %.%#' 
let &efm.=',%-Ginstantiated from %.%#' 
let &efm.=',%-G %#from %.%#' 
let &efm.=',%*[^"]"%f"%*\D%l: %m' 
let &efm.=',"%f"%*\D%l: %m' 
let &efm.=',%-G%f:%l: (Each undeclared identifier is reported only once' 
let &efm.=',%-G%f:%l: for each function it appears in.)' 
let &efm.=',%-Gfrom %f:%l:%c' 
let &efm.=',%-Gfrom %f:%l' 
let &efm.=',%-Gfrom %f:%l:' 
let &efm.=',%f:%l:%c:%m' 
let &efm.=',%f(%l):%m' 
let &efm.=',%-G%f:%l: warning: %m' 
let &efm.=',%f:%l:%m' 
let &efm.=',"%f"' 
let &efm.=', line %l%*\D%c%*[^ ] %m' 
let &efm.=',%D%*\a[%*\d]: Entering directory `%f'."'" 
let &efm.=',%X%*\a[%*\d]: Leaving directory`%f'."'" 
let &efm.=',%D%*\a: Entering directory `%f'."'" 
let &efm.=',%X%*\a: Leaving directory `%f'."'" 
let &efm.=',%DMaking %*\a in %f,%f|%l| %m'."'" 
let &efm.=',%-G%.%#' 


"Hexmode 
command -bar Hexmode call ToggleHex()
function ToggleHex()
	let l:modified=&mod
	let l:oldreadonly=&readonly
	let &readonly=0
	let l:oldmodifiable=&modifiable
	let &modifiable=1

	if !exists("b:editHex") || !b:editHex
		let b:oldft=&ft
		let b:oldbin=&bin
		setlocal binary
		let &ft="xxd"
		let b:editHex=1
		%!xxd
	else
		let &ft=b:oldft
		if !b:oldbin
			setlocal nobinary
		endif
		let b:editHex=0
		%!xxd -r
	endif

	let &mod=l:modified
	let &readonly=l:oldreadonly
	let &modifiable=l:oldmodifiable
endfunction


"Omni
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/sdl
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
