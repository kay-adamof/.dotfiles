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
so ~/.vim/GoogleSearch.vim
so ~/.vim/surround-vim_mappings.vim

"-- color & theme config
" set termguicolors
" let g:dracula_italic = 1
" colorscheme dracula
" set background=dark
hi Normal guibg=NONE ctermbg=NONE
" let g:terminal_ansi_colors = [
"     \ '#282828', '#cc241d', '#98971a', '#d79921', '#458588', '#b16286', '#689d6a', '#a89984',
"     \ '#928374', '#fb4934', '#b8bb26', '#fabd2f', '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
" \]





augroup vimrc
  au!
  autocmd InsertLeave,TextChanged,FocusLost * silent! write
  " https://stackoverflow.com/questions/2490227/how-does-vims-autoread-work
  autocmd FocusGained,BufEnter * :silent! !
  autocmd FocusGained,BufEnter * :silent!

  " autocmd InsertEnter,WinLeave * set nocursorline nocursorcolumn
  " autocmd CmdlineEnter : set nocursorline nocursorcolumn | redraw
  " autocmd InsertLeave,WinEnter * set cursorline cursorcolumn
  " autocmd CmdlineLeave : set cursorline cursorcolumn
augroup END

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END


"" ============================================================================
"" BASIC SETTINGS {{{
"" ============================================================================
highlight Search ctermbg=black ctermfg=gray cterm=underline


" - To increment or decrement alphabetic charactor"
"   See :h CTRL-A
set nrformats+=alpha

" - Cursor Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[6 q" "EI = NORMAL mode (ELSE)
" - Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

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
" --------------------------------------------------------------------------------
" Why is "unnamedplus" selected? 
" --------------------------------------------------------------------------------
" https://francopasut.netlify.app/post/vim_cut_copy_paste_clipboard/
" *: Store some information to the middle mouse button
set clipboard=unnamedplus

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
nnoremap <leader>delete_all_buffer %bdelete

" inoremap <esc>b <S-Left>
" nnoremap <expr> <esc>b mode(n)>1 ? '<S-Left>' : ''

" --------------------------------------------------------------------------------
" Cursor Movings
" --------------------------------------------------------------------------------
" Some mappings with "~" work with "keybindings.json" of vscode.

" Move a word backward
inoremap ~i <Esc><s-left>
nnoremap ~i <esc><S-Left>
cnoremap ~i <S-Left>
" Move a word forward
inoremap ~o <esc><S-Right>
nnoremap ~o <esc><S-Right>
cnoremap ~o <S-Right>
" Select a word backward
inoremap <M-S-Left> <esc>vb
nnoremap <M-S-Left> vb
" Select a word forward
inoremap <M-S-Right> <esc>ve
nnoremap <M-S-Right> ve
vnoremap <M-S-Right> e
" Select until the first non-blank character of the line.
inoremap ~a <esc>v^
nnoremap ~a v^
" Select until the end of line.
inoremap ~f <ESC>v$
nnoremap ~f v$
" Select an entire line
inoremap ~r <ESC>V
nnoremap ~r V
" undo
inoremap ~z <ESC>u
nnoremap ~z u
" Escaping
" https://vim.fandom.com/wiki/Avoid_the_escape_key
inoremap <expr> <Up>    pumvisible() ? "<Up>"    : "<ESC>`^<Up>"
inoremap <expr> <Down>  pumvisible() ? "<Down>"  : "<ESC>`^<Down>"
inoremap <expr> <left>  pumvisible() ? "<left>"  : "<ESC>`^<left>"
inoremap <expr> <right> pumvisible() ? "<right>" : "<ESC>`^<right>"
" inoremap <expr> <cr>    pumvisible() ? "<cr>"    : "<ESC>"
" https://github.com/divad12/dotfiles/blob/master/.vimrc#L23
nnoremap ~v o<ESC>"+]p
cnoremap ~v \
" vnoremap ~v o<ESC>"+]p
" --------------------------------------------------------------------------------
" Delete
" --------------------------------------------------------------------------------
" If the cursor is in the head of line, backspace key acts as ctrl-J; 
" otherwise, delete a char.
nnoremap <expr> <bs> getpos(".")[2]==1 ? "b<S-j>" : "X"
nnoremap <expr> <del> match(getline("."),'^$') ? "x" : "dd"
" nnoremap <expr> <bs> match(getline("."),'^.') ? "b<S-j>" : "dd"
" --------------------------------------------------------------------------------
" semicolon leader mappings
" --------------------------------------------------------------------------------
nnoremap <silent> ;so :so $MYVIMRC<cr>
nnoremap <silent> ;c :clo<cr>
nnoremap <silent> ;b :bn<cr>
"" <leader>n | NERD Tree
noremap ;n :NERDTreeToggle<cr>
"" open terminal in the directory of the current file"
nnoremap ;t :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
" quit
nnoremap ;q :q<cr>
nnoremap ;Q :qa<cr>
nnoremap ;QQ :qa!<cr>
" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------
nmap <leader>Open_file_in_chrome :!open -a Google\ Chrome %

nnoremap <silent> <leader>close_all_nerdtree_tabs :tabdo NERDTreeClose<CR>

nnoremap <expr> change_directory_of_current_buffer ChangeToLocalDir()
function! ChangeToLocalDir()
  lchdir%:p:h
  return ''
endfunction

" --------------------------------------------------------------------------------
" forgetful commands
" --------------------------------------------------------------------------------

nnoremap <leader>match_a_line_break                               /\n
nnoremap <leader>match_a_line_break_or_a_space                    /\_s
nnoremap <leader>Delete_all_blank_lines                           g/^\s*$/d
xnoremap <leader>Delete_all_blank_lines                           :g/^\s*$/d
xnoremap <leader>Delete_all_lines_matching_a_pattern              :g/pattern/d
xnoremap <leader>Delete_all_lines_not_matching_a_pattern          :g!/pattern/d
xnoremap <leader>Double_space_the_file_                           :g/^/pu__
xnoremap <leader>Copy_all_lines_matching_a_pattern_to_end_of_file :g/pattern/t$
xnoremap <leader>delete_whitespaces_at_the_beginning_of_line      :s/^\s\+//g<cr>
xnoremap <leader>substitute_whitespace_to_underbar                :s/ /_/g<cr>
xnoremap <leader>Add_text_to_end_string                           :g/^pattern/s/$/mytext
xnoremap <leader>Run_a_macro_on_matching_lines                    :g/pattern/normal @q
xnoremap <leader>Move_all_lines_matching_a_pattern_to_end_of_file :g/pattern/m$

nnoremap <leader>go_local_declaration                gd
nnoremap <leader>go_local_declaration_like_gd        1gd
nnoremap <leader>go_global_declaration               gD
nnoremap <leader>go_global_declaration_like_gD       1gD
nnoremap <leader>search_word_under_cursor            g*
nnoremap <leader>search_word_under_cursor_backward   g#
nnoremap <leader>go_to_file_under_cursor             gf
nnoremap <leader>go_to_file_under_cursor_same_window <c-w>f
nnoremap <leader>go_to_file_under_cursor_tab         <c-w>gf

" https://vim.fandom.com/wiki/Highlight_unwanted_spaces
nnoremap <leader>Show_all_tabs                                 /\t
nnoremap <leader>Show_trailing_whitespace                      /\s\+$
nnoremap <leader>Show_trailing_whitespace_only_after_some_text /\S\zs\s\+$
nnoremap <leader>Show_spaces_before_a_tab                      / \+\ze\t
 
" https://vi.stackexchange.com/questions/5634/what-options-are-there-to-enter-insert-mode
nnoremap <leader>Insert_at_column_1_of_the_line            gI
nnoremap <leader>Insert_where_insert_mode_was_last_stopped gi

nnoremap <leader>delete_from_cursor_to_the_end_of_line D
" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------

nnoremap _open_help_right_vertically :vert help<CR> <C-W>x

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

" --------------------------------------------------------------------------------
" butterfly  search
" --------------------------------------------------------------------------------
" f, F means find
nnoremap f /
nnoremap F ?
vnoremap f /
vnoremap F ?
" make n/N always go in the same direction
nnoremap <expr> n 'Nn'[v:searchforward] . "zv"
nnoremap <expr> N 'nN'[v:searchforward] . "zv"
vnoremap <expr> n 'Nn'[v:searchforward] . "zv"
vnoremap <expr> N 'nN'[v:searchforward] . "zv"
" search like a butterfly
cnoremap <expr> ; ButterflySemicolon()
cnoremap <expr> + ButterflyPlus()
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
" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------

" to soft-wrap at the edge of the screen, but not break in the middle of a word
nnoremap <leader>Warp_edge_screen_not_break_word :set wrap linebreak nolist<CR>
"" hjkl "
nnoremap j <C-d>
nnoremap k <C-u>
" go tab next"
nnoremap <silent> h :tabp<CR>
nnoremap <silent> l :tabn<CR>
nnoremap H :bN<CR>
nnoremap L :bn<CR>


" nnoremap <CR> :noh<CR>
" nnoremap <CR> :noh<CR><CR>:<backspace> <- Delete later unless problems


" then just press Ctrl-J whenever you want to split a line.
nnoremap <enter> i<CR><ESC>

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

"cnoremap <ESC> <C-c>

"" Movement ind insert mode
"" inoremap <C-h> <C-o>h
"" inoremap <C-l> <C-o>a
"" inoremap <C-j> <C-o>j
"" inoremap <C-k> <C-o>k
"" inoremap <C-^> <C-o><C-^>

"" Yank until the end of line
"nnoremap Y y$

" === macro
" qq to record, Q to replay
nnoremap Q @q
nnoremap <leader>register_current_line_to_macro ^"qy$

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


" --------------------------------------------------------------------------------
" Circular windows navigation
" --------------------------------------------------------------------------------

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------

" == decorations

" === text

nmap <leader>text_heading_a m'o<esc>80i=<esc>yy''4i <esc>PV2jgcgv<esc>o

" [NOTE]
" ====
" The command above is not working with nnoremap.
" It's a good example to understand "recursive".
" "gc" is a command of "vim-commentary" plugin. Using other commands in one command
" need to set map to be no "recursive".
" see: https://vi.stackexchange.com/questions/31790/how-to-remap-vim-commentary-commands
" ====

nmap <leader>text_heading_b m'o<esc>60i-<esc>yy''4i <esc>PV2jgcgv<esc>o
" nnoremap <leader>text_heading_c o- <left>y2l39pyy1kP
nnoremap <silent> <leader>text_heading_del :+1d\|-2d<cr>

" === Markdown headings

nnoremap <leader>markdown_heading_a m`yypVr=``
nnoremap <leader>markdown_heading_b m`yypVr-``
nnoremap <leader>markdown_heading_c m`^i### <esc>``4l
nnoremap <leader>markdown_heading_d m`^i#### <esc>``5l
nnoremap <leader>markdown_heading_e m`^i##### <esc>``6l


" nnoremap <leader>markdown_admonition > **WARNING**: Be careful, or else!
" nnoremap <leader>markdown_admonition > :WARNING: Be careful, or else!
" https://gist.github.com/roachhd/1f029bd4b50b8a524f3c[emoji list]
" https://stackoverflow.com/questions/50544499/how-to-make-a-styled-markdown-admonition-box-in-a-github-gist[markdown admonition styles]


" === AsciiDoc headings

nnoremap <leader>asciidoc_doc_title_just_one_in_a_article m`^i= <esc>``1l
nnoremap <leader>asciidoc_heading_a m`^i== <esc>``2lo<esc>``O<esc>``
nnoremap <leader>asciidoc_heading_b m`^i=== <esc>``3lo<esc>``O<esc>``
nnoremap <leader>asciidoc_heading_c m`^i==== <esc>``4lo<esc>``O<esc>``
nnoremap <leader>asciidoc_heading_d m`^i===== <esc>``5lo<esc>``O<esc>``
nnoremap <leader>asciidoc_heading_e m`^i====== <esc>``6lo<esc>``O<esc>``

" AsciiDoc Admonitions
" TIP , NOTE , IMPORTANT, WARNING and CAUTION

" ================================================================================
" Moving lines
" ================================================================================
nnoremap <silent> <C-k> :move-2<cr>
nnoremap <silent> <C-j> :move+<cr>
nnoremap <silent> <C-h> <<
nnoremap <silent> <C-l> >>
xnoremap <silent> <C-k> :move-2<cr>gv
xnoremap <silent> <C-j> :move'>+<cr>gv
xnoremap <silent> <C-h> <gv
xnoremap <silent> <C-l> >gv
xnoremap < <gv
xnoremap > >gv
" ================================================================================
" Readline-style key bindings in command-line (excerpt from rsi.vim)
" ================================================================================
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"
" cnoremap        <M-b> <S-Left>
" cnoremap        <M-f> <S-Right>
" silent! exe "set <S-Left>=\<Esc>b"
" silent! exe "set <S-Right>=\<Esc>f"


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

" --------------------------------------------------------------------------------
" Help in new tabs
" --------------------------------------------------------------------------------

function! s:helptab()
  if &buftype == 'help'
    wincmd T
    nnoremap <buffer> q :q<cr>
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helptab()

" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------

set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#' " WildMenu
    else
      let s .= '%#Title#'
    endif
    " set the tab page number (for mouse clicks)
    " let s .= '%' . (i + 1) . 'T '
    " set page number string
    " let s .= i + 1 . ''
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    for b in buflist
      if getbufvar(b, "&buftype") == 'help'
        " let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
      elseif getbufvar(b, "&buftype") == 'quickfix'
        " let n .= '[Q]'
      elseif getbufvar(b, "&modifiable")
        let n .= fnamemodify(bufname(b), ':t') . ', ' " pathshorten(bufname(b))
      endif
      if getbufvar(b, "&modified")
        let m += 1
      endif
    endfor
    " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, ', $', '', '')
    " add modified label
    if m > 0
      let s .= '+'
      " let s .= '[' . m . '+]'
    endif
    if i + 1 == tabpagenr()
      let s .= ' %#TabLineSel#'
    else
      let s .= ' %#TabLine#'
    endif
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#TabLineFill#%T'
  " right-aligned close button
  " if tabpagenr('$') > 1
  "   let s .= '%=%#TabLineFill#%999Xclose'
  " endif
  return s
endfunction

" ----------------------------------------------
" special arguments
" ----------------------------------------------
" https://alldrops.info/posts/vim-drops/2018-05-15_understand-vim-mappings-and-create-your-own-shortcuts/
" <buffer>
" <nowait>
" <silent>
" <special>
" <script>
" <expr>
" <unique>
