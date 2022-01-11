" plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'rust-lang/rust.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'NoahTheDuke/vim-just'

Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
command! -bang -nargs=* Rg call fzf#vim#rg_interactive(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'alt-h'))

" Language Server Alternatives
"Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['rust']}
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
"

" Colors
Plug 'zsoltf/vim-maui'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'ayu-theme/ayu-vim'
call plug#end()
" }}}

" ALE {{{
let g:ale_linters = {'rust': ['analyzer']}
"let g:ale_linters = {'rust': ['rls']}
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 0
let g:ale_sign_error = "x"
let g:ale_sign_warning = "!"
" ALE }}}

" BEHAVIOUR {{{
  filetype plugin indent on
  set nocompatible     " this is not vi
  set scrolloff=5      " keep at least 5 lines below/above cursor
  set sidescrolloff=5  " keep at least 5 lines left/right of cursor
  set mouse=a          " use mouse everywhere
  set autochdir        " always switch to the current file directory
  "set hidden           " hides buffers instead of closing them
  set novisualbell     " don't beep
  set noerrorbells     " don't beep
  set splitbelow       " open split below instead above
  "set splitright       " open split right instead leeft
  set pastetoggle=<F2> " disables autoindenting etc for pasting

  set ttyfast
  "set backup
  "set backupdir=~/.vim/backup
  "set directory=~/.vim/swap
  "set noswapfile

" BEHAVIOUR }}}

" LOOKS {{{
  syntax on " of cause!

  set number
  set ruler           " current line number on status bar
  set nowrap          " no line wrapping
  set cursorline      " highlight current line
  set laststatus=2    " always show a statusline
  set termguicolors

  " default tab stops
  set tabstop=2 shiftwidth=2 expandtab

  " auto/smart indent
  set autoindent smartindent

  set guifont=DejaVu\ Sans\ Mono:h7

" LOOKS }}}

" COLOR {{{
"colorscheme Tomorrow
let ayucolor="dark"
colorscheme ayu
colorscheme maui
" COLOR }}}

" navigation {{{
  inoremap jj <ESC>
  inoremap kk <ESC>
  set wildmenu
  set wildmode=longest,list:longest
  nnoremap k gk
  nnoremap j gj
  " navigation }}}

" SHORTCUTS {{{

  autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
  nnoremap <F5> :GundoToggle<CR>
  map <F9> :NERDTreeToggle<CR>
  map <F11> :set fullscreen!<CR>
" SHORTCUTS }}}


" window stuff {{{
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  "map <C-S-h> <C-w>< " does not use shift yet, because vim does not
  "map <C-S-j> <C-w>+ " lets hope it will at some point
  "map <C-S-k> <C-w>- "
  "map <C-S-l> <C-w>> "
  let g:airline_powerline_fonts = 1
  "let g:airline#extensions#tabline#enabled = 0
  "let g:airline#extensions#tabline#left_sep = ' '
  "let g:airline#extensions#tabline#left_alt_sep = '|'
  "" }}}

" FILETYPES {{{
  au Filetype ruby   setl foldmethod=indent nofoldenable
  au Filetype python setl foldmethod=indent nofoldenable
  au Filetype python setl shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au Filetype yaml   setl foldmethod=indent foldenable
  au Filetype vim    setl foldmethod=marker foldenable shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
  au Filetype rust   setl foldmethod=marker foldmarker={,} nofoldenable foldtext=GetCustomFoldText()
  au Filetype pandoc setl nofoldenable

  au Filetype javascript setl shiftwidth=4 tabstop=4 smarttab foldmethod=indent foldmarker={,} nofoldenable

  function GetCustomFoldText()
    let foldClose = '}'
    let foldTtl = v:foldend - v:foldstart
    return getline(v:foldstart) . ' (+) ' . foldTtl .  ' lines... ' . foldClose
  endfunction
" }}}
