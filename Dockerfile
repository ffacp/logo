FROM        progrium/busybox
MAINTAINER  Florian Fröhlich

RUN opkg-install uhttpd
RUN printf '#!/bin/sh\nset -e\n\nchmod 777 /www\nexec /usr/sbin/uhttpd $*\n' > /usr/sbin/run_uhttpd && chmod 777 /usr/sbin/run_uhttpd

RUN mkdir /www
COPY ./www /www/


EXPOSE 8080

USER 1001

ENTRYPOINT ["/usr/sbin/run_uhttpd", "-f", "-p", "8080", "-h", "/www"]
CMD [""]
