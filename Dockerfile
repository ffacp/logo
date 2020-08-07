FROM        progrium/busybox
MAINTAINER  Florian Fröhlich

RUN opkg-install uhttpd
RUN printf '#!/bin/sh\nset -e\n\nchmod 755 /www\nexec /usr/sbin/uhttpd $*\n' > /usr/sbin/run_uhttpd && chmod 755 /usr/sbin/run_uhttpd

RUN mkdir /www
COPY ./www /www/
RUN chown 777 /www -R

EXPOSE 8080

USER 1001

ENTRYPOINT ["/usr/sbin/run_uhttpd", "-f", "-p", "8080", "-h", "/www"]
CMD [""]
