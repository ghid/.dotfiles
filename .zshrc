# Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Expand PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/go/bin:$PATH
export PATH=$PATH:$HOME/.local/bin

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# eval "$(zoxide init --cmd cd zsh)"

# Add in Powerlevel10k
# zinit ice depth=1; zinit light 

# Add zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light ohmyzsh/ohmyzsh

# Load completions
# export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
# zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
# source <(carapace _carapace)
# zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'

# ssh-agent config
zstyle :omz:plugins:ssh-agent lazy yes
zstyle :omz:plugins:ssh-agent quiet yes

# Add snippets
zinit snippet OMZP::git
zinit snippet OMZP::ssh-agent

autoload -Uz compinit && compinit

zinit cdreplay -q

# Set prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Keybindings
bindkey -v
bindkey '^ ' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^H' backward-kill-word

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Indicate vim mode
# function zle-line-init zle-keymap-select {
#     RPS1="${${KEYMAP/vicmd/ }/(main|viins)/}"
#     RPS2=$RPS1
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# Aliases
alias vim=nvim
alias wt=$(which wt.exe)
alias wsl=$(which wsl.exe)
alias clip=$(which clip.exe)
alias l='ls-go -Nant'
alias ll='ls-go -Nantl'
alias mdcd='() { md -p $1 && cd $_ }'
alias ls='ls --color'
alias gi='/mnt/c/Users/srp/AppData/Local/Bin/gi.exe'
alias gu='/mnt/c/Users/srp/AppData/Local/Bin/gu.exe'
alias venn='/mnt/c/Users/srp/AppData/Local/Bin/venn.exe'

eval "$(fzf --zsh)"

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null

# Set JAVA_HOME for DbVisualizer
export INSTALL4J_JAVA_HOME=$HOME/.sdkman/candidates/java/21.0.5-tem
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# Set EDITOR
export EDITOR=nvim

# if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
#     eval $(ssh-agent) > /dev/null
#     if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
#         # Auto-add ssh keys to your ssh agent
#         # Example:
#         # ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
#     fi
# fi
# See: https://www.tomaszmik.us/2020/09/21/auto-start-ssh-agent-zsh/

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Add zsh-syntax-highlighting plugin (has to be near the end of .zshrc)
zinit light zsh-users/zsh-syntax-highlighting
