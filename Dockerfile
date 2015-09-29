FROM tomcat:8-jre8


# remove headless jre and use jre for non-headless
RUN apt-get update \
    && apt-get install -y openjdk-8-jre

# copy index file into ROOT
ADD index.html /usr/local/tomcat/webapps/ROOT/index.html

# copy log rotate config
ADD logrotate.conf /etc/logrotate.d/tomcat

# remove example and doc and ROOT/index.jsp
RUN rm -rf /usr/local/tomcat/webapps/docs \
    && rm -rf /usr/local/tomcat/webapps/examples \
    && mv /usr/local/tomcat/webapps/ROOT/index.jsp /usr/local/tomcat/webapps/ROOT/index.orig

VOLUME  ["/usr/local/tomcat"]

EXPOSE 8080 8443
