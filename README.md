# tomcat8-jre8
Modified from official tomcat8 docker image to facilitate easy deployment of war
- docs and examples have been removed from the official tomcat build for added security
- index in ROOT folder has been replaced from the official tomcat build for added security
- /usr/local/tomcat directory can be mounted using --volumes-from <image name>

## to deploy a war
Run image.
- Assuming that present working directory contains the war file "myapp.war"
```sh
docker run -d -p 8080:8080 --name=tomcat8 tykoh/tomcat8-jre8
docker run --rm --volumes-from tomcat8 -v $(pwd):/host ubuntu cp /host/myapp.war /usr/local/tomcat/webapps
```
