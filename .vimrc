set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" syntax checking plugin
Plugin 'scrooloose/syntastic'

" sytax extras...including c
" Plugin 'myint/syntastic-extras'

" File tree
Plugin 'scrooloose/nerdtree'
" Autocompletion plugin
Plugin 'Valloric/YouCompleteMe'
" Commenter
Plugin 'scrooloose/nerdcommenter'
" Emmet plugin
Plugin 'mattn/emmet-vim'
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Exuberant ctags
Plugin 'jakedouglas/exuberant-ctags'

" Tag generation plugin
Plugin 'majutsushi/tagbar'

Plugin 'xolox/vim-misc'

" Note taking plugin
"Plugin 'xolox/vim-notes'

"Plugin 'mattn/webapi-vim'

" Make views persistant
" Plugin 'restore_view.vim'

" HTML5 syntax
Plugin 'othree/html5.vim'

" Surround.vim (working with HTML tags and whatnot)
Plugin 'tpope/vim-surround'

" JSX support
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Typescript support
Plugin 'leafgarland/typescript-vim'

" Ctr-p
Plugin 'kien/ctrlp.vim'

" Better tabs and menu
Plugin 'bling/vim-airline'

" Themes for vim-airline
Plugin 'vim-airline/vim-airline-themes'

" Play nice with tmux
Plugin 'christoomey/vim-tmux-navigator'

" Tmux config
Plugin 'keith/tmux.vim'

" Vue.js
"Plugin 'posva/vim-vue'

" Faster motions plugin
Plugin 'easymotion/vim-easymotion'

" Make vims undo tree less hard to use
Plugin 'mbbill/undotree'

" Git diffs in sidebar
Plugin 'airblade/vim-gitgutter'

" Better colors
Plugin 'altercation/vim-colors-solarized'

" Tabularize is my shite man
Plugin 'godlygeek/tabular'

" Rust plugin
"Plugin 'rust-lang/rust.vim'

" Automatic parenthesis closing
Plugin 'raimondi/delimitmate'

" CSS color coloring
" Plugin 'ap/vim-css-color'

" ultisnips - getya snippets here
" Plugin 'SirVer/ultisnips'

" Get ultisnips and YCM to play nice
Plugin 'ervandew/supertab'

" AAAAnd the actual snippets
Plugin 'honza/vim-snippets'

" Yank ring
Plugin 'vim-scripts/YankRing.vim'

" Proper syntax highliting for conf files
Plugin 'tmux-plugins/vim-tmux'

" Make system copy / paste easily
Plugin 'christoomey/vim-system-copy'

" All of your Plugins must be added before the following line
call vundle#end()            " required


set shell=/bin/zsh

" ---------------------------------------------------------------------------
" -------------------------- BASIC CONFIGURATION ----------------------------
" ---------------------------------------------------------------------------

" Point nvim to the correct python binary
let g:python_host_prog = '/usr/bin/python'
"let g:python3_host_prog = '/usr/local/bin/python3'

filetype plugin indent on      " Required
set hidden                     " Set the hidden option (for ctrl-space)
set relativenumber             " Just kinda all around better
syntax on                      " Enable syntax highlighting by default
set number                     " Use line numbers by default
set cursorline                 " Highlight current line
set ruler                      " Set the bottom ruler
set noerrorbells               " Get rid of annoying error bells
set smartcase                  " case-sensitive if search contains an uppercase character
set tabstop=2                  " Show existing tab with 4 spaces width
set shiftwidth=2               " When indenting with '>', use 4 spaces width
set expandtab                  " On pressing tab, insert 4 spaces
set backspace=indent,eol,start " Fix weird backspace behavior


" Map the <Leader> key to <space>...much easier to use than comma
" and just feels better.
" TODO: Map <localleader> too / figure out what the hell it is
let mapleader=" "

" ---------------------------------------------------------------------------
" ------------------------- PLUGIN CONFIGURATION ----------------------------
" ---------------------------------------------------------------------------

" Vim airline
let g:airline#extensions#tabline#enabled = 1

" Get YCM to not crash spectacularly
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" work with control-space
let g:airline_exclude_preview = 1

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" From http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips/"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_debug = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_eslint_exe = 'yarn run lint --'
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": ["javscript"] }

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Emmet configuration...use leader y to activate and 
" only use emmet in css or html files. Can be used in both normal
" mode and insert mode (& visual too!)
let g:user_emmet_leader_key='<Leader>y'
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall

