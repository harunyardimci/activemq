FROM java:8

ENV VERSION="5.11.1" USER="activemq" DATA_PATH="/mnt/data/activemq"

LABEL activemq-version="${VERSION}" desc="Apache ActiveMQ"

EXPOSE 61616 8161

RUN mkdir -p /opt
WORKDIR /opt

RUN curl http://apache.mivzakim.net/activemq/${VERSION}/apache-activemq-${VERSION}-bin.tar.gz | tar -xz
RUN rm -f apache-activemq-${VERSION}-bin.tar.gz

RUN groupadd -r ${USER} && useradd -r -g ${USER} ${USER}
RUN chown -R ${USER}:${USER} apache-activemq-${VERSION}

RUN ln -s apache-activemq-${VERSION} apache-activemq

USER ${USER}

CMD ACTIVEMQ_USER="${USER}" \
    ACTIVEMQ_DATA="${DATA_PATH}" \
    ACTIVEMQ_OPTS_MEMORY="-Xms${JVM_XMS} -Xmx${JVM_XMX}" \
    apache-activemq/bin/activemq console
    
