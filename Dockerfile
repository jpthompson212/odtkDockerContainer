FROM centos:centos7
LABEL Maintainer="jthompson@agi.com"

ADD ODTK7100Linux.zip /tmp/

RUN yum -y install unzip && \
    mkdir -p /app && mkdir -p /app/usr && \
    unzip /tmp/ODTK7100Linux.zip -d /tmp && \
    tar -xvf /tmp/odtk_binaries_v7.1.0_x64.tgz --directory /app/ && \
    tar -xvf /tmp/odtk_data_v7.1.0.tgz --directory /app/ && \
    mkdir /app/odtk7.1.0/bin/LicenseData && \
    mkdir -p /data

WORKDIR /app/

VOLUME [ "~/app/LicenseData" ]
#COPY License/*.lic /app/odtk7.1.0/bin/LicenseData

ENV LD_LIBRARY_PATH=/app/odtk7.1.0/bin \
    ODTK_INSTALL_DIR=/app/odtk7.1.0 \
    ODTK_USER_DIR=/app/usr

CMD ["./odtk7.1.0/bin/odtkruntime", "--port=9876", "--address=0.0.0.0"]