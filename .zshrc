# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export PATH=$PATH:$HOME/go/bin
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH=$PATH:~/go/bin

export PATH="$HOME/.local/bin:$PATH"


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugin
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completion
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# keybinding
bindkey -e
bindkey '^p' history-search-backward
bindkey -s "^k" "tmux_sessionizer\n"
bindkey '^n' history-search-forward

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

# style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias gst='git status'
alias gcm='git commit -m'
alias gco='git checkout'
alias gf='git fetch'
alias gpl='git pull'
alias gp='git push'
alias gpo='git push origin'
alias glo='git log --oneline'
alias ga='git add'
alias gac='git commit -am'

alias dcup='docker compose up -d'
alias dlog='docker logs -f'
alias dps='docker ps'
alias dstop='docker stop'
alias drm='docker rm'
alias dcdown='docker compose down'

alias ta='tmux attach'
alias td='tmux detach'

# PERSONAL
cpr() {
    if [ -z "$1" ]; then
        echo "Usage: compile_and_run <filename.cpp>"
        return 1
    fi
    local filename=$(basename -- "$1")
    filename="${filename%.*}"
    g++ -o "$filename" "$1" 2>compile_errors.log
    if [ $? -eq 0 ]; then
        ./"$filename"
    else
        cat compile_errors.log
    fi
    rm -f compile_errors.log
}

comp() {
    # Check if a filename is provided
    if [ -z "$1" ]; then
        echo "Usage: create_cpp_template <filename.cpp>"
        return 1
    fi

    # Create the file and add the C++ template
    cat <<EOL > "$1"
#include <bits/stdc++.h>
using namespace std;

typedef long long ll;
typedef pair<int, int> pii;
typedef vector<int> vi;
typedef vector<ll> vll;

#define fast_io ios::sync_with_stdio(0); cin.tie(0);
#define all(v) (v).begin(), (v).end()
#define pb push_back
#define mp make_pair
#define fi first
#define se second
#define FOR(i, a, b) for (int i = (a); i < (b); ++i)
#define FORD(i, a, b) for (int i = (a); i >= (b); --i)

const int INF = 1e9;
const ll MOD = 1e9 + 7;
const double EPS = 1e-9;

int main() {
    fast_io;
    cin >> t;
    while (t--) {
        solve();
    }
    return 0;
}

void solve() {

}
EOL

    echo "Created $1 with the competitive programming template."
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# if [ -f ~/.dircolors ]; then
#     eval "$(dircolors -b ~/.dircolors)"
# fi
# export LS_COLORS=$(echo $LS_COLORS | sed 's/ln=[^:]*:/ln=:/')
# alias ls='ls --color=auto'


export PATH=$PATH:/home/winny/.spicetify
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
