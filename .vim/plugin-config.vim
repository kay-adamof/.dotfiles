" ================================================================================
"     Plug 'SirVer/ultisnips'
" ================================================================================
" https://github.com/sirver/UltiSnips
" ------------------------------------------------------------
"     notes
" ------------------------------------------------------------

" https://www.youtube.com/watch?v=f_WQxYgK0Pk&ab_channel=HolgerRapp

" - Tab Stops and Placeholders
" - Mirros
" - Transformations
" - Interpolation
"   - Shell
"   - VimL
" - Python

" ------------------------------------------------------------
"     settings
" ------------------------------------------------------------
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" ================================================================================
"       Plug 'mhinz/vim-signify'
" ================================================================================
" :h signify
set updatetime=100

nnoremap <leader>SignifyDiff :SignifyDiff<cr>
nnoremap <leader>SignifyHunkDiff :SignifyHunkDiff<cr>
nnoremap <leader>SignifyHunkUndo :SignifyHunkUndo<cr>

" hunk jumping
nmap <leader>signify-next-hunk <plug>(signify-next-hunk)
nmap <leader>signify-prev-hunk <plug>(signify-prev-hunk)

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" ================================================================================
"     Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ================================================================================
" :help coc-nvim
" https://github.com/neoclide/coc.nvim

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file
autocmd FileType json syntax match Comment +\/\/.\+$+

" https://dev.classmethod.jp/articles/cocnvim-adventcalendar-day01/
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ------------------------------------------------------------
"     :CocInstall coc-snippets
" ------------------------------------------------------------
" https://github.com/neoclide/coc-snippets

" keybindings
" -----------
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-p> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Make <tab> used for trigger completion, comletion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" -----------

" mappings
" --------
" -- Create new snippet with current selected text, visual mode only.
" vmap     <leader>coc_snip_convert             <Plug>(coc-convert-snippet)
" -- Expand snippet with current inserted text, insert mode only.
" imap     <leader>coc_snip_expand              <Plug>(coc-snippets-expand)
" -- Expand snippet or jump to next placeholder of current snippet when possible, insert mode only.
" imap     <leader>coc_snip_expand_jump         <Plug>(coc-snippets-expand-jump)
" -- Remove selected text and save to g:coc_selected_text which will replace $VISUAL on next snippet expand
" map      <leader>coc_snip_select              <Plug>(coc-snippets-select)
" -- to open snippets list used by current buffer.
nnoremap <leader>coc_snip_open_snippets_list  :CocList snippets
" -- to choose and open a snippet file that used by current document.
nnoremap <leader>coc_snip_open_file           :CocCommand snippets.openSnippetFiles
" -- to edit user's ultisnips snippets of current document filetype.
nnoremap <leader>coc_snip_edit                :CocCommand snippets.editSnippets
" -- to open output channel of snippets.
nnoremap <leader>coc_snip_open_output_channel :CocCommand snippets.openOutput
" --------
   
" ------------------------------------------------------------
"     CocInstall coc-prettier
" ------------------------------------------------------------
"  https://github.com/neoclide/coc-prettier 
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

vmap <leader>coc_prettier_format_seleced  <Plug>(coc-format-selected)
nmap <leader>coc_prettier_format_seleced  <Plug>(coc-format-selected)

" ------------------------------------------------------------
"     :CocInstall coc-yank
" ------------------------------------------------------------
"  https://github.com/neoclide/coc-yank
"
nnoremap <silent> ;y  :<C-u>CocList -A --normal yank<cr>

" ================================================================================
"     Plug 'lambdalisue/battery.vim'
" ================================================================================
let g:battery#component_format = "%v%%"

" ================================================================================
"     Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" ================================================================================
" https://github.com/mg979/vim-visual-multi
" :help visual-multi
" :help vm-some-topic
" Tutorial: vim -Nu ~/.vim/plugged/vim-visual-multi/tutorialrc
" ------------------------------------------------------------
"     Basic usage:
" ------------------------------------------------------------
" select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" create cursors vertically with Ctrl-Down/Ctrl-Up
" select one character at a time with Shift-Arrows
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" start insert mode with i,a,I,A
" ------------------------------------------------------------
"     Two main modes:
" ------------------------------------------------------------
" in cursor mode commands work as they would in normal mode
" in extend mode commands work as they would in visual mode
" press Tab to switch between «cursor» and «extend» mode
" extend mode: like visual mode. Not allow working with cursor, only
" selection.
" ------------------------------------------------------------
"     select words
" ------------------------------------------------------------
" <S-Right>: select one character at a time.
" ------------------------------------------------------------
"     suported operators
" ------------------------------------------------------------
" cursor-mode:
"     c           change text
"     i, I, a, A  Enter insert mode
"     operators   see |vm-operators|
"     motions     see |vm-motions|
"     |           set column for all cursors (to current column or [count])
"     r           replace single character
"     R           enter |vm-replace-mode|
"     ~           change case of single character
"     &           repeat last substitution
"     <C-A>       increase number
"     <C-X>       decrease number
" extend-mode:
" y/d/c   yank/delete/change
" gu/gU   change case
" |vim-abolish|   example: `cr_` to change current word to snake case
" |vim-surround|  example: `ysiw(` to enclose in parentheses
" ------------------------------------------------------------
"     useful mappings
" ------------------------------------------------------------
" _A:                  Select all word under the cursor
" _gS:                 Reselect previous region
" R:                   Replacement
" v2ap then press _c:  switch to VM cursor mode from visual mode
" _a:                  align vertically
" _<:                  align with prompted
" 2_<:                 align by two characters with prompted
" _N:                  Numbering with separators

