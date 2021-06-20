alias vsn='vagrant snapshot'
alias mtr='mtr --curses'
alias ls='ls --color'
alias lh='ls -Ahl --color'
alias grep='grep --color=auto'
alias ..='cd ..'

PS1="\[\033[1;33;1;32m\]\u@\h:\[\033[1;31m\]\w \[\033[00;32m\]\$(git_branch)\[\033[00m\]\$ \[\033[0m\]\[\033[0m\] "
 

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

git_branch() {
	  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
  }
