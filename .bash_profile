# don't want to have two separate files for login/non-login shells
# rvm needs terminal to be a login shell
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

#http://unix.stackexchange.com/questions/38402/aliases-and-tmux/38475#38475
#case $- in *i*) . ~/.bashrc;; esac
