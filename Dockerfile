FROM geraldus/wheezy-haskell-base

MAINTAINER Geraldus <heraldhoi@gmail.com>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 575159689BEFB442 \
 && echo 'deb http://download.fpcomplete.com/debian wheezy main' \
    | tee /etc/apt/sources.list.d/fpco.list \
 && apt-get update \
 && apt-get install stack -y --no-install-recommends

USER stack

CMD ["/usr/bin/fish"]
