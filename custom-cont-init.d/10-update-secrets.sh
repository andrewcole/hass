#!/usr/bin/with-contenv bash
# Updates secret.yaml
set -e

secrets="/config/secrets.yaml"
touch "${secrets}"

echo Configuring recorder
yq d -i "${secrets}" recorder
yq w -i "${secrets}" --prettyPrint recorder_db_url -- mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@${MYSQL_HOST}:${MYSQL_PORT}/${MYSQL_DATABASE}?charset=utf8mb4

echo Configuring InfluxDB
yq w -i "${secrets}" --prettyPrint influxdb_host     -- ${INFLUXDB_HOST}
yq w -i "${secrets}" --prettyPrint influxdb_port     -- ${INFLUXDB_PORT}
yq w -i "${secrets}" --prettyPrint influxdb_database -- ${INFLUXDB_DATABASE}
