FROM openjdk:11-slim

ENV GOSU_VERSION 1.17.4

RUN apt-get update && \
    apt-get install -y wget unzip && \
    cd /tmp && \
    wget https://repo1.maven.org/maven2/org/gosu-lang/gosu/gosu/$GOSU_VERSION/gosu-$GOSU_VERSION-full.zip \
        -O gosu.zip && \
    unzip gosu.zip && \
    cd gosu-$GOSU_VERSION && \
    mv bin/* /usr/local/openjdk-11/bin && \
    mv lib/* /usr/local/openjdk-11/lib

WORKDIR /code

COPY bin .

CMD "./run.sh"