FROM debian:jessie

RUN apt-get update && apt-get install -y openjdk-7-jdk

ADD http://download.jboss.org/wildfly/8.1.0.Final/wildfly-8.1.0.Final.tar.gz /
#COPY wildfly-8.1.0.Final.tar.gz /
RUN tar -zxvf wildfly-8.1.0.Final.tar.gz -C /opt/
RUN rm /wildfly-8.1.0.Final.tar.gz
RUN rm -r /opt/wildfly-8.1.0.Final/welcome-content
RUN /opt/wildfly-8.1.0.Final/bin/add-user.sh --silent alexis hassler
COPY html /opt/wildfly-8.1.0.Final/welcome-content
COPY standalone-ha.xml /opt/wildfly-8.1.0.Final/standalone/configuration/standalone-ha.xml

EXPOSE 8080 8009 9990

ENTRYPOINT ["/opt/wildfly-8.1.0.Final/bin/standalone.sh"]
CMD ["-c", "standalone-ha.xml"]
