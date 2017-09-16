curl -OL https://github.com/google/fonts/archive/master.zip
aunpack master.zip
mv fonts-master/apache/roboto fonts-master/apache/opensans .
rm -rf master.zip fonts-master
