student@905-11:~$ su 
Password: 
root@905-11:/home/student# docker rm fuhao7i/centos
Error: No such container: fuhao7i/centos
root@905-11:/home/student# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
00ea6b006360        fuhao7i/centos:ly   "/bin/bash"         2 hours ago         Up 2 hours                              modest_kilby
root@905-11:/home/student# docker rm fuhao7i/centos:ly
Error: No such container: fuhao7i/centos:ly
root@905-11:/home/student# la
.bash_history  Documents         .ICEauthority  .sudo_as_admin_successful
.bash_logout   Downloads         .local         Templates
.bashrc        examples.desktop  .mozilla       Videos
.cache         fuhao             Music          .Xauthority
.config        .gconf            Pictures       .xsession-errors
Desktop        .gnupg            .profile       .xsession-errors.old
.dmrc          .gphoto           Public
root@905-11:/home/student# ls
Desktop    Downloads         fuhao  Pictures  Templates
Documents  examples.desktop  Music  Public    Videos
root@905-11:/home/student# cd fuhao
root@905-11:/home/student/fuhao# ls
dockerrun.txt  install-docker.sh
root@905-11:/home/student/fuhao# cat > dockerfile
FROM centos
RUN mkdir -p /home/workspace
RUN touch /home/workspace/test.txt
RUN echo xyz > /home/workspace/test.txt
root@905-11:/home/student/fuhao# cd ..
root@905-11:/home/student# docker dockerfile
docker: 'dockerfile' is not a docker command.
See 'docker --help'
root@905-11:/home/student# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
centos              ly                  15686da9259e        4 hours ago         202MB
lowyard/centos      ly                  15686da9259e        4 hours ago         202MB
fuhao7i/centos      ly                  15686da9259e        4 hours ago         202MB
centos              latest              9f38484d220f        3 months ago        202MB
wangyuyanr/centos   latest              9f38484d220f        3 months ago        202MB
root@905-11:/home/student# 
root@905-11:/home/student# docker build -t centos:file
"docker build" requires exactly 1 argument.
See 'docker build --help'.

Usage:  docker build [OPTIONS] PATH | URL | - [flags]

Build an image from a Dockerfile
root@905-11:/home/student# docker build -t fuhao7i/centos:file
"docker build" requires exactly 1 argument.
See 'docker build --help'.

Usage:  docker build [OPTIONS] PATH | URL | - [flags]

Build an image from a Dockerfile
root@905-11:/home/student# docker build -t fuhao7i/centos:file  .
unable to prepare context: unable to evaluate symlinks in Dockerfile path: lstat /home/student/Dockerfile: no such file or directory
root@905-11:/home/student# ls
Desktop  Documents  Downloads  examples.desktop  fuhao  Music  Pictures  Public  Templates  Videos
root@905-11:/home/student# cat > Dockerfile
FROM centos
RUN mkdir -p /home/workspace
RUN touch /home/workspace/test.txt
RUN echo xyz > /home/workspace/test.txt
root@905-11:/home/student# docker build -t fuhao7i/centos:file  .
ERRO[0001] Can't add file /home/student/.gnupg/S.gpg-agent to tar: archive/tar: sockets not supported 
Sending build context to Docker daemon  65.64MB
Step 1/4 : FROM centos
 ---> 9f38484d220f
Step 2/4 : RUN mkdir -p /home/workspace
 ---> Running in d581be9d94b3
Removing intermediate container d581be9d94b3
 ---> 3e5b8c60e001
Step 3/4 : RUN touch /home/workspace/test.txt
 ---> Running in 906e6a7fb341
Removing intermediate container 906e6a7fb341
 ---> 0789a57f7d2e
Step 4/4 : RUN echo xyz > /home/workspace/test.txt
 ---> Running in 7213ee438967
Removing intermediate container 7213ee438967
 ---> 4bb0ac59bf2b
Successfully built 4bb0ac59bf2b
Successfully tagged fuhao7i/centos:file
root@905-11:/home/student# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
fuhao7i/centos      file                4bb0ac59bf2b        20 seconds ago      202MB
fuhao7i/centos      ly                  15686da9259e        4 hours ago         202MB
centos              ly                  15686da9259e        4 hours ago         202MB
lowyard/centos      ly                  15686da9259e        4 hours ago         202MB
centos              latest              9f38484d220f        3 months ago        202MB
wangyuyanr/centos   latest              9f38484d220f        3 months ago        202MB
root@905-11:/home/student# docker run -it fuhao7i/centos:file
[root@0c1d64c94b9d /]# ls
anaconda-post.log  bin  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@0c1d64c94b9d /]# cd home 
[root@0c1d64c94b9d home]# l
bash: l: command not found
[root@0c1d64c94b9d home]# sls
bash: sls: command not found
[root@0c1d64c94b9d home]# ls
workspace
[root@0c1d64c94b9d home]# cd workspace
[root@0c1d64c94b9d workspace]# ls
test.txt
[root@0c1d64c94b9d workspace]# cat test.txt
xyz
[root@0c1d64c94b9d workspace]# 
