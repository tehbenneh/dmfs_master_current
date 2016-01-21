FROM ubuntu:latest

MAINTAINER benharker@mac.com

RUN apt-get update ; apt-get install -y wget ;

RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - ; 
RUN echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-master ;
RUN mv /etc/mfs/mfsexports.cfg.sample /etc/mfs/mfsexports.cfg ;

CMD ["/usr/sbin/mfsmaster", "-f", "start"]
