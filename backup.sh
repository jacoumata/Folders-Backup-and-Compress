#!/usr/local/bin/bash
clear
echo "Website Backup Started."
echo "Please wait..."
wsBackup="/WWW/WWW-BU/websites"
date=$( date +%Y-%m-%d-%I-%M-%S )
cd $wsBackup && mkdir $date
MYDIR="/WWW/com"
DIRS=`ls -l $MYDIR | egrep '^d' | awk '{print $9}'`
for DIR in $DIRS
do
tar czPf ${date}/com.${DIR}.tar.gz /WWW/com/${DIR} &&
echo "${DIR}.com backed up successfully"
done
tar czPf ${date}/info.rocotic.tar.gz /WWW/info/website &&
echo "website.info backed up successfully" &&
tar czPf ${date}/cr.tico.www.tar.gz /WWW/cr/anotherws &&
echo "anotherws.cr backed up successfully" &&
echo "Finished."
