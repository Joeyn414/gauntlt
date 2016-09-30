#this is the dockerfile for centos with gauntlt installed as
#of 9/30/16
FROM centos
MAINTAINER Joe Niquette <joeyn414@gmail.com.
RUN yum -y update; yum clean all
RUN yum -y install git ruby which ruby-doc ruby-devel autoconf automake make g++ gcc openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel curl-devel nmap; yum clean all
RUN gem install bundler --no-ri gauntlt --no-ri arachni --no-ri rake --no-ri rake:11.0.1 --no-ri background_process --no-ri tcpsocket-wait --no-ri service_manager --no-ri 
RUN git clone https://github.com/Joeyn414/gauntlt.git
