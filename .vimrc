"execute pathogen#infect()
set nocompatible
filetype off
set shell=/bin/bash
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-one'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
let mapleader =","
let maplocalleader=";"
set tabstop=2
set noexpandtab
set shiftwidth=2

colorscheme onedark
let g:gruvbox = {}
let g:gruvbox.italic=1
set background=dark
set laststatus=2
let g:lightline = {}
let g:lightline.subseparator = {
       \ 'left': "", 'right': ''
       \ }
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_fenced_languages = ['csharp=cs', 'java=java']
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
set noswapfile
set tw=79
set fo+=t
set wm=2
set number rnu

let g:lightline.colorscheme = 'onedark'
let g:lightline.separator = {
      \ 'left': "", 'right': ''
      \ }

let g:onedark = {}
let g:onedark_termcolors=256
 " #==	==# "

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>


	syntax on
	set encoding=utf-8
	set rnu

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

	map <leader>n :NERDTreeToggle<CR>
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Enable Goyo by default for mutt writting
	" Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=dark
	autocmd BufWritePre * %s/\s\+$//e


" Navigating with guides
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

"""HTML Stuff
	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ,i <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,h1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,h2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,h3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,l <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>

"MARKDOWN

	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,img ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,link [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA<Esc>:r!date<Cr>i<Backspace><Esc>3el6deA<Space>
	autocmd Filetype markdown,rmd inoremap ,4 ####<Space><Enter>+ <++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd FileType markdown,rmd inoremap ,i $\int_{}^{<++>}<++>d<++>$<Esc>3ba
	autocmd FileType markdown,rmd inoremap ,f $\frac{}{<++>}$<Esc>ba
	autocmd FileType markdown,rmd inoremap ,c ```<Space><Enter>```<Esc>2kA

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif
