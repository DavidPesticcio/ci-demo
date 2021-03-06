FROM debian:jessie

LABEL maintainer "Chris"

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    python &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY main.sh /
RUN chmod +x /main.sh
RUN mkdir /www

EXPOSE 80

WORKDIR /www

ENTRYPOINT ["/main.sh"]