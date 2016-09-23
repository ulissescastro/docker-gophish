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
echo 'export PATH=$PATH:/opt/go/bin' >> /root/.profile && \
echo 'export GOPATH=/opt' >> /root/.profile && \
export PATH=$PATH:/opt/go/bin && \
export GOPATH=/opt && \
source /root/.profile && \
go get github.com/gophish/gophish

WORKDIR /usr/src/src/github.com/gophish/gophish
RUN go build && \
sed -i "s|127.0.0.1|0.0.0.0|g" config.json && \
chmod +x gophish

EXPOSE 3333 80
ENTRYPOINT ["./gophish"]
