from ubuntu

run apt-get update && apt-get install python-pip git curl wget zip -y
run pip install hub

run useradd -m -s /bin/bash -d /home/blixa -u 1000 blixa

workdir /home/blixa

user blixa

env HOME /home/blixa

run curl -L https://github.com/mrmakeit/dotfiles/tarball/master | tar zx
run curl -L https://github.com/mrmakeit/vim/tarball/master | tar zx

run mv mrmakeit-dotfiles-* /home/blixa/dotfiles
run mv mrmakeit-vim-* /home/blixa/.vim

run /home/blixa/dotfiles/install
run ln -s /home/blixa/.vim/vimrc /home/blixa/.vimrc

RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/home/blixa/.bashrc --disable-installation-options

user root

run apt-get update && apt-get install vim ctags tmux -y

user blixa
env HOME /home/blixa

run mkdir /home/blixa/src
run mkdir /home/blixa/.ssh

run ssh-keygen -N "" -f /home/blixa/.ssh/idrsa
