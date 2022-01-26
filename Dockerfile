FROM php:8.0-alpine

ENV PHP_MEMORY_LIMIT=256M

ARG PHPCS_VERSION=3.6.2
ARG PHPMD_VERSION=2.10.2

RUN wget -P /usr/local/bin -q https://github.com/squizlabs/PHP_CodeSniffer/releases/download/${PHPCS_VERSION}/phpcs.phar \
  && wget -P /usr/local/bin -q https://phpmd.org/static/${PHPMD_VERSION}/phpmd.phar \
  && chmod +x /usr/local/bin/phpcs.phar \
  && chmod +x /usr/local/bin/phpmd.phar

RUN apk --no-cache add git \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
WORKDIR /tmp
