# install node.server and plugins and make it run on the available
# orientDB instance on ports 2480 and 2424 that has the nkf-Data
#
# VERSION: see `TAG`
FROM ubuntu:14.04
MAINTAINER Thomas Bunke "thomas@bunke.consulting"


ENV ORIENTDB_HOME  # Installationsverzeichnis von OrientDB = anderer Dockercontainer
ENV NKF_HOME
RUN echo ${NKF_HOME}
    cd ??
    && mkdir /usr/local/log

# configure system
EXPOSE 80
CMD ["grunt","serve"]
