FROM centos/python-38-centos7:latest
LABEL Maintainer="jthompson@agi.com"

ARG ODTK_VERSION=7.4.0

USER root
RUN mkdir -p /tmp/odtk_install/
ADD ODTKEngine*.zip /tmp/odtk_install/

RUN yum list available | grep python
RUN yum update -y && \
    yum install -y unzip && \
    yum install -y python3 && \
    yum install -y python3-pip
RUN mkdir -p /app && mkdir -p /app/usr && mkdir -p /app/odtk && mkdir -p /data && \
    unzip /tmp/odtk_install/ODTKEngine*.zip -d /tmp/odtk_install/
RUN tar -xvf /tmp/odtk_install/odtk_binaries_v*.tgz --directory /app/odtk && \
    tar -xvf /tmp/odtk_install/odtk_data_v*.tgz --directory /app/odtk
RUN rm -r /tmp/odtk_install

COPY python_reqs/requirements.txt /app/odtk
RUN pip3 install -r /app/odtk/requirements.txt --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org
RUN ln -fs /usr/bin/python3.8 /usr/bin/python

COPY License/ansyslmd.ini /app/odtk/odtk${ODTK_VERSION}/shared_files/licensing

# Set the necessary Environment Variables
ENV LD_LIBRARY_PATH=/app/odtk/odtk${ODTK_VERSION}/bin \
    ODTK_INSTALL_DIR=/app/odtk/odtk${ODTK_VERSION} \
    ODTK_USER_DIR=/home/root \
    ODTK_VERSION=${ODTK_VERSION}

# Add python and pip to the path variable
ENV PATH="$~/.local/bin:${PATH}"

# Set the working directory
WORKDIR /app/

CMD ./odtk/odtk${ODTK_VERSION}/bin/odtkruntime --port=9876 --address=0.0.0.0