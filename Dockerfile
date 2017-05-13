FROM alpine 
RUN apk add --no-cache bash wget tar gcc
RUN cd /tmp
RUN wget http://downloads.free-erp.de/promet-erp-services_7.0.436_amd64-gtk2.deb --level=7643 
RUN ar t promet-erp-services_7.0.436_amd64-gtk2.deb
RUN ar p promet-erp-services_7.0.436_amd64-gtk2.deb data.tar.xz | tar xf