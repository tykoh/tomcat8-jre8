FROM tomcat:8-jre8

VOLUME  ["/usr/local/tomcat"]

# copy index file into ROOT
ADD index.html /usr/local/tomcat/webapps/ROOT/index.html

# remove example and doc and ROOT/index.jsp
RUN rm -rf /usr/local/tomcat/webapps/docs \
    && rm -rf /usr/local/tomcat/webapps/examples \
    && mv /usr/local/tomcat/webapps/ROOT/index.jsp /usr/local/tomcat/webapps/ROOT/index.orig


EXPOSE 8080 8443
