#!/usr/bin/env bash
updateRepos="true"
downloadApps="true"
unzipApps="true"
installOracleJDK8="true"

dotCMSDownloadURL="https://dotcms.com/physical_downloads/release_builds/dotcms_3.3.1.zip"

if  [ "$updateRepos" = "true" ]; then
	echo 'Updating repos'
	apt-get update
	echo 'Finished updating repos'
fi

#install Oracle JDK 8
if [ "$installOracleJDK8" = "true" ]; then	
	echo "Installing Java"
	add-apt-repository ppa:webupd8team/java
	apt-get update
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
	apt-get -y install oracle-java8-installer
fi

if [ "$downloadApps" = "true" ]; then
	echo "Downloading Apps..."
	mkdir /downloadedApps
	cd /downloadedApps
	wget -cN --progress=bar:force ${dotCMSDownloadURL}
fi

if [ "$unzipApps" = "true" ]; then
	echo "Unzipping apps"
	apt-get -y install unzip
	cd /downloadedApps
	unzip dotcms*.zip -d dotcms-3.3.1
fi


echo "starting dotCMS"
chmod a+x /downloadedApps/dotcms-3.3.1/bin/*.sh #not sure why these aren't executable already, but they aren't...
chmod a+x /downloadedApps/dotcms-3.3.1/dotserver/tomcat*/bin/*.sh #not sure why these aren't executable already, but they aren't...

#  Not necessary for most installations
#sed -i  's/port="8080"/port="8081"/' /downloadedApps/dotcms-3.2.4/dotserver/tomcat-8.0.18/conf/server.xml #change the tomcat port 
#sed -i  's/Host name="localhost"/Host name="myHost"/' /downloadedApps/dotcms-3.2.4/dotserver/tomcat-8.0.18/conf/server.xml #update hostname for this tomcat instance

sh /downloadedApps/dotcms-3.3.1/bin/startup.sh

	echo 'dotCMS should be accessible at http://localhost:8080/ (from your host)' 
	echo '===== Application Credentials ====='
	echo ''
	echo '=== Admin ==='
	echo 'username: admin@dotcms.com'
	echo 'password: admin'
	echo ''
	echo '=== Limited User ==='
	echo 'username: joe@dotcms.com'
	echo 'password: joe'
	echo '===== Application Credentials ====='
	echo 'Script finished.'
