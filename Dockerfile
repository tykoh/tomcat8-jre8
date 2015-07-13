FROM tomcat:8-jre8

# copy index file into ROOT
ADD index.html /usr/local/tomcat/webapps/ROOT/index.html

# remove example and doc and ROOT/index.jsp
RUN rm -rf /usr/local/tomcat/webapps/docs \
    && rm -rf /usr/local/tomcat/webapps/examples \
    && mv /usr/local/tomcat/webapps/ROOT/index.jsp /usr/local/tomcat/webapps/ROOT/index.orig

VOLUME  ["/usr/local/tomcat"]

EXPOSE 8080 8443