" ---------------------------------------------------------------------------
" -------------------------- EDITOR APPEARANCE ------------------------------
" ---------------------------------------------------------------------------

" Use the solarized themes
" You can say 'set background=light' to change bg
" set background=light
set background=dark
let g:airline_theme='solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans = 1
colorscheme solarized

" ---------------------------------------------------------------------------
" ----------------------- PLUGIN-SPECIFIC MAPPINGS --------------------------
" ---------------------------------------------------------------------------

" Motions - DO NOT REPLACE WITH noremaps...WILL NOT WORK. Ye have been warned
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
" map  <Leader>s <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Incremental search bitches
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion. Without these mappings, `n` & `N` works fine. (These mappings 
" just provide different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Quickly open the snippets definition file for the 
" current buffer's filetype...aint nobody got time to type that command
noremap <Leader>u :UltiSnipsEdit<CR>

" Gundo mapping...use to traverse VIMs undo tree
" visually (because doing it any other way is confusing
" as shit
nnoremap <Leader>g :UndotreeToggle<CR>

" Yankring - keeps a history of your past yanks and deletes 
" and lets you visually go through them...helpful if you override
" a yank with 'dd'.
" NOTE: Used to be y, but since emmet maps to y it became an issue
nnoremap <Leader>r :YRShow<CR>

" Maps tree toggle to control-\
noremap <Leader>n :NERDTreeToggle<CR>

" Kaka mapping
noremap <Leader>mk :KakaToggle<CR>

" For tmux (<c-h> doesn't really work in vim)
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
map <silent> <C-l> :TmuxNavigateRight<cr>

" ---------------------------------------------------------------------------
" -------------------------------- FUNCTIONS --------------------------------
" ---------------------------------------------------------------------------

" Relative line numbers 
function! NumberToggle()
  if &relativenumber == 1 | set norelativenumber
  else | set relativenumber
  endif
endfunction

" Function to show how ranges work in vim functions
" ...you get passed a:firstline and a:lastline by default
function! CountWords() range
	let lnum = a:firstline
	let n = 0
	while lnum <= a:lastline
	  let n = n + len(split(getline(lnum)))
	  let lnum = lnum + 1
	endwhile
	echo "found " . n . " words"
endfunction

" Function to fix the last spelling error. Note that [s goes to the 
" previous misspelled word in a file
function! FixLastSpellingError()
  normal! mm[s1z=`m
endfunction

" Running specific command based on filename 
function! Run()
  " First make sure the file is up to date
  execute "w"
  " Based of the file fun the code accordingly...really this should be the 
  " plugin that you write man
  if &ft ==# "asm"
    execute "!spim read " . bufname("%")
  elseif &ft ==# "python"
    execute "!python3 " . bufname("%")
  elseif &ft ==# "mini"
    execute "!mini " . bufname("%")
  elseif &ft ==# "c"
    execute "!gcc " . bufname("%") . " && ./a.out" 
  elseif &ft ==# "ruby"
    execute "!ruby " . bufname("%")
  elseif &ft ==# "perl"
    execute "!perl " . bufname("%")
  elseif &ft ==# "rust"
    execute "!cargo run"
  elseif &ft ==# "javascript"
    execute "!node " . bufname("%")
  elseif &ft ==# "java"
    execute "!javac " . bufname("%") . " && java " . expand("%:r")
  elseif &ft ==# "r"
    execute "!Rscript " . bufname("%") 
  elseif &ft ==# "typescript"
    execute "!tsc " . bufname("%") . " && node " . expand("%:r") . ".js"
  endif
endfunction

" Stupid function to return whether or not the text width is too wide...note
" that the use of an implicit 0 return is used
function! TextWidthTooWide()
  if &l:textwidth > 80
    return 1
  endif
endfunction

" nnoremap <Leader>q :call ToggleQuickFix()<CR>
" Global variable to store whether or not the quickfix panel is open
let g:quickfix_is_open = 0

" Example of how to toggle a window open and closed...in this case
" using a quick fix window. Notice the use of global variables...not 
" really great but hey it gets the job done
function! ToggleQuickFix()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction

" Function that toggles the semicolon on the end of a line
function! ToggleSemicolon()
  " Get the last character on the current line
  let line = getline('.') 
  let char = line[len(line)-1]
  execute "normal! mqg_"
  if char == ';' | execute "normal! x`q"
  else           | execute "normal! a;\<esc>`q" | endif
endfunction

" ---------------------------------------------------------------------------
" ------------------------------ USER MAPPINGS ------------------------------
" ---------------------------------------------------------------------------

" SECTION: USING FUNCTIONS: Using the above functions in mappings ***********
" ***************************************************************************

" Toggle relative line numbers
nnoremap <Leader>rl :call NumberToggle()<CR>

nnoremap <leader>sp :call FixLastSpellingError()<cr>

" Add a semicolon to the end of the line;
nnoremap <Leader>; :call ToggleSemicolon()<CR>

" Mapping to call the run function
noremap <Leader>i :call Run()<CR>

" SECTION: NORMAL MODE - Convenience mappings for normal mode ***************
" ***************************************************************************

" Save a file faster
noremap <Leader>w :w<CR>

" Close a file faster
noremap <Leader>q :q<CR>
noremap <Leader>qw :wq<CR>
noremap <Leader>qa :qa<CR>
noremap <Leader>qaw :wqa<CR>

" cd into the pwd of the file that is being edited
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" SECTION: MOTIONS - Moving places faster than the default vim will allow ***
" ***************************************************************************

" Add a faster way to escape
inoremap kj <Esc>

" Go to marks faster
nnoremap <Leader>gt `

" Disable arrow keys in VIM 
noremap <Up>     <NOP>
noremap <Down>   <NOP>
noremap <Left>   <NOP>
noremap <Right>  <NOP>

inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" Search for word under cursor
nnoremap <Leader>sw /<C-R><C-W><CR>

" SECTION: WINDOWS - Opening / closing manipulating windows faster **********
" ***************************************************************************

" Let's make pane opening better...now all you have to do is press 
" <Leader>s<direction> and the name of the file that you actually want to open
noremap <Leader>sl :aboveleft vsplit<space>
noremap <Leader>sr :belowright vsplit<space>
noremap <Leader>st :aboveleft split<space>
noremap <Leader>sb :belowright split<space>

" SECTION: TABS - Opening / closing manipulating tabs faster ****************
" ***************************************************************************

" Move back and forth between tabs much faster
noremap <M-k> :tabn<CR>
noremap <M-j> :tabp<CR>

" Open a new tab without specifything a file name
noremap <Leader>to :tabnew<CR>

" Easier way to create a new tab...you will need to specify the file you want
" to open in command mode
noremap <Leader>tn :tabnew<SPACE>

" Tagbar toggle...note that this called if the t times out so you will have to
" wait a half a second for this mapping to activate
noremap <Leader>t :TagbarToggle<CR>

" SECTION: VIMRC - Convenience mappings for working with the vimrc file *****
" ***************************************************************************

" open vimrc easier
" Lets make it better
:nnoremap <Leader>v :tabnew $MYVIMRC<CR>

" Installing / removing new plugins...now you should be able to change
" the vimrc, then execute:
"
" <Leader>vv <Leader>p
"
" to source the file and then install the plugins respectively
" TODO: Also remove plugins that are no longer wanted
nnoremap <leader>vv :source $MYVIMRC<CR>
nnoremap <Leader>pi :PluginInstall<CR>
nnoremap <Leader>pc :PluginClean<CR>

" Source the current file
nnoremap <Leader>sc :source %<CR>

" Get rid of search highlight on redraw
function! RedrawWithoutHighlights()
  nohl | redraw
endfunction

noremap <silent> <M-l> :call RedrawWithoutHighlights()<CR>

" ---------------------------------------------------------------------------
" ------------------------------ ABBREVIATIONS ------------------------------
" ---------------------------------------------------------------------------

" Because honestly who can spell the?
iabbrev teh the
" I misspell this word waay to much in javscript
iabbrev fucntion function
iabbrev fnction function
iabbrev cnsole console
iabbrev cosnole console

" Make help open in a new tab...basically just expands h to tab help
" TODO: Way to make this one abbreviation?
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'
cnoreabbrev <expr> help getcmdtype() == ":" && getcmdline() == 'help' ? 'tab help' : 'help'

" ---------------------------------------------------------------------------
" ------------------------------ AUTOCOMMANDS -------------------------------
" ---------------------------------------------------------------------------

" Open file tree on startup if no file specified ------------------------ {{{
augroup nerd_tree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  " If only Nerdtree is left then close
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
" }}}

" Set code folding for vimscript document ------------------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
