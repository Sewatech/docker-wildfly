FROM sewatech/java7:busybox

ENV WILDFLY_VERSION 8.1.0.Final
ENV JBOSS_HOME /wildfly-$WILDFLY_VERSION

RUN (curl -s http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz | tar -zxf -) && \
    rm -r $JBOSS_HOME/welcome-content && \
    $JBOSS_HOME/bin/add-user.sh --silent alexis hassler

COPY html $JBOSS_HOME/welcome-content
COPY standalone-ha.xml $JBOSS_HOME/standalone/configuration/standalone-ha.xml
COPY info.war $JBOSS_HOME/standalone/deployments/

EXPOSE 8080 8009 9990

ENTRYPOINT ["/wildfly-8.1.0.Final/bin/standalone.sh"]
CMD ["-c", "standalone-ha.xml"]

