set nocompatible    " be iMproved
" so $HOME/.vim/plugin/vundle.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keep all autocommands in a group in case vim is re-sourced so you don't get
" duplicate autocommands created
augroup myvimrc
    " the next line clears the augroup (prevents multiple auto commands when
    "   vimrc is re-sourced
    au!
    au FocusGained,WinEnter * :silent! " silences au's run
    au FocusLost,WinLeave * :silent! :wa " silences au's run
    au FileType nerdtree nnoremap <buffer> :e <nop>

    " only use the next line if you working on vimrc, otherwise it can slow down file writes
    " au BufWritePost * source ~/.vimrc " autoload changes to vimrc after :w

    au CursorHold * checktime " Gets autoread to work properly (for me at least)
    au InsertLeave * match ExtraWhitespace /\s\+$/ "highlights trailing ws
    au InsertLeave * :silent! :%s/\s\+$//e " deletes trailing whitespace after leaving insert mode

    " Return to last edit position when opening files (You want this!)
    au BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif

    au BufWritePost *.py call Autopep8()
    au BufWritePost *.py call Flake8()

augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'matze/vim-move'
" Plugin 'terryma/vim-smooth-scroll'

" ColorSchemes
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/base16-vim'

" Tabular
Plugin 'godlygeek/tabular'

" Comments
Plugin 'tomtom/tcomment_vim'

"File Tree Plugins
" To open new tab only if it doesn't exists, otherwise switch to the already open:
" https://github.com/scrooloose/nerdtree/issues/439
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Autocompletion Plugins
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jalcine/cmake.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'

"Javascript Plugins
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'maksimr/vim-jsbeautify'
" Plugin 'scrooloose/syntastic'

"git Plugins
Plugin 'tpope/vim-fugitive'

"HTML Plugin
Plugin 'mattn/emmet-vim'

"CSS/SASS/LESS Plugins
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'gcorne/vim-sass-lint'

"Python syntax
Plugin 'hdima/python-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8' "disabled until it gets support for 3.6.4
" Plugin 'python-mode/python-mode'

"Less syntax
Plugin 'genoma/vim-less'

"Smart braces
"Plugin 'jiangmiao/auto-pairs'

"Smart indents
Plugin 'lukaszb/vim-web-indent'

"Fuzzy search
" note: must brew install fzf and add to rtp for this to work
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Put your non-Plugin stuff after this line
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ng-"]
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute \"ion-"]
let g:syntastic_html_tidy_ignore_errors=["is not recognized!","discarding unexpected"]
let g:nerdtree_tabs_open_on_console_startup=1
let g:tern_map_keys=1
let g:tern_show_arguments_hints='on_hold'
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let NERDTreeMapToggleFilters='\f'
let NERDTreeMapToggleFiles='\F'
let NERDTreeSortOrder=['\/$','\.a.*','\.b.*','\.c.*','\.d.*','\.e.*','\.f.*','\.g.*','\.h.*','\.i.*','\.j.*','\.k.*','\.l.*','\.m.*','\.n.*','\.o.*','\.p.*','\.q.*','\.r.*','\.s.*','\.t.*','\.u.*','\.v.*','\.w.*','\.x.*','\.y.*','\.z.*']
let NERDTreeShowHidden=1
set completeopt-=preview
let g:javascript_enable_domhtmlcss=1
let b:javaScript_fold=1
let s:semanticGUIColors=['#00d75f','#00d75f','#00d75f','#00d75f','#00d75f']
let g:semanticTermColors=[41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41]
let python_highlight_all=1
let g:syntastic_sass_checkers=["sass_lint"]
let g:syntastic_scss_checkers=["sass_lint"]
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:move_key_modifier = 'C' " vim-move: maps the key
let g:autopep8_disable_show_diff=1
let g:autopep8_diff_type='vertical'
let g:flake8_show_in_gutter=1
let g:flake8_show_quickfix=1
" let g:pymode_python='python3'
 " au FileType javascript call JavaScriptFold()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " My sets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500                      " Sets how many lines of history VIM has to remember
