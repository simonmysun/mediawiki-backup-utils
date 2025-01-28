FROM alpine:latest

RUN apk update && \
  apk upgrade && \
  apk add --no-cache mariadb-client && \
  chmod -R a+x /etc/periodic/*

COPY ./periodic/daily/backup-daily /etc/periodic/daily/backup-daily
COPY ./periodic/weekly/backup-weekly /etc/periodic/weekly/backup-weekly
COPY ./periodic/monthly/backup-monthly /etc/periodic/monthly/backup-monthly
COPY ./entrypoint.sh /entrypoint.sh

CMD ["sh", "/entrypoint.sh"]