FROM ubuntu
LABEL maintainer="iceman"

RUN echo "now building..."
# install software
RUN apt-get update \
 && apt-get install -y apache2 \
 && apt-get install -y openssh-server \
 && apt-get install -y vim \
 && apt-get install -y iproute2 iputils-ping

# ssh settings
RUN mkdir /var/run/sshd \
 && echo "root:root" | chpasswd \
 && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
 && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
 && echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config \
 && sed -i 's/#Port 22/Port 20022/' /etc/ssh/sshd_config

# copy CMD script
COPY ./cmd.sh /cmd.sh
RUN chmod 755 /cmd.sh

# copy sharing file
COPY ./index.html /var/www/html/index.html
COPY ./junitbook_cheatsheet.pdf /var/www/html/test.pdf

EXPOSE 20022 81
CMD ["/cmd.sh"] # docker container作成時に実行されるコマンド
