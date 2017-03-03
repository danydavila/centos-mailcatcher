FROM centos:7

# File Author / Maintainer
MAINTAINER "Dany Davila" <danydavila@gmail.com>

RUN yum -y update && \
    yum -y install ruby ruby-devel sqlite sqlite-devel make gcc gcc-c++ && \
	ln -snf /usr/share/zoneinfo/Etc/UTC /etc/localtime && echo "Etc/UTC" > /etc/timezone && \
    gem install mailcatcher --no-ri --no-rdoc

# clean up
RUN yum -y erase openssh-server >/dev/null 2>&1; \
    yum -y clean all && \
    rm -rf /tmp/* && \
    rm -f /var/log/wtmp /var/log/btmp && \
    (find /var/log -type f | while read f; do echo -ne '' > $f; done;)

EXPOSE 1080 1025

ENTRYPOINT ["mailcatcher", "--smtp-ip=0.0.0.0", "--http-ip=0.0.0.0", "--foreground"]