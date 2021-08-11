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
set ruler "show the cursor position at all time
set noerrorbells
set mouse=""
set wildmenu
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set cursorline
set autoread "reload file if changed outside of vim
set path+=**

"Basic remap
inoremap jj <Esc>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-n> gT
nnoremap <C-p> gt
nnoremap c "cc
nnoremap C "cC
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
map! <F3> <C-R>=strftime('%c')<CR>
cnoremap <C-l> <Right>
cnoremap <C-h> <Left>
nnoremap <leader>w :s/[ ]\+$//e<CR>:nohlsearch<CR>:up<CR>
inoremap <leader>w <Esc>:s/[ ]\+$//e<CR>:nohlsearch<CR>:up<CR>

"non printable characters
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
highlight NonText guifg=#1a1a19
highlight SpecialKey guifg=#4a4a59
exec "set listchars=tab:\uBB\uBB,nbsp:\uB7,trail:\uB7,eol:\uAC"
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

autocmd Filetype md,markdown,rmd nnoremap ,n ---<Enter><Enter>
autocmd Filetype md,markdown,rmd nnoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype md,markdown,rmd nnoremap ,h ====<Space><++><Esc>F=hi

autocmd Filetype md,markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype md,markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype md,markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype md,markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype md,markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype md,markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype md,markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype md,markdown,rmd inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype md,markdown,rmd inoremap ,5 #####<Space><Enter><++><Esc>kA
autocmd Filetype md,markdown,rmd inoremap ,6 ######<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd setlocal foldexpr=MarkdownLevel
autocmd Filetype markdown,rmd setlocal foldmethod=expr
""

"Color settings
colo darkblue
set cursorline "Highlight current line
hi CursorLine term=bold cterm=bold guibg=Grey20
hi Folded ctermbg=240

"comenting code
au BufWinEnter *.h,*.c noremap <leader>p :s/^/\/\/ /<CR> :nohlsearch <CR>
au BufWinEnter *.h,*.c noremap <leader>P :s/^\/\/ //<CR> :nohlsearch <CR>

"Python settings
au BufWinEnter *.pyw,*.py noremap <leader>p :s/^/# /<CR> :nohlsearch <CR>
au BufWinEnter *.pyw,*.py noremap <leader>P :s/^# //<CR> :nohlsearch <CR>
au BufWinEnter *.pyw,*.py set colorcolumn=81

" Html
set matchpairs+=<:>

"Custom settings
silent execute "noremap <leader>v :tabe " . var_doc . "<CR><C-w>v'V<C-w><C-r><C-w><C-w><C-w>s:e " . var_doc2 . "<CR><C-w><C-r><C-w><C-w>"
vnoremap u :s/\%V[0-9a-fA-F]\{2\}/\=nr2char(printf("%d", "0x".submatch(0)))/g"<cr><c-l>
"vnoremap u :<c-u>s/\%V[0-9a-fA-F]\{2\}/\=nr2char(printf("%d", "0x".submatch(0)))/g"<cr><c-l>
nnoremap <leader>Q :bd!<CR>
nnoremap <leader>q :b#<bar>bd#<CR>
inoremap <Space><Space> <Esc>/<++><CR>:nohlsearch <CR>"_c4l
nnoremap <Space><Space> ?<++><CR>:nohlsearch <CR>"_c4l
nnoremap <leader>t o<++><Esc>
nnoremap <leader>b :<C-r>p<CR>
nnoremap <leader>f :diffoff<CR>:diffthis<CR>
nnoremap <leader>F :diffoff<CR>
nnoremap <leader>n <C-w>v:e .<CR>
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 4/5)<CR>
nnoremap <leader>r :so ~/.vimrc<CR>
nnoremap <F3> :make!<cr>

"Project Settings(in project folder)
set exrc
set secure
