# PATH settings
export PATH="$HOME/bin:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/koichi/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker macos)

# ================================================================================
#     Add a plugin for using vim mode in terminal
# ================================================================================
# ------------------------------------------------------------
#     Installation
# ------------------------------------------------------------
# https://github.com/jeffreytse/zsh-vi-mode
# Keep in mind that plugins need to be added before oh-my-zsh.sh is sourced.
# ------------------------------------------------------------
#     Usage
# ------------------------------------------------------------
# In Normal mode you can use vv to edit current command line in an editor 
# (e.g. vi/vim/nvim...), because it is bound to the Visual mode.
# You can change the editor by ZVM_VI_EDITOR option, by default it is $EDITOR.
# ------------------------------------------------------------
#     Surround
# ------------------------------------------------------------
# S" : Add " for visual selection
# ys" : Add " for visual selection
# cs"' : Change " to '
# ds" : Delete " 
# ------------------------------------------------------------
#     Increment and Decrement
# ------------------------------------------------------------
#  inc: ctrl-a 
#  dec: ctrl-x 
# - Number   (Decimal, Hexadecimal, Binary...)
# - Boolean  (True or False, Yes or No, On or Off...)
# - Weekday  (Sunday, Monday, Tuesday, Wednesday...)
# - Month    (January, February, March, April, May...)
# - Operator (&&, ||, ++, --, ==, !==, and, or...)
# ------------------------------------------------------------
#     Import this plugin
# ------------------------------------------------------------
plugins+=(zsh-vi-mode)
# ------------------------------------------------------------
#     Custom key bindings
# ------------------------------------------------------------
# zvm_bindkey <keymap> <keys> <widget>

source $ZSH/oh-my-zsh.sh
# ================================================================================
#     basic settings
# ================================================================================
# ------------------------------------------------------------
#     Tips
# ------------------------------------------------------------
# [Moving to zsh, part 3: Shell Options – Scripting OS X](https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/)
# Listing the existing shell options:
# % setopt
# Listing all the shell options:
# % emulate -lLR zsh
# find out all zsh options:
# % man zshoptions
# ------------------------------------------------------------
#     settings 
# ------------------------------------------------------------
# case insensitive globbing
setopt NO_CASE_GLOB
# change directory automatically
setopt AUTO_CD
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
# 環境変数
# export LANG=ja_JP.UTF-8

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# a:append ( Append some text with no text erased )
alias a=">> "
alias dpa="docker ps -a"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias calibre="/Applications/calibre.app/Contents/MacOS/"
alias vn="code -n" # Open vscode in new window
alias vr="code -r" # Open a file in current vscode window
alias zshrc="vi ~/.zshrc"
alias vimrc="vi ~/.vimrc"
alias ldd="l -d */" # Show only directory

# ================================================================================
#     FZF
# ================================================================================
# https://github.com/junegunn/fzf
# ------------------------------------------------------------
#     Installation
# ------------------------------------------------------------
# ------------------------------------------------------------
#     Key bindings for command-line
# ------------------------------------------------------------
# CTRL-T - Paste the selected files and directories onto the command-line
# Set FZF_CTRL_T_COMMAND to override the default command
# Set FZF_CTRL_T_OPTS to pass additional options
# CTRL-R - Paste the selected command from history onto the command-line
# If you want to see the commands in chronological order, press CTRL-R again which toggles sorting by relevance
# Set FZF_CTRL_R_OPTS to pass additional options
# ALT-C - cd into the selected directory
# Set FZF_ALT_C_COMMAND to override the default command
# Set FZF_ALT_C_OPTS to pass additional options 
# ------------------------------------------------------------
#     FZF default settings
# ------------------------------------------------------------
# --files      List files that would be searched but do not search
# --no-ignore  Do not respect .gitignore, etc...
# --hidden     Search hidden files and folders
# --follow     Follow symlinks
# --glob       Additional conditions for search (in this case ignore everything in the .git/ folder)
# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
#     \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
#         \   fzf#vim#with_preview({'options': '--layout reverse --height=100% --query '.shellescape(<q-args>).' --bind change:first --with-nth=4.. --delimiter=":"'}, 'right:50%'),1)
# ------------------------------------------ https://mattorb.com/the-many-faces-of-fzf/
export FZF_REVERSE_ISEARCH_OPTS='--preview-window=up:10 --preview="echo {}" --height 100%'
# ------------------------------------------------------------
#     Search syntax
# ------------------------------------------------------------
# Unless otherwise specified, fzf starts in "extended-search mode" 
# where you can type in multiple search terms delimited by spaces. 
# e.g. ^music .mp3$ sbtrkt !fire

