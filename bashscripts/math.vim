""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " VIM + TEX MATH MODE 
"   shortcuts to improve the experience of writing mathematics on a computer 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set syntax=tex
let g:MATH=0
" MATH TOGGLE
function! ToggleMATH()
  if !g:MATH
    call MATHon()
  else 
    call MATHOff()
  endif
endfunction


" MATH ON
function! MATHon()
  echo "MATH macros ACTIVATED."
  silent ! notify-send "MATH macros ACTIVATED." -t 25
  let g:MATH=1
  " --- ABREVIATIONS ---
  ab in \in
  ab forall \forall \
  ab te \exists \
  ab subset \subset
  ab int \int
  ab frac \frac{<++>}{<++>}
  ab text \text{}<Esc>i
  ab dd \frac{d}{d<++>}\left( <++> \right)<esc>/frac<CR>Nhi
  ab times \times
  ab -> \rightarrow
  ab => \Rightarrow
  ab <- \leftarrow
  ab <= \Leftarrow
  ab real \mathbb{R}
  ab neq \neq
  ab cap \cap
  ab cup \cup
  ab null \varnothing
  "FIXME: imap <C-i> <Esc>siW}i\textit<Esc>Ea
  "FIXME: imap <C-b> <Esc>siW}i\textbf<Esc>Ea
"  ab begin \begin{<++>}<CR><CR>\end{<++>}<Esc>kk0/<++><CR>
"  ab ( \left( <++> \right)<Esc>?<++><CR>ciW<Backspace>
"  ab -- ^{<++>}_{<++>} <++><esc>/\^<CR>Ni
"  ab sum \sum^{<++>}_{<++>} <++>
" --- MAPPINGS ---
  " F1 Maps
  inoremap <F13> $$<CR>q<CR>$$<Esc>?q<CR>cl
  inoremap <F25> \begin{equation}<CR>\end{equation}<Esc>O<Tab>
  " F2 Maps
  inoremap <F14> \begin{bmatrix}<CR>\end{bmatrix}<Esc>O<Tab>
  inoremap <F26> \begin{vmatrix}<CR>\end{vmatrix}<Esc>O<Tab>
  " F3 Maps
  inoremap <F15> \begin{table}[!hbtp]<CR><Tab>\centering<CR>\begin{tabular}{cc}<Space>\hline<CR>\hline<CR>\end{tabular}<CR><BS>\end{table}<Esc>2kO<Tab>
  " F8 Remaps
  inoremap <F8> <esc>a<Space>&<Space>
  inoremap <F20> <esc>a&<Space>
  " F9 Remaps
  inoremap <F9> <esc>a<Space>\\<CR>
  inoremap <F21> <esc>a<Space>\\
  " F10 Maps
  inoremap <F34> \subsubsection{}<Esc>i
  " F11 Maps
  inoremap <F35> \subsection{}<Esc>i
  " F12 Maps
  inoremap <F36> \section{}<Esc>i
endfunction
" SHIFT + FN KEYS
" <F13> == <S-F1>
" <F14> == <S-F1>
" <F15> == <S-F3>
" <F16> == <S-F4>
" <F17> == <S-F5>
" <F18> == <S-F6>
" <F19> == <S-F7>
" <F20> == <S-F8>
" <F21> == <S-F9>
" <F22> == <S-F10>
" <F23> == <S-F11>
" <F24> == <S-F12>
" CONTROL + FN KEYS
" <F25> == <C-F1>
" <F26> == <C-F2>
" <F27> == <C-F3>
" <F28> == <C-F4>
" <F29> == <C-F5>
" <F30> == <C-F6>
" <F31> == <C-F7>
" <F32> == <C-F8>
" <F33> == <C-F9>
" <F34> == <C-F10>
" <F35> == <C-F11>
" <F36> == <C-F12>

" Not currently used, taking out for ease of typing.
" ab qq \qquad
" ab q \quad
" ab left \left
" ab right \right


" MATH OFF
function! MATHOff()
  echo "MATH macros DEACTIVATED."
  silent ! notify-send "MATH macros DEACTIVATED." -t 25

  let g:MATH=0
  " Clear abreviations
  abclear
  " Clear noremaps
  inoremap <F13> <Nop>
  inoremap <F14> <Nop>
  inoremap <F15> <Nop>
  inoremap <F16> <Nop>
  inoremap <F17> <Nop>
  inoremap <F18> <Nop>
  inoremap <F19> <Nop>
  inoremap <F20> <Nop>
  inoremap <F21> <Nop>
  inoremap <F22> <Nop>
  inoremap <F23> <Nop>
  inoremap <F24> <Nop>
  inoremap <F25> <Nop>
  inoremap <F26> <Nop>
  inoremap <F27> <Nop>
  inoremap <F28> <Nop>
  inoremap <F29> <Nop>
  inoremap <F30> <Nop>
  inoremap <F31> <Nop>
  inoremap <F32> <Nop>
  inoremap <F33> <Nop>
  inoremap <F33> <Nop>
  inoremap <F34> <Nop>
  inoremap <F35> <Nop>
  inoremap <F36> <Nop>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute on opening
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
normal zfip/<++><CR>
echo "Math settings (re)loaded."
