FROM alpine 
RUN apk add --no-cache bash postgresql-client mysql-client sqlite freetype dbus nano && \
  # Workaround musl vs glibc entrypoint for `fpcmkcfg`
  mkdir /lib64 && \
  ln -s /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN apk add --no-cache --virtual .build-deps \
    wget tar gcc xz && \
    wget http://downloads.free-erp.de/promet-erp-services_7.0.438_amd64-gtk2.deb --level=10669 && \
    ar p promet-erp-services_7.0.438_amd64-gtk2.deb data.tar.xz | tar -xJ && \
    rm promet-erp-services_7.0.438_amd64-gtk2.deb && \
    apk del .build-deps

EXPOSE 8085
VOLUME ["/usr/lib/promet-erp/web"]
COPY entrypoint.sh /opt/entrypoint.sh
RUN ["chmod", "+x", "/opt/entrypoint.sh"]
ENTRYPOINT ["/opt/entrypoint.sh"]
