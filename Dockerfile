# Pull base image
FROM phalconphp/php-apache:ubuntu-16.04
# TODO image for laravel laradock/laradock

ENV PROVISION_CONTEXT "development"

ADD application /app

# Deploy scripts/configurations
COPY docker/app/bin/*.sh /opt/docker/provision/entrypoint.d/

# TODO install laravel dev tools

RUN mkdir -p /vendor &&\
    composer --working-dir=/app install -o &&\
    chmod +x /opt/docker/provision/entrypoint.d/*.sh

CMD php artisan serve --host=0.0.0.0 --port=8000

EXPOSE 8000

WORKDIR /app