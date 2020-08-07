FROM        pierrezemb/gostatic
MAINTAINER  Florian Fröhlich

COPY ./www /srv/http/

ENV HTTP_SERVER_PORT 8080
EXPOSE 8080

