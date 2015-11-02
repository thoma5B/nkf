# OrientDB with nkf-Data
#
# VERSION: see `TAG`
# FROM thoma5B/nkf
MAINTAINER Thomas Bunke "thomas@bunke.consulting"

# install orientdb


ENV ORIENTDB_VERSION orientdb-community-2.1.2
ENV ORIENTDB_URL http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=${ORIENTDB_VERSION}.tar.gz&os=linux
ENV ORIENTDB_ROOT_PASSWORD 0r13ntDB
ADD ${ORIENTDB_URL} /usr/local/src/orientdb-community.tar.gz
RUN cd /usr/local/src \
    && tar -xzf orientdb-community.tar.gz \
    && ln -s ${PWD}/${ORIENTDB_VERSION} ${PWD}/orientdb \
    && ln -s ${PWD}/orientdb/bin/* /usr/local/bin/ \
    && rm ${PWD}/orientdb-community.tar.gz \
    && mkdir /usr/local/log

# configure system
EXPOSE 2424
EXPOSE 2480

ENV DB_DUMP_FILE dist/nkf_db.7z
RUN apt-get install -y unzip \
    && ls ${PWD} \
    && unzip ${DB_DUMP_FILE} -d ${PWD}/orientdb/databases

CMD ["/usr/local/bin/server.sh"]
