FROM sewatech/java7
MAINTAINER Alexis Hassler <alexis.hassler@sewatech.fr>

ENV VERSION 8.2.0.Final

RUN (curl -skL http://download.jboss.org/wildfly/$VERSION/wildfly-$VERSION.tar.gz  | tar xfz -) && \
    rm -r /wildfly-$VERSION/welcome-content && \
    /wildfly-$VERSION/bin/add-user.sh --silent alexis hassler

COPY html /wildfly-$VERSION/welcome-content
COPY standalone-ha.xml /wildfly-$VERSION/standalone/configuration/standalone-ha.xml

EXPOSE 8080 8009 9990

ENTRYPOINT ["/wildfly-8.2.0.Final/bin/standalone.sh"]
CMD ["-c", "standalone-ha.xml"]
