# ================================================================================
#     Installed Plugins
# ================================================================================
# ------------------------------------------------------------
#     Plugin Manager
# ------------------------------------------------------------
# [jorgebucaran/fisher: A plugin manager for Fish.](https://github.com/jorgebucaran/fisher)
# ------------------------------------------------------------
#     fzf in fish
# ------------------------------------------------------------
# [jethrokuan/fzf: Ef-🐟-ient fish keybindings for fzf](https://github.com/jethrokuan/fzf)
# --- Quickstart
# Legacy     	New_Keybindings	Remarks
# Ctrl-t     	Ctrl-o         	Find a file.
# Ctrl-r     	Ctrl-r         	Search through command history.
# Alt-c      	Alt-c          	cd into sub-directories (recursively searched).
# Alt-Shift-c	Alt-Shift-c    	cd into sub-directories, including hidden ones.
# Ctrl-o     	Alt-o          	Open a file/dir using default editor ($EDITOR)
# Ctrl-g     	Alt-Shift-o    	Open a file/dir using xdg-open or open command
# --- settings
# To use New_Keybindings
set -U FZF_LEGACY_KEYBINDINGS 0

# ================================================================================
#     preset keybindings
# ================================================================================
# key         action
# ------------------
# \cy         yank
# \ey         yank-pop
# -k          right forward-char
# -k          left backward-char
# \e\[C       forward-char
# \e\[D       backward-char
# \e\[1\;5C   forward-word
# \e\[1\;5D   backward-word
# -k          ppage beginning-of-history
# -k          npage end-of-history
# \cx         fish_clipboard_copy
# \cv         fish_clipboard_paste
# \e          cancel
# \t          complete
# \cs         pager-toggle-search
# -k          btab complete-and-search
# \e\n        commandline\ -f\ expand-abbr\;\ commandline\ -i\ \\n
# \e\r        commandline\ -f\ expand-abbr\;\ commandline\ -i\ \\n
# -k          down down-or-search
# -k          up up-or-search
# \e\[A       up-or-search
# \e\[B       down-or-search
# -k          sright forward-bigword
# -k          sleft backward-bigword
# \e\eOC      nextd-or-forward-word
# \e\eOD      prevd-or-backward-word
# \e\e\[C     nextd-or-forward-word
# \e\e\[D     prevd-or-backward-word
# \eO3C       nextd-or-forward-word
# \eO3D       prevd-or-backward-word
# \e\[3C      nextd-or-forward-word
# \e\[3D      prevd-or-backward-word
# \e\[1\;3C   nextd-or-forward-word
# \e\[1\;3D   prevd-or-backward-word
# \e\[1\;9C   nextd-or-forward-word
# \e\[1\;9D   prevd-or-backward-word
# \e\eOA      history-token-search-backward
# \e\eOB      history-token-search-forward
# \e\e\[A     history-token-search-backward
# \e\e\[B     history-token-search-forward
# \eO3A       history-token-search-backward
# \eO3B       history-token-search-forward
# \e\[3A      history-token-search-backward
# \e\[3B      history-token-search-forward
# \e\[1\;3A   history-token-search-backward
# \e\[1\;3B   history-token-search-forward
# \e\[1\;9A   history-token-search-backward
# \e\[1\;9B   history-token-search-forward
# \e.         history-token-search-backward
# \el         __fish_list_current_token
# \eo         __fish_preview_current_file
# \ew         __fish_whatis_current_token
# \cl         echo\ -n\ \(clear\ \|\ string\ replace\ \\e\\\[3J\ \"\"\)\;\ commandline\ -f\ repaint
# \cc         cancel-commandline
# \cu         backward-kill-line
# \cw         backward-kill-path-component
# \e\[F       end-of-line
# \e\[H       beginning-of-line
# \ed         kill-word
# \cd         delete-or-exit
# \es         'fish_commandline_prepend sudo'
# -k          f1 __fish_man_page
# \eh         __fish_man_page
# \ep         __fish_paginate
# \e\#        __fish_toggle_comment_commandline
# \ee         edit_command_buffer
# \ev         edit_command_buffer
# \e\[I       'emit fish_focus_in'
# \e\[O       false
# \e\[\?1004h false
# -m          paste \e\[200\~ __fish_start_bracketed_paste
# -M          paste \e\[201\~ __fish_stop_bracketed_paste
# -M          paste '' self-insert
# -M          paste \r commandline\ -i\ \\n
# -M          paste \' __fish_commandline_insert_escaped\ \\\'\ \$__fish_paste_quoted
# -M          paste \\ __fish_commandline_insert_escaped\ \\\\\ \$__fish_paste_quoted
# -M          paste ' ' self-insert-notfirst
# ''          self-insert
# '           ' self-insert expand-abbr
# ';'         self-insert expand-abbr
# '|'         self-insert expand-abbr
# '&'         self-insert expand-abbr
# ^           self-insert expand-abbr
# '>'         self-insert expand-abbr
# '<'         self-insert expand-abbr
# ')'         self-insert expand-abbr
# -k          nul 'commandline -i " "'
# \n          execute
# \r          execute
# \ck         kill-line
# -k          dc delete-char
# -k          backspace backward-delete-char
# \x7f        backward-delete-char
# \e\[1\~     beginning-of-line
# \e\[4\~     end-of-line
# -k          home beginning-of-line
# -k          end end-of-line
# -k          sdc backward-delete-char
# \ca         beginning-of-line
# \ce         end-of-line
# \cp         up-or-search
# \cn         down-or-search
# \cf         forward-char
# \cb         backward-char
# \ct         transpose-chars
# \x1f        undo
# \cz         undo
# \e/         redo
# \et         transpose-words
# \eu         upcase-word
# \ec         capitalize-word
# \e\x7f      backward-kill-word
# \e\b        backward-kill-word
# \eb         backward-word
# \ef         forward-word
# \e\<        beginning-of-buffer
# \e\>        end-of-buffer
# \cr         'commandline | string length -q; and commandline -f history-search-backward'
# \e\         ep fish_clipboard_paste
# bind \co __fzf_find_file
# bind \cr __fzf_reverse_isearch
# bind \ec __fzf_cd
# bind \eC '__fzf_cd --hidden'
# bind \eO __fzf_open
# bind \eo '__fzf_open --editor'

# ================================================================================
#     end of file
# ================================================================================
# [Starship: Cross-Shell Prompt](https://starship.rs/#fish)
# Add the following to the end of ~/.config/fish/config.fish:
starship init fish | source
 
