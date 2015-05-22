" keep it awesome- custom file warrants this
set nocompatible

" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set encoding=utf-8 " Necessary to show Unicode glyphs
set guioptions-=r " macvim: remove right scrollbar
set guioptions-=L " macvim: remove left scrollbar from nerdtree
set antialias

" Airline
" cd bundle/powerline-fonts
" ./install.sh (installs "Sauce Code Powerline Light")
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set guifont=Sauce\ Code\ Powerline\ Light:h16

" neocomplete
let g:neocomplete#enable_at_startup = 1
:inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"

" Rainbow parentheses
let g:rainbow_active = 1

" Gundo
nnoremap <F5> :GundoToggle<CR>

" disable vim-markdown folder
let g:vim_markdown_folding_disabled=1

" emmet
let g:user_emmet_leader_key='<C-i>'

" spotify
let g:spotify_country_code = 'US'

" remove trailing spaces
command TRAIL %s/\s\+$//

let g:syntastic_javascript_checkers = ['eslint']

" gist-vim
let g:gist_clip_command = 'pbcopy' " pbcopy for OSX Only
let g:gist_detect_filetype = 1
let g:gist_post_private = 1

" ctrl-p
" TODO: clear cache on pull up? map new key?
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
set wildignore+=*.git/*,*node_modules/*,*coverage/*,*bower_components/*,*.vim/bundle,*tmp/*,*.keep
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nnoremap <silent> <C-n> :CtrlPBuffer<CR>

" color and syntax settings
set background=dark
colorscheme base16-tomorrow
" set t_Co=256
" colors twilighted
syntax on

set backspace=indent,eol,start " backspacing support
set nofoldenable " Disable folding
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases
set hlsearch " Highlight search resultsh
set incsearch " be like search in modern browsers
set ruler " Always set the mouse cursor position
set nowrap " Disable wrapping
set hidden " Allow switching between buffers without saving .
set number " Always show line numbers.
set title " Set xterm title.

" Turn off backups, etc.
set nobackup
set nowb
set noswapfile

" Custom file extensions..
au! BufRead,BufNewFile .jshintrc    setfiletype javascript
au! BufRead,BufNewFile .jslintrc    setfiletype javascript
au! BufRead,BufNewFile *.mustache   setfiletype mustache
au! BufRead,BufNewFile *.co         setfiletype coffee
au! BufRead,BufNewFile *.less       setfiletype less

" Indentation settings..
set autoindent
filetype plugin indent on
autocmd FileType * set tabstop=2|set shiftwidth=2
autocmd FileType hs set tabstop=2|set shiftwidth=2
autocmd FileType text setlocal textwidth=78 " for git commits
set expandtab

" Map space to / (search)
map <space> /
map <silent> <leader><cr> :noh<cr>

"  Easier way to move between windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"  NERD Tree
let NERDTreeShowHidden=1
" nnoremap <silent> <C-e> :NERDTreeToggle<CR>
nnoremap <silent> mm :NERDTreeToggle<CR>

" Map jj to replace the escape key.
:imap jj <Esc>

" Spellcheck en_CA
map <leader>a :setlocal spell spelllang=en_us<CR>
map <leader>A :setlocal nospell<CR>

" Load in a custom config in CWD?
if filereadable(".vim.custom")
    so .vim.custom
endif

" Visual mode related..
" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Tab switching
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif


" Need +virtualedit to paste in insert mode.
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>
