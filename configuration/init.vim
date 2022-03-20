"  APPEARANCE/INPUT 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=";"
colorscheme default
set nocompatible
set clipboard+=unnamedplus
"set signcolumn=yes
set noshowmatch
set wrap
set tabstop=4
set mouse=a
set shiftwidth=4
set expandtab
set splitright
set splitbelow
set number
"set relativenumber
set confirm
set cmdheight=1
"set autoindent
set linebreak
set ignorecase
set smartcase
set cursorline
set wildmenu
set nohlsearch
set breakindent
set updatecount=1
set updatetime=100
"set shada='50,<1000,s100,:0,n~/nvim/shada
set conceallevel=0

" HIGHLIGHTS/COLOUR-SCHEME
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn colorscheme into function so that it can be called to refresh.
function! MyHighlights()
"   hi ALEErrorSign         ctermbg=255  ctermfg=red
"   hi ALEWarning           ctermbg=255
"   hi ColorColumn          ctermbg=255
    hi Comment              ctermfg=242
"   hi Conceal              ctermfg=1    ctermbg=none
   hi CursorLine            cterm=none   ctermbg=235
    hi CursorLineNr         cterm=bold   ctermfg=255    ctermbg=0
"   hi Folded               ctermfg=61   ctermbg=none
"   hi Identifier           ctermfg=62
    hi LineNr               cterm=none ctermfg=245 
"   hi MatchParen           cterm=bold   ctermfg=168 ctermbg=251
"   hi Number               ctermfg=134
"   hi PreProc              ctermfg=98   cterm=none
    hi Search               ctermfg=0 ctermbg=8
"   hi SignColumn           ctermbg=0
"   hi SignatureMarkText    ctermfg=244  ctermbg=254
"   hi Statement            ctermfg=124
    hi StatusLine           ctermbg=0  ctermfg=8
    hi StatusLineNC         ctermbg=8  ctermfg=0
"   hi String               ctermfg=35
    hi VertSplit            ctermbg=0  ctermfg=0
    hi Visual               cterm=none ctermfg=none ctermbg=236
"   hi vCursor              ctermbg=1
endfunction 


"  PLUG-INS 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim/ 
filetype off
call vundle#begin()
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'     
Plugin 'sotte/presenting.vim'
" Plugin 'tybenz/vimdeck'
Plugin 'plasticboy/vim-markdown'
    " For toggling to switch between hard-wrap and off.
Plugin 'junegunn/goyo.vim'
    nnoremap <C-c> :Goyo<CR>:<CR>:<Esc>
    function! s:goyo_enter()
        hi Hook                 ctermbg=189
        match Hook "<++>" 
        set signcolumn=no
    endfunction
    function! s:goyo_leave()
        call MyHighlights()
        set signcolumn=yes
    endfunction
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
"Plugin 'w0rp/ale'
    "let g:ale_sign_error = 'x'
    "let g:ale_sign_warning = '-'
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"    let g:tex_conceal = ""
"    let g:vim_markdown_math = 1
"    let g:vim_markdown_conceal_code_blocks = 0
Plugin 'SirVer/ultisnips'
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsExpandTrigger= '<Tab>'
    let g:UltiSnipsJumpForwardTrigger = '<Tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/UltiSnips']
    inoremap <C-u> <Esc>:UltiSnipsEdit<CR>
    nnoremap <C-u> <Esc>:UltiSnipsEdit<CR>
    vnoremap <C-u> <Esc>:UltiSnipsEdit<CR>
Plugin 'lervag/vimtex'
    let g:tex_flavor='latex'
    " let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    let g:vimtex_matchparen_enabled=0
    "let g:tex_fast = 'M'
    let g:tex_conceal=''
Plugin 'scrooloose/nerdtree'      
    map <M-Space> :NERDTreeRefreshRoot<CR>:NERDTreeToggle<CR>
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'kshenoy/vim-signature'

call vundle#end()
filetype plugin indent on
syntax on
call MyHighlights()
if !has('gui_running')
    set t_Co=256
endif
" Syntax back on, so call highlights/colorscheme
call MyHighlights()


" LINE AT 80 CHARS - Color for ColorColumn set in MyHighlights()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EIGHTY=0
function! EIGHTYon()
    set colorcolumn=81
endfunction
function! EIGHTYoff()
    set colorcolumn=0
