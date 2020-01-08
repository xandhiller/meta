""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'JuliaEditorSupport/julia-vim'
  let g:latex_to_unicode_file_types = ".*"
  let g:latex_to_unicode_auto = 1
Plugin 'junegunn/goyo.vim'
Plugin 'vimwiki/vimwiki'
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme elflord 
set number relativenumber
highlight Visual cterm=reverse
" Indicate the 80 character point in each row.
highlight Visual cterm=reverse ctermbg=grey
highlight LineNr ctermfg=cyan
highlight CursorLineNr ctermfg=red cterm=bold
" 81st column line toggle
let g:EIGHTY=0
set colorcolumn=81
function! EIGHTYtoggle()
  if !g:EIGHTY
    let g:EIGHTY=1
    call EIGHTYon()
  else 
    let g:EIGHTY=0
    call EIGHTYoff()
  endif
endfunction
function! EIGHTYon()
  highlight ColorColumn ctermbg=grey
endfunction
function! EIGHTYoff()
  highlight ColorColumn ctermbg=none
endfunction
call EIGHTYtoggle()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Input settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make tabs input two spaces
let mapleader=";"
set tabstop=2
set shiftwidth=2
set expandtab
set confirm 
set autoindent 
set linebreak
set mouse=a
set splitbelow splitright


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Resizing windows
noremap <C-y> <C-w><
noremap <C-u> <C-w>+
noremap <C-i> <C-w>-
noremap <C-o> <C-w>>
noremap <F5> :source<Space>$MYVIMRC<CR>:echo<Space>"~/.vimrc refreshed."<CR>
nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $
nnoremap K 0i<BS><Space><Esc>h
nnoremap v <C-v>
nnoremap M :marks abcdefghijklmnopqrstuvwxyz<CR>
nnoremap <Leader>dm :delmarks abcdefghijklmnopqrstuvwxyz<CR>echom "Marks deleted."
nnoremap <Leader>cl :call EIGHTYtoggle()<CR>
" Customise functionality of goyo plugin (centering of text)
nnoremap <C-c> :Goyo<CR>
inoremap <C-c> <Esc>:Goyo<CR>i
vnoremap <C-c> <Esc>:Goyo<CR>
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction
function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  highlight CursorLineNr ctermfg=red
  highlight ColorColumn ctermbg=grey
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


" Todo:
" * Show marks next to line column


