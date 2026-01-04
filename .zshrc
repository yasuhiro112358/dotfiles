# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME=""
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colored-man-pages
  command-not-found
  docker
  docker-compose
  npm
  node
  python
  pip
  brew
  macos
  history
  extract
  z
)

source $ZSH/oh-my-zsh.sh

# ============================================================================
# User configuration (カスタム設定)
# ============================================================================
# 注意: このセクションはOMZの読み込み後に実行されます。
# OMZが既に設定している項目（compinitなど）は重複して設定しないでください。

# ----------------------------------------------------------------------------
# Environment variables
# ----------------------------------------------------------------------------
# LANG/LC_* はシステムのデフォルト設定に従う（明示的な設定なし）

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ----------------------------------------------------------------------------
# History configuration (OMZのデフォルト設定を上書き)
# ----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY              # 履歴展開を実行する前に確認
setopt SHARE_HISTORY            # 履歴を複数のセッション間で共有
setopt HIST_IGNORE_DUPS         # 連続する重複を履歴に記録しない
setopt HIST_IGNORE_ALL_DUPS     # 重複するコマンドを古い方から削除
setopt HIST_IGNORE_SPACE        # スペースで始まるコマンドを履歴に記録しない
setopt HIST_REDUCE_BLANKS       # 余分な空白を削除して履歴に記録
setopt HIST_SAVE_NO_DUPS        # 履歴ファイルに書き込む際、古いコマンドと同じの場合は新しい方を無視
setopt INC_APPEND_HISTORY       # 履歴を即座に追加
setopt EXTENDED_HISTORY         # タイムスタンプと実行時間を履歴に記録

# ----------------------------------------------------------------------------
# Completion configuration (OMZの補完設定を拡張)
# ----------------------------------------------------------------------------
# 注意: compinitはOMZが既に実行しているため、ここではzstyleのみ設定
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # 大文字小文字を区別しない補完
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # 補完候補に色を付ける
zstyle ':completion:*' menu select                       # 補完候補を矢印キーで選択可能に
setopt COMPLETE_IN_WORD         # 単語の途中でもカーソル位置で補完
setopt ALWAYS_TO_END            # 補完後にカーソルを末尾に移動

# ----------------------------------------------------------------------------
# Directory navigation
# ----------------------------------------------------------------------------
setopt AUTO_CD                  # ディレクトリ名だけでcd
setopt AUTO_PUSHD               # cdのたびにディレクトリスタックに追加
setopt PUSHD_IGNORE_DUPS        # ディレクトリスタックに重複を追加しない
setopt PUSHD_SILENT             # pushd/popd時にディレクトリスタックを表示しない

# ----------------------------------------------------------------------------
# Other useful options
# ----------------------------------------------------------------------------
setopt CORRECT                  # コマンドのスペルチェック
setopt NO_BEEP                  # ビープ音を無効化
setopt INTERACTIVE_COMMENTS     # コメントを有効化（#以降をコメントとして扱う）

# ----------------------------------------------------------------------------
# Zsh-specific Aliases (zsh固有のエイリアス)
# ----------------------------------------------------------------------------
# 注意: 共通エイリアスは ~/.aliases に記述
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias reload="source ~/.zshrc"



# ============================================================================
# Development tools and PATH configuration
# ============================================================================

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# .NET SDK
export PATH="$PATH:/usr/local/share/dotnet"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Custom scripts
export PATH="$HOME/bin:$PATH"

# pipx
export PATH="$PATH:/Users/yasuhiro/.local/bin"

# ============================================================================
# External configuration files
# ============================================================================

# Load custom aliases
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
