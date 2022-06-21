FROM centos:7

# Install SSHd and sudo
ENV PACKAGES="sudo openssh-server"
RUN yum -y update \
	&& yum install -y ${PACKAGES} \
	&& rm -rf /var/cache/yum/* \
	&& yum clean all; systemctl enable sshd.service \
	&& sed -i -e "s/^\#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config

# Create user and Configure passwordless sudo
ARG USER_NAME=user
ARG USER_PASSWD=password
RUN useradd -c "Default User" -d /home/${USER_NAME} -s /bin/bash ${USER_NAME} \
	&& echo "${USER_NAME}:${USER_PASSWD}" | chpasswd \
	&& usermod -aG wheel ${USER_NAME} \
	&& echo "${USER_NAME}        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

EXPOSE 22

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
