#!/bin/bash
#
#@author: Joe Niquette
#@version: 0.1 9/23/16
#@Purpose: To be run inside a centos 7 docker container to scan your web applications for security vulnerabilities
#Usage: This will install the gauntlt gem, arachni gem, and nmap
# Arachni and nmap attacks with gauntlt can be used, the other tools have not and we do not plan to incorporate them (sslyze, garmr, heartbleed, and sqlmap)
starttime=$(date +%s.%N)
echo script starting to install gauntlt to your centos 7 image
mkdir -p /opt/security/

if [ -z $START_FOLDER ]; then
	START_FOLDER='/opt/security/'
	cd /opt/security/
	echo -e "INFO: setting \$START_FOLDER to '/opt/security/'";
fi
yum -y update; yum clean all
yum -y install git ruby which ruby-doc ruby-devel autoconf automake make g++ gcc openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel curl-devel nmap; yum clean all
gem install bundler gauntlt arachni rake
git clone https://github.com/Joeyn414/gauntlt.git

# add this text to the arachi.json file in /usr/lib/ruby/gems/2.2.0/gems/gauntlt-1.0.12/lib/gauntlt/attack_aliases/arachni.json

awk '{ if (NR ==29) print "},
    "arachni-allmediumandhigher" : { "command" : "arachni --checks=*,-interesting_responses,-webdav,-localstart_asp,-directory_listing,-private_ip,-form_upload,-cvs_svn_users,-captcha,-http_only_cookies,-html_objects,-emails,-cookie_set_for_parent_domain,-common_files,-allowed_methods <url>",
      "description" : "This scan performs all checks except the checks that are low or informational only. We did leave in insecure_cookies even though this originally was an informational risk.",
      "requires" : [ "<url>" ]"; else print $0}' /usr/local/share/gems/gems/gauntlt-1.0.12/lib/gauntlt/attack_aliases/arachni.json > /usr/local/share/gems/gems/gauntlt-1.0.12/lib/gauntlt/attack_aliases/arachni.json
endtime=$(date +%s.%N)
runtime=$(python -c "print(${endtime} - ${starttime})")
echo "Runtime was $runtime"
