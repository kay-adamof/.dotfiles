"-- FZF.VIM CONFIG
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <leader>ff :Files<CR>
    " Files (runs $FZF_DEFAULT_COMMAND if defined)
nnoremap <leader>fgf :GFiles<CR>
     " Git files (git ls-files)
nnoremap <leader>fgf? :GFiles?<CR>
    " Git files (git status)
nnoremap <leader>fb :Buffers<CR>
    " Open buffers
" nnoremap <leader> :Colors<CR>
    " Color schemes
nnoremap <leader>fa :Ag<CR>
    " ag search result (ALT-A to select all, ALT-D to deselect all)
nnoremap <leader>fr :Rg<CR>
    " rg search result (ALT-A to select all, ALT-D to deselect all)
nnoremap <leader>fln :Lines<CR>
    " Lines in loaded buffers
nnoremap <leader>fbl :BLines<CR>
    " Lines in the current buffer
nnoremap <leader>ft :Tags<CR>
    " Tags in the project (ctags -R)
nnoremap <leader>fbt :BTags<CR>
    " Tags in the current buffer
nnoremap <leader>fm :Marks<CR>
    " Marks
nnoremap <leader>fw :Windows<CR>
    " Windows
nnoremap <leader>flc :Locate<CR>
    " locate command output
nnoremap <leader>fhf :History<CR>
    " v:oldfiles and open buffers
nnoremap <leader>fhc :History:<CR>
    " Command history
nnoremap <leader>fhs :History/<CR>
    " Search history
" nnoremap <leader> :Snippets<CR>
    " Snippets (UltiSnips)
nnoremap <leader>fct :Commits<CR>
    " Git commits (requires fugitive.vim)
nnoremap <leader>fbc :BCommits<CR>
    " Git commits for the current buffer; visual-select lines to track changes in the range
nnoremap <leader>fcm :Commands<CR>
    " Commands
nnoremap <leader>fm :Maps<CR>
    " Normal mode mappings
nnoremap <leader>fht :Helptags<CR>
    " Help tags 1
nnoremap <leader>fft :Filetypes<CR>
    " File types
  " CTRL-T / CTRL-X / CTRL-V 
    " key bindings to open in a new tab, a new split, or in a new vertical split
  " Bang-versions of the commands (e.g. Ag!) will open fzf in fullscreen

"-- KIE CONFIG
"let g:kite_supported_languages = ['python', 'javascript', 'go']
"let g:kite_supported_languages = []

"-- ALE CONFIG
let g:ale_disable_lsp = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\}

"-- AIRLINE CONFIG
      " the separator used on the left side
let g:airline_left_sep=''
      " the separator used on the right side
let g:airline_right_sep=''

" let g:airline_powerline_fonts=1
" let g:airline_theme='dracula'

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''


"-- ULTISNIPS CONFIG
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-l>"

"-- INDENTLINE CONFIG
let g:indentLine_color_gui = '#423d38'
let g:indentLine_setConceal = 0
let g:indentLine_char = '|'

"-- POLYGLOT CONFIG
      "js concealing
" let g:javascript_conceal_function="ƒ"
" let g:javascript_conceal_null="ø"
" let g:javascript_conceal_arrow_function="⇒"

"-- EMMET CONFIG
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

"-- NERDTree CONFIG
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
set wildignore+=*.DS_Store,*.min.*
      " Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
      " Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * silent NERDTreeMirror

"-- TAGBAR CONFIG
nmap <F8> :TagbarToggle<CR>
      " Extend .jsx support
let g:tagbar_type_javascriptreact = {
 \ 'ctagstype': 'javascript',
 \ 'kinds': [
       \ 'A:array',
       \ 'P:property',
       \ 'T:tags',
       \ 'O:objects',
       \ 'g:generator functions',
       \ 'f:functions',
       \ 'c:classes',
       \ 'm:methods',
       \ 'V:variables',
       \ 'I:imports',
       \ 'E:exports',
       \ 's:styled components'
 \ ]}

"-- Prettier config
" augroup fmt
"   autocmd!
"   autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
" augroup END

"-- Auto Save
" augroup fmt
"   autocmd!
"   autocmd TextChanged,InsertLeave * :w
" augroup END


"-- The Silver Searcher"
let g:ackprg = 'ag --nogroup --nocolor --column'
