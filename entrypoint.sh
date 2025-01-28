#!/bin/sh

echo "Preparing environment..."
echo "MHOST=${MYSQL_CONTAINER_NAME}" >> /etc/environment
echo "MPASS=${MYSQL_ROOT_PASSWORD}" >> /etc/environment

echo "Starting crond..."
exec crond -f -d 8