FROM centos:7.6.1810

LABEL maintainer="yorammi@yorammi.com"

USER root
WORKDIR /

RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce

COPY ez-docker-cleanup.sh /ez-docker-cleanup.sh
RUN chmod +x ez-docker-cleanup.sh

ENTRYPOINT /ez-docker-cleanup.sh 

