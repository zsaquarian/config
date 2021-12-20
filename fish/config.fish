set fish_path $HOME/.local/share/omf/

source ~/killport.fish
source ~/copy.fish
source ~/sync.fish
alias vim vmux
alias cat bat
alias gvim "neovide --multiGrid"
alias xclip "xclip -selection clipboard"
alias cwd "pwd | xclip"
alias ll "ls -lh"
alias l "ls -lAh"
alias panppt "pandoc --reference-doc ~/custom-reference.pptx -s"
alias pandoc "pandoc --reference-doc ~/custom-reference.docx -s"
alias tm "tmux"
alias open "mimeopen"
alias monitor "alacritty --config-file /home/nahos/.config/alacritty/btop.yml"
set fish_plugins bang-bang

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --ignore-vcs'
set -x FZF_DEFAULT_OPTS '--height 96% --reverse'
set -x DENO_INSTALL ~/.deno
set -x JAVA_HOME /usr/lib/jvm/java-14-openjdk-amd64
# add  stuff installed with yarn, linuxbrew and rust to path
set -x PATH (yarn global bin) $PATH
set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
set -x PATH /home/nahos/.cargo/bin $PATH
set -x PATH /usr/local/go/bin $PATH
set -x PATH /home/nahos/go/bin $PATH
set -x PATH /home/nahos/Android/Sdk/platform-tools $PATH

# add PKG_CONFIG_PATH
set -x PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig
set -x PKG_CONFIG_PATH /usr/share/pkgconfig $PKG_CONFIG_PATH

if status is-interactive
  mcfly init fish | source
  mcfly_key_bindings
end
# starship init fish | source

