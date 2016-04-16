FROM alpine:3.3
MAINTAINER "Mark Chadwick <m.chadwick@gns.cri.nz>"

RUN apk --update upgrade && \
        apk add --update gcc libc-dev make && \
        rm -rf /var/cache/apk/*

ADD http://ds.iris.edu/pub/programs/podv5.6.tar.gz /tmp/podv5.6.tar

RUN tar -xv -C /tmp -f /tmp/podv5.6.tar && \
        cd /tmp/5.6 && \
        find . -name makefile -exec sed -i -e 's/cc/gcc/' {} \; && \
        make && \
        cp pod /usr/bin

ENTRYPOINT ["/usr/bin/pod"]
