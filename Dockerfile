# Pull base image
FROM phalconphp/php-apache:ubuntu-16.04
# TODO use official image for laravel laradock/laradock instead

ENV PROVISION_CONTEXT "development"

ADD application /app

# Deploy scripts/configurations
COPY docker/app/bin/*.sh /opt/docker/provision/entrypoint.d/

# TODO install laravel dev tools
WORKDIR /app

RUN chmod +x /opt/docker/provision/entrypoint.d/*.sh

EXPOSE 80

