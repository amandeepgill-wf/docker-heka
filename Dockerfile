FROM ubuntu:14.04
MAINTAINER "Amandeep Gill <amandeep.gill@workiva.com>"

# make sure apt-get is up-to-date
RUN apt-get update && apt-get upgrade -y && apt-get update -qqy

# install heka dependencies except go lang
RUN apt-get -y --force-yes install \
        build-essential \
        bzr \
        cmake \
        curl \
        git \
        libprotobuf-dev \
        mercurial \
        patch \
        protobuf-compiler

# install go lang
RUN curl -s https://storage.googleapis.com/golang/go1.3.linux-amd64.tar.gz | \
            tar -v -C /usr/local/ -xz

# create go workspace
RUN mkdir /go

# path stuff
ENV PATH $PATH:/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/go/bin
ENV GOPATH /go
ENV GOROOT /usr/local/go

# install heka
RUN mkdir -p /go/src/github.com/mozilla-services/heka && \
    git clone https://github.com/mozilla-services/heka \ 
        /go/src/github.com/mozilla-services/heka && \
    cd /go/src/github.com/mozilla-services/heka && \
    ./build.sh

# install packages to build
RUN go get code.google.com/p/go-uuid/uuid \
            code.google.com/p/gomock/mockgen \
            code.google.com/p/goprotobuf/protoc-gen-go \
            github.com/bbangert/toml \
            github.com/crankycoder/xmlpath \
            github.com/rafrombrc/go-notify \
            github.com/rafrombrc/whisper-go/whisper \
            github.com/streadway/amqp

RUN cd /go/src/github.com/mozilla-services/heka/build && \ 
    make deb && \
    dpkg -i /go/src/github.com/mozilla-services/heka/build/heka_*.deb

# add config file
ADD ./hekad.toml /etc/hekad.toml

# expose ports
EXPOSE 8128/udp

# run heka
ENTRYPOINT ["hekad"]
CMD ["-config=/etc/hekad.toml"]
