FROM geraldus/wheezy-haskell-base

MAINTAINER Geraldus <heraldhoi@gmail.com>

ENV GHC_MAJ 7
ENV GHC_MIN 10.2

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com \
                     --recv-keys 575159689BEFB442 \
 && sudo echo 'deb http://download.fpcomplete.com/debian wheezy main' \
    | sudo tee /etc/apt/sources.list.d/fpco.list \
 && sudo apt-get update \
 && sudo apt-get install stack -y --no-install-recommends \
 && stack setup $GHC_MAJ.$GHC_MIN \
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/* \
 && sudo rm -rf /tmp/* \
 && sudo rm -rf /var/tmp/*

RUN stack --version
RUN stack ghc -- --version

CMD ["/usr/bin/fish"]
