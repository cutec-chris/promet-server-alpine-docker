FROM alpine 
RUN apk add --no-cache bash wget tar gcc xz postgresql-client mysql-client sqlite && \
    wget http://downloads.free-erp.de/promet-erp-services_7.0.437_amd64-gtk2.deb --level=12435
#RUN ar t promet-erp-services_7.0.437_amd64-gtk2.deb
RUN ar p promet-erp-services_7.0.437_amd64-gtk2.deb data.tar.xz | tar -xJ && \
    rm promet-erp-services_7.0.437_amd64-gtk2.deb && \
    apk del wget tar gcc xz
#RUN ls /usr/lib
EXPOSE 8085
VOLUME ["/usr/lib/promet-erp/web"]
ENTRYPOINT ["/usr/lib/promet-erp/pappserver"]