FROM sewatech/java7
MAINTAINER Alexis Hassler <alexis.hassler@sewatech.fr>

ENV WILDFLY_VERSION 8.2.0.Final

RUN (curl -skL http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar xfz -) && \
    rm -r /wildfly-$WILDFLY_VERSION/welcome-content && \
    /wildfly-$WILDFLY_VERSION/bin/add-user.sh --silent alexis hassler

COPY html /wildfly-$WILDFLY_VERSION/welcome-content
COPY standalone-ha.xml /wildfly-$WILDFLY_VERSION/standalone/configuration/standalone-ha.xml

EXPOSE 8080 8009 9990

ENTRYPOINT ["/wildfly-8.2.0.Final/bin/standalone.sh"]
CMD ["-c", "standalone-ha.xml"]
