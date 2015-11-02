# OrientDB with nkf-Data
#
# VERSION: see `TAG`
# FROM thoma5B/nkf

FROM joaodubas/openjdk:latest
MAINTAINER Thomas Bunke "thomas@bunke.consulting"

# prepare OS

RUN apt-get -y update && apt-get -y upgrade\
    && apt-get install -y p7zip-full wget tree

# install orientdb

ENV ORIENTDB_VERSION orientdb-community-2.1.2
ENV ORIENTDB_URL http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=${ORIENTDB_VERSION}.tar.gz&os=linux
ENV ORIENTDB_ROOT_PASSWORD 0r13ntDB
WORKDIR /usr/local/src
RUN wget ${ORIENTDB_URL} -O orientdb-community.tar.gz
RUN tar -xzf orientdb-community.tar.gz
RUN ln -s ${ORIENTDB_VERSION} orientdb
RUN cp orientdb/bin/orientdb.sh /etc/init.d/ # && ls  /usr/local/bin/
RUN sed -i "s|YOUR_ORIENTDB_INSTALLATION_PATH|/usr/local/src/${ORIENTDB_VERSION}|;s|USER_YOU_WANT_ORIENTDB_RUN_WITH|root|" /etc/init.d/orientdb.sh
RUN update-rc.d orientdb.sh defaults

#RUN cat /etc/init.d/orientdb.sh
RUN rm orientdb-community.tar.gz

RUN mkdir /usr/local/log

# load database for nkf

ENV DB_DUMP_FILE nkf_db.7z
RUN mkdir databases
#RUN find . -name "${DB_DUMP_FILE}"
COPY ./dist/${DB_DUMP_FILE} databases/
# RUN echo "current dir:" && tree
RUN 7z x databases/${DB_DUMP_FILE}
RUN rm databases/${DB_DUMP_FILE}
RUN mkdir orientdb/databases/nkf
RUN mv nkf_db/* -t orientdb/databases/nkf


# RUN /etc/init.d/orientdb.sh start

# configure system
EXPOSE 2424
EXPOSE 2480

CMD ["/bin/sh", "-c", "/etc/init.d/orientdb.sh start && /bin/bash"]

# run by
# docker run -t -d --name orientdb_nkf -p 2424:2424 -p 2480:2480 thoma5b/orientdb_nkf
