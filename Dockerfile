# Storj Share
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

FROM ubuntu
MAINTAINER "Rodrigo Martínez" <dev@brunneis.com>

################################################
# STORJ SHARE
################################################

RUN \
    apt-get update \
    && apt-get -y install apt-utils curl gnupg \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get -y install build-essential git libssl-dev nodejs python vim \
    && npm install --global storjshare-daemon --unsafe-perm \
    && apt-get --purge remove -y apt-utils build-essential curl git libssl-dev python vim \
    && apt autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/npm*

EXPOSE 4000

WORKDIR ~

# storjshare daemon
# storjshare start --config /media/data/config.json