endfunction
function! EIGHTYtoggle()
    if !g:EIGHTY
        let g:EIGHTY=1
        call EIGHTYon()
    else
        let g:EIGHTY=0
        call EIGHTYoff()
    endif
endfunction
nnoremap <Leader>cl :call EIGHTYtoggle()<CR>


" TOGGLE HIGHLIGHTS ON THE FLY -- an inidicate status to user.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:HL=0
function! HLtoggle()
    if !g:HL
        let g:HL=1
        set hls!
        echom "Highlights on."
    else
        let g:HL=0
        set hls!
        echom "Highlights off."
    endif
endfunction
nnoremap <Leader><CR> :call HLtoggle()<CR>


"  SHORTCUTS/MAPPINGS/ABREVIATIONS
""""""""""""""""""""""""""""""""""""""""
" Unmapping rubbish keys
nnoremap Q      <Nop>
vnoremap Q      <Nop>
vnoremap <F8>   <Nop>
vnoremap <F7>   <Nop>
nnoremap <F3>   <Nop>
nnoremap <F4>   <Nop>
inoremap <F3>   <Nop>
inoremap <F4>   <Nop>
inoremap <F9>   <Nop>
nnoremap <F9>   <Nop>
vnoremap <F9>   <Nop>
inoremap <F10>  <Nop>
nnoremap <F10>  <Nop>
vnoremap <F10>  <Nop>
inoremap <F11>  <Nop>
nnoremap <F11>  <Nop>
vnoremap <F11>  <Nop>
inoremap <F12>  <Nop>
nnoremap <F12>  <Nop>
vnoremap <F12>  <Nop>
" Hardcore Vim
nnoremap <Right>  <Nop>
nnoremap <Left>   <Nop>
nnoremap <Up>     <Nop>
nnoremap <Down>   <Nop>
inoremap <Right>  <Nop>
inoremap <Left>   <Nop>
inoremap <Up>     <Nop>
inoremap <Down>   <Nop>
vnoremap <Right>  <Nop>
vnoremap <Left>   <Nop>
vnoremap <Up>     <Nop>
vnoremap <Down>   <Nop>
nnoremap <S-Right>  <Nop>
nnoremap <S-Left>   <Nop>
nnoremap <S-Up>     <Nop>
nnoremap <S-Down>   <Nop>
inoremap <S-Right>  <Nop>
inoremap <S-Left>   <Nop>
inoremap <S-Up>     <Nop>
inoremap <S-Down>   <Nop>
vnoremap <S-Right>  <Nop>
vnoremap <S-Left>   <Nop>
vnoremap <S-Up>     <Nop>
vnoremap <S-Down>   <Nop>
" Compile the current document into markdown syntax pdf.
" nnoremap <Leader>d :w<CR>:silent ! livemd.py %:p %:p<CR>:source $MYVIMRC<CR>
" Edit init.vim on the fly
nnoremap <Leader>vv :vsp $MYVIMRC<CR>
" Moving around windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Resizing windows
nnoremap <C-Left>  3<C-w><
nnoremap <C-Down>  3<C-w>+
nnoremap <C-Up>    3<C-w>-
nnoremap <C-Right> 3<C-w>>
" Refresh vimrc
inoremap <F5>   <Esc>:source<Space>$MYVIMRC<CR>:echom "init.vim refreshed"<CR>i
nnoremap <F5>   <Esc>:source<Space>$MYVIMRC<CR>:echom "init.vim refreshed"<CR>
vnoremap <F5>   <Esc>:source<Space>$MYVIMRC<CR>:echom "init.vim refreshed"<CR>
" Copy and paste to the clipboard
set clipboard=unnamedplus
inoremap <C-y> <Nop>
nnoremap <C-y> <Nop>
vnoremap <C-y> "+y
inoremap <C-p> <Esc>"+pi
nnoremap <C-p> "+p
vnoremap <C-p> "+p
" Make saving quicker
nnoremap SS <Esc>:w<CR>
" Make moving around lines more intuitive
nnoremap H g^
vnoremap H g^
nnoremap L $
vnoremap L $
nnoremap <M-k> 10k
vnoremap <M-k> 10k
nnoremap <M-j> 10j
vnoremap <M-j> 10j
nnoremap Y y$
" Visual block is better than normal visual mode.
nnoremap v <C-v>
" Insert a line of space above and below the line you're on
nnoremap <Leader>o ko<Esc>jjO<Esc>k
" Use o and O to insert lines, not insert onto new lines
nnoremap o o<Esc>
nnoremap O O<Esc>
" Change the character below the cursor to uppercase.
nnoremap <Leader>u vu
nnoremap <Leader>U vU
nnoremap <Leader>f zfip
nnoremap <Leader>e zD
nnoremap <Leader>E zE
nnoremap <Leader>F zfip
nnoremap <Leader>= <C-w>=
nnoremap <Leader>co :vsp col<CR>:source ~/.scripts/colors.vim<CR>
" Navigating marks in a sane manner
nnoremap <Left> ['zz
vnoremap <Left> ['zz
nnoremap <Right> ]'zz
vnoremap <Right> ]'zz
" Quickly add marks
nmap mm m.
"nnoremap GG GGzz
"Replacing spaces with underlines in visual selection + the inverse
vnoremap <Leader>_ :s/\%V /_/g<CR>
vnoremap <Leader>- :s/\%V /-/g<CR>
nnoremap <Leader>_ :s/ /_/g<CR>
nnoremap <Leader>- :s/ /-/g<CR>
vnoremap <Leader><Space> :s/\%V_/ /g<CR>
nnoremap <Leader><Space> :s/_/ /g<CR>
" Bring up command history quicker
nnoremap <Leader>q q:
nnoremap <Leader>Q q:k<CR>
" Silence some function keys, except F5
nnoremap <F1> <Nop>
inoremap <F1> <Nop>
vnoremap <F1> <Nop>
snoremap <F1> <Nop>

nnoremap <F2> <Nop>
inoremap <F2> <Nop>
vnoremap <F2> <Nop>
snoremap <F2> <Nop>

nnoremap <F3> <Nop>
inoremap <F3> <Nop>
vnoremap <F3> <Nop>
snoremap <F3> <Nop>

nnoremap <F4> <Nop>
inoremap <F4> <Nop>
vnoremap <F4> <Nop>
snoremap <F4> <Nop>

" surround.vim is the best
nmap s ys
nmap ss yss
nmap si ysi
"Show Invisibles
nnoremap <Leader>i :set list!<CR>
" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>
" Terminal stuff in nvim
nnoremap <C-t> :split<cr><c-w><c-j>:terminal<cr>
"


" 2021-05-30: Replace hooks with smarter use of marks? 
" HOOKS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"         ([)
"     (l) (;) (') 
"         (.)
" <Leader><Leader>    Place hook
inoremap <Leader><Leader> <++>
nnoremap <Leader><Leader> i<++><Esc>
vnoremap <Leader><Leader> <Esc>i<++><Esc>
"" <Leader>l     Eat previous hook and go into insert mode
inoremap <Leader>l <Esc>a<Esc>?<++><CR>lh"_c4l
nnoremap <Leader>l <Esc>a<Esc>?<++><CR>lh"_c4l
vnoremap <Leader>l <Esc>a<Esc>?<++><CR>lh"_c4l
" <Leader>'     Eat next hook and go into insert mode
inoremap <Leader>' <Esc>a<Esc>/++><CR>h"_c4l
nnoremap <Leader>' <Esc>a<Esc>/++><CR>h"_c4l
vnoremap <Leader>' <Esc>a<Esc>/++><CR>h"_c4l
" <Leader>[     Go to previous hook
inoremap <Leader>[ <Esc>?<++><CR>i
nnoremap <Leader>{ <Esc>?<++><CR>
vnoremap <Leader>{ <Esc>?<++><CR>
" <Leader>.     Go to next hook
inoremap <Leader>. <Esc>/<++><CR>
nnoremap <Leader>. <Esc>/<++><CR>
vnoremap <Leader>. <Esc>><CR>
vnoremap <C-p> <Esc>gqap<CR>
" For syntax highlighting based on ctags.
nnoremap <F8> <Esc>:w<CR><Esc>:! ctags -R<CR><Esc>:UpdateTypesFile<CR>
inoremap <F8> <Esc>:w<CR><Esc>:! ctags -R<CR><Esc>:UpdateTypesFile<CR>
vnoremap <F8> <Esc>:w<CR><Esc>:! ctags -R<CR><Esc>:UpdateTypesFile<CR>
vnoremap <C-g> g<C-g>
"For GDB
nnoremap <M-Right> :Step<CR>
nnoremap <M-Left> :Over<CR>
nnoremap <M-Down> :Continue<CR>
nnoremap <M-CR> :Break<CR>
nnoremap <M-S-CR> :Run<CR>
nnoremap <M-BS> :Clear<CR>


" Tabularise speed up
vnoremap <Leader>t :Tabularize /


"" FILETYPE SPECIFIC SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup useful_md_Settings
    au BufReadPost useful.md normal GGzz
augroup END
augroup markdownSettings
    au!
    au FileType markdown set tabstop=4 shiftwidth=4
    au FileType markdown inoremap <M-8> ⋅
    au FileType markdown inoremap <M-7> ✓
    au FileType markdown inoremap <M-=> —
    au FileType markdown set listchars=eol:¬,tab:\▸\ ,trail:~,extends:>,precedes:<
augroup END
" .c
augroup cSettings
    au!
    "au FileType c call EIGHTYtoggle()
    au FileType c set shiftwidth=4
    au BufNewFile *.c read $HOME/Meta/templates/code/c.c
    au BufNewFile *.h read $HOME/Meta/templates/code/h.h
    au FileType c inoremap <Leader>r <Esc>:w<CR><Esc>:! crun %<CR>
    au FileType c nnoremap <Leader>r <Esc>:w<CR><Esc>:! crun %<CR>
    au FileType c vnoremap <Leader>r <Esc>:w<CR><Esc>:! crun %<CR>
    au FileType c inoremap <Leader>/ <Esc>g^i/*<Space><Esc>g_a<Space>*/
    au FileType c nnoremap <Leader>/ <Esc>g^i/*<Space><Esc>g_a<Space>*/<Esc>
    au FileType c vnoremap <Leader>/ <Esc>g^i/*<Space><Esc>g_a<Space>*/<Esc>
    au FileType c inoremap <Leader>? <Esc>g^d3lg_2hd3lA
    au FileType c nnoremap <Leader>? <Esc>g^d3lg_2hd3l
    au FileType c vnoremap <Leader>? <Esc>g^d3lg_2hd3l
augroup END
" .py
augroup pySettings
    au!
    " Run python file
    au FileType python nnoremap <Leader>r <Esc>:w<CR>:! python3 %<CR>
    au FileType python nnoremap <Leader>R <Esc>:w<CR>:! time python %<CR>
    " Commenting
    au FileType python inoremap <Leader>/ <Esc>g^i#<Space><Esc>$
    au FileType python nnoremap <Leader>/ <Esc>g^i#<Space><Esc>$
    au FileType python vnoremap <Leader>/ <Esc>g^i#<Space><Esc>$
    au FileType python inoremap <Leader>? <Esc>g^xx
    au FileType python nnoremap <Leader>? <Esc>g^xx
    au FileType python vnoremap <Leader>? <Esc>g^xx
    " au BufReadPost *.py call EIGHTYtoggle()
    au FileType python set tabstop=4 shiftwidth=4
    " Template
    au BufNewFile *.py read $HOME/Meta/templates/code/py.py
augroup END
augroup texSettings
    au!
    au Filetype tex nnoremap <C-E> :VimtexErrors<CR>
    au FileType tex set listchars=eol:¬,tab:\▸\ ,trail:~,extends:>,precedes:<
    au FileType tex normal zfip
    au Filetype tex nnoremap <leader>t <Esc>:VimtexCompile<CR>
    au Filetype tex nnoremap <leader>T <Esc>:VimtexView<CR>
    " Enable AutoSave for continuous compilation
"    au FileType tex let g:auto_save = 1 
augroup END
" .sh
augroup shSettings
    au!
    " Comment
    au FileType sh inoremap <Leader>/ <Esc>g^i#<Space><Esc>$
    au FileType sh nnoremap <Leader>/ <Esc>g^i#<Space><Esc>$
    au FileType sh vnoremap <Leader>/ <Esc>g^i#<Space><Esc>$
    " Uncomment
    au FileType sh inoremap <Leader>? <Esc>g^xx
    au FileType sh nnoremap <Leader>? <Esc>g^xx
    au FileType sh vnoremap <Leader>? <Esc>g^xx
    " Run sh
    au FileType sh inoremap <Leader>r <Esc>:w<CR><Esc>:! /usr/bin/zsh % <CR>
    au FileType sh nnoremap <Leader>r <Esc>:w<CR><Esc>:! /usr/bin/zsh % <CR>
    au FileType sh vnoremap <Leader>r <Esc>:w<CR><Esc>:! /usr/bin/zsh % <CR>
    " Shell template
    au BufNewFile *.sh read $HOME/Meta/templates/code/sh.sh
augroup END
" cpp
augroup cppSettings
    au!
    " au FileType cpp call EIGHTYtoggle()
    au FileType cpp set shiftwidth=4
    au BufNewFile *.cpp read $HOME/Meta/templates/code/cpp.cpp
    au BufNewFile *.hpp read $HOME/Meta/templates/code/hpp.hpp
    " Comment
    au FileType cpp inoremap <Leader>/ <Esc>g^i//<Space><Esc>$
    au FileType cpp nnoremap <Leader>/ <Esc>g^i//<Space><Esc>$
    au FileType cpp vnoremap <Leader>/ <Esc>g^i//<Space><Esc>$
    " Uncomment
    au FileType cpp inoremap <Leader>? <Esc>g^xxx
    au FileType cpp nnoremap <Leader>? <Esc>g^xxx
    au FileType cpp vnoremap <Leader>? <Esc>g^xxx
    "Run C++
    au FileType cpp inoremap <Leader>r <Esc>:w<CR><Esc>:! cpprun %<CR>
    au FileType cpp nnoremap <Leader>r <Esc>:w<CR><Esc>:! cpprun %<CR>
    au FileType cpp vnoremap <Leader>r <Esc>:w<CR><Esc>:! cpprun %<CR>
    au FileType cpp inoremap <Leader>R <Esc>:w<CR><Esc>:! time cpprun %<CR>
    au FileType cpp nnoremap <Leader>R <Esc>:w<CR><Esc>:! time cpprun %<CR>
    au FileType cpp vnoremap <Leader>R <Esc>:w<CR><Esc>:! time cpprun %<CR>
    au FileType cpp inoremap <Leader>b <Esc>:w<CR><Esc>:! cpprun % -build<CR>
    au FileType cpp nnoremap <Leader>b <Esc>:w<CR><Esc>:! cpprun % -build<CR>
    au FileType cpp vnoremap <Leader>b <Esc>:w<CR><Esc>:! cpprun % -build<CR>
augroup END
" Sick of the incorrect syntax in shell
augroup shell
    au!
    autocmd Filetype sh set syntax=zsh
augroup END
" Differentiate c and c++ headers.
augroup headers
    au!
    autocmd BufNewFile,BufRead *.h set syntax=c
    autocmd BufNewFile,BufRead *.h UltiSnipsAddFiletypes c
    autocmd BufNewFile,BufRead *.hpp UltiSnipsAddFiletypes cpp
    autocmd BufNewFile,BufRead *.hpp set syntax=cpp
augroup END
" Tex scratchpad
augroup texScratchpad
    au!
    autocmd BufWinLeave /home/alex/.tex_workspace/scratchpad.tex ! cat % | sed -e 's/\%//g' | sed -e "/^$/d" | xclip -selection clipboard
augroup END
" Shortcuts for .vim files
augroup vimFiles
    au!
    " Comment
    au FileType vim inoremap <Leader>/ <Esc>g^i"<Space><Esc>$
    au FileType vim nnoremap <Leader>/ <Esc>g^i"<Space><Esc>$
    au FileType vim vnoremap <Leader>/ <Esc>g^i"<Space><Esc>$
    " Uncomment
    au FileType vim inoremap <Leader>? <Esc>g^xx
    au FileType vim nnoremap <Leader>? <Esc>g^xx
    au FileType vim vnoremap <Leader>? <Esc>g^xx
augroup END
" Cmake
augroup cmakeFiles
    au!
    au BufNewFile CMakeLists.txt read $HOME/Meta/templates/code/CMakeLists.txt
augroup END
" Javascript
augroup javaScript 
    au!
    au FileType javascript nnoremap <leader>r <esc>:! nodejs %<CR>
    au FileType javascript vnoremap <leader>r <esc>:! nodejs %<CR>
    au FileType javascript inoremap <leader>r <esc>:! nodejs %<CR>
augroup END

" IGNORE FILES VIM DOESN'T USE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,=*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" Graphically move through lines, don't move over whole wrapped lines
nnoremap j gj
nnoremap k gk

nnoremap <leader>b <Esc>:vsp references.bib<CR>
nnoremap <leader><S-b> <Esc>:! ln -s ~/Meta/templates/tex/references.bib .<CR>
nnoremap <leader>s <Esc>q:i%s ///g<Esc>2hi
