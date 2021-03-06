FROM composer
LABEL maintainer "Innit AS"

RUN docker-php-ext-install exif && \
    echo "jenkins:x:113:115:jenkins:/tmp/home:/bin/bash" >> /etc/passwd && \
    mkdir -p /tmp/home/.ssh && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n" > /tmp/home/.ssh/config && \
    chown -R jenkins:115 /tmp/home && \
    chmod 700 /tmp/home/.ssh
