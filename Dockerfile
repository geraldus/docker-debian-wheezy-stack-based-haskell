FROM geraldus/wheezy-haskell-base

MAINTAINER Geraldus <heraldhoi@gmail.com>

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com \
                     --recv-keys 575159689BEFB442 \
 && sudo echo 'deb http://download.fpcomplete.com/debian wheezy main' \
    | sudo tee /etc/apt/sources.list.d/fpco.list \
 && sudo apt-get update \
 && sudo apt-get install stack -y --no-install-recommends \
 && stack setup 7.10.2 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


CMD ["/usr/bin/fish"]
