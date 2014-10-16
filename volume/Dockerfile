from ubuntu

run apt-get update && apt-get install wget zip python -y

run mkdir -p /home/dev/.persist/src
run mkdir -p /home/dev/.persist/config

add firsttime /home/dev/.persist/

run chmod +x /home/dev/.persist/firsttime

run wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.zip && unzip google-cloud-sdk.zip -d /home/dev/.persist/ && rm google-cloud-sdk.zip
run /home/dev/.persist/google-cloud-sdk/install.sh --usage-reporting=false --path-update=false --bash-completion=false --rc-path=/home/blixa/.bashrc --disable-installation-options

run wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | NVM_DIR=/home/dev/.persist/nvm bash
run chown 1000:1000 /home/dev/.persist/ -R

volume /home/dev/.persist

