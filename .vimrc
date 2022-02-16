""""" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

augroup vimrc
  autocmd!
augroup END

let s:darwin = has('mac')
let s:windows = has('win32') || has('win64')


let mapleader      = ' '
let maplocalleader = ' '

syntax on


so ~/.vim/plugins.vim
so ~/.vim/plugin-config.vim
so ~/.vim/autoclose.vim

"-- COLOR & THEME CONFIG
set termguicolors
let g:dracula_italic = 1
colorscheme dracula
set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors = [
    \ '#282828', '#cc241d', '#98971a', '#d79921', '#458588', '#b16286', '#689d6a', '#a89984',
    \ '#928374', '#fb4934', '#b8bb26', '#fabd2f', '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
\]





augroup vimrc
  au!
  autocmd InsertLeave,TextChanged * silent! write
  autocmd InsertEnter,WinLeave * set nocursorline 
  autocmd InsertLeave,WinEnter * set cursorline 
augroup END

"" ============================================================================
"" BASIC SETTINGS {{{
"" ============================================================================
"-- Configure a word searchin"
" -- Only show file name in tab
" set guitablabel=%t
"-- set folding method"
set fdm=syntax

"--autoread and autowrite"
set autoread
set autowrite
set autowriteall
	"see this article: https://vimtricks.com/p/what-is-set-hidden/ 
set hidden

set wrap
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<
set number
set relativenumber
set scrolloff=999
set signcolumn=no
set showcmd
set noshowmode
set conceallevel=1
set formatoptions-=cro

set noerrorbells visualbell t_vb=
set clipboard=unnamed

set ignorecase
set smartcase
set incsearch
set nohlsearch
""-- before "
set autoindent
set smartindent
"set lazyredraw
"set laststatus=2
"set visualbell
"set backspace=indent,eol,start
"set timeoutlen=500
"set whichwrap=b,s
"set shortmess=aIT
set wildmenu
set wildmode=list:longest,full
set tabstop=2
set shiftwidth=2
set expandtab smarttab
set encoding=utf-8
"set list
"set virtualedit=block
"set nojoinspaces
"set diffopt=filler,vertical
"see help page about unnamed option
set clipboard=unnamed
"set foldlevelstart=99
"set grepformat=%f:%l:%c:%m,%f:%l:%m
"set completeopt=menuone,preview
"set nocursorline
"set nrformats=hex
"silent! set cryptmethod=blowfish2

"set modelines=2
"set synmaxcol=1000

"" ctags
"set tags=./tags;/

"" Annoying temporary files
"set backupdir=/tmp//,.
"set directory=/tmp//,.

"" Semi-persistent undo
"if has('persistent_undo')
"  set undodir=/tmp,.
"  set undofile
"endif

"" Shift-tab on GNU screen
"" http://superuser.com/questions/195794/gnu-screen-shift-tab-issue
"set t_kB=[Z

"" set complete=.,w,b,u,t
"set complete-=i

"" mouse
"silent! set ttymouse=xterm2
"set mouse=a

"" 80 chars/line
"set textwidth=0
"if exists('&colorcolumn')
"  set colorcolumn=80
"endif

"" Keep the cursor on the same column
"set nostartofline

"" FOOBAR=~/<CTRL-><CTRL-F>
"set isfname-==

"if exists('&fixeol')
"  set nofixeol
"endif

"" ============================================================================
"" MAPPINGS
"" ============================================================================

"" ----------------------------------------------------------------------------
"" Basic mappings
"" ----------------------------------------------------------------------------

nnoremap <expr> change_directory_of_current_buffer ChangeToLocalDir()
function! ChangeToLocalDir()
  lchdir %:p:h
  return ''
endfunction

nnoremap match_a_line_break /\n
nnoremap match_a_line_break_or_a_space /\_s

nnoremap Open_help_right_vertically :vert help<CR> <C-W>x

nnoremap <expr> show_corner ShowCorner()
function! ShowCorner()
    set laststatus=2
    set showtabline=2
    set relativenumber
    set number
    set ruler
endfunction

nnoremap <expr> Hide_corner HideCorner()
function! HideCorner()
    set laststatus=0
    set showtabline=0
    set norelativenumber
    set nonumber
    set noruler
endfunction

" butterfly search
cnoremap <expr> ; ButterflySemicolon()
function! ButterflySemicolon()
    let cmdtype = getcmdtype()
    if cmdtype == ':'
        " Perform Ex command map action
    elseif cmdtype == '/'
        return "\<C-G>"
    elseif cmdtype == '?'
        return "\<C-T>"
    elseif cmdtype == '@'
        " Perform input() prompt map action
    else
        " Perform other command-line prompt action
    endif
endfunction
cnoremap <expr> + ButterflyPlus()
function! ButterflyPlus()
    let cmdtype = getcmdtype()
    if cmdtype == ':'
        " Perform Ex command map action
    elseif cmdtype == '/'
        return "\<C-T>"
    elseif cmdtype == '?'
        return "\<C-G>"
    elseif cmdtype == '@'
        " Perform input() prompt map action
    else
        " Perform other command-line prompt action
    endif
endfunction
" to soft-wrap at the edge of the screen, but not break in the middle of a word
nnoremap Warp_edge_screen_not_break_word :set wrap linebreak nolist<CR>
"" hjkl "
nnoremap j <C-d>
nnoremap k <C-u>
" go tab next"
nnoremap <silent> h :tabp<CR>
nnoremap <silent> l :tabn<CR>
nnoremap H :bN<CR>
nnoremap L :bn<CR>

nnoremap ; :

nnoremap <CR> :noh<CR>
" nnoremap <CR> :noh<CR><CR>:<backspace> <- Delete later unless problems

" f, F means find
nnoremap f /
nnoremap F ?
" make n/N always go in the same direction
nnoremap <expr> n 'Nn'[v:searchforward] . "zv"
nnoremap <expr> N 'nN'[v:searchforward] . "zv"

nnoremap <NL> i<CR><ESC>
" then just press Ctrl-J whenever you want to split a line.

"
" automatically leave insert mode after 'updatetime' milliseconds of inaction
" au CursorHoldI * stopinsert
" set 'updatetime' to 15 seconds when in insert mode
" au InsertEnter * let updaterestore=&updatetime | set updatetime=2500
" au InsertLeave * let &updatetime=updaterestore

"" switch next buffer"
"map <leader>n :bn<cr>
"" switch next tab"
"map <leader>t gt
"" open terminal in the directory of the current file"
map <leader>c :let $VIM_DIR=expand('%:p:h')<CR>:vert terminal<CR>cd $VIM_DIR<CR>
"" buffer delete"
"" map <leader>; :bd<cr> 

"" Save
"inoremap <C-s>     <C-O>:update<cr>
"nnoremap <C-s>     :update<cr>
"nnoremap <leader>s :update<cr>
"nnoremap <leader>w :update<cr>

"" Disable CTRL-A on tmux or on screen
"if $TERM =~ 'screen'
"  nnoremap <C-a> <nop>
"  nnoremap <Leader><C-a> <C-a>
"endif

"" Quit
"inoremap <C-Q>     <esc>:q<cr>
"nnoremap <C-Q>     :q<cr>
"vnoremap <C-Q>     <esc>
"nnoremap <Leader>q :q<cr>
"nnoremap <Leader>Q :qa!<cr>

"" Tags
"nnoremap <C-]> g<C-]>
"nnoremap g[ :pop<cr>

"" Jump list (to newer position)
"nnoremap <C-p> <C-i>

"" <leader>n | NERD Tree
"nnoremap <leader>n :NERDTreeToggle<cr>

"cnoremap <ESC> <C-c>

"" Movement ind insert mode
"" inoremap <C-h> <C-o>h
"" inoremap <C-l> <C-o>a
"" inoremap <C-j> <C-o>j
"" inoremap <C-k> <C-o>k
"" inoremap <C-^> <C-o><C-^>

"" Yank until the end of line
"nnoremap Y y$

"" qq to record, Q to replay
"nnoremap Q @q

"" Zoom
"function! s:zoom()
"  if winnr('$') > 1
"    tab split
"  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
"                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
"    tabclose
"  endif
"endfunction
"nnoremap <silent> <leader>z :call <sid>zoom()<cr>

"" Last inserted text
"nnoremap g. :normal! `[v`]<cr><left>

"" ----------------------------------------------------------------------------
"" <tab> / <s-tab> | Circular windows navigation
"" ----------------------------------------------------------------------------
"nnoremap <tab>   <c-w>w
"nnoremap <S-tab> <c-w>W

" " - BLines
" function! s:buffer_line_handler(lines)
"   if len(a:lines) < 2
"     return
"   endif
"   let qfl = []
"   for line in a:lines[1:]
"     let chunks = split(line, "\t", 1)
"     let ln = chunks[0]
"     let ltxt = join(chunks[1:], "\t")
"     call add(qfl, {'filename': expand('%'), 'lnum': str2nr(ln), 'text': ltxt})
"   endfor
"   call s:fill_quickfix(qfl, 'cfirst')
"   normal! m'
"   let cmd = s:action_for(a:lines[0])
"   if !empty(cmd)
"     execute 'silent' cmd
"   endif

"   execute split(a:lines[1], '\t')[0]
"   normal! ^zvzz
" endfunction

" function! s:buffer_lines(query)
"   let linefmt = s:yellow(" %4d ", "LineNr")."\t%s"
"   let fmtexpr = 'printf(linefmt, v:key + 1, v:val)'
"   let lines = getline(1, '$')
"   if empty(a:query)
"     return map(lines, fmtexpr)
"   end
"   return filter(map(lines, 'v:val =~ a:query ? '.fmtexpr.' : ""'), 'len(v:val)')
" endfunction

" function! fzf#vim#buffer_lines(...)
"   let [query, args] = (a:0 && type(a:1) == type('')) ?
"         \ [a:1, a:000[1:]] : ['', a:000]
"   return s:fzf('blines', {
"   \ 'source':  s:buffer_lines(query),
"   \ 'sink*':   s:function('s:buffer_line_handler'),
"   \ 'options': s:reverse_list(['+m', '--tiebreak=index', '--multi', '--prompt', 'BLines> ', '--ansi', '--extended', '--nth=2..', '--tabstop=1'])
"   \}, args)
" endfunction
