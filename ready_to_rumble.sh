# This little script tries to mimic the .travis.yml setup so that when we are
# doing local dev, we can run tests and make sure we are passing CI.

NMAP=`which nmap`
ARACHNI=`which arachni`
#SSLYZE_PATH=`which sslyze`
#SQLMAP_PATH=`which sqlmap`

ERRORS=0

if [ -z $ARACHNI ]
  then
    MESSAGE="It looks like you dont have arachni-web-scanner installed.  You should be able to do 'gem install arachni' to install it.  You might need to install libcurl first, on ubuntu you can run 'sudo apt-get install libcurl4-openssl-dev && gem install arachni' For more info on arachni, go to arachni-scanner.com"
    ERRORS=$ERRORS+1
fi

if [ -z $NMAP ]
  then
    MESSAGE="nmap is not installed in your path, try installing it (brew install nmap OR apt-get install nmap) and adding it to your path"
    ERRORS=$ERRORS+1
fi

if [[ $ERRORS > 0 ]]
  then
  echo $MESSAGE
  ERRORS=$ERRORS-1
  echo "$ERRORS more things to fix... keep running ./ready_to_rumble.sh until you ARE."
else
  echo "You ARE ready to rumble!"
fi
