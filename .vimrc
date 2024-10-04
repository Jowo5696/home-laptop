" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "if (has("termguicolors"))
  "  set termguicolors
  "endif
endif

set number

"set cursorline
"set cursorcolumn

set expandtab

"set nowrap

set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

set showcmd
set showmode

set wildmenu

set foldtext=Main()
function Main()
	let line = getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart
	return '> '. folded_line_num. ' ll. -- '. line
endfunction

set fillchars=fold:\ 
set foldmethod=marker

set encoding=utf-8

set updatetime=500

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1

Plug 'pbrisbin/vim-colors-off'

Plug 'vyshane/cleanroom-vim-color' 

Plug 'lervag/vimtex'
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_ignore_filters=[
      \ 'Underfull \\hbox',
      \ 'fancyhdr Warning',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = 'jk'
let g:UltiSnipsJumpForwardTrigger = 'jk'
let g:UltiSnipsJumpBackwardTrigger = 'kj'
let g:UltiSnipsSnippetDirectories=['/home/jonas/.vim/UltiSnips']

call plug#end()

filetype on
filetype plugin on
filetype indent on
syntax on

set t_Co=256
set bg=light
hi Folded ctermbg=Blue
let &t_ut=''
autocmd vimenter * ++nested colorscheme off

"if empty(v:servername) && exists('*remote_startserver')
"  call remote_startserver('VIM')
"endif

set visualbell
set t_vb=

let mapleader = " "
inoremap <KEY_INSERT> <Nop>
inoremap jf <ESC>
map <Leader>s :w<CR>
map <Leader>sa :wq<CR>
map <Leader>sd :q!<CR>
