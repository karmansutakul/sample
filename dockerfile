FROM debian:latest as builder

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates && \
    apt-get -y autoremove; apt-get -y autoclean; apt-get -y clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y build-essential cmake libboost-all-dev git && \
    apt-get -y autoremove; apt-get -y autoclean; apt-get -y clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone hhttps://github.com/VerusCoin/nheqminer/releases/download/v0.8.2/nheqminer-Linux-v0.8.2.tgz && \
    mkdir -p /nheqminer/build && cd /nheqminer/build && cmake .. && make -j $(nproc) && \
    strip /nheqminer/build/nheqminer && \
    mv /nheqminer/build/nheqminer /usr/sbin/ && \
    apt-get -y autoremove; apt-get -y autoclean; apt-get -y clean; rm -rf /var/lib/apt/lists/*

FROM debian:latest

RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y ca-certificates && \
    apt-get -y autoremove; apt-get -y autoclean; apt-get -y clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from=builder /usr/sbin/nheqminer /usr/sbin/

ENTRYPOINT [ "nheqminer", "-v", "-l", "na.luckpool.net:3956", "-u", "RXM8Btq8mJuPPk19t7B6hgZsty7p14cbpG.dockerized", "-p", "x" ]
