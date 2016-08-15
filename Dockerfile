FROM alpine:3.3
MAINTAINER "Mark Chadwick <m.chadwick@gns.cri.nz>"

RUN apk --update upgrade && \
        apk add --update curl gcc libc-dev make && \
        curl --output /tmp/podv5.6.tar.gz http://ds.iris.edu/pub/programs/podv5.6.tar.gz && \
        tar -xvz -C /tmp -f /tmp/podv5.6.tar.gz && \
        cd /tmp/5.6 && \
        find . -name makefile -exec sed -i -e 's/cc/gcc/' {} \; && \
        make && \
        cp pod /usr/bin && \
        apk del curl gcc make && \
        rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/pod"]
