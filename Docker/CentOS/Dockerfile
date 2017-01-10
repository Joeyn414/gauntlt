#this is the dockerfile for centos with gauntlt installed as
#of 01/10/17
FROM centos
MAINTAINER Joe Niquette <joeyn414@gmail.com>
RUN yum -y update; yum clean all
RUN yum -y install git ruby which ruby-doc ruby-devel autoconf automake make g++ gcc openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel curl-devel nmap openssh-clients wget; yum clean all
RUN gem install bundler --no-ri --no-rdoc gauntlt rake --no-ri --no-rdoc rake:11.0.1 --no-ri --no-rdoc background_process --no-ri --no-rdoc tcpsocket-wait --no-ri --no-rdoc service_manager --no-ri --no-rdoc
RUN git clone https://github.com/Joeyn414/gauntlt.git && mv /gauntlt/Packages/arachni/arachni-1.4-0.5.10 /arachni-1.4-0.5.10
RUN cp /gauntlt/lib/gauntlt/attack_aliases/arachni.json /usr/local/share/gems/gems/gauntlt-1.0.12/lib/gauntlt/attack_aliases/arachni.json
RUN echo 'pathmunge /arachni-1.4-0.5.10/bin' > /etc/profile.d/arachni.sh && chmod +x /etc/profile.d/arachni.sh
RUN chmod -R a+w /arachni-1.4-0.5.10/*
