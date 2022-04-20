"""" vim 8 defaults

unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

augroup vimrc
  autocmd!
augroup END

let s:darwin = has('mac')
let s:windows = has('win32') || has('win64')


let mapleader      = ' '
let maplocalleader = ' '

" if mode() != "t"
"   set syntax=off
" endif



" ================================================================================
"     so ~/.vim/plugins.vim
" ================================================================================
" ------------------------------------------------------------
"     To install correctly:
" ------------------------------------------------------------
" :source %
" :PlugInstall
" ------------------------------------------------------------
"     Configuration file path
" ------------------------------------------------------------
" ~/.vim/plugin-config.vim

call plug#begin('~/.vim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-signify'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/battery.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'luochen1990/rainbow'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'tpope/vim-repeat'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
" Plug 'SirVer/ultisnips'
Plug 'yggdroot/indentline'

call plug#end()

colorscheme dracula

"PlugInstall
"PlugUpdate
"PlugStatus
"PlugClean
"PlugUpgrade

" ================================================================================
"     so ~/.vim/plugin-config.vim
" ================================================================================

" ================================================================================
"     Plug 'vimwiki/vimwiki'
" ================================================================================
" ------------------------------------------------------------
"     Features
" ------------------------------------------------------------
" * three markup syntaxes supported: Vimwiki's own syntax, Markdown, MediaWiki
" * export everything to HTML
" * link to other wiki pages and external files
" * search through all wiki pages
" * outline notes and tasks in indented lists
" * quickly manipulate numbered and bulleted lists
" * tag wiki pages or arbitrary places and quickly jump to tags
" * auto-formatted tables
" ------------------------------------------------------------
"     Prerequisites
" ------------------------------------------------------------
" set nocompatible # Nvim is always "nocompatible"
" filetype plugin on
" syntax on
" ------------------------------------------------------------
"     notes
" ------------------------------------------------------------
" * Place your cursor on Tasks and press 
" * Enter to create a link. 
" * Press Enter again to open it. 
" * Backspace to jump back to your index.
" * visually select the words to be linked and press Enter. 
" http://thedarnedestthing.com/vimwiki%20cheatsheet
" https://gist.github.com/drkarl/4c503bccb62558dc85e8b1bc0f29e9cb
" ------------------------------------------------------------
"     Keybindings
" ------------------------------------------------------------
"
" * <Leader>wr - Rename wiki page you are in.
" * <Leader>wd - Delete wiki page you are in.
" * <Leader>ww – Open the default wiki index file
" * <Leader>ws – Select and open wiki index file
" * <Enter> – Follow/Create wiki link
nmap <leader>wfl <Plug>VimwikiFollowLink
" * <Backspace> – Go back to parent(previous) wiki link
nmap <leader>wb <Plug>VimwikiGoBackLink
" * <Tab> – Find next wiki link
nmap <leader>wnl <Plug>VimwikiNextLink
" * <Shift-Tab> – Find previous wiki link
nmap <leader>wpl <Plug>VimwikiPrevLink
" ------------------------------------------------------------
"     help pages
" ------------------------------------------------------------
" :h vimwiki 
" :h vimwiki-mappings
" ------------------------------------------------------------
"     Settings
" ------------------------------------------------------------
let default_wiki = {}
let default_wiki.syntax = 'markdown'
let default_wiki.ext = '.md'

" let default_wiki.path = '~/Documents/'
let g:vimwiki_list = [default_wiki]
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

" ================================================================================
"     Plug 'haya14busa/incsearch-fuzzy.vim'
" ================================================================================
"
map zf <Plug>(incsearch-fuzzy-/)
map zF <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)

" ================================================================================
"     Plug 'junegunn/vim-easy-align'
" ================================================================================
nmap <leader>easy_align_inner_paragraph              <Plug>(EasyAlign)ip
nmap <leader>easy_align_inner_paragraph_ignore_group <Plug>(EasyAlign)ip<C-G>

" ================================================================================
"     Plug 'junegunn/limelight.vim'
" ================================================================================
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

" ================================================================================
"     Plug 'junegunn/goyo.vim'
" ================================================================================
  " revert default colorscheme when exit goyo
nnoremap turn_goyo_off :Goyo!<CR> :hi Normal guibg=NONE ctermbg=NONE<CR>
  " goyo and limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ================================================================================
"     Plug 'mhinz/vim-startify'
" ================================================================================
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
let g:startify_session_persistence = 0

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ '/data/repo/neovim/runtime/doc',
        \ '/Users/mhi/local/vim/share/vim/vim74/doc',
        \ ]

let g:startify_bookmarks = [
        \ { 'a': '~/.vim/vimrc' },
        \ { 'b': '~/vimwiki/index.md' }
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

" ================================================================================
"     so ~/.vim/autoclose.vim
" ================================================================================
"-- AUTOCLOSE NATIVE CONFIG
      "autoclose and position cursor to write text inside
inoremap ' ''<left>
inoremap ` ``<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
      "autoclose with ; and position cursor to write text inside
inoremap '; '';<left><left>
inoremap `; ``;<left><left>
inoremap "; "";<left><left>
inoremap (; ();<left><left>
inoremap [; [];<left><left>
inoremap {; {};<left><left>
      "autoclose with : and position cursor to write text inside
inoremap ': '':<left><left>
inoremap `: ``:<left><left>
inoremap ": "":<left><left>
inoremap (: ():<left><left>
inoremap [: []:<left><left>
inoremap {: {}:<left><left>
      "autoclose with , and position cursor to write text inside
inoremap ', '',<left><left>
inoremap `, ``,<left><left>
inoremap ", "",<left><left>
inoremap (, (),<left><left>
inoremap [, [],<left><left>
inoremap {, {},<left><left>
      "autoclose and position cursor after
inoremap '<tab> ''
inoremap `<tab> ``
inoremap "<tab> ""
inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}
      "autoclose with ; and position cursor after
inoremap ';<tab> '';
inoremap `;<tab> ``;
inoremap ";<tab> "";
inoremap (;<tab> ();
inoremap [;<tab> [];
inoremap {;<tab> {};
      "autoclose with , and position cursor after
inoremap ',<tab> '',
inoremap `,<tab> ``,
inoremap ",<tab> "",
inoremap (,<tab> (),
inoremap [,<tab> [],
inoremap {,<tab> {},
      "autoclose 2 lines below and position cursor in the middle
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap "<CR> "<CR>"<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap {<CR> {<CR>}<ESC>O
      "autoclose 2 lines below adding ; and position cursor in the middle
inoremap ';<CR> '<CR>';<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap (;<CR> (<CR>);<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
      "autoclose 2 lines below adding , and position cursor in the middle
inoremap ',<CR> '<CR>',<ESC>O
inoremap `,<CR> `<CR>`,<ESC>O
inoremap ",<CR> "<CR>",<ESC>O
inoremap (,<CR> (<CR>),<ESC>O
inoremap [,<CR> [<CR>],<ESC>O
inoremap {,<CR> {<CR>},<ESC>O

" ================================================================================
"     so ~/.vim/GoogleSearch.vim
" ================================================================================
" voogle.vim - Google from vim
" Original Author : George Papanikolaou <papanikge@ceid.upatras.gr>
" Version         : 1.2
" Use pathogen to install or in plugin/voogle.vim

" if exists('g:loaded_voogle') || v:version < 700
"   finish
" endif
" let g:loaded_voogle = 1

" Use this to set a custom search engine, like duck duck go
if !exists("g:search_engine")
    let g:search_engine = "https://duckduckgo.com/?q="
endif

" mode: 0 is normal, 1 is visual
func! Google(mode)

    " Is the browser defined via configuration?
    if exists("g:voogle_browser") && executable(g:voogle_browser)
        let browser = "!" . g:voogle_browser . " "
    endif

    " Find a browser
    if !exists("browser")
        if has("mac")
            let browser = "!open "
        elseif executable("chromium")
            let browser = "!chromium "
        elseif executable("chrome")
            let browser = "!chrome "
        elseif executable("firefox")
            let browser = "!firefox "
        elseif executable("links")
            let browser = "!links "
        endif
    endif

    if a:mode == 1
        " Visual selection mode
        " using @x for register x which is yanked with visual selection
        let query = substitute(@x, " ", "+", "g")
        let query = substitute(query, "\n", "", "g")
    else
        " word user cursor mode
        let query = substitute(@x, "\n", "", "g")
    endif

    " Prepare the shell command
    if has("unix") || has("macunix")
        let shell_command = browser . "\"" . g:search_engine . query . "\" > /dev/null 2>&1 &"
    else
        let shell_command = browser . "\"" . g:search_engine . query . "\""
    endif

    execute shell_command
    redraw!
endfunc

" Use this to set a custom mapping
if !exists("g:voogle_map")
  let g:voogle_map = "gs"
endif

let key = g:voogle_map
exe 'nnoremap ' . key .  ' "xyiw:silent call Google(0)<CR>'
exe 'vnoremap ' . key .  ' "xy:silent call Google(1)<CR>'

" ================================================================================
"     so ~/.vim/surround-vim_mappings.vim
" ================================================================================
nnoremap <leader>change_surroundings_a cs"'
nnoremap <leader>change_surroundings_b cs'<q>
nnoremap <leader>change_surroundings_c cst"
nnoremap <leader>delete_surroundings_   ds"
nnoremap <leader>delete_surroundings_  ds{ds)
nnoremap <leader>add_surroundings_inner_word_     ysiw]
nnoremap <leader>add_surroundings_     ysiw<em>
nnoremap <leader>add_surroundings_entire_line_     yss)
nnoremap <leader>add_surroundings_     S<p class="important">

" ------------------------------------------------------------
"     color & theme config
" ------------------------------------------------------------
"
set termguicolors
" hi Cursor gui=reverse guifg=NONE guibg=NONE
" let g:dracula_italic = 1
" colorscheme dracula
" set background=dark
" hi Normal guibg=NONE ctermbg=NONE
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

  autocmd InsertEnter,WinLeave * set nocursorline
  autocmd InsertLeave,WinEnter * set cursorline cursorlineopt=number,line
  autocmd CmdlineEnter : set nocursorline  | redraw
  autocmd CmdlineLeave : set cursorline cursorlineopt=number,line

augroup END

augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END


"" ============================================================================
"" BASIC SETTINGS {{{
"" ============================================================================
highlight Search guibg=NONE guifg=gray cterm=underline
" highlight CursorLine ctermbg=100 guibg=#cccc49

" - To increment or decrement alphabetic charactor"
"   See :h CTRL-A
set nrformats+=alpha


if has('nvim')
  set guicursor=n-v-c:ver50
  set guicursor+=i-ci-ve:hor25-blinkon0
  set guicursor+=r-cr:hor20,o:hor50
  " set guicursor+=a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  set guicursor+=sm:block-blinkwait175-blinkoff150-blinkon175
endif

" - Cursor Mode Settings
let &t_SI.="\e[3 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[5 q" "EI = NORMAL mode (ELSE)

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
set cursorline
set cursorlineopt=number
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
autocmd vimrc FileType markdown setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
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

" ------------------------------------------------------------
"     path settings
" ------------------------------------------------------------
"
let g:python3_host_prog = '/usr/local/bin/python3'

"" ============================================================================
"" MAPPINGS
"" ============================================================================


" *map-table*
"          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
" Command        +------+-----+-----+-----+-----+-----+------+------+ ~
" [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
" n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
" [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
" i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
" c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
" v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
" x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
" s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
" o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
" t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
" l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

" n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
" i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
" c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
" x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
" s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
" o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
" t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |

" ------------------------------------------------------------
"     miscellaneous
" ------------------------------------------------------------
" -- fold beautifully"
nnoremap zZ zRzXzMzr

" -- open command query"
nnoremap : q:i

" -- "
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" http://vimcasts.org/episodes/neovim-terminal-mappings/
if has('nvim')
  " tnoremap <Esc> <C-\><C-n>
  " tnoremap <M-[> <Esc>
  " tnoremap <C-v><Esc> <Esc>
endif

"" ----------------------------------------------------------------------------
"" Basic mappings
"" ----------------------------------------------------------------------------
nnoremap <leader>delete_all_buffer %bdelete
vnoremap <bs> d
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
vnoremap ~i <esc><S-Left>
" Move a word forward
inoremap ~o <esc><S-Right>
nnoremap ~o <esc><S-Right>
cnoremap ~o <S-Right>
vnoremap ~o <esc><S-Right>
" Select a word backward
inoremap ~w <esc>hvb
nnoremap ~w hvb
cnoremap ~w <S-Right>
vnoremap ~w b
" Select a word forward
inoremap ~e <esc>ve
nnoremap ~e ve
cnoremap ~e <S-Left>
vnoremap ~e e
" vnoremap <M-S-Right> e
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
" paste"
" inoremap ~v <C-r>+
" nnoremap ~v "+p
" Escaping
" https://vim.fandom.com/wiki/Avoid_the_escape_key
inoremap <expr> <Up>    pumvisible() ? "<Up>"    : "<ESC>`^<Up>"
inoremap <expr> <Down>  pumvisible() ? "<Down>"  : "<ESC>`^<Down>"
inoremap <expr> <left>  pumvisible() ? "<left>"  : "<ESC>`^<left>"
inoremap <expr> <right> pumvisible() ? "<right>" : "<ESC>`^<right>"
" inoremap <expr> <cr>    pumvisible() ? "<cr>"    : "<ESC>"
" " https://github.com/divad12/dotfiles/blob/master/.vimrc#L23
" nnoremap ~v o<ESC>"+]p
" cnoremap ~v \
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
"
nnoremap <silent> ;gy :Goyo<cr>

nnoremap <silent> ;so :so $MYVIMRC<cr>
nnoremap <silent> ;c :clo<cr>
" nnoremap <silent> ;nu :set nu rnu<cr>


"" <leader>n | NERD Tree
noremap ;n :NERDTreeToggle<cr>
"" open terminal in the directory of the current file"
" nnoremap ;t :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
" nnoremap ;t :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>
nnoremap ;term :let $VIM_DIR=expand('%:p:h')<CR>:split<bar>terminal<CR>i cd $VIM_DIR<CR>
" https://github.com/neovim/neovim/issues/5073
" command! -nargs=* T split | terminal <args>
" command! -nargs=* VT vsplit | terminal <args>
" quit
nnoremap ;q :q!<cr>
nnoremap ;qq :qa!<cr>
" nnoremap ;qqq :tabdo NERDTreeClose<CR> :qa!<cr>
" --------------------------------------------------------------------------------

" --------------------------------------------------------------------------------
nmap <leader>Open_file_in_chrome :!open -a Google\ Chrome %

nnoremap <silent> <leader>close_all_nerdtree_tabs :tabdo NERDTreeClose<CR>

nnoremap <expr> change_directory_of_current_buffer ChangeToLocalDir()
function! ChangeToLocalDir()
  lchdir%:p:h
  return ''
endfunction
" ================================================================================
"     The Past Regex
" ================================================================================
" \(\s[A-Z][a-z]\+\)$
" The above matches ' Management'
" Branch Management
" Some sub-headings have two to about five words consists of an Uppercase letter with following lowercase letters.

" --------------------------------------------------------------------------------
" forgetful commands
" --------------------------------------------------------------------------------
nnoremap <leader>delete_lines_not_matching_pattern :g/^\(.*Warning\)\@!.*$/d
" https://stackoverflow.com/questions/506075/how-do-i-fix-the-indentation-of-an-entire-file-in-vi
nnoremap <leader>fix_mix_indent_file gg=G

" https://vim.fandom.com/wiki/Remove_unwanted_spaces
nnoremap <leader>remove_unwanted_trailing_whitespace :%s/\s\+$//e

nnoremap <leader>add_line_break_for_all_lines %s/$/\r/g

nnoremap <leader>vim_multi_select_all _A
nnoremap <leader>vim_multi_reselect_previous_region _gS
nnoremap <leader>vim_multi_substitution R

nnoremap <leader>open-url-with-browser gx

nnoremap <leader>match_a_line_break                               /\n
nnoremap <leader>match_a_line_break_or_a_space                    /\_s
nnoremap <leader>Delete_all_blank_lines                           g/^\s*$/d
xnoremap <leader>Delete_all_blank_lines                           :g/^\s*$/d
xnoremap <leader>Delete_all_lines_matching_a_pattern              :g/pattern/d
xnoremap <leader>Delete_all_lines_not_matching_a_pattern          :g!/pattern/d
xnoremap <leader>Double_space_the_file_                           :g/^/pu__
xnoremap <leader>delete_whitespaces_at_the_beginning_of_line      :s/^\s\+//g<cr>
xnoremap <leader>substitute_whitespace_to_underbar                :s/ /_/g<cr>
xnoremap <leader>Add_text_to_end_string                           :g/^pattern/s/$/mytext
xnoremap <leader>Run_a_macro_on_matching_lines                    :g/pattern/normal @q
xnoremap <leader>Move_all_lines_matching_a_pattern_to_end_of_file :g/pattern/m$

nnoremap <leader>Copy_all_lines_matching_a_pattern_to_end_of_file :g/pattern/t$
xnoremap <leader>Copy_all_lines_matching_a_pattern_to_end_of_file :g/pattern/t$
" tnoremap <leader>Copy_all_lines_matching_a_pattern_to_end_of_file :g/pattern/t$

nnoremap <leader>copy_all_lines_matching_pattern_to_register_a    qaq:g/pattern/y A
xnoremap <leader>copy_all_lines_matching_pattern_to_register_a    qaq:g/pattern/y A
" tnoremap <leader>copy_all_lines_matching_pattern_to_register_a    qaq:g/pattern/y A

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

" nnoremap <expr> show_corner ShowCorner()
function! ShowCorner()
  set laststatus=2
  set showtabline=2
  set relativenumber
  set number
  set ruler
endfunction

" nnoremap <expr> Hide_corner HideCorner()
function! HideCorner()
  set laststatus=0
  set showtabline=0
  set norelativenumber
  set nonumber
  set noruler
endfunction

" ------------------------------------------------------------
"     go to markdown header
" ------------------------------------------------------------
nnoremap ;* vi[y/# <c-r>"

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
nnoremap <leader>Wrap_edge_screen_not_break_word :set wrap linebreak nolist<CR>
"" hjkl "
nnoremap j <C-d>
nnoremap k <C-u>

" go tab next"
nnoremap <silent> h :tabp<CR>
nnoremap <silent> l :tabn<CR>
nnoremap <silent> H :bN<CR>
nnoremap <silent> L :bn<CR>


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

" nnoremap <tab>   <c-w>w
" nnoremap <S-tab> <c-w>W
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
nmap <leader>text_heading_c m`yypVr-``Vjgcgv<esc>o
nnoremap <silent> <leader>text_heading_del :+1d\|-2d<cr>

" === Markdown headings

" nnoremap <leader>markdown_heading_a m`yypVr=``
" nnoremap <leader>markdown_heading_b m`yypVr-``
nnoremap <leader>markdown_heading_a m`^i# <esc>``2l
nnoremap <leader>markdown_heading_b m`^i## <esc>``3l
nnoremap <leader>markdown_heading_c m`^i### <esc>``4l
nnoremap <leader>markdown_heading_d m`^i#### <esc>``5l
nnoremap <leader>markdown_heading_e m`^i##### <esc>``6l
" markdown admonition
" -------------------

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
" TIPS:
" ====
" In insert mode:
" ctrl-t: indent current line forward
" ctrl-d: indent current line backward
" ====
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
" Customizing help
" --------------------------------------------------------------------------------

function! s:helpWindows()
  if &buftype == 'help'
    :set nu rnu
    :set cursorline cursorlineopt=number
  endif
endfunction
autocmd vimrc BufEnter *.txt call s:helpWindows()
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
