" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Fix Color Scheme
set t_Co=256

" Install Dein
let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

" Set Dein base path (required)
let s:dein_base = '$HOME/.local/share/dein'

" Set Dein source path (required)
let s:dein_src = '$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
call dein#add('morhetz/gruvbox')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-airline/vim-airline')
call dein#add('tpope/vim-obsession')
call dein#add('dhruvasagar/vim-prosession')
call dein#add('neovim/nvim-lspconfig')
call dein#add('hrsh7th/nvim-cmp')
call dein#add('hrsh7th/cmp-nvim-lsp')
" Markdown LSP
call dein#add('artempyanykh/marksman')
call dein#add('L3MON4D3/LuaSnip')
call dein#add('nvim-tree/nvim-web-devicons')
call dein#add('onsails/lspkind-nvim')
call dein#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
" call dein#add('nvim-treesitter/tree-sitter-markdown')
call dein#add('nvimdev/lspsaga.nvim')
call dein#add('f-person/git-blame.nvim')
call dein#add('github/copilot.vim')

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

" Disable mouse
set mouse=

" Set python path
" let g:python3_host_prog=/TBD

" show line numbers
set number

" show relative line numbers
set relativenumber

" Toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" Highlight search results
set hlsearch

" Set searching as you type
set incsearch

" unbind annoying ex mode
nmap Q <Nop>

" Set new splits to right and bottom
set splitbelow
set splitright

" Allows to use gg=G to indent a file
filetype plugin indent on

" Change tab width
" Use spaces for tabs
set shiftwidth=4 expandtab
" Change tab character to have different space for clarity
set tabstop=8 softtabstop=8

" Remove `i` from autocomplete to speed up autocomplete
" `i` scans all included files
" set complete-=i

" Turn on spell checking
:setlocal spell spelllang=en_us

let g:prosession_dir = expand('~/.tmp_vim/session')
" Obsession
let g:airline#extensions#obsession#enabled = 1
" Color Scheme
let g:airline_theme='gruvbox'
" set background=light
" let g:gruvbox_contrast_dark = 'medium'
" let g:gruvbox_termcolors=16

if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
    if (has("nvim"))
        " For nvim 0.1.3 and 0.1.4 <
        " https://github.com/neovim/neovim/pull/2198
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif


colorscheme gruvbox

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" LSP actions
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>

lua require("lsp_init")
