set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""
" GUI ����
""""""""""""""""""""""""""""""""""""""""""""""""
" ��Ʈ ����. ��Ʈ�� ��Ʈ ũ�⸦ �����Ѵ�.
if has( "gui_running" )
set gfn=D2Coding:h12
" set gfn=ProFontWindows:h12
" set gfn=gulimche:h12
" set gfn=sans-serif12
" set gfn=Lucida_Console:h12
" set gfn=����ü12
" set gfn=Terminal12

" �ʱ� VI ���۽� ũ�� ���� w * h
au GUIEnter * winsize 90 50

" �ʱ� VI ���� ��ġ ����
au GUIEnter * winpos 550 0
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" VI �⺻ ����
""""""""""""""""""""""""""""""""""""""""""""""""
" �ڵ� �鿩���⸦ �����մϴ�.
set ai

" ��� �Ҹ��� ȭ�� ���������� ��ü
set visualbell

" �鿩���� ���� ���մϴ�.
set shiftwidth=4

" ���� ���� ���մϴ�.
set tabstop=4

" ���� �����̽��� ��ü�մϴ�.
"set et
autocmd FileType python set expandtab

" C�� ������ �°� �鿩���� �մϴ�
set cindent

" ���μ��� ǥ���� �ݴϴ�
set nu

" �� ���Ͽ� �ش��ϴ� ����(Syntax)�� ��������ݴϴ�.
" C�� Java�� ���� �����..
syntax on


" ���� ������ undo �Ҽ� �ִ� �ִ� Ƚ�� ����
set history=100

" �Լ� �ݱ�ǥ��
set sm

" Ÿ���ν� ���콺 Ŀ�� ���߱�
set mousehide

" �ּ��� 2�� ���Ϸδ� �ڵ� ��ũ��
set scrolloff=2

" ���ǵǾ��� ������ �����ؼ� �����ݴϴ�
 colors desert


" ESCŰ�� ������ �ѱ� ��尡 ����
" �Է¸�忡�� ���� ��� ���� ��� ���� 
inoremap <ESC> <ESC>:set imdisable<CR>
nnoremap i :set noimd<CR>i
nnoremap I :set noimd<CR>I
nnoremap a :set noimd<CR>a
nnoremap A :set noimd<CR>A
nnoremap o :set noimd<CR>o
nnoremap O :set noimd<CR>O


set fdm=marker
set fdc=5


