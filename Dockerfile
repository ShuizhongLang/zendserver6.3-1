#
# Zend Server 6.3
#

FROM centos:6.8
MAINTAINER Shuizhong Lang

ADD run.sh /run.sh
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD ZendServer-RepositoryInstaller-linux /ZendServer-RepositoryInstaller-linux

RUN chmod 775 /*.sh
RUN chmod 775 /ZendServer-RepositoryInstaller-linux/*.sh
RUN yum install epel-release -y && yum install -y supervisor
RUN /ZendServer-RepositoryInstaller-linux/install_zs.sh 5.3 --automatic
RUN /usr/local/zend/bin/zendctl.sh stop

ADD zend.conf /etc/supervisor/conf.d/zend.conf

EXPOSE 80
EXPOSE 443
EXPOSE 10060
EXPOSE 10061
EXPOSE 10062
EXPOSE 10081
EXPOSE 10082

CMD ["/run.sh"]
