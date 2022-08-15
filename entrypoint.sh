mkdir -p /opt/st/data/

cat >/opt/st/data/config.json <<EOF
{
  "address": "0.0.0.0",
  "port": 5244,
  "database": {
    "type": "$DB_TYPE",
    "user": "$MYSQLUSER",
    "password": "$MYSQLPASSWORD",
    "host": "$MYSQLHOST",
    "port": $MYSQLPORT,
    "name": "$MYSQLDATABASE",
    "table_prefix": "x_",
    "db_file": "/opt/st/data/data.db",
    "ssl_mode": "false"
  },
  "scheme": {
    "https": false,
    "cert_file": "",
    "key_file": ""
  },
  "cache": {
    "expiration": $CACHE_EXPIRATION,
    "cleanup_interval": $CACHE_CLEANUP_INTERVAL
  },
  "temp_dir": "data/temp"
}
EOF

cd /opt/st
./st -conf data/config.json
