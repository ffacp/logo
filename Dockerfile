FROM        pierrezemb/gostatic
MAINTAINER  Florian Fröhlich

COPY ./www /public/

ENV HTTP_SERVER_PORT 8080
EXPOSE 8080

USER 1001