# Token  	Match_type                	Description
# 'wild  	exact-match                (quoted)	Items that include wild
# ^music 	prefix-exact-match        	Items that start with music
# .mp3$  	suffix-exact-match        	Items that end with .mp3
# !fire  	inverse-exact-match       	Items that do not include fire
# !^music	inverse-prefix-exact-match	Items that do not start with music
# !.mp3$ 	inverse-suffix-exact-match	Items that do not end with .mp3
# ------------------------------------------------------------
#     To use fzf with zsh-vi-mode
# ------------------------------------------------------------
# https://github.com/jeffreytse/zsh-vi-mode#execute-extra-commands
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ================================================================================
#     Set manpager
# ================================================================================
# ------------------------------------------------------------
#     "bat" as manpager
# ------------------------------------------------------------
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# man 2 select
# ------------------------------------------------------------
#     "vim" as manpager
# ------------------------------------------------------------
export MANPAGER='/bin/zsh -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias memo='/usr/bin/git --git-dir=$HOME/.memo/ --work-tree=$HOME'
export PATH="$HOME/git-fuzzy/bin:$PATH"
alias memo_fuzzy='$HOME/git-fuzzy/bin --git-dir=$HOME/.memo/ --work-tree=$HOME'
 
export PATH="/usr/local/bin:$PATH"

# -- Make Vim Default Editor For Git and OS
export VISUAL=vim
export EDITOR="$VISUAL"

# -- Set the editor only for Git.
# export GIT_EDITOR="/usr/local/bin/vim"

# To fix the problem of sending "^?" when Vim is opened by git-fuzzy
# stty erase '^?'

# -- Usage
# $ google <search query>
source $HOME/bin/google_search.sh
# ================================================================================
# 8.4 Bindable Readline Commands
# ================================================================================
# https://www.gnu.org/software/bash/manual/html_node/Bindable-Readline-Commands.html#Bindable-Readline-Commands
#
# To show current zsh key bindings in terminal:
#   $ bindkey
# To show key or key combinations in terminal:
# https://unix.stackexchange.com/questions/76566/where-do-i-find-a-list-of-terminal-key-codes-to-remap-shortcuts-in-bash/76591#76591
#   $ sed -n l
#
# ----------------------------------------------------------------------
# 8.4.1 Commands For Moving
# ----------------------------------------------------------------------
# beginning-of-line   (C-a)
# end-of-line         (C-e)
# forward-char        (C-f)
# backward-char       (C-b)
# forward-word        (M-f)
# backward-word       (M-b)
# shell-forward-word  (M-C-f)
# shell-backward-word (M-C-b)
# clear-display       (M-C-l)
# clear-screen        (C-l)
# ----------------------------------------------------------------------
# 8.4.4 Killing And Yanking
# ----------------------------------------------------------------------

