FROM centos:7.6.1810

LABEL maintainer="yorammi@tikalk.com"

USER root
WORKDIR /

RUN yum install -y yum-utils device-mapper-persistent-data lvm2
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce

COPY tci-docker-cleanup.sh /tci-docker-cleanup.sh
RUN chmod +x tci-docker-cleanup.sh

ENTRYPOINT /tci-docker-cleanup.sh 

