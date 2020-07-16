"Encoding
set encoding=utf-8
set fileencoding=utf-8

"Numbers
set nu
set relativenumber

"search options
set hlsearch
set incsearch
nnoremap <leader>h :nohlsearch<CR>

" Basic settings
syntax on
set ruler
set noerrorbells
set mouse=""
set wildmenu
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set path+=**

"Basic remap
inoremap jj <Esc>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-n> gT
nnoremap <C-m> gt
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
exec "set listchars=tab:\u86\uBB,nbsp:\uB7,trail:\uB7,eol:\uAC"
set list
nmap <leader>l :set list!<CR>
nnoremap <leader>s :set spell!<CR>

"tab settings
set tabstop=4
set shiftwidth=4
set expandtab

"fold settings
set foldmethod=manual
autocmd Filetype c setlocal foldmethod=syntax
autocmd Filetype h setlocal foldmethod=syntax
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

"" markdown
function MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "=" 
endfunction

autocmd Filetype md,markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype md,markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype md,markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype md,markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype md,markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype md,markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype md,markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype md,markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype md,markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype md,markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd setlocal foldexpr=MarkdownLevel
autocmd Filetype markdown,rmd setlocal foldmethod=expr
""

"Color settings
colo darkblue
set cursorline "Highlight current line
hi CursorLine term=bold cterm=bold guibg=Grey20
hi Folded ctermbg=240

"comenting code
au BufWinEnter *.py noremap <leader>p :s/^/# /<CR> :nohlsearch <CR>
au BufWinEnter *.pyw noremap <leader>p :s/^/# /<CR> :nohlsearch <CR>
au BufWinEnter *.py noremap <leader>P :s/^# //<CR> :nohlsearch <CR>
au BufWinEnter *.pyw noremap <leader>P :s/^# //<CR> :nohlsearch <CR>
au BufWinEnter *.c noremap <leader>p :s/^/\/\/ /<CR> :nohlsearch <CR>
au BufWinEnter *.h noremap <leader>p :s/^/\/\/ /<CR> :nohlsearch <CR>
au BufWinEnter *.c noremap <leader>P :s/^\/\/ //<CR> :nohlsearch <CR>
au BufWinEnter *.h noremap <leader>P :s/^\/\/ //<CR> :nohlsearch <CR>

"Custom settings
execute "noremap <leader>v :tabe " . var_doc . "<CR><C-w>v'V<C-w><C-r><C-w><C-w><C-w>s:e " . var_doc2 . "<CR><C-w><C-r><C-w><C-w>"
nnoremap <leader>w :up<CR>
inoremap <leader>w <Esc>:up<CR>
nnoremap <leader>Q :bd!<CR>
nnoremap <leader>q :b#<bar>bd#<CR>
inoremap <Space><Space> <Esc>/<++><CR>:nohlsearch <CR>"_c4l
nnoremap <leader>t o<++><Esc>
nnoremap <leader>b :<C-r>p<CR>
nnoremap <leader>f :diffoff<CR>:diffthis<CR>
nnoremap <leader>F :diffoff<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>y "+y
nnoremap <leader>p "+p
