#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lash'

# with full path (\w)
#PS1="\[\e[1;34m\]\u\[\e[1;33m\]\w\[\033[m\]\[\e[1;35m\]($(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\e[0;37m\]\$ "

# with current dir only (\W) blue yellow magenta white
PS1="\[\e[1;34m\]\u \[\e[1;33m\]\W\[\033[m\]\[\e[1;35m\]($(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\e[0;37m\]\$ "


PATH="/usr/bin/:/usr/local/bin:/usr/local/bin/Shell-tools:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/katja/.gem/ruby/2.1.0/bin"
export PATH

# added by travis gem
[ -f /home/katja/.travis/travis.sh ] && source /home/katja/.travis/travis.sh

# \d : the date in "Weekday Month Date" format (e.g., "Tue May 26")
# \D{format} : the format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required
# \e : an ASCII escape character (033)
# \h : the hostname up to the first '.'
# \H : the hostname
# \j : the number of jobs currently managed by the shell
# \l : the basename of the shell?s terminal device name
# \n : newline
# \r : carriage return
# \s : the name of the shell, the basename of $0 (the portion following the final slash)
# \t : the current time in 24-hour HH:MM:SS format
# \T : the current time in 12-hour HH:MM:SS format
# \@ : the current time in 12-hour am/pm format
# \A : the current time in 24-hour HH:MM format
# \u : the username of the current user
# \v : the version of bash (e.g., 2.00)
# \V : the release of bash, version + patch level (e.g., 2.00.0)
# \w : the current working directory, with $HOME abbreviated with a tilde
# \W : the basename of the current working directory, with $HOME abbreviated with a tilde
# \! : the history number of this command
# \# : the command number of this command
# \$ : if the effective UID is 0, a #, otherwise a $
# \nnn : the character corresponding to the octal number nnn
# \\ : a backslash
# \[ : begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
# \] : end a sequence of non-printing characters