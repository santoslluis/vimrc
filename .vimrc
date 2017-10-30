"This is the Lluis Santos's .vimrc file!

syntax on
set ts=2
set sw=2
set si
set nu
set expandtab
set mouse=a

function! Sample(filetype)
  let fullName=$HOME.'/.vim/samples/'.a:filetype.'.txt'
  if filereadable(fullName)
    execute 'r '.fullName
  else
    echo fullName.' does NOT exists'
    return 0
  endif
endfunction

command -nargs=1 Sample :call Sample(<f-args>)


if has("autocmd")
  filetype on
  "<F9> key is used for compile and execute, <F2><F3><F4>... keys are for other things.

  "############--------COMMON---------##############
  autocmd FileType php,c,c++,C,cpp,java,js,html,phtml map <F12> <ESC>caw<<ESC>pa><ESC> 
  "#################################################

  autocmd FileType html set syntax=html
  "################################################

  "############-----JAVA_ANDROID------##############
  autocmd FileType java map <F9> <ESC>:w<CR> :!ant clean && ant debug install<CR>
  "#################################################

  "############----------TEX----------##############
  autocmd FileType tex map <F9> <ESC>:w<CR> :!pdflatex % && evince %<.pdf &<CR>
  autocmd FileType tex map <F12> <ESC>:w<CR> :!pdf2ps %<.pdf && nc 10.0.0.6 9100 < %<.pdf <CR>
  autocmd FileType tex map <F8> <ESC>:e tex/
  autocmd FileType tex map <F2> <ESC>A %TODO<ESC>0:s%\(.*\)%\(.*\)/%\2/<CR>
  autocmd FileType tex map <F3> <ESC>A %DOING<ESC>0:s%\(.*\)%\(.*\)/%\2/<CR>
  autocmd FileType tex map <F4> <ESC>A %DONE<ESC>0:s%\(.*\)%\(.*\)/%\2/<CR>
  "#################################################

  "############--------PYTHON---------##############
  autocmd FileType py map <F9> <ESC>:w<CR> :!python2.6 % &<CR> 
  autocmd FileType py map <F2> <ESC>caw<ESC>pbiclass <ESC>A:<CR><TAB>def __init__(self):<ESC>h
  "#################################################

  "############-----------C-----------##############
  autocmd FileType c map <F9> <ESC>:w<CR> :cc -o %< %;!./%<<CR>
  autocmd FileType c map <F2> <ESC>ggO#include<stdio.h><CR><CR>int main(void){<CR>}<ESC>ko
  "#################################################

  "############----------C++----------##############
  autocmd FileType cc,cpp,c++,C map <F9> <ESC>:w<CR> :c++ -o %< %;!./%<<CR>
  "#################################################
endif

