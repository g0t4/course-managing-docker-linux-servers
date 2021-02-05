#!/usr/bin/bash

# Create state so we can see what happens during next update!
# NOTE: I intended this script to be a reference, not executed all at once, but rather to talk through steps, show sites externally, look at state at end

# 1. run apache
sudo docker container run -d \
  -p 8800:80 \
  --name httpd \
  httpd
curl localhost:8800
# externally http://192.168.33.10:8800

# 2. run nginx (w/ restart)
sudo docker container run -d \
  -p 8900:80 \
  --name nginx \
  --restart always \
  nginx
curl localhost:8900
# externally http://192.168.33.10:8900

# 3. run jenkins (w/ restart) 
  # & config it just enough to show impact of update on state
sudo docker container run -d \
  -p 9000:8080 \
  -v jenkins_home:/var/jenkins_home \
  --name jenkins \
  --restart always \
  jenkins/jenkins:lts
# check logs for initial admin pass
# sudo docker container logs jenkins
echo
echo initial admin password
sudo docker exec -it jenkins \
  cat /var/jenkins_home/secrets/initialAdminPassword
# externally http://192.168.33.10:9000
  # provide initial admin pass
  # install suggested plugins
  # ignore baseurl
  # create admin user and pass
  # logout -> test login with admin user

# examine state (use tab completion in here)
sudo docker container ps 
# sudo docker container ps -a
sudo docker image ls
sudo docker volume ls 
# one last time (before update) show version
sudo docker info # shows counts
sudo docker system df # note how much local volume space is used
