FROM alpine 
RUN apk add --no-cache bash wget sqlite3 bsdiff libsane tar ar
RUN wget http://downloads.free-erp.de/promet-erp-services_7.0.436_amd64-gtk2.deb --level=7643 
RUN ar p promet-erp-services_7.0.436_amd64-gtk2.deb data.tar.gz | tar -xz