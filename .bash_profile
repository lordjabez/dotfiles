
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/.{path,exports,aliases,functions,extra,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Ensure brew environment is properly set up
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# NVM activation
export NVM_DIR="$(brew --prefix nvm)"
source "$NVM_DIR/nvm.sh"

function aws-profile() {
  if [[ -z "${1}" ]]; then
    profiles=$(grep '\[profile' ~/.aws/config | tr -d '[]' | awk '{print $2}')
    for profile in $profiles; do
      if [[ "${profile}" == "${AWS_PROFILE}" ]]; then
        echo "${profile} *"
      else
        echo "${profile}"
      fi
    done
  else
    export AWS_PROFILE="${1}"
  fi
}

[ -s "/opt/homebrew/opt/jabba/jabba.sh" ] && source "/opt/homebrew/opt/jabba/jabba.sh"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash"
