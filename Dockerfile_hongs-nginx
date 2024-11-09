FROM ghcr.io/joohanhong/centos:7.6.1810
MAINTAINER Hongs <master@hongsnet.net>

#TIME ZONE 설정
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#한글 지원
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN rm -rf /etc/yum.repos.d/*
COPY CONFIG/centos7.repo /etc/yum.repos.d/centos7.repo
COPY CONFIG/epel.repo /etc/yum.repos.d/epel.repo
COPY CONFIG/MariaDB.repo /etc/yum.repos.d/MariaDB.repo
COPY CONFIG/bashrc  /root/.bashrc

RUN yum -y install glibc glibc-common openssl-devel net-tools vi vim iproute wget bind-utils pwgen psmisc hostname openssh-server openssh-clients cronie crontabs supervisor nodejs npm redis telnet MariaDB MariaDB-server MariaDB-client MariaDB-backup curl tcpdump bind-utils

RUN ln -s /usr/bin/resolveip /usr/libexec/resolveip

#Install nginx repo
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

RUN yum install -y nginx-1.16.1-1.el7.ngx

COPY CONFIG/default.conf /etc/nginx/conf.d/default.conf
COPY CONFIG/supervisord.conf /etc/supervisor/supervisord.conf
COPY CONFIG/supervisord_monitoring.conf /etc/supervisor/conf.d/supervisord_monitoring.conf
COPY CONFIG/resolv.conf /etc/resolv.conf

#COPY CONFIG/letsencrypt /etc/letsencrypt

#RUN mkdir /home/mon-api
#RUN mkdir /home/mon-web

COPY CONFIG/index.html /usr/share/nginx/html/index.html
#COPY CONFIG/index_api.html /home/mon-api/index.html

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
