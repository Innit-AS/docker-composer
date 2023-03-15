FROM composer:1.10.1
LABEL maintainer "Innit AS"

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN IPE_GD_WITHOUTAVIF=1 install-php-extensions gd

RUN docker-php-ext-install exif && \
    echo "jenkins:x:989:985:jenkins:/tmp/home:/bin/bash" >> /etc/passwd && \
    mkdir -p /tmp/home/.ssh && \
    echo -e "Host *\n\tStrictHostKeyChecking no\n" > /tmp/home/.ssh/config && \
    chown -R jenkins:985 /tmp/home && \
    chmod 700 /tmp/home/.ssh
