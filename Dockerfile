# Pull base image
FROM phalconphp/php-apache:ubuntu-16.04
# TODO use proper image for laravel

ENV PROVISION_CONTEXT "development"

ADD application /app

# Deploy scripts/configurations
COPY docker/app/bin/*.sh /opt/docker/provision/entrypoint.d/

# TODO install laravel dev tools

RUN mkdir -p /vendor &&\
    composer update
    chmod +x /opt/docker/provision/entrypoint.d/*.sh

WORKDIR /app