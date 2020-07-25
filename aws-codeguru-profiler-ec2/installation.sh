#!/bin/bash

# Installing corretto8
amazon-linux-extras enable corretto8
yum clean metadata
yum install -y java-1.8.0-amazon-corretto

java -version
alternatives --config java

# Installing Tomcat8.5 and a simple JSP application
amazon-linux-extras enable tomcat8.5
yum clean metadata
yum install -y tomcat

bash -c 'echo JAVA_OPTS=\"-Djava.security.egd=file:/dev/urandom\" >> /etc/tomcat/tomcat.conf' 

# First,  create default web application directory:
install -d -o root -g tomcat /var/lib/tomcat/webapps/ROOT 

# Then, add the small JSP application:
bash -c 'cat <<EOF > /var/lib/tomcat/webapps/ROOT/index.jsp
<html>
<head>
<title>Corretto8 - Tomcat8.5 - Hello world</title>
</head>
<body>
  <table>
    <tr>
      <td>Operating System</td>
      <td><%= System.getProperty("os.name") %></td>
    </tr>
    <tr>
      <td>CPU Architecture</td>
      <td><%= System.getProperty("os.arch") %></td>
    </tr>
    <tr>
      <td>Java Vendor</td>
      <td><%= System.getProperty("java.vendor") %></td>
    </tr>
    <tr>
      <td>Java URL</td>
      <td><%= System.getProperty("java.vendor.url") %></td>
    </tr>
    <tr>
      <td>Java Version</td>
      <td><%= System.getProperty("java.version") %></td>
    </tr>
    <tr>
      <td>JVM Version</td>
      <td><%= System.getProperty("java.vm.version") %></td>
    </tr>
    <tr>
      <td>Tomcat Version</td>
      <td><%= application.getServerInfo() %></td>
    </tr>
</table>

</body>
</html>
EOF
'

# enable AWS CodeGuru Profiler for Tomcat. change to your region us-west-2
export AWS_CODEGURU_PROFILER_GROUP_NAME=MyProfilingGroup
export AWS_CODEGURU_TARGET_REGION=us-west-2  

wget https://d1osg35nybn3tt.cloudfront.net/com/amazonaws/codeguru-profiler-java-agent-standalone/1.0.0/codeguru-profiler-java-agent-standalone-1.0.0.jar
JAVA_OPTS="$JAVA_OPTS -javaagent:./codeguru-profiler-java-agent-standalone-1.0.0.jar"
#java -javaagent:/path/to/codeguru-profiler-java-agent-standalone-1.0.0.jar -jar MyApplication.jar


# Finally, start the Tomcat service:
systemctl start tomcat


