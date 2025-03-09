#!/bin/bash
set -e

# Create SSL certificate and key
openssl req -new -x509 -days 365 -nodes \
  -out server.crt \
  -keyout server.key \
  -subj "/C=XX/ST=XX/L=XX/O=docker postgres/CN=postgres"

# Set permissions
chmod 600 server.key
chmod 600 server.crt

# Move the certificate and key to PostgreSQL data directory
mv server.crt "${PGDATA}/server.crt"
mv server.key "${PGDATA}/server.key"

# Update PostgreSQL configuration to use SSL
cat >> "${PGDATA}/postgresql.conf" << EOF
ssl = on
ssl_cert_file = 'server.crt'
ssl_key_file = 'server.key'
EOF

# Configure authentication
cat > "${PGDATA}/pg_hba.conf" << EOF
# TYPE  DATABASE        USER            ADDRESS                 METHOD
local   all            all                                     scram-sha-256
hostssl all            all             0.0.0.0/0              scram-sha-256
EOF
