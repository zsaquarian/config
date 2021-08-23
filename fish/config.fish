set fish_path $HOME/.local/share/omf/

source ~/killport.fish
source ~/copy.fish
source ~/sync.fish
alias vim nvim
alias cat bat
alias gvim "neovide --multiGrid"
alias xclip "xclip -selection clipboard"
alias cwd "pwd | xclip"
alias ll "ls -lh"
alias l "ls -lAh"
alias pandoc "pandoc --reference-doc ~/custom-reference.docx -s"
alias tm "tmux"
alias open "mimeopen"
set fish_plugins bang-bang

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --ignore-vcs'
set -x FZF_DEFAULT_OPTS '--height 96% --reverse'
set -x DENO_INSTALL ~/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
set -Ux PYENV_ROOT $HOME/git/pyenv
set -x fish_user_paths $ANDROID_HOME/platform-tools $PYENV_ROOT/bin
set -x JAVA_HOME /usr/lib/jvm/java-14-openjdk-amd64
# add  stuff installed with yarn to path
set PATH "$PATH:"(yarn global bin)""

pyenv init - | source
if status is-interactive
  mcfly init fish | source
  mcfly_key_bindings
end
# starship init fish | source

