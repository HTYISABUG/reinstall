" global
set ai
set background=dark
set backspace=2
set clipboard=unnamedplus
set cursorcolumn
set cursorline
set enc=utf8
set expandtab
set fileencodings=ucs-bom,utf-8,cp936
set foldenable
set foldmethod=syntax
set hls
set nocompatible
set number
set shiftwidth=4
set softtabstop=4
set splitbelow
set tabstop=4
highlight Folded ctermfg=0
syntax on
filetype indent on
map <F4> : set nu!<BAR>set nonu?<CR>

" fold
nnoremap <space> za
nnoremap <c-PageUp> zm
nnoremap <c-PageDown> zr
nnoremap <c-Up> zk
nnoremap <c-Down> zj

" plugin
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'tell-k/vim-autopep8'
Plugin 'HTYISABUG/vim-snippets'
Plugin 'rdnetto/YCM-Generator'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin on

" indentLine
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

" nerdcommenter
map <F3> <leader>ci

" ultiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-x>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:ultisnips_python_style = "google"
let g:ultisnips_python_quoting_style = 'single'

" autopep8
let g:autopep8_disable_show_diff = 1

" ycm
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_error_symbol = "✘"
let g:ycm_warning_symbol = "！"

" cscope
nnoremap <C-F>a :cs find a <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-F>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-F>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-F>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-F>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-F>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-F>s :cs find s <C-R>=expand("<cword>")<CR><CR>
if filereadable("cscope.out")
    cs add cscope.out
endif

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" run .py
au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env clear && python3 % <CR>

" highlight python self
augroup python
    au!
    au FileType python
                \ syn keyword myPythonKeyword self |
                \ hi link myPythonKeyword Keyword
augroup end