" ------------------------------------------------------------
"     Some experiments 
" ------------------------------------------------------------
    " let g:VM_mouse_mappings     = 1             " some text
    " let g:VM_theme              = 'iceblue'     " some text
    " let g:VM_highlight_matches  = 'underline'   " some text

    " let g:VM_maps               = {}            " some text
    " let g:VM_maps["Undo"]       = 'u'           " some text
    " let g:VM_maps["Redo"]       = '<C-r>'       " some text

" You could try some of the following, after setting a new mark and creating a
" column of cursors with 5<C-Down>. Do the following in a single VM session:

" 1. `~` (toggle case for character under cursors)
" 2. `r`<char> (replace character under cursors)
" 3. <C-n> to select words under current cursors, then repeat `~` and `r`<char>
" 4. press `\\N`, then enter `,`<Space><CR> in the prompt (numbering with separator)
" 5. now press <Tab>`dWWP`, then `A`<Space><C-v>
" 6. exit insert mode, then press `0`, then <C-a>, then <C-x>
" 7. still in VM, press `u` until you can, do the same with <C-r>, then again `u`

" ------------------------------------------------------------
"     settings
" ------------------------------------------------------------
let g:VM_leader = '_'

if !exists('g:VM_maps')
    let g:VM_maps = {}
endif

let g:VM_maps["Select h"] = ''
let g:VM_maps["Select l"] = ''

" nmap <Plug>(VM-select-h)
" nunmap <S-Left>
" <Plug>(VM-select-l)
" nunmap <S-Right>


" Plug 'mzlogin/vim-markdown-toc'
" let g:vim_markdown_follow_anchor = 1

" Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" =============================================================================== Plug 'haya14busa/incsearch-fuzzy.vim'
" ================================================================================
"
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
map zf <Plug>(incsearch-fuzzy-/)
map zF <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

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

" --------------------------------------------------------------------------------
" STARTIFY CONFIG
" --------------------------------------------------------------------------------
nnoremap startify_load_a_session   :SLoad<CR>
nnoremap startify_save_a_session   :SSave<CR>
nnoremap startify_delete_a_session :SDelete<CR>
nnoremap startify_close_a_session  :SClose<CR>

" extract from startify-example
autocmd User Startified setlocal cursorline

let g:startify_enable_special      = 0
let g:startify_files_number        = 8
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ '/data/repo/neovim/runtime/doc',
        \ '/Users/mhi/local/vim/share/vim/vim74/doc',
        \ ]

let g:startify_bookmarks = [
        \ { 'c': '~/.vim/vimrc' },
        \ '~/golfing',
        \ ]

" --------------------------------------------------------------------------------
" FZF.VIM CONFIG
" --------------------------------------------------------------------------------
" CTRL-T: new tab
" CTRL-X: horizontal split
" CTRL-V: vertical split 

" !(bang) version starts fzf in fullscreen mode

" Examples
" " This is the default extra key bindings
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" " An action can be a reference to a function that processes selected lines
" function! s:build_quickfix_list(lines)
"   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"   copen
"   cc
" endfunction

" let g:fzf_action = {
"   \ 'ctrl-q': function('s:build_quickfix_list'),
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }


" ------------------------------------------------------------
"     window settings
" ------------------------------------------------------------
"
" " Default fzf layout
" " - Popup window (center of the screen)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" " - Popup window (center of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" " - Popup window (anchored to the bottom of the current window)
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }

" " - down / up / left / right
" let g:fzf_layout = { 'down': '40%' }

" " - Window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

" " Customize fzf colors to match your color scheme
" " - fzf#wrap translates this to a set of `--color` options
" let g:fzf_colors =
" \ { 'hl': ['fg', 'CursorLine','Normal'],
"   \ 'fg+':     ['fg', 'CursorLine', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine'],
"   \ 'preview-bg':     ['bg', 'CursorLine'],
"   \ 'hl+': ['bg', 'CursorLine', 'CursorColumn']}

  " \ 'preview-fg':     ['fg', 'CursorLine', 'Normal'],
  "
" " Enable per-command history
" " - History files will be stored in the specified directory
" " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
" "   'previous-history' instead of 'down' and 'up'.
" let g:fzf_history_dir = '~/.local/share/fzf-history'

