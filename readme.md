http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

For example, let’s say you want to manage the configuration for Bash, VIM and Uzbl. Bash has a couple files in the top-level directory; VIM typically has your .vimrc file on the top-level and a .vim directory; and Uzbl has files in ${XDG_CONFIG_HOME}/uzbl and ${XDG_DATA_HOME}/uzbl. So, your home directory looks like this:

home/
    brandon/
        .config/
            uzbl/
                [...some files]
        .local/
            share/
                uzbl/
                    [...some files]
        .vim/
            [...some files]
        .bashrc
        .bash_profile
        .bash_logout
        .vimrc
You would then create a dotfiles subdirectory and move all the files there:

home/
    /brandon/
        .config/
        .local/
            .share/
        dotfiles/
            bash/
                .bashrc
                .bash_profile
                .bash_logout
            uzbl/
                .config/
                    uzbl/
                        [...some files]
                .local/
                    share/
                        uzbl/
                            [...some files]
            vim/
                .vim/
                    [...some files]
                .vimrc
Then, perform the following commands:

$ cd ~/dotfiles
$ stow bash
$ stow uzbl
$ stow vim
And, voila, all your config files (well, symbolic links to them) are all in the correct place.
