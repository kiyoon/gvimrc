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
" GUI 설정
""""""""""""""""""""""""""""""""""""""""""""""""
" 폰트 설정. 폰트와 폰트 크기를 지정한다.
if has( "gui_running" )
set gfn=D2Coding:h12
" set gfn=ProFontWindows:h12
" set gfn=gulimche:h12
" set gfn=sans-serif12
" set gfn=Lucida_Console:h12
" set gfn=돋음체12
" set gfn=Terminal12

" 초기 VI 시작시 크기 설정 w * h
au GUIEnter * winsize 90 50

" 초기 VI 시작 위치 설정
au GUIEnter * winpos 550 0
endif


""""""""""""""""""""""""""""""""""""""""""""""""
" VI 기본 설정
""""""""""""""""""""""""""""""""""""""""""""""""
" 자동 들여쓰기를 설정합니다.
set ai

" 경고 소리를 화면 깜빡임으로 대체
set visualbell

" 들여쓰기 폭을 정합니다.
set shiftwidth=4

" 탭의 폭을 정합니다.
set tabstop=4

" 탭을 스페이스로 태체합니다.
"set et
autocmd FileType python set expandtab

" C의 구문에 맞게 들여쓰기 합니다
set cindent

" 라인수를 표시해 줍니다
set nu

" 각 파일에 해당하는 문법(Syntax)를 적용시켜줍니다.
" C나 Java등 사용시 색상등..
syntax on


" 파일 편집시 undo 할수 있는 최대 횟수 설정
set history=100

" 함수 닫기표시
set sm

" 타이핑시 마우스 커서 감추기
set mousehide

" 최소한 2줄 이하로는 자동 스크롤
set scrolloff=2

" 정의되어진 색상을 선택해서 보여줍니다
 colors desert


" ESC키를 누르면 한글 모드가 해제
" 입력모드에서 이전 언어 설정 모드 유지 
inoremap <ESC> <ESC>:set imdisable<CR>
nnoremap i :set noimd<CR>i
nnoremap I :set noimd<CR>I
nnoremap a :set noimd<CR>a
nnoremap A :set noimd<CR>A
nnoremap o :set noimd<CR>o
nnoremap O :set noimd<CR>O


set fdm=marker
set fdc=5


