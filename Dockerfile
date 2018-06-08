# Alastria Node
# Copyright (C) 2018 Rodrigo Martínez <dev@brunneis.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM ubuntu:16.04
MAINTAINER "Rodrigo Martínez" <dev@brunneis.com>

################################################
# ALASTRIA NODE
################################################

ARG ALASTRIA_BRANCH=develop

RUN \
    apt-get update && apt-get -y upgrade \
    && apt-get -y install \
        unzip \
        curl \
    && curl -L https://github.com/alastria/alastria-node/archive/$ALASTRIA_BRANCH.zip > $ALASTRIA_BRANCH.zip \
    && unzip $ALASTRIA_BRANCH.zip \
    && rm $ALASTRIA_BRANCH.zip \
    && mv alastria-node-* /opt/alastria \
    && cd /opt/alastria/scripts \
    && sed -i 's/sudo//g' bootstrap.sh \
    && sed -i 's/gopath$//' bootstrap.sh \
    && sed -i 's@~/alastria-node@/opt/alastria@g' init.sh \
    && bash bootstrap.sh \
    && apt-get -y purge \
        unzip \
    && apt-get autoremove \
    && apt-get clean

ENV \
    GOROOT=/usr/local/go \
    GOPATH=$HOME/alastria/workspace \
    PATH=$GOROOT/bin:$GOPATH/bin:/opt/alastria/scripts:$PATH

VOLUME ~/alastria
EXPOSE 9000 21000 21000/udp 22000 41000
WORKDIR /opt/alastria/scripts

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod u+x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
