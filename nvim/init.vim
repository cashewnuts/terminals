if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})  
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})  

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" ################ General ##################
set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
" set showmatch	" Highlight matching brace
set spell	" Enable spell-checking
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smarttab	" Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab

"" Advanced
set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

set mouse=a
set lazyredraw

nnoremap bn :bn<cr>
nnoremap bp :bp<cr>
nnoremap bd :bd<cr> 

tnoremap <Esc> <C-\><C-n><CR>

" terminal setting
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" turn hybrid line numbers on
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" When a file has been detected, automatically read it again.
set autoread
autocmd FocusGained * checktime

" ################ AIR LINE ##################
let g:airline#extensions#tabline#enabled = 1

" ################ NERDTREE ##################
map <C-e> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p
let NERDTreeQuitOnOpen = 1
" close vim if the only window left open is a NERDTree<Paste>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1

noremap <Leader>e :NERDTreeFind<cr>

" ################ fzf ##################
nnoremap <C-p> :Files<CR>
nnoremap <A-p> :GFiles<CR>
nnoremap <C-g> :Rg<Cr>
nnoremap <C-l> :Buffers<Cr>

" ################ vim-colors-solarized ##################
" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" ################ vim-gitgutter ##################
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Update sign column every quarter second
set updatetime=1000
" disable all default keymap
let g:gitgutter_map_keys = 0
" Hunk-add and hunk-revert for chunk staging
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>ga <Plug>GitGutterStageHunk  " git add (chunk)
nmap <Leader>gu <Plug>GitGutterUndoHunk   " git undo (chunk)

" ################ vimagit ##################
" Open vimagit pane
nnoremap <Leader>gs :Magit<CR>       " git status

" ################ neoterm ##################
let g:neoterm_default_mod = ':botright'

" ################ COC Completion-with sources ##################
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <Leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <Leader>f  <Plug>(coc-format-selected)
nmap <Leader>f  <Plug>(coc-format-selected)

" Coc-git
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)

