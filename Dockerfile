# https://github.com/openfaas/of-watchdog
FROM openfaas/of-watchdog:0.8.2 as watchdog

FROM ubuntu:20.04

RUN set -e

## Install Pack and Idris 2 ##

RUN apt-get update && apt-get install --yes make gcc curl git chezscheme libgmp3-dev

WORKDIR /home/app

RUN groupadd app && useradd -g app app
USER app:app

# Needed for idris2_install script
ENV HOME /home/app

RUN curl -o idris2_install https://raw.githubusercontent.com/stefan-hoeck/idris2-pack/main/install.bash
RUN sh -c "echo 'chezscheme' | bash ./idris2_install"

ENV PATH $HOME/.pack/bin:$PATH

RUN apt-get purge --yes make gcc curl git chezscheme libgmp3-dev && rm -rf /var/lib/apt/lists/*

## OpenFaaS ##

ENV mode="streaming"
ENV fprocess="idris2 ./Index.idr --exec main"

EXPOSE 8080

HEALTHCHECK --interval=2s CMD [ -e /tmp/.lock ] || exit 1

COPY --chown=app --from=watchdog /fwatchdog /usr/bin/fwatchdog
RUN chmod +x /usr/bin/fwatchdog

CMD ["fwatchdog"]
