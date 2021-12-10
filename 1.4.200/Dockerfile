FROM openjdk:11 AS builder

# A merge of:
#  https://github.com/zhilvis/docker-h2
#  https://github.com/zilvinasu/h2-dockerfile
#  https://github.com/oscarfonts/docker-h2

# MAINTAINER Changsu Im <imcxsu@gmail.com>
LABEL maintainer="imcxsu@gmail.com"

ENV DOWNLOAD http://www.h2database.com/h2-2019-10-14.zip

RUN curl ${DOWNLOAD} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip

FROM openjdk:11-jre-slim-buster
COPY --from=builder /opt/h2 /opt/h2
ENV DATA_DIR /opt/h2-data

RUN mkdir -p ${DATA_DIR}

COPY h2.server.properties /root/.h2.server.properties

EXPOSE 81 1521

CMD java -cp /opt/h2/bin/h2*.jar org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR} ${H2_OPTIONS}
