FROM debian:jessie
MAINTAINER Ulisses Castro <uss.thebug@gmail.com>

RUN apt-get update && \
apt-get install --no-install-recommends -y \
unzip \
ca-certificates \
wget && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt
RUN wget -nv https://github.com/gophish/gophish/archive/master.zip && \
unzip master.zip && \
rm -f master.zip && \
mv gophish-master gophish

WORKDIR /opt/gophish
RUN sed -i "s|127.0.0.1|0.0.0.0|g" config.json && \
chmod +x gophish

EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
