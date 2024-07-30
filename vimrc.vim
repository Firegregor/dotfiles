" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Numbers
set nu
set relativenumber

" Search options
set hlsearch
set incsearch
nnoremap <leader>h :nohlsearch<CR>

" Files
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Searching
set wildmenu
set path+=**

" View
syntax on
set ruler "show the cursor position at all time
set cursorline

" Colors
colo desert
" set cursorline "Highlight current line
hi CursorLine term=bold cterm=bold guibg=Grey20
hi Folded ctermbg=240

" Mouse and bells
set mouse=""
set noerrorbells

" Indent
set smartindent
set autoread "reload file if changed outside of vim

" Basic remap
inoremap jj <Esc>
nnoremap c "cc
nnoremap C "cC
nnoremap <leader>w :up<CR>
inoremap <leader>w <ESC>:up<CR>
nnoremap <leader>r :so ~/.vimrc<CR>

" <++> trick
nnoremap <Space><Space> /<++><CR>:nohlsearch<CR>"_c4l
nnoremap <leader><Space> a<++><Esc>
nnoremap <leader>t o<++><Esc>
inoremap <Space><Space> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
inoremap <leader><Space> <++>

" Navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-n> gT
nnoremap <C-p> gt
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
cnoremap <C-l> <Right>
cnoremap <C-h> <Left>

" Resizing
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <leader>> :exe "vertical resize " . (winwidth(0) * 5/4)<CR>
nnoremap <silent> <leader>< :exe "vertical resize " . (winwidth(0) * 4/5)<CR>

" Non printable characters
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
highlight NonText guifg=#1a1a19
highlight SpecialKey guifg=#4a4a59
exec "set listchars=tab:\uBB\uBB,nbsp:\uB7,trail:\uB7,eol:\uAC"
set list
nmap <leader>l :set list!<CR>
nnoremap <leader>s :set spell!<CR>

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
nnoremap <leader>t :set expandtab!

" Fold settings
set foldmethod=manual
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

" Save buffers
set viewdir=~/.config/vim/view
augroup remember_folds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent! loadview
augroup END

" vim
nnoremap <leader>v :tabe ~/.vimrc<CR>v'V
autocmd BufWinEnter *.vim set foldmethod=expr
autocmd BufWinLeave *.vim set foldmethod=manual
autocmd BufWinEnter *.vim nnoremap <leader>p :s/^/" /<CR>:nohlsearch<CR>
autocmd BufWinEnter *.vim nnoremap <leader>P :s/^" //<CR>:nohlsearch<CR>

" Markdown
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

" C files
autocmd BufWinEnter *.c,*.h set foldmethod=syntax
autocmd BufWinLeave *.c,*.h set foldmethod=manual
autocmd BufWinEnter *.c,*.h nnoremap <leader>p :s/^/\/\/ /<CR>:nohlsearch<CR>
autocmd BufWinEnter *.c,*.h nnoremap <leader>P :s/^\/\/ //<CR>:nohlsearch<CR>

" Python settings
autocmd BufWinEnter *.py,*.pyw set foldmethod=syntax
autocmd BufWinLeave *.py,*.pyw set foldmethod=manual
autocmd BufWinEnter *.py,*.pyw nnoremap <leader>p :s/^/# /<CR>:nohlsearch<CR>
autocmd BufWinEnter *.py,*.pyw nnoremap <leader>P :s/^# //<CR>:nohlsearch<CR>

" Html
set matchpairs+=<:>

" Notes
nnoremap <leader>O :! bash -i -c ~/.config/dotfiles/takenote.sh<CR>
nnoremap <leader>o :! wt -w 0 nt -p Notes<CR>
inoremap <leader>q <ESC>:q!<CR>

"Custom settings
"vnoremap u :s/\%V[0-9a-fA-F]\{2\}/\=nr2char(printf("%d", "0x".submatch(0)))/g"<cr><c-l>
"vnoremap u :<c-u>s/\%V[0-9a-fA-F]\{2\}/\=nr2char(printf("%d", "0x".submatch(0)))/g"<cr><c-l>
nnoremap <leader>Q :bd!<CR>
nnoremap <leader>q :bd<CR>
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

"Local notes
"nnoremap <leader>o :tabe ~/.config/Notes/log/note-$(date +\%Y-\%m).md<CR>Go<Esc>:r!echo "\#\# $(date +\%d.\%m-\%H:\%M)"<CR>o

function! Open_win_path()
    "opens file from windows like path
    let @+ = "/" . join(split(@+, ":"),"")
    let @+ = join(split(@+, "\\"), "/")
    let @+ = join(split(@+, "\""), "")
    ":echo fin_path
    :execute "e " . @+
endfunction

nnoremap <leader>v :call Open_win_path()<CR>
