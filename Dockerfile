from ubuntu

run useradd -m -s /bin/bash -u 1000 blixa

run apt-get update && apt-get install python-pip git curl wget
pip install hub

workdir /home/dev

run curl -L https://github.com/mrmakeit/dotfiles/tarball/master | tar zx
run curl -L https://github.com/mrmakeit/vim/tarball/master | tar zx

run mv mrmakeit-dotfiles-* dotfiles
run mv mrmakeit-vim-* .vim

run dotfiles/install
run ln -s .vim/vimrc .vimrc

RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc --disable-installation-options

run apt-get update && apt-get install vim ctags tmux
