FROM ubuntu:trusty
MAINTAINER Ulisses Castro <uss.thebug@gmail.com>

RUN apt-get update && \
apt-get install --no-install-recommends -y \
ca-certificates \
wget \
build-essential \
git && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src
RUN wget -nv https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz && \
tar -xvf go1.6.linux-amd64.tar.gz && \
rm -fv go1.6.linux-amd64.tar.gz && \
mv go /usr/local/ && \
GOPATH=/opt /usr/local/go/bin/go get github.com/gophish/gophish

WORKDIR /opt/src/github.com/gophish/gophish
RUN GOPATH=/opt /usr/local/go/bin/go build && \
sed -i "s|127.0.0.1|0.0.0.0|g" config.json && \
chmod +x gophish

EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
