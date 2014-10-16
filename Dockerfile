from ubuntu

run apt-get update && apt-get install python-pip git curl wget zip -y
run pip install hub

run useradd -m -s /bin/bash -d /home/dev -u 1000 dev

workdir /home/dev

user dev

env HOME /home/dev

run curl -L https://github.com/mrmakeit/dotfiles/tarball/f6d1ca8 | tar zx
run curl -L https://github.com/mrmakeit/vim/tarball/857ca53 | tar zx

run mv mrmakeit-dotfiles-* /home/dev/dotfiles
run mv mrmakeit-vim-* /home/dev/.vim

run /home/dev/dotfiles/install
run ln -s /home/dev/.vim/vimrc /home/dev/.vimrc


env HOME /home/dev

run mkdir /home/dev/.ssh
run ln -s /home/dev/.persist/src /home/dev/src
run ln -s /home/dev/.persist/config /home/dev/.config

run curl -o /home/dev/.git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

user root

run apt-get update && apt-get install vim ctags tmux docker.io -y

run pip install fig

run chown dev:dev /home/dev/ -R

user dev

add ./bin/ /home/dev/bin/

add .bash_include /home/dev/

entrypoint /bin/bash