# kill-line                (C-k)
# backward-kill-line       (C-x Rubout)
# unix-line-discard        (C-u)
# kill-whole-line          ()
# kill-word                (M-d)
# backward-kill-word       (M-DEL)
# shell-kill-word          (M-C-d)
# shell-backward-kill-word ()
# shell-transpose-words    (M-C-t)
# unix-word-rubout         (C-w)
# unix-filename-rubout     ()
# delete-horizontal-space  ()
# kill-region              ()
# copy-region-as-kill      ()
# copy-backward-word       ()
# copy-forward-word        ()
# yank                     (C-y)
# yank-pop                 (M-y)
# ----------------------------------------------------------------------
# key bindings
# ----------------------------------------------------------------------
# https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File-Syntax.html
# The following GNU Emacs style escape sequences are available when specifying key sequences:
# \C-: control prefix
# \M-: meta prefix
# \e:  an escape character
# \\:  backslash
# \": a double quotation mark
# \': a single quote or apostrophe
# \a:   alert (bell)
# \b:   backspace
# \d:   delete
# \f:   form feed
# \n:   newline
# \r:   carriage return
# \t:   horizontal tab
# \v:   vertical tab
# \nnn: the eight-bit character whose value is the octal value nnn (one to three digits)
# \xHH: the eight-bit character whose value is the hexadecimal value HH (one or two hex digits)
# ================================================================================
# current zsh emacs key bindings
# ================================================================================
# $ bindkey: show all bindkeys
#
# "^@"  set-mark-command                     # "^V"    quoted-insert
# "^A"  beginning-of-line                    # "^W"    backward-kill-word
# "^B"  backward-char                        # "^X^B"  vi-match-bracket
# "^D"  delete-char-or-list                  # "^X^E"  edit-command-line
# "^E"  end-of-line                          # "^X^F"  vi-find-next-char
# "^F"  forward-char                         # "^X^J"  vi-join
# "^G"  send-break                           # "^X^K"  kill-buffer
# "^H"  backward-delete-char                 # "^X^N"  infer-next-history
# "^I"  fzf-completion                       # "^X^O"  overwrite-mode
# "^J"  accept-line                          # "^X^R"  _read_comp
# "^K"  kill-line                            # "^X^U"  undo
# "^L"  clear-screen                         # "^X^V"  vi-cmd-mode
# "^M"  accept-line                          # "^X^X"  exchange-point-and-mark
# "^N"  down-line-or-history                 # "^X*"   expand-word
# "^O"  accept-line-and-down-history         # "^X="   what-cursor-position
# "^P"  up-line-or-history                   # "^X?"   _complete_debug
# "^Q"  push-line                            # "^XC"   _correct_filename
# "^R"  fzf-history-widget                   # "^XG"   list-expand
# "^S"  history-incremental-search-forward   # "^Xa"   _expand_alias
# "^T"  fzf-file-widget                      # "^Xc"   _correct_word
# "^U"  kill-whole-line                      # "^Xd"   _list_expansions
# "^Xe"  _expand_word                        # "^[\"" quote-region
# "^Xg"  list-expand                         # "^[\$" spell-word
# "^Xh"  _complete_help                      # "^['"  quote-line
# "^Xm"  _most_recent_file                   # "^[,"  _history-complete-newer
# "^Xn"  _next_tags                          # "^[-"  neg-argument
# "^Xr"  history-incremental-search-backward # "^[."  insert-last-word
# "^Xs"  history-incremental-search-forward  # "^[/"  _history-complete-older
# "^Xt"  _complete_tag                       # "^[0"  digit-argument
# "^Xu"  undo                                # "^[1"  digit-argument
# "^X~"  _bash_list-choices                  # "^[2"  digit-argument
# "^Y"   yank                                # "^[3"  digit-argument
# "^[^D" list-choices                        # "^[4"  digit-argument
# "^[^G" send-break                          # "^[5"  digit-argument
# "^[^H" backward-kill-word                  # "^[6"  digit-argument
# "^[^I" self-insert-unmeta                  # "^[7"  digit-argument
# "^[^J" self-insert-unmeta                  # "^[8"  digit-argument
# "^[^L" clear-screen                        # "^[9"  digit-argument
# "^[^M" self-insert-unmeta                  # "^[<"  beginning-of-buffer-or-history
# "^[^_" copy-prev-word                      # "^[>"  end-of-buffer-or-history
# "^[ "  expand-history                      # "^[?"  which-command
# "^[!"  expand-history                      
# "^[A"   accept-and-hold                    # "^[[1;5C"  forward-word
# "^[B"   backward-word                      # "^[[1;5D"  backward-word
# "^[C"   capitalize-word                    # "^[[200~"  bracketed-paste
# "^[D"   kill-word                          # "^[[3;5~"  kill-word [same as: control+fn+backspace ]
# "^[F"   forward-word                       # "^[[3~"    delete-char
# "^[G"   get-line                           # "^[[5~"    up-line-or-history
# "^[H"   run-help                           # "^[[6~"    down-line-or-history
# "^[L"   down-case-word                     # "^[[A"     up-line-or-history
# "^[N"   history-search-forward             # "^[[B"     down-line-or-history
# "^[OA"  up-line-or-beginning-search        # "^[[C"     forward-char
# "^[OB"  down-line-or-beginning-search      # "^[[D"     backward-char
# "^[OC"  forward-char                       # "^[[Z"     reverse-menu-complete
# "^[OD"  backward-char                      # "^[_"      insert-last-word
# "^[OF"  end-of-line                        # "^[a"      accept-and-hold
# "^[OH"  beginning-of-line                  # "^[b"      backward-word
# "^[P"   history-search-backward            # "^[c"      fzf-cd-widget
# "^[Q"   push-line                          # "^[d"      kill-word
# "^[S"   spell-word                         # "^[f"      forward-word
# "^[T"   transpose-words                    # "^[g"      get-line
# "^[U"   up-case-word                       # "^[h"      run-help
# "^[W"   copy-region-as-kill                # "^[l"      "ls^J"
# "^[m"           copy-prev-shell-word
# "^[n"           history-search-forward
# "^[p"           history-search-backward
# "^[q"           push-line
# "^[s"           spell-word
# "^[t"           transpose-words
# "^[u"           up-case-word
# "^[w"           kill-region
# "^[x"           execute-named-cmd
# "^[y"           yank-pop
# "^[z"           execute-last-named-cmd
# "^[|"           vi-goto-column
# "^[~"           _bash_complete-word
# "^[^?"          backward-kill-word
# "^_"            undo
# " "             magic-space
# "!"-"~"         self-insert
# "^?"            backward-delete-char
# "\M-^@"-"\M-^?" self-insert
# ------------------------------------------------------------
#     zsh vi mode keybindings
# ------------------------------------------------------------
# "^A" beginning-of-line                  # "^V" vi-quoted-insert                # "^[[D" vi-backward-char
# "^B" backward-char                      # "^W" backward-kill-word              # "^[[F" end-of-line
# "^C" self-insert                        # "^Y" yank                            # "^[[H" beginning-of-line
# "^D" list-choices                       # "^Z" self-insert                     # "^[[Z" reverse-menu-complete
# "^E" end-of-line                        # "^[" zvm_readkeys_handler            # "^[c" fzf-cd-widget
# "^F" forward-char                       # "^[OA" up-line-or-beginning-search   # "^\\\\"-"^\^" self-insert
# "^G" list-expand                        # "^[OB" down-line-or-beginning-search # "^_" undo
# "^H" vi-backward-delete-char            # "^[OC" vi-forward-char               # " "-"~" self-insert
# "^I" fzf-completion                     # "^[OD" vi-backward-char              # "^?" backward-delete-char
# "^J" accept-line                        # "^[OF" end-of-line                   # "\M-^@"-"\M-^?" self-insert
# "^K" zvm_forward_kill_line              # "^[OH" beginning-of-line
# "^L" clear-screen                       # "^[[1;5C" forward-word
# "^M" accept-line                        # "^[[1;5D" backward-word
# "^N" down-line-or-history               # "^[[200~" bracketed-paste
# "^O" self-insert                        # "^[[3;5~" kill-word
# "^P" up-line-or-history                 # "^[[3~" delete-char
# "^Q" vi-quoted-insert                   # "^[[5~" up-line-or-history
# "^R" fzf-history-widget                 # "^[[6~" down-line-or-history
# "^S" history-incremental-search-forward # "^[[A" up-line-or-history
# "^T" fzf-file-widget                    # "^[[B" down-line-or-history
# "^U" zvm_viins_undo                     # "^[[C" vi-forward-char

# ----------------------------------------------------------------------
# https://en.wikipedia.org/wiki/ANSI_escape_code
# ----------------------------------------------------------------------
# <char>                                         -> char
# <esc> <nochar>                                 -> esc
# <esc> <esc>                                    -> esc
# <esc> <char>                                   -> Alt-keypress or keycode sequence
# <esc> '[' <nochar>                             -> Alt-[
# <esc> '[' (<modifier>) <char>                  -> keycode sequence, <modifier> is a decimal number and defaults to 1 (xterm)
# <esc> '[' (<keycode>) (';'<modifier>) '~'      -> keycode sequence, <keycode> and <modifier> are decimal numbers and default to 1 (vt)
#
# ================================================================================
#     [Starship: Cross-Shell Prompt](https://starship.rs/)
# ================================================================================
# The command below must be set at the end of zshrc
eval "$(starship init zsh)"
