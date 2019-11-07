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

"-- Vanilla Settings
set noswapfile
set tw=79
set fo+=t
set wm=2
set number rnu
set tabstop=2
set noexpandtab
set shiftwidth=2
set encoding=utf-8
set splitbelow splitright
let mapleader =","
let maplocalleader=";"
syntax on

"-- Modded Settings
colorscheme onedark
set omnifunc=syntaxcomplete#Complete
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
let g:lightline.colorscheme = 'onedark'
let g:lightline.separator = {
      \ 'left': "", 'right': ''
      \ }
let g:onedark = {}
let g:onedark_termcolors=256


"-- Vanilla Keybinds
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader><leader> <Esc>/<++><Enter>"_c4l
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
nnoremap S :%s//g<Left><Left>

"-- Modded Keybinds
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>n :NERDTreeToggle<CR>


let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd BufWritePre * %s/\s\+$//e


"-- Markdown Keybinds
autocmd Filetype markdown inoremap <leader>n ---<Enter><Enter>
autocmd Filetype markdown inoremap <leader>b ****<++><Esc>F*hi
autocmd Filetype markdown inoremap <leader>s ~~~~<++><Esc>F~hi
autocmd Filetype markdown inoremap <leader>i **<++><Esc>F*i
autocmd Filetype markdown inoremap <leader>h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap <leader>img ![](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap <leader>link [](<++>)<++><Esc>F[a
autocmd Filetype markdown inoremap <leader>2 ##<Space><Enter><++><Esc>kA<Esc>:r!date<Cr>i<Backspace><Esc>3el6deA<Space>
autocmd Filetype markdown inoremap <leader>3 ###<Space><Enter>+ <++><Esc>kA
autocmd Filetype markdown inoremap <leader>l --------<Enter>
autocmd FileType markdown inoremap <leader>c ```<Space><Enter>```<Esc>2kA

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif
