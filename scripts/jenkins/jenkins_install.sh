apt-get update && apt-get install -y --no-install-recommends openjdk-11-jdk wget git  ca-certificates lsb-release gnupg curl zip && rm -rf /var/lib/apt/lists/*

wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.10.0/jenkins-plugin-manager-2.10.0.jar

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ |  tee /etc/apt/sources.list.d/jenkins.list > /dev/null

apt-get update
apt-get install -y jenkins
#sleep 100
java -jar jenkins-plugin-manager-2.10.0.jar --war  /usr/share/java/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt  --plugin-download-directory /var/jenkins_home/plugins --verbose

java  -Djenkins.install.runSetupWizard=false  -jar /usr/share/java/jenkins.war  &
sleep 100



wget http://localhost:8080/jnlpJars/jenkins-cli.jar
sleep 30

java -jar jenkins-cli.jar -s http://localhost:8080 create-job Cloud_Build_App_Deployment < /usr/share/jenkins/ref/Cloud_Build_App_Deployment_config.xml
sleep "infinity"
