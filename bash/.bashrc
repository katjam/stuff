#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lash'
alias ss='systemctl suspend'
alias ci3lock="i3lock -c 000000"
alias chrome='chromium'
alias poetry='~/.poetry/bin/poetry'

alias phpunit='./vendor/bin/phpunit'
alias scanpng='scanimage --device "pixma:MG6400_192.168.0.11" --format=png >'
alias scanjpg='scanimage --device "pixma:MG6400_192.168.0.11" --format=jpeg >'
alias grepsrc='grep -r --exclude-dir=storage --exclude-dir=node_modules --exclude-dir=vendor --exclude-dir=.git --exclude-dir=build --exclude-dir=elm-stuff'

alias setclickpad='xinput set-prop "SYNA2393:00 06CB:CD48 Touchpad" "libinput Click Method Enabled" 0 1'

# Start ssh-agent NOT working 
#if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
#fi
#if [[ ! "$SSH_AUTH_SOCK" ]]; then
#    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
#fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# Add keys in a list e.g.
#eval $(keychain --eval --quiet hujam id_rsa katjam)
eval $(keychain --eval --quiet hujam)

# with full path (\w)
#PS1="\[\e[1;34m\]\u\[\e[1;33m\]\w\[\033[m\]\[\e[1;35m\]($(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\e[0;37m\]\$ "

# with current dir only (\W)
#PS1="\[\e[1;94m\]\u \[\e[1;33m\]\W\[\033[m\]\[\e[1;32m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\e[0;37m\]\$ "
PS1="\[\e[1;12m\]\u \[\e[1;33m\]\W\[\033[m\]\[\e[1;32m\](\$(git branch 2>/dev/null | grep '^*' | colrm 1 2))\[\e[0;36m\]\$ "

# BROKEN - try to truncate git branch name
#truncgitbranch=$(git branch 2>/dev/null | grep '^*' | cut -c -10 | colrm 1 2);
#PS1="\[\e[1;12m\]\u \[\e[1;33m\]\W\[\033[m\]\[\e[1;32m\](\$truncgitbranch)\[\e[0;36m\]\$ "

# di directories; ow otherwritable (777)
# bold, orange; bold purple on turquoise
LS_COLORS=$LS_COLORS:'di=01;33:ow=01;35;106:' ; export LS_COLORS

FONT="pango:hack"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"

PATH="/home/katja/.local/bin:/usr/bin/:/usr/local/bin:/usr/local/bin/Shell-tools:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/katja/.config/composer/vendor/bin:$GEM_HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/tools:/usr/local/anaconda/bin:$HOME/.symfony/bin"
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

# git bash-completion
source /usr/share/git/completion/git-completion.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cdnvm() {
    cd "$@";
    nvm_path=$(nvm_find_up .nvmrc | tr -d '\n')

    # If there are no .nvmrc file, use the default nvm version
    if [[ ! $nvm_path = *[^[:space:]]* ]]; then

        declare default_version;
        default_version=$(nvm version default);

        # If there is no default version, set it to `node`
        # This will use the latest version on your machine
        if [[ $default_version == "N/A" ]]; then
            nvm alias default node;
            default_version=$(nvm version default);
        fi

        # If the current version is not the default version, set it to use the default version
        if [[ $(nvm current) != "$default_version" ]]; then
            nvm use default;
        fi

        elif [[ -s $nvm_path/.nvmrc && -r $nvm_path/.nvmrc ]]; then
        declare nvm_version
        nvm_version=$(<"$nvm_path"/.nvmrc)

        declare locally_resolved_nvm_version
        # `nvm ls` will check all locally-available versions
        # If there are multiple matching versions, take the latest one
        # Remove the `->` and `*` characters and spaces
        # `locally_resolved_nvm_version` will be `N/A` if no local versions are found
        locally_resolved_nvm_version=$(nvm ls --no-colors "$nvm_version" | tail -1 | tr -d '\->*' | tr -d '[:space:]')

        # If it is not already installed, install it
        # `nvm install` will implicitly use the newly-installed version
        if [[ "$locally_resolved_nvm_version" == "N/A" ]]; then
            nvm install "$nvm_version";
        elif [[ $(nvm current) != "$locally_resolved_nvm_version" ]]; then
            nvm use "$nvm_version";
        fi
    fi
}
alias cd='cdnvm'
cd $PWD