" List notation is the prefered option format:
" call fzf#run({'options': ['--reverse', '--prompt', 'C:\Program Files\']})"

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
let g:fzf_preview_window = ['up:60%:hidden', 'ctrl-/']

" ------------------------------------------------------------
"     custom commands
" ------------------------------------------------------------
"
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
    \   fzf#vim#with_preview({'options': '--layout reverse --height=100% --query '.shellescape(<q-args>).' --bind change:first --with-nth=4.. --delimiter=":"'}, 'up:60%'),1)
    " \   fzf#vim#with_preview({'options': '--layout reverse  --with-nth=-1.. --delimiter="/"'}, 'right:50%'))
command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --no-sort'}, 'up:50%', '?'),
    \   1)
" nnoremap H :LinesWithPreview<CR>

" command! -bang -nargs=* BLines call fzf#vim#buffer_lines(<q-args>, fzf#vim#with_preview(), <bang>0)
" command! -nargs=* -bang BLines call fzf#vim#blines(fzf#vim#with_preview())

" ------------------------------------------------------------
"     Mappings related to fzf
" ------------------------------------------------------------
"
  " Mapping selecting mappings
nmap <leader><Space> <plug>(fzf-maps-n)
xmap <leader><Space> <plug>(fzf-maps-x)
omap <leader><Space> <plug>(fzf-maps-o)

  " Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <leader>Fzf_search_files                              :Files<CR>
nnoremap <leader>Fzf_git_ls_files                              :GFiles<CR>
nnoremap <leader>Fzf_git_status                                :GFiles?<CR>
nnoremap <leader>Fzf_open_buffers                              :Buffers<CR>
" nnoremap <leader> :Colors<CR>
    " Color schemes
nnoremap <leader>Fzf_silver_search                             :Ag<CR>
nnoremap <leader>Fzf_ripgrep                                   :Rg<CR>
nnoremap <leader>Fzf_search_lines_in_loaded_buffers            :Lines<CR>
nnoremap <leader>Fzf_blines_search_lines_in_current_buffer     :BLines<CR>
nnoremap <leader>Fzf_search_tags_in_project                    :Tags<CR>
nnoremap <leader>Fzf_search_tags_in_current_buffer             :BTags<CR>
nnoremap <leader>Fzf_search_marks                              :Marks<CR>
nnoremap <leader>Fzf_open_tab                                  :Windows<CR>
nnoremap <leader>Fzf_locate                                    :Locate<CR>
nnoremap <leader>Fzf_search_oldfiles_history_in_viminfo        :History<CR>
nnoremap <leader>Fzf_search_command_history                    :History:<CR>
nnoremap <leader>Fzf_search_search_history                     :History/<CR>
nnoremap <leader>Fzf_snippets                                  :Snippets<CR>
nnoremap <leader>Fzf_git_commits_using_fugitive                :Commits<CR>
nnoremap <leader>Fzf_git_commits_current_buffer_can_use_visual :BCommits<CR>
nnoremap <leader>Fzf_search_all_commands                       :Commands<CR>
nnoremap <leader>Fzf_search_normal_mode_mappings               :Maps<CR>
nnoremap <leader>Fzf_search_helptags                           :Helptags<CR>
nnoremap <leader>Fzf_search_filetypes                          :Filetypes<CR>
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


" ================================================================================
"     Plug 'vim-airline/vim-airline'
" ================================================================================
let g:airline#extensions#fzf#enabled = 1
" let g:airline_statusline_ontop = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" * enable/disable enhanced tabline. (c) >
" let g:airline#extensions#tabline#enabled = 1

" * enable/disable displaying open splits per tab (only when tabs are opened) >
" let g:airline#extensions#tabline#show_splits = 1

" * switch position of buffers and tabs on splited tabline (c)
  " (only supported for ctrlspace plugin). >
" let g:airline#extensions#tabline#switch_buffers_and_tabs = 0

" * enable/disable displaying buffers with a single tab. (c) >
" let g:airline#extensions#tabline#show_buffers = 0

" Append/Replace custom sections to default sections prepared by Airline"
function! AirlineInit()
  let g:airline_section_b ..= '%-0.20{getcwd()}'
  " let g:airline_section_c ..= '%-0.20{getcwd()}'
  let g:airline_section_z = '%{battery#component()}%{strftime("|%y/%m/%d|%H:%m")}'
endfunction
autocmd User AirlineAfterInit call AirlineInit()


let g:airline_theme='dracula'


" -- airline symbols
" some symbols works with nerd font
" if symbols do not work correctly, make sure the settings of your app's font family."
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
" let g:airline_left_sep  = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
" let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ================================================================================
    
" ================================================================================

""-- ULTISNIPS CONFIG
"let g:UltiSnipsExpandTrigger = "<c-j>"
"let g:UltiSnipsListSnippets  = "<c-l>"

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

" ================================================================================
"     NERDTree CONFIG
" ================================================================================

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
