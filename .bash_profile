alias ls='ls -G'
alias ll='ls -l'
alias vim='mvim -v'

PATH=~/bin:$PATH:/usr/local/sbin:~/Library/Python/2.7/bin

#function iterm2_print_user_vars() {
#  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
#}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[0;32m\]"


parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

set_prompt() {
	GIT_COLOR=$NORMAL

	if test -z "$(git status --short 2> /dev/null)"
		then
			GIT_COLOR=$GREEN
		else
			GIT_COLOR=$RED
	fi

	PS1="\W$GIT_COLOR\$(parse_git_branch)$NORMAL $ "
	if [[ $EUID == 0 ]] ; then
		PS1="\W $RED\u$ $NORMAL"
	fi
}

export PROMPT_COMMAND=set_prompt

export EDITOR=vim
