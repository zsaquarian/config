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
set -x JAVA_HOME /usr/lib/jvm/java-14-openjdk-amd64
# add  stuff installed with yarn and linuxbrew to path
set -x PATH (yarn global bin) $PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin/ $PATH
set -x fish_complete_path /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d $fish_complete_path

if status is-interactive
  mcfly init fish | source
  mcfly_key_bindings
end
# starship init fish | source

