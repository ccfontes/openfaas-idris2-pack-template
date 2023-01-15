FROM ubuntu:20.04

RUN set -e
 
RUN apt-get update && apt-get install --yes make gcc curl git chezscheme libgmp3-dev

WORKDIR /opt/idris2

ENV HOME /root

RUN curl -o idris2_install https://raw.githubusercontent.com/stefan-hoeck/idris2-pack/main/install.bash
RUN sh -c "echo 'chezscheme' | bash ./idris2_install"

ENV PATH $HOME/.pack/bin:$PATH

RUN apt-get purge --yes make gcc curl git chezscheme libgmp3-dev && rm -rf /var/lib/apt/lists/*
