FROM ubuntu:bionic
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    curl \
    make \
    screen

WORKDIR /root
RUN wget -o ./minergate.deb
RUN dpkg -i minergate.deb

minergate-cli --user "fewa342rwr@tutanota.com" --xmr 2