"-- STARTIFY CONFIG
nnoremap startify_load_a_session :SLoad<CR>
nnoremap startify_save_a_session :SSave<CR>
nnoremap startify_delete_a_session :SDelete<CR>
nnoremap startify_close_a_session :SClose<CR>

"-- FZF.VIM CONFIG
" Mapping selecting mappings
nmap <leader><Space> <plug>(fzf-maps-n)
xmap <leader><Space> <plug>(fzf-maps-x)
omap <leader><Space> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap fzf_search_files :Files<CR>
nnoremap fzf_git_ls_files :GFiles<CR>
     " Git files (git ls-files)
nnoremap fzf_git_status :GFiles?<CR>
    " Git files (git status)
nnoremap fzf_open_buffers :Buffers<CR>
    " Open buffers
" nnoremap <leader> :Colors<CR>
    " Color schemes
nnoremap fzf_silver_search :Ag<CR>
    " ag search result (ALT-A to select all, ALT-D to deselect all)
nnoremap fzf_repgrep :Rg<CR>
    " rg search result (ALT-A to select all, ALT-D to deselect all)
nnoremap fzf_search_lines_in_loaded_buffers :Lines<CR>
    " Lines in loaded buffers
nnoremap fzf_search_lines_in_current_buffer :BLines<CR>
    " Lines in the current buffer
nnoremap fzf_search_tags_in_project :Tags<CR>
    " Tags in the project (ctags -R)
nnoremap fzf_search_tags_in_current_buffer :BTags<CR>
    " Tags in the current buffer
nnoremap fzf_search_marks :Marks<CR>
    " Marks
nnoremap fzf_windows :Windows<CR>
    " Windows
nnoremap fzf_locate :Locate<CR>
    " locate command output
nnoremap fzf_search_oldfiles_history_in_viminfo :History<CR>
    " v:oldfiles and open buffers
nnoremap fzf_search_command_history :History:<CR>
    " Command history
nnoremap fzf_search_search_history :History/<CR>
    " Search history
" nnoremap <leader> :Snippets<CR>
    " Snippets (UltiSnips)
nnoremap fzf_git_commits_using_fugitive :Commits<CR>
    " Git commits (requires fugitive.vim)
nnoremap fzf_git_commits_current_buffer_can_use_visual :BCommits<CR>
    " Git commits for the current buffer; visual-select lines to track changes in the range
nnoremap fzf_search_all_commands :Commands<CR>
    " Commands
nnoremap fzf_search_normal_mode_mappings :Maps<CR>
    " Normal mode mappings
nnoremap fzf_search_helptags :Helptags<CR>
    " Help tags 1
nnoremap fzf_search_filetypes :Filetypes<CR>
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
nnoremap <C-t> :NERDTreeToggle %<CR>
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
