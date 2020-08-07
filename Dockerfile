FROM        progrium/busybox
MAINTAINER  Florian Fröhlich

RUN opkg-install uhttpd
RUN printf '#!/bin/sh\nset -e\n\nchmod 755 /www\nexec /usr/sbin/uhttpd $*\n' > /usr/sbin/run_uhttpd && chmod 755 /usr/sbin/run_uhttpd

RUN mkdir /www
COPY ./www /www/

RUN find /www -exec chown mongodb:0 {} \; && find /www -exec chmod g+rw {} \; && find /www -type d -exec chmod g+x {} +

EXPOSE 8080

USER 1001

ENTRYPOINT ["/usr/sbin/run_uhttpd", "-f", "-p", "8080", "-h", "/www"]
CMD [""]
