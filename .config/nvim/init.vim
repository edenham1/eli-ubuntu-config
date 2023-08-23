" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Fix Color scheme
set t_Co=256

" Set Dein base path (required)
let s:dein_base = '/home/edenham/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '/home/edenham/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('vim-syntastic/syntastic')
call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline-themes')
"call dein#add('sainnhe/gruvbox-material')
" call dein#add('ellisonleao/gruvbox.nvim')
call dein#add('vim-airline/vim-airline')
call dein#add('ycm-core/YouCompleteMe')


" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" Disable mouse input
set mouse=

"Set python path
let g:python3_host_prog = '/usr/bin/python3'

" Turn on Syntax highlighting
syntax on

" Show line numbers
set number

" set relative line numbers
set relativenumber

" Toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" Highlight search results
set hlsearch

" set searching as you type
set incsearch

" unbind annoying Ex mode 
nmap Q <Nop> 

" Set new splits to right and bottom
set splitbelow
set splitright

" Allows to use gg=G to indent
filetype plugin indent on

"change tab width
"Use space for tab
set shiftwidth=4 expandtab
"Change tab chacater to have different space for clarity
set tabstop=8 softtabstop=0

" turn on spell checking
" :setlocal spell spelllang=en_us
"
" Syntastic Defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_quiet_messages = { "regex": ['\m\[E501\]', '\m\[E402\]', '\m\[E203\]'] }

" auto folding testing
" set foldmethod=indent
" set foldlevel=0
" YCM Debug
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" Running black on save
augroup black_on_save
	autocmd!
	autocmd BufWritePre *.py Black
augroup end
" Color scheme
let g:airline_theme='gruvbox'
" set background=light
" let g:gruvbox_contrast_dark = 'medium'
" let g:gruvbox_termcolors=16
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
 if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
   if (has("nvim"))
     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
   endif
   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
   if (has("termguicolors"))
     set termguicolors
   endif
 endif
" let g:gruvboxo_
colorscheme gruvbox
