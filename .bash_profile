# Load the shell dotfiles, and then some:
for file in ~/.dotfiles/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Ensure brew environment is properly set up
eval "$(/opt/homebrew/bin/brew shellenv)"

# Everything below is for interactive human sessions only

# Load bash prompt (24ms)
[ -r ~/.dotfiles/.bash_prompt ] && [ -f ~/.dotfiles/.bash_prompt ] && source ~/.dotfiles/.bash_prompt

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for Bash commands installed by brew
export BASH_COMPLETIONS_FOLDER="$(brew --prefix)/etc/bash_completion.d"
for completion_file in $BASH_COMPLETIONS_FOLDER/*; do
  source "$completion_file"
done

# Enable tab completion for shortened commands
complete -o default -o nospace -F __git_complete g
complete -o default -o nospace -F _docker d
complete -o default -o nospace -F __start_kubectl k
complete -o default -o nospace -F _tmux x

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Add tab completion for the AWS CLI
complete -C aws_completer aws

# Load iTerm integrations
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# NVM activation (277ms)
# export NVM_DIR="$(brew --prefix nvm)"
# source "$NVM_DIR/nvm.sh"

# Jabba activation (137ms)
# [ -s "/opt/homebrew/opt/jabba/jabba.sh" ] && source "/opt/homebrew/opt/jabba/jabba.sh"
