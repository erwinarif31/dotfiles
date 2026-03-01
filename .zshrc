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

# --- [G]it [S]tatus ---
alias gst='git status -sb' # Verbose is good, but short and branch-aware is faster.

# --- [G]it [A]dd ---
alias ga='git add'
alias gaa='git add --all' # Add all changes, tracked or untracked.
alias gapa='git add --patch' # The real magic. Interactively stage chunks of code.

# --- [G]it [C]ommit ---
alias gcm='git commit -m'
alias gac='git commit -am' # Your existing 'add and commit'
alias gca='git commit --amend --no-edit' # Add staged changes to the previous commit without changing the message.

# --- [G]it [C]heckout / [S]witch ---
alias gco='git checkout'
alias gsw='git switch'     # Modern, safer way to switch branches.
alias gsc='git switch -c'  # Create and switch to a new branch.

# --- [G]it [B]ranch ---
alias gb='git branch'
alias gbd='git branch -D' # Force delete a local branch.

# --- [G]it [F]etch / [P]ull ---
alias gf='git fetch --all --jobs=10' # Fetch from all remotes, and prune deleted branches.
alias gpl='git pull --rebase' # My personal favorite. Pull with rebase to keep a clean, linear history.
alias gpl='git pull --rebase origin' # My personal favorite. Pull with rebase to keep a clean, linear history.

# --- [G]it [P]ush ---
alias gp='git push'
alias gpo='git push origin $(git branch --show-current)'
# THE FIRST PUSH: Push the current branch and set its upstream remote branch. No more copy-pasting!
alias gpsu='git push --set-upstream origin $(git branch --show-current)'

# --- [G]it [L]og ---
alias glo='git log --oneline -n 15' # Your oneline log, but limited to the last 15 commits.
# THE POWER LOG: A beautiful, graphical log of all branches. This is a game-changer.
alias glg='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" --all'

# --- [G]it [D]iff ---
alias gd='git diff'
alias gds='git diff --staged' # Show changes that are staged for the next commit.

# --- [G]it [U]ndo ---
alias gundo='git restore .' # Discard all unstaged changes in the current directory.
alias gunstage='git restore --staged .' # Unstage all staged files.
alias guncommit='git reset --soft HEAD~1' # Undo the last commit, but keep all changes staged. Perfect for quick fixes.

# --- More [G]it ---
# Shows new commits on a target branch (like main) since your current branch was created.
# Usage: gcatchup <target_branch>
gcatchup() {
  # 1. Check for a target branch argument
  if [[ -z "$1" ]]; then
    echo "❗️ Usage: gcatchup <branch_to_check>"
    echo "   Example: gcatchup main"
    return 1
  fi

  # 2. Get branch names
  local target_branch="$1"
  local current_branch
  current_branch=$(git branch --show-current)

  if [[ "$current_branch" == "$target_branch" ]]; then
    echo "🧐 You are already on the '$target_branch' branch."
    return 0
  fi

  # 3. Find the common ancestor (the branch point)
  local merge_base
  merge_base=$(git merge-base "$current_branch" "$target_branch" 2>/dev/null)

  if [[ -z "$merge_base" ]]; then
      echo "❗️ Could not find a common ancestor between '$current_branch' and '$target_branch'."
      return 1
  fi

  # 4. Display the results using the glg format
  echo "🔎 Showing new commits on \033[33m$target_branch\033[0m since you branched off."
  echo "------------------------------------------------------------------------"

  git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)" "$merge_base..$target_branch"
}

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