set undolevels=500                   " Number of undo levels
set title                            " change the terminal's title
set visualbell                       " don't beep
set noerrorbells                     " don't beep
set number                           " Show line numbers
set ruler                            " Show position
set noswapfile                       " Dont use swapfiles
set nobackup                         " Dont use backups
set wb                               " Dont use backups
set hidden                           " hides buffers
set hlsearch                         " Highlight search results
set incsearch                        " show search matches as you type
set showmatch                        " Highlight matching brackets
set expandtab                        " Use spaces instead of tabs
set tabstop=4                        " tab stops at every 4 spaces
set shiftwidth=2                     " tab = 4 spaces
set backspace=indent,eol,start       " backspace past auto-indent
set nowrap                           " NO line wrapping
set ai                               " Auto indent
set si                               " Smart indent
set list !                           " highligt trailing ws as you type (don't show eol char)
set listchars=tab:>-                 " show tabs as '>---'
set pastetoggle=<F2>                 " prevent tabbing issues when pasting
set nofoldenable                     " dont fold by default
set viminfo^=%                       " Remember info about open buffers on close
set noeb vb t_vb=                    " Fix freezing issue form scrolling out of bounds
set autoread                         " Autoload changes when file changed from outside
set clipboard=unnamed                " allow yank to clipboard ( <CMD-C> )
set mouse=a                          " allow mouse scrolling (needed for iTerm)
set omnifunc=syntaxcomplete#Complete
set colorcolumn=100                  " highlight gutter at 100 chars
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " My maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=' '
" vim-smooth-scroll
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 1)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 1)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

" copy relative path (src/foo.txt)
nnoremap <leader>cp :let @*=expand("%")<CR>

" use t/T to navigate tabs
nnoremap t :tabn<CR>
nnoremap T :tabp<CR>

"move tabs around
nnoremap <leader>t :tabm+1<CR>
nnoremap <leader>T :tabm-1<CR>

"maps for fuzzy file search
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" Opens a new tab with the current buffer's path
nnoremap :tn :tabnew<CR>

" " use +/- to resize splits
nnoremap + :vertical resize +10<CR>
nnoremap - :vertical resize -10<CR>

" Smart way to move beween splits
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap , :NERDTreeToggle<CR>

" Swap splits
nmap <Leader>s <C-W>x

" keep cursor in middle of screen when using <C-u/d>
nnoremap <C-d> <C-d>M
nnoremap <C-u> <C-u>M

" Treat long lines as break lines
" map j gj
" map k gk

" Swith Current Working Directory to directory of open buffer
nnoremap :cd :cd<CR>%:p:h<CR>:pwd<CR>

" Super usefulbnewbedit/Users/matthewbrown/ when editing files in the same directory

" remove trailing whitespace
nnoremap :rtw :%s/\s\+$//e<CR>

" use visual-block instead of visual as default, vv will enter visual mode
nnoremap v <C-v>

" align vertically on equals or colon e.g.: :a=
if exists(":Tabularize")
  vmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
endif

" shortcut for search and replace, hit <Leader>s to start a search and replace
" for the word under the cursor!
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let base16colorspace=256
set t_Co=256
syntax on
syntax enable
colorscheme Brogrammer2
" colorscheme Brogrammer
" colorscheme base16-3024
highlight ExtraWhitespace ctermbg=red guibg=red

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow filetype plugins, changes to default indent
" filetype plugin indent on
" Console log from insert mode; Puts focus inside parentheses
imap cll console.log('', );<Esc>BBf'a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap cll yocll<Esc>pf)P
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap cll yiwocll<Esc>pf)P

imap pll print(f': {}')<Esc>^f'a
" Console log from visual mode on next line, puts visual selection inside parentheses
vmap pll yopll<Esc>pf{p
" Console log from normal mode, inserted on next line with word your on inside parentheses
nmap pll yiwopll<Esc>pf{p

augroup file_specific_sets_and_maps
 " the next line clears the augroup (prevents multiple auto commands when
 "   vimrc is re-sourced
 au!
 au filetype javascript set shiftwidth=2
 au filetype javascript noremap <buffer>= :call JsBeautify()<cr>
 au filetype javascript vnoremap <buffer>= :call RangeJsBeautify()<cr>
 au filetype jsx vnoremap <buffer>= :call RangeJsxBeautify()<cr>
 au filetype json vnoremap <buffer>= :call RangeJsonBeautify()<cr>
 au filetype html set shiftwidth=2
 au filetype html vnoremap <buffer>= :call RangeHtmlBeautify()<cr>
 au filetype html noremap <buffer>= :call HtmlBeautify()<cr>
 au filetype css noremap <buffer>= :call CSSBeautify()<cr>
 au filetype css vnoremap <buffer>= :call RangeCSSBeautify()<cr>
 au filetype scss noremap <buffer>= :call CSSBeautify()<cr>
 au filetype python set expandtab
 au filetype python noremap <buffer>= :call Flake8()<cr>:call Autopep8()<cr>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that's loaded and not visible
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      exe 'bd ' . b
    endif
  endfor
endfun

