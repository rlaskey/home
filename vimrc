" ~/.vimrc

set mouse=nv

set backspace=2

set viminfo='0,/0,<7

syntax on

set tabstop=4
set shiftwidth=4

set smartindent

set hlsearch
set showmatch

" https://github.com/BurntSushi/ripgrep
set grepprg=rg\ --vimgrep

set ruler
set number
set cursorcolumn
set signcolumn=yes

set laststatus=2
set wildmenu

set listchars=tab:\.\ ,trail:-
set list


autocmd FileType gitcommit,markdown,mail setlocal spell textwidth=72
autocmd Filetype yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype python setlocal shiftwidth=4 tabstop=4 expandtab


nnoremap <Leader>lo :lopen<Return>
nnoremap <Leader>lc :lclose<Return>
nnoremap <Leader>ln :lnext<Return>
nnoremap <Leader>lp :lprevious<Return>

nnoremap <Leader>co :copen<Return>
nnoremap <Leader>cc :cclose<Return>
nnoremap <Leader>cn :cnext<Return>
nnoremap <Leader>cp :cprevious<Return>


" fzf.vim
nnoremap <Leader>r :Rg<Return>
nnoremap <Leader>f :Files<Return>
nnoremap <Leader>s :GFiles?<Return>


" vim-plug
const s:root = has('nvim') ? stdpath('data') . '/site' : expand('~/.vim')
const s:autoload = s:root . '/autoload/plug.vim'
const s:plugged = s:root . '/plugged'
if empty(glob(s:autoload))
	echom 'no autoload for vim-plug. Downloading now.'
	execute '!curl -sfLo ' . s:autoload . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif


" vim-plug -- the list
try
	call plug#begin(s:plugged)
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'
	call plug#end()
catch
	echom 'vim-plug is not loaded. Try restarting the editor.'
endtry


" vim-plug -- install packages, if any one is NOT installed
if exists(':PlugInstall') > 0
	let s:install = v:false
	for p in values(g:plugs)
		let s:dir = get(p, 'dir', '')
		if s:dir != '' && ! isdirectory(s:dir)
			echom get(p, 'uri', '??') . ' is not installed.'
			let s:install = v:true
			break
		endif
	endfor

	if s:install == v:true
		PlugInstall
		PlugClean
	endif
endif
