" Plug 'mzlogin/vim-markdown-toc'
" let g:vim_markdown_follow_anchor = 1

" Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"-- Plug 'haya14busa/incsearch-fuzzy.vim'
"-- Plug 'haya14busa/incsearch.vim'
" map f /
" map / <Plug>(incsearch-fuzzy-/)
" map F /
" map ? <Plug>(incsearch-fuzzy-?)
" cnoremap ; <Over>(incsearch-next)
" cnoremap + <Over>(incsearch-prev)
" nnoremap zg/ <Plug>(incsearch-fuzzy-stay)
" map / <Plug>(incsearch-fuzzy-/)
" map ? <Plug>(incsearch-fuzzy-?)
" map zg/ <Plug>(incsearch-fuzzy-stay)

"-- Plug 'junegunn/vim-easy-align'
nmap <leader>easy_align_inner_paragraph              <Plug>(EasyAlign)ip
nmap <leader>easy_align_inner_paragraph_ignore_group <Plug>(EasyAlign)ip<C-G>

"-- Plug 'junegunn/limelight.vim'
  " Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg     = 'gray'
let g:limelight_conceal_ctermfg     = 240
  " Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'
  " default: 0.5
let g:limelight_default_coefficient = 0.5
  " Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span      = 0
  " Beginning/end of paragraph
  " When there's no empty line between the paragraphs
  " and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
  " Highlighting priority (default: 10)
  " Set it to -1 not to overrule hlsearch
let g:limelight_priority            = 10

"-- GOYO CONFIG
  " revert default colorscheme when exit goyo
nnoremap turn_goyo_off :Goyo!<CR> :hi Normal guibg=NONE ctermbg=NONE<CR>
  " goyo and limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"-- STARTIFY CONFIG
nnoremap startify_load_a_session   :SLoad<CR>
nnoremap startify_save_a_session   :SSave<CR>
nnoremap startify_delete_a_session :SDelete<CR>
nnoremap startify_close_a_session  :SClose<CR>

"-- FZF.VIM CONFIG
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
  " fzf.vim ripgrep advanced option command RG"
function! RipgrepFzf(query, fullscreen)
  let command_fmt     = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command  = printf(command_fmt, '{q}')
  let spec            = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --height=100% --query '.shellescape(<q-args>).' --bind change:first --with-nth=4.. --delimiter=":"'}, 'right:50%'),1)
    " \   fzf#vim#with_preview({'options': '--layout reverse  --with-nth=-1.. --delimiter="/"'}, 'right:50%'))
command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, 'up:50%', '?'),
    \   1)
" nnoremap H :LinesWithPreview<CR>

" command! -bang -nargs=* BLines call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview(), <bang>0)
" command! -nargs=* -bang BLines call fzf#vim#blines(fzf#vim#with_preview())

  " Mapping selecting mappings
nmap <leader><Space> <plug>(fzf-maps-n)
xmap <leader><Space> <plug>(fzf-maps-x)
omap <leader><Space> <plug>(fzf-maps-o)

  " Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap Fzf_search_files                              :Files<CR>
nnoremap Fzf_git_ls_files                              :GFiles<CR>
nnoremap Fzf_git_status                                :GFiles?<CR>
nnoremap Fzf_open_buffers                              :Buffers<CR>
" nnoremap <leader> :Colors<CR>
    " Color schemes
nnoremap Fzf_silver_search                             :Ag<CR>
nnoremap Fzf_ripgrep                                   :Rg<CR>
nnoremap Fzf_search_lines_in_loaded_buffers            :Lines<CR>
nnoremap Fzf_search_lines_in_current_buffer            :BLines<CR>
nnoremap Fzf_search_tags_in_project                    :Tags<CR>
nnoremap Fzf_search_tags_in_current_buffer             :BTags<CR>
nnoremap Fzf_search_marks                              :Marks<CR>
nnoremap Fzf_open_tab                                  :Windows<CR>
nnoremap Fzf_locate                                    :Locate<CR>
nnoremap Fzf_search_oldfiles_history_in_viminfo        :History<CR>
nnoremap Fzf_search_command_history                    :History:<CR>
nnoremap Fzf_search_search_history                     :History/<CR>
" nnoremap <leader> :Snippets<CR>
    " Snippets (UltiSnips)
nnoremap Fzf_git_commits_using_fugitive                :Commits<CR>
nnoremap Fzf_git_commits_current_buffer_can_use_visual :BCommits<CR>
nnoremap Fzf_search_all_commands                       :Commands<CR>
nnoremap Fzf_search_normal_mode_mappings               :Maps<CR>
nnoremap Fzf_search_helptags                           :Helptags<CR>
nnoremap Fzf_search_filetypes                          :Filetypes<CR>
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
      " show current working directory in c section"
let g:airline_section_b = '%-0.20{getcwd()}'
let g:airline_section_c = '%t'

      " the separator used on the left side
let g:airline_left_sep  = ''
      " the separator used on the right side
let g:airline_right_sep = ''

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
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsListSnippets  = "<c-l>"

"-- INDENTLINE CONFIG
let g:indentLine_color_gui  = '#423d38'
let g:indentLine_setConceal = 0
let g:indentLine_char       = '|'

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
" <leader>n | NERD Tree
nnoremap <leader>n :NERDTree %<cr>
" nnoremap <C-t> :NERDTreeToggle %<CR>
let NERDTreeShowHidden        = 1
let NERDTreeRespectWildIgnore = 1
let g:NERDTreeMapToggleFiles = '_F'
let g:NERDTreeMapToggleFilters = '_f'
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
" let g:ackprg = 'ag --nogroup --nocolor --column'
" ----------------------------------------------------------------------------
" <Leader>I/A | Prepend/Append to all adjacent lines with same indentation
" ----------------------------------------------------------------------------
nmap <silent> <leader>I ^vio<C-V>I
nmap <silent> <leader>A ^vio<C-V>$A

"-- Plug 'mileszs/ack.vim'
  " Use ripgrep for searching ⚡️
  " Options include:
  " --vimgrep -> Needed to parse the rg response properly for ack.vim
  " --type-not sql -> Avoid huge sql file dumps as it slows down the search
  " --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg                         = 'rg --vimgrep --type-not sql --smart-case'
  " Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose                  = 1
  " Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
  " Don't jump to first match
cnoreabbrev Ack Ack!
  " Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>


