FROM sewatech/java7
MAINTAINER Alexis Hassler <alexis.hassler@sewatech.fr>

ENV VERSION 8.2.0.Final

RUN apt-get update && apt-get install -y curl && \
    curl -O http://download.jboss.org/wildfly/$VERSION/wildfly-$VERSION.tar.gz && \
    tar -zxvf wildfly-$VERSION.tar.gz -C /opt/ && \
    rm /wildfly-$VERSION.tar.gz && rm -r /opt/wildfly-$VERSION/welcome-content && \
    apt-get purge -y curl && apt-get autoremove -y && apt-get clean &&\
    /opt/wildfly-$VERSION/bin/add-user.sh --silent alexis hassler

COPY html /opt/wildfly-$VERSION/welcome-content
COPY standalone-ha.xml /opt/wildfly-$VERSION/standalone/configuration/standalone-ha.xml

EXPOSE 8080 8009 9990

ENTRYPOINT ["/opt/wildfly-$VERSION/bin/standalone.sh"]
CMD ["-c", "standalone-ha.xml"]
