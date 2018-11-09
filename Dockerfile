
FROM alpine:latest

#basic packages
RUN apk add --no-cache musl-dev g++ git make python openssl-dev gmp-dev python-dev py2-pip bash
RUN pip install pytoml

# install vim and configuration
RUN apk add --no-cache vim
COPY vimrc /root/.vimrc
COPY vim /root/.vim

#vim link
RUN rm /usr/bin/vi
RUN ln -s /usr/bin/vim /usr/bin/vi

# install scb
COPY scb /usr/bin/
RUN chmod +x /usr/bin/scb

#clean up
RUN rm -rf /var/lib/apt/lists/* 
