FROM debian:9.5

ARG SSH_MASTER_USER
ARG SSH_MASTER_PASS

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    nano \
    sudo \
    openssh-server

COPY ssh_config /etc/ssh/ssh_config
COPY sshd_config /etc/ssh/sshd_config

COPY user.sh /usr/local/bin/user.sh
RUN chmod +x /usr/local/bin/user.sh
RUN /usr/local/bin/user.sh
RUN rm /usr/local/bin/user.sh

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir -p /uploads/sango/upload
RUN echo "sango:sango" | sudo chpasswd
RUN chown sango:sftp -R /uploads/sango/upload

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD tail -f /dev/null
