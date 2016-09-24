#this is the dockerfile for centos with gauntlt installed as
#of 9/23/16
FROM centos
MAINTAINER Joe Niquette <joeyn414@gmail.com.
RUN yum -y update; yum clean all
RUN yum -y install git ruby which ruby-doc ruby-devel autoconf automake make g++ gcc openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel curl-devel nmap; yum clean all
RUN gem install bundler gauntlt arachni rake --no-ri
RUN bundle install
RUN echo if you find arachni isnt working RUN bundle install, it should install the dependencies that were missed.
RUN git clone https://github.com/Joeyn414/gauntlt.git
