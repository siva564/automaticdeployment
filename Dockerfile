FROM siva564/sivareddy
VOLUME /tmp
ADD target/mvn-siva-reddy-1.3-SNAPSHOT.war hello-docker-app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /hello-docker-app.jar"]

