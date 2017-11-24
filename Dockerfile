FROM alpine 
RUN apk add --no-cache bash wget tar gcc xz postgresql-client mysql-client sqlite gdk-pixbuf glib gtk+2.0 xvfb && \
RUN wget http://downloads.free-erp.de/promet-erp-services_7.0.437_amd64-gtk2.deb --level=1343
RUN ar p promet-erp-services_7.0.437_amd64-gtk2.deb data.tar.xz | tar -xJ && \
    rm promet-erp-services_7.0.437_amd64-gtk2.deb && \
    apk del wget tar gcc xz
#RUN ls /usr/lib
EXPOSE 8085
VOLUME ["/usr/lib/promet-erp/web"]
COPY entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
