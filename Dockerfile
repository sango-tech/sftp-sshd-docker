FROM alpine:latest
LABEL maintainer="Vivek Gite webmater@cyberciti.biz"
RUN apk add --update --no-cache openssh 

COPY configs/sshd_config /etc/ssh/sshd_config

RUN adduser -h /home/sango -s /bin/sh -D sango
RUN echo -n 'sango:sango' | chpasswd
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY entrypoint.sh /
