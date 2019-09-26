"Numbers
set nu
set relativenumber
set autoindent

"search options
set hlsearch
set incsearch
syntax on

"Basic remap
inoremap jj <Esc>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap c "cc
nnoremap C "cC
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
map! <F3> <C-R>=strftime('%c')<CR>
cnoremap <C-l> <Right>
cnoremap <C-h> <Left>

"non printable characters
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
highlight NonText guifg=#1a1a19
highlight SpecialKey guifg=#4a4a59
exec "set listchars=tab:\u86\uBB,nbsp:\uB7,trail:\u95,eol:�"
set list
nmap <leader>l :set list!<CR>
nnoremap <leader>s :set spell!<CR>

"tab settings
set tabstop=4
set shiftwidth=4
set expandtab

"fold settings
autocmd Filetype c setlocal foldmethod=syntax
autocmd Filetype h setlocal foldmethod=syntax

" markdown
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kAletype markdown,rmd setlocal foldmethod=syntax

"Color settings

colo darkblue
set cursorline "Highlight current line
hi CursorLine term=bold cterm=bold guibg=Grey20
hi Folded ctermbg=240

"Custom settings
set ru
set mouse=""
set wildmenu
set noswapfile
set nobackup
set noundofile
set path+=**
noremap <leader>v :tabe ~/Documents/Vim/motion_commands.txt<CR><C-w>v'V<C-w><C-r><C-w><C-w><C-w>s:e C:/sw_tools/Vim/vimfiles/plugin<CR><C-w><C-r><C-w><C-w>
nnoremap <leader>w :up<CR>
inoremap <leader>w <Esc>:up<CR>
nnoremap <leader>Q :bd!<CR>
nnoremap <leader>q :b#<bar>bd#<CR>
nnoremap <leader>n gT
nnoremap <leader>m gt
inoremap <Space><Space> <Esc>/<++><CR>"_c4l
nnoremap <leader>t o<++><Esc>
nnoremap <leader>b :<C-r>p<CR>